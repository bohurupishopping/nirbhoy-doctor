import { Suspense } from "react";
import { getAppointmentForConsultation } from "@/lib/actions/doctor";
import { ConsultationClient } from "@/components/doctor/consultation/ConsultationClient";
import { AlertCircle } from "lucide-react";
async function ConsultationContent({ params }: { params: Promise<{ id: string }> }) {
    const { id } = await params;
    const result = await getAppointmentForConsultation(id);

    if ("error" in result) {
        return (
            <div className="flex flex-col items-center justify-center min-h-[50vh] space-y-4">
                <AlertCircle className="h-12 w-12 text-red-500" />
                <h1 className="text-xl font-semibold text-red-600">Error Loading Consultation</h1>
                <p className="text-muted-foreground">{result.error}</p>
            </div>
        );
    }

    return (
        <div className="min-h-screen pb-20">
            <div className="max-w-7xl mx-auto p-2 md:p-4 space-y-4 animate-in fade-in duration-500">
                <ConsultationClient context={result} />
            </div>
        </div>
    );
}

export default function ConsultationPage({ params }: { params: Promise<{ id: string }> }) {
    return (
        <Suspense fallback={<div className="flex justify-center p-20">Loading consultation...</div>}>
            <ConsultationContent params={params} />
        </Suspense>
    );
}
