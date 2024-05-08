import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head, router } from "@inertiajs/react";
import { PageProps } from "@/types";

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
    Table,
    message,
    Popconfirm,
    Dropdown,
    MenuProps,
    DatePicker,
    Select,
} from "antd";
import {
    EditOutlined,
    CaretDownOutlined,
    DeleteOutlined,
    PlusOutlined,
    DownloadOutlined,
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
import axios from "axios";
import Link from "antd/es/typography/Link";

interface DataType {
    key: React.Key;
    nama: string;
}
interface Dbr {
    id?: number;
    key?: number;
    nama: string;
    users_id: number;
    users_nama: string;
    kode_baru: string;
    kode_siman: string;
    gedung: string;
    lantai: string | null;
    merk: string;
    tipe: string;
    tanggal_peroleh: any;
    nomor?: number;
}
interface Ruangan {
    id: number;
    nama: string;
}

const { Search } = Input;
const Dbr = ({
    dbr,
    daftar_ruangan,
}: PageProps & { dbr: Dbr[]; daftar_ruangan: Ruangan[] }) => {
    console.log({ daftar_ruangan });
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
    //end modal

    // const data_master = master_ruangan.map(
    //     ({ id, nama, users_id, users_nama }): Dbr => ({
    //         key: id,
    //         nama,
    //         users_id,
    //         users_nama,
    //     })
    // );
    const [dataSource, setDataSource] = useState<Dbr[]>([]);
    const [currentRuangan, setCurrentRuangan] = useState<string>("");
    const [loading, setLoading] = useState<boolean>(false);

    useEffect(() => {
        setTimeout(() => {
            let data_master = dbr.map(
                (
                    {
                        id,
                        nama,
                        users_id,
                        users_nama,
                        kode_siman,
                        lantai,
                        gedung,
                        kode_baru,
                        merk,
                        tipe,
                        tanggal_peroleh,
                    },
                    index
                ) => ({
                    key: id,
                    nomor: index + 1,
                    nama,
                    users_id,
                    users_nama,
                    kode_siman,
                    lantai,
                    gedung,
                    kode_baru,
                    merk,
                    tipe,
                    tanggal_peroleh,
                })
            );

            setDataSource(data_master);
        }, 0);
    }, [dbr]);

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

    const namaSorter: Sorter<Dbr> = createSorter("nama");

    interface Column {
        key?: React.Key;
        title: string;
        dataIndex: string;
        sorter?: CompareFn<object>;
        editable?: boolean;
        filters?: ColumnFilterItem[];
        onCell?: (record: DataType) => object;
        render?: (value: any, record: Dbr) => React.ReactNode;
    }

    const defaultColumns: ColumnsType<Dbr> = [
        {
            title: "No",
            dataIndex: "nomor",

            // sorter: namaSorter as CompareFn<object>,
        },
        {
            title: "Kode Barang",
            dataIndex: "kode_barang",
        },
        {
            title: "Nama Barang",
            dataIndex: "jenis",
        },
        {
            title: "NUP",
            dataIndex: "nomor_urut_pendaftaran",
        },
        {
            title: "Merk/Type",
            dataIndex: "merk_tipe",
            render: (_, record) => `${record.merk}/${record.tipe}`,
        },
        {
            title: "Thn. Perolehan",
            dataIndex: "tahun_perolehan",
            render: (_, record) =>
                Number(record.tanggal_peroleh.substring(0, 4)) > 0
                    ? Number(record.tanggal_peroleh.substring(0, 4))
                    : "-",
        },
        {
            title: "Pemilik Barang",
            dataIndex: "nama_lengkap",
        },
        {
            title: "Keterangan",
            dataIndex: "ket",
        },
    ];
    const Unduh = () => {};
    const loadDbr = async (value: string) => {
        if (value === undefined) {
            setDataSource([]);
            return;
        }

        setLoading(true);
        try {
            setCurrentRuangan(value);
            const { data } = await axios.get(
                route("admin.laporan.dbr.fetch", { id_ruangan: value })
            );
            console.log({ x: data.dbr });
            let dbr = data.dbr;
            dbr = dbr.map((item: Dbr, index: number) => {
                item["nomor"] = index + 1;
                return item;
            });
            setDataSource(dbr);
        } catch (error) {
            console.log({ error });
        } finally {
            setLoading(false);
        }
    };
    return (
        <div>
            <Head title="Daftar Barang Ruangan" />

            {contextHolder}
            <h1>Daftar Barang Ruangan (DBR) </h1>
            <Divider />
            <Space style={{ display: "flex", justifyContent: "space-between" }}>
                <Space style={{ display: "flex", justifyContent: "center" }}>
                    <Select
                        allowClear
                        options={daftar_ruangan.map((ruangan) => ({
                            label: ruangan.nama,
                            value: ruangan.id,
                        }))}
                        placeholder="Pilih Ruangan..."
                        showSearch
                        optionFilterProp="label"
                        style={{ width: "300px", marginBottom: "20px" }}
                        onChange={(value) => loadDbr(value)}
                    />
                </Space>
                <Link
                    href={route("admin.laporan.dbr.cetak", {
                        id_ruangan: currentRuangan,
                    })}
                    target="_blank"
                >
                    <Button
                        type="primary"
                        style={{ marginBottom: 16 }}
                        icon={<DownloadOutlined />}
                    >
                        Download as PDF
                    </Button>
                </Link>
            </Space>

            <Table
                rowClassName={() => "editable-row"}
                bordered
                dataSource={dataSource}
                columns={defaultColumns}
                loading={loading}
            />
        </div>
    );
};

Dbr.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Daftar Barang Ruangan</h2>}
        selectedKey="admin.laporan.dbr"
        children={page}
    ></AuthenticatedLayout>
);
export default Dbr;
