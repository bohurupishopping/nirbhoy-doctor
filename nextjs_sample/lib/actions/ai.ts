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

**Goal:** Provide a high-level, actionable summary. Highlight critical alerts, recent patterns, and safety issues first.

**Output Structure & Style Guidelines (Strictly Follow This Format):**

1.  **Clinical Snapshot & Executive Summary**
    *   **Patient:** Name (Age/Gender) | UHID: ...[last 4 digits]
    *   **Status:** [CRITICAL / STABLE / WHEELCHAIR] (Derived from access_flags or recent vitals)
    *   **Summary:** Write a single, high-density paragraph (approx 3-4 sentences) that synthesizes the patient's profile, main presenting complaints, active diagnoses, and recent visit context. Focus on the "why now" - why is the patient here today?

2.  **🔍 Detailed Clinical Analysis**
    *   **⚠️ Safety & Alerts:** Bullet points for Allergies and Critical Flags. "None" if clean.
    *   **💊 Active Meds & Regimen:** concise review of current drugs. Group by condition. Flag any unusual durations or interactions.
    *   **📉 Vitals & History:** Most recent vitals with date. Mention key chronic conditions.
    *   **🗓️ Visit Pattern:** Briefly mention visit frequency (e.g., "3rd visit in 2 weeks") and last 2-3 visits with 1-line context.

**Tone:** Professional, precise, physician-to-physician. Use icons (🚨, ⚠️, 💊, 📉, 🗓️) to make scanning easy.
**Constraint:** Keep it "semi-detailed" - enough for clinical decision making, but short enough to read in 30 seconds. Avoid fluff.
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
