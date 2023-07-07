import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head } from "@inertiajs/react";
import { PageProps, User } from "@/types";
import {
    ReactElement,
    JSXElementConstructor,
    ReactFragment,
    ReactPortal,
} from "react";

const KelolaPengajuan = ({ auth }: PageProps) => {
    return (
        <>
            <Head title="Kelola Pengajuan" />
            Kelola Pengajuan
        </>
    );
};

KelolaPengajuan.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Kelola Pengajuan</h2>}
        selectedKey="admin.kelola.pengajuan"
        children={page}
    ></AuthenticatedLayout>
);
export default KelolaPengajuan;
