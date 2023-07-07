import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head } from "@inertiajs/react";
import { PageProps, User } from "@/types";
import {
    ReactElement,
    JSXElementConstructor,
    ReactFragment,
    ReactPortal,
} from "react";

const Pengajuan = ({ auth }: PageProps) => {
    return (
        <>
            <Head title="Pengajuan" />
            Pengajuan
        </>
    );
};

Pengajuan.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Pengajuan</h2>}
        selectedKey="pengajuan"
        children={page}
    ></AuthenticatedLayout>
);
export default Pengajuan;
