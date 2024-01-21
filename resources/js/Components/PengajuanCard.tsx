import {
    CheckOutlined,
    CloseOutlined,
    EditOutlined,
    EllipsisOutlined,
    EyeOutlined,
    SettingOutlined,
} from "@ant-design/icons";
import { router } from "@inertiajs/react";
import { Card, Divider, Empty, Form, Space, Typography } from "antd";
import { ReactNode, useState } from "react";
import { JSX } from "react/jsx-runtime";
import MyModal from "./Modal";
import PemeliharaanForm from "@/Forms/PemeliharaanForm";
import PemeriksaanForm from "@/Forms/PemeriksaanBarang";

const { Meta } = Card;
const { Text } = Typography;

const layout = {
    labelCol: { span: 8 },
    wrapperCol: { span: 24 },
};

const rules = [
    {
        required: true,
        message: "Please upload a file",
    },
];
interface PengajuanItem {
    sequence_id: number;
    bidang: string;
    deskripsi: string;
    kode_status: string;
    jenis: string;
    merk: string;
    tipe: string;
    users_id: number;
    nama_lengkap: string;
    nomor_seri: string;
    nomor_urut_pendaftaran: string;
    keluhan: string;
    biaya: number;
    role: string;
}
interface ApproveProps {
    users_id: number;
    kode_status: string;
    sequence_id: number;
    merk: string;
    tipe: string;
}
const actionIconStyle = {
    marginRight: 13,
    fontSize: 16,
};
const actionStyle = {
    display: "flex",
    justifyContent: "center",
};
// modal and its properties

