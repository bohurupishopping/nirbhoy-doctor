"use server";

import OpenAI from "openai";
import { createClient } from "@/lib/supabase/server";

export async function generatePatientSummary(patientId: string, consultationId: string) {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        return { error: "Unauthorized" };
    }

    try {
        // 1. Fetch Patient 360 Data using the existing rich RPC
        const { data: p360Data, error: p360Error } = await supabase
            .rpc("get_patient_360_summary", { _patient_id: patientId, _doctor_id: user.id });

        if (p360Error) throw p360Error;

        // 2. Initialize OpenAI
        const openai = new OpenAI({
            apiKey: process.env.OPENAI_API_KEY,
        });

        // 3. Construct Prompt
        const systemPrompt = `
You are an expert Clinical AI Medical Assistant aimed at senior doctors.
Your task is to analyze the provided Patient 360 JSON data and generate a "Clinical Snapshot & Executive Summary" in Markdown format.

**Goal:** Serve as a "Diagnostic Co-pilot". Don't just summarize; synthesize the data to help the doctor understand the *evolution* of the patient's health. Connect the dots between past visits, trends, and current reports.

**Data Available to You:**
- \`patient\`: Demographics, flags
- \`medical_profile\`: Chronic conditions, allergies
- \`documents\`: List of uploaded reports. *Crucial:* Use the \`ai_summary\` and \`key_findings\` inside this to spot abnormal labs or imaging results.
- \`visit_history\`: Past consultations. Use this to see what was tried before (meds/plans) and if it worked.
- \`vitals_trend\`: Historical vitals.

**Output Structure & Style Guidelines:**

1.  **Clinical Snapshot & Executive Summary**
    *   **Patient:** Name (Age/Gender) | UHID: ...[last 4 digits]
    *   **Status:** [CRITICAL / STABLE / WHEELCHAIR]
    *   **Summary:** A high-density narrative (3-5 sentences). Synthesize the patient's story.
        *   *Start:* "Patient with [Chronic Conditions] presents with..."
        *   *Context:* Mention relevant history (e.g., "History of recurrent UTI", "Post-op Day 5").
        *   *Findings:* unexpected trends or new critical lab values from \`documents\`.
        *   *Evolution:* "Vitals show worsening BP control compared to last visit."

2.  **🔍 Detailed Clinical Analysis**
    *   **⚠️ Safety & Alerts:** Allergies, Critical Flags.
    *   **📄 Relevant Reports:** Extract the most significant findings from \`documents\`. Don't list everything—only what matters for *today's* diagnosis (e.g., "Today's CBC shows Hb 8.2 (Low)").
    *   **💊 Current Regimen:** Active medications grouped by condition.
    *   **📉 Vitals & Trends:** Mention significant changes (e.g., "Weight +2kg since last month", "BP elevated vs baseline").
    *   **🗓️ Course of Care:** Quickly summarize the trajectory. (e.g., "Initially treated for X on [Date], now presenting with Y.")

**Tone:** Professional, precise, analytical. No fluff.
**Constraint:** Max 400 words. purely clinical.
`;

        const userPrompt = `
Here is the Patient 360 Data JSON:
\`\`\`json
${JSON.stringify(p360Data, null, 2)}
\`\`\`

Generate the Clinical Snapshot now.
`;

        // 4. Call OpenAI
        const completion = await openai.chat.completions.create({
            messages: [
                { role: "system", content: systemPrompt },
                { role: "user", content: userPrompt },
            ],
            model: "gpt-4.1-nano", // Use gpt-4o or gpt-3.5-turbo as per availability, gpt-4o is better for reasoning
        });



        const summaryMarkdown = completion.choices[0].message.content;

        return { success: true, data: summaryMarkdown };

    } catch (e: any) {
        console.error("AI Summary Error:", e);
        return { error: e.message || "Failed to generate summary" };
    }
}


