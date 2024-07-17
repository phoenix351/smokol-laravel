import {
    Button,
    DatePicker,
    Divider,
    Form,
    FormInstance,
    Input,
    InputNumber,
    InputRef,
    Select,
    Space,
    message,
} from "antd";
import { useEffect, useRef, useState } from "react";
import { PlusOutlined } from "@ant-design/icons";
import axios from "axios";

import { router } from "@inertiajs/react";
import { Perusahaan } from "@/types";

const formItemLayout = {
    wrapperCol: { span: 24 },
};
let indexJenis = 0;
let indexNama = 0;
let indexTingkat = 0;
const PerusahaanForm: React.FC<{
    form: FormInstance;
    onFinish: (values: Perusahaan) => void;
    name: string;
}> = ({ form, onFinish, name }) => {
    return (
        <Form
            form={form}
            name={name}
            onFinish={onFinish}
            autoComplete="off"
            style={{ maxWidth: "600px" }}
            layout="vertical"
        >
            <Form.Item {...formItemLayout} label="id" name="id" hidden>
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Nama Perusahaan"
                name="nama"
                rules={[
                    {
                        required: true,
                        message: "Isian Nama Jabatan harus diisi",
                    },
                ]}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Alamat Perusahaan"
                name="alamat"
                rules={[
                    {
                        required: true,
                        message: "Isian Alamat Perusahaan harus diisi",
                    },
                ]}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="NPWP Perusahaan"
                name="npwp"
                rules={[
                    {
                        required: true,
                        message: "Isian NPWP Perusahaan harus diisi",
                    },
                ]}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Bank"
                name="bank"
                rules={[
                    {
                        required: true,
                        message: "Isian Bank harus diisi",
                    },
                ]}
            >
                <Select
                    showSearch
                    options={[
                        { label: "Bank Mandiri", value: "Bank Mandiri" },
                        {
                            label: "Bank Rakyat Indonesia (BRI)",
                            value: "Bank Rakyat Indonesia (BRI)",
                        },
                        {
                            label: "Bank Negara Indonesia",
                            value: "Bank Negara Indonesia",
                        },
                        {
                            label: "Bank Central Asia (BCA)",
                            value: "Bank Central Asia (BCA)",
                        },
                        {
                            label: "Bank Tabungan Negara (BTN)",
                            value: "Bank Tabungan Negara (BTN)",
                        },
                        {
                            label: "Bank Syariah Indonesia (BSI)",
                            value: "Bank Syariah Indonesia (BSI)",
                        },
                        { label: "CIMB Niaga", value: "CIMB Niaga" },
                        { label: "OCBC Indonesia", value: "OCBC Indonesia" },
                        { label: "Bank Panin", value: "Bank Panin" },
                        { label: "Bank Permata", value: "Bank Permata" },
                    ]}
                />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Nomor Rekening"
                name="nomor_rekening"
                rules={[
                    {
                        required: true,
                        message: "Isian Nomor Rekening Perusahaan harus diisi",
                    },
                ]}
            >
                <Input />
            </Form.Item>
        </Form>
    );
};
export default PerusahaanForm;
