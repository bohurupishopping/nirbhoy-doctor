"use client";

import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import {
    Accordion,
    AccordionContent,
    AccordionItem,
    AccordionTrigger,
} from "@/components/ui/accordion";
import {
    AlertTriangle,
    Heart,
    User,
    Plus,
    X,
    Loader2,
    Save,
    Send,
    ClipboardList,
    Trash2,
    Users,
    Activity,
    ShieldAlert,
    Stethoscope,
    ChevronRight,
    Search,
    History as HistoryIcon
} from "lucide-react";
import { toast } from "sonner";
import { updateMedicalProfile, ConsultationContext } from "@/lib/actions/doctor";

const ALLERGY_SUGGESTIONS = [
    "Sulfa", "Penicillin", "Dust/Pollens", "Aspirin", "NSAIDs", "Lactose", "Seafood", "Peanuts",
    "Eggs", "Latex", "Dye/Contrast", "Milk", "Soy", "Wheat"
];
const CONDITION_SUGGESTIONS = [
    "Diabetes Type 2", "Hypertension", "Hypothyroid", "Asthma", "CKD", "PCOS", "Gastritis",
    "Hyperlipidemia", "Migraine", "OA Knee", "IHD", "COPD", "Hyperuricemia", "Anemia"
];
const FAMILY_SUGGESTIONS = [
    "F: Diabetes", "M: Diabetes", "F: Hypertension", "M: BP", "Sibling: Asthma", "Parents: CAD",
    "F: Stroke", "M: Cancer", "F: CKD", "Sibling: Diabetes", "M: Thyroid", "Paternal: Heart",
    "Maternal: BP", "M: OA"
];

interface ProfileTabProps {
    context: ConsultationContext;
}

