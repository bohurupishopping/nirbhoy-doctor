"use client";

import { useState, useEffect } from "react";
import { Dialog, DialogContent, DialogHeader, DialogTitle } from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";
import {
    Pill,
    Plus,
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
import { MedicineSearchResult } from "@/lib/actions/doctor";

interface MedicineSigModalProps {
    open: boolean;
    onOpenChange: (open: boolean) => void;
    medicine: MedicineSearchResult | null;
    initialSig?: { frequency: string; duration: string; instruction: string; special_instructions?: string };
    onAdd: (data: { frequency: string; duration: string; instruction: string; special_instructions?: string; composition?: string }) => void;
}

const FREQUENCY_OPTIONS = ["1-0-1", "1-0-0", "0-0-1", "1-1-1", "SOS"];
const DURATION_OPTIONS = ["3 Days", "5 Days", "7 Days", "10 Days", "15 Days", "1 Month"];
const INSTRUCTION_OPTIONS = ["After Food", "Before Food", "With Water", "Empty Stomach", "At Bedtime"];

export function MedicineSigModal({ open, onOpenChange, medicine, initialSig, onAdd }: MedicineSigModalProps) {
    const [frequency, setFrequency] = useState("");
    const [duration, setDuration] = useState("");
    const [instruction, setInstruction] = useState("After Food");
    const [specialInstructions, setSpecialInstructions] = useState("");

    // Reset state when modal opens
    useEffect(() => {
        if (open) {
            setFrequency(initialSig?.frequency || "");
            setDuration(initialSig?.duration || "");
            setInstruction(initialSig?.instruction || "After Food");
            setSpecialInstructions(initialSig?.special_instructions || "");
        }
    }, [open, initialSig]);

    if (!medicine) return null;

    const handleAdd = () => {
        if (!frequency || !duration) return;
        onAdd({
            frequency,
            duration,
            instruction,
            special_instructions: specialInstructions,
            composition: medicine.generic_name
        });
        onOpenChange(false);
    };

    return (
        <Dialog open={open} onOpenChange={onOpenChange}>
            <DialogContent className="max-w-lg p-0 overflow-hidden rounded-[2rem] border-none shadow-2xl">
                <DialogHeader className="px-5 py-4 bg-muted/30 border-b border-border/50">
                    <div className="flex items-center gap-3">
                        <div className="h-10 w-10 rounded-2xl bg-primary/10 flex items-center justify-center text-primary border border-primary/20">
                            <Pill size={20} />
                        </div>
                        <div>
                            <DialogTitle className="text-xl font-bold tracking-tight text-slate-900 leading-none">
                                Prescription Preview
                            </DialogTitle>
                            {medicine.strength && (
                                <p className="text-xs font-bold text-muted-foreground mt-0.5">
                                    {medicine.strength} • {medicine.generic_name}
                                </p>
                            )}
                        </div>
                    </div>
                </DialogHeader>

                <div className="p-5 space-y-4">
                    {/* Frequency */}
                    <div className="space-y-2">
                        <Label className="text-xs font-bold text-muted-foreground ml-1">Frequency</Label>
                        <div className="flex flex-wrap gap-1.5">
                            {FREQUENCY_OPTIONS.map((f) => (
                                <Button
                                    key={f}
                                    variant={frequency === f ? "default" : "outline"}
                                    size="sm"
                                    className="rounded-full px-4 h-8 text-xs font-bold transition-all"
                                    onClick={() => setFrequency(f)}
                                >
                                    {f}
                                </Button>
                            ))}
                        </div>
                        <Input
                            placeholder="Or type custom frequency..."
                            className="bg-background/50 h-9 text-sm rounded-xl border-border/50"
                            value={frequency}
                            onChange={(e) => setFrequency(e.target.value)}
                        />
                    </div>

                    {/* Duration */}
                    <div className="space-y-2">
                        <Label className="text-xs font-bold text-muted-foreground ml-1">Duration</Label>
                        <div className="flex flex-wrap gap-1.5">
                            {DURATION_OPTIONS.map((d) => (
                                <Button
                                    key={d}
                                    variant={duration === d ? "default" : "outline"}
                                    size="sm"
                                    className="rounded-full px-4 h-8 text-xs font-bold transition-all"
                                    onClick={() => setDuration(d)}
                                >
                                    {d}
                                </Button>
                            ))}
                        </div>
                        <Input
                            placeholder="Or type custom duration..."
                            className="bg-background/50 h-9 text-sm rounded-xl border-border/50"
                            value={duration}
                            onChange={(e) => setDuration(e.target.value)}
                        />
                    </div>

                    {/* Instructions */}
                    <div className="space-y-2">
                        <Label className="text-xs font-bold text-muted-foreground ml-1">Instructions</Label>
                        <div className="flex flex-wrap gap-1.5">
                            {INSTRUCTION_OPTIONS.map((ins) => (
                                <Button
                                    key={ins}
                                    variant={instruction === ins ? "default" : "outline"}
                                    size="sm"
                                    className="rounded-full px-4 h-8 text-xs font-bold transition-all"
                                    onClick={() => setInstruction(ins)}
                                >
                                    {ins}
                                </Button>
                            ))}
                        </div>
                        <Input
                            placeholder="Or type custom instructions..."
                            className="bg-background/50 h-9 text-sm rounded-xl border-border/50"
                            value={instruction}
                            onChange={(e) => setInstruction(e.target.value)}
                        />
                    </div>

                    {/* Special Instructions */}
                    <div className="space-y-2">
                        <Label className="text-xs font-bold text-muted-foreground ml-1">Note / Special Instructions</Label>
                        <Input
                            placeholder="Usage notes (e.g. mix with hot water)..."
                            className="bg-background/50 h-9 text-sm rounded-xl border-border/50"
                            value={specialInstructions}
                            onChange={(e) => setSpecialInstructions(e.target.value)}
                        />
                    </div>

                    <Button
                        className="w-full mt-2 rounded-full h-12 font-bold text-base shadow-lg shadow-primary/20"
                        onClick={handleAdd}
                        disabled={!frequency || !duration}
                    >
                        <Plus size={18} className="mr-2" />
                        {initialSig ? "Update Prescription" : "Add to Prescription"}
                    </Button>
                </div>
            </DialogContent>
        </Dialog>
    );
}