// This function is NOT a server action - it's a regular export for internal use by API routes
export async function runDocumentExtraction(documentId: string, fileUrl: string) {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        return { error: "Unauthorized" };
    }

    const isPdf = fileUrl.toLowerCase().includes(".pdf");

    try {
        const openai = new OpenAI({
            apiKey: process.env.OPENAI_API_KEY,
        });

        const SYSTEM_PROMPT = `
**Role:**
You are a **Medical Data Extraction Engine**. Your job is to convert unstructured OCR text or Images from medical documents (Lab Reports, Prescriptions, Discharge Summaries, Radiology Reports) into a strict, database-ready JSON format.

**Input:**
Medical document (Image URL or PDF File).

**Output Requirement:**
Return **ONLY** a JSON object. Do not include markdown formatting (\`\`\`json), preamble, or explanations.

**JSON Structure & Rules:**

1.  **\`ai_summary\` (String, max 2 sentences):**
    *   Write a concise clinical summary of the document.
    *   Format: "[Document Type] from [Date/Doctor] showing [Key Finding/Diagnosis]."
    *   Example: "Lipid Profile from Dr. Smith showing elevated Triglycerides and Cholesterol."

2.  **\`semantic_tags\` (Array of Strings):**
    *   Generate 3-5 keywords for searching/filtering.
    *   **Rule 1 (Type):** Must include one of: ["Lab Report", "Prescription", "Radiology", "Discharge Summary", "Insurance", "Other"].
    *   **Rule 2 (Specialty):** e.g., "Cardiology", "Dermatology", "General".
    *   **Rule 3 (Status):** If ANY lab value is out of range or flagged 'High'/'Low', add the tag "Abnormal".

3.  **\`clinical_data\` (Object - Key/Value Pairs):**
    *   Extract measurable clinical metrics for trending/graphing.
    *   **Keys:** Convert the metric name to **snake_case** (e.g., "Hemoglobin A1c" -> \`hba1c\`, "Total Cholesterol" -> \`cholesterol_total\`, "Blood Pressure" -> \`bp\`).
    *   **Values:** String containing the Number + Unit. (e.g., "120 mg/dL", "140/90 mmHg").
    *   *Note:* If the document is a **Prescription**, use the drug name as the key and dosage/frequency as the value (e.g., \`{"dolo_650": "1-0-1 for 3 days"}\`).

4.  **\`full_text\` (String):**
    *   Transcribe as much of the raw text from the document as possible for search purposes.

**Constraints:**
*   **Accuracy:** Do not hallucinate. If a value is unclear or missing, do not invent it.
*   **Cleanliness:** Ignore hospital disclaimers, footer text, and page numbers.
*   **Dates:** If a sample date is found, try to standardize it in the summary, but do not extract it as a clinical value.
`;

        let content = "";

        if (isPdf) {
            // --- PDF HANDLING (Assistants API) ---

            // 1. Download the file
            const fileRes = await fetch(fileUrl);
            if (!fileRes.ok) throw new Error("Failed to download PDF from storage");
            const fileBlob = await fileRes.blob();

            // 2. Upload to OpenAI
            const fileObj = new File([fileBlob], "document.pdf", { type: "application/pdf" });

            const file = await openai.files.create({
                file: fileObj,
                purpose: "assistants",
            });

            // 3. Create Thread
            const thread = await openai.beta.threads.create({
                messages: [
                    {
                        role: "user",
                        content: "Extract data from this document based on your instructions.",
                        attachments: [{ file_id: file.id, tools: [{ type: "file_search" }] }]
                    }
                ]
            });

            // 4. Create Assistant
            const assistant = await openai.beta.assistants.create({
                name: "Doc Extractor Temp",
                instructions: SYSTEM_PROMPT,
                model: "gpt-4.1-mini",
                tools: [{ type: "file_search" }],
            });

            // 5. Run and Poll
            let run = await openai.beta.threads.runs.createAndPoll(thread.id, {
                assistant_id: assistant.id,
            });

            if (run.status !== 'completed') {
                throw new Error(`AI Run failed with status: ${run.status}`);
            }

            // 6. Get Messages
            const messages = await openai.beta.threads.messages.list(thread.id);
            const lastMessage = messages.data.filter(m => m.role === 'assistant')[0];

            if (lastMessage && lastMessage.content[0].type === 'text') {
                content = lastMessage.content[0].text.value;
            }

            // 7. CLEANUP
            try {
                await openai.files.delete(file.id);
                await openai.beta.assistants.delete(assistant.id);
            } catch (cleanupErr) {
                console.warn("Cleanup warning:", cleanupErr);
            }

        } else {
            // --- IMAGE HANDLING (Vision) ---
            const response = await openai.chat.completions.create({
                model: "gpt-4.1-mini",
                messages: [
                    { role: "system", content: SYSTEM_PROMPT },
                    {
                        role: "user",
                        content: [
                            { type: "text", text: "Please extract data from this document." },
                            {
                                type: "image_url",
                                image_url: {
                                    "url": fileUrl,
                                },
                            },
                        ],
                    },
                ],
                response_format: { type: "json_object" },
            });
            content = response.choices[0].message.content || "";
        }

        if (!content) throw new Error("No content returned from AI");

        // Clean content if it has markdown code blocks
        const jsonStr = content.replace(/```json\n?|\n?```/g, "").trim();
        const data = JSON.parse(jsonStr);

        // Save to Database
        const { error: saveError } = await supabase.rpc('save_document_intelligence', {
            _document_id: documentId,
            _full_text: data.full_text || "",
            _ai_summary: data.ai_summary,
            _clinical_data: data.clinical_data,
            _tags: data.semantic_tags
        });

        if (saveError) throw saveError;

        return { success: true, data };

    } catch (e: any) {
        console.error("AI Extraction Error:", e);
        return { error: e.message || "Failed to extract data" };
    }
}
