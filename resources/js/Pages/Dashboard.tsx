import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";

import { useEffect } from "react";
import { Head } from "@inertiajs/react";
import { PageProps, User, KondisiSummary, Summary } from "@/types";
import BarChart from "@/Components/Grafik/BarChart";
import {
    ReactElement,
    JSXElementConstructor,
    ReactFragment,
    ReactPortal,
} from "react";
import { Card, Col, Row, Statistic } from "antd";
import {
    WarningOutlined,
    StopOutlined,
    CheckCircleOutlined,
} from "@ant-design/icons";

const Dashboard = ({
    kondisi,
    kondisi_total,
    ruangan_summary,
    jenis_summary,
}: PageProps & {
    kondisi: KondisiSummary[];
    kondisi_total: number;
    ruangan_summary: Summary[];
    jenis_summary: Summary[];
}) => {
    useEffect(() => {
        console.log({ kondisi, kondisi_total, ruangan_summary });
    }, [kondisi]);

    return (
        <>
            <Head title="Dashboard" />

            <Row gutter={16}>
                <Col span={6}>
                    <Card bordered={false}>
                        <Statistic
                            title="Total Barang TIK"
                            value={kondisi_total}
                            valueStyle={{ color: "#000" }}
                            suffix="Unit"
                        />
                    </Card>
                </Col>
                <Col span={6}>
                    <Card bordered={false}>
                        <Statistic
                            title="Barang TIK Kondisi Baik"
                            value={kondisi[0].jumlah}
                            valueStyle={{ color: "green" }}
                            prefix={<CheckCircleOutlined />}
                            suffix="Unit"
                        />
                    </Card>
                </Col>
                <Col span={6}>
                    <Card bordered={false}>
                        <Statistic
                            title="Barang TIK Kondisi Rusak Ringan"
                            value={kondisi[2].jumlah}
                            valueStyle={{ color: "orange" }}
                            prefix={<WarningOutlined />}
                            suffix="Unit"
                        />
                    </Card>
                </Col>
                <Col span={6}>
                    <Card bordered={false}>
                        <Statistic
                            title="Barang TIK Kondisi Rusak Berat"
                            value={kondisi[1].jumlah}
                            valueStyle={{ color: "red" }}
                            prefix={<StopOutlined />}
                            suffix="Unit"
                        />
                    </Card>
                </Col>
            </Row>
            <Row
                gutter={16}
                style={{ marginTop: 10, padding: 8 }}
                justify="space-between"
            >
                <Col
                    span={11}
                    style={{
                        backgroundColor: "#fff",
                        padding: 10,
                    }}
                >
                    <BarChart
                        data={ruangan_summary}
                        title="Distribusi Barang per Ruangan"
                    />
                </Col>
                <Col span={11} style={{ backgroundColor: "#fff", padding: 10 }}>
                    <BarChart
                        data={jenis_summary}
                        title="Ketersediaan Barang per Jenis"
                    />
                </Col>
            </Row>
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
