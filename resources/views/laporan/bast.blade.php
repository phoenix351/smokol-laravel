@php
    use Carbon\Carbon;
    setlocale(LC_TIME, 'id_ID');
    Carbon::setLocale('id');
    Carbon::now()->formatLocalized('%A, %d %B %Y');
    $today = Carbon::now();
@endphp
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Berita Acara Serah Terima</title>
</head>
<style>
    @page {
        size: A4;
    }

    body {
        font-size: 13px
    }

    .header {
        /* display: flex/; */
        width: 100vw;
        min-height: 10px;
        /* background-color: aqua; */
        text-align: center;

        /* margin-bottom: 10px; */
    }

    .title {
        text-align: center;
        font-weight: 400;
        text-transform: uppercase
    }


    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 5px;
        /* word-spacing: 100px; */
    }

    .table-bordered {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }


    .table th,
    .table td {
        /* text-align: left; */
        padding: 6px;
        /* border: 1px solid #ddd; */
    }

    .table-bordered th,
    .table-bordered td {
        /* text-align: left; */
        padding: 6px;
        border: 1px solid #ddd;
    }

    .table th {
        background-color: #f2f2f2;
    }



    .table-spacing {
        display: table;
        width: 100%;
    }

    .table-spacing>div {
        display: table-cell;
    }

    .keterangan {}

    .text-right {
        text-align: right;
    }

    .text-center {
        text-align: center;
    }

    .text-left {
        text-align: left;
    }

    .peringatan {
        border: 1px solid #ddd;
        padding: 10px;
        margin-top: 30px;
    }

    .container {
        page-break-inside: avoid
    }

    .blank-row {
        padding: 30px;
    }

    .materai {
        height: 5rem;
    }
</style>

<body>
    <div class="header">
        <img width="200" src="images/bps2.png" alt="logo garuda">
        <h3 class="title">BADAN PUSAT STATISTIK</h3>
        <h3 class="title">PROVINSI SULAWESI UTARA</h3>
        Jl. 17 Agustus Manado, Sulawesu Utara
        Telp : (0431) 847044, Fax : (0431) 862204
        Homepage: http:\\sulut.bps.go.id, email : bps7100@bps.go.id
    </div>
    <hr>
    <h3 class="title">BERITA ACARA SERAH TERIMA</h3>
    <h3 class="title">PENATAAUSAHAAN BARANG MILIK NEGARA (BASTP-BMN)</h3>

    <span class="title" style="margin-bottom:2rem">Nomor : XX/71000/XX.XX/YYYYY</span>


    <table>
        <tbody>
            <tr style="margin-bottom: 50px">
                <td colspan="4">Pada Hari ini, {{ $today->format('l') }} tanggal
                    {{ $today->format('d') }} tahun
                    {{ $today->format('Y') }}
                    bertempat di Kota Manado, kami yang bertanda tangan di bawah ini : </td>
            </tr>
            <tr style="width: 100%">
                <td style="width: 50px">I.</td>
                <td style="width: 100px">Nama</td>
                <td>:</td>
                <td style="width: 100%">{{ $pihak1->nama_lengkap }}</td>
            </tr>
            <tr>
                <td></td>
                <td>NIP</td>
                <td>:</td>
                <td>{{ $pihak1->nip }}</td>
            </tr>
            
            <tr>
                <td></td>
                <td>Jabatan</td>
                <td>:</td>
                <td>{{ $pihak1->jabatan->nama . ' ' . $pihak1->tingkat }}</td>
            </tr>
            <tr>
                <td></td>
                <td colspan="3">Dalam hal ini bertindak untuk dan atas nama Tim Pengelola Barang Milik Negara (BMN)
                    untuk
                    selanjutnya disebut sebagai Pihak Pertama</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>II.</td>
                <td>Nama</td>
                <td>:</td>
                <td>{{ $pihak2->nama_lengkap }}</td>
            </tr>
            <tr>
                <td></td>
                <td>NIP</td>
                <td>:</td>
                <td>{{ $pihak2->nip }}</td>
            </tr>
            
            <tr>
                <td></td>
                <td>Jabatan</td>
                <td>:</td>
                <td>{{ $pihak2->jabatan->nama . ' ' . $pihak2->tingkat }}</td>
            </tr>
            <tr>
                <td></td>

                <td colspan="3">Dalam hal ini bertindak untuk dan atas nama Kuasa Pengguna Barang Milik Negara (BMN)
                    untuk
                    selanjutnya disebut sebagai Pihak Kedua</td>
            </tr>
            <tr>
                <td colspan="4">

                    Telah melakukan serah terima Barang Milik Negara yang pengadaanya dilaksanakan dan menjadi tanggung
                    jawab mutlak
                    Kuasa Pengguna Barang Milik Negara (BMN) berdasarkan DIPA Belanja. Rincian Barang Milik Negara yang
                    dimaksud adalah sebagai berikut:
                </td>
            </tr>
            <tr>
                <td></td>
                <td>Jenis</td>
                <td>:</td>
                <td>{{ $barang->barang->jenis }}</td>
            </tr>
            <tr>
                <td></td>
                <td>Merk/Tipe</td>
                <td>:</td>
                <td>{{ $barang->barang->merk }}/{{ $barang->barang->tipe }}</td>
            </tr>
            <tr>
                <td></td>
                <td>Tahun Perolehan</td>
                <td>:</td>
                <td>2023</td>
            </tr>
            <tr>
                <td colspan="4">

                    Dengan ditandatanganinya Berita Acara Serah Terima ini maka tanggung jawab pengelolaan Barang Milik
                    Negara beralih dari PIHAK PERTAMA kepada PIHAK KEDUA
                </td>
            </tr>

        </tbody>
    </table>
    <div style="width: 100%;display:flex;justify-content:center;margin-top:3rem">

        <table style="margin:auto">
            <tbody style="text-center">
                <tr>
                    <td style="width: 300px">PIHAK KEDUA</td>
                    <td>PIHAK PERTAMA</td>
                </tr>
                <tr class="blank-row">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="materai">materai</td>
                    <td class="materai">materai</td>
                </tr>
                <tr class="blank-row">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td>Nama : {{ $pihak2->nama_lengkap }}</td>
                    <td>Nama : {{ $pihak1->nama_lengkap }}</td>
                </tr>
                <tr>
                    <td>NIP : {{ $pihak2->nip }}</td>
                    <td>NIP : {{ $pihak1->nip }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>

</html>
