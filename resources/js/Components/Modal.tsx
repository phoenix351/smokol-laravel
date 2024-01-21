import React, { PropsWithChildren, useState } from "react";
import { Button, Divider, Modal } from "antd";

interface ModalProps {
    title: string;
    openModal: boolean;
    handleOk: () => void;
    confirmLoadingModal: boolean;
    handleCancel: () => void;
    okText?: string;
    cancelText?: string;
    width?: number | string;
}
const MyModal = ({
    title,
    openModal,
    handleOk,
    confirmLoadingModal,
    handleCancel,
    okText,
    cancelText,
    width,
    children,
}: PropsWithChildren<ModalProps>) => {
    return (
        <Modal
            title={title}
            open={openModal}
            onOk={handleOk}
            confirmLoading={confirmLoadingModal}
            onCancel={handleCancel}
            cancelText={cancelText}
            okText={okText}
            mask={true}
            width={width}
        >
            <Divider />
            {children}
        </Modal>
    );
};

export default MyModal;
