import {
    Button,
    DatePicker,
    Divider,
    Form,
    Input,
    Select,
    Upload,
    message,
} from "antd";
import { useEffect, useRef, useState } from "react";
import { PlusOutlined, UploadOutlined } from "@ant-design/icons";
import axios from "axios";
import { router } from "@inertiajs/react";
import dayjs from "dayjs";

const PemeriksaanPBJPPK: React.FC<{
    form: any;
    // record: any;
}> = ({ form }) => {
    const formItemLayout = {
        wrapperCol: { span: 24 },
    };
    const [messageApi, contextHolder] = message.useMessage();
    const [file, setFile] = useState(null);
    const [previewImage, setPreviewImage] = useState<
        string | ArrayBuffer | null
    >(null);

    const handleChange = (info: any) => {
        // console.log({info})
        const { fileList } = info;

        const file = fileList.length > 0 ? fileList[0] : false;
        if (!file) {
            setFile(null);
            setPreviewImage(null);
            return false;
        }

        // console.log({file})
        if (file.originFileObj) {
            setFile(file);
            handlePreview(file);
        }
    };
    const handlePreview = async (file: any) => {
        console.log({ file });
        if (file.url) {
            setPreviewImage(file.url);
        } else {
            const reader = new FileReader();
            reader.onloadend = () => {
                setPreviewImage(reader.result);
            };
            reader.readAsDataURL(file.originFileObj);
        }
    };
    const onFinish = (values: any) => {
        values.spek_path = values.spek_path.file;
        messageApi.open({
            // key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            router.post(route("maintenance.inspect.bmn.store"), values, {
                onSuccess: (responsePage) => {
                    const response: any = responsePage.props.response;
                    console.log({ response });
                    if (response.errors?.length > 1) {
                        return messageApi.open({
                            // key: saveKey,
                            content: response.errors,
                            type: "error",
                        });
                    }
                    messageApi.open({
                        // key: saveKey,
                        content: "Berhasil menambahkan data",
                        type: "success",
                    });

                    return 1;
                },
            });
        } catch (error: any) {
            messageApi.open({
                // key: saveKey,
                content: error.message,
                type: "error",
            });
            return 0;
        }
    };
    return (
        <>
            <Form
                form={form}
                name="HistoryBarangForm"
                onFinish={onFinish}
                autoComplete="off"
                layout="vertical"
            >
                {contextHolder}
                <Form.Item
                    {...formItemLayout}
                    label="sequence_id"
                    name="sequence_id"
                    style={{ display: "none" }}
                >
                    <Input disabled={true} style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="barang_id"
                    name="barang_id"
                    style={{ display: "none" }}
                >
                    <Input disabled={true} style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="users_id"
                    name="users_id"
                    style={{ display: "none" }}
                >
                    <Input disabled={true} style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="merk"
                    name="merk"
                    // style={{ display: "none" }}
                >
                    <Input disabled={true} style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="tipe"
                    name="tipe"
                    // style={{ display: "none" }}
                >
                    <Input disabled={true} style={{ color: "#000" }} />
                </Form.Item>

                <Form.Item
                    {...formItemLayout}
                    label="Estimasi Penyelesaian"
                    name="estimasi_penyelesaian"
                >
                    <DatePicker
                        style={{ width: "100%" }}
                        format="DD MMMM YYYY" // Set the display format for the selected date
                        disabledDate={(current: any) => {
                            // Can not select days before today and today
                            return (
                                current &&
                                current <
                                    dayjs().subtract(1, "day").endOf("day")
                            );
                        }}
                    />
                </Form.Item>
                <b>Detail Penyedia</b>

                <Form.Item
                    {...formItemLayout}
                    label="nama_perusahaan"
                    name="nama_perusahaan"
                    // style={{ display: "none" }}
                >
                    <Input style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="nama_penanggung_jawab"
                    name="nama_penanggung_jawab"
                    // style={{ display: "none" }}
                >
                    <Input style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="alamat"
                    name="alamat"
                    // style={{ display: "none" }}
                >
                    <Input style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="npwp"
                    name="npwp"
                    // style={{ display: "none" }}
                >
                    <Input style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="nomor_rekening"
                    name="nomor_rekening"
                    // style={{ display: "none" }}
                >
                    <Input style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="jabatan"
                    name="jabatan"
                    // style={{ display: "none" }}
                >
                    <Input style={{ color: "#000" }} />
                </Form.Item>
            </Form>
        </>
    );
};

export default PemeriksaanPBJPPK;
