import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head, router } from "@inertiajs/react";
import { PageProps } from "@/types";
import dayjs from "dayjs";
import { Table } from "ant-table-extensions";

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
} from "antd";
import {
    EditOutlined,
    CaretDownOutlined,
    DeleteOutlined,
    PlusOutlined,
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

// const ExportableTablex = ExportableTable(Table);

interface Item {
    key: string;
    jenis: string;
    merk: string;
    tipe: string;
    tahun_peroleh: string;
    nomor_seri: string;
}

interface DataType {
    key: React.Key;
    jenis: string;
    merk: string;
    tipe: string;
    tahun_peroleh: string;
    nomor_seri: string;
    kondisi: string;
    nama_ruangan: string;
    nama_pemegang: string;
}
interface HistoryBarang {
    id?: number;
    key?: number;
    jenis: string;
    tipe: string;
    merk: string;
    tahun_peroleh?: number | string | any;
    nomor_seri: string;
    kondisi: string;
    nama_ruangan: string;
    nama_pemegang: string;
}

const { Search } = Input;
const HistoryBarang = ({
    history_barang,
}: PageProps & { history_barang: HistoryBarang[] }) => {
    // console.log({ history_barang });
    const csrfTokenRef = useRef<string | null>(null);
    const csrfTokenMeta = document.querySelector('meta[name="csrf-token"]');
    const [searchText, setSearchText] = useState("");
    const [searchLoading, setSearchLoading] = useState(false);
    const [messageApi, contextHolder] = message.useMessage();
    const saveKey = "updatable";
    const [itemAddForm] = Form.useForm();

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
        itemAddForm.submit();
        setOpenModalUbah(false);
        setConfirmLoadingModalUbah(false);
    };
    const handleCancel = () => {
        setOpenModal(false);
    };
    const handleCancelUbah = () => {
        setOpenModalUbah(false);
    };
    //end modal

    const data_master = history_barang.map(
        ({
            id,
            jenis,
            merk,
            tipe,
            tahun_peroleh,
            nomor_seri,
            kondisi,
            nama_ruangan,
            nama_pemegang,
        }): HistoryBarang => ({
            key: id,
            jenis,
            merk,
            tipe,
            tahun_peroleh,
            nomor_seri,
            kondisi,
            nama_ruangan,
            nama_pemegang,
        })
    );
    const [dataSource, setDataSource] = useState<HistoryBarang[]>(data_master);

    useEffect(() => {
        if (csrfTokenMeta) {
            csrfTokenRef.current = csrfTokenMeta.getAttribute("content");
        }
    }, []);
    useEffect(() => {
        setTimeout(() => {
            let data_master = history_barang.map(
                ({
                    id,
                    jenis,
                    merk,
                    tipe,
                    tahun_peroleh,
                    nomor_seri,
                    kondisi,
                    nama_ruangan,
                    nama_pemegang,
                }) => ({
                    key: id,
                    jenis,
                    merk,
                    tipe,
                    tahun_peroleh,
                    nomor_seri,
                    kondisi,
                    nama_ruangan,
                    nama_pemegang,
                })
            );

            console.log("changeeeee", { history_barang });
            setDataSource(data_master);
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
    const jenisSorter: Sorter<HistoryBarang> = createSorter("jenis");
    const tipeSorter: Sorter<HistoryBarang> = createSorter("tipe");
    const merkSorter: Sorter<HistoryBarang> = createSorter("merk");
    const nomorSeriSorter: Sorter<HistoryBarang> = createSorter("nomor_seri");
    const tahunPerolehSorter: Sorter<HistoryBarang> =
        createSorter("tahun_peroleh");
    interface Column {
        key?: React.Key;
        title: string;
        dataIndex: string;
        sorter?: CompareFn<object>;
        editable?: boolean;
        filters?: ColumnFilterItem[];
        onCell?: (record: DataType) => object;
        render?: (value: any, record: HistoryBarang) => React.ReactNode;
    }

    const defaultColumns: ColumnsType<HistoryBarang> = [
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
            onFilter: (
                value: string | number | boolean,
                record: HistoryBarang
            ) => record.jenis === value,
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
            title: "tahun_peroleh",
            dataIndex: "tahun_peroleh",
            sorter: tahunPerolehSorter as CompareFn<object>,
        },
        {
            title: "nomor_seri",
            dataIndex: "nomor_seri",
            sorter: nomorSeriSorter as CompareFn<object>,
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
            onFilter: (
                value: string | number | boolean,
                record: HistoryBarang
            ) =>
                record.kondisi.trim().toLowerCase() ===
                String(value).toLowerCase(),
            // sorter: nomorSeriSorter as CompareFn<object>,
        },
        {
            title: "nama_ruangan",
            dataIndex: "nama_ruangan",
            // sorter: nomorSeriSorter as CompareFn<object>,
        },
        {
            title: "nama_pemegang",
            dataIndex: "nama_pemegang",
            // sorter: nomorSeriSorter as CompareFn<object>,
        },
        {
            title: "operation",
            dataIndex: "operation",
            render: (_, record: HistoryBarang) => {
                const items: MenuProps["items"] = [
                    {
                        label: (
                            <a>
                                <EditOutlined /> Ubah
                            </a>
                        ),
                        key: "0",
                        onClick: () => {
                            setOpenModalUbah(true);
                            const recordEdited = {
                                jenis: record.jenis,
                                merk: record.merk,
                                tipe: record.tipe,
                                nomor_seri: record.nomor_seri,
                                id: record.key,
                            };
                            itemAddForm.setFieldsValue(recordEdited);
                            itemAddForm.setFieldValue(
                                "tahun_peroleh",
                                dayjs(
                                    record.tahun_peroleh !== "0"
                                        ? record.tahun_peroleh
                                        : "2000-01-01",
                                    "YYYY-MM-DD"
                                )
                            );
                        },
                    },
                    {
                        label: (
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
                        ),
                        key: "1",
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

            {contextHolder}
            <h1>History Barang</h1>
            <Divider />
            <Space style={{ display: "flex", justifyContent: "space-between" }}>
                <Search
                    placeholder="Cari history barang ..."
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
                    Add a row
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
                exportable
            />
        </div>
    );
};

HistoryBarang.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Kelola History Barang</h2>}
        selectedKey="admin.kelola.history_barang.index"
        children={page}
    ></AuthenticatedLayout>
);
export default HistoryBarang;
