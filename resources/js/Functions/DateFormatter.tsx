export function isoToIndonesiaDate(isoDate: string) {
    const date = new Date(isoDate);
    const formatted = new Intl.DateTimeFormat("id-ID", {
        day: "2-digit",
        month: "long",
        year: "numeric",
    }).format(date);
    return formatted;
}
