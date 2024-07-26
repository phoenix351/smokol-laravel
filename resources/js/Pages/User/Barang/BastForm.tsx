import { Barang, User } from "@/types";
import { WindowsFilled } from "@ant-design/icons";
import { router } from "@inertiajs/react";
import { Form, FormInstance, Modal, Select } from "antd";
import axios from "axios";
import React, { useEffect, useState } from "react";

// const BastForm = ({ open, onFinish, form }: { open: boolean, onFinish: (values: FormData) => void; form: FormInstance }) => {
const BastForm = ({
    open,
    form,
    onCancel,
    user,
}: {
    open: boolean;
    form: FormInstance;
    onCancel: () => void;
    user: User;
}) => {
    const [currentRole, setcurrentRole] = useState(1);
    const [users, setUsers] = useState<User[]>([]);
    const [barangs, setBarangs] = useState<Barang[]>([]);

    const [barangLoading, setBarangLoading] = useState(false);
    const [usersLoading, setUsersLoading] = useState(false);
    const [confirmLoading, setConfirmLoading] = useState(false);

    const fetchBarangs = async (user_id: string | number) => {
        try {
            setBarangLoading(true);
            const { data } = await axios.get(
                `/api/barang?isUser=1&userId=${user_id}`
            );
            console.log({ x: data.data[0] });
            const convertedBarangs = data.data.map((item: any) => ({
                label: `${item.barang.merk}/${item.barang.tipe}`,
                value: item.id,
            }));
            setBarangs(convertedBarangs);
        } catch (error) {
        } finally {
            setBarangLoading(false);
        }
    };
    const fetchUsers = async () => {
        try {
            setUsersLoading(true);
            const { data } = await axios.get(`/api/users`);
            // console.log({ data });
            const convertedItems = data.map((item: any) => ({
                label: item.nama_lengkap,
                value: item.id,
            }));
            setUsers(convertedItems);
        } catch (error) {
        } finally {
            setUsersLoading(false);
        }
    };
    const onFinish = async (values: { [key: number | string]: string }) => {
        try {
            setConfirmLoading(true);
            const params = Object.keys(values)
                .map(
                    (key: number | string): string =>
                        `${encodeURIComponent(key)}=${encodeURIComponent(
                            values[key]
                        )}`
                )
                .join("&");
            // console.log({ params });

            window.open(route("bast.cetak", values), "_blank"); // console.log({ data });
            // const convertedBarangs = data.map((item: any) => ({ label: `${item.merk}/${item.tipe}`, value: item.id }))
            // setBarangs(convertedBarangs)
        } catch (error) {
        } finally {
            setConfirmLoading(false);
        }
    };

    useEffect(() => {
        fetchUsers();

        if (currentRole === 1) {
            form.setFieldsValue({
                pihak1_user_id: user.id,
            });
        } else if (currentRole === 2) {
            form.setFieldsValue({
                pihak2_user_id: user.id,
            });
        }
        let user_id = form.getFieldValue("pihak1_user_id");
        if (!user_id) return;
        form.setFieldValue("", null);
        fetchBarangs(user_id);
    }, [currentRole, form.getFieldValue("pihak1_user_id")]);

    return (
        <Modal
            open={open}
            confirmLoading={confirmLoading}
            onCancel={onCancel}
            onOk={() => form.submit()}
            title="Formulir Pembuataan BAST"
        >
            <Form onFinish={onFinish} form={form}>
                <Form.Item label="Peran anda sebagai" name="role">
                    <Select
                        options={[
                            { label: "Pihak I (Pemberi BMN)", value: 1 },
                            { label: "Pihak II (Penerima BMN)", value: 2 },
                        ]}
                        onChange={(value) => setcurrentRole(value)}
                    />
                </Form.Item>

                <Form.Item label="Pihak I (Pemberi BMN)" name="pihak1_user_id">
                    <Select
                        showSearch
                        optionFilterProp="label"
                        options={users}
                        disabled={currentRole === 1}
                        onChange={(value) => {
                            fetchBarangs(value);
                        }}
                    />
                </Form.Item>
                <Form.Item
                    label="Pihak II (Penerima BMN)"
                    name="pihak2_user_id"
                >
                    <Select
                        showSearch
                        optionFilterProp="label"
                        options={users}
                        disabled={currentRole === 2}
                    />
                </Form.Item>

                <Form.Item label="Daftar Barang" name="barangs">
                    <Select
                        mode="multiple"
                        options={barangs}
                        loading={barangLoading}
                        optionFilterProp="label"
                    />
                </Form.Item>
            </Form>
        </Modal>
    );
};

export default BastForm;
