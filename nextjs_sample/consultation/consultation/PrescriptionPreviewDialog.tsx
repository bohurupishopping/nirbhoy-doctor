"use client";

import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import {
    Eye,
    Printer,
    Loader2,
    Save,
    Trash2,
    User,
    Send,
    Edit2,
    CheckCircle2,
    AlertTriangle,
    History,
    FileText
} from "lucide-react";
import { PrescriptionPrintTemplate, PrescriptionPrintData } from "@/components/staff/PrescriptionPrintTemplate";
import { ScrollArea } from "@/components/ui/scroll-area";

interface PrescriptionPreviewDialogProps {
    data: PrescriptionPrintData;
    trigger?: React.ReactNode;
}

export function PrescriptionPreviewDialog({ data, trigger }: PrescriptionPreviewDialogProps) {
    return (
        <Dialog>
            <DialogTrigger asChild>
                {trigger || (
                    <Button variant="outline" className="gap-2 rounded-full border-primary/20 hover:bg-primary/5">
                        <Eye className="h-4 w-4" />
                        Preview
                    </Button>
                )}
            </DialogTrigger>
            <DialogContent className="w-full sm:max-w-[850px] max-w-[98vw] h-[96vh] p-0 overflow-hidden flex flex-col rounded-3xl border-none">
                <DialogHeader className="px-5 py-3 border-b bg-slate-50/50">
                    <div className="flex items-center justify-between pr-8">
                        <DialogTitle className="text-lg font-bold tracking-tight text-slate-900 leading-none">
                            Prescription Preview
                        </DialogTitle>
                        <Button
                            onClick={() => window.print()}
                            className="rounded-full px-5 hover:bg-primary/5 text-primary border-primary/20 font-bold text-xs h-9"
                            variant="outline"
                        >
                            <Printer className="h-3.5 w-3.5" />
                            Print Prescription
                        </Button>
                    </div>
                </DialogHeader>

                <div className="flex-1 bg-slate-900/95 p-4 md:p-6 overflow-y-auto custom-scrollbar">
                    <div className="mx-auto preview-wrapper mb-8">
                        <PrescriptionPrintTemplate data={data} />
                    </div>

                    <style jsx global>{`
                        .custom-scrollbar::-webkit-scrollbar {
                            width: 8px;
                        }
                        .custom-scrollbar::-webkit-scrollbar-track {
                            background: rgba(255, 255, 255, 0.05);
                        }
                        .custom-scrollbar::-webkit-scrollbar-thumb {
                            background: rgba(255, 255, 255, 0.2);
                            border-radius: 4px;
                        }
                        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
                            background: rgba(255, 255, 255, 0.3);
                        }
                        .preview-wrapper .a4-print-container {
                            display: block !important;
                            position: relative !important;
                            width: 210mm !important;
                            min-height: 297mm !important;
                            padding: 10mm !important;
                            margin: 0 auto !important;
                            visibility: visible !important;
                            background: white !important;
                            box-shadow: none !important;
                            border-radius: 2px !important;
                        }
                        .preview-wrapper .a4-print-container * {
                            visibility: visible !important;
                        }
                    `}</style>
                </div>
            </DialogContent>
        </Dialog>
    );
}
