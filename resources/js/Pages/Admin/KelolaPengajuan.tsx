import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head, router } from "@inertiajs/react";

import {
    ReactElement,
    JSXElementConstructor,
    ReactPortal,
    useEffect,
    useState,
} from "react";
import {
    Input,
    MenuProps,
    Form,
    Select,
    Button,
    Table,
    Popconfirm,
} from "antd";

import axios from "axios";
import { ColumnsType } from "antd/es/table";
import { PengajuanItem } from "@/types";
import { createSorter } from "@/Functions/Sorter";
import { CompareFn, SortOrder } from "antd/es/table/interface";
import { CheckOutlined, CloseOutlined, RightOutlined } from "@ant-design/icons";
import Link from "antd/es/typography/Link";
import MyModal from "@/Components/Modal";
import PemeriksaanForm from "@/Forms/PemeriksaanBarang";
import PemeriksaanPBJPPK from "@/Forms/PemeriksaanPBJPPK";
import PemeriksaanBMN from "@/Forms/PemeriksaanBMN";
import FinishPenyedia from "./Pengajuan/Form/FinishPenyedia";
import FinishIpds from "./Pengajuan/Form/FinishIpds";

const { Search } = Input;

const KelolaPengajuanPage = () => {
    // console.log({ maintenance_list });

    const csrfMetaTag = document.querySelector('meta[name="csrf-token"]');
    const csrfToken = csrfMetaTag ? csrfMetaTag.getAttribute("content") : "";
    // console.log({ csrfTokenRef, csrfToken });
    const [searchText, setSearchText] = useState("");
    const [searchLoading, setSearchLoading] = useState(false);

    const [pemeriksaanForm] = Form.useForm();
    const [pemeriksaanPbjPpk] = Form.useForm();
    const [pemeriksaanBMN] = Form.useForm();
    const [changeStatusForm] = Form.useForm();
    const [finishIpdsForm] = Form.useForm();

    const [loadingTechCheckForm, setLoadingTechCheckForm] = useState(false);
    const [openTechCheckForm, setOpenTechCheckForm] = useState(false);

    const [loadingPbjPpkCheckForm, setLoadingPbjPpkCheckForm] = useState(false);
    const [openPbjPpkCheckForm, setOpenPbjPpkCheckForm] = useState(false);

    const [loadingBMNCheckForm, setLoadingBMNCheckForm] = useState(false);
    const [openBMNCheckForm, setOpenBMNCheckForm] = useState(false);

    const [loadingProsesPenyedia, setLoadingProseloadingProsesPenyedia] =
        useState(false);
    const [openProsesPenyedia, setOpenProsesPenyedia] = useState(false);
    const [openKembaliPengguna, setOpenKembaliPengguna] = useState(false);
    const [loadingKembaliPengguna, setLoadingKembaliPengguna] = useState(false);

    const [loadingChangeStatusForm, setLoadingChangeStatusForm] =
        useState(false);
    const [openChangeStatusForm, setOpenChangeStatusForm] = useState(false);

    const [openFinishIpds, setOpenFinishIpds] = useState(false);

    const [dataSource, setDataSource] = useState([]);
    useEffect(() => {
        const fetchData = async () => {
            try {
                // Make a fetch request to your API endpoint
                setSearchLoading(true);
                // const response = await fetch(
                //     route("admin.pengajuan.fetch", { type: "99" })
                // );


                // Parse the JSON response
                // const dataPengajuan = await response.json();
                const { data } = await axios.get(route('admin.pengajuan.fetch', { type: '99' }));
                // console.log({ data });
                // Update the state with the fetched items
                setDataSource(data);
                setSearchLoading(false);
            } catch (error) {
                console.error("Error fetching data:", error);
            }
        };

        // Call the fetch function when the component mounts
        fetchData();
        daftarStatusFetch();
    }, []);
    type Sorter<T> = (a: T, b: T, sortOrder?: SortOrder) => number;

    const jenisSorter: Sorter<PengajuanItem> = createSorter("jenis");
    const tipeSorter: Sorter<PengajuanItem> = createSorter("tipe");
    const merkSorter: Sorter<PengajuanItem> = createSorter("merk");
    const nomorSeriSorter: Sorter<PengajuanItem> = createSorter("nomor_seri");
    const PengajuanColumns: ColumnsType<PengajuanItem> = [
        {
            title: "Nomor Tiket",
            dataIndex: "id",
            render: (value: string, record: PengajuanItem) => (
                <Link href={route("pengajuan.riwayat", value)}>
                    {record.created_at.substring(0, 4)}/TI/{value}
                </Link>
            ),
        },
        {
            title: "jenis",
            dataIndex: "barang",
            render: value => value.barang.jenis,
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
            onFilter: (
                value: string | number | boolean,
                record: PengajuanItem
            ) => record.jenis === value,
            sorter: jenisSorter as CompareFn<object>,
        },
        {
            title: "Nama Barang (Merk/Type)",

            dataIndex: "barang",
            // render:value=>value.barang.jenis,
            render: (_, record: PengajuanItem) =>
                `${_.barang.merk} / ${_.barang.tipe}`,
        },
        // {
        //     title: "tipe",
        //     dataIndex: "tipe",
        //     sorter: tipeSorter as CompareFn<object>,
        // },

        {
            title: "nomor_seri",
            dataIndex: "barang",
            render: value => value.barang.nomor_seri,
            sorter: nomorSeriSorter as CompareFn<object>,
        },
        {
            title: "NUP",
            dataIndex: "barang",
            render: value => value.barang.nomor_urut_pendaftaran,
        },

        {
            title: "Status",
            dataIndex: "maintenance",
            render: (value, record: PengajuanItem) =>
                record.maintenance.length > 0 ? `${value[0].kode_status}. ${value[0].status.deskripsi}`:'as',
                // value[0].kode_status,
            // sorter: nomorSeriSorter as CompareFn<object>,
        },
        {
            title: "Nama Pemegang",
            dataIndex: "user",
            render:value=>value.nama_lengkap
            // sorter: nomorSeriSorter as CompareFn<object>,
        },
        {
            title: "keluhan pengguna",
            dataIndex: "keluhan",
        },
        {
            title: "Permasalahan",
            dataIndex: "problems",
        },
        {
            title: "Perusahaan",
            dataIndex: "perusahaan",
            render:value=>value?.nama
        },
        {
            title: "PJ Perusahaan",
            
            dataIndex: "perusahaan",
            render:value=>value?.nama_pj
        },
        {
            title: "Solusi yang diambil",
            dataIndex: "solution",
        },
        {
            title: "Kondisi Final",
            dataIndex: "kondisi_final",
        },
        {
            title: "Biaya Perbaikan",
            dataIndex: "biaya",
            render: (value: string) =>
                `Rp ${value ? Number(value).toLocaleString("id-ID") : "0,-"}`,
        },
        {
            title: "Tindakan",
            dataIndex: "tindakan",
            render: (_, record) => {
                if (record.maintenance[0].kode_status == "0")
                    return (
                        <div
                            style={{
                                display: "flex",
                                justifyContent: "space-around",
                            }}
                        >
                            <Button
                                style={{ color: "green" }}
                                onClick={() => handleApprove(record)}
                            >
                                Approve BMN <CheckOutlined />
                            </Button>
                            <Button style={{ color: "red" }}>
                                Reject <CloseOutlined />
                            </Button>
                        </div>
                    );
                else if (record.maintenance[0].kode_status == "1")
                    return (
                        <div
                            style={{
                                display: "flex",
                                justifyContent: "space-around",
                            }}
                        >
                            <Button
                                style={{ color: "green" }}
                                onClick={() => handleApprove(record)}
                            >
                                Approve IPDS <CheckOutlined />
                            </Button>
                            <Button style={{ color: "red" }}>
                                Reject <CloseOutlined />
                            </Button>
                        </div>
                    );
                else if (record.maintenance[0].kode_status == "2")
                    return (
                        <div
                            style={{
                                display: "flex",
                                justifyContent: "space-around",
                            }}
                        >
                            <Button
                                style={{ color: "green" }}
                                onClick={() => handleApprove(record)}
                            >
                                Isi Detail Penyedia <RightOutlined />
                            </Button>
                        </div>
                    );
                else if (record.maintenance[0].kode_status == "3")
                    return (
                        <Popconfirm
                            title="Mulai diproses penyedia..."
                            // description="Mulai diproses penyedia..."
                            open={openProsesPenyedia}
                            onConfirm={() => handleApprove(record)}
                            okButtonProps={{ loading: loadingProsesPenyedia }}
                            onCancel={() => setOpenProsesPenyedia(false)}
                        >
                            <Button
                                style={{ color: "green" }}
                                onClick={() => setOpenProsesPenyedia(true)}
                            >
                                Proses Penyedia <RightOutlined />
                            </Button>
                        </Popconfirm>
                    );
                else if (record.maintenance[0].kode_status == "4")
                    return (
                        <Button
                            style={{ color: "green" }}
                            onClick={() => handleApprove(record)}
                        >
                            Selesai Proses Penyedia <RightOutlined />
                        </Button>
                    );
                else if (record.maintenance[0].kode_status == "5")
                    return (
                        <Button
                            style={{ color: "green" }}
                            onClick={() => handleApprove(record)}
                        >
                            Selesai Proses IPDS <RightOutlined />
                        </Button>
                    );
                else if (record.maintenance[0].kode_status == "6")
                    return (
                        <Popconfirm
                            title="Kembalikan barang kepada pengguna..."
                            // description="Mulai diproses penyedia..."
                            // open={openKembaliPengguna}
                            onConfirm={() => handleApprove(record)}
                            okButtonProps={{ loading: loadingKembaliPengguna }}
                        // onCancel={() => setOpenKembaliPengguna(false)}
                        >
                            <Button
                                style={{ color: "green" }}
                            // onClick={() => setOpenKembaliPengguna(true)}
                            >
                                Proses Penyedia <RightOutlined />
                            </Button>
                        </Popconfirm>
                    );
            },
        },
    ];

    const verticalMenuItems: MenuProps["items"] = [
        {
            label: "Semua",
            key: "99",
        },
        {
            label: "Menunggu Persetujuan",
            key: "0",
        },

        {
            label: "Menunggu Penyedia",
            key: "3",
        },
        {
            label: "Diproses Penyedia",
            key: "4",
        },
        {
            label: "Diperiksa Kembali",
            key: "5",
        },
        {
            label: "Selesai Diperiksa",
            key: "6",
        },
        {
            label: "Selesai",
            key: "9",
        },
    ];

    const fetchDataByQuery = async (querySearch: string, type: string) => {
        try {
            // Make a fetch request to your API endpoint
            setSearchLoading(true);
            const response = await fetch(
                route("admin.pengajuan.fetch", {
                    querySearch: querySearch ? querySearch : "",
                    type: type,
                })
            );
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            // Parse the JSON response
            const dataHasilSearch = await response.json();
            setSearchLoading(false);
            // Update the state with the fetched items
            setDataSource(dataHasilSearch.data);
        } catch (error) {
            console.error("Error fetching data:", error);
        }
    };

    const onPengajuanFilter = (values: any) => {
        // setFilter(value);
        fetchDataByQuery(values.keyword, values.kode_status);
    };

    const [pengajuanFilterForm] = Form.useForm();
    const [daftarStatus, setDaftarStatus] = useState([]);
    const daftarStatusFetch = async () => {
        const { data }: any | undefined = await axios.get(
            route("maintenance.status.fetch")
        );
        const daftarStatusResponse = data.map((status: any) => ({
            value: status.kode_status,
            label: status.deskripsi,
        }));
        setDaftarStatus(daftarStatusResponse);
    };
    const handleApprove = async (record: PengajuanItem) => {
        console.log("approve", { record: record });
        if (record.kode_status == "0") {
            pemeriksaanBMN.setFieldsValue({
                sequence_id: record.sequence_id,
                users_id: record.users_id,
                keluhan: record.keluhan,
                merk: record.merk,
                tipe: record.tipe,
            });
            setOpenBMNCheckForm(true);
        } else if (record.kode_status == "1") {
            pemeriksaanForm.setFieldsValue({
                sequence_id: record.sequence_id,
                users_id: record.users_id,
                keluhan: record.keluhan,
                merk: record.merk,
                tipe: record.tipe,
            });
            setOpenTechCheckForm(true);
        } else if (record.kode_status == "2") {
            pemeriksaanPbjPpk.setFieldsValue({
                sequence_id: record.sequence_id,
                users_id: record.users_id,
                keluhan: record.keluhan,
                merk: record.merk,
                tipe: record.tipe,
            });
            setOpenPbjPpkCheckForm(true);
        } else if (record.kode_status == "3") {
            try {
                const response = await axios.post(
                    route("maintenance.status.update"),
                    {
                        sequence_id: record.sequence_id,
                        users_id: record.users_id,
                        kode_status: "4",
                        biaya: record.biaya,
                    }
                );
                router.get(route("admin.kelola.pengajuan"));
            } catch (error) { }
        } else if (record.kode_status == "4") {
            changeStatusForm.setFieldsValue({
                sequence_id: record.sequence_id,

                users_id: record.users_id,
                merk: record.merk,
                tipe: record.tipe,
            });
            setOpenChangeStatusForm(true);
        } else if (record.kode_status == "5") {
            finishIpdsForm.setFieldsValue({
                sequence_id: record.sequence_id,

                users_id: record.users_id,
                merk: record.merk,
                tipe: record.tipe,
            });
            setOpenFinishIpds(true);
        } else if (record.kode_status == "6") {
            try {
                const response = await axios.post(
                    route("maintenance.status.kembali-pengguna"),
                    {
                        sequence_id: record.sequence_id,
                        users_id: record.users_id,
                        kode_status: "4",
                        biaya: record.biaya,
                    }
                );
                router.get(route("admin.kelola.pengajuan"));
            } catch (error) { }
        }
    };
    return (
        <div>
            <MyModal
                cancelText="Batalkan"
                confirmLoadingModal={loadingTechCheckForm}
                title="Formulir Pemeriksaan Barang oleh IPDS"
                handleCancel={() => setOpenTechCheckForm(false)}
                handleOk={async () => {
                    try {
                        const isValid = await pemeriksaanForm.validateFields();
                        pemeriksaanForm.submit();
                        setOpenTechCheckForm(false);
                    } catch (error) { }
                }}
                openModal={openTechCheckForm}
                okText="Setujui"
            >
                <PemeriksaanForm form={pemeriksaanForm} />
            </MyModal>
            <MyModal
                cancelText="Batalkan"
                confirmLoadingModal={loadingBMNCheckForm}
                title="Formulir Pemeriksaan Barang oleh Tim BMN"
                handleCancel={() => setOpenBMNCheckForm(false)}
                handleOk={async () => {
                    try {
                        const isValid = await pemeriksaanBMN.validateFields();
                        pemeriksaanBMN.submit();
                        setOpenBMNCheckForm(false);
                    } catch (error) { }
                }}
                openModal={openBMNCheckForm}
                okText="Setujui"
            >
                <PemeriksaanBMN form={pemeriksaanBMN} />
            </MyModal>
            <MyModal
                cancelText="Batalkan"
                confirmLoadingModal={loadingPbjPpkCheckForm}
                title="Formulir Pemeriksaan Barang oleh Tim PBJ / PPK"
                handleCancel={() => setOpenPbjPpkCheckForm(false)}
                handleOk={async () => {
                    try {
                        const isValid =
                            await pemeriksaanPbjPpk.validateFields();
                        pemeriksaanPbjPpk.submit();
                        setOpenPbjPpkCheckForm(false);
                    } catch (error) { }
                }}
                openModal={openPbjPpkCheckForm}
                okText="Setujui"
                maskClosable={false}
            >
                <PemeriksaanPBJPPK form={pemeriksaanPbjPpk} />
            </MyModal>
            <MyModal
                cancelText="Batalkan"
                confirmLoadingModal={loadingChangeStatusForm}
                title="Formulir Penyelesaian Perbaikan oleh Penyedia"
                handleCancel={() => setOpenChangeStatusForm(false)}
                handleOk={async () => {
                    // setOpenTechCheckForm(false);
                    try {
                        const isValid = await changeStatusForm.validateFields();
                        changeStatusForm.submit();
                        setOpenChangeStatusForm(false);
                    } catch (error) {
                        // console.log(error);
                    }
                }}
                openModal={openChangeStatusForm}
                okText="Simpan Perubahan"
                maskClosable={false}
            >
                <FinishPenyedia form={changeStatusForm} />
            </MyModal>
            <MyModal
                cancelText="Batalkan"
                confirmLoadingModal={loadingChangeStatusForm}
                title="Formulir Penyelesaian Perbaikan oleh IPDS"
                handleCancel={() => setOpenFinishIpds(false)}
                handleOk={async () => {
                    try {
                        const isValid = await finishIpdsForm.validateFields();
                        finishIpdsForm.submit();
                        setOpenFinishIpds(false);
                    } catch (error) {
                        // console.log(error);
                    }
                }}
                openModal={openFinishIpds}
                okText="Simpan Perubahan"
                maskClosable={false}
            >
                <FinishIpds form={finishIpdsForm} />
            </MyModal>
            <Head title="History Barang" />
            <h1 style={{ marginBottom: "10px" }}>Daftar Pengajuan Pegawai</h1>
            {/* <Divider /> */}
            <Form
                form={pengajuanFilterForm}
                onFinish={onPengajuanFilter}
                style={{ width: "500px" }}
            >
                <Form.Item label={null} name="kode_status">
                    <Select
                        allowClear
                        options={daftarStatus}
                        placeholder="Filter berdasarkan status pengajuan"
                    />
                </Form.Item>
                <Form.Item label={null} name="keyword">
                    <Input
                        allowClear
                        placeholder="Cari berdasarakan nama pegawai atau nama barang, ataupun nomor urut pendaftaran"
                    />
                </Form.Item>
                <Button
                    type="primary"
                    onClick={() => pengajuanFilterForm.submit()}
                >
                    Terapkan filter
                </Button>
            </Form>

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
                loading={searchLoading}
                columns={PengajuanColumns}
            />
        </div>
    );
};

KelolaPengajuanPage.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Pengajuan Saya</h2>}
        selectedKey="admin.kelola.pengajuan"
        children={page}
    ></AuthenticatedLayout>
);
export default KelolaPengajuanPage;
