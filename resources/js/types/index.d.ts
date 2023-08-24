export interface User {
    id: number;
    nama_lengkap: string;
    username: string;
    email: string;
    email_verified_at: string;
    nip: string;
    posisi: string;
    bidang: string;
    role: string;
}

export type PageProps<
    T extends Record<string, unknown> = Record<string, unknown>
> = T & {
    auth: {
        user: User;
    };
};

export interface KondisiSummary {
    kondisi: string;
    jumlah: number;
}

export interface RuanganSummary {
    ruangan_id: number;
    ruangan_nama: string;
    jumlah: number;
}
export interface Summary {
    label: string;
    value: number;
}

export interface DataType {
    key: React.Key;
    barang_jenis: string;
    barang_tipe: string;
    barang_merk: string;
    tanggal_peroleh?: number | string | any;
    barang_nomor_seri: string;
    kondisi: string;
    ruangan_nama: string;
    users_nama_lengkap: string;
}
export interface Barang {
    id: number;
    key: number;
    barang_id: number;
    barang_jenis: string;
    barang_tipe: string;
    barang_merk: string;
    tanggal_peroleh?: number | string | any;
    barang_nomor_seri: string;
    kondisi: string;
    ruangan_nama: string;
    users_nama_lengkap: string;
    bast_path?: string | null;
    is_approved?: boolean;
    pengguna_id: number;
}

export interface BastType {
    id: number;
    upload_date: Date;
    is_approved: boolean;
    path: string | null;
    approval_date: Date | null;
    comment: string | null;
}

export interface Maintenance {
    id: number;
    maintenance_id: number;
    key: number;
    barang_id: number;
    users_id: number;
    // sequence_id: number;
    keluhan: string;
    kondisi_final: string;
    catatan_admin: string | null;
    bukti_rusak_berat: string | null;
    biaya: number | null;
    created_at: string | null;
    updated_at: string | null;
    status: string;
    jenis: string;
    merk: string;
    tipe: string;
    nomor_seri: string;
}
