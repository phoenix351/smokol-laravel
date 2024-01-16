import { Button, Divider, Form, Input, Upload, message } from "antd";
import { useEffect, useRef, useState } from "react";
import { PlusOutlined, UploadOutlined } from "@ant-design/icons";
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
    const [fileList,setFileList] = useState([]);
    const [previewImage, setPreviewImage] = useState<string | ArrayBuffer|null>(null);


    const handleChange = ({ fileList }:any) => {
        setFileList(fileList);
        if (fileList.length > 0) {
            handlePreview(fileList[fileList.length - 1]); // Preview the last added file
          } else {
            setPreviewImage(null); // Clear preview if no files are selected
          }
      };
      const handlePreview = async (file:any) => {
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
                <Form.Item {...formItemLayout}
                    label="file"
                    name="file">
                    <Upload
                    onChange={handleChange}
                    fileList={fileList}
                    beforeUpload={()=>false}
                    onPreview={handlePreview}
                    listType="picture-card">
          <Button icon={<UploadOutlined />}>Select File</Button>

                    </Upload>
                </Form.Item>
                {previewImage && (
          <img
            alt="Preview"
            style={{ width: '100%', marginTop: '10px' }}
            src={previewImage as string}
          />
        )}
            </Form>
        </>
    );
};

export default PemeliharaanForm;
