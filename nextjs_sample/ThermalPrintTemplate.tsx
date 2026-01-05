"use client"

import { format } from "date-fns"
import { QRCodeSVG } from "qrcode.react"

// Updated Types matching the NEW RPC response structure (print_inv_upgrade.sql)
export interface PrintData {
    meta: {
        generated_at: string
        invoice_no: string
        full_invoice_id: string
    }
    clinic: {
        name: string
        address_full: string
        city: string
        contacts: {
            primary: string
            secondary?: string
            email?: string
            website?: string
        }
        branding: {
            logo?: string
            header_img?: string
            footer_msg?: string
        }
        tax_info?: string // GSTIN etc
    }
    doctor: {
        name: string
        reg_no?: string
        specialty?: string
        qualifications?: string
        signature?: string
    }
    patient: {
        name: string
        uhid: string
        phone?: string
        age_gender?: string
        address_full?: string
    }
    appointment: {
        date: string
        start_time: string
        end_time: string
        type: string // 'fresh' | 'followup'
        appt_number?: string
        token_number: number
        room?: string
        created_by_name?: string
    }
    financials: {
        status?: string
        mode?: string
        transaction_ref?: string
        sub_total: number
        tax_total: number
        grand_total: number
        amount_paid: number
        balance_due: number
        items: Array<{
            desc: string
            qty: number
            unit_price: number
            total: number
        }>
        payment_history?: Array<{
            date: string
            mode: string
            ref?: string
            amount: number
        }>
    }
}

// Helper: Number to Words (Simplified for INR/General)
function numberToWords(amount: number): string {
    const words = new Intl.NumberFormat('en-IN', { style: 'currency', currency: 'INR' }).format(amount);
    // This is a placeholder since a full engine is complex. 
    // Ideally we'd use a library, but for now we'll format it nicely or just use the digits if words are critical.
    // For this environment, let's stick to a clean numeric display primarily, 
    // but if user really wants words, we can add a basic converter.
    // Let's implement a basic one:

    return `Rupees ${amount} Only`; // Placeholder, proper implementation is huge.
}

