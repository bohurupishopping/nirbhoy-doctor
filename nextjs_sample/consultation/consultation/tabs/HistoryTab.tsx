"use client";

import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import {
    Accordion,
    AccordionContent,
    AccordionItem,
    AccordionTrigger,
} from "@/components/ui/accordion";
import { Button } from "@/components/ui/button";
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from "@/components/ui/dialog";
import { ScrollArea } from "@/components/ui/scroll-area";
import {
    History as HistoryIcon,
    FileText,
    Library,
    Clock,
    ExternalLink,
    Eye,
    ChevronRight,
    Users,
    Stethoscope,
    Calendar,
    FolderOpen,
    ShieldCheck,
    Activity,
    Heart
} from "lucide-react";
import { ConsultationContext } from "@/lib/actions/doctor";
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from 'recharts';

interface HistoryTabProps {
    context: ConsultationContext;
}

export function HistoryTab({ context }: HistoryTabProps) {
    const totalVisits = context.visitHistory?.length || 0;
    const totalDocs = context.documents?.length || 0;

    const [selectedVisit, setSelectedVisit] = useState<any>(null);

    return (
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 pb-6">
            {/* Left Column: Smart History Overview */}
            <div className="lg:col-span-4 space-y-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 h-full overflow-hidden flex flex-col">
                    <div className="bg-gradient-to-br from-primary/5 via-transparent to-transparent p-5 pb-1">
                        <div className="flex items-center justify-between gap-3 mb-1">
                            <div className="flex items-center gap-3">
                                <div className="h-10 w-10 rounded-2xl bg-primary/10 flex items-center justify-center text-primary ring-1 ring-primary/20">
                                    <Library className="h-5 w-5" />
                                </div>
                                <div>
                                    <h3 className="text-lg font-bold text-slate-900 leading-tight">History Archive</h3>
                                    <p className="text-xs font-bold text-muted-foreground">Historical records lookup</p>
                                </div>
                            </div>

                            <div className="bg-emerald-50 px-3 py-1.5 rounded-full ring-1 ring-emerald-100 flex items-center gap-2 self-start mt-1">
                                <ShieldCheck className="h-3.5 w-3.5 text-emerald-600" />
                                <span className="text-[11px] font-bold text-emerald-900 leading-tight whitespace-nowrap">Encrypted Storage</span>
                            </div>
                        </div>
                    </div>

                    <CardContent className="p-5 pt-3 flex-1 flex flex-col gap-6">
                        {/* Summary Stats */}
                        <div className="grid grid-cols-2 gap-3">
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100">
                                <div className="flex items-center gap-2 mb-2 text-primary">
                                    <Clock className="h-4 w-4" />
                                    <span className="text-[11px] font-bold uppercase tracking-wider">Visits</span>
                                </div>
                                <p className="text-xl font-black text-slate-900">{totalVisits}</p>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100">
                                <div className="flex items-center gap-2 mb-2 text-indigo-600">
                                    <FileText className="h-4 w-4" />
                                    <span className="text-[11px] font-bold uppercase tracking-wider">Files</span>
                                </div>
                                <p className="text-xl font-black text-slate-900">{totalDocs}</p>
                            </div>
                        </div>

                        {/* Vitals Trend Chart */}
                        {context.vitalsTrend && context.vitalsTrend.length > 0 && (
                            <div className="relative group">
                                <div className="flex items-center gap-2 mb-3">
                                    <Activity className="h-4 w-4 text-emerald-500" />
                                    <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Vitals Trend</span>
                                </div>
                                <div className="bg-white rounded-[24px] p-4 ring-1 ring-slate-100 h-[220px] w-full">
                                    <ResponsiveContainer width="100%" height="100%">
                                        <LineChart data={context.vitalsTrend.slice(-5)}> {/* Show last 5 points */}
                                            <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#f1f5f9" />
                                            <XAxis
                                                dataKey="date"
                                                tickFormatter={(value) => new Date(value).toLocaleDateString("en-IN", { day: "numeric", month: "short" })}
                                                tick={{ fontSize: 10, fill: '#94a3b8' }}
                                                axisLine={false}
                                                tickLine={false}
                                                dy={10}
                                            />
                                            <YAxis hide domain={['auto', 'auto']} />
                                            <Tooltip
                                                contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: 'none' }}
                                                labelStyle={{ fontSize: '11px', fontWeight: 'bold', color: '#64748b', marginBottom: '4px' }}
                                            />
                                            <Line
                                                type="monotone"
                                                dataKey="weight"
                                                stroke="#3b82f6"
                                                strokeWidth={2}
                                                dot={{ r: 3, fill: '#3b82f6', strokeWidth: 0 }}
                                                name="Weight (kg)"
                                            />
                                            <Line
                                                type="monotone"
                                                dataKey="temp"
                                                stroke="#f43f5e"
                                                strokeWidth={2}
                                                dot={{ r: 3, fill: '#f43f5e', strokeWidth: 0 }}
                                                name="Temp (°F)"
                                            />
                                        </LineChart>
                                    </ResponsiveContainer>
                                </div>
                            </div>
                        )}

                        {/* Recent Visit Insight */}
                        <div className="relative group">
                            <div className="flex items-center gap-2 mb-3">
                                <Calendar className="h-4 w-4 text-orange-500" />
                                <span className="text-sm font-bold text-muted-foreground uppercase tracking-wider">Latest Record</span>
                            </div>
                            <div className="bg-slate-50/50 rounded-[24px] p-4 ring-1 ring-slate-100 group-hover:bg-orange-50/30 group-hover:ring-orange-100/50 transition-all duration-300">
                                {totalVisits > 0 ? (
                                    <div>
                                        <p className="text-sm font-bold text-slate-900">
                                            {new Date(context.visitHistory[0].date).toLocaleDateString("en-IN", {
                                                day: "numeric",
                                                month: "short",
                                                year: "numeric",
                                            })}
                                        </p>
                                        <p className="text-[11px] font-bold text-slate-500 uppercase tracking-widest mt-1">Last Consultation</p>
                                    </div>
                                ) : (
                                    <p className="text-sm font-medium text-slate-400 italic">New patient (First visit)</p>
                                )}
                            </div>
                        </div>

                    </CardContent>
                </Card>
            </div>

            {/* Right Column: History Listings */}
            <div className="lg:col-span-8 flex flex-col gap-6">
                <Card className="rounded-[40px] border-none bg-white ring-1 ring-border/50 overflow-hidden h-full">


                    <CardContent className="p-5">
                        <Accordion type="multiple" defaultValue={["visits"]} className="space-y-4">
                            {/* 1. Visit History */}
                            <AccordionItem value="visits" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-primary/5 text-primary flex items-center justify-center">
                                            <HistoryIcon className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">1. Medical Visit Timeline</h4>
                                            <p className="text-xs font-bold text-muted-foreground">{totalVisits} previous interactions</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6 space-y-4">
                                    {totalVisits > 0 ? (
                                        <div className="space-y-3">
                                            {context.visitHistory.map((visit, i) => (
                                                <div
                                                    key={i}
                                                    className="flex items-start gap-4 p-4 rounded-[24px] bg-slate-50/50 ring-1 ring-slate-100 hover:bg-white hover:ring-primary/20 transition-all group"
                                                >
                                                    <div className="h-14 w-14 rounded-2xl bg-white flex flex-col items-center justify-center text-slate-900 ring-1 ring-slate-200 shrink-0">
                                                        <span className="text-[10px] font-black uppercase text-primary leading-none mb-0.5">{new Date(visit.date).toLocaleDateString("en-IN", { month: "short" })}</span>
                                                        <span className="text-xl font-black leading-none">{new Date(visit.date).getDate()}</span>
                                                        <span className="text-[9px] font-bold text-slate-400 mt-0.5">{new Date(visit.date).getFullYear()}</span>
                                                    </div>
                                                    <div className="flex-1 min-w-0">
                                                        <div className="flex items-center justify-between mb-2">
                                                            <div className="flex flex-col">
                                                                <p className="text-[13px] font-bold text-slate-900 uppercase tracking-wide">
                                                                    OPD Consultation
                                                                </p>
                                                                {visit.doctor_name && (
                                                                    <p className="text-[11px] font-medium text-slate-500">
                                                                        Dr. {visit.doctor_name} • {visit.specialty || "General"}
                                                                    </p>
                                                                )}
                                                            </div>
                                                            <Button
                                                                variant="outline"
                                                                className="h-8 rounded-full text-[10px] font-bold border-primary/20 text-primary hover:bg-primary/5 hover:text-primary gap-1.5"
                                                                onClick={() => setSelectedVisit(visit)}
                                                            >
                                                                <Eye className="h-3.5 w-3.5" />
                                                                View Record
                                                            </Button>
                                                        </div>

                                                        {visit.diagnosis && visit.diagnosis.length > 0 && (
                                                            <div className="flex flex-wrap gap-1.5 mb-2">
                                                                {visit.diagnosis.slice(0, 4).map((d: any, j: number) => (
                                                                    <Badge key={j} className="text-[10px] font-bold bg-white text-slate-600 border-slate-100 px-2 py-0.5 rounded-full">
                                                                        {d.label || d.code || (typeof d === "string" ? d : "")}
                                                                    </Badge>
                                                                ))}
                                                                {visit.diagnosis.length > 4 && (
                                                                    <span className="text-[10px] font-bold text-muted-foreground ml-1">
                                                                        +{visit.diagnosis.length - 4}
                                                                    </span>
                                                                )}
                                                            </div>
                                                        )}

                                                        <div className="flex items-center gap-3 text-[10px] text-slate-400 font-medium">
                                                            {visit.prescriptions && visit.prescriptions.length > 0 && (
                                                                <span className="flex items-center gap-1"><Stethoscope className="h-3 w-3" /> {visit.prescriptions.length} Meds</span>
                                                            )}
                                                            {visit.lab_orders && visit.lab_orders.length > 0 && (
                                                                <span className="flex items-center gap-1"><FileText className="h-3 w-3" /> {visit.lab_orders.length} Labs</span>
                                                            )}
                                                        </div>
                                                    </div>
                                                </div>
                                            ))}
                                        </div>
                                    ) : (
                                        <div className="py-12 flex flex-col items-center justify-center text-center bg-slate-50/30 rounded-[32px] border-2 border-dashed border-slate-100">
                                            <HistoryIcon className="h-12 w-12 text-slate-200 mb-4" />
                                            <p className="text-sm font-bold text-slate-400">Fresh Medical Record - No Previous Visits</p>
                                        </div>
                                    )}
                                </AccordionContent>
                            </AccordionItem>

                            {/* 2. Document Media Grid */}
                            <AccordionItem value="docs" className="border border-slate-100 rounded-[32px] px-5 ring-1 ring-slate-100/50 overflow-hidden">
                                <AccordionTrigger className="hover:no-underline py-4">
                                    <div className="flex items-center gap-4">
                                        <div className="h-10 w-10 rounded-xl bg-indigo-50 text-indigo-600 flex items-center justify-center">
                                            <FileText className="h-5 w-5" />
                                        </div>
                                        <div className="text-left">
                                            <h4 className="text-base font-bold text-slate-900">2. Archived Medical Documents</h4>
                                            <p className="text-xs font-bold text-muted-foreground">{totalDocs} files discovered</p>
                                        </div>
                                    </div>
                                </AccordionTrigger>
                                <AccordionContent className="pb-6">
                                    {totalDocs > 0 ? (
                                        <div className="grid grid-cols-2 sm:grid-cols-3 gap-4">
                                            {context.documents.map((doc) => (
                                                <a
                                                    key={doc.id}
                                                    href={doc.file_url}
                                                    target="_blank"
                                                    rel="noopener noreferrer"
                                                    className="group relative aspect-square rounded-[24px] bg-slate-50 hover:bg-white ring-1 ring-slate-100 hover:ring-primary/20 transition-all duration-500 overflow-hidden"
                                                >
                                                    {doc.file_url.match(/\.(jpg|jpeg|png|gif|webp)$/i) ? (
                                                        <img
                                                            src={doc.file_url}
                                                            alt={doc.file_name}
                                                            className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                                                        />
                                                    ) : (
                                                        <div className="w-full h-full flex flex-col items-center justify-center gap-3">
                                                            <div className="h-14 w-14 rounded-2xl bg-indigo-50 text-indigo-500 flex items-center justify-center group-hover:scale-110 group-hover:bg-primary/5 group-hover:text-primary transition-all duration-500">
                                                                <FileText className="h-8 w-8" />
                                                            </div>
                                                            <span className="text-[11px] font-black text-slate-400 uppercase tracking-widest">PDF DOC</span>
                                                        </div>
                                                    )}
                                                    <div className="absolute inset-x-0 bottom-0 bg-gradient-to-t from-black/90 via-black/40 to-transparent p-4 opacity-0 group-hover:opacity-100 transition-all duration-500 translate-y-2 group-hover:translate-y-0">
                                                        <div className="flex items-center justify-between gap-2">
                                                            <p className="text-[10px] font-bold text-white truncate uppercase tracking-wider">{doc.file_name}</p>
                                                            <Eye className="h-4 w-4 text-white shrink-0" />
                                                        </div>
                                                        <p className="text-[10px] font-black text-primary uppercase mt-1">
                                                            {doc.category.replace("_", " ")}
                                                        </p>
                                                    </div>
                                                </a>
                                            ))}
                                        </div>
                                    ) : (
                                        <div className="py-12 flex flex-col items-center justify-center text-center bg-slate-50/30 rounded-[32px] border-2 border-dashed border-slate-100">
                                            <FolderOpen className="h-12 w-12 text-slate-200 mb-4" />
                                            <p className="text-sm font-bold text-slate-400">No medical documents on file</p>
                                        </div>
                                    )}
                                </AccordionContent>
                            </AccordionItem>
                        </Accordion>
                    </CardContent>

                </Card>
            </div>

            {/* Visit Details Modal */}
            <Dialog open={!!selectedVisit} onOpenChange={(open) => !open && setSelectedVisit(null)}>
                <DialogContent className="max-w-4xl rounded-[32px] p-0 overflow-hidden border-none text-slate-900 bg-[#FAFAFA]">
                    {selectedVisit && (
                        <div>
                            {/* Modal Header */}
                            <DialogHeader className="p-6 pb-4 bg-white border-b border-slate-100">
                                <div className="flex items-center justify-between">
                                    <div className="flex items-center gap-4">
                                        <div className="h-12 w-12 rounded-2xl bg-primary/5 text-primary flex flex-col items-center justify-center ring-1 ring-primary/10">
                                            <span className="text-[10px] font-black uppercase leading-none mb-0.5">{new Date(selectedVisit.date).toLocaleDateString("en-IN", { month: "short" })}</span>
                                            <span className="text-lg font-black leading-none">{new Date(selectedVisit.date).getDate()}</span>
                                        </div>
                                        <div>
                                            <DialogTitle className="text-xl font-bold text-slate-900">Consultation Record</DialogTitle>
                                            <DialogDescription asChild className="font-medium text-slate-500 flex items-center gap-2 mt-1">
                                                <div>
                                                    <Badge variant="outline" className="text-[10px] font-bold bg-slate-50 text-slate-600 border-slate-200">
                                                        Dr. {selectedVisit.doctor_name || "Unknown"}
                                                    </Badge>
                                                    {selectedVisit.specialty && <span className="text-xs">• {selectedVisit.specialty}</span>}
                                                </div>
                                            </DialogDescription>
                                        </div>
                                    </div>
                                </div>
                            </DialogHeader>

                            <ScrollArea className="max-h-[70vh] p-6 space-y-8">
                                {/* 1. Vitals & Clinical Context */}
                                <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                                    <div className="space-y-4">
                                        <div className="flex items-center gap-2 text-primary">
                                            <Activity className="h-4 w-4" />
                                            <h4 className="text-sm font-bold uppercase tracking-wider">Clinical Context</h4>
                                        </div>
                                        <div className="bg-white p-4 rounded-2xl ring-1 ring-slate-100 space-y-3">
                                            {/* Diagnosis */}
                                            <div>
                                                <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-1.5">Diagnosis</p>
                                                <div className="flex flex-wrap gap-1.5">
                                                    {selectedVisit.diagnosis?.map((d: any, i: number) => (
                                                        <Badge key={i} className="bg-slate-50 text-slate-700 border-slate-200">{d.label || d.code || d}</Badge>
                                                    ))}
                                                    {(!selectedVisit.diagnosis || selectedVisit.diagnosis.length === 0) && <span className="text-sm text-slate-400 italic">No diagnosis recorded</span>}
                                                </div>
                                            </div>
                                            {/* Symptoms */}
                                            {selectedVisit.symptoms && (
                                                <div className="pt-2 border-t border-slate-50">
                                                    <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-1">Symptoms</p>
                                                    <p className="text-sm font-medium text-slate-700">{typeof selectedVisit.symptoms === 'object' ? JSON.stringify(selectedVisit.symptoms) : selectedVisit.symptoms}</p>
                                                </div>
                                            )}
                                        </div>
                                    </div>

                                    {/* Vitals Grid */}
                                    <div className="space-y-4">
                                        <div className="flex items-center gap-2 text-rose-500">
                                            <Heart className="h-4 w-4" />
                                            <h4 className="text-sm font-bold uppercase tracking-wider">Vitals Snapshot</h4>
                                        </div>
                                        <div className="grid grid-cols-2 gap-3">
                                            {selectedVisit.vitals ? (
                                                Object.entries(selectedVisit.vitals).map(([key, val]: any, i) => (
                                                    <div key={i} className="bg-white p-3 rounded-xl ring-1 ring-slate-100">
                                                        <p className="text-[10px] font-bold text-slate-400 uppercase">{key}</p>
                                                        <p className="text-lg font-bold text-slate-900">{val || "--"}</p>
                                                    </div>
                                                ))
                                            ) : (
                                                <div className="col-span-2 bg-white p-4 rounded-2xl text-center text-slate-400 text-sm italic ring-1 ring-slate-100">No vitals recorded</div>
                                            )}
                                        </div>
                                    </div>
                                </div>

                                {/* 2. Prescription Table - DETAILED */}
                                <div className="space-y-4 mb-6">
                                    <div className="flex items-center gap-2 text-indigo-600">
                                        <Stethoscope className="h-4 w-4" />
                                        <h4 className="text-sm font-bold uppercase tracking-wider">Prescriptions ({selectedVisit.prescriptions?.length || 0})</h4>
                                    </div>

                                    {selectedVisit.prescriptions && selectedVisit.prescriptions.length > 0 ? (
                                        <div className="bg-white rounded-2xl ring-1 ring-slate-200 overflow-hidden">
                                            <div className="overflow-x-auto">
                                                <table className="w-full text-left border-collapse">
                                                    <thead>
                                                        <tr className="bg-slate-50 border-b border-slate-100">
                                                            <th className="p-3 pl-4 text-[10px] font-black text-slate-500 uppercase tracking-wider">Medicine</th>
                                                            <th className="p-3 text-[10px] font-black text-slate-500 uppercase tracking-wider">Dosage</th>
                                                            <th className="p-3 text-[10px] font-black text-slate-500 uppercase tracking-wider">Duration</th>
                                                            <th className="p-3 pr-4 text-[10px] font-black text-slate-500 uppercase tracking-wider">Instructions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody className="divide-y divide-slate-50">
                                                        {selectedVisit.prescriptions.map((med: any, i: number) => (
                                                            <tr key={i} className="hover:bg-indigo-50/10 transition-colors">
                                                                <td className="p-3 pl-4">
                                                                    <p className="text-sm font-bold text-slate-900">{med.brand_name}</p>
                                                                    <p className="text-[11px] font-medium text-slate-500">{med.generic_name}</p>
                                                                    {med.type && <Badge variant="secondary" className="mt-1 text-[9px] px-1.5 py-0 h-4 bg-slate-100 text-slate-500">{med.type}</Badge>}
                                                                </td>
                                                                <td className="p-3 text-xs font-bold text-slate-700">{med.dosage}</td>
                                                                <td className="p-3 text-xs font-medium text-slate-600">{med.duration}</td>
                                                                <td className="p-3 pr-4">
                                                                    <p className="text-xs font-medium text-slate-700">{med.instruction}</p>
                                                                    {med.note && <p className="text-[10px] text-amber-600 italic mt-0.5">Note: {med.note}</p>}
                                                                </td>
                                                            </tr>
                                                        ))}
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    ) : (
                                        <div className="bg-white p-6 rounded-2xl text-center ring-1 ring-slate-100">
                                            <p className="text-sm text-slate-400 italic">No medicines prescribed</p>
                                        </div>
                                    )}
                                </div>

                                {/* 3. Labs & Advice Grid */}
                                <div className="grid grid-cols-1 md:grid-cols-2 gap-6 pb-6">
                                    <div className="space-y-4">
                                        <div className="flex items-center gap-2 text-violet-600">
                                            <FileText className="h-4 w-4" />
                                            <h4 className="text-sm font-bold uppercase tracking-wider">Lab Orders</h4>
                                        </div>
                                        <div className="bg-white rounded-2xl ring-1 ring-slate-100 overflow-hidden p-1">
                                            {selectedVisit.lab_orders && selectedVisit.lab_orders.length > 0 ? (
                                                <div className="space-y-1">
                                                    {selectedVisit.lab_orders.map((lab: any, i: number) => (
                                                        <div key={i} className="p-3 hover:bg-slate-50 rounded-xl flex items-center justify-between">
                                                            <div>
                                                                <p className="text-xs font-bold text-slate-900">{lab.test_name}</p>
                                                                {lab.instruction && <p className="text-[10px] text-slate-500">{lab.instruction}</p>}
                                                            </div>
                                                            {lab.is_completed ? (
                                                                <Badge className="bg-emerald-100 text-emerald-700 hover:bg-emerald-100 border-none text-[10px]">Done</Badge>
                                                            ) : (
                                                                <Badge variant="outline" className="text-[10px] text-slate-400">Pending</Badge>
                                                            )}
                                                        </div>
                                                    ))}
                                                </div>
                                            ) : (
                                                <div className="p-4 text-center text-sm text-slate-400 italic">No labs ordered</div>
                                            )}
                                        </div>
                                    </div>

                                    <div className="space-y-4">
                                        <div className="flex items-center gap-2 text-emerald-600">
                                            <Calendar className="h-4 w-4" />
                                            <h4 className="text-sm font-bold uppercase tracking-wider">Plan & Follow-up</h4>
                                        </div>
                                        <div className="bg-white rounded-2xl ring-1 ring-slate-100 p-4 h-full flex flex-col gap-3">
                                            {/* Next Visit */}
                                            {selectedVisit.advice?.next_visit_date ? (
                                                <div className="flex items-start gap-3 bg-emerald-50/50 p-3 rounded-xl border border-emerald-100">
                                                    <Calendar className="h-5 w-5 text-emerald-600 shrink-0 mt-0.5" />
                                                    <div>
                                                        <p className="text-xs font-bold text-emerald-900 uppercase">Next Visit</p>
                                                        <p className="text-sm font-bold text-slate-900">
                                                            {new Date(selectedVisit.advice.next_visit_date).toLocaleDateString("en-IN", { dateStyle: "long" })}
                                                        </p>
                                                        {selectedVisit.advice.next_visit_text && (
                                                            <p className="text-xs text-emerald-700 mt-1">{selectedVisit.advice.next_visit_text}</p>
                                                        )}
                                                    </div>
                                                </div>
                                            ) : (
                                                <div className="flex items-center gap-2 text-slate-400 italic text-sm p-2">
                                                    <Calendar className="h-4 w-4" />
                                                    <span>No follow-up scheduled</span>
                                                </div>
                                            )}

                                            {/* Notes */}
                                            {selectedVisit.notes && (
                                                <div className="mt-auto pt-3 border-t border-slate-50">
                                                    <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-1">Clinical Note</p>
                                                    <p className="text-xs text-slate-600 leading-relaxed">{selectedVisit.notes}</p>
                                                </div>
                                            )}
                                        </div>
                                    </div>
                                </div>
                            </ScrollArea>
                        </div>
                    )}
                </DialogContent>
            </Dialog>
        </div>
    );
}
