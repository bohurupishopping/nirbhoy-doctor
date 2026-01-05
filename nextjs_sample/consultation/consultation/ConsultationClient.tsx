"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import {
    AlertTriangle,
    ClipboardList,
    History,
    Pill,
    TestTube,
    Send,
    Loader2,
    CalendarIcon,
    User,
    Activity,
    Sparkles,
} from "lucide-react";
import { toast } from "sonner";
import { ConsultationContext, submitPrescription } from "@/lib/actions/doctor";
import { useConsultationStore } from "@/stores/useConsultationStore";
import { PrescriptionPreviewDialog } from "./PrescriptionPreviewDialog";
import { PrescriptionPrintData } from "@/components/staff/PrescriptionPrintTemplate";
import { format } from "date-fns";

// Tab Components
import { IntakeTab } from "./tabs/IntakeTab";
import { ComplaintTab } from "./tabs/ComplaintTab";
import { HistoryTab } from "./tabs/HistoryTab";
import { ProfileTab } from "./tabs/ProfileTab";
import { TreatmentTab } from "./tabs/TreatmentTab";
import { LabsTab } from "./tabs/LabsTab";
import { PlanTab } from "./tabs/PlanTab";
import { SummaryTab } from "./tabs/SummaryTab";

interface ConsultationClientProps {
    context: ConsultationContext;
}

