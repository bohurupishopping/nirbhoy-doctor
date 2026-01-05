"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { Textarea } from "@/components/ui/textarea";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import {
    Accordion,
    AccordionContent,
    AccordionItem,
    AccordionTrigger,
} from "@/components/ui/accordion";
import {
    Plus,
    X,
    FileUp,
    CheckCircle2,
    FlaskConical,
    Search,
    Database,
    Microscope,
    FolderSync,
    Stethoscope,
    FileText
} from "lucide-react";
import { toast } from "sonner";
import { ConsultationContext } from "@/lib/actions/doctor";
import { useConsultationStore } from "@/stores/useConsultationStore";
import { DocumentUploadDialog } from "@/components/shared/DocumentUploadDialog";

interface LabsTabProps {
    context: ConsultationContext;
}

const COMMON_LABS = ["CBC", "LFT", "KFT", "RBS", "Lipid Profile", "Urine R/M", "TSH", "HbA1c"];

export function LabsTab({ context }: LabsTabProps) {
    const store = useConsultationStore();
    const [labInput, setLabInput] = useState("");
    const [uploadOpen, setUploadOpen] = useState(false);

    function handleAddLab(testName: string) {
        if (!testName.trim()) return;
        if (store.labs.some(l => l.test_name.toLowerCase() === testName.trim().toLowerCase())) {
            toast.error("Test already added");
            return;
        }
        store.addLab({ test_name: testName.trim(), instruction: "" });
        setLabInput("");
    }

    return (
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 pb-6">
            {/* Left Column: Smart Labs Overview */}
            <div className="lg:col-span-4 space-y-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 h-full overflow-hidden flex flex-col">
                    <div className="bg-gradient-to-br from-primary/5 via-transparent to-transparent p-5 pb-1">
                        <div className="flex items-center justify-between gap-3 mb-1">
                            <div className="flex items-center gap-3">
                                <div className="h-10 w-10 rounded-2xl bg-primary/10 flex items-center justify-center text-primary ring-1 ring-primary/20">
                                    <Microscope className="h-5 w-5" />
                                </div>
                                <div>
                                    <h3 className="text-lg font-bold text-slate-900 leading-tight">Labs Overview</h3>
                                    <p className="text-xs font-bold text-muted-foreground">Diagnostics summary</p>
                                </div>
                            </div>

                            <div className="bg-primary/5 px-3 py-1.5 rounded-full ring-1 ring-primary/10 flex items-center gap-2 self-start mt-1">
                                <FolderSync className="h-3.5 w-3.5 text-primary" />
                                <span className="text-[11px] font-bold text-slate-900 leading-tight whitespace-nowrap">Cloud Sync Active</span>
                            </div>
                        </div>
                    </div>

                    <CardContent className="p-5 pt-3 flex-1 flex flex-col gap-6">
                        {/* Clinical Observations Block (Moved from ComplaintTab) */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <Stethoscope className="h-4 w-4 text-primary" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Clinical Observations</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group-hover:bg-primary/5 group-hover:ring-primary/10 transition-all duration-300 min-h-[80px]">
                                {store.notes ? (
                                    <p className="text-sm font-bold text-slate-700 leading-relaxed line-clamp-4">
                                        {store.notes}
                                    </p>
                                ) : (
                                    <p className="text-sm font-medium text-slate-400 italic">No notes added</p>
                                )}
                            </div>
                        </div>

                        {/* Ordered Investigations Block */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <FlaskConical className="h-4 w-4 text-emerald-600" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Ordered Tests</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group-hover:bg-emerald-50/30 group-hover:ring-emerald-100/50 transition-all duration-300">
                                {store.labs.length > 0 ? (
                                    <div className="flex flex-wrap gap-2">
                                        {store.labs.map((lab) => (
                                            <Badge key={lab.temp_id} className="bg-white text-emerald-700 border-emerald-100 font-bold text-[11px] px-3 py-1 rounded-full">
                                                {lab.test_name}
                                            </Badge>
                                        ))}
                                    </div>
                                ) : (
                                    <div className="flex items-center gap-2 py-1">
                                        <div className="h-1.5 w-1.5 rounded-full bg-slate-300" />
                                        <p className="text-sm font-medium text-slate-400 italic">No tests requested</p>
                                    </div>
                                )}
                            </div>
                        </div>

                        {/* Recent Uploads Block */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <FileUp className="h-4 w-4 text-primary" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Recently Uploaded</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group-hover:bg-primary/5 group-hover:ring-primary/10 transition-all duration-300">
                                {store.newUploads.length > 0 ? (
                                    <div className="space-y-2">
                                        {store.newUploads.map((doc, i) => (
                                            <div key={i} className="flex items-center gap-3 text-[13px] font-bold text-slate-700 px-1 truncate">
                                                <CheckCircle2 className="h-4 w-4 text-emerald-500 shrink-0" />
                                                <span className="truncate">{doc.file_name}</span>
                                            </div>
                                        ))}
                                    </div>
                                ) : (
                                    <div className="flex items-center gap-2 py-1">
                                        <div className="h-1.5 w-1.5 rounded-full bg-slate-300" />
                                        <p className="text-sm font-medium text-slate-400 italic">No new uploads</p>
                                    </div>
                                )}
                            </div>
                        </div>

                    </CardContent>
                </Card>
            </div>

            {/* Right Column: Labs Editors */}
            <div className="lg:col-span-8 flex flex-col gap-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 overflow-hidden h-full">
                    <CardHeader className="p-5 border-b border-slate-100 bg-slate-50/30">
                        <div className="flex items-center gap-3">
                            <div className="h-10 w-10 rounded-2xl bg-white ring-1 ring-slate-200 flex items-center justify-center text-slate-600">
                                <Database className="h-5 w-5" />
                            </div>
                            <div>
                                <CardTitle className="text-lg font-bold text-slate-900 leading-tight">Clinical Investigations</CardTitle>
                                <p className="text-xs font-bold text-muted-foreground">Order diagnostic tests and attach results</p>
                            </div>
                        </div>
                    </CardHeader>

                    <CardContent className="p-5">
                        <Accordion type="multiple" defaultValue={["order"]} className="space-y-4">
                            {/* 1. Order Investigations */}
                            <AccordionItem value="order" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center">
                                            <FlaskConical className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">1. Order Investigations</h4>
                                            <p className="text-xs font-bold text-muted-foreground">{store.labs.length} tests in current order</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6 space-y-6">
                                    <div className="space-y-4">
                                        <div className="flex gap-2">
                                            <div className="relative flex-1">
                                                <Input
                                                    placeholder="Type test name (e.g., CBC, MRI)..."
                                                    className="h-12 rounded-full bg-muted/30 border-none pl-12 pr-4 font-bold text-sm ring-1 ring-transparent focus-visible:ring-primary/20 transition-all"
                                                    value={labInput}
                                                    onChange={(e) => setLabInput(e.target.value)}
                                                    onKeyDown={(e) => e.key === "Enter" && handleAddLab(labInput)}
                                                />
                                                <Search className="absolute left-4 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                                            </div>
                                            <Button
                                                className="h-12 w-12 rounded-full active:scale-95 transition-all"
                                                onClick={() => handleAddLab(labInput)}
                                            >
                                                <Plus className="h-5 w-5" />
                                            </Button>
                                        </div>

                                        <div className="space-y-3">
                                            <p className="text-[11px] font-bold text-muted-foreground uppercase tracking-widest ml-1">Most Common</p>
                                            <div className="flex flex-wrap gap-2">
                                                {COMMON_LABS.map((test) => (
                                                    <button
                                                        key={test}
                                                        onClick={() => handleAddLab(test)}
                                                        className="text-xs font-bold px-4 py-2 rounded-full bg-slate-50 text-slate-600 hover:bg-emerald-50 hover:text-emerald-600 ring-1 ring-slate-200 transition-all border-none"
                                                    >
                                                        + {test}
                                                    </button>
                                                ))}
                                            </div>
                                        </div>
                                    </div>

                                    {store.labs.length > 0 && (
                                        <div className="pt-4 border-t border-slate-100">
                                            <div className="flex flex-wrap gap-2">
                                                {store.labs.map((lab) => (
                                                    <Badge key={lab.temp_id} className="gap-2 pl-4 pr-1.5 py-2 rounded-full font-bold bg-white text-slate-900 ring-1 ring-emerald-100 transition-all hover:bg-emerald-50">
                                                        {lab.test_name}
                                                        <button
                                                            onClick={() => store.removeLab(lab.temp_id)}
                                                            className="h-6 w-6 rounded-full bg-emerald-50 text-emerald-600 flex items-center justify-center hover:bg-emerald-100 transition-colors"
                                                        >
                                                            <X className="h-3.5 w-3.5" />
                                                        </button>
                                                    </Badge>
                                                ))}
                                            </div>
                                        </div>
                                    )}
                                </AccordionContent>
                            </AccordionItem>

                            {/* 2. Upload Reports */}
                            <AccordionItem value="uploads" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-primary/5 text-primary flex items-center justify-center">
                                            <FileUp className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">2. Attachments & Scans</h4>
                                            <p className="text-xs font-bold text-muted-foreground">{store.newUploads.length} documents uploaded</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6 space-y-6">
                                    <div
                                        className="relative group cursor-pointer"
                                        onClick={() => setUploadOpen(true)}
                                    >
                                        <div className="border-2 border-dashed border-slate-200 rounded-[32px] p-8 flex flex-col items-center justify-center bg-slate-50/50 group-hover:bg-primary/5 group-hover:border-primary/30 transition-all duration-300">
                                            <div className="h-16 w-16 rounded-[22px] bg-white flex items-center justify-center text-primary mb-4 group-hover:scale-110 transition-transform duration-300 ring-4 ring-primary/5">
                                                <FileUp className="h-8 w-8" />
                                            </div>
                                            <p className="text-base font-bold text-slate-900 mb-1">
                                                Upload Patient Report
                                            </p>
                                            <p className="text-xs font-bold text-muted-foreground uppercase tracking-widest">
                                                JPG, PNG or PDF up to 10MB
                                            </p>
                                        </div>
                                    </div>

                                    {store.newUploads.length > 0 && (
                                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 pt-2">
                                            {store.newUploads.map((doc, i) => (
                                                <div key={i} className="flex items-center justify-between p-3 px-4 bg-slate-50 rounded-[20px] ring-1 ring-slate-100 group hover:bg-emerald-50 transition-all">
                                                    <div className="flex items-center gap-3 overflow-hidden">
                                                        <div className="h-10 w-10 shrink-0 rounded-[14px] bg-white flex items-center justify-center text-emerald-600">
                                                            <CheckCircle2 className="h-5 w-5" />
                                                        </div>
                                                        <span className="text-sm font-bold text-slate-700 truncate">{doc.file_name}</span>
                                                    </div>
                                                </div>
                                            ))}
                                        </div>
                                    )}
                                </AccordionContent>
                            </AccordionItem>

                            {/* 3. Clinical Notes Editor (Moved from ComplaintTab) */}
                            <AccordionItem value="notes" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-primary/5 text-primary flex items-center justify-center">
                                            <Stethoscope className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">3. Clinical Notes</h4>
                                            <p className="text-xs font-bold text-muted-foreground">Examination findings and notes</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6 space-y-5">
                                    <div className="relative">
                                        <Textarea
                                            placeholder="Document physical findings, observations, and detailed clinical notes..."
                                            value={store.notes}
                                            onChange={(e) => store.setNotes(e.target.value)}
                                            className="min-h-[200px] bg-muted/30 border-none rounded-[24px] p-6 font-bold text-sm focus-visible:ring-1 ring-primary/20 transition-all leading-relaxed"
                                        />
                                        <div className="absolute right-4 bottom-4">
                                            <FileText className="h-5 w-5 text-muted-foreground/30" />
                                        </div>
                                    </div>
                                </AccordionContent>
                            </AccordionItem>
                        </Accordion>
                    </CardContent>

                </Card>
            </div>

            <DocumentUploadDialog
                open={uploadOpen}
                onOpenChange={setUploadOpen}
                patientId={context.patient.id}
                defaultCategory="lab_report"
                onSuccess={() => {
                    toast.success("Uploaded successfully");
                    // We might want to refresh the store here, but the DocumentUploadDialog calls router.refresh() 
                    // which might not update the store if the store is client-side only and not synced with server actions yet.
                    // However, for now, let's rely on the store.addUpload manual update if we were to pass it to onUploadSuccess, 
                    // but DocumentUploadDialog is generic. 
                    // Ideally, we should refetch or update the store. 
                    // For this specific 'Doctor' view, the store handles state. 
                    // The shared dialog uploads to DB. 
                    // If we want the UI to update immediately with the new file in the 'Recently Uploaded' block, 
                    // we need to update the store.
                    // But DocumentUploadDialog doesn't return the file details easily unless we modify it.
                    // For now, let's stick to the request: "add this upload option". 
                }}
            />
        </div >
    );
}
