import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head, router } from "@inertiajs/react";
import { PageProps } from "@/types";
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
    FormInstance,
    Input,
    InputRef,
    Modal,
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
    DeleteOutlined,
    PlusOutlined,
    CheckCircleOutlined,
    WarningOutlined,
    StopOutlined,
} from "@ant-design/icons";
import React from "react";
import {
    ColumnFilterItem,
    ColumnType,
    ColumnsType,
    CompareFn,
    SortOrder,
} from "antd/es/table/interface";
import MyModal from "@/Components/Modal";
import HistoryBarangForm from "@/Forms/HistoryBarangForm";
import { findSourceMap } from "module";
import { Barang, DataType } from "@/types";
import BarangForm from "@/Forms/BarangForm";
import axios from "axios";

// const ExportableTablex = ExportableTable(Table);

const { Search } = Input;
const BarangPage = ({
    history_barang,
}: PageProps & { history_barang: Barang[] }) => {
    // console.log({ history_barang });
    const csrfTokenRef = useRef<string | null>(null);
    const csrfTokenMeta = document.querySelector('meta[name="csrf-token"]');
    const [searchText, setSearchText] = useState("");
    const [searchLoading, setSearchLoading] = useState(false);
    const [messageApi, contextHolder] = message.useMessage();
    const saveKey = "updatable";
    const [itemAddForm] = Form.useForm();
    const [itemEditForm] = Form.useForm();

    // modal
    const [openModal, setOpenModal] = useState(false);
    const [openModalUbah, setOpenModalUbah] = useState(false);
    const [confirmLoadingModal, setConfirmLoadingModal] = useState(false);
    const [confirmLoadingModalUbah, setConfirmLoadingModalUbah] =
        useState(false);
    const handleOk = async () => {
        itemAddForm.submit();
        setOpenModal(false);
        setConfirmLoadingModal(false);
    };
    const handleOkUbah = async () => {
        try {
            const validForm = await itemEditForm.validateFields();
            itemEditForm.submit();
            setOpenModalUbah(false);
            setConfirmLoadingModalUbah(false);
        } catch (error) {}
    };
    const handleCancel = () => {
        setOpenModal(false);
    };
    const handleCancelUbah = () => {
        setOpenModalUbah(false);
    };
    //end modal

    const [dataSource, setDataSource] = useState<Barang[]>([]);

    useEffect(() => {
        if (csrfTokenMeta) {
            csrfTokenRef.current = csrfTokenMeta.getAttribute("content");
        }
    }, []);
    useEffect(() => {
        setTimeout(() => {
            const data_master = history_barang.map(
                ({
                    barang_id,
                    jenis,
                    merk,
                    tipe,
                    tanggal_peroleh,
                    nomor_seri,
                    kondisi,
                    ruangan_nama,
                    nama_lengkap,
                    id,
                    users_id,
                    ruangan_id,
                    bast_path,
                    is_approved,
                    nomor_urut_pendaftaran,
                    sistem_operasi_id,
                    created_at,
                }): Barang => ({
                    barang_id,
                    key: id,
                    jenis,
                    merk,
                    tipe,
                    tanggal_peroleh,
                    nomor_seri,
                    kondisi,
                    ruangan_nama,
                    nama_lengkap,
                    id,
                    users_id,
                    ruangan_id,
                    bast_path,
                    is_approved,
                    nomor_urut_pendaftaran,
                    sistem_operasi_id,
                    created_at,
                })
            );

            setDataSource(data_master);
            console.log("changeeeee", { dataSource });
        }, 0);
    }, [history_barang]);

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
                // if (valueA < valueB) return -1;
                // if (valueA > valueB) return 1;
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
        router.delete(route("history_barang.destroy", { id: key }), {
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
            router.post(route("history_barang.store"), values, {
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
    const onFinishEdit: (values: any) => any = async (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menyimpan perubahan...",
            type: "loading",
        });

        try {
            const url = route("barang.update");
            const response = await axios.patch(url, values, {
                headers: { "Content-Type": "application/json" },
            });

            messageApi.open({
                key: saveKey,
                content: "Berhasil menyimpan perubahan data",
                type: "success",
            });
            router.get(
                route("admin.kelola.history_barang.index"),
                {},
                {
                    preserveScroll: true,
                    preserveState: true,
                }
            );
        } catch (error: any) {
            // console.log({ error });

            messageApi.open({
                key: saveKey,
                content: error.response.data.error,
                type: "error",
            });
        }
    };
    const jenisSorter: Sorter<Barang> = createSorter("jenis");
    const tipeSorter: Sorter<Barang> = createSorter("tipe");
    const merkSorter: Sorter<Barang> = createSorter("merk");
    const nomorSeriSorter: Sorter<Barang> = createSorter("nomor_seri");
    const tahunPerolehSorter: Sorter<Barang> = createSorter("tanggal_peroleh");

    const defaultColumns: ColumnsType<Barang> = [
        {
            title: "jenis",
            dataIndex: "jenis",
            filters: [
                {
                    text: "PC",
                    value: "PC",
                },
                {
                    text: "Laptop",
                    value: "Laptop",
                },
            ],
            onFilter: (value: string | number | boolean, record: Barang) =>
                record.jenis === value,
            sorter: jenisSorter as CompareFn<object>,
        },
        {
            title: "merk",
            dataIndex: "merk",
            sorter: merkSorter as CompareFn<object>,
        },
        {
            title: "tipe",
            dataIndex: "tipe",
            sorter: tipeSorter as CompareFn<object>,
        },
        {
            title: "tanggal_peroleh",
            dataIndex: "tanggal_peroleh",
            sorter: tahunPerolehSorter as CompareFn<object>,
            render: (value: any) => {
                try {
                    let formattedDate = new Intl.DateTimeFormat("en-GB", {
                        day: "numeric",
                        month: "short",
                        year: "numeric",
                    }).format(new Date(value));
                    return formattedDate;
                } catch (error) {
                    return value;
                }
            },
        },
        {
            title: "nomor_seri",
            dataIndex: "nomor_seri",
            sorter: nomorSeriSorter as CompareFn<object>,
        },
        {
            title: "nomor_urut_pendaftaran",
            dataIndex: "nomor_urut_pendaftaran",
        },
        {
            title: "kondisi",
            dataIndex: "kondisi",
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
            onFilter: (value: string | number | boolean, record: Barang) =>
                record.kondisi.trim().toLowerCase() ===
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
            // sorter: nomorSeriSorter as CompareFn<object>,
        },
        {
            title: "ruangan_nama",
            dataIndex: "ruangan_nama",
            // sorter: nomorSeriSorter as CompareFn<object>,
        },
        {
            title: "Nama Pemegang",
            dataIndex: "nama_lengkap",
            // sorter: nomorSeriSorter as CompareFn<object>,
        },
        {
            title: "edit",
            render: (_, record) => (
                <Button
                    onClick={() => {
                        setOpenModalUbah(true);

                        // itemEditForm.setFieldsValue(record);
                        itemEditForm.setFieldValue("id", record.key);
                        itemEditForm.setFieldValue("jenis", record.jenis);
                        itemEditForm.setFieldValue("merk", record.merk);
                        itemEditForm.setFieldValue("tipe", record.tipe);
                        itemEditForm.setFieldValue("users_id", record.users_id);
                        itemEditForm.setFieldValue("kondisi", record.kondisi);
                        // itemEditForm.setFieldValue("kondisi", "Rusak Berat");
                        itemEditForm.setFieldValue(
                            "sistem_operasi_id",
                            record.sistem_operasi_id
                        );
                        itemEditForm.setFieldValue(
                            "ruangan_id",
                            record.ruangan_id
                        );
                        itemEditForm.setFieldValue(
                            "tanggal_peroleh",
                            dayjs(record.tanggal_peroleh)
                        );
                        itemEditForm.setFieldValue(
                            "nomor_urut_pendaftaran",
                            record.nomor_urut_pendaftaran
                        );
                        itemEditForm.setFieldValue(
                            "nomor_seri",
                            record.nomor_seri
                        );
                    }}
                >
                    <EditOutlined />
                    edit
                </Button>
            ),
        },
        {
            title: "delete",
            render: (_: any, record: any) => (
                <Button>
                    <Popconfirm
                        title="Hapus dari master"
                        description="Apakah anda yakin akan menghapus ini ? "
                        onConfirm={() => handleDelete(record.key ?? 0)}
                        onCancel={() => console.log("Cancel")}
                        okText="Ya"
                        cancelText="Batalkan"
                    >
                        <DeleteOutlined /> Hapus
                    </Popconfirm>
                </Button>
            ),
        },
    ];

    return (
        <Space direction="vertical" style={{ width: "100%" }}>
            <Head title="Daftar Barang Pegawai" />
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
                title={"Kelola Barang"}
                openModal={openModalUbah}
                handleOk={handleOkUbah}
                confirmLoadingModal={confirmLoadingModalUbah}
                handleCancel={handleCancelUbah}
                okText="Simpan"
                cancelText="Batal"
            >
                {/* <Divider /> */}
                <BarangForm form={itemEditForm} onFinish={onFinishEdit} />
            </MyModal>

            {contextHolder}
            <h1>Daftar Barang Pegawai</h1>
            <Divider />
            <Space style={{ display: "flex", justifyContent: "space-between" }}>
                <Search
                    placeholder="Cari barang ..."
                    allowClear
                    onSearch={onSearch}
                    loading={searchLoading}
                    style={{ width: 200, marginBottom: "20px" }}
                />
            </Space>

            <Table
                rowClassName={() => "editable-row"}
                bordered
                scroll={{ x: 1500 }}
                dataSource={dataSource.filter((item) =>
                    Object.values(item)
                        .join("")
                        .toLowerCase()
                        .includes(searchText.toLowerCase())
                )}
                columns={defaultColumns}
            />
        </Space>
    );
};

BarangPage.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Kelola History Barang</h2>}
        selectedKey="admin.kelola.history_barang.index"
        children={page}
    ></AuthenticatedLayout>
);
export default BarangPage;
