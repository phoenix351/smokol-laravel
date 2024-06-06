import { Button, Divider, Form, Input, Select, Upload, message } from "antd";
import { useEffect, useRef, useState } from "react";
import { PlusOutlined, UploadOutlined } from "@ant-design/icons";
import axios from "axios";
import { router } from "@inertiajs/react";

const PemeriksaanForm: React.FC<{
    form: any;
    // record: any;
}> = ({ form }) => {
    const formItemLayout = {
        wrapperCol: { span: 24 },
    };
    const [messageApi, contextHolder] = message.useMessage();

    const onFinish = async (values: any) => {
        const saveKey = "pemeriksaan IPDS";
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            const response = await axios.post(
                route("maintenance.inspect.ipds.store"),
                values,
                {
                    headers: { "Content-Type": "application/json" },
                }
            );

            messageApi.open({
                key: saveKey,
                content: "Berhasil menambahkan data",
                type: "success",
            });
            router.get(route("admin.kelola.pengajuan"));
        } catch (error: any) {
            messageApi.open({
                // key: saveKey,
                content: error.message,
                type: "error",
            });
            return 0;
        }
    };
    const [showSolution, setShowSolution] = useState(false);
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
                    hidden
                >
                    <Input disabled={true} style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="barang_id"
                    name="barang_id"
                    hidden
                >
                    <Input disabled={true} style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="users_id"
                    name="users_id"
                    hidden
                >
                    <Input disabled={true} style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item {...formItemLayout} label="merk" name="merk">
                    <Input disabled={true} style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item {...formItemLayout} label="tipe" name="tipe">
                    <Input disabled={true} style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item {...formItemLayout} label="keluhan" name="keluhan">
                    <Input disabled={true} style={{ color: "#000" }} />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="Permasalahan yang Ditemukan"
                    name="problems"
                    rules={[
                        {
                            required: true,
                            message: "Silahkan isi Uraian Permasalahan ",
                        },
                    ]} // style={{ display: "none" }}
                >
                    <Input.TextArea />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="Tindak Lanjut"
                    name="next_step"
                    rules={[
                        {
                            required: true,
                            message: "Silahkan isi Tindak Lanjut",
                        },
                    ]}
                >
                    <Select
                        onChange={() => {
                            let nextValue = form.getFieldValue("next_step");
                            if (nextValue === "0") {
                                setShowSolution(true);
                            } else {
                                setShowSolution(false);
                            }
                        }}
                        options={[
                            {
                                value: "0",
                                label: (
                                    <span>Diiperbaiki langsung Oleh IPDS</span>
                                ),
                            },

                            {
                                value: "2",
                                label: (
                                    <span>
                                        Diteruskan untuk Dilakukan Pemeliharaan
                                    </span>
                                ),
                            },
                        ]}
                    />
                </Form.Item>

                {showSolution && (
                    <Form.Item
                        label="Solusi yang Diterapkan"
                        name="solution"
                        id="solution"
                    >
                        <Input.TextArea />
                    </Form.Item>
                )}
            </Form>
        </>
    );
};

export default PemeriksaanForm;
