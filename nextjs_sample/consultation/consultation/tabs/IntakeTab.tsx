"use client";

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Button } from "@/components/ui/button";
import {
    Accordion,
    AccordionContent,
    AccordionItem,
    AccordionTrigger,
} from "@/components/ui/accordion";
import {
    Heart,
    Thermometer,
    Scale,
    Activity,
    History as HistoryIcon,
    ChevronRight,
    Send,
    ClipboardList,
    Gauge
} from "lucide-react";
import { useConsultationStore } from "@/stores/useConsultationStore";

export function IntakeTab() {
    const store = useConsultationStore();

    return (
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 pb-6">
            {/* Left Column: Smart Vitals Overview */}
            <div className="lg:col-span-4 space-y-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 h-full overflow-hidden flex flex-col">
                    <div className="bg-gradient-to-br from-primary/5 via-transparent to-transparent p-5 pb-1">
                        <div className="flex items-center justify-between gap-3 mb-1">
                            <div className="flex items-center gap-3">
                                <div className="h-10 w-10 rounded-2xl bg-primary/10 flex items-center justify-center text-primary ring-1 ring-primary/20">
                                    <Activity className="h-5 w-5" />
                                </div>
                                <div>
                                    <h3 className="text-lg font-bold text-slate-900 leading-tight">Vitals Overview</h3>
                                    <p className="text-xs font-bold text-muted-foreground">Clinical measurements</p>
                                </div>
                            </div>

                            <div className="bg-primary/5 px-3 py-1.5 rounded-full ring-1 ring-primary/10 flex items-center gap-2 self-start mt-1">
                                <HistoryIcon className="h-3.5 w-3.5 text-primary" />
                                <span className="text-[11px] font-bold text-slate-900 leading-tight whitespace-nowrap">Live Capture</span>
                            </div>
                        </div>
                    </div>

                    <CardContent className="p-5 pt-3 flex-1 flex flex-col gap-6">
                        {/* Summary Blocks Grid */}
                        <div className="grid grid-cols-2 gap-3">
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group hover:bg-red-50/30 transition-all duration-300">
                                <div className="flex items-center gap-2 mb-2 text-red-500">
                                    <Heart className="h-4 w-4" />
                                    <span className="text-[11px] font-bold uppercase tracking-wider">BP</span>
                                </div>
                                <p className="text-xl font-black text-slate-900 truncate">
                                    {store.vitals.bp || "--"}
                                    <span className="text-[10px] font-bold text-slate-400 ml-1">mmHg</span>
                                </p>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group hover:bg-orange-50/30 transition-all duration-300">
                                <div className="flex items-center gap-2 mb-2 text-orange-500">
                                    <Thermometer className="h-4 w-4" />
                                    <span className="text-[11px] font-bold uppercase tracking-wider">Temp</span>
                                </div>
                                <p className="text-xl font-black text-slate-900 truncate">
                                    {store.vitals.temp || "--"}
                                    <span className="text-[10px] font-bold text-slate-400 ml-1">°F</span>
                                </p>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group hover:bg-primary/5 transition-all duration-300">
                                <div className="flex items-center gap-2 mb-2 text-primary">
                                    <Scale className="h-4 w-4" />
                                    <span className="text-[11px] font-bold uppercase tracking-wider">Weight</span>
                                </div>
                                <p className="text-xl font-black text-slate-900 truncate">
                                    {store.vitals.weight || "--"}
                                    <span className="text-[10px] font-bold text-slate-400 ml-1">kg</span>
                                </p>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group hover:bg-emerald-50/30 transition-all duration-300">
                                <div className="flex items-center gap-2 mb-2 text-emerald-500">
                                    <Activity className="h-4 w-4" />
                                    <span className="text-[11px] font-bold uppercase tracking-wider">SpO2</span>
                                </div>
                                <p className="text-xl font-black text-slate-900 truncate">
                                    {store.vitals.spo2 || "--"}
                                    <span className="text-[10px] font-bold text-slate-400 ml-1">%</span>
                                </p>
                            </div>
                        </div>

                        {/* Quick Insight */}
                        <div className="bg-blue-50/50 rounded-[24px] p-4 ring-1 ring-blue-100 border-none">
                            <div className="flex items-center gap-3">
                                <div className="h-10 w-10 rounded-xl bg-white flex items-center justify-center text-blue-600">
                                    <Gauge className="h-5 w-5" />
                                </div>
                                <div>
                                    <p className="text-sm font-bold text-slate-900">Baseline recorded</p>
                                    <p className="text-[11px] font-bold text-blue-600/70">Ready for clinical assessment</p>
                                </div>
                            </div>
                        </div>
                    </CardContent>
                </Card>
            </div>

            {/* Right Column: Vitals Editor */}
            <div className="lg:col-span-8 flex flex-col gap-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 overflow-hidden h-full">
                    <CardHeader className="p-5 border-b border-slate-100 bg-slate-50/30">
                        <div className="flex items-center gap-3">
                            <div className="h-10 w-10 rounded-2xl bg-white ring-1 ring-slate-200 flex items-center justify-center text-slate-600">
                                <ClipboardList className="h-5 w-5" />
                            </div>
                            <div>
                                <CardTitle className="text-lg font-bold text-slate-900 leading-tight">Patient Intake Editor</CardTitle>
                                <p className="text-xs font-bold text-muted-foreground">Register daily vitals and observations</p>
                            </div>
                        </div>
                    </CardHeader>

                    <CardContent className="p-5">
                        <Accordion type="multiple" defaultValue={["vitals"]} className="space-y-4">
                            <AccordionItem value="vitals" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-orange-50 text-orange-600 flex items-center justify-center">
                                            <Gauge className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">1. Patient Vital Signs</h4>
                                            <p className="text-xs font-bold text-muted-foreground">BP, Temp, Weight and Oxygen</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6">
                                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
                                        <div className="space-y-2.5">
                                            <Label className="flex items-center gap-2 text-sm font-bold text-slate-700 ml-1">
                                                <Heart className="h-4 w-4 text-red-500" /> Blood Pressure
                                            </Label>
                                            <Input
                                                placeholder="e.g. 120/80"
                                                className="h-14 rounded-full bg-muted/30 border-none px-6 font-bold text-sm ring-1 ring-transparent focus-visible:ring-primary/20 transition-all"
                                                value={store.vitals.bp}
                                                onChange={(e) => store.setVitals({ bp: e.target.value })}
                                            />
                                        </div>
                                        <div className="space-y-2.5">
                                            <Label className="flex items-center gap-2 text-sm font-bold text-slate-700 ml-1">
                                                <Thermometer className="h-4 w-4 text-orange-500" /> Temperature
                                            </Label>
                                            <Input
                                                placeholder="e.g. 98.6°F"
                                                className="h-14 rounded-full bg-muted/30 border-none px-6 font-bold text-sm ring-1 ring-transparent focus-visible:ring-primary/20 transition-all"
                                                value={store.vitals.temp}
                                                onChange={(e) => store.setVitals({ temp: e.target.value })}
                                            />
                                        </div>
                                        <div className="space-y-2.5">
                                            <Label className="flex items-center gap-2 text-sm font-bold text-slate-700 ml-1">
                                                <Scale className="h-4 w-4 text-primary" /> Body Weight
                                            </Label>
                                            <Input
                                                placeholder="e.g. 70 kg"
                                                className="h-14 rounded-full bg-muted/30 border-none px-6 font-bold text-sm ring-1 ring-transparent focus-visible:ring-primary/20 transition-all"
                                                value={store.vitals.weight}
                                                onChange={(e) => store.setVitals({ weight: e.target.value })}
                                            />
                                        </div>
                                        <div className="space-y-2.5">
                                            <Label className="flex items-center gap-2 text-sm font-bold text-slate-700 ml-1">
                                                <Activity className="h-4 w-4 text-emerald-500" /> Oxygen Saturation
                                            </Label>
                                            <Input
                                                placeholder="e.g. 98%"
                                                className="h-14 rounded-full bg-muted/30 border-none px-6 font-bold text-sm ring-1 ring-transparent focus-visible:ring-primary/20 transition-all"
                                                value={store.vitals.spo2}
                                                onChange={(e) => store.setVitals({ spo2: e.target.value })}
                                            />
                                        </div>
                                    </div>
                                </AccordionContent>
                            </AccordionItem>
                        </Accordion>
                    </CardContent>

                </Card>
            </div>
        </div>
    );
}
