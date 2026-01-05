"use client";

import { useState } from "react";
import { Dialog, DialogContent, DialogDescription, DialogFooter, DialogHeader, DialogTitle } from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Loader2, Plus } from "lucide-react";
import { toast } from "sonner";
import { createMedicine, CreateMedicinePayload } from "@/lib/actions/doctor";

interface AddMedicineDialogProps {
    open: boolean;
    onOpenChange: (open: boolean) => void;
    onSuccess: (med: any) => void;
    initialName?: string;
}

export function AddMedicineDialog({ open, onOpenChange, onSuccess, initialName = "" }: AddMedicineDialogProps) {
    const [isLoading, setIsLoading] = useState(false);
    const [formData, setFormData] = useState<CreateMedicinePayload>({
        name: initialName,
        manufacturer_name: "",
        salt_composition: "",
        short_composition1: "",
        short_composition2: "",
        pack_size_label: "",
        price: undefined,
        type: "Tablet",
        medicine_desc: "",
        side_effects: ""
    });

    const handleChange = (field: keyof CreateMedicinePayload, value: any) => {
        setFormData(prev => ({ ...prev, [field]: value }));
    };

    const handleSubmit = async () => {
        if (!formData.name) {
            toast.error("Medicine name is required");
            return;
        }

        setIsLoading(true);
        try {
            const result = await createMedicine(formData);
            if (result.error) {
                toast.error(result.error);
            } else {
                toast.success("Medicine created successfully");

                // key logic: combine short_compositions to form display generic info, or fallback
                let genericDisplay = formData.short_composition1 || "";
                if (formData.short_composition2) {
                    genericDisplay = genericDisplay
                        ? `${genericDisplay} + ${formData.short_composition2}`
                        : formData.short_composition2;
                }

                onSuccess({
                    id: result.id,
                    brand_name: formData.name,
                    generic_name: genericDisplay,
                    strength: formData.pack_size_label,
                    type: formData.type
                });
                onOpenChange(false);
                // Reset form
                setFormData({
                    name: "",
                    manufacturer_name: "",
                    salt_composition: "",
                    short_composition1: "",
                    short_composition2: "",
                    pack_size_label: "",
                    price: undefined,
                    type: "Tablet",
                    medicine_desc: "",
                    side_effects: ""
                });
            }
        } catch (e) {
            toast.error("An unexpected error occurred");
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <Dialog open={open} onOpenChange={onOpenChange}>
            <DialogContent className="sm:max-w-[600px] max-h-[90vh] overflow-y-auto">
                <DialogHeader>
                    <DialogTitle>Add New Medicine</DialogTitle>
                    <DialogDescription>
                        Create a new medicine entry in the master database.
                        This will be available for all doctors to prescribe.
                    </DialogDescription>
                </DialogHeader>

                <div className="grid gap-4 py-4">
                    <div className="grid grid-cols-2 gap-4">
                        <div className="space-y-2 col-span-2">
                            <Label htmlFor="name">Medicine Name <span className="text-red-500">*</span></Label>
                            <Input
                                id="name"
                                value={formData.name}
                                onChange={(e) => handleChange("name", e.target.value)}
                                placeholder="e.g. Dolo 650"
                            />
                        </div>

                        <div className="space-y-2">
                            <Label htmlFor="type">Type</Label>
                            <Select
                                value={formData.type}
                                onValueChange={(val) => handleChange("type", val)}
                            >
                                <SelectTrigger>
                                    <SelectValue placeholder="Select type" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="Tablet">Tablet</SelectItem>
                                    <SelectItem value="Capsule">Capsule</SelectItem>
                                    <SelectItem value="Syrup">Syrup</SelectItem>
                                    <SelectItem value="Injection">Injection</SelectItem>
                                    <SelectItem value="Cream">Cream</SelectItem>
                                    <SelectItem value="Drop">Drop</SelectItem>
                                    <SelectItem value="Inhaler">Inhaler</SelectItem>
                                    <SelectItem value="Sachet">Sachet</SelectItem>
                                    <SelectItem value="Other">Other</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>

                        <div className="space-y-2">
                            <Label htmlFor="pack_size">Pack Size / Strength</Label>
                            <Input
                                id="pack_size"
                                value={formData.pack_size_label || ""}
                                onChange={(e) => handleChange("pack_size_label", e.target.value)}
                                placeholder="e.g. 650mg or 100ml"
                            />
                        </div>
                    </div>

                    <div className="grid grid-cols-2 gap-4">
                        <div className="space-y-2">
                            <Label htmlFor="comp1">Composition 1</Label>
                            <Input
                                id="comp1"
                                value={formData.short_composition1 || ""}
                                onChange={(e) => handleChange("short_composition1", e.target.value)}
                                placeholder="e.g. Paracetamol 500mg"
                            />
                        </div>
                        <div className="space-y-2">
                            <Label htmlFor="comp2">Composition 2 (Optional)</Label>
                            <Input
                                id="comp2"
                                value={formData.short_composition2 || ""}
                                onChange={(e) => handleChange("short_composition2", e.target.value)}
                                placeholder="e.g. Caffeine 30mg"
                            />
                        </div>
                    </div>

                    <div className="space-y-2">
                        <Label htmlFor="desc">Description / Notes</Label>
                        <Textarea
                            id="desc"
                            value={formData.medicine_desc || ""}
                            onChange={(e) => handleChange("medicine_desc", e.target.value)}
                            placeholder="Optional notes about the medicine..."
                            className="h-20"
                        />
                    </div>
                </div>

                <DialogFooter>
                    <Button variant="outline" onClick={() => onOpenChange(false)}>Cancel</Button>
                    <Button onClick={handleSubmit} disabled={isLoading} className="gap-2">
                        {isLoading ? <Loader2 className="h-4 w-4 animate-spin" /> : <Plus className="h-4 w-4" />}
                        Create Medicine
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    );
}
