<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();
        $users = [
            ["id" => '1',    "email" => 'ponim@bps.go.id',    "nama_lengkap" => 'Admin Po',    "nip" => '199810132021041001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'ponimin99',    "foto_url" => 'ponimin99.png'],
            ["id" => '5',    "email" => 'umum7100@bps.go.id',    "nama_lengkap" => 'Bagian Umum',    "nip" => '000000000000000000',    "bidang" => 'Bagian Umum',    "username" => 'admin_umum',    "foto_url" => 'default.jpg'],
            ["id" => '178',    "email" => 'satria.adwendi@bps.go.id',    "nama_lengkap" => 'Satria June Adwendi SST',    "nip" => '199307102016021001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'awe',    "foto_url" => 'default.jpg'],
            ["id" => '179',    "email" => 'miaw_miranti@bps.go.id',    "nama_lengkap" => 'Mia Wahyumiranti',    "nip" => '198304112005022001',    "bidang" => 'Bagian Umum',    "username" => 'spk2',    "foto_url" => 'default.jpg'],
            ["id" => '180',    "email" => 'dame.simamora@bps.go.id',    "nama_lengkap" => 'Tiara Dameani S.ST',    "nip" => '198802082009122002',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'dame',    "foto_url" => 'default.jpg'],
            ["id" => '181',    "email" => 'hase@bps.go.id',    "nama_lengkap" => 'Hahotan Sagala SST',    "nip" => '198603202009021004',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'hahotan',    "foto_url" => 'default.jpg'],
            ["id" => '182',    "email" => 'indiraira@bps.go.id',    "nama_lengkap" => 'Indira Anastasia Lolowang SE',    "nip" => '198301252003122001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'ira',    "foto_url" => 'default.jpg'],
            ["id" => '185',    "email" => 'ernakusuma@bps.go.id', "nama_lengkap" => 'Erna Kusumawati SST',    "nip" => '198910192012112001',    "bidang" => 'Bagian Umum',    "username" => 'erna_kusumawati',    "foto_url" => 'default.jpg'],
            ["id" => '186',    "email" => 'n.walangadi@bps.go.id',    "nama_lengkap" => 'Ir. Nuraini Walangadi',    "nip" => '196511231992122001',    "bidang" => 'Bagian Umum',    "username" => 'ani',    "foto_url" => 'default.jpg'],
            ["id" => '187',    "email" => 'simon@bps.go.id',    "nama_lengkap" => 'Simon Andreas August Remiasa S.ST',    "nip" => '197710111999121001',    "bidang" => 'Bagian Umum',    "username" => 'simon',    "foto_url" => 'default.jpg'],
            ["id" => '189',    "email" => 'hase@bps.go.id',    "nama_lengkap" => 'Hahotan Sagala SST',    "nip" => '198603202009021004',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'hase',    "foto_url" => 'default.jpg'],
            ["id" => '190',    "email" => 'norma@bps.go.id',    "nama_lengkap" => 'Norma Olga Frida Regar, S.Si, M.Si',    "nip" => '196611291986032001',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'norma',    "foto_url" => 'default.jpg'],
            ["id" => '191',    "email" => 'ratnasuli@bps.go.id',    "nama_lengkap" => 'Ratna Sulistyowati, SST, SAB, M.Si',    "nip" => '198505262008012001',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'ratna',    "foto_url" => 'default.jpg'],
            ["id" => '193',    "email" => 'titienk@bps.go.id',    "nama_lengkap" => 'Titien Kristiningsih, SST, SE, M.Si',    "nip" => '198005252002122003',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'titien',    "foto_url" => 'default.jpg'],
            ["id" => '194',    "email" => 'rhiniechay@bps.go.id',    "nama_lengkap" => 'Sarjani Harini Martiningsih S.Si',    "nip" => '198803062011012015',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'rhiniechay',    "foto_url" => 'default.jpg'],
            ["id" => '195',    "email" => 'enggelingiacinta wongkar@bps.go.id',    "nama_lengkap" => 'Enggelin Giacinta Wongkar, SST',    "nip" => '199212292014122002',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'enggelin',    "foto_url" => 'default.jpg'],
            ["id" => '196',    "email" => 'wulandanawulandana b@bps.go.id',    "nama_lengkap" => 'Ayu Puspita Wulandana B, SST',    "nip" => '199010082014102001',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'wulandana',    "foto_url" => 'default.jpg'],
            ["id" => '197',    "email" => 'sirly@bps.go.id',    "nama_lengkap" => 'Sirly Catharina Worotikan, SE., M.Si.',    "nip" => '196808281994012001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'sirly',    "foto_url" => 'default.jpg'],
            ["id" => '198',    "email" => 'starrysolang@bps.go.id',    "nama_lengkap" => 'Starry Nouva Solang, M.Si.',    "nip" => '196709181994012001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'starry',    "foto_url" => 'default.jpg'],
            ["id" => '199',    "email" => 'victorps@bps.go.id',    "nama_lengkap" => 'Victor Prima Sirait, SST., M.S.E',    "nip" => '198103282006021001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'victor',    "foto_url" => 'default.jpg'],
            ["id" => '200',    "email" => 'oky@bps.go.id',    "nama_lengkap" => 'Oky Irwan Rosadi',    "nip" => '198610032011011011',    "bidang" => 'Bagian Umum',    "username" => 'oky',    "foto_url" => 'default.jpg'],
            ["id" => '201',    "email" => 'mariane.rantung@bps.go.id',    "nama_lengkap" => 'Mariane Esther Rantung, SST',    "nip" => '199408062017012001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'esther',    "foto_url" => 'default.jpg'],
            ["id" => '202',    "email" => 'akango@bps.go.id',    "nama_lengkap" => 'Abdullah Kango',    "nip" => '197407271997121001',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'akango',    "foto_url" => 'akango.jpeg'],
            ["id" => '204',    "email" => 'elriniwuisan@bps.go.id',    "nama_lengkap" => 'Elrini D. Wuisan, SE',    "nip" => '198210022010032001',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'elri',    "foto_url" => 'default.jpg'],
            ["id" => '205',    "email" => 'agnes.oroh@bps.go.id',    "nama_lengkap" => 'Agnes M. Oroh',    "nip" => '198208222008012014',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'agnes',    "foto_url" => 'default.jpg'],
            ["id" => '206',    "email" => 'firra@bps.go.id',    "nama_lengkap" => 'Firra Rastraaktiva Awaliyah S.Si',    "nip" => '198512142010032002',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'firra',    "foto_url" => 'default.jpg'],
            ["id" => '207',    "email" => 'limada iqbal@bps.go.id',    "nama_lengkap" => 'Limada Iqbal, SST',    "nip" => '199506222018021002',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'iqbal',    "foto_url" => 'iqbal.jpg'],
            ["id" => '208',    "email" => 'bregitta.lasut@bps.go.id',    "nama_lengkap" => 'Bregitta Sisilia Lasut SS',    "nip" => '198209182008012012',    "bidang" => 'Sosial',    "username" => 'gita',    "foto_url" => 'default.jpg'],
            ["id" => '209',    "email" => 'junitha@bps.go.id',    "nama_lengkap" => 'Junitha Sahureka',    "nip" => '198606112009022007',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'uneth',    "foto_url" => 'default.jpg'],
            ["id" => '210',    "email" => 'fmagdalena@bps.go.id',    "nama_lengkap" => 'Florentz Magdalena',    "nip" => '199108212014102000',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'florentz',    "foto_url" => 'default.jpg'],
            ["id" => '211',    "email" => 'stela@bps.go.id',    "nama_lengkap" => 'Stela Engeline Doris Lomboan',    "nip" => '197209091992092001',    "bidang" => 'Bagian Umum',    "username" => 'stela',    "foto_url" => 'default.jpg'],
            ["id" => '212',    "email" => 'joice.koyongian@bps.go.id',    "nama_lengkap" => 'Joice Juliana Koyongian A.Md',    "nip" => '198307062011012015',    "bidang" => 'Bagian Umum',    "username" => 'juliana',    "foto_url" => 'default.jpg'],
            ["id" => '214',    "email" => 'frisda@bps.go.id',    "nama_lengkap" => 'Frisda Arisanti T',    "nip" => '198603082006042001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'frisda',    "foto_url" => 'default.jpg'],
            ["id" => '215',    "email" => 'dame.simamora@bps.go.id',    "nama_lengkap" => 'Tiara Dameani S.ST',    "nip" => '198802082009122002',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'dame_user',    "foto_url" => 'default.jpg'],
            ["id" => '217',    "email" => 'prisma.puspita@bps.go.id',    "nama_lengkap" => 'Prima Puspita Indramurti',    "nip" => '',    "bidang" => 'Bagian Umum',    "username" => 'prima',    "foto_url" => 'default.jpg'],
            ["id" => '218',    "email" => 'pika@bps.go.id',    "nama_lengkap" => 'Priska Harto Lolowang',    "nip" => '198211262011011007',    "bidang" => 'Bagian Umum',    "username" => 'priska',    "foto_url" => 'default.jpg'],
            ["id" => '219',    "email" => 'uyun@bps.go.id',    "nama_lengkap" => 'Uyun Rahmawati',    "nip" => '198502132011012017',    "bidang" => 'Bagian Umum',    "username" => 'uyun',    "foto_url" => 'default.jpg'],
            ["id" => '220',    "email" => 'mentarandy@bps.go.id',    "nama_lengkap" => 'Randy Pratama Lumenta',    "nip" => '198911102012111001',    "bidang" => '',    "username" => 'randy',    "foto_url" => 'default.jpg'],
            ["id" => '234',    "email" => 'windhawijaya@bps.go.id',    "nama_lengkap" => 'Windha Wijaya, SST',    "nip" => '199008012014102001',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'windha',    "foto_url" => 'default.jpg'],
            ["id" => '235',    "email" => 'mohsam@bps.go.id',    "nama_lengkap" => 'Mohamad Samsodin',    "nip" => '198305082006021001',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'mohsam',    "foto_url" => 'default.jpg'],
            ["id" => '236',    "email" => 'sumbodo@bps.go.id',    "nama_lengkap" => 'Sumbodo Aji Cahyono, S.Si, MA',    "nip" => '197703081999011001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'sumbodo',    "foto_url" => 'default.jpg'],
            ["id" => '237',    "email" => 'ipds7100@bps.go.id',    "nama_lengkap" => 'Administrator',    "nip" => '240171000000000000',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'admin',    "foto_url" => 'default.jpg'],
            ["id" => '238',    "email" => 'radjid@bps.go.id',    "nama_lengkap" => 'Radjid Dwi Iskandar A.Md',    "nip" => '198504112011011009',    "bidang" => 'Bagian Umum',    "username" => 'radjid',    "foto_url" => 'default.jpg'],
            ["id" => '239',    "email" => 'yajaivka@bps.go.id',    "nama_lengkap" => 'Yanti Jane Ivonne Kaeng',    "nip" => '198201202008012012',    "bidang" => 'Bagian Umum',    "username" => 'spk1',    "foto_url" => 'default.jpg'],
            ["id" => '241',    "email" => 'ridwanst@bps.go.id',    "nama_lengkap" => 'Ridwan Setiawan S.Tr.Stat.',    "nip" => '199604202019011002',    "bidang" => 'Bagian Umum',    "username" => 'Ridwan',    "foto_url" => 'Ridwan.jpg'],
            ["id" => '242',    "email" => 'karni.hamdani@bps.go.id',    "nama_lengkap" => 'Karni Hamdani S.Si.',    "nip" => '199401312019032001',    "bidang" => 'Bagian Umum',    "username" => 'karni',    "foto_url" => 'default.jpg'],
            ["id" => '243',    "email" => 'niar@bps.go.id',    "nama_lengkap" => 'Rosniar Eliana SST., M.Stat.',    "nip" => '198601202009022008',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'niar',    "foto_url" => 'default.jpg'],
            ["id" => '244',    "email" => 'danty.fatima@bps.go.id',    "nama_lengkap" => 'Danty Welmin Yoshida Fatima S.Tr.Stat.', "nip" => '199711032021042001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'danty123',    "foto_url" => 'default.jpg'],
            ["id" => '245',    "email" => 'inkemargareth@bps.go.id',    "nama_lengkap" => 'Inke Margareth Tambeo',    "nip" => '198403232007012003',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'inke',    "foto_url" => 'default.jpg'],
            ["id" => '246',    "email" => 'nurfadhila@bps.go.id',    "nama_lengkap" => 'Nurfadhila Fahmi',    "nip" => '199510092019032002',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'dhila',    "foto_url" => 'default.jpg'],
            ["id" => '247',    "email" => 'xsiswahto@bps.go.id',    "nama_lengkap" => 'Eko Siswahto SST, M.SE',    "nip" => '198504202008011003',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'xsiswahto',    "foto_url" => 'default.jpg'],
            ["id" => '249',    "email" => 'asim@bps.go.id',    "nama_lengkap" => 'Asim Saputra, SST, M.Ec.Dev.',    "nip" => '197609271999011001',    "bidang" => 'Kepala BPS Provinsi',    "username" => 'asim',    "foto_url" => 'default.jpg'],
            ["id" => '250',    "email" => 'antontw@bps.go.id',    "nama_lengkap" => ' Anton Tri Wijayanto, S.ST, M.Si.',    "nip" => '198001022002121003',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'Anton',    "foto_url" => 'default.jpg'],
            ["id" => '251',    "email" => 'dadan@bps.go.id',    "nama_lengkap" => 'Dadan Sudarmadi, SST, M.Si.',    "nip" => '197310141995121001',    "bidang" => 'Bagian Umum',    "username" => 'dadan',    "foto_url" => 'default.jpg'],
            ["id" => '252',    "email" => 'amakhrus@bps.go.id ',    "nama_lengkap" => 'Abdul Aziz Makhrus, S.Tr.Stat.',    "nip" => '199607082019011003',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'aziz',    "foto_url" => 'default.jpg'],
            ["id" => '253',    "email" => 'dina.atika@bps.go.id',    "nama_lengkap" => 'Dina Atika Rahmawati, SST',    "nip" => '199601152018022001',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'dina',    "foto_url" => 'default.jpg'],
            ["id" => '254',    "email" => 'zulfanr@bps.go.id',    "nama_lengkap" => 'Zulfa Nur Fajri Ramadhani, S.Tr.Stat.',    "nip" => '199701292019012001',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'zulfa',    "foto_url" => 'default.jpg'],
            ["id" => '255',    "email" => 'salonica.oktaviani@bps.go.id ',    "nama_lengkap" => 'Salonica Oktaviani, SST',    "nip" => '199410302018022001',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'salonica',    "foto_url" => 'default.jpg'],
            ["id" => '256',    "email" => 'leonardo.pratama@bps.go.id',    "nama_lengkap" => 'Christian Leonardo Pratama Tamboto, S.Tr.Stat.',    "nip" => '199708072019121001',    "bidang" => 'Bagian Umum',    "username" => 'christian',    "foto_url" => 'default.jpg'],
            ["id" => '257',    "email" => 'untarirahma@bps.go.id',    "nama_lengkap" => 'Untari Rahmawati, S.Tr.Stat.',    "nip" => '199603312019012001',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'Untari',    "foto_url" => 'default.jpg'],
            ["id" => '258',    "email" => 'in.pande@bps.go.id',    "nama_lengkap" => 'I Nyoman Pande Suputra, SST',    "nip" => '199504272018021002',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'Pande',    "foto_url" => 'default.jpg'],
            ["id" => '259',    "email" => 'nabella.intan@bps.go.id',    "nama_lengkap" => 'Nabella Intan Karasta, S.Tr.Stat',    "nip" => '196808281994012001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'nabella',    "foto_url" => 'default.jpg'],
            ["id" => '260',    "email" => 'yulius.wendi@bps.go.id',    "nama_lengkap" => 'Yulius Wendi Triandaru SST',    "nip" => '199407252018021001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'Yulius',    "foto_url" => 'default.jpg'],
            ["id" => '261',    "email" => 'nurul.hidayah@bps.go.id',    "nama_lengkap" => 'Nurul Hidayah S.Tr.Stat.',    "nip" => '199704212019012001',    "bidang" => 'Bagian Umum',    "username" => 'ida',    "foto_url" => 'default.jpg'],
            ["id" => '262',    "email" => 'wisnu.triaji@bps.go.id',    "nama_lengkap" => 'Wisnu Triaji, SE',    "nip" => '198702142009021002',    "bidang" => 'Bagian Umum',    "username" => 'wisnu.triaji',    "foto_url" => 'default.jpg'],
            ["id" => '266',    "email" => 'airin@bps.go.id',    "nama_lengkap" => 'Irene Ruth Longkutoy SH',    "nip" => '197403242006042000',    "bidang" => 'Bagian Umum',    "username" => 'irene',    "foto_url" => 'default.jpg'],
            ["id" => '267',    "email" => 'stevenmontolalu@bps.go.id',    "nama_lengkap" => 'Steven Kalvin Montolalu, SE',    "nip" => '197904062003121000',    "bidang" => 'Bagian Umum',    "username" => 'steven',    "foto_url" => 'default.jpg'],
            ["id" => '268',    "email" => 'tenty@bps.go.id',    "nama_lengkap" => 'Lazia Outenty Bimbangnaung',    "nip" => '198110000000000000',    "bidang" => 'Bagian Umum',    "username" => 'lazia',    "foto_url" => 'default.jpg'],
            ["id" => '269',    "email" => 'olfianesilfia pelealu@bps.go.id',    "nama_lengkap" => 'Olfiane Silfia Pelealu, SE',    "nip" => '197310042003122000',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'olfiane',    "foto_url" => 'default.jpg'],
            ["id" => '271',    "email" => 'elriniwuisan@bps.go.id',    "nama_lengkap" => 'Elrini Diane Wuisan, SE',    "nip" => '198210022010032000',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'elrini',    "foto_url" => 'default.jpg'],
            ["id" => '272',    "email" => 'vonny@bps.go.id',    "nama_lengkap" => 'Vonny Joice Lalujan, SE',    "nip" => '196911011992022000',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'vonny',    "foto_url" => 'default.jpg'],
            ["id" => '273',    "email" => 'dading@bps.go.id',    "nama_lengkap" => 'Dading, S.Si.',    "nip" => '199112202019031000',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'dading',    "foto_url" => 'default.jpg'],
            ["id" => '274',    "email" => 'iqbal.muh@bps.go.id',    "nama_lengkap" => 'Muhammad Iqbal, S.Stat.',    "nip" => '199510132019031001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'iqbal1',    "foto_url" => 'default.jpg'],
            ["id" => '275',    "email" => 'ponim@bps.go.id',    "nama_lengkap" => 'Ponimin',    "nip" => '199810132021041000',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'Ponimin',    "foto_url" => 'default.jpg'],
            ["id" => '276',    "email" => 'rifqi.mubarak@bps.go.id',    "nama_lengkap" => 'Muhammad Rifqi Mubarak',    "nip" => '199901052021041000',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'Rifqi',    "foto_url" => 'default.jpg'],
            ["id" => '283',    "email" => 'ririnh@bps.go.id',    "nama_lengkap" => 'Ririn Hidayati S.Si., MPP, MSE',    "nip" => '197311031998032005',    "bidang" => 'Fungsi Distribusi',    "username" => 'ririnh',    "foto_url" => 'default.jpg'],
            ["id" => '284',    "email" => 'rhiniechay@bps.go.id',    "nama_lengkap" => 'Sarjani Harini Martiningsih S.Si',    "nip" => '198803062011012015',    "bidang" => 'Seksi Statistik Pertambangan, Energi dan Konstruksi',    "username" => 'rini123',    "foto_url" => 'default.jpg'],
            ["id" => '287',    "email" => 'mustika.arum@bps.go.id',    "nama_lengkap" => 'Mustika Aridya Arum A.Md.Kb.N.',    "nip" => '200104112022012001',    "bidang" => 'Bagian Tata Usaha',    "username" => 'mustika',    "foto_url" => 'default.jpg'],
            ["id" => '288',    "email" => 'ratriani.wardani@bps.go.id',    "nama_lengkap" => 'Ratriani Retno Wardani S.Tr.Stat.',    "nip" => '199903202022012004',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'ratriani',    "foto_url" => 'default.jpg'],
            ["id" => '289',    "email" => 'daniel.tri@bps.go.id',    "nama_lengkap" => 'Daniel Tri Hemawan SE',    "nip" => '197610102006041003',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis',    "username" => 'daniel_tri',    "foto_url" => 'default.jpg'],
            ["id" => '290',    "email" => 'yola.larinse@bps.go.id',    "nama_lengkap" => 'Yola Christhy Larinse SST',    "nip" => '199211072014122001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'yola',    "foto_url" => 'default.jpg'],
            ["id" => '291',    "email" => 'risky@bps.go.id',    "nama_lengkap" => 'Risky SST',    "nip" => '199405192016021001',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'risky',    "foto_url" => 'default.jpg'],
            ["id" => '292',    "email" => 'zaenuri@bps.go.id',    "nama_lengkap" => 'Zaenuri Putro Utomo',    "nip" => '198101262011011005',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'zaenuri',    "foto_url" => 'default.jpg'],
            ["id" => '293',    "email" => 'herman.tinungki@bps.go.id',    "nama_lengkap" => 'Herman Tinungki SE',    "nip" => '196703311986031002',    "bidang" => 'Bagian Umum',    "username" => 'herman',    "foto_url" => 'default.jpg'],
            ["id" => '294',    "email" => 'nurul.unonongo@bps.go.id',    "nama_lengkap" => 'Nurul Hayati Unonongo SST',    "nip" => '199311112017012002',    "bidang" => 'Bagian Umum',    "username" => 'nurul.unonongo',    "foto_url" => 'default.jpg'],
        ];



        foreach ($users as $user) {
            \App\Models\User::factory()->create([

                'id' => $user['id'],
                'email' => $user['email'],
                'nama_lengkap' => $user['nama_lengkap'],
                'nip' => $user['nip'],
                'bidang' => $user['bidang'],
                'username' => $user['username'],
                'foto_url' => $user['foto_url'],
                'password' => Hash::make("password")

            ]);
            // $this->call(HistoryBarangSeeder::class);
            // $this->call(MasterBarangSeeder::class);
            // $this->call(MasterJabatanSeeder::class);
            // $this->call(MasterRuanganSeeder::class);
            // $this->call(MasterSistemOperasiSeeder::class);
        }
    }
}