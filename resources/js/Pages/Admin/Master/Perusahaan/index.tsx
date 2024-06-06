import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head, router } from "@inertiajs/react";
import { PageProps, PenanggungJawab, Perusahaan } from "@/types";

import {
    ReactElement,
    JSXElementConstructor,
    ReactPortal,
    useEffect,
    useState,
} from "react";
import {
    Button,
    Divider,
    Form,
    Input,
    Space,
    Table,
    message,
    Popconfirm,
    Select,
} from "antd";
import { EditOutlined, DeleteOutlined, PlusOutlined } from "@ant-design/icons";
import React from "react";
import {
    ColumnFilterItem,
    ColumnsType,
    CompareFn,
    SortOrder,
} from "antd/es/table/interface";
import MyModal from "@/Components/Modal";
import MasterRuanganForm from "@/Forms/MasterRuanganForm";
import axios from "axios";
import PerusahaanForm from "./Forms/PerusahaaanForm";
import PenanggungjawabForm from "./Forms/PenanggungjawabForm";

interface DataType {
    key: React.Key;
    nama: string;
}
const { Search } = Input;
const MasterRuangan = ({
    master_perusahaan,
    master_pj,
}: PageProps & {
    master_perusahaan: Perusahaan[];
    master_pj: PenanggungJawab[];
}) => {
    console.log({ master_pj });
    const [searchText, setSearchText] = useState("");
    const [searchLoading, setSearchLoading] = useState(false);
    const [messageApi, contextHolder] = message.useMessage();
    const saveKey = "updatable";

    const [itemAddForm] = Form.useForm();
    const [itemEditForm] = Form.useForm();

    const [pjAddForm] = Form.useForm();
    const [pjEditForm] = Form.useForm();

    // modal
    const [openModal, setOpenModal] = useState(false);
    const [openModalUbah, setOpenModalUbah] = useState(false);
    const [openPjModal, setOpenPjModal] = useState(false);
    const [openPjModalUbah, setOpenPjModalUbah] = useState(false);

    const [confirmLoadingModal, setConfirmLoadingModal] = useState(false);
    const [confirmLoadingModalUbah, setConfirmLoadingModalUbah] =
        useState(false);

    const [dataSource, setDataSource] = useState<Perusahaan[]>([]);
    const [daftarPj, setDaftarPj] = useState<PenanggungJawab[]>([]);

    useEffect(() => {
        setTimeout(() => {
            let data_master = master_perusahaan.map(
                ({
                    id,
                    nama,
                    alamat,
                    npwp,
                    nomor_rekening,
                    penanggung_jawab_id,
                    bank,
                }) => ({
                    key: id,
                    id,
                    nama,
                    alamat,
                    npwp,
                    nomor_rekening,
                    penanggung_jawab_id,
                    bank,
                })
            );

            setDataSource(data_master);

            let masterPj = master_pj.map((item) => ({
                id: item.id,
                key: item.id,
                nama: item.nama,
                jabatan: item.jabatan,
                perusahaan_id: item.perusahaan_id,
                nomor_wa: item.nomor_wa,
                email: item.email,
            }));
            setDaftarPj(masterPj);
        }, 0);
    }, [master_perusahaan]);

    const onSearch = async (value: string) => {
        setSearchLoading(true);
        setSearchText(value);
        setSearchLoading(false);
    };
    const handleAdd = () => {
        itemAddForm.resetFields();
        setOpenModal(true);
    };
    const handlePjAdd = () => {
        pjAddForm.resetFields();
        setOpenPjModal(true);
    };

    const handleOk = async () => {
        itemAddForm.submit();
        setOpenModal(false);
        setConfirmLoadingModal(false);
    };

    const handleOkUbah = async () => {
        try {
            const isValid = itemEditForm.validateFields();
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
    const handlePjCancel = () => {
        setOpenPjModal(false);
    };
    const handlePjCancelUbah = () => {
        setOpenPjModalUbah(false);
    };
    const handlePjOk = async () => {
        pjAddForm.submit();
        setOpenPjModal(false);
        setConfirmLoadingModal(false);
    };

    const handlePjOkUbah = async () => {
        try {
            const isValid = pjEditForm.validateFields();
            pjEditForm.submit();
            setOpenPjModalUbah(false);
            setConfirmLoadingModalUbah(false);
        } catch (error) {}
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
    async function handleDelete(key: React.Key | string) {
        if (key === 0) return;
        const saveKey = "Hapus Perusahaan";
        try {
            messageApi.open({
                key: saveKey,
                content: "Sedang menghapus data...",
                type: "loading",
            });
            const response = await axios.delete(
                route("master_perusahaan.destroy", { id: key })
            );
            router.get(
                route("admin.master.perusahaan"),
                {},
                { preserveScroll: true, preserveState: true }
            );
            messageApi.open({
                key: saveKey,
                content: "berhasil menghapus data...",
                type: "error",
            });
        } catch (error) {
            console.log("error", { error });
        }
    }
    async function handlePjDelete(key: React.Key | string) {
        if (key === 0) return;
        const saveKey = "Hapus Penanggungjawab";
        try {
            messageApi.open({
                key: saveKey,
                content: "Sedang menghapus data...",
                type: "loading",
            });
            const response = await axios.delete(
                route("admin.master.penanggungjawab.destroy", { id: key })
            );
            router.get(
                route("admin.master.perusahaan"),
                {},
                { preserveScroll: true, preserveState: true }
            );
            messageApi.open({
                key: saveKey,
                content: "berhasil menghapus data...",
                type: "error",
            });
        } catch (error) {
            console.log("error", { error });
        }
    }
    const AddFinish: (values: Perusahaan) => void = async (
        values: Perusahaan
    ) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            const url = route("master_perusahaan.store");
            const { data } = await axios.post(url, values, {
                headers: {
                    "Content-Type": "application/json",
                },
            });
            messageApi.open({
                key: saveKey,
                content: "Berhasil menambahkan data",
                type: "success",
            });
            router.get(route("admin.master.perusahaan"));
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
        }
    };
    const EditFinish: (values: Perusahaan) => void = async (
        values: Perusahaan
    ) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            const url = route("master_perusahaan.update");
            const { data } = await axios.patch(url, values, {
                headers: {
                    "Content-Type": "application/json",
                },
            });
            messageApi.open({
                key: saveKey,
                content: "Berhasil menyimpan perubahan",
                type: "success",
            });

            router.get(
                route("admin.master.perusahaan"),
                {},
                { preserveState: true, preserveScroll: true }
            );
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
            return 0;
        }
    };
    const AddPjFinish: (values: Perusahaan) => void = async (
        values: Perusahaan
    ) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            const url = route("admin.master.penanggungjawab.store");
            const { data } = await axios.post(url, values, {
                headers: {
                    "Content-Type": "application/json",
                },
            });
            messageApi.open({
                key: saveKey,
                content: "Berhasil menambahkan data",
                type: "success",
            });
            router.get(route("admin.master.perusahaan"));
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
        }
    };
    const EditPjFinish: (values: Perusahaan) => void = async (
        values: Perusahaan
    ) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            const url = route("admin.master.penanggungjawab.update");
            const { data } = await axios.patch(url, values, {
                headers: {
                    "Content-Type": "application/json",
                },
            });
            messageApi.open({
                key: saveKey,
                content: "Berhasil menyimpan perubahan",
                type: "success",
            });

            router.get(
                route("admin.master.perusahaan"),
                {},
                { preserveState: true, preserveScroll: true }
            );
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
            return 0;
        }
    };

    const handlePerusahaanSelect = async (value: string) => {
        try {
            const url = route("master.penanggungjawab.fetch", {
                id: value,
            });
            const { data } = await axios.get(url);
            setDaftarPj(data.data);
        } catch (error) {
            console.log("error occured");
        }
    };

    const namaSorter: Sorter<Perusahaan> = createSorter("nama");

    interface Column {
        key?: React.Key;
        title: string;
        dataIndex: string;
        sorter?: CompareFn<object>;
        editable?: boolean;
        filters?: ColumnFilterItem[];
        onCell?: (record: DataType) => object;
        render?: (value: any, record: Perusahaan) => React.ReactNode;
    }

    const defaultColumns: ColumnsType<Perusahaan> = [
        // {
        //     title: "id",
        //     dataIndex: "key",

        //     // sorter: namaSorter as CompareFn<object>,
        // },
        {
            title: "Nama Perusahaan Penyedia",
            dataIndex: "nama",
        },
        {
            title: "Alamat Perusahaan",
            dataIndex: "alamat",
        },
        {
            title: "NPWP",
            dataIndex: "npwp",
        },
        {
            title: "Bank",
            dataIndex: "bank",
        },
        {
            title: "Nomor Rekening",
            dataIndex: "nomor_rekening",
        },

        {
            title: "edit",
            render: (_, record) => (
                <Button
                    onClick={() => {
                        setOpenModalUbah(true);
                        itemEditForm.setFieldsValue({
                            id: record.id,
                            nama: record.nama,
                            alamat: record.alamat,
                            npwp: record.npwp,

                            bank: record.bank,
                            nomor_rekening: record.nomor_rekening,
                        });
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
    const PenanggungJawabColumn: ColumnsType<PenanggungJawab> = [
        // {
        //     title: "id",
        //     dataIndex: "key",

        //     // sorter: namaSorter as CompareFn<object>,
        // },
        {
            title: "Nama Penanggungjawab",
            dataIndex: "nama",
        },
        {
            title: "Jabatan",
            dataIndex: "jabatan",
        },
        {
            title: "Nomor Telepon/WA",
            dataIndex: "nomor_wa",
        },
        {
            title: "Email",
            dataIndex: "email",
        },
        {
            title: "Nama Perusahaan",
            dataIndex: "perusahaan_id",
            render: (_) => {
                let perusahaan = master_perusahaan.filter(
                    (perusahaan) => perusahaan.id == _
                );
                return perusahaan[0]
                    ? perusahaan[0].nama
                    : "Perusahaan tidak ditemukan";
            },
        },

        {
            title: "edit",
            render: (_, record) => (
                <Button
                    onClick={() => {
                        setOpenPjModalUbah(true);
                        pjEditForm.setFieldsValue({
                            id: record.id,
                            nama: record.nama,
                            jabatan: record.jabatan,
                            email: record.email,
                            nomor_wa: record.nomor_wa,
                            perusahaan_id: record.perusahaan_id,
                        });
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
                        onConfirm={() => handlePjDelete(record.key ?? 0)}
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
        <>
            <div>
                <Head title="Master Perusahaan" />
                <MyModal
                    title={"Tambah Master Perusahaan"}
                    openModal={openModal}
                    handleOk={handleOk}
                    confirmLoadingModal={confirmLoadingModal}
                    handleCancel={handleCancel}
                    okText="Tambahkan"
                    cancelText="Batal"
                >
                    <PerusahaanForm
                        name="perusahaanAddForm"
                        form={itemAddForm}
                        onFinish={AddFinish}
                    />
                </MyModal>
                <MyModal
                    title={"Ubah Master Perusahaan"}
                    openModal={openModalUbah}
                    handleOk={handleOkUbah}
                    confirmLoadingModal={confirmLoadingModalUbah}
                    handleCancel={handleCancelUbah}
                    okText="Simpan"
                    cancelText="Batal"
                >
                    <PerusahaanForm
                        name="perusahaanEditForm"
                        form={itemEditForm}
                        onFinish={EditFinish}
                    />
                </MyModal>

                {contextHolder}
                <h1>Master Perusahaan</h1>
                <Divider />
                <Space
                    style={{ display: "flex", justifyContent: "space-between" }}
                >
                    <Search
                        placeholder="Cari perusahaan ..."
                        allowClear
                        onSearch={onSearch}
                        loading={searchLoading}
                        style={{ width: 200, marginBottom: "20px" }}
                    />
                    <Button
                        onClick={handleAdd}
                        type="primary"
                        style={{ marginBottom: 16 }}
                        icon={<PlusOutlined />}
                    >
                        Tambah Perusahaan
                    </Button>
                </Space>

                <Table
                    rowClassName={() => "editable-row"}
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

            {/* Penanggungjawab Perusahaan */}
            <div>
                {/* <Head title="Penanggungjawab Perusahaan" /> */}
                <MyModal
                    title={"Tambah Penanggungjawab Perusahaan"}
                    openModal={openPjModal}
                    handleOk={handlePjOk}
                    confirmLoadingModal={confirmLoadingModal}
                    handleCancel={handlePjCancel}
                    okText="Tambahkan"
                    cancelText="Batal"
                >
                    <PenanggungjawabForm
                        name="penanggungjawabAddForm"
                        form={pjAddForm}
                        onFinish={AddPjFinish}
                        masterPerusahaan={master_perusahaan}
                    />
                </MyModal>
                <MyModal
                    title={"Ubah Penanggungjawab Perusahaan"}
                    openModal={openPjModalUbah}
                    handleOk={handlePjOkUbah}
                    confirmLoadingModal={confirmLoadingModalUbah}
                    handleCancel={handlePjCancelUbah}
                    okText="Simpan"
                    cancelText="Batal"
                >
                    <PenanggungjawabForm
                        name="penanggungjawabAddForm"
                        form={pjEditForm}
                        onFinish={EditPjFinish}
                        masterPerusahaan={master_perusahaan}
                    />
                </MyModal>

                {contextHolder}
                <h1>Penanggungjawab Perusahaan</h1>
                <Divider />
                <Space
                    style={{
                        display: "flex",
                        justifyContent: "space-between",
                    }}
                >
                    <Select
                        style={{ width: 200 }}
                        showSearch
                        onSelect={handlePerusahaanSelect}
                        options={[
                            { label: "All", value: 0 },
                            ...master_perusahaan.map((perusahaan) => ({
                                label: perusahaan.nama,
                                value: perusahaan.id,
                            })),
                        ]}
                    />
                    <Button
                        onClick={handlePjAdd}
                        type="primary"
                        style={{ marginBottom: 16 }}
                        icon={<PlusOutlined />}
                    >
                        Tambah Penanggungjawab
                    </Button>
                </Space>

                <Table
                    rowClassName={() => "editable-row"}
                    bordered
                    dataSource={daftarPj.filter((item) =>
                        Object.values(item)
                            .join("")
                            .toLowerCase()
                            .includes(searchText.toLowerCase())
                    )}
                    columns={PenanggungJawabColumn}
                />
            </div>
        </>
    );
};

MasterRuangan.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Master Perusahaan</h2>}
        selectedKey="admin.master.perusahaan"
        children={page}
    ></AuthenticatedLayout>
);
export default MasterRuangan;
