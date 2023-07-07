import ApplicationLogo from "@/Components/ApplicationLogo";
import { Menu, Space } from "antd";
import Sider from "antd/es/layout/Sider";
import {
    DashboardOutlined,
    BarChartOutlined,
    ShoppingOutlined,
    FileOutlined,
    UsergroupAddOutlined,
    DatabaseOutlined,
    FileDoneOutlined,
    HomeOutlined,
    DesktopOutlined,
} from "@ant-design/icons";
import { router } from "@inertiajs/react";
type AuthSiderProps = {
    collapsed: boolean;
    selectedKey: string;
    handleMenuClick: (key: string) => void;
};
const AuthSider: React.FC<AuthSiderProps> = ({
    collapsed,
    selectedKey,
    handleMenuClick,
}) => {
    return (
        <Sider trigger={null} collapsible collapsed={collapsed} theme="light">
            <div
                style={{
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "center",
                    padding: "16px",
                }}
            >
                <ApplicationLogo width="50px" preview={false} /> <br />
                <span
                    style={{
                        display: collapsed ? "none" : "block",
                        fontSize: "1.5rem",
                        fontFamily: "Roboto",
                        color: "#3219d4",
                        fontWeight: "bold",
                        marginLeft: "10px",
                    }}
                >
                    Smokol
                </span>
            </div>

            <Menu
                style={{ backgroundColor: "transparent", color: "#000" }}
                mode="inline"
                selectedKeys={[selectedKey]}
                items={[
                    {
                        key: "dashboard",
                        icon: <DashboardOutlined />,
                        onClick: ({ key }) => handleMenuClick(key),
                        label: "Dashboard",
                    },
                    {
                        key: "statistics",
                        icon: <BarChartOutlined />,
                        onClick: ({ key }) => handleMenuClick(key),
                        label: "Statistics",
                    },
                    {
                        key: "barang",
                        icon: <ShoppingOutlined />,
                        onClick: ({ key }) => handleMenuClick(key),
                        label: "Daftar Barang",
                    },
                    {
                        key: "pengajuan",
                        icon: <FileOutlined />,
                        onClick: ({ key }) => handleMenuClick(key),
                        label: "Daftar Pengajuan",
                    },
                    {
                        key: "5",
                        // icon: <UsergroupAddOutlined />,
                        label: "Menu Admin",
                        type: "group",
                        children: [
                            {
                                key: "admin.kelola.history_barang.index",
                                icon: <ShoppingOutlined />,
                                label: <>Kelola Barang</>,
                                onClick: ({ key }) => handleMenuClick(key),
                            },
                            {
                                key: "admin.kelola.pengajuan",
                                icon: <FileDoneOutlined />,
                                label: <>Kelola Pengajuan</>,
                                onClick: ({ key }) => handleMenuClick(key),
                            },
                            {
                                key: "admin.master.barang",
                                icon: <DatabaseOutlined />,
                                label: <>Master Barang</>,
                                onClick: ({ key }) => handleMenuClick(key),
                            },
                            {
                                key: "admin.master.ruangan",
                                icon: <HomeOutlined />,
                                label: <>Master Ruangan</>,
                                onClick: ({ key }) => handleMenuClick(key),
                            },
                            {
                                key: "admin.master.jabatan",
                                icon: <UsergroupAddOutlined />,
                                label: <>Master Jabatan</>,
                                onClick: ({ key }) => handleMenuClick(key),
                            },
                            {
                                key: "admin.master.sistem_operasi.index",
                                icon: <DesktopOutlined />,
                                label: <>Master Sistem Operasi</>,
                                onClick: ({ key }) => handleMenuClick(key),
                            },
                        ],
                    },
                ]}
            />
        </Sider>
    );
};

export default AuthSider;
