import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head, router, usePage } from "@inertiajs/react";
import { BastType, PageProps } from "@/types";

import {
    ReactElement,
    JSXElementConstructor,
    ReactPortal,
    useRef,
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
    Table,
    FormInstance,
    Tour,
    TourProps,
    Popconfirm,
    Pagination,
} from "antd";
import {
    MedicineBoxOutlined,
    WarningOutlined,
    StopOutlined,
    CheckCircleOutlined,
    UploadOutlined,
    FilePdfOutlined,
    QuestionCircleOutlined,
} from "@ant-design/icons";
import React from "react";
import {
    ColumnFilterItem,
    ColumnsType,
    CompareFn,
    SortOrder,
} from "antd/es/table/interface";
import dayjs from "dayjs";
import MyModal from "@/Components/Modal";
import HistoryBarangForm from "@/Forms/HistoryBarangForm";
import { Barang, DataType } from "@/types";
import axios from "axios";

import PemeliharaanForm from "@/Forms/PemeliharaanForm";
import Upload from "antd/es/upload/Upload";
import Link from "antd/es/typography/Link";

const { Search } = Input;

const BarangPage = () => {
    // console.log({ history_barang });

    const csrfTokenRef = useRef<string | null>(null);
    const csrfTokenMeta = document.querySelector('meta[name="csrf-token"]');
    const [searchText, setSearchText] = useState("");
    const [dataLoading, setDataLoading] = useState(false);
    const [messageApi, contextHolder] = message.useMessage();
    const saveKey = "updatable";

    const [itemAddForm] = Form.useForm();
    const [formUpload] = Form.useForm();
    // modal
    const [openModal, setOpenModal] = useState(false);
    const [openModalUbah, setOpenModalUbah] = useState(false);

    const [openPengajuan, setOpenPengajuan] = useState(false);

    const [confirmLoadingModal, setConfirmLoadingModal] = useState(false);
    const [confirmLoadingModalUbah, setConfirmLoadingModalUbah] =
        useState(false);
    // const [confirmLoadingBast, setConfirmLoadingBast] = useState(false);
    const [confirmLoadingPengajuan, setConfirmLoadingPengajuan] =
        useState(false);

    const [openWarningModal, setOpenWarningModal] = useState(false);
    const [confirmLoadingWarningModal, setConfirmLoadingWarningModal] =
        useState(false);

    // table
    const [dataSource, setDataSource] = useState<Barang[]>([]);
    const [total, setTotal] = useState<number>(0);
    const [current, setCurrent] = useState<number>(1);
    const [pageSize, setPageSize] = useState<number>(10);

    // data for current barang bast
    // const [dataBast, setDataBast] = useState<BastType[]>([]);
    const [pengajuanForm] = Form.useForm();

    // define hook for tour
    const [openTour, setOpenTour] = useState<boolean>(false);
    const tableRef = useRef(null);

    const bastRef = useRef(null);
    const pemeliharaanRef = useRef(null);

    // const  = useRef(null);

    const tourSteps: TourProps["steps"] = [
        {
            title: "Selamat datang pada tutorial penggunaan aplikasi Smokol",
            description:
                "Ikuti langkah-langkah berikut supaya faham penggunaan aplikasi",
        },
        {
            title: "Daftar Barang",
            description:
                "ini merupakan daftar barang beserta spesifikasi yang saat ini dalam penguasaan anda",
            target: () => tableRef.current,
        },
        {
            title: "Upload BAST",
            description: `Anda dapat mengunggah dokumen BAST pada menu ini (mengunggah ulang akan menimpa file yang sudah ada)`,
            target: () => bastRef.current,
        },
        {
            title: "Pengajuan Pemeliharaan",
            description:
                "Apabila barang anda dalam kondisi kurang mendukung pekerjaan sehari-hari, silahkan bisa mengajukan pemeliharaan pada menu ini",
            target: () => pemeliharaanRef.current,
        },
        {
            title: "Pengajuan Pemeliharaan",
            description:
                "Barang yang sudah diajukan dapat dilihat statusnya pada menu Daftar Pengajuan",
            // target: () => pemeliharaanRef.current,
        },
    ];

    const handleOkWarningModal = async () => {
        router.get(route("pengajuan"));
    };
    const handleCancelWarningModal = async () => {
        setOpenWarningModal(false);
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

    const handleOkPengajuan = async () => {
        // handle opening
        try {
            const validasi = await pengajuanForm.validateFields();
            pengajuanForm.submit();
            setOpenPengajuan(false);
            setConfirmLoadingPengajuan(false);
        } catch (error) {
            console.error(error);
        }
    };

    const handleCancel = () => {
        setOpenModal(false);
    };
    const handleCancelUbah = () => {
        setOpenModalUbah(false);
    };

    const handleCancelPengajuan = () => {
        setOpenPengajuan(false);
    };
    const fetchData = async (
        currentPage: number,
        pageSize: number,
        searchText: string
    ) => {
        setDataLoading(true);
        try {
            const response = await axios.get(
                route("api.barang", {
                    page: currentPage,
                    pageSize: pageSize,
                    searchText: searchText,
                    isUser: 1,
                })
            );
            // console.log({ response });
            const modifiedData = [...response.data.data].map((item) => ({
                ...item,
                bast_path: String(item.bast_path).replace("public", "storage"),
            }));

            setDataSource(modifiedData);
            setTotal(response.data.total);
        } catch (error) {
            console.error(error);
        } finally {
            setDataLoading(false);
        }
    };
    function handlePageChange(
        current: number,
        pageSize: number,
        searchText: string
    ): void {
        setCurrent(current);
        setPageSize(pageSize);
        setSearchText(String(searchText));
    }
    useEffect(() => {
        fetchData(current, pageSize, searchText);
    }, [current, pageSize, searchText]);

    useEffect(() => {
        if (csrfTokenMeta) {
            csrfTokenRef.current = csrfTokenMeta.getAttribute("content");
        }
        fetchData(current, pageSize, searchText);
    }, []);

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
    const { url } = usePage();
    const handleReload = () => {
        router.get(
            url,
            {},
            {
                preserveState: true,
                preserveScroll: true,
            }
        );
    };
    const handleUploadBast = async (
        info: any,
        record: Barang,
        formUpload: FormInstance
    ) => {
        // console.log({ info, record });
        messageApi.open({
            key: saveKey,
            content: "Sedang mengunggah dokumen...",
            type: "loading",
        });
        try {
            if (info.fileList.length > 0) {
                const file = info.fileList[0].originFileObj;
                const formData = {
                    file: file,
                    barang_id: record.id,
                };
                // console.log({ info, record, formData });
                // return 0;
                const urlUploadBast = route("bast.upload");
                const uploadResponse = await axios.post(
                    urlUploadBast,
                    formData,
                    {
                        headers: {
                            "Content-Type": "multipart/form-data",
                        },
                    }
                );
                messageApi.open({
                    key: saveKey,
                    content: "Berhasil mengunggah BAST",
                    type: "success",
                });
            }
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
        } finally {
            handleReload();
        }
    };
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
    const onFinishEdit: (values: any) => any = (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            router.patch(route("history_barang.update"), values, {
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

    const pengajuanFinish = (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang mengajukan...",
            type: "loading",
        });
        // console.log({ values });
        const copyValues = { ...values };
        try {
            copyValues["problem_img_path"] =
                values.problem_img_path.fileList[0].originFileObj;
        } catch (error) {
            copyValues["problem_img_path"] = "";
        }
        try {
            const response = axios.post(
                route("maintenance.store"),
                copyValues,
                {
                    headers: { "Content-Type": "multipart/form-data" },
                }
            );

            console.log({ response });

            messageApi.open({
                key: saveKey,
                content: "Berhasil menambahkan data",
                type: "success",
            });

            return 1;
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
            return 0;
        }
    };
    const jenisSorter: Sorter<Barang> = createSorter("jenis");
    const tipeSorter: Sorter<Barang> = createSorter("tipe");
    const merkSorter: Sorter<Barang> = createSorter("merk");
    const nomorSeriSorter: Sorter<Barang> = createSorter("nomor_seri");
    const recordTimeSorter: Sorter<Barang> = createSorter("record_time");
    interface Column {
        key?: React.Key;
        title: string;
        dataIndex: string;
        sorter?: CompareFn<object>;
        editable?: boolean;
        filters?: ColumnFilterItem[];
        onCell?: (record: DataType) => object;
        render?: (value: any, record: Barang) => React.ReactNode;
    }

    const defaultColumns: ColumnsType<Barang> = [
        {
            title: "Nama Barang",
            dataIndex: "barang",

            render: (value) => (
                <Link>
                    {value.merk} / {value.tipe}
                </Link>
            ),
        },
        {
            title: "jenis",
            dataIndex: "barang",
            render: (value) => value.jenis,
        },
        // {
        //     title: "merk",

        //     dataIndex: "barang",
        //     render: value => value.merk,
        //     sorter: merkSorter as CompareFn<object>,
        // },

        // {
        //     title: "tipe",
        //     dataIndex: "barang",
        //     render: value => value.tipe,
        //     sorter: tipeSorter as CompareFn<object>,
        // },
        {
            title: "tanggal_peroleh",
            dataIndex: "record_time",
            render: (value) => dayjs(new Date(value)).format("DD MMMM YYYY"),
            sorter: recordTimeSorter as CompareFn<object>,
        },
        {
            title: "nomor_seri",
            dataIndex: "barang",
            render: (value) => value.nomor_seri,
            sorter: nomorSeriSorter as CompareFn<object>,
        },
        {
            title: "kondisi",
            dataIndex: "kondisi",
            // render:value=>value.kondisi,
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
            render: (value) => {
                if (value.kondisi === "Baik")
                    return (
                        <>
                            <CheckCircleOutlined style={{ color: "green" }} />{" "}
                            Baik
                        </>
                    );
                if (value.kondisi === "Rusak Ringan")
                    return (
                        <>
                            <WarningOutlined style={{ color: "orange" }} />{" "}
                            Rusak Ringan
                        </>
                    );
                if (value.kondisi === "Rusak Berat")
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
            title: "ruangan_nama",
            dataIndex: "ruangan",
            render: (value) => value.nama,
        },
        {
            title: "File BAST",
            dataIndex: "bast_path",
            render: (value, record: Barang) =>
                value !== null ? (
                    <Button>
                        <Upload
                            ref={bastRef}
                            onChange={(value) =>
                                handleUploadBast(value, record, formUpload)
                            }
                            beforeUpload={() => false}
                            accept=".pdf"
                        >
                            <UploadOutlined /> Upload Bast
                        </Upload>
                    </Button>
                ) : (
                    <Space>
                        <Button onClick={() => window.open(value, "_blank")}>
                            {" "}
                            <FilePdfOutlined /> Lihat Dokumen
                        </Button>

                        <Button ref={bastRef}>
                            <Upload
                                onChange={(value) =>
                                    handleUploadBast(value, record, formUpload)
                                }
                                beforeUpload={() => false}
                                accept=".pdf"
                                style={{ display: "none" }}
                            >
                                {" "}
                                <UploadOutlined /> Upload Bast
                            </Upload>
                        </Button>
                    </Space>
                ),
        },

        {
            title: "Pemeliharaan",
            dataIndex: "maintenance",
            // fixed: "right",
            render: (_, record: Barang) => {
                return (
                    <Button
                        ref={pemeliharaanRef}
                        onClick={async () => {
                            const { data } = await axios.post(
                                route("maintenance.check"),
                                {
                                    barang_id: record.id,
                                }
                            );
                            // console.log({ dataLeng: data.length });
                            if (data.length < 1) {
                                setOpenWarningModal(true);
                                return false;
                            }
                            pengajuanForm.setFieldValue("barang_id", record.id);
                            pengajuanForm.setFieldValue(
                                "users_id",
                                record.users_id
                            );
                            pengajuanForm.setFieldValue(
                                "merk",
                                record.barang.merk
                            );
                            pengajuanForm.setFieldValue(
                                "tipe",
                                record.barang.tipe
                            );

                            setOpenPengajuan(true);
                        }}
                    >
                        <MedicineBoxOutlined /> Ajukan Pemeliharaan
                    </Button>
                );
            },
        },
    ];

    return (
        <div>
            <Head title="History Barang" />
            <Tour
                open={openTour}
                onClose={() => setOpenTour(false)}
                steps={tourSteps}
            />

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
                title={"Ubah History Barang"}
                openModal={openModalUbah}
                handleOk={handleOkUbah}
                confirmLoadingModal={confirmLoadingModalUbah}
                handleCancel={handleCancelUbah}
                okText="Simpan"
                cancelText="Batal"
            >
                <Divider />
                <HistoryBarangForm form={itemAddForm} onFinish={onFinishEdit} />
            </MyModal>

            <MyModal
                title="Form Pengajuan Barang"
                openModal={openPengajuan}
                handleOk={handleOkPengajuan}
                confirmLoadingModal={confirmLoadingPengajuan}
                handleCancel={handleCancelPengajuan}
                okText="Kirim Pengajuan"
                cancelText="Batal"
                width={600}
            >
                <PemeliharaanForm
                    form={pengajuanForm}
                    onFinish={pengajuanFinish}
                />
            </MyModal>

            <MyModal
                title="Peringatan"
                openModal={openWarningModal}
                handleOk={handleOkWarningModal}
                confirmLoadingModal={confirmLoadingWarningModal}
                handleCancel={handleCancelWarningModal}
                okText="Menuju Halaman Pemeliharaan"
                cancelText="Batalkan Aksi"
                width={600}
            >
                Maaf barang yang anda pilih sudah dalam proses pemeliharaan dan
                belum berstatus selesai, silahkan dapat melihat pada halaman
                Pemeliharaan atau hubungi Admin !
            </MyModal>

            {contextHolder}
            <h1>Daftar Barangku</h1>
            <Divider />
            <Space style={{ display: "flex", justifyContent: "space-between" }}>
                <Search
                    placeholder="Cari history barang ..."
                    allowClear
                    onSearch={(value) => setSearchText(value)}
                    // loading={searchLoading}
                    style={{ width: 200, marginBottom: "20px" }}
                />
                <Button onClick={() => setOpenTour(true)}>
                    <QuestionCircleOutlined />
                    buka tutorial
                </Button>
            </Space>

            <Table
                ref={tableRef}
                // rowClassName={() => "editable-row"}
                scroll={{ x: 1500 }}
                bordered
                pagination={false}
                loading={dataLoading}
                dataSource={dataSource}
                columns={defaultColumns}
            />
            <Pagination
                current={current}
                pageSize={pageSize}
                total={total}
                onChange={(page, pageSize) =>
                    handlePageChange(page, pageSize, searchText)
                }
                showSizeChanger
                onShowSizeChange={(current, pageSize) =>
                    handlePageChange(current, pageSize, searchText)
                }
            />
        </div>
    );
};

BarangPage.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Kelola Barang Saya</h2>}
        selectedKey="barang"
    >
        {page}
    </AuthenticatedLayout>
);
export default BarangPage;
