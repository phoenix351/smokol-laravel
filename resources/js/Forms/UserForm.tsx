import {
    Button,
    DatePicker,
    DatePickerProps,
    Divider,
    Form,
    Input,
    InputRef,
    Select,
    Space,
    message,
} from "antd";
import dayjs from "dayjs";

import { useEffect, useRef, useState } from "react";
import { PlusOutlined } from "@ant-design/icons";
import axios from "axios";

import { router } from "@inertiajs/react";
import moment from "moment";

const formItemLayout = {
    wrapperCol: { span: 24 },
};

const UserForm: React.FC<{
    form: any;
    onFinish: (values: any) => void;
    type: string;
}> = ({ form, onFinish, type }) => {
    const inputRef = useRef<InputRef>(null);
    const [messageApi, contextHolder] = message.useMessage();
    const saveKey = "updatable";

    const [jabatanList, setJabatanList] = useState([]);

    const roleList = [
        { label: "Pegawai", value: "basic" },
        { label: "Tim IPDS", value: "Tim IPDS" },
        { label: "Tim BMN", value: "Tim BMN" },
        { label: "Tim PBJ/PPK", value: "Tim PBJ/PPK" },
        { label: "Super Admin", value: "Super Admin" },
    ];
    useEffect(() => {
        // call api jenis
        const fetchData = async () => {
            try {
                const { data } = await axios.get(route("api.master.jabatan"));
                let jabatanList = data.map((item: any) => ({
                    label: `${item.nama} (${item.tingkat})`,
                    value: item.id,
                }));
                console.log({ jabatanList });
                setJabatanList(jabatanList);
            } catch (error) {}
        };
        fetchData();
    }, []);

    return (
        <Form
            form={form}
            name="UserForm"
            onFinish={onFinish}
            autoComplete="off"
            style={{ maxWidth: "600px" }}
            layout="vertical"
        >
            {contextHolder}
            <Form.Item {...formItemLayout} label="id" name="id" hidden>
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="nama_lengkap"
                name="nama_lengkap"
                required
                rules={[
                    { required: true, message: "Nama Lengkap wajib diisi" },
                ]}
                // style={{ display: "none" }}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="nip"
                name="nip"
                required
                rules={[{ required: true, message: "NIP wajib diisi" }]}
            >
                <Input placeholder="19921023982093021001" />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="email"
                name="email"
                required
                rules={[
                    { required: true, message: "Email wajib diisi" },
                    { type: "email", message: "Format tidak sesuai" },
                ]}
                // style={{ display: "none" }}
            >
                <Input placeholder="email@bps.go.id" />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Jabatan"
                name="jabatan_id"
                required
                rules={[{ required: true, message: "Jabatan wajib diisi" }]}
            >
                <Select
                    showSearch
                    options={jabatanList}
                    optionFilterProp="label"
                />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="bidang"
                name="bidang"
                required
                rules={[{ required: true, message: "Bidang wajib diisi" }]}
                // style={{ display: "none" }}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="role"
                name="role"
                rules={[{ required: true, message: "Role wajib diisi" }]}
                required
            >
                <Select options={roleList} />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="username"
                name="username"
                required
                rules={[{ required: true, message: "Username wajib diisi" }]}
            >
                <Input />
            </Form.Item>

            <Form.Item
                {...formItemLayout}
                label="password"
                name="password"
                required={type != "edit" ? true : false}
                // style={{ display: type == "edit" ? "none" : "" }}
                // hidden={type == "edit" ? true : false}
                rules={[
                    {
                        required: type != "edit" ? true : false,
                        message: "Password wajib diisi",
                    },
                ]}
            >
                <Input type="password" />
            </Form.Item>
        </Form>
    );
};
export default UserForm;