export function ProfileTab({ context }: ProfileTabProps) {
    const [profileAllergies, setProfileAllergies] = useState<string[]>(
        context.safetyProfile.allergies || []
    );
    const [profileConditions, setProfileConditions] = useState<string[]>(
        context.safetyProfile.chronic_conditions || []
    );
    const [profileFamilyHistory, setProfileFamilyHistory] = useState<string[]>(
        context.safetyProfile.family_history || []
    );
    const [profileLifestyle, setProfileLifestyle] = useState<string[]>(
        context.safetyProfile.lifestyle ? Object.keys(context.safetyProfile.lifestyle) : []
    );
    const [newAllergyInput, setNewAllergyInput] = useState("");
    const [newConditionInput, setNewConditionInput] = useState("");
    const [newFamilyInput, setNewFamilyInput] = useState("");
    const [newLifestyleInput, setNewLifestyleInput] = useState("");
    const [isSavingProfile, setIsSavingProfile] = useState(false);

    async function handleSave() {
        setIsSavingProfile(true);
        // Convert lifestyle array to record format
        const lifestyleRecord = profileLifestyle.reduce((acc, item) => ({ ...acc, [item]: true }), {});

        const result = await updateMedicalProfile(context.patient.id, {
            allergies: profileAllergies,
            chronic_conditions: profileConditions,
            family_history: profileFamilyHistory,
            lifestyle_tags: lifestyleRecord
        });
        setIsSavingProfile(false);
        if (result.success) {
            toast.success("Medical profile updated!");
        } else {
            toast.error(result.error || "Failed to save profile");
        }
    }

    return (
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 pb-6">
            {/* Left Column: Smart Status Overview */}
            <div className="lg:col-span-4 space-y-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 h-full overflow-hidden flex flex-col">
                    <div className="bg-gradient-to-br from-primary/5 via-transparent to-transparent p-5 pb-1">
                        <div className="flex items-center justify-between gap-3 mb-1">
                            <div className="flex items-center gap-3">
                                <div className="h-10 w-10 rounded-2xl bg-primary/10 flex items-center justify-center text-primary ring-1 ring-primary/20">
                                    <ShieldAlert className="h-5 w-5" />
                                </div>
                                <div>
                                    <h3 className="text-lg font-bold text-slate-900 leading-tight">Safety Profile</h3>
                                    <p className="text-xs font-bold text-muted-foreground">Current medical summary</p>
                                </div>
                            </div>

                            <div className="bg-primary/5 px-3 py-1.5 rounded-full ring-1 ring-primary/10 flex items-center gap-2 self-start mt-1">
                                <HistoryIcon className="h-3.5 w-3.5 text-primary" />
                                <span className="text-[11px] font-bold text-slate-900 leading-tight">Recently Updated</span>
                            </div>
                        </div>
                    </div>

                    <CardContent className="p-5 pt-3 flex-1 flex flex-col gap-6">
                        {/* Allergies Block */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <AlertTriangle className="h-4 w-4 text-red-500" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Known Allergies</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group-hover:bg-red-50/30 group-hover:ring-red-100/50 transition-all duration-300">
                                {context.safetyProfile.allergies.length > 0 ? (
                                    <div className="flex flex-wrap gap-2">
                                        {context.safetyProfile.allergies.map((a: string, i: number) => (
                                            <Badge key={i} className="bg-white text-red-600 border-red-100 font-bold text-[11px] px-3 py-1 rounded-full">
                                                {a}
                                            </Badge>
                                        ))}
                                    </div>
                                ) : (
                                    <div className="flex items-center gap-2 py-1">
                                        <div className="h-1.5 w-1.5 rounded-full bg-slate-300" />
                                        <p className="text-sm font-medium text-slate-400 italic">No allergies recorded</p>
                                    </div>
                                )}
                            </div>
                        </div>

                        {/* Conditions Block */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <Activity className="h-4 w-4 text-orange-500" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Chronic Conditions</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group-hover:bg-orange-50/30 group-hover:ring-orange-100/50 transition-all duration-300">
                                {context.safetyProfile.chronic_conditions.length > 0 ? (
                                    <div className="flex flex-wrap gap-2">
                                        {context.safetyProfile.chronic_conditions.map((c: string, i: number) => (
                                            <Badge key={i} className="bg-white text-orange-600 border-orange-100 font-bold text-[11px] px-3 py-1 rounded-full">
                                                {c}
                                            </Badge>
                                        ))}
                                    </div>
                                ) : (
                                    <div className="flex items-center gap-2 py-1">
                                        <div className="h-1.5 w-1.5 rounded-full bg-slate-300" />
                                        <p className="text-sm font-medium text-slate-400 italic">No conditions recorded</p>
                                    </div>
                                )}
                            </div>
                        </div>

                        {/* Family Block */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <Users className="h-4 w-4 text-primary" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Family Health History</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group-hover:bg-primary/5 group-hover:ring-primary/10 transition-all duration-300">
                                {context.safetyProfile.family_history.length > 0 ? (
                                    <div className="flex flex-wrap gap-2">
                                        {context.safetyProfile.family_history.map((h: string, i: number) => (
                                            <Badge key={i} className="bg-white text-primary border-primary/10 font-bold text-[11px] px-3 py-1 rounded-full">
                                                {h}
                                            </Badge>
                                        ))}
                                    </div>
                                ) : (
                                    <div className="flex items-center gap-2 py-1">
                                        <div className="h-1.5 w-1.5 rounded-full bg-slate-300" />
                                        <p className="text-sm font-medium text-slate-400 italic">No family history recorded</p>
                                    </div>
                                )}
                            </div>
                        </div>
                        {/* Lifestyle Block */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <Heart className="h-4 w-4 text-rose-500" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Lifestyle & Habits</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group-hover:bg-rose-50/30 group-hover:ring-rose-100/50 transition-all duration-300">
                                {profileLifestyle.length > 0 ? (
                                    <div className="flex flex-wrap gap-2">
                                        {profileLifestyle.map((tag, i) => (
                                            <Badge key={i} className="bg-white text-rose-600 border-rose-100 font-bold text-[11px] px-3 py-1 rounded-full">
                                                {tag}
                                            </Badge>
                                        ))}
                                    </div>
                                ) : (
                                    <div className="flex items-center gap-2 py-1">
                                        <div className="h-1.5 w-1.5 rounded-full bg-slate-300" />
                                        <p className="text-sm font-medium text-slate-400 italic">No lifestyle factors recorded</p>
                                    </div>
                                )}
                            </div>
                        </div>

                    </CardContent>
                </Card>
            </div>

            {/* Right Column: Collapsible Editors */}
            <div className="lg:col-span-8 flex flex-col gap-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 overflow-hidden h-full">
                    <CardHeader className="p-5 border-b border-slate-100 bg-slate-50/30">
                        <div className="flex items-center gap-3">
                            <div className="h-10 w-10 rounded-2xl bg-white ring-1 ring-slate-200 flex items-center justify-center text-slate-600">
                                <ClipboardList className="h-5 w-5" />
                            </div>
                            <div>
                                <CardTitle className="text-lg font-bold text-slate-900 leading-tight">Patient Record Editor</CardTitle>
                                <p className="text-xs font-bold text-muted-foreground">Modify medical history and alerts</p>
                            </div>
                        </div>
                    </CardHeader>

                    <CardContent className="p-5">
                        <Accordion type="multiple" className="space-y-4">
                            {/* 1. Allergies Editor */}
                            <AccordionItem value="allergies" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-red-50 text-red-600 flex items-center justify-center">
                                            <AlertTriangle className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">1. Update Drug & Food Allergies</h4>
                                            <p className="text-xs font-bold text-muted-foreground">{profileAllergies.length} items recorded</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6 space-y-5">
                                    <div className="flex gap-2">
                                        <div className="relative flex-1">
                                            <Input
                                                placeholder="Add new allergy..."
                                                className="h-12 rounded-full bg-muted/30 border-none pl-12 pr-4 font-bold text-sm ring-1 ring-transparent focus-visible:ring-primary/20 transition-all"
                                                value={newAllergyInput}
                                                onChange={(e) => setNewAllergyInput(e.target.value)}
                                                onKeyDown={(e) => {
                                                    if (e.key === "Enter" && newAllergyInput.trim()) {
                                                        if (!profileAllergies.includes(newAllergyInput.trim())) {
                                                            setProfileAllergies([...profileAllergies, newAllergyInput.trim()]);
                                                        }
                                                        setNewAllergyInput("");
                                                    }
                                                }}
                                            />
                                            <Search className="absolute left-4 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                                        </div>
                                        <Button
                                            className="h-12 w-12 rounded-full active:scale-95 transition-all"
                                            onClick={() => {
                                                if (newAllergyInput.trim()) {
                                                    if (!profileAllergies.includes(newAllergyInput.trim())) {
                                                        setProfileAllergies([...profileAllergies, newAllergyInput.trim()]);
                                                    }
                                                    setNewAllergyInput("");
                                                }
                                            }}
                                        >
                                            <Plus className="h-5 w-5" />
                                        </Button>
                                    </div>

                                    <div className="space-y-3">
                                        <p className="text-[11px] font-bold text-muted-foreground uppercase tracking-widest ml-1">Quick Add</p>
                                        <div className="flex flex-wrap gap-2">
                                            {ALLERGY_SUGGESTIONS.map((s) => (
                                                <button
                                                    key={s}
                                                    onClick={() => !profileAllergies.includes(s) && setProfileAllergies([...profileAllergies, s])}
                                                    className="text-xs font-bold px-4 py-2 rounded-full bg-slate-50 text-slate-600 hover:bg-red-50 hover:text-red-600 ring-1 ring-slate-200 transition-all border-none"
                                                >
                                                    + {s}
                                                </button>
                                            ))}
                                        </div>
                                    </div>

                                    {profileAllergies.length > 0 && (
                                        <div className="pt-4 border-t border-slate-100">
                                            <div className="flex flex-wrap gap-2">
                                                {profileAllergies.map((allergy, i) => (
                                                    <Badge key={i} className="gap-2 pl-4 pr-1.5 py-2 rounded-full font-bold bg-white text-slate-900 ring-1 ring-red-100 transition-all hover:bg-red-50">
                                                        {allergy}
                                                        <button
                                                            onClick={() => setProfileAllergies(profileAllergies.filter((_, idx) => idx !== i))}
                                                            className="h-6 w-6 rounded-lg bg-red-50 text-red-600 flex items-center justify-center hover:bg-red-100 transition-colors"
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

                            {/* 2. Chronic Conditions Editor */}
                            <AccordionItem value="conditions" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-orange-50 text-orange-600 flex items-center justify-center">
                                            <Activity className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">2. Update Chronic Conditions</h4>
                                            <p className="text-xs font-bold text-muted-foreground">{profileConditions.length} records active</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6 space-y-5">
                                    <div className="flex gap-2">
                                        <div className="relative flex-1">
                                            <Input
                                                placeholder="Add condition (e.g., Hypertension)..."
                                                className="h-12 rounded-full bg-muted/30 border-none pl-12 pr-4 font-bold text-sm ring-1 ring-transparent focus-visible:ring-primary/20 transition-all"
                                                value={newConditionInput}
                                                onChange={(e) => setNewConditionInput(e.target.value)}
                                                onKeyDown={(e) => {
                                                    if (e.key === "Enter" && newConditionInput.trim()) {
                                                        if (!profileConditions.includes(newConditionInput.trim())) {
                                                            setProfileConditions([...profileConditions, newConditionInput.trim()]);
                                                        }
                                                        setNewConditionInput("");
                                                    }
                                                }}
                                            />
                                            <Stethoscope className="absolute left-4 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                                        </div>
                                        <Button
                                            variant="secondary"
                                            className="h-12 w-12 rounded-full active:scale-95 transition-all"
                                            onClick={() => {
                                                if (newConditionInput.trim()) {
                                                    if (!profileConditions.includes(newConditionInput.trim())) {
                                                        setProfileConditions([...profileConditions, newConditionInput.trim()]);
                                                    }
                                                    setNewConditionInput("");
                                                }
                                            }}
                                        >
                                            <Plus className="h-5 w-5" />
                                        </Button>
                                    </div>

                                    <div className="space-y-3">
                                        <p className="text-[11px] font-bold text-muted-foreground uppercase tracking-widest ml-1">Quick Select</p>
                                        <div className="flex flex-wrap gap-2">
                                            {CONDITION_SUGGESTIONS.map((s) => (
                                                <button
                                                    key={s}
                                                    onClick={() => !profileConditions.includes(s) && setProfileConditions([...profileConditions, s])}
                                                    className="text-xs font-bold px-4 py-2 rounded-full bg-slate-50 text-slate-600 hover:bg-orange-50 hover:text-orange-600 ring-1 ring-slate-200 transition-all border-none"
                                                >
                                                    + {s}
                                                </button>
                                            ))}
                                        </div>
                                    </div>

                                    {profileConditions.length > 0 && (
                                        <div className="pt-4 border-t border-slate-100">
                                            <div className="flex flex-wrap gap-2">
                                                {profileConditions.map((cond, i) => (
                                                    <Badge key={i} className="gap-2 pl-4 pr-1.5 py-2 rounded-full font-bold bg-white text-slate-900 ring-1 ring-orange-100 transition-all hover:bg-orange-50">
                                                        {cond}
                                                        <button
                                                            onClick={() => setProfileConditions(profileConditions.filter((_, idx) => idx !== i))}
                                                            className="h-6 w-6 rounded-lg bg-orange-50 text-orange-600 flex items-center justify-center hover:bg-orange-100 transition-colors"
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

                            {/* 3. Family History Editor */}
                            <AccordionItem value="family" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-primary/5 text-primary flex items-center justify-center">
                                            <Users className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">3. Update Family History</h4>
                                            <p className="text-xs font-bold text-muted-foreground">{profileFamilyHistory.length} profiles linked</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6 space-y-5">
                                    <div className="flex gap-2">
                                        <div className="relative flex-1">
                                            <Input
                                                placeholder="Add family medical history..."
                                                className="h-12 rounded-full bg-muted/30 border-none pl-12 pr-4 font-bold text-sm ring-1 ring-transparent focus-visible:ring-primary/20 transition-all"
                                                value={newFamilyInput}
                                                onChange={(e) => setNewFamilyInput(e.target.value)}
                                                onKeyDown={(e) => {
                                                    if (e.key === "Enter" && newFamilyInput.trim()) {
                                                        if (!profileFamilyHistory.includes(newFamilyInput.trim())) {
                                                            setProfileFamilyHistory([...profileFamilyHistory, newFamilyInput.trim()]);
                                                        }
                                                        setNewFamilyInput("");
                                                    }
                                                }}
                                            />
                                            <Users className="absolute left-4 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                                        </div>
                                        <Button
                                            variant="secondary"
                                            className="h-12 w-12 rounded-full active:scale-95 transition-all"
                                            onClick={() => {
                                                if (newFamilyInput.trim()) {
                                                    if (!profileFamilyHistory.includes(newFamilyInput.trim())) {
                                                        setProfileFamilyHistory([...profileFamilyHistory, newFamilyInput.trim()]);
                                                    }
                                                    setNewFamilyInput("");
                                                }
                                            }}
                                        >
                                            <Plus className="h-5 w-5" />
                                        </Button>
                                    </div>

                                    <div className="space-y-3">
                                        <div className="flex flex-wrap gap-2">
                                            {FAMILY_SUGGESTIONS.map((s) => (
                                                <button
                                                    key={s}
                                                    onClick={() => !profileFamilyHistory.includes(s) && setProfileFamilyHistory([...profileFamilyHistory, s])}
                                                    className="text-[13px] font-bold px-4 py-2 rounded-full bg-slate-50 text-slate-600 hover:bg-primary/5 hover:text-primary ring-1 ring-slate-200 transition-all border-none"
                                                >
                                                    + {s}
                                                </button>
                                            ))}
                                        </div>
                                    </div>

                                    {profileFamilyHistory.length > 0 && (
                                        <div className="pt-4 border-t border-slate-100">
                                            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
                                                {profileFamilyHistory.map((item, i) => (
                                                    <div key={i} className="flex items-center justify-between p-3 px-4 bg-slate-50 rounded-[20px] ring-1 ring-slate-100 group hover:bg-primary/5 transition-all">
                                                        <span className="text-sm font-bold text-slate-700">{item}</span>
                                                        <button
                                                            onClick={() => setProfileFamilyHistory(profileFamilyHistory.filter((_, idx) => idx !== i))}
                                                            className="h-7 w-7 rounded-lg bg-white flex items-center justify-center text-slate-400 hover:text-red-600 hover:bg-red-50 transition-all"
                                                        >
                                                            <Trash2 className="h-4 w-4" />
                                                        </button>
                                                    </div>
                                                ))}
                                            </div>
                                        </div>
                                    )}
                                </AccordionContent>
                            </AccordionItem>

                            {/* 4. Lifestyle Editor */}
                            <AccordionItem value="lifestyle" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-rose-50 text-rose-600 flex items-center justify-center">
                                            <Heart className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">4. Update Lifestyle Factors</h4>
                                            <p className="text-xs font-bold text-muted-foreground">{profileLifestyle.length} tags active</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6 space-y-5">
                                    <div className="flex gap-2">
                                        <div className="relative flex-1">
                                            <Input
                                                placeholder="Add habit or factor (e.g., Smoker, Vegetarian)..."
                                                className="h-12 rounded-full bg-muted/30 border-none pl-12 pr-4 font-bold text-sm ring-1 ring-transparent focus-visible:ring-primary/20 transition-all"
                                                value={newLifestyleInput}
                                                onChange={(e) => setNewLifestyleInput(e.target.value)}
                                                onKeyDown={(e) => {
                                                    if (e.key === "Enter" && newLifestyleInput.trim()) {
                                                        if (!profileLifestyle.includes(newLifestyleInput.trim())) {
                                                            setProfileLifestyle([...profileLifestyle, newLifestyleInput.trim()]);
                                                        }
                                                        setNewLifestyleInput("");
                                                    }
                                                }}
                                            />
                                            <Heart className="absolute left-4 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                                        </div>
                                        <Button
                                            variant="secondary"
                                            className="h-12 w-12 rounded-full active:scale-95 transition-all"
                                            onClick={() => {
                                                if (newLifestyleInput.trim()) {
                                                    if (!profileLifestyle.includes(newLifestyleInput.trim())) {
                                                        setProfileLifestyle([...profileLifestyle, newLifestyleInput.trim()]);
                                                    }
                                                    setNewLifestyleInput("");
                                                }
                                            }}
                                        >
                                            <Plus className="h-5 w-5" />
                                        </Button>
                                    </div>

                                    <div className="space-y-3">
                                        <div className="flex flex-wrap gap-2">
                                            {["Smoker", "Alcohol", "Vegetarian", "Vegan", "Sedentary", "Active", "High Stress"].map((s) => (
                                                <button
                                                    key={s}
                                                    onClick={() => !profileLifestyle.includes(s) && setProfileLifestyle([...profileLifestyle, s])}
                                                    className="text-[13px] font-bold px-4 py-2 rounded-full bg-slate-50 text-slate-600 hover:bg-rose-50 hover:text-rose-600 ring-1 ring-slate-200 transition-all border-none"
                                                >
                                                    + {s}
                                                </button>
                                            ))}
                                        </div>
                                    </div>

                                    {profileLifestyle.length > 0 && (
                                        <div className="pt-4 border-t border-slate-100">
                                            <div className="flex flex-wrap gap-2">
                                                {profileLifestyle.map((item, i) => (
                                                    <Badge key={i} className="gap-2 pl-4 pr-1.5 py-2 rounded-full font-bold bg-white text-slate-900 ring-1 ring-rose-100 transition-all hover:bg-rose-50">
                                                        {item}
                                                        <button
                                                            onClick={() => setProfileLifestyle(profileLifestyle.filter((_, idx) => idx !== i))}
                                                            className="h-6 w-6 rounded-lg bg-rose-50 text-rose-600 flex items-center justify-center hover:bg-rose-100 transition-colors"
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
                        </Accordion>
                    </CardContent>

                    <div className="p-6 border-t border-slate-100 bg-slate-50/50 mt-auto">
                        <Button
                            className="w-full h-16 rounded-full font-black text-lg transition-all active:scale-[0.98] overflow-hidden relative group"
                            onClick={handleSave}
                            disabled={isSavingProfile}
                        >
                            <div className="absolute inset-0 bg-primary translate-y-full group-hover:translate-y-0 transition-transform duration-300 -z-10" />
                            {isSavingProfile ? (
                                <div className="flex items-center gap-3">
                                    <Loader2 className="h-6 w-6 animate-spin" />
                                    <span>Updating Medical Record...</span>
                                </div>
                            ) : (
                                <div className="flex items-center justify-center gap-3 w-full">
                                    <Send className="h-6 w-6" />
                                    <span>Update Patient Profile</span>
                                    <ChevronRight className="h-5 w-5 ml-1 opacity-50 group-hover:translate-x-1 transition-transform" />
                                </div>
                            )}
                        </Button>
                    </div>
                </Card>
            </div >
        </div >
    );
}
