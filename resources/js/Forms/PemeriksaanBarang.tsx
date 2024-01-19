import { Button, Divider, Form, Input, Select, Upload, message } from "antd";
import { useEffect, useRef, useState } from "react";
import { PlusOutlined, UploadOutlined } from "@ant-design/icons";
import axios from "axios";

const PemeriksaanForm: React.FC<{
    form: any;
    onFinish: (values: any) => void;
    // record: any;
}> = ({ form, onFinish }) => {
    const formItemLayout = {
        wrapperCol: { span: 24 },
    };
    const [messageApi, contextHolder] = message.useMessage();
    const [file, setFile] = useState(null);    
    const [previewImage, setPreviewImage] = useState<
        string | ArrayBuffer | null
    >(null);

    const handleChange = (info: any) => {
        // console.log({info})
        const { fileList } = info;
        
        const file = fileList.length>0 ? fileList[0]:false;
        if (!file) {
            setFile(null)
            setPreviewImage(null)
            return false}
        
        // console.log({file})
        if ( file.originFileObj) {
           setFile(file);
           handlePreview(file);
        }
        // const isImage = file.type.startsWith("image/");
        // if (!isImage) {
        //     message.warning(
        //         `mohon maaf, ${file.name} bukan merupakan file gambar, hanya menerima gambar.`
        //     );
        //     setPreviewImage(null);
        // } else {
        //     setFile(file);
        //     handlePreview(file);
        // }
    };
    const handlePreview = async (file: any) => {
        console.log({ file });
        if (file.url) {
            setPreviewImage(file.url);
        } else {
            const reader = new FileReader();
            reader.onloadend = () => {
                setPreviewImage(reader.result);
            };
            reader.readAsDataURL(file.originFileObj);
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
                    // style={{ display: "none" }}
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
                    label="Permasalahan yang Ditemukan"
                    name="problem_description"
                    // style={{ display: "none" }}
                >
                    <Input.TextArea />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="Solusi yang Dilakukan"
                    name="solution"
                    // style={{ display: "none" }}
                >
                    <Input.TextArea />
                </Form.Item>
                <Form.Item
                    {...formItemLayout}
                    label="Tindak Lanjut"
                    name="next_step"
                    // style={{ display: "none" }}
                >
                    <Select options={[
                        { value: 'sample', label: <span>sample</span> },
                        { value: 'sample', label: <span>sample</span> },
                        { value: 'sample', label: <span>sample</span> },
                        { value: 'sample', label: <span>sample</span> },
                        { value: 'sample', label: <span>sample</span> },
                        { value: 'sample', label: <span>sample</span> },
                    ]} />
                </Form.Item>
           
            </Form>
        </>
    );
};

export default PemeriksaanForm;
