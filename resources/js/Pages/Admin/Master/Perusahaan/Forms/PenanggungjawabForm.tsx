import { Form, FormInstance, Input, Select } from "antd";

import { Perusahaan } from "@/types";

const formItemLayout = {
    wrapperCol: { span: 24 },
};

const PerusahaanForm: React.FC<{
    form: FormInstance;
    onFinish: (values: Perusahaan) => void;
    masterPerusahaan: Perusahaan[];
    name: string;
}> = ({ form, onFinish, masterPerusahaan, name }) => {
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
                label="Nama Penanggungjawab"
                name="nama"
                rules={[
                    {
                        required: true,
                        message: "Isian Nama  harus diisi",
                    },
                ]}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Jabatan"
                name="jabatan"
                rules={[
                    {
                        required: true,
                        message: "Isian Jabatan harus diisi",
                    },
                ]}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Email"
                name="email"
                rules={[
                    {
                        required: true,
                        message: "Isian Email harus diisi",
                    },
                ]}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Nomor Telepon / Whatsapp"
                name="nomor_wa"
                rules={[
                    {
                        required: true,
                        message: "Isian nomor telepon/WA harus diisi",
                    },
                ]}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Perusahaan"
                name="perusahaan_id"
                rules={[
                    {
                        required: true,
                        message: "Isian Perusahaan harus diisi",
                    },
                ]}
            >
                <Select
                    showSearch
                    options={masterPerusahaan.map((perusahaan) => ({
                        label: perusahaan.nama,
                        value: perusahaan.id,
                    }))}
                />
            </Form.Item>
        </Form>
    );
};
export default PerusahaanForm;
