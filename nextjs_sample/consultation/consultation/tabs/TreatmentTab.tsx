"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
    Pill,
    X,
    Plus,
    Search,
    Loader2,
    Save,
    Trash2,
    User,
    Send,
    Edit2,
    History as HistoryIcon,
    ChevronRight,
    ClipboardList,
    Activity,
    FolderSync
} from "lucide-react";
import { toast } from "sonner";
import { MedicineSearchResult, searchMedicines, ConsultationContext } from "@/lib/actions/doctor";
import { useConsultationStore } from "@/stores/useConsultationStore";
import { MedicineSigModal } from "../MedicineSigModal";
import { AddMedicineDialog } from "../AddMedicineDialog";

interface TreatmentTabProps {
    context: ConsultationContext;
}

const RECENT_MEDS_KEY = "doctor_recent_meds";

export function TreatmentTab({ context }: TreatmentTabProps) {
    const store = useConsultationStore();

    const [medSearchQuery, setMedSearchQuery] = useState("");
    const [medSearchResults, setMedSearchResults] = useState<MedicineSearchResult[]>([]);
    const [isSearching, setIsSearching] = useState(false);
    const [showMedDropdown, setShowMedDropdown] = useState(false);
    const [recentMeds, setRecentMeds] = useState<MedicineSearchResult[]>([]);

    const [selectedMed, setSelectedMed] = useState<MedicineSearchResult | null>(null);
    const [editingMedId, setEditingMedId] = useState<string | null>(null);
    const [showAddMedDialog, setShowAddMedDialog] = useState(false);

    // Load recent meds
    useEffect(() => {
        try {
            const stored = localStorage.getItem(RECENT_MEDS_KEY);
            if (stored) setRecentMeds(JSON.parse(stored).slice(0, 15));
        } catch {/* ignore */ }
    }, []);

    // Medicine search with debounce
    useEffect(() => {
        if (medSearchQuery.length < 2) {
            setMedSearchResults([]);
            return;
        }
        setIsSearching(true);
        const timer = setTimeout(async () => {
            const results = await searchMedicines(medSearchQuery);
            if (!("error" in results)) setMedSearchResults(results);
            setIsSearching(false);
        }, 300);
        return () => clearTimeout(timer);
    }, [medSearchQuery]);

    function handleSelectMedicine(med: MedicineSearchResult) {
        const hasAllergy = context.safetyProfile.allergies.some(
            (allergy) =>
                med.brand_name.toLowerCase().includes(allergy.toLowerCase()) ||
                med.generic_name?.toLowerCase().includes(allergy.toLowerCase())
        );
        if (hasAllergy) {
            toast.error(`⚠️ SAFETY WARNING: Patient may be allergic to ${med.brand_name}!`, { duration: 5000 });
        }
        setSelectedMed(med);
        setShowMedDropdown(false);
    }

    function handleAddMedicine(sig: { frequency: string; duration: string; instruction: string; special_instructions?: string; composition?: string }) {
        if (!selectedMed) return;

        if (editingMedId) {
            store.updateMedicine(editingMedId, {
                frequency: sig.frequency,
                duration: sig.duration,
                instruction: sig.instruction,
                special_instructions: sig.special_instructions,
                composition: sig.composition
            });
            setEditingMedId(null);
        } else {
            const displayName = selectedMed.strength
                ? `${selectedMed.brand_name} ${selectedMed.strength}`
                : selectedMed.brand_name;

            store.addMedicine({
                master_id: selectedMed.id,
                name: displayName,
                frequency: sig.frequency,
                duration: sig.duration,
                instruction: sig.instruction,
                special_instructions: sig.special_instructions,
                composition: sig.composition || selectedMed.generic_name // Use val from modal or fallback
            });

            const updated = [selectedMed, ...recentMeds.filter((m) => m.id !== selectedMed.id)].slice(0, 15);
            setRecentMeds(updated);
            try { localStorage.setItem(RECENT_MEDS_KEY, JSON.stringify(updated)); } catch {/* ignore */ }
        }

        setSelectedMed(null);
        setMedSearchQuery("");
    }

    function handleEditMedicine(med: any) {
        setSelectedMed({
            id: med.master_id || "",
            brand_name: med.name,
            strength: "",
            generic_name: "",
            type: "Capsule",
        } as MedicineSearchResult);
        setEditingMedId(med.temp_id);
    }

    return (
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 pb-6">
            {/* Left Column: Smart Medication Overview */}
            <div className="lg:col-span-4 space-y-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 h-full overflow-hidden flex flex-col">
                    <div className="bg-gradient-to-br from-primary/5 via-transparent to-transparent p-5 pb-1">
                        <div className="flex items-center justify-between gap-3 mb-1">
                            <div className="flex items-center gap-3">
                                <div className="h-10 w-10 rounded-2xl bg-primary/10 flex items-center justify-center text-primary ring-1 ring-primary/20">
                                    <Pill className="h-5 w-5" />
                                </div>
                                <div>
                                    <h3 className="text-lg font-bold text-slate-900 leading-tight">Rx Overview</h3>
                                    <p className="text-xs font-bold text-muted-foreground">Medication summary</p>
                                </div>
                            </div>

                            <div className="bg-primary/5 px-3 py-1.5 rounded-full ring-1 ring-primary/10 flex items-center gap-2 self-start mt-1">
                                <HistoryIcon className="h-3.5 w-3.5 text-primary" />
                                <span className="text-[11px] font-bold text-slate-900 leading-tight whitespace-nowrap">Prescription Active</span>
                            </div>
                        </div>
                    </div>

                    <CardContent className="p-5 pt-3 flex-1 flex flex-col gap-6">
                        {/* Summary Block */}
                        <div className="bg-slate-50/50 rounded-[24px] p-5 ring-1 ring-slate-100 group hover:bg-primary/5 transition-all duration-300">
                            <div className="flex items-center gap-2 mb-3 text-primary">
                                <Activity className="h-4 w-4" />
                                <span className="text-[11px] font-bold uppercase tracking-wider">Prescribed Items</span>
                            </div>
                            <p className="text-3xl font-black text-slate-900">{store.medicines.length}</p>
                            <p className="text-xs font-bold text-muted-foreground mt-1">Active medications in list</p>
                        </div>

                        {/* Recent Brands */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <HistoryIcon className="h-4 w-4 text-orange-500" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Frequently Prescribed</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[28px] p-4 ring-1 ring-slate-100 group-hover:bg-orange-50/30 group-hover:ring-orange-100/50 transition-all duration-300">
                                {recentMeds.length > 0 ? (
                                    <div className="flex flex-wrap gap-2">
                                        {recentMeds.slice(0, 8).map((med) => (
                                            <button
                                                key={med.id}
                                                onClick={() => handleSelectMedicine(med)}
                                                className="text-xs font-bold px-3 py-1.5 rounded-full bg-white text-slate-600 hover:bg-primary/10 hover:text-primary ring-1 ring-slate-200 transition-all border-none"
                                            >
                                                + {med.brand_name}
                                            </button>
                                        ))}
                                    </div>
                                ) : (
                                    <p className="text-sm font-medium text-slate-400 italic py-2">No recent medications</p>
                                )}
                            </div>
                        </div>

                    </CardContent>
                </Card>
            </div>

            {/* Right Column: Prescription Engine */}
            <div className="lg:col-span-8 flex flex-col gap-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 overflow-hidden h-full">
                    <CardHeader className="p-5 border-b border-slate-100 bg-slate-50/30 flex items-center justify-between flex-row">
                        <div className="flex items-center gap-3">
                            <div className="h-10 w-10 rounded-2xl bg-white ring-1 ring-slate-200 flex items-center justify-center text-slate-600">
                                <ClipboardList className="h-5 w-5" />
                            </div>
                            <div>
                                <CardTitle className="text-lg font-bold text-slate-900 leading-tight">Prescription Engine</CardTitle>
                                <p className="text-xs font-bold text-muted-foreground">Search and manage patient medications</p>
                            </div>
                        </div>
                        <Button
                            variant="outline"
                            size="sm"
                            className="h-9 px-3 gap-2 rounded-full border-primary/20 bg-primary/5 text-primary hover:bg-primary/10 hover:text-primary transition-all"
                            onClick={() => {
                                setMedSearchQuery("");
                                setShowAddMedDialog(true);
                            }}
                        >
                            <Plus className="h-4 w-4" />
                            <span className="text-xs font-bold">New Medicine</span>
                        </Button>
                    </CardHeader>

                    <CardContent className="p-5 space-y-6">
                        {/* Search Area */}
                        <div className="relative">
                            <div className="relative">
                                <Search className="absolute left-4 top-1/2 -translate-y-1/2 h-5 w-5 text-muted-foreground" />
                                <Input
                                    placeholder="Search brands or generic (e.g. Paracetamol)..."
                                    className="h-14 rounded-full bg-muted/30 border-none pl-12 pr-12 font-bold text-sm ring-1 ring-transparent focus-visible:ring-primary/20 transition-all"
                                    value={medSearchQuery}
                                    onChange={(e) => setMedSearchQuery(e.target.value)}
                                    onFocus={() => setShowMedDropdown(true)}
                                />
                                <div className="absolute right-3 top-1/2 -translate-y-1/2 flex items-center gap-1">
                                    {isSearching && (
                                        <Loader2 className="h-5 w-5 animate-spin text-primary" />
                                    )}
                                    {medSearchQuery && (
                                        <Button
                                            variant="ghost"
                                            size="icon"
                                            className="h-9 w-9 rounded-full hover:bg-background/50"
                                            onClick={() => {
                                                setMedSearchQuery("");
                                                setMedSearchResults([]);
                                                setShowMedDropdown(false);
                                            }}
                                        >
                                            <X className="h-5 w-5" />
                                        </Button>
                                    )}
                                </div>
                            </div>

                            {showMedDropdown && medSearchQuery.length >= 2 && (
                                <div className="absolute z-50 w-full mt-3 bg-white border-none ring-1 ring-border/50 rounded-[32px] overflow-hidden animate-in fade-in zoom-in-95">
                                    <div className="max-h-[350px] overflow-auto py-2">
                                        {medSearchResults.length > 0 ? (
                                            medSearchResults.map((med) => (
                                                <button
                                                    key={med.id}
                                                    className="w-full px-6 py-4 text-left hover:bg-muted/50 transition-colors group border-b border-slate-50 last:border-none"
                                                    onClick={() => handleSelectMedicine(med)}
                                                >
                                                    <div className="flex flex-col">
                                                        <div className="flex items-center justify-between">
                                                            <span className="font-bold text-lg group-hover:text-primary transition-colors">{med.brand_name}</span>
                                                            {med.strength && <span className="text-xs font-black text-muted-foreground bg-slate-100 px-3 py-1 rounded-full uppercase tracking-tighter">{med.strength}</span>}
                                                        </div>
                                                        {med.generic_name && <p className="text-[13px] text-muted-foreground font-bold mt-1 line-clamp-1">{med.generic_name}</p>}
                                                    </div>
                                                </button>
                                            ))
                                        ) : (
                                            !isSearching && (
                                                <div className="px-5 py-6 text-center">
                                                    <p className="text-sm font-bold text-muted-foreground mb-3">No medicines found</p>
                                                    <Button
                                                        variant="outline"
                                                        size="sm"
                                                        className="gap-2 rounded-full border-primary/20 hover:bg-primary/5 hover:text-primary"
                                                        onClick={() => {
                                                            setShowMedDropdown(false);
                                                            setShowAddMedDialog(true);
                                                        }}
                                                    >
                                                        <Plus className="h-4 w-4" />
                                                        Create "{medSearchQuery}"
                                                    </Button>
                                                </div>
                                            )
                                        )}
                                    </div>
                                    <button
                                        className="w-full py-4 text-sm font-black text-primary hover:bg-primary/5 border-t border-slate-50 transition-colors uppercase tracking-widest"
                                        onClick={() => setShowMedDropdown(false)}
                                    >
                                        Close Search
                                    </button>
                                </div>
                            )}
                        </div>

                        {/* Prescription List */}
                        <div className="space-y-4">
                            <div className="flex items-center justify-between px-1">
                                <Label className="text-[11px] font-black text-muted-foreground uppercase tracking-widest">Current List ({store.medicines.length})</Label>
                            </div>

                            {store.medicines.length > 0 ? (
                                <div className="space-y-3">
                                    {store.medicines.map((med) => (
                                        <div
                                            key={med.temp_id}
                                            className="relative flex items-center justify-between p-4 bg-slate-50/50 ring-1 ring-slate-100 rounded-[28px] hover:bg-white hover:ring-primary/20 transition-all duration-300 group"
                                        >
                                            <div className="flex items-center gap-4 flex-1 min-w-0">
                                                <div className="h-12 w-12 rounded-2xl bg-white flex items-center justify-center text-primary ring-1 ring-slate-200 group-hover:ring-primary/20 transition-all">
                                                    <Pill className="h-6 w-6" />
                                                </div>
                                                <div className="flex-1 min-w-0">
                                                    <p className="font-bold text-base text-slate-900 truncate leading-tight">{med.name}</p>
                                                    <div className="flex flex-wrap items-center gap-2 mt-2">
                                                        <Badge className="bg-primary/10 text-primary border-none text-[10px] font-bold px-3 py-0.5 rounded-full uppercase">
                                                            {med.frequency}
                                                        </Badge>
                                                        <div className="h-1 w-1 rounded-full bg-slate-300" />
                                                        <span className="text-xs font-bold text-slate-500">{med.duration}</span>
                                                        {med.instruction && (
                                                            <>
                                                                <div className="h-1 w-1 rounded-full bg-slate-300" />
                                                                <span className="text-xs font-bold text-slate-400 truncate max-w-[150px] italic">{med.instruction}</span>
                                                            </>
                                                        )}
                                                    </div>
                                                </div>
                                            </div>

                                            <div className="flex items-center gap-2 ml-4">
                                                <Button
                                                    variant="ghost"
                                                    size="icon"
                                                    className="rounded-full h-10 w-10 bg-white ring-1 ring-slate-200 hover:text-primary transition-all active:scale-90"
                                                    onClick={() => handleEditMedicine(med)}
                                                >
                                                    <Edit2 className="h-4 w-4" />
                                                </Button>
                                                <Button
                                                    variant="ghost"
                                                    size="icon"
                                                    className="rounded-full h-10 w-10 bg-white ring-1 ring-slate-200 hover:text-red-600 transition-all active:scale-90"
                                                    onClick={() => store.removeMedicine(med.temp_id)}
                                                >
                                                    <X className="h-4 w-4" />
                                                </Button>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            ) : (
                                <div className="py-16 flex flex-col items-center justify-center text-center bg-slate-50/30 rounded-[40px] border-2 border-dashed border-slate-100">
                                    <div className="h-16 w-16 rounded-[22px] bg-white ring-1 ring-slate-100 flex items-center justify-center text-slate-200 mb-4">
                                        <Pill className="h-8 w-8" />
                                    </div>
                                    <p className="text-sm font-bold text-slate-400">Search and add medications above</p>
                                </div>
                            )}
                        </div>
                    </CardContent>

                </Card>
            </div>

            {/* Sig Modal Wrapper */}
            <MedicineSigModal
                open={!!selectedMed}
                onOpenChange={(open) => {
                    if (!open) {
                        setSelectedMed(null);
                        setEditingMedId(null);
                    }
                }}
                medicine={selectedMed}
                initialSig={editingMedId ? store.medicines.find(m => m.temp_id === editingMedId) : undefined}

                onAdd={handleAddMedicine}
            />

            <AddMedicineDialog
                open={showAddMedDialog}
                onOpenChange={setShowAddMedDialog}
                onSuccess={handleSelectMedicine}
                initialName={medSearchQuery}
            />

        </div>
    );
}
