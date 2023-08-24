import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head, router } from "@inertiajs/react";
import { BastType, PageProps } from "@/types";
import dayjs from "dayjs";

import {
    ReactElement,
    JSXElementConstructor,
    ReactPortal,
    useRef,
    useContext,
    useEffect,
    useState,
} from "react";
import {
    Button,
    Divider,
    Form,
    Input,
    Space,
    // Table,
    message,
    Popconfirm,
    Dropdown,
    MenuProps,
    DatePicker,
    Table,
} from "antd";
import {
    EditOutlined,
    CaretDownOutlined,
    MedicineBoxOutlined,
    MailOutlined,
    WarningOutlined,
    StopOutlined,
    CheckCircleOutlined,
} from "@ant-design/icons";
import React from "react";
import {
    ColumnFilterItem,
    ColumnsType,
    CompareFn,
    SortOrder,
} from "antd/es/table/interface";
import MyModal from "@/Components/Modal";
import Bast from "@/Components/Bast";
import HistoryBarangForm from "@/Forms/HistoryBarangForm";

import { Maintenance, DataType } from "@/types";
import axios from "axios";

import PemeliharaanForm from "@/Forms/PemeliharaanForm";

const { Search } = Input;

const BarangPage = ({
    maintenance_list,
}: PageProps & { maintenance_list: Maintenance[] }) => {
    // console.log({ maintenance_list });

    const csrfTokenRef = useRef<string | null>(null);
    const csrfTokenMeta = document.querySelector('meta[name="csrf-token"]');
    const [searchText, setSearchText] = useState("");
    const [searchLoading, setSearchLoading] = useState(false);
    const [messageApi, contextHolder] = message.useMessage();
    const saveKey = "updatable";
    const [itemAddForm] = Form.useForm();
    const [currentMaintenanceId, setCurrentMaintenanceId] = useState(0); //

    // modal
    const [openModal, setOpenModal] = useState(false);

    const handleCancel = () => {
        setOpenModal(false);
    };

    const [openModalUbah, setOpenModalUbah] = useState(false);

    const [openBast, setOpenBast] = useState(false);

    const [openPengajuan, setOpenPengajuan] = useState(false);

    const [confirmLoadingModal, setConfirmLoadingModal] = useState(false);
    const [confirmLoadingModalUbah, setConfirmLoadingModalUbah] =
        useState(false);
    const [confirmLoadingBast, setConfirmLoadingBast] = useState(false);
    const [confirmLoadingPengajuan, setConfirmLoadingPengajuan] =
        useState(false);

    const handleOkPengajuan = async () => {
        // handle opening
        pengajuanForm.submit();
        setOpenPengajuan(false);
        setConfirmLoadingPengajuan(false);
    };
    const handleCancelPengajuan = () => {
        setOpenPengajuan(false);
    };

    const handleOk = async () => {
        itemAddForm.submit();
        setOpenModal(false);
        setConfirmLoadingModal(false);
    };
    const handleOkUbah = async () => {
        itemAddForm.submit();
        setOpenModalUbah(false);
        setConfirmLoadingModalUbah(false);
    };
    const handleOkBast = async () => {
        // handle opening
        setOpenBast(false);
        setConfirmLoadingBast(false);
    };

    const handleCancelUbah = () => {
        setOpenModalUbah(false);
    };
    const handleCancelBast = () => {
        setOpenBast(false);
    };

    console.log({ maintenance_list });

    const data_master = maintenance_list.map(
        ({
            id,
            barang_id,
            biaya,
            bukti_rusak_berat,
            catatan_admin,
            created_at,
            updated_at,
            keluhan,
            kondisi_final,
            status,
            users_id,
            maintenance_id,
            jenis,
            merk,
            tipe,
            nomor_seri,
        }): Maintenance => ({
            id,
            key: id,
            barang_id,
            biaya,
            bukti_rusak_berat,
            catatan_admin,
            created_at,
            updated_at,
            keluhan,
            kondisi_final,
            status,
            users_id,
            maintenance_id,
            jenis,
            merk,
            tipe,
            nomor_seri,
        })
    );
    const [dataSource, setDataSource] = useState<Maintenance[]>(data_master);
    // data for current barang bast
    const [dataBast, setDataBast] = useState<BastType[]>([]);

    useEffect(() => {
        if (csrfTokenMeta) {
            csrfTokenRef.current = csrfTokenMeta.getAttribute("content");
        }
    }, []);
    useEffect(() => {
        setTimeout(() => {
            let data_master = maintenance_list.map(
                ({
                    id,
                    barang_id,
                    biaya,
                    bukti_rusak_berat,
                    catatan_admin,
                    created_at,
                    updated_at,
                    keluhan,
                    kondisi_final,
                    status,
                    users_id,
                    maintenance_id,
                    jenis,
                    merk,
                    tipe,
                    nomor_seri,
                }): Maintenance => ({
                    id,
                    key: id,
                    barang_id,
                    biaya,
                    bukti_rusak_berat,
                    catatan_admin,
                    created_at,
                    updated_at,
                    keluhan,
                    kondisi_final,
                    status,
                    users_id,
                    maintenance_id,
                    jenis,
                    merk,
                    tipe,
                    nomor_seri,
                })
            ) as Maintenance[];

            setDataSource(data_master);
        }, 0);
    }, [maintenance_list]);

    const onSearch = async (value: string) => {
        setSearchLoading(true);
        setSearchText(value);
        setSearchLoading(false);
    };
    const handleAdd = () => {
        itemAddForm.resetFields();
        setOpenModal(true);
    };

    type Sorter<T> = (a: T, b: T, sortOrder?: SortOrder) => number;

    function createSorter<T>(property: keyof T): Sorter<T> {
        return (a: T, b: T, sortOrder?: SortOrder): number => {
            const valueA = String(a[property]);
            const valueB = String(b[property]);

            if (sortOrder === "ascend") {
                return valueA.localeCompare(valueB);
            }

            if (sortOrder === "descend") {
                return -valueB.localeCompare(valueA);
            }

            return 0;
        };
    }
    function handleDelete(key: React.Key | string): void {
        if (key === 0) return;
        router.delete(route("maintenance_list.destroy", { id: key }), {
            // method: "delete",
            preserveState: true,
            preserveScroll: true,
            onStart: () =>
                messageApi.open({
                    key: saveKey,
                    content: "Menghapus dari master",
                    type: "loading",
                }),
            onSuccess: (responsePage) => {
                console.log({ responsePage });
                const response: any = responsePage.props.response;
                if (response.errors?.length > 1) {
                    return messageApi.open({
                        key: saveKey,
                        content: response.errors,
                        type: "error",
                    });
                }
                messageApi.open({
                    key: saveKey,
                    content: "Berhasil menghapus data",
                    type: "success",
                });
                return 1;
            },
            onFinish: () => {},

            onError: (event) => console.log(`Error! ${event}`),
        });
    }
    const onFinishAdd: (values: any) => any = (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            router.post(route("maintenance_list.store"), values, {
                onSuccess: (responsePage) => {
                    const response: any = responsePage.props.response;
                    console.log({ response });
                    if (response.errors?.length > 1) {
                        return messageApi.open({
                            key: saveKey,
                            content: response.errors,
                            type: "error",
                        });
                    }
                    messageApi.open({
                        key: saveKey,
                        content: "Berhasil menambahkan data",
                        type: "success",
                    });

                    return 1;
                },
            });
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
            return 0;
        }
    };
    const onFinishEdit: (values: any) => any = (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            router.patch(route("maintenance_list.update"), values, {
                onSuccess: (responsePage) => {
                    const response: any = responsePage.props.response;
                    // console.log({ response });
                    if (response.errors?.length > 1) {
                        return messageApi.open({
                            key: saveKey,
                            content: response.errors,
                            type: "error",
                        });
                    }
                    messageApi.open({
                        key: saveKey,
                        content: "Berhasil menyimpan perubahan data",
                        type: "success",
                    });

                    return 1;
                },
            });
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
            return 0;
        }
    };
    const [pengajuanForm] = Form.useForm();
    const pengajuanFinish = (values: any) => {
        try {
            router.post(route("maintenance.update"), values, {
                onStart: () => {
                    messageApi.open({
                        key: saveKey,
                        content: "Sedang menyimpan...",
                        type: "loading",
                    });
                },
                onSuccess: (responsePage) => {
                    const response: any = responsePage.props;
                    // console.log({ response });
                    if (response.errors?.length > 1) {
                        return messageApi.open({
                            key: saveKey,
                            content: response.errors,
                            type: "error",
                        });
                    }
                    messageApi.open({
                        key: saveKey,
                        content: "Berhasil menyimpan data",
                        type: "success",
                    });

                    return 1;
                },
            });
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
            return 0;
        }
    };
    const biayaSorter: Sorter<Maintenance> = createSorter("biaya");
    interface Column {
        key?: React.Key;
        title: string;
        dataIndex: string;
        sorter?: CompareFn<object>;
        editable?: boolean;
        filters?: ColumnFilterItem[];
        onCell?: (record: DataType) => object;
        render?: (value: any, record: Maintenance) => React.ReactNode;
    }

    const defaultColumns: ColumnsType<Maintenance> = [
        // {
        //     title: "sequence_id",
        //     dataIndex: "id",

        // },
        // {
        //     title: "maintenance_id",
        //     dataIndex: "maintenance_id",
        // },
        {
            title: "nama barang",
            render: (value: any, record: Maintenance) =>
                record.merk + record.tipe,
        },
        {
            title: "status",
            dataIndex: "status",
            filters: [
                { text: "Pending", value: "Pending" },
                { text: "Dalam Proses IPDS", value: "Dalam Proses IPDS" },
                { text: "Dalam Proses Rekanan", value: "Dalam Proses Rekanan" },
                { text: "Diperiksa IPDS", value: "Diperiksa IPDS" },
                { text: "Diperiksa Pengguna", value: "Diperiksa Pengguna" },
                { text: "Selesai", value: "Selesai" },
            ],
            onFilter: (value: string | number | boolean, record: Maintenance) =>
                record.status.trim().toLowerCase() ===
                String(value).toLowerCase(),
        },

        {
            title: "bukti rusak berat",
            dataIndex: "bukti_rusak_berat",
        },
        {
            title: "catatan admin",
            dataIndex: "catatan_admin",
        },
        {
            title: "keluhan",
            dataIndex: "keluhan",
        },

        {
            title: "kondisi final",
            dataIndex: "kondisi_final",
            filters: [
                {
                    text: "Baik",
                    value: "Baik",
                },
                {
                    text: "Rusak Ringan",
                    value: "Rusak Ringan",
                },
                {
                    text: "Rusak Berat",
                    value: "Rusak Berat",
                },
            ],
            onFilter: (value: string | number | boolean, record: Maintenance) =>
                record.kondisi_final.trim().toLowerCase() ===
                String(value).toLowerCase(),
            render: (value: string) => {
                if (value === "Baik")
                    return (
                        <>
                            <CheckCircleOutlined style={{ color: "green" }} />{" "}
                            Baik
                        </>
                    );
                if (value === "Rusak Ringan")
                    return (
                        <>
                            <WarningOutlined style={{ color: "orange" }} />{" "}
                            Rusak Ringan
                        </>
                    );
                if (value === "Rusak Berat")
                    return (
                        <>
                            <StopOutlined style={{ color: "red" }} /> Rusak
                            Berat
                        </>
                    );
                return value;
            },
        },

        {
            title: "operation",
            dataIndex: "operation",
            fixed: "right",
            render: (_, record: Maintenance) => {
                const items: MenuProps["items"] = [
                    {
                        label: (
                            <a>
                                <EditOutlined /> Ubah
                            </a>
                        ),
                        key: "0",
                        onClick: () => {
                            pengajuanForm.setFieldValue(
                                "sequence_id",
                                record.id
                            );
                            pengajuanForm.setFieldValue(
                                "barang_id",
                                record.barang_id
                            );
                            pengajuanForm.setFieldValue(
                                "users_id",
                                record.users_id
                            );
                            pengajuanForm.setFieldValue("merk", record.merk);
                            pengajuanForm.setFieldValue("tipe", record.tipe);

                            pengajuanForm.setFieldValue(
                                "keluhan",
                                record.keluhan
                            );
                            setOpenPengajuan(true);
                        },
                    },
                ];
                return dataSource.length >= 1 ? (
                    <Dropdown
                        menu={{ items }}
                        trigger={["hover"]}
                        placement="bottomRight"
                    >
                        <Button
                            style={{
                                color: "#fff",
                            }}
                            onClick={(e) => e.preventDefault()}
                            type="primary"
                        >
                            <Space>
                                Aksi
                                <CaretDownOutlined />
                            </Space>
                        </Button>
                    </Dropdown>
                ) : null;
            },
        },
    ];

    return (
        <div>
            <Head title="History Barang" />
            <MyModal
                title={"Tambah History Barang"}
                openModal={openModal}
                handleOk={handleOk}
                confirmLoadingModal={confirmLoadingModal}
                handleCancel={handleCancel}
                okText="Tambahkan"
                cancelText="Batal"
            >
                <Divider />
                <HistoryBarangForm form={itemAddForm} onFinish={onFinishAdd} />
            </MyModal>

            <MyModal
                title="Form Pemeliharaan Barang"
                openModal={openPengajuan}
                handleOk={handleOkPengajuan}
                confirmLoadingModal={confirmLoadingPengajuan}
                handleCancel={handleCancelPengajuan}
                okText="Simpan Perubahan"
                cancelText="Batal"
                width={600}
            >
                <Divider />
                <PemeliharaanForm
                    form={pengajuanForm}
                    onFinish={pengajuanFinish}
                />
            </MyModal>

            {contextHolder}
            <h1>Daftar Pemeliharaanku</h1>
            <Divider />
            <Space style={{ display: "flex", justifyContent: "space-between" }}>
                <Search
                    placeholder="Cari info pengajuan ..."
                    allowClear
                    onSearch={onSearch}
                    loading={searchLoading}
                    style={{ width: 200, marginBottom: "20px" }}
                />
            </Space>

            <Table
                rowClassName={() => "editable-row"}
                scroll={{ x: 1500 }}
                bordered
                dataSource={dataSource.filter((item) =>
                    Object.values(item)
                        .join("")
                        .toLowerCase()
                        .includes(searchText.toLowerCase())
                )}
                columns={defaultColumns}
            />
        </div>
    );
};

BarangPage.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Pengajuan Saya</h2>}
        selectedKey="pengajuan"
        children={page}
    ></AuthenticatedLayout>
);
export default BarangPage;
