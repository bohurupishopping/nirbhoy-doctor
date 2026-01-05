"use client"

import { cn } from "@/lib/utils"

// Types matching the RPC 'get_prescription_print_data'
export interface PrescriptionPrintData {
    meta: {
        generated_at: string
        appointment_number: string
        visit_type: string
        visit_date: string
    }
    clinic: {
        name: string
        logo_url?: string
        header_image_url?: string
        phone?: string
        email?: string
        address?: string
        footer_text?: string
    }
    doctor: {
        name: string
        specialty?: string
        qualifications?: string
        reg_number?: string
        signature_url?: string
    }
    patient: {
        name: string
        uhid: string
        age_gender: string
        phone: string
        address: string
        known_allergies: string[]
    }
    clinical?: {
        vitals?: Record<string, any>
        diagnosis?: any // Changed from string to any to handle JSONB array
        symptoms?: any
        notes?: string
        chief_complaint?: string
    }
    rx_items: Array<{
        brand_name: string
        generic_name?: string
        type: string
        dosage: string // Frequency e.g. 1-0-1
        duration: string
        instruction?: string // Timing e.g. After Food
        note?: string
    }>
    lab_orders: Array<{
        test_name: string
        instruction?: string
    }>
    advice: {
        next_visit_date?: string
        next_visit_text?: string
    }
}