const PengajuanCard: React.FC<{
    items: PengajuanItem[];
    csrfToken: string | null;
}> = ({ items, csrfToken }) => {
    const [openTechCheckForm, setOpenTechCheckForm] = useState(false);
    const [loadingTechCheckForm, setLoadingTechCheckForm] = useState(false);

    // define the form
    const [pemeriksaanForm] = Form.useForm();

    const handleApprove = async (
        event: React.MouseEvent<HTMLSpanElement, MouseEvent>,
        { users_id, kode_status, sequence_id, merk, tipe }: ApproveProps,
        csrfToken: string | null
    ) => {
        // Create the approval data object
        const approvalData = {
            users_id,
            kode_status,
            sequence_id,
            csrfToken,
            // Add any other data you need for the approval
        };
        pemeriksaanForm.setFieldsValue({
            users_id: users_id,
            sequence_id: sequence_id,
            merk: merk,
            tipe: tipe,
        });

        setOpenTechCheckForm(true);
        // try {
        //     // Make the POST request to send the approval data
        //     const response = await fetch(route("admin.pengajuan.approve"), {
        //         method: "POST",
        //         headers: {
        //             "Content-Type": "application/json",
        //             "X-CSRF-TOKEN": csrfToken ? csrfToken : "",

        //             // Add any other headers you need
        //         },
        //         body: JSON.stringify(approvalData), // Convert the approval data to JSON format
        //     });

        //     if (!response.ok) {
        //         throw new Error("Network response was not ok");
        //     }

        //     const data = await response.json(); // Parse the response JSON

        //     // Handle the response data if needed
        // } catch (error) {
        //     // Handle any errors that occurred during the fetch
        //     console.error("Error:", error);
        // }

        // return users_id + kode_status + sequence_id;
    };

    const handleReject = (
        event: React.MouseEvent<HTMLSpanElement, MouseEvent>,
        { users_id, kode_status, sequence_id }: ApproveProps,
        csrfToken: string | null
    ) => {
        // return users_id + kode_status + sequence_id;
    };
    const handleView = (
        event: React.MouseEvent<HTMLSpanElement, MouseEvent>,
        { users_id, kode_status, sequence_id }: ApproveProps,
        csrfToken: string | null
    ) => {
        router.visit(route("pengajuan.riwayat", sequence_id));

        // return users_id + kode_status + sequence_id;
    };
    return (
        <>
            <Space direction="vertical" style={{ width: "100%" }}>
                {items.length > 0 ? (
                    items.map((item: PengajuanItem, index) => {
                        let actionItems:
                            | JSX.Element[]
                            | ReactNode[]
                            | undefined = [];

                        if (item.kode_status == "6") {
                            actionItems = [<EllipsisOutlined key="ellipsis" />];
                        } else if (
                            item.kode_status == "0" &&
                            item.role == "Tim IPDS"
                        ) {
                            actionItems = [
                                <div
                                    style={{
                                        color: "green",
                                    }}
                                    onClick={(event) =>
                                        handleApprove(event, item, csrfToken)
                                    }
                                >
                                    <CheckOutlined style={actionIconStyle} />{" "}
                                    Approve
                                </div>,
                                <div
                                    style={{
                                        color: "red",
                                    }}
                                    onClick={(event) =>
                                        handleReject(event, item, csrfToken)
                                    }
                                >
                                    <CloseOutlined style={actionIconStyle} />{" "}
                                    Reject
                                </div>,

                                <EllipsisOutlined key="ellipsis" />,
                            ];
                        } else if (
                            item.kode_status == "1" &&
                            item.role == "Tim BMN"
                        ) {
                            actionItems = [
                                <div
                                    style={{
                                        color: "green",
                                    }}
                                    onClick={(event) =>
                                        handleApprove(event, item, csrfToken)
                                    }
                                >
                                    <CheckOutlined style={actionIconStyle} />{" "}
                                    Approve
                                </div>,
                                <div
                                    style={{
                                        color: "red",
                                    }}
                                    onClick={(event) =>
                                        handleReject(event, item, csrfToken)
                                    }
                                >
                                    <CloseOutlined style={actionIconStyle} />{" "}
                                    Reject
                                </div>,

                                <EllipsisOutlined key="ellipsis" />,
                            ];
                        } else {
                            actionItems = [
                                <div
                                    style={{
                                        color: "green",
                                    }}
                                    onClick={(event) =>
                                        handleView(event, item, csrfToken)
                                    }
                                >
                                    <EyeOutlined style={actionIconStyle} />{" "}
                                    Lihat Pengajuan
                                </div>,
                                <div
                                    style={{
                                        color: "",
                                    }}
                                    onClick={(event) =>
                                        handleView(event, item, csrfToken)
                                    }
                                >
                                    <EditOutlined style={actionIconStyle} />{" "}
                                    Ubah Status
                                </div>,
                            ];
                        }
                        return (
                            <Card
                                key={index}
                                style={{ width: "100%" }}
                                actions={actionItems}
                            >
                                {/* <Meta
                        title=
                        description=
                    /> */}
                                <Space
                                    direction="horizontal"
                                    style={{
                                        width: "100%",
                                        justifyContent: "space-between",
                                    }}
                                >
                                    <Space direction="vertical">
                                        <Text
                                            strong
                                        >{`${item.nama_lengkap}`}</Text>
                                        <Text type="secondary">{`${item.bidang}`}</Text>
                                    </Space>
                                    <Space style={{ alignItems: "start" }}>
                                        <Text
                                            style={{ color: "#26aa99" }}
                                        >{`${item.deskripsi}`}</Text>{" "}
                                    </Space>
                                </Space>
                                <Divider />
                                <Space direction="vertical">
                                    <Text
                                        strong
                                    >{`${item.merk} ${item.tipe} (${item.jenis})`}</Text>
                                    <Text>{`Keluhan : ${item.keluhan}`}</Text>
                                </Space>
                                <Divider
                                    style={{
                                        marginTop: "12px",
                                        marginBottom: "12px",
                                    }}
                                />
                                <Space
                                    style={{
                                        width: "100%",
                                        justifyContent: "end",
                                    }}
                                >
                                    {item.kode_status == "6" ? (
                                        <Text
                                            style={{
                                                fontSize: "15px",
                                                fontWeight: "500",
                                                width: "100%",
                                                color: "#4E54C8",
                                            }}
                                        >
                                            Total Biaya Perbaikan :{" "}
                                            {new Intl.NumberFormat("id-ID", {
                                                style: "currency",
                                                currency: "IDR",
                                            }).format(item.biaya)}
                                        </Text>
                                    ) : (
                                        ""
                                    )}
                                </Space>
                            </Card>
                        );
                    })
                ) : (
                    <Card>
                        <Empty
                            description="Belum ada pengajuan"
                            image={Empty.PRESENTED_IMAGE_SIMPLE}
                        />
                    </Card>
                )}
            </Space>
            <MyModal
                cancelText="Batalkan"
                confirmLoadingModal={loadingTechCheckForm}
                title="Formulir Pemeriksaan Barang oleh IPDS"
                handleCancel={() => setOpenTechCheckForm(false)}
                handleOk={() => setOpenTechCheckForm(false)}
                openModal={openTechCheckForm}
            >
                <PemeriksaanForm
                    onFinish={(values) => console.log({ values })}
                    form={pemeriksaanForm}
                />
            </MyModal>
        </>
    );
};

export default PengajuanCard;
