import React from "react";
import {
    Page,
    Text,
    View,
    Document,
    StyleSheet,
    PDFViewer,
    Font,
} from "@react-pdf/renderer";

Font.register({
    family: "Open Sans",
    fonts: [
        {
            src: "https://cdn.jsdelivr.net/npm/open-sans-all@0.1.3/fonts/open-sans-regular.ttf",
        },
        {
            src: "https://cdn.jsdelivr.net/npm/open-sans-all@0.1.3/fonts/open-sans-600.ttf",
            fontWeight: 600,
        },
    ],
});

const styles = StyleSheet.create({
    page: {
        flexDirection: "column",
        padding: 20,
    },
    section: {
        margin: 10,
        padding: 10,
        flexGrow: 1,
        color: "#000",
        textAlign: "center",
    },
    title: {
        fontFamily: "Helvetica-Bold",
        fontSize: 20,
        fontWeight: 900,
    },
});

const CetakLaporan = () => (
    <PDFViewer style={{ width: "100vw", height: "100vh" }}>
        <Document>
            <Page size="A4" style={styles.page}>
                <View style={styles.section}>
                    <Text style={styles.title}>
                        Daftar Barang Milik Negara Berdasarkan Ruangan
                    </Text>
                </View>
                <View style={styles.section}>
                    <Text>Section #2</Text>
                </View>
            </Page>
        </Document>
    </PDFViewer>
);

export default CetakLaporan;
