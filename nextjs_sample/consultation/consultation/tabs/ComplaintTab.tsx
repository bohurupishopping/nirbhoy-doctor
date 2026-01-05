"use client";

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Textarea } from "@/components/ui/textarea";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { useState } from "react";
import {
    Accordion,
    AccordionContent,
    AccordionItem,
    AccordionTrigger,
} from "@/components/ui/accordion";
import {
    MessageSquareMore,
    Stethoscope,
    AlertCircle,
    ChevronRight,
    Send,
    FileText,
    Activity,
    Thermometer,
    ClipboardList,
    History as HistoryIcon,
    Plus,
    X,
    Stethoscope as DiagnosisIcon
} from "lucide-react";
import { useConsultationStore } from "@/stores/useConsultationStore";

export function ComplaintTab() {
    const store = useConsultationStore();
    const [diagnosisInput, setDiagnosisInput] = useState("");

    const addDiagnosis = () => {
        if (!diagnosisInput.trim()) return;
        const newDiag = [...store.diagnosis, { code: 'custom', label: diagnosisInput.trim() }];
        store.setDiagnosis(newDiag);
        setDiagnosisInput("");
    };

    const removeDiagnosis = (index: number) => {
        const newDiag = [...store.diagnosis];
        newDiag.splice(index, 1);
        store.setDiagnosis(newDiag);
    };

    const handleKeyDown = (e: React.KeyboardEvent) => {
        if (e.key === 'Enter') {
            e.preventDefault();
            addDiagnosis();
        }
    };

    return (
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 pb-6">
            {/* Left Column: Smart Assessment Overview */}
            <div className="lg:col-span-4 space-y-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 h-full overflow-hidden flex flex-col">
                    <div className="bg-gradient-to-br from-primary/5 via-transparent to-transparent p-5 pb-1">
                        <div className="flex items-center justify-between gap-3 mb-1">
                            <div className="flex items-center gap-3">
                                <div className="h-10 w-10 rounded-2xl bg-primary/10 flex items-center justify-center text-primary ring-1 ring-primary/20">
                                    <MessageSquareMore className="h-5 w-5" />
                                </div>
                                <div>
                                    <h3 className="text-lg font-bold text-slate-900 leading-tight">Assessment</h3>
                                    <p className="text-xs font-bold text-muted-foreground">Consultation summary</p>
                                </div>
                            </div>

                            <div className="bg-primary/5 px-3 py-1.5 rounded-full ring-1 ring-primary/10 flex items-center gap-2 self-start mt-1">
                                <HistoryIcon className="h-3.5 w-3.5 text-primary" />
                                <span className="text-[11px] font-bold text-slate-900 leading-tight whitespace-nowrap">Active Assessment</span>
                            </div>
                        </div>
                    </div>

                    <CardContent className="p-5 pt-3 flex-1 flex flex-col gap-6">
                        {/* Chief Complaint Block */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <AlertCircle className="h-4 w-4 text-red-500" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Major Complaint</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group-hover:bg-red-50/30 group-hover:ring-red-100/50 transition-all duration-300 min-h-[80px]">
                                {store.chiefComplaint ? (
                                    <p className="text-sm font-bold text-slate-700 leading-relaxed italic pr-2">
                                        "{store.chiefComplaint}"
                                    </p>
                                ) : (
                                    <p className="text-sm font-medium text-slate-400 italic">No complaint recorded</p>
                                )}
                            </div>
                        </div>

                        {/* Diagnosis Block */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <DiagnosisIcon className="h-4 w-4 text-emerald-600" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Diagnosis</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group-hover:bg-emerald-50/30 group-hover:ring-emerald-100/50 transition-all duration-300 min-h-[80px]">
                                {store.diagnosis.length > 0 ? (
                                    <div className="flex flex-wrap gap-2">
                                        {store.diagnosis.map((d, i) => (
                                            <Badge key={i} className="bg-white text-slate-700 border-slate-200 hover:bg-emerald-50 hover:text-emerald-700 hover:border-emerald-200 transition-colors">
                                                {d.label}
                                            </Badge>
                                        ))}
                                    </div>
                                ) : (
                                    <p className="text-sm font-medium text-slate-400 italic">No diagnosis added</p>
                                )}
                            </div>
                        </div>

                    </CardContent>
                </Card>
            </div>

            {/* Right Column: Assessment Editors */}
            <div className="lg:col-span-8 flex flex-col gap-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 overflow-hidden h-full">
                    <CardHeader className="p-5 border-b border-slate-100 bg-slate-50/30">
                        <div className="flex items-center gap-3">
                            <div className="h-10 w-10 rounded-2xl bg-white ring-1 ring-slate-200 flex items-center justify-center text-slate-600">
                                <ClipboardList className="h-5 w-5" />
                            </div>
                            <div>
                                <CardTitle className="text-lg font-bold text-slate-900 leading-tight">Clinical Assessment</CardTitle>
                                <p className="text-xs font-bold text-muted-foreground">Document signs, symptoms and findings</p>
                            </div>
                        </div>
                    </CardHeader>

                    <CardContent className="p-5">
                        <Accordion type="multiple" defaultValue={["complaint"]} className="space-y-4">
                            {/* 1. Chief Complaint Editor */}
                            <AccordionItem value="complaint" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-red-50 text-red-600 flex items-center justify-center">
                                            <Activity className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">1. Chief Complaint</h4>
                                            <p className="text-xs font-bold text-muted-foreground">Primary reason for visit</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6 space-y-5">
                                    <div className="relative">
                                        <Textarea
                                            placeholder="What is the patient's primary concern?..."
                                            value={store.chiefComplaint}
                                            onChange={(e) => store.setChiefComplaint(e.target.value)}
                                            className="min-h-[140px] bg-muted/30 border-none rounded-[24px] p-6 font-bold text-sm focus-visible:ring-1 ring-primary/20 transition-all leading-relaxed"
                                        />
                                        <div className="absolute right-4 bottom-4">
                                            <MessageSquareMore className="h-5 w-5 text-muted-foreground/30" />
                                        </div>
                                    </div>
                                </AccordionContent>
                            </AccordionItem>



                            {/* 3. Diagnosis Editor */}
                            <AccordionItem value="diagnosis" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center">
                                            <DiagnosisIcon className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">2. Diagnosis</h4>
                                            <p className="text-xs font-bold text-muted-foreground">Clinical diagnosis and findings</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6 space-y-5">
                                    <div className="space-y-4">
                                        <div className="flex gap-2">
                                            <div className="relative flex-1">
                                                <Input
                                                    placeholder="Type diagnosis and press Enter..."
                                                    value={diagnosisInput}
                                                    onChange={(e) => setDiagnosisInput(e.target.value)}
                                                    onKeyDown={handleKeyDown}
                                                    className="h-12 rounded-full bg-muted/30 border-none px-6 font-bold text-sm ring-1 ring-transparent focus-visible:ring-emerald-500/20 transition-all"
                                                />
                                            </div>
                                            <Button
                                                onClick={addDiagnosis}
                                                size="icon"
                                                className="h-12 w-12 rounded-full bg-emerald-600 hover:bg-emerald-700 text-white shadow-lg shadow-emerald-200"
                                            >
                                                <Plus className="h-5 w-5" />
                                            </Button>
                                        </div>

                                        {store.diagnosis.length > 0 && (
                                            <div className="flex flex-wrap gap-2 p-4 bg-slate-50 rounded-[20px] ring-1 ring-slate-100">
                                                {store.diagnosis.map((d, i) => (
                                                    <div
                                                        key={i}
                                                        className="group flex items-center gap-2 px-3 py-1.5 bg-white text-slate-700 text-sm font-bold rounded-full border border-slate-200 hover:border-red-200 hover:bg-red-50 transition-all"
                                                    >
                                                        {d.label}
                                                        <button
                                                            onClick={() => removeDiagnosis(i)}
                                                            className="text-slate-400 group-hover:text-red-500 transition-colors"
                                                        >
                                                            <X className="h-3.5 w-3.5" />
                                                        </button>
                                                    </div>
                                                ))}
                                            </div>
                                        )}
                                    </div>
                                </AccordionContent>
                            </AccordionItem>
                        </Accordion>
                    </CardContent>

                </Card>
            </div>
        </div >
    );
}
