import {
    Button,
    Divider,
    Form,
    Input,
    Radio,
    Select,
    Upload,
    message,
} from "antd";
import { useEffect, useRef, useState } from "react";
import { PlusOutlined, UploadOutlined } from "@ant-design/icons";
import axios from "axios";
import { router } from "@inertiajs/react";
import RupiahInput from "@/Components/RupiahInput";

const FinishPenyedia: React.FC<{
    form: any;
    // defaultPreview: string | null;
}> = ({ form }) => {
    const formItemLayout = {
        wrapperCol: { span: 24 },
    };
    const [messageApi, contextHolder] = message.useMessage();
    const [statusList, setStatusList] = useState([]);
    const [kodeStatus, setKodeStatus] = useState("");
    const [value, setValue] = useState<number>(0);

    const handleChange = (newValue: number | undefined) => {
        if (newValue !== undefined) {
            setValue(newValue ? newValue : 0);
        }
        console.log({ value });
    };

    // define document ready
    useEffect(() => {
        async function fetchData() {
            const response = await axios.get(route("maintenance.status.fetch"));
            // implement kode status > current code not yet
            console.log(response);
            let statusList = response.data.map((item: any) => ({
                label: `${item.kode_status}. ${item.deskripsi}`,
                value: item.kode_status,
            }));
            setStatusList(statusList);
        }
        fetchData();
    }, []);

    const onFinish = async (values: any) => {
        const saveKey = "iniesta";
        // console.log({ values });
        // return 1;
        messageApi.open({
            key: saveKey,
            content: "Sedang mengirim formulir...",
            type: "loading",
        });

        try {
            const response = await axios.post(
                route("maintenance.status.finish-penyedia"),
                values,
                {
                    headers: {
                        "Content-Type": "application/json",
                    },
                }
            );
            messageApi.open({
                key: saveKey,
                content: "Berhasil menyimpan perubahan...",
                type: "success",
            });
            router.get(route("admin.kelola.pengajuan"));
        } catch (error: any) {
            if (error.response) {
                // The request was made and the server responded with a status code
                // that falls out of the range of 2xx
                const errorMessage =
                    error.response.data.error || "Unknown error";
                messageApi.open({
                    key: saveKey,
                    content: errorMessage,
                    type: "error",
                });
            } else if (error.request) {
                // The request was made but no response was received
                console.error("No response received:", error.request);
            } else {
                // Something else happened while setting up the request
                console.error("Error setting up the request:", error.message);
            }
            return false;
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
                <Form.Item
                    {...formItemLayout}
                    label="Status Berikutnya"
                    name="kode_status"

                    // style={{ display: "none" }}
                >
                    Diperiksa oleh Tim IPDS
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="Solusi yang diterapkan"
                    name="solution"

                    // style={{ display: "none" }}
                >
                    <Input />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="Biaya Perbaikan"
                    name="biaya"
                    required
                    rules={[
                        // {
                        //     min: 1000,
                        //     message:
                        //         "Biaya perbaikan minimum value must be greater than 1000",
                        // },
                        {
                            required: true,
                            message: "Biaya perbaikan must be filled",
                        },
                    ]}
                >
                    <RupiahInput value={value} onChange={handleChange} />
                </Form.Item>
            </Form>
        </>
    );
};

export default FinishPenyedia;