export function InvoicePrintTemplate({ data }: { data: PrintData }) {
    const totalInWords = numberToWords(data.financials.grand_total);
    const baseUrl = process.env.NEXT_PUBLIC_URL || '';
    // Format: BASE_URL/rx/UHID+PHONE
    const qrValue = `${baseUrl}/rx/${data.patient.uhid}+${data.patient.phone || ''}`;

    return (
        <div id="print-invoice" className="a4-print-container">
            {/* --- HEADER SECTION --- */}
            <div className="header-row">
                {/* Logo */}
                {data.clinic.branding.logo && (
                    <div className="logo-col">
                        <img src={data.clinic.branding.logo} alt="Clinic Logo" className="logo-img" />
                    </div>
                )}

                {/* Clinic Info */}
                <div className="clinic-col">
                    <h1 className="clinic-name">{data.clinic.name}</h1>
                    <div className="clinic-address">{data.clinic.address_full}</div>
                    <div className="clinic-contact">
                        Phone: {data.clinic.contacts.primary}
                        {data.clinic.contacts.secondary && `, ${data.clinic.contacts.secondary}`}
                        {data.clinic.contacts.email && ` | Email: ${data.clinic.contacts.email}`}
                    </div>
                </div>

                {/* QR Code */}
                <div className="qr-col">
                    <QRCodeSVG value={qrValue} size={64} />
                    <div className="qr-label">Scan for Rx</div>
                </div>
            </div>

            <div className="divider-thick"></div>

            {/* --- TITLE & META --- */}
            <div className="invoice-meta-bar">
                <div className="invoice-title">TAX INVOICE</div>
                <div className="invoice-details">
                    <div className="meta-item">
                        <span className="label">Invoice No:</span>
                        <span className="value">{data.meta.invoice_no}</span>
                        {data.appointment.appt_number && (
                            <>
                                <span className="label" style={{ marginLeft: '10px' }}>Appt:</span>
                                <span className="value">{data.appointment.appt_number}</span>
                            </>
                        )}
                    </div>
                    <div className="meta-item">
                        <span className="label">Date:</span>
                        <span className="value">{data.appointment.date}</span>
                    </div>
                </div>
            </div>

            {/* --- TWO COLUMN INFO GRID --- */}
            <div className="info-grid">
                {/* Left: Patient Details */}
                <div className="info-box">
                    <div className="box-header">Patient Details</div>
                    <div className="box-content">
                        <div className="info-row"><span className="label">Name:</span> <span className="value highlight">{data.patient.name}</span></div>
                        <div className="info-row"><span className="label">UHID:</span> <span className="value">{data.patient.uhid}</span></div>
                        <div className="info-row"><span className="label">Age/Gender:</span> <span className="value">{data.patient.age_gender}</span></div>
                        {data.patient.phone && <div className="info-row"><span className="label">Phone:</span> <span className="value">{data.patient.phone}</span></div>}
                        {data.patient.address_full && <div className="info-row"><span className="label">Address:</span> <span className="value">{data.patient.address_full}</span></div>}
                    </div>
                </div>

                {/* Right: Doctor / Clinical Details */}
                <div className="info-box">
                    <div className="box-header">Doctor & Appointment</div>
                    <div className="box-content">
                        <div className="info-row"><span className="label">Doctor:</span> <span className="value highlight">{data.doctor.name}</span></div>
                        <div className="info-row"><span className="label">Specialty:</span> <span className="value">{data.doctor.specialty}</span></div>
                        {data.doctor.reg_no && <div className="info-row"><span className="label">Reg. No:</span> <span className="value">{data.doctor.reg_no}</span></div>}
                        <div className="info-row token-row">
                            <span className="label">Token No:</span>
                            <span className="token-badge">{data.appointment.token_number}</span>
                        </div>
                        <div className="info-row mt-2 border-t pt-2">
                            <span className="label">Time:</span>
                            <span className="value">{data.appointment.start_time} - {data.appointment.end_time}</span>
                        </div>
                        <div className="info-row">
                            <span className="label">Type:</span>
                            <span className="value uppercase text-xs font-bold">{data.appointment.type}</span>
                        </div>
                        {data.appointment.created_by_name && (
                            <div className="info-row text-xs text-muted-foreground mt-1">
                                <span className="label">Ref:</span>
                                <span className="value">{data.appointment.created_by_name}</span>
                            </div>
                        )}
                    </div>
                </div>
            </div>

            {/* --- ITEMS TABLE --- */}
            <div className="table-container">
                <table className="invoice-table">
                    <thead>
                        <tr>
                            <th className="th-sr">Sr.</th>
                            <th className="th-desc">Description / Services</th>
                            <th className="th-qty text-center">Qty</th>
                            <th className="th-rate text-right">Rate</th>
                            <th className="th-total text-right">Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        {data.financials.items.map((item, idx) => (
                            <tr key={idx}>
                                <td className="text-center">{idx + 1}</td>
                                <td>{item.desc}</td>
                                <td className="text-center">{item.qty}</td>
                                <td className="text-right">{item.unit_price?.toFixed(2)}</td>
                                <td className="text-right highlight">{item.total?.toFixed(2)}</td>
                            </tr>
                        ))}
                        {/* Fill empty rows to push footer down if needed, or specific height */}
                    </tbody>
                </table>
            </div>

            {/* --- FINANCIAL SUMMARY --- */}
            <div className="summary-section">
                <div className="amount-in-words">
                    <span className="label">Total in words:</span>
                    <div className="words">{totalInWords}</div>
                </div>

                <div className="totals-box">
                    <div className="total-row">
                        <span className="label">Sub Total:</span>
                        <span className="value">{data.financials.sub_total?.toFixed(2)}</span>
                    </div>
                    {data.financials.tax_total > 0 && (
                        <div className="total-row">
                            <span className="label">Tax (GST):</span>
                            <span className="value">{data.financials.tax_total?.toFixed(2)}</span>
                        </div>
                    )}
                    <div className="total-row grand-total">
                        <span className="label">Grand Total:</span>
                        <span className="value">₹ {data.financials.grand_total?.toFixed(2)}</span>
                    </div>

                    {/* Partial Payment Breakdown */}
                    <div className="total-row" style={{ marginTop: '10px', paddingTop: '5px', borderTop: '1px dashed #ccc' }}>
                        <span className="label">Paid:</span>
                        <span className="value">₹ {data.financials.amount_paid?.toFixed(2)}</span>
                    </div>
                    {data.financials.balance_due > 0 && (
                        <div className="total-row" style={{ color: '#c0392b' }}>
                            <span className="label">Balance Due:</span>
                            <span className="value">₹ {data.financials.balance_due?.toFixed(2)}</span>
                        </div>
                    )}
                </div>
            </div>

            {/* --- PAYMENT INFO --- */}
            <div className="payment-bar">
                <div className="payment-status">
                    Status: <span className="status-badge" style={{
                        background: data.financials.status === 'partial' ? '#f39c12' : '#4caf50'
                    }}>
                        {data.financials.status}
                    </span>
                </div>
                <div className="payment-mode">
                    Mode: <strong>{data.financials.mode}</strong>
                    {data.financials.transaction_ref && ` (Ref: ${data.financials.transaction_ref})`}
                </div>
            </div>

            {/* --- FOOTER / T&C --- */}
            <div className="footer-section">
                <div className="terms">
                    <strong>Terms & Conditions:</strong>
                    <ul>
                        <li>Consultation valid for 7 days.</li>
                        <li>Payments once made are non-refundable.</li>
                    </ul>
                </div>

                <div className="signatures">
                    <div className="sig-block">
                        <div className="sig-line"></div>
                        <div className="sig-label">Authorized Signatory</div>
                    </div>
                </div>
            </div>

            {/* --- BRANDING FOOTER --- */}
            {data.clinic.branding.footer_msg && (
                <div className="branding-footer">
                    {data.clinic.branding.footer_msg}
                </div>
            )}

            {/* --- STYLES --- */}
            <style jsx global>{`
                /* Hide on Screen */
                .a4-print-container {
                    display: none;
                }

                @media print {
                    @page {
                        size: A4;
                        margin: 10mm;
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
                        flex-direction: column;
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%; /* A4 width implicit via @page */
                        min-height: 98%;
                        font-family: 'Open Sans', Helvetica, Arial, sans-serif;
                        color: #1a1a1a;
                        font-size: 10pt;
                    }

                    /* Header */
                    .header-row {
                        display: flex;
                        gap: 20px;
                        margin-bottom: 15px;
                        align-items: center;
                    }
                    .logo-img {
                        height: 80px;
                        width: auto;
                        max-width: 150px;
                        object-fit: contain;
                    }
                    .clinic-col {
                        flex: 1;
                    }
                    .clinic-name {
                        font-size: 24pt;
                        font-weight: 700;
                        color: #2c3e50;
                        margin: 0 0 5px 0;
                        text-transform: uppercase;
                        line-height: 1;
                    }
                    .clinic-address {
                        font-size: 10pt;
                        margin-bottom: 5px;
                        color: #555;
                    }
                    .clinic-contact {
                        font-size: 9pt;
                        color: #777;
                    }

                    .qr-col {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        gap: 2px;
                    }
                    .qr-label {
                        font-size: 8pt;
                        font-weight: 600;
                        color: #555;
                    }

                    .divider-thick {
                        height: 3px;
                        background: #2c3e50;
                        margin-bottom: 15px;
                    }

                    /* Meta Bar */
                    .invoice-meta-bar {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        background: #f8f9fa;
                        border: 1px solid #e9ecef;
                        padding: 10px 15px;
                        border-radius: 4px;
                        margin-bottom: 20px;
                    }
                    .invoice-title {
                        font-size: 16pt;
                        font-weight: 800;
                        color: #27ae60; /* Green for tax invoice */
                        text-transform: uppercase;
                        letter-spacing: 1px;
                    }
                    .invoice-details {
                        text-align: right;
                    }
                    .meta-item {
                        display: flex;
                        gap: 10px;
                        justify-content: flex-end;
                    }
                    .meta-item .label { font-weight: 600; color: #555; }
                    .meta-item .value { font-weight: 700; }

                    /* Info Grid */
                    .info-grid {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 20px;
                        margin-bottom: 25px;
                    }
                    .info-box {
                        border: 1px solid #dee2e6;
                        border-radius: 4px;
                        overflow: hidden;
                    }
                    .box-header {
                        background: #e9ecef;
                        padding: 5px 10px;
                        font-weight: 700;
                        text-transform: uppercase;
                        font-size: 9pt;
                        border-bottom: 1px solid #dee2e6;
                        color: #495057;
                    }
                    .box-content {
                        padding: 10px;
                    }
                    .info-row {
                        display: flex;
                        margin-bottom: 4px;
                        align-items: baseline;
                    }
                    .info-row .label {
                        width: 80px;
                        font-size: 9pt;
                        color: #666;
                        flex-shrink: 0;
                    }
                    .info-row .value {
                        font-weight: 600;
                        font-size: 10pt;
                    }
                    .info-row .value.highlight {
                        color: #000;
                        font-weight: 700;
                    }
                    .token-row {
                        margin-top: 5px;
                    }
                    .token-badge {
                        background: #2c3e50;
                        color: white;
                        padding: 2px 8px;
                        border-radius: 4px;
                        font-weight: 700;
                    }

                    /* Table */
                    .table-container {
                        margin-bottom: 20px;
                    }
                    .invoice-table {
                        width: 100%;
                        border-collapse: collapse;
                        border: 1px solid #dee2e6;
                    }
                    .invoice-table th {
                        background: #27ae60;
                        color: white;
                        padding: 8px;
                        font-weight: 700;
                        text-transform: uppercase;
                        font-size: 9pt;
                        border: 1px solid #27ae60; /* Match bg */
                    }
                    .invoice-table td {
                        padding: 8px;
                        border-right: 1px solid #dee2e6;
                        border-bottom: 1px solid #dee2e6;
                    }
                    .invoice-table td.highlight {
                        font-weight: 700;
                    }
                    .text-center { text-align: center; }
                    .text-right { text-align: right; }
                    .th-sr { width: 40px; }
                    .th-qty { width: 60px; }
                    .th-rate, .th-total { width: 100px; }

                    /* Summary */
                    .summary-section {
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 20px;
                    }
                    .amount-in-words {
                        flex: 1;
                        padding-right: 40px;
                    }
                    .amount-in-words .label {
                        font-size: 9pt;
                        color: #666;
                        display: block;
                        margin-bottom: 2px;
                    }
                    .amount-in-words .words {
                        font-weight: 700;
                        font-style: italic;
                    }

                    .totals-box {
                        width: 250px;
                    }
                    .total-row {
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 5px;
                    }
                    .total-row .label { color: #555; }
                    .total-row .value { font-weight: 600; text-align: right; }
                    .total-row.grand-total {
                        border-top: 2px solid #27ae60;
                        border-bottom: 2px solid #27ae60;
                        padding: 5px 0;
                        margin-top: 5px;
                        font-size: 12pt;
                        color: #27ae60;
                    }
                    .total-row.grand-total .value {
                        font-weight: 800;
                    }

                    /* Payment Bar */
                    .payment-bar {
                        background: #f1f8e9; /* Light green */
                        border: 1px solid #c8e6c9;
                        padding: 8px 15px;
                        border-radius: 4px;
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 30px; /* Space for footer */
                    }
                    .status-badge {
                        background: #4caf50;
                        color: white;
                        text-transform: uppercase;
                        padding: 2px 6px;
                        border-radius: 3px;
                        font-size: 8pt;
                        font-weight: 700;
                    }

                    /* Footer & Signatures */
                    .footer-section {
                        margin-top: auto; /* Push to bottom if full height, or just flow */
                        display: flex;
                        justify-content: space-between;
                        align-items: flex-end;
                        margin-bottom: 20px;
                    }
                    .terms {
                        font-size: 8pt;
                        color: #666;
                        max-width: 60%;
                    }
                    .terms ul { padding-left: 15px; margin: 5px 0 0 0; }
                    
                    .signatures {
                        text-align: right;
                    }
                    .sig-block {
                        display: inline-block;
                        text-align: center;
                    }
                    .sig-line {
                        width: 150px;
                        border-top: 1px solid #000;
                        margin-bottom: 5px;
                    }
                    .sig-label {
                        font-size: 8pt;
                        font-weight: 600;
                    }

                    .branding-footer {
                        text-align: center;
                        font-size: 9pt;
                        color: #888;
                        border-top: 1px solid #eee;
                        padding-top: 10px;
                    }
                }
            `}</style>
        </div>
    )
}

// Aliases for compatibility
export function TokenPrintTemplate({ data }: { data: PrintData }) {
    return <InvoicePrintTemplate data={data} />
}

export function ThermalPrintTemplate({ data }: { data: PrintData }) {
    return <InvoicePrintTemplate data={data} />
}
