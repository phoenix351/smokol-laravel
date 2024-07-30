import { Barang, User } from "@/types";
import { WindowsFilled } from "@ant-design/icons";
import { router } from "@inertiajs/react";
import {
    Col,
    Divider,
    Form,
    FormInstance,
    Input,
    Modal,
    Row,
    Select,
    Space,
} from "antd";
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
                `/api/barang?isUser=1&userId=${user_id}${searchText}`
            );
            // console.log({ x: data.data[0] });
            const convertedBarangs = data.data.map((item: any) => ({
                label: (
                    <Space
                        direction="vertical"
                        // style={{ border: "1px solid black" }}
                    >
                        <Space>
                            {item.barang.merk}/{item.barang.tipe}
                        </Space>
                        {/* <Divider /> */}
                        <Space>Nomor Seri : {item.barang.nomor_seri}</Space>
                        <Space>
                            NUP : {item.barang.nomor_urut_pendaftaran}
                        </Space>
                    </Space>
                ),
                value: item.id,
            }));
            setBarangs(data.data);
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
        console.log({ values });

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
        >
            <Form
                onFinish={onFinish}
                form={form}
                labelCol={{ span: 10 }}
                wrapperCol={{ span: 14 }}
            >
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
                <Form.Item label="Pilih Barang">
                    <Input />
                </Form.Item>
                <Form.Item wrapperCol={{ offset: 10, span: 14 }}>
                    <Row gutter={{ xs: 8, sm: 16, md: 24, lg: 32 }}>
                        {" "}
                        {barangLoading
                            ? "memuat barang"
                            : barangs.map((barang, index) => (
                                  <Col
                                      span={12}
                                      style={{
                                          border: "1px solid #ddd",
                                          padding: "1rem",
                                          //   width: "100%",
                                          backgroundColor: barang.selected
                                              ? "#85ede4"
                                              : "",
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
                              ))}
                    </Row>
                </Form.Item>
                {/* <Form.Item label="Daftar Barang" name="barangs">
                    <Select
                        disabled
                        mode="multiple"
                        // options={barangs}
                        loading={barangLoading}
                        // onSearch={(text) => console.log({ text })}
                        showSearch
                        // optionFilterProp="label" // onChange={(value) => console.log({ value })}
                    />
                </Form.Item> */}
            </Form>
        </Modal>
    );
};

export default BastForm;
