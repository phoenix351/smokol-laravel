import { Button, Divider, Form, Input, Select, Upload, message } from "antd";
import { useEffect, useRef, useState } from "react";
import { PlusOutlined, UploadOutlined } from "@ant-design/icons";
import axios from "axios";
import { router } from "@inertiajs/react";

const PemeriksaanBMN: React.FC<{
    form: any;
    // record: any;
}> = ({ form }) => {
    const formItemLayout = {
        wrapperCol: { span: 24 },
    };
    const saveKey = "message";
    const [messageApi, contextHolder] = message.useMessage();
    const onFinish = async (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            const response = await axios.post(
                route("maintenance.inspect.bmn.store"),
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
                key: saveKey,
                content: error.message,
                type: "error",
            });
        } finally {
            // messageApi.close();
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
                    // hidden
                >
                    <Input disabled={true} style={{ color: "#000" }} />
                </Form.Item>

                <Form.Item
                    {...formItemLayout}
                    label="user_id"
                    name="user_id"
                    // hidden
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
            </Form>
        </>
    );
};

export default PemeriksaanBMN;