export function PrescriptionPrintTemplate({ data, className }: { data: PrescriptionPrintData, className?: string }) {
    if (!data) return null;

    return (
        <div id="print-prescription" className={cn("a4-print-container", className)}>
            {/* --- HEADER --- */}
            {data.clinic.header_image_url ? (
                <div className="w-full mb-4">
                    <img src={data.clinic.header_image_url} alt="Header" className="w-full h-auto object-contain max-h-[120px]" />
                </div>
            ) : (
                <div className="header-row flex justify-between items-start mb-6 border-b-2 border-slate-800 pb-4">
                    <div className="flex-1">
                        <h1 className="text-3xl font-black text-slate-900 uppercase tracking-tight">{data.clinic.name}</h1>
                        <p className="text-sm text-slate-600 font-medium max-w-md mt-1">{data.clinic.address}</p>
                        <div className="flex items-center gap-4 mt-2 text-xs font-bold text-slate-500 uppercase tracking-wide">
                            {data.clinic.phone && <span>Ph: {data.clinic.phone}</span>}
                            {data.clinic.email && <span>Email: {data.clinic.email}</span>}
                        </div>
                    </div>
                    {data.clinic.logo_url && (
                        <div className="w-24 h-24 flex items-center justify-center">
                            <img src={data.clinic.logo_url} alt="Logo" className="w-full h-full object-contain" />
                        </div>
                    )}
                </div>
            )}

            {/* --- DOCTOR & PATIENT ROW --- */}
            <div className="grid grid-cols-2 gap-6 mb-6">
                {/* Doctor Info */}
                <div className="rounded-2xl bg-green-50/50 border border-green-100 p-4 relative overflow-hidden">
                    <div className="absolute top-0 right-0 px-3 py-1 bg-green-100 rounded-bl-xl text-[10px] font-black uppercase text-green-700 tracking-wider">
                        Doctor
                    </div>
                    <h2 className="text-lg font-black text-slate-900">{data.doctor.name}</h2>
                    <p className="text-xs font-bold text-slate-600 uppercase tracking-wide mb-1">{data.doctor.specialty || 'General Physician'}</p>
                    <p className="text-[10px] text-slate-500 font-medium">{data.doctor.qualifications}</p>
                    {data.doctor.reg_number && <p className="text-[10px] text-slate-400 mt-1 font-mono">Reg: {data.doctor.reg_number}</p>}
                </div>

                {/* Patient Info */}
                <div className="rounded-2xl bg-red-50/50 border border-red-100 p-4 relative overflow-hidden">
                    <div className="absolute top-0 right-0 px-3 py-1 bg-red-100 rounded-bl-xl text-[10px] font-black uppercase text-red-700 tracking-wider">
                        Patient
                    </div>
                    <h2 className="text-lg font-black text-slate-900">{data.patient.name}</h2>
                    <div className="flex flex-wrap gap-x-3 gap-y-1 text-xs font-medium text-slate-600 mt-1">
                        <span>{data.patient.age_gender}</span>
                        <span>•</span>
                        <span>ID: {data.patient.uhid}</span>
                        {data.patient.phone && (
                            <>
                                <span>•</span>
                                <span>{data.patient.phone}</span>
                            </>
                        )}
                    </div>
                    {data.patient.address && (
                        <p className="text-[10px] text-slate-400 mt-2 truncate w-full">{data.patient.address}</p>
                    )}
                </div>
            </div>

            {/* --- APPOINTMENT META & VITALS --- */}
            <div className="mb-6 border-y border-slate-100 py-3 text-xs space-y-3">
                {/* Row 1: Date, ID, Type */}
                <div className="flex items-center gap-6">
                    <span className="text-slate-500">Date: <b className="text-slate-900">{data.meta.visit_date}</b></span>
                    <span className="text-slate-500">Appt #: <b className="text-slate-900">{data.meta.appointment_number}</b></span>
                    <span className="text-slate-500">Type: <b className="text-slate-900 uppercase">{data.meta.visit_type}</b></span>
                </div>

                {/* Row 2: Vitals & Allergies - Flex Wrap */}
                <div className="flex flex-wrap items-center gap-x-4 gap-y-2">
                    {/* Vitals with colored badges */}
                    {data.clinical?.vitals && Object.entries(data.clinical.vitals).map(([key, val]) => (
                        <div key={key} className="flex items-center gap-2">
                            <span className="uppercase text-[10px] bg-slate-100 text-slate-600 font-bold px-2 py-0.5 rounded-full border border-slate-200">
                                {key}
                            </span>
                            <b className="text-slate-900">{val as string}</b>
                        </div>
                    ))}

                    {/* Divider if vitals exist */}
                    {data.clinical?.vitals && Object.keys(data.clinical.vitals).length > 0 && (
                        <div className="h-4 w-px bg-slate-200 mx-2" />
                    )}

                    {/* Next Visit */}
                    {data.advice.next_visit_date && (
                        <span className="text-slate-500">Next Visit: <b className="text-slate-900">{data.advice.next_visit_date}</b></span>
                    )}

                    {/* Allergies */}
                    {data.patient.known_allergies && data.patient.known_allergies.length > 0 && (
                        <div className="flex items-center gap-2 text-red-600 font-bold ml-auto">
                            <span className="uppercase text-[10px] bg-red-50 border border-red-100 px-2 py-0.5 rounded-full">Allergies</span>
                            <span className="text-red-700">{data.patient.known_allergies.join(", ")}</span>
                        </div>
                    )}
                </div>
            </div>

            {/* --- CLINICAL SNAPSHOT --- */}
            {/* --- CLINICAL SNAPSHOT --- */}
            {data.clinical && (
                <div className="mb-6 space-y-4 text-sm">
                    {/* Chief Complaint */}
                    {data.clinical.chief_complaint && (
                        <div>
                            <span className="font-bold text-slate-900 uppercase text-[12px] tracking-wider block mb-1">
                                Chief Complaint
                            </span>
                            <p className="font-medium text-slate-800 text-xs leading-relaxed text-justify">
                                {data.clinical.chief_complaint}
                            </p>
                        </div>
                    )}

                    {/* Diagnosis */}
                    {data.clinical.diagnosis && (Array.isArray(data.clinical.diagnosis) ? data.clinical.diagnosis.length > 0 : true) && (
                        <div>
                            <span className="font-bold text-slate-900 uppercase text-[12px] tracking-wider block mb-1">
                                Diagnosis
                            </span>
                            <p className="font-bold text-slate-800 text-xs leading-relaxed">
                                {(() => {
                                    if (Array.isArray(data.clinical.diagnosis)) {
                                        return data.clinical.diagnosis.map((d: any) => d.label || d.code).join(', ');
                                    }
                                    return typeof data.clinical.diagnosis === 'string' ? data.clinical.diagnosis : JSON.stringify(data.clinical.diagnosis);
                                })()}
                            </p>
                        </div>
                    )}

                    {/* Clinical Notes */}
                    {data.clinical.notes && (
                        <div>
                            <span className="font-bold text-slate-900 uppercase text-[12px] tracking-wider block mb-1">
                                Clinical Notes & Diagnosis
                            </span>
                            <p className="font-medium text-slate-800 text-xs leading-relaxed whitespace-pre-wrap text-justify">
                                {data.clinical.notes}
                            </p>
                        </div>
                    )}
                </div>
            )}

            {/* --- RX TABLE --- */}
            <div className="mb-8">
                <div className="flex items-center gap-2 mb-3 px-1">
                    <div className="h-8 w-8 rounded-lg bg-black text-white flex items-center justify-center font-serif font-black text-xl italic">
                        Rx
                    </div>
                    <span className="text-xs font-black uppercase text-slate-400 tracking-[0.2em]">Prescribed Medicines</span>
                </div>

                <div className="rounded-2xl border border-slate-200 overflow-hidden shadow-sm">
                    <table className="w-full text-sm">
                        <thead>
                            <tr className="bg-slate-100 text-slate-500 text-[10px] uppercase font-bold tracking-wider text-left">
                                <th className="py-2 px-4 w-12 text-center">#</th>
                                <th className="py-2 px-4">Medicine / Composition</th>
                                <th className="py-2 px-4 w-32">Dosage</th>
                                <th className="py-2 px-4 w-24">Duration</th>
                                <th className="py-2 px-4 w-40 text-right">Instruction</th>
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-slate-100">
                            {data.rx_items.length > 0 ? data.rx_items.map((item, i) => (
                                <tr key={i} className="group">
                                    <td className="py-3 px-4 text-center font-medium text-slate-400">{i + 1}</td>
                                    <td className="py-3 px-4">
                                        <div className="font-black text-slate-800 text-sm">{item.brand_name}</div>
                                        {item.generic_name && (
                                            <div className="text-[10px] font-medium text-slate-500 uppercase tracking-tight mt-0.5">
                                                {item.generic_name}
                                            </div>
                                        )}
                                        {item.note && (
                                            <div className="text-[11px] text-slate-600 bg-yellow-50 inline-block px-1.5 rounded mt-1 border border-yellow-100">
                                                Note: {item.note}
                                            </div>
                                        )}
                                    </td>
                                    <td className="py-3 px-4 font-bold text-slate-700 text-xs">{item.dosage}</td>
                                    <td className="py-3 px-4 text-slate-600 text-xs">{item.duration} Days</td>
                                    <td className="py-3 px-4 text-right font-medium text-slate-600 text-xs">
                                        {item.instruction}
                                    </td>
                                </tr>
                            )) : (
                                <tr>
                                    <td colSpan={5} className="py-8 text-center text-slate-400 italic font-medium">No medicines prescribed</td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                </div>
            </div>

            {/* --- LABS --- */}
            {data.lab_orders.length > 0 && (
                <div className="mb-6 px-1">
                    <div className="text-xs font-bold uppercase text-slate-900 mb-2 border-b border-slate-100 pb-1">Lab Investigations</div>
                    <ul className="grid grid-cols-2 gap-x-8 gap-y-1 list-disc pl-4 text-sm font-medium text-slate-700">
                        {data.lab_orders.map((lab, i) => (
                            <li key={i}>
                                <span className="font-semibold">{lab.test_name}</span>
                                {lab.instruction && <span className="text-slate-500 text-xs ml-2 italic">- {lab.instruction}</span>}
                            </li>
                        ))}
                    </ul>
                </div>
            )}

            {/* --- ADVICE / FOOTER --- */}
            <div className="mt-auto pt-4 border-t border-slate-200">
                <div className="flex items-start justify-between gap-8 mb-4">
                    <div className="flex-1">
                        {data.advice.next_visit_text && (
                            <div className="mb-2">
                                <span className="text-xs font-bold uppercase text-slate-900 block mb-1">Advice</span>
                                <p className="text-sm font-medium text-slate-800 leading-relaxed whitespace-pre-wrap capitalize">{data.advice.next_visit_text}</p>
                            </div>
                        )}
                        {/* Fallback if no text but date exists and wasn't shown in header (though we added it to header) - or just generic advice label if needed */}
                    </div>
                    <div className="w-48 text-right">
                        {data.doctor.signature_url && (
                            <img src={data.doctor.signature_url} className="h-12 w-auto ml-auto mb-1 opacity-80" alt="Sig" />
                        )}
                        <div className="font-bold text-slate-900 text-sm">{data.doctor.name}</div>
                        <div className="text-[10px] text-slate-400 uppercase font-bold tracking-wider">Authorized Signatory</div>
                    </div>
                </div>

                {/* --- FOOTER BRANDING --- */}
                {data.clinic.footer_text && (
                    <div className="text-center text-[13px] text-slate-500 mt-2 border-t border-slate-100 pt-2 leading-tight">
                        {data.clinic.footer_text}
                    </div>
                )}

                <div className="text-center text-[8px] text-slate-300 mt-4 leading-none font-medium tracking-wide">
                    Powered by Nirbhoy.de - management system
                </div>

            </div>

            {/* --- GLOBAL PRINT STYLES --- */}
            <style jsx global>{`
                /* Base Layout (Hidden by default on screen) */
                .a4-print-container {
                    display: none;
                    flex-direction: column;
                    width: 210mm;
                    min-height: 296mm; 
                    padding: 12mm 15mm; /* Safe padding for print & PDF */
                    background: white;
                    font-family: 'Inter', ui-sans-serif, system-ui, sans-serif;
                    box-sizing: border-box;
                }

                @media print {
                    @page {
                        size: A4;
                        margin: 0; 
                    }
                    body {
                        background: white;
                        -webkit-print-color-adjust: exact;
                        print-color-adjust: exact;
                    }
                    body * { visibility: hidden; }

                    .a4-print-container, .a4-print-container * {
                        visibility: visible;
                    }

                    .a4-print-container {
                        display: flex !important;
                        position: absolute;
                        top: 0;
                        left: 0;
                        margin: 0;
                    }
                }
            `}</style>
        </div>
    )
}
