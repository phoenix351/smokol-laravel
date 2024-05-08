@php
    setlocale(LC_TIME, 'id_ID');
    \Carbon\Carbon::setLocale('id');
    \Carbon\Carbon::now()->formatLocalized('%A, %d %B %Y');
@endphp
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<style>
    @page {
        size: A4 landscape;
    }

    body {
        font-size: 13px
    }

    .header {
        display: flex;
        width: 100vw;
        min-height: 10px;
        /* background-color: aqua; */
        margin-top: 0px;
        padding-top: 0px;
        flex-direction: column;
        justify-content: space-between;
    }

    .title {
        text-align: center
    }

    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 5px;
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
</style>

<body>
    <div class="header">
        <img width="200" src="images/satker-hitam.png" alt="logo garuda">


    </div>
    <hr>
    <h3 class="title">DAFTAR BARANG RUANGAN</h3>
    <table class="keterangan">
        <thead>
            <tr>
                <th></th>
                <th></th>
                <th width="30"></th>
                <th></th>
                <th></th>
            </tr>

        </thead>
        <tbody>
            <tr>
                <td colspan="2">PEMILIK RUANGAN</td>
                {{-- <td></td> --}}
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>UAPB</td>
                <td>: BADAN PUSAT STATISTIK</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>UAPB-E1</td>
                <td>: BADAN PUSAT STATISTIK</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>UAPB-W</td>
                <td>: KORWIL BADAN PUSAT STATISTIK</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>NAMA UAKPB</td>
                <td>: BPS SULUT</td>
                <td></td>
                <td>NAMA RUANGAN</td>
                <td>: {{ $ruangan['nama'] }}</td>
            </tr>

            <tr>
                <td>KODE UAKPB</td>
                <td>: 054011700428701000KD</td>
                <td></td>
                <td>KODE RUANGAN</td>
                <td>: {{ $ruangan['kode_baru'] }}</td>
            </tr>

        </tbody>
    </table>
    <table class="table-bordered">
        <thead>
            <tr>
                <th rowspan="2" class="text-right">No.</th>
                <th rowspan="2" class="text-left">Kode Barang</th>
                <th rowspan="2" class="text-left">Nama Barang</th>
                <th rowspan="2" class="text-left">NUP</th>
                <th colspan="2">Identitas Barang</th>
                <th rowspan="2" class="text-left">Pemilik Barang</th>
                <th rowspan="2" class="text-left">Keterangan</th>

            </tr>
            <tr>
                <th class="text-left">Merk/Type</th>
                <th class="text-center">Thn. Perolehan</th>
            </tr>

        </thead>
        <tbody>
            @foreach ($data as $index => $item)
                <tr>
                    <td class="text-center">{{ $index + 1 }}</td>
                    <td>{{ $item['kode_barang'] }}</td>
                    <td>{{ $item['jenis'] }}</td>
                    <td class="text-right">{{ $item['nomor_urut_pendaftaran'] }}</td>
                    <td>{{ $item['merk'] . '/' . $item['tipe'] }}</td>
                    <td class="text-center">
                        @if ($item['tanggal_peroleh'] && \Carbon\Carbon::parse($item['tanggal_peroleh'])->format('Y') !== '-0001')
                            {{ \Carbon\Carbon::parse($item['tanggal_peroleh'])->format('Y') }}
                        @else
                            -
                        @endif
                    </td>
                    <td>{{ $item['nama_lengkap'] }}</td>
                    <td>-</td>
                </tr>
            @endforeach

        </tbody>
    </table>
    <div class="container">

        <div class="peringatan">Tidak dibenarkan memindahkan barang-barang yang ada pada daftar ini tanpa sepengetahuan
            penanggung jawab Unit
            Akutansi Kuasa Pengguna barang (UAKPB) dan penanggung jawab ruangan ini</div>
        <table class="text-center table">
            {{-- <thead>
            <tr>
                <th></th>
                <th></th>
                <th></th>
            </tr>
        </thead> --}}
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Kota Manado, {{ \Carbon\Carbon::now()->format('j F Y') }}
                    </td>
                </tr>
                <tr>
                    <td>Satker Pengguna Ruangan</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>[054011700428701000KD]</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Penanggung Jawab UAPKPB/UAKPB</td>
                    <td></td>
                    <td>Penanggung Jawab Ruangan</td>
                </tr>
                <tr>
                    <td>
                        <div style="height: 40px"></div>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="padding:0px">{{ $nama_kepala }}</td>
                    <td style="padding:0px"></td>
                    <td style="padding:0px">{{ $ruangan['nama_lengkap'] }}</td>
                    {{-- <td>{{ $nip_pj }}</td> --}}
                </tr>
                <tr>
                    <td style="padding:0px">NIP. {{ $nip_kepala }}</td>
                    <td style="padding:0px"></td>
                    <td style="padding:0px">NIP. {{ $ruangan['nip'] }}</td>
                    {{-- <td>{{ $nip_pj }}</td> --}}
                </tr>
            </tbody>
        </table>
    </div>
</body>

</html>
