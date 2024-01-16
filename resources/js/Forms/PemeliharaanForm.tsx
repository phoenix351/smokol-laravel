import { Divider, Form, Input, message } from "antd";
import { useEffect, useRef, useState } from "react";
import { PlusOutlined } from "@ant-design/icons";
import axios from "axios";

const PemeliharaanForm: React.FC<{
    form: any;
    onFinish: (values: any) => void;
    // record: any;
}> = ({ form, onFinish }) => {
    const formItemLayout = {
        wrapperCol: { span: 24 },
    };
    const [messageApi, contextHolder] = message.useMessage();

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
                    label="keluhan"
                    name="keluhan"
                    // style={{ display: "none" }}
                >
                    <Input.TextArea />
                </Form.Item>
            </Form>
        </>
    );
};

export default PemeliharaanForm;
