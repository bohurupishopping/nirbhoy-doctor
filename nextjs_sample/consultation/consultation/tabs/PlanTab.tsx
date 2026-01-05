"use client";

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { Calendar } from "@/components/ui/calendar";
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import {
    Accordion,
    AccordionContent,
    AccordionItem,
    AccordionTrigger,
} from "@/components/ui/accordion";
import {
    Loader2,
    Save,
    Trash2,
    User,
    Send,
    Edit2,
    Calendar as CalendarIcon,
    ChevronRight,
    X,
    FileText,
    ClipboardCheck,
    Stethoscope,
    FlaskConical,
    Pill,
    History as HistoryIcon,
    AlertCircle
} from "lucide-react";
import { format, addDays } from "date-fns";
import { useConsultationStore } from "@/stores/useConsultationStore";

const FOLLOWUP_CHIPS = [
    { label: "3 Days", days: 3 },
    { label: "5 Days", days: 5 },
    { label: "1 Week", days: 7 },
    { label: "2 Weeks", days: 14 },
    { label: "1 Month", days: 30 },
];

export function PlanTab() {
    const store = useConsultationStore();

    return (
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 pb-6">
            {/* Left Column: Smart Plan Preview */}
            <div className="lg:col-span-4 space-y-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 h-full overflow-hidden flex flex-col">
                    <div className="bg-gradient-to-br from-primary/5 via-transparent to-transparent p-5 pb-1">
                        <div className="flex items-center justify-between gap-3 mb-1">
                            <div className="flex items-center gap-3">
                                <div className="h-10 w-10 rounded-2xl bg-primary/10 flex items-center justify-center text-primary ring-1 ring-primary/20">
                                    <ClipboardCheck className="h-5 w-5" />
                                </div>
                                <div>
                                    <h3 className="text-lg font-bold text-slate-900 leading-tight">Master Plan</h3>
                                    <p className="text-xs font-bold text-muted-foreground">Preview of final result</p>
                                </div>
                            </div>

                            <div className="bg-emerald-50 px-3 py-1.5 rounded-full ring-1 ring-emerald-100 flex items-center gap-2 self-start mt-1">
                                <FileText className="h-3.5 w-3.5 text-emerald-600" />
                                <span className="text-[11px] font-bold text-emerald-900 leading-tight whitespace-nowrap">Ready to Generate</span>
                            </div>
                        </div>
                    </div>

                    <CardContent className="p-5 pt-3 flex-1 flex flex-col gap-6">
                        {/* Diagnosis Block */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <Stethoscope className="h-4 w-4 text-primary" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Final Diagnosis</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group-hover:bg-primary/5 group-hover:ring-primary/10 transition-all duration-300">
                                {store.diagnosis.length > 0 ? (
                                    <div className="flex flex-wrap gap-2">
                                        {store.diagnosis.map((d, i) => (
                                            <div key={i} className="text-sm font-bold text-slate-700 bg-white px-3 py-1 rounded-full ring-1 ring-slate-100">
                                                {d.label}
                                            </div>
                                        ))}
                                    </div>
                                ) : (
                                    <p className="text-sm font-medium text-slate-400 italic">No diagnosis entered</p>
                                )}
                            </div>
                        </div>

                        {/* Summary Stats */}
                        <div className="grid grid-cols-2 gap-3">
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100">
                                <div className="flex items-center gap-2 mb-2 text-indigo-600">
                                    <Pill className="h-4 w-4" />
                                    <span className="text-[11px] font-bold uppercase tracking-wider">Medicines</span>
                                </div>
                                <p className="text-xl font-black text-slate-900">{store.medicines.length}</p>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100">
                                <div className="flex items-center gap-2 mb-2 text-emerald-600">
                                    <FlaskConical className="h-4 w-4" />
                                    <span className="text-[11px] font-bold uppercase tracking-wider">Investigations</span>
                                </div>
                                <p className="text-xl font-black text-slate-900">{store.labs.length}</p>
                            </div>
                        </div>

                        {/* Follow-up Block */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <CalendarIcon className="h-4 w-4 text-orange-500" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Scheduled Visit</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group-hover:bg-orange-50/30 group-hover:ring-orange-100/50 transition-all duration-300">
                                {store.followUp.date ? (
                                    <div className="flex items-center gap-3">
                                        <div className="h-10 w-10 rounded-xl bg-white flex items-center justify-center text-orange-600">
                                            <CalendarIcon className="h-5 w-5" />
                                        </div>
                                        <div>
                                            <p className="text-sm font-bold text-slate-900">{format(store.followUp.date, "PPP")}</p>
                                            <p className="text-[11px] font-bold text-orange-600/70">Return Appointment</p>
                                        </div>
                                    </div>
                                ) : (
                                    <p className="text-sm font-medium text-slate-400 italic">No follow-up date set</p>
                                )}
                            </div>
                        </div>

                    </CardContent>
                </Card>
            </div>

            {/* Right Column: Plan Editors */}
            <div className="lg:col-span-8 flex flex-col gap-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 overflow-hidden h-full">
                    <CardHeader className="p-5 border-b border-slate-100 bg-slate-50/30">
                        <div className="flex items-center gap-3">
                            <div className="h-10 w-10 rounded-2xl bg-white ring-1 ring-slate-200 flex items-center justify-center text-slate-600">
                                <Edit2 className="h-5 w-5" />
                            </div>
                            <div>
                                <CardTitle className="text-lg font-bold text-slate-900 leading-tight">Finalize Treatment Plan</CardTitle>
                                <p className="text-xs font-bold text-muted-foreground">Adjust follow-up and clinical advice</p>
                            </div>
                        </div>
                    </CardHeader>

                    <CardContent className="p-5">
                        <Accordion type="multiple" defaultValue={["appointment"]} className="space-y-4">
                            {/* 1. Next Appointment Editor */}
                            <AccordionItem value="appointment" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-orange-50 text-orange-600 flex items-center justify-center">
                                            <CalendarIcon className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">1. Next Appointment</h4>
                                            <p className="text-xs font-bold text-muted-foreground">
                                                {store.followUp.date ? format(store.followUp.date, "PPP") : "Select return date"}
                                            </p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6 space-y-6">
                                    <div className="space-y-3">
                                        <p className="text-[11px] font-bold text-muted-foreground uppercase tracking-widest ml-1">Quick Select</p>
                                        <div className="flex flex-wrap gap-2">
                                            {FOLLOWUP_CHIPS.map((chip) => (
                                                <button
                                                    key={chip.label}
                                                    onClick={() => store.setFollowUp(addDays(new Date(), chip.days), store.followUp.instruction)}
                                                    className={`text-xs font-bold px-5 py-2.5 rounded-full transition-all border-none ring-1 active:scale-95 ${store.followUp.date && format(store.followUp.date, "yyyy-MM-dd") === format(addDays(new Date(), chip.days), "yyyy-MM-dd")
                                                        ? "bg-primary text-white ring-primary"
                                                        : "bg-slate-50 text-slate-600 hover:bg-orange-50 hover:text-orange-600 ring-slate-200"
                                                        }`}
                                                >
                                                    {chip.label}
                                                </button>
                                            ))}
                                        </div>
                                    </div>

                                    <div className="space-y-3">
                                        <p className="text-[11px] font-bold text-muted-foreground uppercase tracking-widest ml-1">Custom Date</p>
                                        <div className="flex items-center gap-3">
                                            <Popover>
                                                <PopoverTrigger asChild>
                                                    <Button
                                                        variant="ghost"
                                                        className="flex-1 justify-start text-left font-bold rounded-full h-12 bg-muted/30 border-none px-6 ring-1 ring-transparent hover:ring-primary/20 transition-all"
                                                    >
                                                        <CalendarIcon className="mr-3 h-4 w-4 text-primary" />
                                                        {store.followUp.date ? format(store.followUp.date, "PPP") : "Pick a date"}
                                                    </Button>
                                                </PopoverTrigger>
                                                <PopoverContent className="w-auto p-0 rounded-[32px] border-none overflow-hidden" align="start">
                                                    <Calendar
                                                        mode="single"
                                                        selected={store.followUp.date || undefined}
                                                        onSelect={(date) => store.setFollowUp(date || null, store.followUp.instruction)}
                                                        disabled={(date) => date < new Date()}
                                                        initialFocus
                                                    />
                                                </PopoverContent>
                                            </Popover>
                                            {store.followUp.date && (
                                                <Button
                                                    variant="secondary"
                                                    size="icon"
                                                    className="rounded-full h-12 w-12 bg-red-50 text-red-600 hover:bg-red-100 transition-all border-none"
                                                    onClick={() => store.setFollowUp(null, store.followUp.instruction)}
                                                >
                                                    <X className="h-5 w-5" />
                                                </Button>
                                            )}
                                        </div>
                                    </div>
                                </AccordionContent>
                            </AccordionItem>

                            {/* 2. Advice & Instructions Editor */}
                            <AccordionItem value="advice" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-primary/5 text-primary flex items-center justify-center">
                                            <FileText className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">2. Advice & Instructions</h4>
                                            <p className="text-xs font-bold text-muted-foreground">General notes for patient</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6 space-y-5">
                                    <div className="relative group">
                                        <Textarea
                                            placeholder="Write clinical advice here (e.g., Avoid fatty food, take complete bed rest)..."
                                            value={store.followUp.instruction}
                                            onChange={(e) => store.setFollowUp(store.followUp.date, e.target.value)}
                                            className="min-h-[160px] bg-muted/30 border-none rounded-[24px] p-6 font-bold text-sm focus-visible:ring-1 ring-primary/20 transition-all leading-relaxed"
                                        />
                                        <div className="absolute right-4 bottom-4">
                                            <AlertCircle className="h-5 w-5 text-muted-foreground/30" />
                                        </div>
                                    </div>
                                    <p className="text-[11px] font-bold text-muted-foreground/60 px-2 italic">
                                        * This advice will be printed prominently on the final prescription.
                                    </p>
                                </AccordionContent>
                            </AccordionItem>
                        </Accordion>
                    </CardContent>

                </Card>
            </div>
        </div>
    );
}
