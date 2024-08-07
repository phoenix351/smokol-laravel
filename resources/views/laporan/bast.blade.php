@php
    use Carbon\Carbon;
    setlocale(LC_TIME, 'id_ID');
    Carbon::setLocale('id');
    Carbon::now()->formatLocalized('%A, %d %B %Y');
    $today = Carbon::now();
    $daftar_hari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
    $daftar_bulan = [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember',
    ];

    function angkaKeHuruf($angka)
    {
        $huruf = [
            '',
            'satu',
            'dua',
            'tiga',
            'empat',
            'lima',
            'enam',
            'tujuh',
            'delapan',
            'sembilan',
            'sepuluh',
            'sebelas',
        ];
        if ($angka < 12) {
            return $huruf[$angka];
        } elseif ($angka < 20) {
            return $huruf[$angka - 10] . ' belas';
        } elseif ($angka < 100) {
            return $huruf[floor($angka / 10)] . ' puluh ' . $huruf[$angka % 10];
        } elseif ($angka < 200) {
            return 'seratus ' . angkaKeHuruf($angka % 100);
        } elseif ($angka < 1000) {
            return $huruf[floor($angka / 100)] . ' ratus ' . angkaKeHuruf($angka % 100);
        } elseif ($angka < 2000) {
            return 'seribu ' . angkaKeHuruf($angka % 1000);
        } elseif ($angka < 10000) {
            return $huruf[floor($angka / 1000)] . ' ribu ' . angkaKeHuruf($angka % 1000);
        }
        // Anda dapat melanjutkan dengan ribuan, jutaan, dan seterusnya
    }
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
        /* margin: 100px; */
        margin-top: 0.5in;
        margin-left: 1in;
        margin-right: 1in;
        margin-bottom: 1in;
    }

    body {
        font-size: 13px;
        font-family: 'Times New Roman', Times, serif
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
        font-weight: 600;
        text-transform: uppercase;
        width: 100%
    }

    .sub-title {
        text-align: center;
        font-weight: normal;
        text-transform: uppercase;
    }


    table {
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

    .logo-container {
        display: flex;
    }

    .logo-nama {
        text-align: left;
        font-weight: bold;
        font-size: 1.3rem;
        font-family: Arial, Helvetica, sans-serif;
        font-style: italic;
    }

    .logo-image {
        padding: 10px
    }

    .table-row,
    .table-data {
        border: 1px solid #000;
        padding: 10px;
        border-collapse: collapse;

    }



    .bold {
        font-weight: bold;
    }

    .pasal {
        font-size: 1.1rem;
        padding: 10px;
    }

    .sign {
        page-break-inside: avoid;
        margin-top: 2rem
    }
</style>

<body>

    <table>
        <tbody>
            <tr>
                <td rowspan="3"><img class="logo-image" width="100" src="images/bps2.png" alt="logo garuda"></td>
                <td class="logo-nama">BADAN PUSAT STATISTIK</td>
            </tr>
            <tr>
                <td class="logo-nama">PROVINSI SULAWESI UTARA</td>
            </tr>
            <tr>
                <td>Jl. 17 Agustus Manado, Sulawesi Utara
                    Telp : (0431) 847044, Fax : (0431) 862204
                    Homepage: http:\\sulut.bps.go.id, email : bps7100@bps.go.id</td>
            </tr>
        </tbody>
    </table>
    <hr>
    <table style="margin-top: 2rem">
        <tbody>
            <tr>
                <td class="title">
                    BERITA ACARA SERAH TERIMA
                </td>
            </tr>
            <tr>
                <td class="title">
                    PENATAAUSAHAAN BARANG MILIK NEGARA (BASTP-BMN)
                </td>
            </tr>
            <tr>
                <td class="sub-title">
                    Nomor : XX/71000/XX.XX/YYYYY
                </td>
            </tr>
        </tbody>
    </table>






    <table style="margin-top: 2rem">
        <tbody>
            <tr style="margin-bottom: 50px">
                <td colspan="4">Pada Hari ini, {{ $daftar_hari[$today->format('w') - 1] }} tanggal
                    {{ angkaKeHuruf($today->format('d')) }} bulan {{ $daftar_bulan[$today->format('n') - 1] }} tahun
                    {{ angkaKeHuruf($today->format('Y')) }},
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
                <td>{{ $pihak1->jabatan->nama . ' ' . $pihak1->tingkat . ', untuk selanjutnya disebut PIHAK PERTAMA ' }}
                </td>
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
                <td>{{ $pihak2->jabatan->nama . ' ' . $pihak2->tingkat . ', untuk selanjutnya disebut PIHAK KEDUA ' }}
                </td>
            </tr>

            <tr>
                <td colspan="4">

                    telah melakukan serah terima Barang Milik Negara dengan ketentuan sebagaimana disebutkan dalam pasal
                    – pasal di bawah ini :
                </td>
            </tr>
        </tbody>
    </table>

    <table>
        <tbody>

            <tr>

                <th class="pasal">Pasal 1</th>
            </tr>
            <tr>

                <td>PIHAK PERTAMA menyerahkan dan PIHAK KEDUA menerima hak atas Barang Milik Negara,
                    berupa : </td>
            </tr>
        </tbody>
    </table>
    <table style="margin-top:1rem;border-collapse:collapse">
        <tr>
            <td></td>
            <td class="table-data bold">No.</td>
            <td class="table-data bold">Nama Barang</td>
            <td class="table-data bold">Jenis</td>
            <td class="table-data bold">Nomor Seri</td>
            <td class="table-data bold">NUP</td>

        </tr>
        <tbody>
            @foreach ($barangs as $index => $barang)
                <tr>
                    <td style="width:50px"></td>
                    <td class="table-data">{{ $index + 1 }}</td>
                    <td class="table-data">{{ $barang->barang->merk }}/{{ $barang->barang->tipe }}</td>
                    <td class="table-data">{{ $barang->barang->jenis }}</td>
                    <td class="table-data">{{ $barang->barang->nomor_seri }}</td>
                    <td class="table-data">{{ $barang->barang->nomor_urut_pendaftaran }}</td>

                </tr>
            @endforeach
        </tbody>
    </table>
    <table>
        <tbody>
            <tr>

                <th class="pasal">Pasal 2</th>
            </tr>
            <tr>

                <td>BMN tersebut hanya untuk dipinjamkan dan digunakan sebagai penunjang kegiatan
                    perkantoran dan sewaktu-waktu BMN tersebut akan ditarik jika diperlukan atau tidak dimanfaatkan
                    dengan baik. </td>
            </tr>
            <tr>

                <th class="pasal">Pasal 3</th>
            </tr>
            <tr>

                <td>Dalam pengoperasiannya Pihak Kedua bertanggung jawab penuh untuk memperbaiki atau
                    mengganti atas kerusakan atau kehilangan BMN tersebut. </td>
            </tr>
            <tr>

                <th class="pasal">Pasal 4</th>
            </tr>
            <tr>

                <td>Ketika selesai tugas dan/atau dipindahtugaskan maka Laptop tersebut harus segera
                    diserahkan kembali kepada kuasa pengguna barang dalam hal ini Kepala BPS Provinsi Sulawesi Utara.
                </td>
            </tr>
            <tr>

                <th class="pasal">Pasal 5</th>
            </tr>
            <tr>

                <td>Dengan ditandatanganinya BAST ini, maka tanggung jawab atas pengurusan dalam
                    pengelolaan dan pemeliharaannya sebagaimana tersebut dalam pasal 1 beralih dari Pihak Pertama ke
                    Pihak Kedua selama masa pemanfaatannya. </td>
            </tr>
            <tr>

                <th class="pasal">Pasal 6</th>
            </tr>
            <tr>

                <td>BAST ini dibuat sebagai bukti yang sah dalam rangkap 2 (dua) untuk dipergunakan
                    semestinya. </td>
            </tr>

        </tbody>
    </table>
    {{-- 

        </tbody>
    </table> --}}
    <div class="sign" style="width: 100%;display:flex;justify-content:center;margin-top:3rem">

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