export function ConsultationClient({ context }: ConsultationClientProps) {
    const router = useRouter();
    const store = useConsultationStore();
    const [activeTab, setActiveTab] = useState("summary");

    // Initialize store on mount
    useEffect(() => {
        store.initStore(context.consultationId, context.patient, context.safetyProfile);
    }, [context]);

    async function handleSubmit() {
        store.setIsSubmitting(true);
        try {
            const payload = store.getPayload();
            const result = await submitPrescription(payload);

            if (result.success) {
                toast.success("Prescription submitted successfully!");
                store.reset();
                router.push("/");
            } else {
                toast.error(result.error || "Failed to submit prescription");
            }
        } catch (e: any) {
            toast.error(e.message || "An error occurred");
        } finally {
            store.setIsSubmitting(false);
        }
    }

    return (
        <div className="flex flex-col gap-4">
            {/* Patient Header */}
            <Card className="rounded-3xl border-none bg-white ring-1 ring-border/50">
                <CardContent className="p-4 md:p-5">
                    <div className="flex flex-col md:flex-row justify-between gap-6">
                        {/* Left: Patient Identity & Demographics */}
                        <div className="flex items-start gap-4">
                            <div className="shrink-0 h-16 w-16 md:h-14 md:w-14 rounded-2xl bg-primary/10 flex items-center justify-center text-primary font-black text-xl border border-primary/10">
                                {context.patient.name.charAt(0)}
                            </div>
                            <div className="space-y-2 flex-1 min-w-0">
                                <div className="flex flex-wrap items-center gap-2">
                                    <h1 className="text-lg md:text-2xl font-bold tracking-tight text-slate-900 leading-tight">
                                        {context.patient.name}
                                    </h1>
                                    <Badge variant="outline" className="rounded-full px-2.5 py-0.5 h-6 md:h-7 text-[10px] md:text-xs font-bold border-primary/20 bg-primary/5 text-primary whitespace-nowrap">
                                        {context.patient.uhid}
                                    </Badge>
                                    {context.patient.access_flags?.critical && (
                                        <Badge className="rounded-full px-2.5 py-0.5 h-6 md:h-7 bg-red-100/80 text-red-700 border-none gap-1.5 font-bold text-[10px] md:text-xs ring-1 ring-red-200 whitespace-nowrap">
                                            <div className="w-1.5 h-1.5 rounded-full bg-red-500 animate-pulse" />
                                            Critical
                                        </Badge>
                                    )}
                                    {context.patient.access_flags?.wheelchair && (
                                        <Badge className="rounded-full px-2.5 py-0.5 h-6 md:h-7 bg-blue-100/80 text-blue-700 border-none gap-1.5 font-bold text-[10px] md:text-xs ring-1 ring-blue-200 whitespace-nowrap">
                                            <div className="w-1.5 h-1.5 rounded-full bg-blue-500" />
                                            Wheelchair
                                        </Badge>
                                    )}
                                </div>

                                <div className="flex flex-wrap items-center gap-2 pt-1">
                                    <div className="bg-slate-50 border border-slate-100/80 px-3 py-1 rounded-full text-[11px] md:text-xs font-bold text-slate-600 flex items-center gap-1.5">
                                        <div className="w-1 h-1 rounded-full bg-slate-400" />
                                        {context.patient.gender}
                                    </div>
                                    <div className="bg-slate-50 border border-slate-100/80 px-3 py-1 rounded-full text-[11px] md:text-xs font-bold text-slate-600 flex items-center gap-1.5">
                                        <div className="w-1 h-1 rounded-full bg-slate-400" />
                                        {context.patient.age} Years
                                    </div>
                                    {context.patient.phone && (
                                        <div className="bg-slate-50 border border-slate-100/80 px-3 py-1 rounded-full text-[11px] md:text-xs font-bold text-slate-600 flex items-center gap-1.5">
                                            <div className="w-1 h-1 rounded-full bg-slate-400" />
                                            {context.patient.phone}
                                        </div>
                                    )}
                                    {context.patient.religion && (
                                        <div className="bg-slate-50 border border-slate-100/80 px-3 py-1 rounded-full text-[11px] md:text-xs font-bold text-slate-600 flex items-center gap-1.5">
                                            <div className="w-1 h-1 rounded-full bg-slate-400" />
                                            {context.patient.religion}
                                        </div>
                                    )}
                                    {(context.patient.address || context.patient.district) && (
                                        <div className="bg-slate-50 border border-slate-100/80 px-3 py-1 rounded-full text-[11px] md:text-xs font-bold text-slate-600 flex items-center gap-1.5">
                                            <div className="w-1 h-1 rounded-full bg-slate-400" />
                                            <span className="line-clamp-1">
                                                {[context.patient.address, context.patient.district, context.patient.pincode].filter(Boolean).join(", ")}
                                            </span>
                                        </div>
                                    )}
                                </div>
                            </div>
                        </div>

                        {/* Right: Actions */}
                        <div className="grid grid-cols-2 md:flex items-center gap-3 w-full md:w-auto pt-2 md:pt-0 border-t md:border-none border-border/40">
                            <PrescriptionPreviewDialog
                                data={{
                                    meta: {
                                        generated_at: new Date().toISOString(),
                                        appointment_number: context.appointmentNumber,
                                        visit_type: "Fresh Consultation",
                                        visit_date: format(new Date(), "dd MMM yyyy"),
                                    },
                                    clinic: context.clinic,
                                    doctor: context.doctor,
                                    patient: {
                                        name: context.patient.name,
                                        uhid: context.patient.uhid,
                                        age_gender: `${context.patient.age} / ${context.patient.gender}`,
                                        phone: context.patient.phone || "",
                                        address: context.patient.address || "",
                                        known_allergies: context.safetyProfile.allergies,
                                    },
                                    clinical: {
                                        vitals: store.vitals,
                                        diagnosis: store.diagnosis.map(d => d.label).join(", "),
                                        notes: (store.chiefComplaint ? `Complaint: ${store.chiefComplaint}` : "") + (store.notes ? (store.chiefComplaint ? "\n\n" : "") + store.notes : ""),
                                    },
                                    rx_items: store.medicines.map(m => ({
                                        brand_name: m.name,
                                        generic_name: m.composition,
                                        type: "Tab",
                                        dosage: m.frequency,
                                        duration: m.duration,
                                        instruction: m.instruction,
                                        note: m.special_instructions,
                                    })),
                                    lab_orders: store.labs.map(l => ({
                                        test_name: l.test_name,
                                        instruction: l.instruction,
                                    })),
                                    advice: {
                                        next_visit_date: store.followUp.date ? format(store.followUp.date, "dd MMM yyyy") : undefined,
                                        next_visit_text: store.followUp.instruction,
                                    }
                                }}
                                trigger={
                                    <Button
                                        variant="outline"
                                        className="w-full md:w-auto h-11 md:h-12 px-4 md:px-6 rounded-full border-primary/20 hover:bg-primary/5 text-primary font-bold text-xs gap-2"
                                    >
                                        <Activity size={16} />
                                        Preview
                                    </Button>
                                }
                            />

                            <Button
                                size="lg"
                                className="w-full md:w-auto h-11 md:h-12 px-6 md:px-8 rounded-full font-bold text-xs md:text-sm transition-all active:scale-95 gap-2 bg-emerald-600 hover:bg-emerald-700 text-white border-none"
                                onClick={handleSubmit}
                                disabled={store.isSubmitting}
                            >
                                {store.isSubmitting ? (
                                    <>
                                        <Loader2 className="h-4 w-4 animate-spin" />
                                        Saving...
                                    </>
                                ) : (
                                    <>
                                        Sign & Complete
                                        <Send size={16} className="rotate-45" />
                                    </>
                                )}
                            </Button>
                        </div>
                    </div>

                    {/* Safety Profile Summary */}
                    {(context.safetyProfile.allergies.length > 0 || context.safetyProfile.chronic_conditions.length > 0) && (
                        <div className="mt-4 pt-4 border-t border-border/40 flex flex-wrap gap-2">
                            {context.safetyProfile.allergies.length > 0 && (
                                <div className="bg-red-50/50 border border-red-100/50 px-3 py-1 rounded-full text-[11px] md:text-xs font-bold text-red-700 flex items-center gap-2">
                                    <AlertTriangle className="h-3.5 w-3.5 text-red-500" />
                                    <span className="opacity-60 uppercase tracking-tight">Allergies:</span>
                                    <span>{context.safetyProfile.allergies.join(", ")}</span>
                                </div>
                            )}
                            {context.safetyProfile.chronic_conditions.length > 0 && (
                                <div className="bg-amber-50/50 border border-amber-100/50 px-3 py-1 rounded-full text-[11px] md:text-xs font-bold text-amber-700 flex items-center gap-2">
                                    <Activity className="h-3.5 w-3.5 text-amber-500" />
                                    <span className="opacity-60 uppercase tracking-tight">Conditions:</span>
                                    <span>{context.safetyProfile.chronic_conditions.join(", ")}</span>
                                </div>
                            )}
                        </div>
                    )}
                </CardContent>
            </Card>

            {/* Main Tabs Container */}
            <Tabs value={activeTab} onValueChange={setActiveTab} className="w-full">
                <div className="bg-white rounded-3xl p-1.5 ring-1 ring-border/50 mb-6 overflow-x-auto no-scrollbar">
                    <TabsList className="flex w-max md:grid md:w-full md:grid-cols-8 h-auto bg-transparent border-none gap-1">
                        {[
                            { value: "summary", icon: Sparkles, label: "Summary", color: "data-[state=active]:bg-violet-600" },
                            { value: "intake", icon: Activity, label: "Vitals", color: "data-[state=active]:bg-amber-500" },
                            { value: "history", icon: History, label: "History", color: "data-[state=active]:bg-slate-600" },
                            { value: "profile", icon: User, label: "Patient Profile", color: "data-[state=active]:bg-indigo-500" },
                            { value: "complaint", icon: ClipboardList, label: "Complaints", color: "data-[state=active]:bg-sky-500" },
                            { value: "treatment", icon: Pill, label: "Drug/Medicines", color: "data-[state=active]:bg-rose-500" },
                            { value: "labs", icon: TestTube, label: "Diagnostics", color: "data-[state=active]:bg-cyan-600" },
                            { value: "plan", icon: CalendarIcon, label: "Final Plan", color: "data-[state=active]:bg-emerald-600" }
                        ].map((tab) => (
                            <TabsTrigger
                                key={tab.value}
                                value={tab.value}
                                className={cn(
                                    "gap-3 rounded-full py-3.5 px-6 data-[state=active]:text-primary-foreground text-sm font-bold transition-all hover:bg-muted/50 whitespace-nowrap",
                                    tab.color
                                )}
                            >
                                <tab.icon size={18} />
                                <span className="">{tab.label}</span>
                            </TabsTrigger>
                        ))}
                    </TabsList>
                </div>

                <div className="min-h-[400px]">
                    <TabsContent value="summary" className="mt-0 focus-visible:outline-none">
                        <SummaryTab context={context} />
                    </TabsContent>

                    <TabsContent value="intake" className="mt-0 focus-visible:outline-none">
                        <IntakeTab />
                    </TabsContent>

                    <TabsContent value="complaint" className="mt-0 focus-visible:outline-none">
                        <ComplaintTab />
                    </TabsContent>

                    <TabsContent value="history" className="mt-0 focus-visible:outline-none">
                        <HistoryTab context={context} />
                    </TabsContent>

                    <TabsContent value="profile" className="mt-0 focus-visible:outline-none">
                        <ProfileTab context={context} />
                    </TabsContent>

                    <TabsContent value="treatment" className="mt-0 focus-visible:outline-none">
                        <TreatmentTab context={context} />
                    </TabsContent>

                    <TabsContent value="labs" className="mt-0 focus-visible:outline-none">
                        <LabsTab context={context} />
                    </TabsContent>

                    <TabsContent value="plan" className="mt-0 focus-visible:outline-none">
                        <PlanTab />
                    </TabsContent>
                </div>
            </Tabs>

        </div>
    );
}
