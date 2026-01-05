"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Sparkles, Bot, RefreshCcw, FileText, BrainCircuit } from "lucide-react";
import { generatePatientSummary } from "@/lib/actions/ai";
import ReactMarkdown from "react-markdown";
import { Skeleton } from "@/components/ui/skeleton";
import { toast } from "sonner";
import { ConsultationContext } from "@/lib/actions/doctor";
import { useConsultationStore } from "@/stores/useConsultationStore";

interface SummaryTabProps {
    context: ConsultationContext;
}

export function SummaryTab({ context }: SummaryTabProps) {
    const store = useConsultationStore();
    const summary = store.aiSummary;
    const [isLoading, setIsLoading] = useState(false);

    async function handleGenerate() {
        setIsLoading(true);
        // Clean old summary if regenerating
        if (summary) store.setAiSummary(null);

        try {
            const result = await generatePatientSummary(context.patient.id, context.consultationId);

            if (result.success && result.data) {
                store.setAiSummary(result.data);
                toast.success("Clinical summary generated successfully");
            } else {
                toast.error(result.error || "Failed to generate summary");
            }
        } catch (error) {
            console.error(error);
            toast.error("An unexpected error occurred");
        } finally {
            setIsLoading(false);
        }
    }

    return (
        <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 min-h-[600px] overflow-hidden">
            <div className="bg-gradient-to-br from-violet-50 via-transparent to-transparent p-6 pb-2">
                <div className="flex items-center justify-between gap-3 mb-2">
                    <div className="flex items-center gap-3">
                        <div className="h-12 w-12 rounded-2xl bg-violet-100 flex items-center justify-center text-violet-600 ring-1 ring-violet-200">
                            <BrainCircuit className="h-6 w-6" />
                        </div>
                        <div>
                            <h3 className="text-xl font-bold text-slate-900 leading-tight">AI Clinical Assistant</h3>
                            <p className="text-sm font-medium text-slate-500">Patient 360 Analysis & Insights</p>
                        </div>
                    </div>

                    {summary && (
                        <Button
                            variant="outline"
                            onClick={handleGenerate}
                            disabled={isLoading}
                            className="rounded-full border-violet-200 text-violet-700 hover:bg-violet-50 hover:text-violet-800 gap-2"
                        >
                            <RefreshCcw className={`h-4 w-4 ${isLoading ? 'animate-spin' : ''}`} />
                            Regenerate Analysis
                        </Button>
                    )}
                </div>
            </div>

            <CardContent className="p-6 md:p-8">
                {!summary && !isLoading ? (
                    <div className="flex flex-col items-center justify-center py-20 text-center space-y-6 max-w-lg mx-auto">
                        <div className="h-24 w-24 rounded-full bg-slate-50 flex items-center justify-center mb-4 ring-1 ring-slate-100">
                            <Sparkles className="h-10 w-10 text-violet-400" />
                        </div>
                        <div className="space-y-2">
                            <h2 className="text-2xl font-black text-slate-900">Ready to Analyze</h2>
                            <p className="text-slate-500 text-base leading-relaxed">
                                Our AI engine will review the patient's entire history, identifying critical alerts, medication patterns, and visit trends to generate a concise executive summary.
                            </p>
                        </div>
                        <Button
                            size="lg"
                            onClick={handleGenerate}
                            className="h-14 px-8 rounded-full text-base font-bold bg-violet-600 hover:bg-violet-700 text-white shadow-xl shadow-violet-200 hover:shadow-2xl hover:shadow-violet-300 transition-all active:scale-95"
                        >
                            <Bot className="mr-2 h-5 w-5" />
                            Generate Clinical Summary
                        </Button>
                    </div>
                ) : isLoading ? (
                    <div className="space-y-8 max-w-4xl mx-auto py-8">
                        {/* Skeleton Loading UI */}
                        <div className="space-y-4">
                            <Skeleton className="h-8 w-3/4 bg-slate-100 rounded-lg" />
                            <Skeleton className="h-4 w-1/2 bg-slate-50 rounded-lg" />
                        </div>

                        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div className="space-y-4">
                                <Skeleton className="h-40 w-full bg-slate-50 rounded-2xl" />
                                <div className="space-y-2">
                                    <Skeleton className="h-4 w-full bg-slate-50" />
                                    <Skeleton className="h-4 w-5/6 bg-slate-50" />
                                    <Skeleton className="h-4 w-4/6 bg-slate-50" />
                                </div>
                            </div>
                            <div className="space-y-4">
                                <Skeleton className="h-20 w-full bg-slate-50 rounded-2xl" />
                                <Skeleton className="h-20 w-full bg-slate-50 rounded-2xl" />
                                <Skeleton className="h-20 w-full bg-slate-50 rounded-2xl" />
                            </div>
                        </div>

                        <div className="flex items-center justify-center gap-2 text-violet-500 animate-pulse mt-8">
                            <BrainCircuit className="h-5 w-5" />
                            <span className="font-bold text-sm">Analyzing clinical data points...</span>
                        </div>
                    </div>
                ) : (
                    <div className="prose prose-slate prose-sm md:prose-base max-w-none">
                        {/* Render Markdown Content */}
                        <div className="markdown-content">
                            <ReactMarkdown
                                components={{
                                    h1: ({ node, ...props }) => <h1 className="text-2xl font-black text-slate-900 mb-4 pb-2 border-b border-slate-100" {...props} />,
                                    h2: ({ node, ...props }) => <h2 className="text-lg font-bold text-slate-800 mt-6 mb-3 flex items-center gap-2" {...props} />,
                                    h3: ({ node, ...props }) => <h3 className="text-base font-bold text-slate-700 mt-4 mb-2" {...props} />,
                                    ul: ({ node, ...props }) => <ul className="list-disc list-outside ml-5 space-y-1 mb-4 text-slate-600" {...props} />,
                                    li: ({ node, ...props }) => <li className="pl-1" {...props} />,
                                    p: ({ node, ...props }) => <p className="mb-4 text-slate-600 leading-relaxed font-medium" {...props} />,
                                    strong: ({ node, ...props }) => <strong className="font-black text-slate-800" {...props} />,
                                    blockquote: ({ node, ...props }) => <blockquote className="border-l-4 border-violet-200 pl-4 py-1 my-4 bg-violet-50/50 rounded-r-lg italic text-slate-600" {...props} />,
                                }}
                            >
                                {summary || ""}
                            </ReactMarkdown>
                        </div>

                        <div className="mt-8 pt-6 border-t border-dashed border-slate-200 flex items-center justify-between text-xs text-slate-400 font-medium">
                            <div className="flex items-center gap-2">
                                <Bot className="h-3.5 w-3.5" />
                                <span>Generated by Nirbhoy AI • Verification required</span>
                            </div>
                            <span>{new Date().toLocaleString()}</span>
                        </div>
                    </div>
                )}
            </CardContent>
        </Card>
    );
}
