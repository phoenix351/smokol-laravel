import { Barang, User } from "@/types";
import { WindowsFilled } from "@ant-design/icons";
import { router } from "@inertiajs/react";
import {
    Col,
    Divider,
    Empty,
    Form,
    FormInstance,
    Input,
    Modal,
    Row,
    Select,
    Space,
    Spin,
} from "antd";
import axios from "axios";
import { join } from "path";
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

    // const [barangSelected, setBarangSelected] = useState<number[]>([]);

    const [barangLoading, setBarangLoading] = useState(false);
    const [usersLoading, setUsersLoading] = useState(false);
    const [confirmLoading, setConfirmLoading] = useState(false);

    const fetchBarangs = async (user_id: string | number, search?: string) => {
        try {
            setBarangLoading(true);
            let searchText = search ? `&searchText=${search}` : "";
            form.setFieldValue("barangs", []);
            const { data } = await axios.get(
                `/api/barang?pageSize=999&isUser=1&userId=${user_id}`
            );
            let copyBarangs = [...data.data];
            copyBarangs = copyBarangs.map((barang) => {
                barang["filtered"] = true;
                return barang;
            });

            setBarangs(copyBarangs);
        } catch (error) {
        } finally {
            setBarangLoading(false);
            // console.log({ barangs });
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
        const selectedItems = barangs
            .filter((barang) => barang.selected)
            .map((item) => item.id);
        values["barangs"] = String(selectedItems);
        // console.log({ values });

        // return;

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
            width={1000}
            centered
        >
            <Form
                onFinish={onFinish}
                form={form}
                labelCol={{ span: 10 }}
                wrapperCol={{ span: 14 }}
                style={{ height: "600px" }}
            >
                <Form.Item
                    label="Peran anda sebagai"
                    name="role"
                    initialValue={1}
                >
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

                <Form.Item label="Pilih barang">
                    <Input
                        placeholder="Cari berdasarkan NUP atau jenis atau tipe atau nomor seri"
                        onChange={(event) => {
                            if (String(event.target.value) === "") {
                                let copyBarangs = [...barangs];
                                copyBarangs.map((barang) => {
                                    barang["filtered"] = true;
                                    return barang;
                                });
                                setBarangs(copyBarangs);
                                return;
                            }
                            let filteredBarangs = barangs.filter((barang) => {
                                let joinedString = [
                                    barang.barang.merk,
                                    barang.barang.tipe,
                                    barang.barang.nomor_seri,
                                    barang.barang.nomor_urut_pendaftaran,
                                ]
                                    .join(" ")
                                    .toLowerCase();
                                return joinedString.includes(
                                    String(event.target.value).toLowerCase()
                                );
                            });
                            let copyBarangs = [...barangs];
                            // reset
                            copyBarangs = copyBarangs.map((barang) => {
                                barang["filtered"] = false;
                                return barang;
                            });
                            filteredBarangs.forEach((barang) => {
                                // barang['filtered'] = true;
                                let index = copyBarangs.findIndex(
                                    (item) => item.id === barang.id
                                );
                                copyBarangs[index]["filtered"] = true;
                            });
                            setBarangs(copyBarangs);
                        }}
                        style={{ marginBottom: "1rem" }}
                    />
                    <Row style={{ height: "400px", overflowY: "scroll" }}>
                        {" "}
                        {barangLoading ? (
                            <Spin spinning> Memuat Data</Spin>
                        ) : barangs.length < 1 ? (
                            <Empty
                                style={{ margin: "auto", padding: "1rem" }}
                                image={Empty.PRESENTED_IMAGE_SIMPLE}
                                description="Pegawai tidak menguasai BMN TIK"
                            />
                        ) : (
                            barangs.map((barang, index) => (
                                <Col
                                    span={12}
                                    style={{
                                        border: "1px solid #ddd",
                                        padding: "1rem",
                                        //   width: "100%",
                                        backgroundColor: barang.selected
                                            ? "#85ede4"
                                            : "",
                                        display: barang.filtered ? "" : "none",
                                    }}
                                    onClick={(value) => {
                                        let copyBarangs = [...barangs];
                                        copyBarangs[index]["selected"] =
                                            !copyBarangs[index]["selected"];
                                        //   console.log({ copyBarangs });

                                        setBarangs(copyBarangs);
                                    }}
                                >
                                    <Space direction="vertical">
                                        <Space>
                                            {barang.barang.merk}/
                                            {barang.barang.tipe}
                                        </Space>
                                        {/* <Divider /> */}
                                        <Space>
                                            Nomor Seri :{" "}
                                            {barang.barang.nomor_seri}
                                        </Space>
                                        <Space>
                                            NUP :{" "}
                                            {
                                                barang.barang
                                                    .nomor_urut_pendaftaran
                                            }
                                        </Space>
                                    </Space>
                                </Col>
                            ))
                        )}
                    </Row>
                </Form.Item>
            </Form>
        </Modal>
    );
};

export default BastForm;
