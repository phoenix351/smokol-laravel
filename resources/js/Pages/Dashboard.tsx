import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head } from "@inertiajs/react";
import { PageProps, User } from "@/types";
import {
    ReactElement,
    JSXElementConstructor,
    ReactFragment,
    ReactPortal,
} from "react";

const Dashboard = ({ auth }: PageProps) => {
    return (
        <>
            <Head title="Dashboard" />
            Dashboard
        </>
    );
};

Dashboard.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Dashboard</h2>}
        selectedKey="dashboard"
        children={page}
    ></AuthenticatedLayout>
);
export default Dashboard;