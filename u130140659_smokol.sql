-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 16, 2024 at 01:27 AM
-- Server version: 10.11.8-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u130140659_smokol`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `sistem_operasi_id` bigint(20) UNSIGNED NOT NULL DEFAULT 5,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `ruangan_id` bigint(20) UNSIGNED NOT NULL,
  `record_time` datetime NOT NULL DEFAULT current_timestamp(),
  `kondisi` varchar(12) NOT NULL DEFAULT 'Baik',
  `bast_path` varchar(255) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `bast_upload_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `barang_id`, `sistem_operasi_id`, `users_id`, `ruangan_id`, `record_time`, `kondisi`, `bast_path`, `is_approved`, `bast_upload_date`) VALUES
(599, 3, 5, 209, 17, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(601, 5, 5, 190, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(602, 6, 5, 302, 34, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(603, 7, 5, 283, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(604, 8, 5, 250, 37, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(605, 9, 5, 193, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(606, 10, 5, 193, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(607, 11, 5, 209, 17, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(608, 12, 5, 283, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(609, 13, 5, 250, 37, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(610, 14, 5, 194, 19, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(611, 15, 5, 181, 26, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(612, 16, 5, 181, 26, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(613, 17, 5, 283, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(614, 18, 5, 283, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(615, 19, 5, 209, 15, '2024-02-04 23:37:19', 'Rusak Ringan', NULL, NULL, NULL),
(616, 20, 5, 209, 17, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(617, 21, 5, 209, 17, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(618, 22, 5, 194, 19, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(619, 23, 5, 250, 37, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(620, 24, 5, 249, 35, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(621, 25, 5, 209, 15, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(622, 26, 5, 313, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(623, 27, 5, 209, 17, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(624, 28, 5, 194, 19, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(625, 29, 5, 193, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(626, 30, 5, 193, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(627, 31, 5, 190, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(628, 32, 5, 190, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(629, 33, 5, 283, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(630, 34, 5, 250, 37, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(631, 35, 5, 250, 37, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(632, 36, 5, 181, 26, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(633, 37, 5, 262, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(634, 38, 5, 194, 19, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(635, 39, 5, 193, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(636, 40, 5, 193, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(637, 41, 5, 190, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(638, 42, 5, 190, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(639, 43, 5, 283, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(640, 44, 5, 250, 37, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(641, 45, 5, 190, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(642, 46, 5, 250, 37, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(643, 47, 5, 181, 26, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(644, 48, 5, 181, 26, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(645, 49, 5, 181, 26, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(646, 50, 5, 194, 19, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(647, 51, 5, 194, 19, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(648, 52, 5, 190, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(649, 53, 5, 283, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(650, 54, 5, 209, 15, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(651, 55, 5, 209, 15, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(652, 56, 5, 209, 15, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(653, 57, 5, 209, 15, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(654, 58, 5, 313, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(655, 59, 5, 209, 15, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(656, 60, 5, 313, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(657, 61, 5, 313, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(658, 62, 5, 313, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(659, 63, 5, 292, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(660, 64, 5, 292, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(661, 65, 5, 292, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(662, 66, 5, 292, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(663, 67, 5, 292, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(664, 68, 5, 292, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(665, 69, 5, 292, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(666, 70, 5, 292, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(667, 71, 5, 292, 3, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(668, 72, 5, 292, 3, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(669, 73, 5, 292, 3, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(670, 74, 5, 292, 3, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(671, 75, 5, 292, 3, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(672, 76, 5, 292, 3, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(673, 77, 5, 209, 15, '2024-02-04 23:37:19', 'Rusak Ringan', NULL, NULL, NULL),
(674, 78, 5, 292, 3, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(675, 79, 5, 292, 3, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(676, 80, 5, 292, 3, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(677, 81, 5, 209, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(678, 82, 5, 209, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(679, 83, 5, 193, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(680, 84, 5, 283, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(681, 85, 5, 283, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(682, 86, 5, 283, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(683, 87, 5, 250, 37, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(684, 88, 5, 292, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(685, 89, 5, 244, 2, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(686, 90, 5, 288, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(687, 91, 5, 260, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(688, 92, 5, 260, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(689, 93, 5, 180, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(690, 94, 5, 276, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(691, 95, 5, 275, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(692, 96, 5, 181, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(693, 97, 5, 241, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(694, 98, 5, 242, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(695, 99, 5, 5, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(696, 100, 5, 287, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(697, 101, 5, 180, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(698, 102, 5, 262, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(699, 103, 5, 312, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(700, 104, 5, 220, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(701, 105, 5, 294, 17, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(702, 106, 5, 238, 17, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(703, 107, 5, 267, 12, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(704, 108, 5, 261, 17, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(705, 109, 5, 209, 17, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(706, 110, 5, 218, 19, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(707, 111, 5, 300, 19, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(708, 112, 5, 194, 19, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(709, 113, 5, 214, 26, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(710, 114, 5, 178, 26, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(711, 115, 5, 274, 26, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(712, 116, 5, 182, 26, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(713, 117, 5, 303, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(714, 118, 5, 208, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(715, 119, 5, 212, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(716, 120, 5, 193, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(717, 121, 5, 306, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(718, 122, 5, 210, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(719, 123, 5, 197, 30, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(720, 124, 5, 207, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(721, 125, 5, 290, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(722, 126, 5, 198, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(723, 127, 5, 247, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(724, 128, 5, 199, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(725, 129, 5, 190, 28, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(726, 130, 5, 249, 35, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(727, 131, 5, 302, 34, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(728, 132, 5, 311, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(729, 133, 5, 5, 17, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(730, 134, 5, 205, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(731, 135, 5, 234, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(732, 136, 5, 185, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(733, 137, 5, 243, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(734, 138, 5, 283, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(735, 139, 5, 315, 40, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(736, 140, 5, 289, 37, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(737, 141, 5, 191, 37, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(738, 142, 5, 257, 37, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(739, 143, 5, 181, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(740, 144, 5, 5, 17, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(741, 145, 5, 5, 17, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(742, 146, 5, 5, 15, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(743, 147, 5, 5, 17, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(744, 148, 5, 5, 17, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(745, 149, 5, 5, 17, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(746, 150, 5, 5, 17, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(747, 151, 5, 5, 17, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(748, 152, 5, 5, 17, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(749, 153, 5, 5, 17, '2024-02-04 23:37:19', 'Rusak Berat', NULL, NULL, NULL),
(750, 154, 5, 292, 4, '2024-02-04 23:37:19', 'Baik', NULL, NULL, NULL),
(751, 707, 5, 313, 12, '2024-05-08 00:58:39', 'Baik', NULL, NULL, NULL),
(752, 708, 5, 313, 12, '2024-05-08 01:00:09', 'Baik', NULL, NULL, NULL),
(753, 709, 5, 193, 30, '2024-05-14 03:23:39', 'Baik', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintenances`
--

CREATE TABLE `maintenances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sequence_id` int(11) NOT NULL,
  `kode_status` varchar(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_sequences`
--

CREATE TABLE `maintenance_sequences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `keluhan` text DEFAULT NULL,
  `kondisi_final` varchar(255) DEFAULT NULL,
  `catatan_admin` varchar(255) DEFAULT NULL,
  `bukti_rusak_berat` varchar(255) DEFAULT NULL,
  `biaya` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `problem_img_path` varchar(255) DEFAULT NULL,
  `problems` varchar(511) DEFAULT NULL,
  `next_step` varchar(1) DEFAULT NULL,
  `solution` varchar(255) DEFAULT NULL,
  `spek_path` varchar(255) DEFAULT NULL,
  `estimasi_penyelesaian` date DEFAULT NULL,
  `perusahaan_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_barang`
--

CREATE TABLE `master_barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `tipe` varchar(50) NOT NULL DEFAULT ' ',
  `tanggal_peroleh` date DEFAULT NULL,
  `nomor_seri` varchar(50) DEFAULT NULL,
  `nomor_urut_pendaftaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_barang`
--

INSERT INTO `master_barang` (`id`, `jenis`, `merk`, `tipe`, `tanggal_peroleh`, `nomor_seri`, `nomor_urut_pendaftaran`) VALUES
(3, 'P.C Unit', 'ASUS', 'EEETOP2013IUTI-B041C', '2010-06-30', 'E9PTBX003480', 30),
(5, 'P.C Unit', 'ASUS', 'EEETOP2013IUTI-B041C', '2014-12-23', 'E9PTBX003533', 87),
(6, 'P.C Unit', 'ASUS', 'EEETOP2013IUTI-B041C', '2014-12-23', 'E9PTBX003546', 86),
(7, 'P.C Unit', 'ASUS', 'EEETOP2013IUTI-B041C', '2014-12-23', 'E9PTBX003483', 85),
(8, 'P.C Unit', 'ASUS', 'EEETOP2013IUTI-B041C', '2014-12-23', 'E9PTBX003489', 88),
(9, 'P.C Unit', 'DELL', 'Optiplex 3010 DT', '2011-03-21', '4NK2F2S', 64),
(10, 'P.C Unit', 'DELL', 'Optiplex 3020 Micro', '2015-09-01', 'F18ZY42', 95),
(11, 'P.C Unit', 'DELL', 'Optiplex 3020 Micro', '2015-09-01', 'HQ7ZY42', 94),
(12, 'P.C Unit', 'DELL', 'Optiplex 3020 Micro', '2015-09-01', 'CNOU417N-64180-9AJ-MVM', 92),
(13, 'P.C Unit', 'DELL', 'Optiplex 3020 Micro', '2015-09-01', 'NP7ZY42', 93),
(14, 'P.C Unit', 'DELL', 'Optiplex 3040 Micro', '2016-08-12', '1P8N7C2', 108),
(15, 'P.C Unit', 'DELL', 'Optiplex 3040 Micro', '2016-08-12', '1PFK7C2', 107),
(16, 'P.C Unit', 'DELL', 'Optiplex 3040 Micro', '2016-08-12', '229M7C2', 110),
(17, 'P.C Unit', 'DELL', 'Optiplex 3040 Micro', '2016-08-12', '23DH7C2', 103),
(18, 'P.C Unit', 'DELL', 'Optiplex 3040 Micro', '2016-08-12', '1PFQ7C2', 111),
(19, 'P.C Unit', 'DELL', 'Optiplex 3040 Micro', '2016-08-12', '22UP7C2', 109),
(20, 'P.C Unit', 'DELL', 'Optiplex  3010 DT', '2010-06-30', 'BD62G2S', 36),
(21, 'P.C Unit', 'DELL', 'Optiplex  3010 DT', '2013-06-10', '53C2G2S', 78),
(22, 'P.C Unit', 'DELL', 'Optiplex  3010 DT', '2013-06-10', '1P8N7C2', 75),
(23, 'P.C Unit', 'DELL', 'Optiplex  3010 DT', '2013-06-10', '8QKZF25', 83),
(24, 'P.C Unit', 'ASUS', 'EEETOP2013IUTI-B041C', '2014-12-23', '', 91),
(25, 'P.C Unit', 'HP', '', '2008-05-12', '', 20),
(26, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '1CZ83101QB', 138),
(27, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '1CZ83101FJ', 141),
(28, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '1CZ83101DF', 142),
(29, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '1CZ83101MR', 136),
(30, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '1CZ8101QX', 140),
(31, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '1CZ83100Z8', 134),
(32, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '1CZ831010H', 137),
(33, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '1CZ831019H', 135),
(34, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '1CZ83100WK', 139),
(35, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '1CZ831015K', 143),
(36, 'P.C Unit', 'HP', 'PC Rakitan', '2018-12-07', '', 161),
(37, 'P.C Unit', 'LENOVO', 'Lenovo 1,5 AIO', '2018-12-07', 'MP1ARP3T', 160),
(38, 'P.C Unit', 'LENOVO', 'Lenovo 1,5 AIO', '2018-12-07', 'MP1ARM43', 159),
(39, 'P.C Unit', 'LENOVO', 'Lenovo 1,5 AIO', '2018-12-07', 'MP1ARK3P', 155),
(40, 'P.C Unit', 'LENOVO', 'Lenovo 1,5 AIO', '2018-12-07', 'MP1ARP4H', 156),
(41, 'P.C Unit', 'LENOVO', 'Lenovo 1,5 AIO', '2018-12-07', 'MP1AEA4K', 157),
(42, 'P.C Unit', 'LENOVO', 'Lenovo 1,5 AIO', '2018-12-07', 'MP1ARP36', 158),
(43, 'P.C Unit', 'LENOVO', 'Lenovo 1,5 AIO', '2018-12-21', 'MP1ARH3T', 152),
(44, 'P.C Unit', 'LENOVO', 'Lenovo 1,5 AIO', '2018-12-07', 'MP1AEFSR', 154),
(45, 'P.C Unit', 'LENOVO', 'Lenovo 1,5 AIO', '2018-12-21', 'MP1ARP3C', 151),
(46, 'P.C Unit', 'LENOVO', 'Lenovo 1,5 AIO', '2018-12-07', 'MP1ARP3K', 153),
(47, 'P.C Unit', 'LENOVO', 'Lenovo ThinkCentre M710t', '2018-12-11', 'PCOXZFTC', 148),
(48, 'P.C Unit', 'LENOVO', 'Lenovo ThinkCentre M710t', '2018-12-11', 'PCOXZFT4', 149),
(49, 'P.C Unit', 'LENOVO', 'Lenovo ThinkCentre M710t', '2018-12-11', 'PCOXZFT0', 150),
(50, 'P.C Unit', 'LENOVO', 'Lenovo/ThinkCentre M80', '2011-03-21', 'R87EXRD', 61),
(51, 'P.C Unit', 'LENOVO', 'Lenovo/ThinkCentre M80', '2011-03-21', '', 66),
(52, 'P.C Unit', 'LENOVO', 'Lenovo/ThinkCentre M80', '2011-03-21', 'R86ZXPD', 69),
(53, 'P.C Unit', 'LENOVO', 'Lenovo/ThinkCentre M80', '2011-03-21', 'perlu ganti monitor', 65),
(54, 'P.C Unit', 'LENOVO', 'Lenovo/ThinkCentre M80', '2011-03-21', 'R87EVLD', 73),
(55, 'P.C Unit', 'LENOVO', 'Lenovo/ThinkCentre M80', '2011-03-21', '', 67),
(56, 'P.C Unit', 'LENOVO', 'Lenovo/ThinkCentre M80', '2011-03-21', '', 70),
(57, 'P.C Unit', 'LENOVO', 'Lenovo/ThinkCentre M80', '2011-03-21', '', 74),
(58, 'P.C Unit', 'DELL', 'Optiplex  3010 DT', '2011-03-21', '7PKZF2S', 71),
(59, 'P.C Unit', 'DELL', 'Optiplex  3010 DT', '2011-03-21', '95KZF2S', 72),
(60, 'P.C Unit', 'DELL', 'Optiplex  3010 DT', '2013-06-10', '5VB2G2S', 76),
(61, 'P.C Unit', 'DELL', 'Optiplex 3040 Micro', '2016-08-12', '1QFL7C2', 102),
(62, 'P.C Unit', 'DELL', 'Optiplex 3040 Micro', '2016-08-12', '1PLR7C2', 105),
(63, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '', 144),
(64, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '', 145),
(65, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '', 146),
(66, 'P.C Unit', 'HP', 'ProDesk 400 G5 SFF', '2018-11-19', '', 147),
(67, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RLEB', 176),
(68, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18QFKY', 179),
(69, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RFEV', 184),
(70, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18REQ5', 191),
(71, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RHJZ', 174),
(72, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RHKB', 175),
(73, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18JDGG', 177),
(74, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RFL7', 178),
(75, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18JDFO', 180),
(76, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RL6T', 181),
(77, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RME1', 185),
(78, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RME3', 186),
(79, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RHSO', 188),
(80, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RMAP', 189),
(81, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RMN9', 182),
(82, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RMCS', 187),
(83, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18JDES', 193),
(84, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RER9', 183),
(85, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18QFQP', 190),
(86, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RMDW', 194),
(87, 'P.C Unit', 'LENOVO', 'ThinkCentre M720t', '2019-12-09', 'PC18RMCY', 192),
(88, 'PC Workstation', 'HP', 'Z4 G4 Workstation', '2018-12-31', '', 1),
(89, 'Lap Top', 'LENOVO', 'ThinkPad T14 Gen1', '1899-11-29', 'PF-2J7X4G', 184),
(90, 'Note Book', 'ASUS', '', '0000-00-00', 'LAN0CV19N76144C', 84),
(91, 'Lap Top', 'ASUS', 'GL503', '0000-00-00', 'J9NRCX04B30640D', 166),
(92, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN00314201A072N00', 204),
(93, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019CF2N00', 228),
(94, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN00314201A002N00', 229),
(95, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019BB2N00', 230),
(96, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019F32N00', 231),
(97, 'Note Book', 'ASUS', '', '0000-00-00', 'L7NRKD00444030G', 82),
(98, 'Lap Top', 'LENOVO', 'V330', '0000-00-00', 'MP1DWM0V', 163),
(99, 'Lap Top', 'LENOVO', 'V330', '0000-00-00', 'MP1DAQ9R', 172),
(100, 'Lap Top', 'ASUS', 'Vivo Book 442', '0000-00-00', 'J2N0CV08H170088', 180),
(101, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019FE2N00', 201),
(102, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019D22N00', 202),
(103, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019C82N00', 206),
(104, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019C52N00', 219),
(105, 'Note Book', 'ASUS', '', '0000-00-00', 'L9N0CV21N90940E', 85),
(106, 'Lap Top', 'HP', 'Probook 440 G5 [1MJ83AV]', '0000-00-00', '1MJ83AV', 158),
(107, 'Lap Top', 'HP', 'Probook 440 G5 [1MJ83AV]', '0000-00-00', '5CD8327X62', 160),
(108, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019092N00', 205),
(109, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019F82N00', 209),
(110, 'Lap Top', 'LENOVO', 'V330', '0000-00-00', 'MP1DAV2E', 173),
(111, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019EB2N00', 203),
(112, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN00314201A0E2N00', 215),
(113, 'Note Book', 'LENOVO', '', '0000-00-00', 'SNPK23KG4M', 86),
(114, 'Lap Top', 'HP', 'Probook 440 G5 [1MJ83AV]', '0000-00-00', 'SCD8327X60', 159),
(115, 'Lap Top', 'LENOVO', 'ThinkPad T14 Gen1', '0000-00-00', 'PF-2J7TWH', 185),
(116, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN00314201A022N00', 227),
(117, 'Lap Top', 'LENOVO', 'V330', '0000-00-00', 'MP1DWLZD', 164),
(118, 'Lap Top', 'LENOVO', 'V330', '0000-00-00', 'MP1DWLZ4', 174),
(119, 'Lap Top', 'ASUS', 'Vivo Book 442', '0000-00-00', 'J2N0CV08H16208B', 179),
(120, 'Lap Top', 'LENOVO', 'ThinkPad T14 Gen1', '0000-00-00', 'PF-2J7X1E', 183),
(121, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019F22N00', 208),
(122, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019B92N00', 210),
(123, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019DF2N00', 211),
(124, 'Lap Top', 'LENOVO', 'V330', '0000-00-00', 'MP1DWJZC', 162),
(125, 'Lap Top', 'LENOVO', 'V330', '0000-00-00', 'MP1DWK0P', 175),
(126, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019BF2N00', 212),
(127, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019DA2N00', 213),
(128, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019D52N00', 214),
(129, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN00314201A172N00', 222),
(130, 'Lap Top', 'LENOVO', 'ThinkPad T14 Gen1', '0000-00-00', 'PF-2J7S4D', 182),
(131, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019D12N00', 207),
(132, 'Note Book', 'HP', 'Business Notebook 348 G4', '0000-00-00', '5CG8482RJL', 80),
(133, 'Lap Top', 'HP', 'Probook 440 G5 [1MJ83AV]', '0000-00-00', '5CD8327X6C', 156),
(134, 'Lap Top', 'LENOVO', 'V330', '0000-00-00', 'MP1DWM0B', 161),
(135, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019DC2N00', 216),
(136, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019C12N00', 217),
(137, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019F72N00', 218),
(138, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN00314201A122N00', 220),
(139, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019E22N00', 225),
(140, 'Lap Top', 'HP', 'Probook 440 G5 [1MJ83AV]', '0000-00-00', '5CD8327X91', 154),
(141, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019D82N00', 223),
(142, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN00314201A0A2N00', 224),
(143, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN003142019E32N00', 226),
(144, 'Note Book', 'HP', 'Business Notebook 348 G4', '0000-00-00', '5CG8482RJ4', 81),
(145, 'Note Book', 'ASUS', '', '0000-00-00', 'L9N0CV21N92540C', 83),
(146, 'Lap Top', 'LENOVO', 'ThinkPad T 420', '0000-00-00', '', 141),
(147, 'Lap Top', 'HP', 'Probook 440 G5 [1MJ83AV]', '0000-00-00', '5CD8327X7X', 155),
(148, 'Lap Top', 'LENOVO', 'V330', '0000-00-00', 'MP1DWLMZ', 165),
(149, 'Lap Top', 'LENOVO', 'V330', '0000-00-00', 'MP1DWKKW', 167),
(150, 'Lap Top', 'LENOVO', 'V330', '0000-00-00', 'MP1DWJZ5', 169),
(151, 'Lap Top', 'LENOVO', 'V330', '0000-00-00', 'MP1DWLN7', 171),
(152, 'Lap Top', 'ASUS', 'Zenbook 3', '0000-00-00', 'J5NOCYKKR00L229', 177),
(153, 'Lap Top', 'ASUS', 'Vivo Book 442', '0000-00-00', 'J2N0CV08H163089', 178),
(154, 'Lap Top', 'ACER', 'TMP414RN-51', '0000-00-00', 'NXVP4SN00314201A102N00', 221),
(707, 'P.C Unit', '-', '-', '2011-03-21', '7PKZF2S', 52),
(708, 'P.C Unit', '-', '-', '2011-03-21', '95KZF2S', 54),
(709, 'P.C Unit', 'ASUS', 'EEETOP2013IUTI-B041C', '2014-12-23', 'E9PT8X003548', 90);

-- --------------------------------------------------------

--
-- Table structure for table `master_jabatan`
--

CREATE TABLE `master_jabatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(40) NOT NULL,
  `tingkat` varchar(15) NOT NULL,
  `jenis` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_jabatan`
--

INSERT INTO `master_jabatan` (`id`, `nama`, `tingkat`, `jenis`, `created_at`, `updated_at`) VALUES
(1, 'Kepala Badan Pusat Statistik Provinsi', 'Eselon II', 'Struktural', NULL, NULL),
(2, 'Kepala Bagian Umum', 'Eselon III', 'Struktural', NULL, NULL),
(3, 'Pranata Komputer', 'Ahli Pertama', 'Fungsional', NULL, NULL),
(4, 'Pranata Komputer', 'Ahli Muda', 'Fungsional', NULL, NULL),
(5, 'Statistisi', 'Ahli Pertama', 'Fungsional', NULL, NULL),
(6, 'Statistisi', 'Ahli Muda', 'Fungsional', NULL, NULL),
(7, 'Statistisi', 'Ahli Madya', 'Fungsional', NULL, NULL),
(8, 'Pranata Komputer', 'Ahli Madya', 'Fungsional', NULL, NULL),
(9, 'Arsiparis', 'Ahli Muda', 'Fungsional', NULL, NULL),
(10, 'Pelaksana', '-', 'Pelaksana', NULL, NULL),
(11, 'Statistisi', 'Terampil', 'Fungsional', '2024-04-26 01:58:08', '2024-04-26 01:58:08'),
(12, 'Analis Kepegawaian', 'Ahli Pertama', 'Fungsional', '2024-04-26 02:07:57', '2024-04-26 02:07:57'),
(13, 'Pranata Keuangan APBN', 'Terampil', 'Fungsional', '2024-04-26 02:23:40', '2024-04-26 02:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `master_perusahaan`
--

CREATE TABLE `master_perusahaan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `npwp` varchar(31) NOT NULL,
  `nomor_rekening` varchar(63) NOT NULL,
  `penanggung_jawab_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_pj_perusahaan`
--

CREATE TABLE `master_pj_perusahaan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `perusahaan_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `nomor_wa` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_ruangan`
--

CREATE TABLE `master_ruangan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL DEFAULT 5,
  `kode_baru` varchar(3) DEFAULT NULL,
  `gedung` varchar(2) DEFAULT NULL,
  `kode_siman` varchar(3) DEFAULT NULL,
  `lantai` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_ruangan`
--

INSERT INTO `master_ruangan` (`id`, `nama`, `users_id`, `kode_baru`, `gedung`, `kode_siman`, `lantai`) VALUES
(1, 'Ruang Umum 2', 209, '201', '2', '1', '2'),
(2, 'Ruang Humas dan RB', 244, '202', '2', '2', '2'),
(3, 'Ruang Pengolahan', 292, '303', '3', '3', '3'),
(4, 'Ruang SKF IPDS', 292, '302', '3', '2', '3'),
(5, 'Ruang KF IPDS', 292, '301', '3', '1', '3'),
(6, 'Ruang Brandkas', 5, '310', '3', '10', '2'),
(10, 'Ruang Kabag Umum', 220, '306', '3', '6', '3'),
(11, 'Ruang Rapat Umum', 220, '305', '3', '5', '3'),
(12, 'Ruang Umum 3', 220, '304', '3', '4', '3'),
(13, 'Ruang Mako', 209, '312', '3', '12', '3'),
(14, 'Ruang Aula', 209, '311', '3', '11', ''),
(15, 'Ruang Gudang RB', 5, '408', '4', '8', '1'),
(16, 'Ruang Persediaan', 5, '402', '4', '2', ''),
(17, 'Ruang Umum 1', 209, '401', '4', '1', ''),
(18, 'Ruang Gudang', 209, '403', '4', '3', ''),
(19, 'Ruang SKF Kepegawaian', 194, '404', '4', '4', '4'),
(21, 'Ruang Arsip', 238, '406', '4', '6', ''),
(22, 'Ruang Musholla', 209, '405', '4', '5', ''),
(23, 'Lantai Dasar', 5, '620', '6', '20', '1'),
(24, 'Ruang Laktasi', 209, '619', '6', '19', ''),
(25, 'Loby Lantai 1', 209, '602', '6', '2', '6'),
(26, 'Ruang PST', 182, '601', '6', '1', '6'),
(27, 'Ruang tunggu lantai 2', 5, '607', '6', '7', '2'),
(28, 'Ruang Produksi', 190, '606', '6', '6', '6'),
(30, 'Ruang Statistik Sosial', 193, '604', '6', '4', ''),
(32, 'Ruang Tunggu Lantai 3', 5, '617', '6', '17', '3'),
(33, 'Ruang Vicon', 209, '611', '6', '11', ''),
(34, 'Ruang Sekretaris', 249, '610', '6', '10', ''),
(35, 'Ruang Kepala', 249, '609', '6', '9', ''),
(36, 'Ruang tunggu lantai 4', 5, '616', '6', '16', '4'),
(37, 'Ruang Statistik Nerwilis', 250, '615', '6', '15', '6'),
(40, 'Ruang Statistik Distribusi', 283, '613', '6', '13', '6'),
(41, 'Ruang Mesin Lift', 5, '618', '6', '18', '5');

-- --------------------------------------------------------

--
-- Table structure for table `master_sistem_operasi`
--

CREATE TABLE `master_sistem_operasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `arsitektur` varchar(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_sistem_operasi`
--

INSERT INTO `master_sistem_operasi` (`id`, `nama`, `arsitektur`, `created_at`, `updated_at`) VALUES
(1, 'Linux OS', 'x64', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(2, 'Linux OS', 'x86', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(3, 'Windows 7', 'x64', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(4, 'Windows 7', 'x86', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(5, 'Windows 10', 'x64', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(6, 'Windows 10', 'x86', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(7, 'Windows 11', 'x64', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(8, 'Windows XP', 'x64', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(9, 'Windows XP', 'x86', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(10, 'Windows Server 2016', 'x64', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(11, 'Windows 11', 'x86', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(12, 'Non OS', '-', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(13, 'Android', 'ARM86', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(14, 'Windows 8', 'x64', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(15, 'Windows 8', 'x86', '2024-02-01 16:42:11', '2024-02-01 16:42:11'),
(16, 'Android', 'ARM64', '2024-02-01 16:42:11', '2024-02-01 16:42:11');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_06_12_131528_create_table_master_jabatan', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_06_12_123009_create_master_sistem_operasi_table', 1),
(7, '2023_06_12_132623_create_master_ruangans_table', 1),
(8, '2023_06_12_133806_create_master_barangs_table', 1),
(9, '2023_06_12_133816_create_barangs_table', 1),
(10, '2023_06_27_060933_create_maintenances_table', 2),
(11, '2023_06_27_061734_create_maintenance_sequences_table', 2),
(12, '2023_07_08_060548_create_riwayat_barangs_table', 2),
(13, '2023_07_10_022349_create_barang_view', 2),
(14, '2023_07_28_031356_create_bast_table', 2),
(15, '2024_01_08_115948_add_nup_master_barang', 2),
(16, '2024_01_14_120831_update_maintenances_table', 2),
(17, '2024_01_17_032655_update_maintenance_sequences_table', 2),
(18, '2024_01_21_233928_update_maintenance_sequences_table', 2),
(19, '2024_01_22_033102_update_riwayat_barang_table', 2),
(20, '2024_01_23_005517_update_riwayat_barang_table', 2),
(21, '2024_01_24_035114_create_master_perusahaan_table', 2),
(22, '2024_01_24_035744_update_main_seq_table', 2),
(23, '2024_01_24_064603_update_master_perusahaan_table', 2),
(24, '2024_01_24_070952_create_master_pj_perusahaan_table', 2),
(25, '2024_01_26_055200_create_kondisi_final_table', 2),
(26, '2024_01_29_025528_update_master_ruangan_table', 2),
(27, '2024_01_30_033810_update_barang_table', 2),
(28, '2024_02_02_013943_update_ruangan_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_barang`
--

CREATE TABLE `riwayat_barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `original_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`original_data`)),
  `modified_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`modified_data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `riwayat_barang`
--

INSERT INTO `riwayat_barang` (`id`, `barang_id`, `modified_at`, `users_id`, `original_data`, `modified_data`) VALUES
(5, 654, '2024-03-26 01:02:33', 242, '{\"id\":654,\"barang_id\":58,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":654,\"barang_id\":58,\"sistem_operasi_id\":5,\"users_id\":242,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(6, 601, '2024-03-27 01:53:49', 190, '{\"id\":601,\"barang_id\":5,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":601,\"barang_id\":5,\"sistem_operasi_id\":5,\"users_id\":190,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(7, 603, '2024-03-27 02:12:23', 273, '{\"id\":603,\"barang_id\":7,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":603,\"barang_id\":7,\"sistem_operasi_id\":5,\"users_id\":273,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(8, 604, '2024-03-27 02:13:20', 289, '{\"id\":604,\"barang_id\":8,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":604,\"barang_id\":8,\"sistem_operasi_id\":5,\"users_id\":289,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(9, 606, '2024-03-27 02:20:53', 295, '{\"id\":606,\"barang_id\":10,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":606,\"barang_id\":10,\"sistem_operasi_id\":5,\"users_id\":295,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(10, 607, '2024-03-27 02:23:19', 293, '{\"id\":607,\"barang_id\":11,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":607,\"barang_id\":11,\"sistem_operasi_id\":5,\"users_id\":293,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(11, 609, '2024-03-27 02:25:42', 250, '{\"id\":609,\"barang_id\":13,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":609,\"barang_id\":13,\"sistem_operasi_id\":5,\"users_id\":250,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(12, 610, '2024-03-27 02:26:31', 218, '{\"id\":610,\"barang_id\":14,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":610,\"barang_id\":14,\"sistem_operasi_id\":5,\"users_id\":218,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(13, 612, '2024-03-27 02:31:00', 182, '{\"id\":612,\"barang_id\":16,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":612,\"barang_id\":16,\"sistem_operasi_id\":5,\"users_id\":182,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(14, 613, '2024-03-27 02:32:27', 205, '{\"id\":613,\"barang_id\":17,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":613,\"barang_id\":17,\"sistem_operasi_id\":5,\"users_id\":205,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(15, 614, '2024-03-27 02:32:59', 245, '{\"id\":614,\"barang_id\":18,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":614,\"barang_id\":18,\"sistem_operasi_id\":5,\"users_id\":245,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(16, 615, '2024-03-27 02:35:47', 5, '{\"id\":615,\"barang_id\":19,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":615,\"barang_id\":19,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(17, 616, '2024-03-27 02:37:25', 266, '{\"id\":616,\"barang_id\":20,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":616,\"barang_id\":20,\"sistem_operasi_id\":5,\"users_id\":266,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(18, 617, '2024-03-27 03:10:50', 209, '{\"id\":617,\"barang_id\":21,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":617,\"barang_id\":21,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(19, 610, '2024-03-27 03:13:55', 194, '{\"id\":610,\"barang_id\":14,\"sistem_operasi_id\":5,\"users_id\":218,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":610,\"barang_id\":14,\"sistem_operasi_id\":5,\"users_id\":194,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(20, 618, '2024-03-27 03:14:07', 218, '{\"id\":618,\"barang_id\":22,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":618,\"barang_id\":22,\"sistem_operasi_id\":5,\"users_id\":218,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(21, 619, '2024-03-27 03:14:55', 235, '{\"id\":619,\"barang_id\":23,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":619,\"barang_id\":23,\"sistem_operasi_id\":5,\"users_id\":235,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(22, 620, '2024-03-27 03:18:29', 249, '{\"id\":620,\"barang_id\":24,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":2,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":620,\"barang_id\":24,\"sistem_operasi_id\":5,\"users_id\":249,\"ruangan_id\":35,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(23, 621, '2024-03-27 03:21:29', 5, '{\"id\":621,\"barang_id\":25,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":621,\"barang_id\":25,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(24, 622, '2024-03-27 03:25:24', 287, '{\"id\":622,\"barang_id\":26,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":622,\"barang_id\":26,\"sistem_operasi_id\":5,\"users_id\":287,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(25, 623, '2024-03-27 03:28:02', 211, '{\"id\":623,\"barang_id\":27,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":623,\"barang_id\":27,\"sistem_operasi_id\":5,\"users_id\":211,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(26, 750, '2024-03-27 03:37:13', 292, '{\"id\":750,\"barang_id\":154,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":750,\"barang_id\":154,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(27, 625, '2024-03-27 03:55:52', 197, '{\"id\":625,\"barang_id\":29,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":625,\"barang_id\":29,\"sistem_operasi_id\":5,\"users_id\":197,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(28, 626, '2024-03-27 03:56:25', 255, '{\"id\":626,\"barang_id\":30,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":626,\"barang_id\":30,\"sistem_operasi_id\":5,\"users_id\":255,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(29, 627, '2024-03-27 03:57:19', 199, '{\"id\":627,\"barang_id\":31,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":627,\"barang_id\":31,\"sistem_operasi_id\":5,\"users_id\":199,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(30, 628, '2024-03-27 03:58:43', 259, '{\"id\":628,\"barang_id\":32,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":628,\"barang_id\":32,\"sistem_operasi_id\":5,\"users_id\":259,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(31, 629, '2024-03-27 03:59:50', 185, '{\"id\":629,\"barang_id\":33,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":629,\"barang_id\":33,\"sistem_operasi_id\":5,\"users_id\":185,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(32, 630, '2024-03-27 04:01:22', 254, '{\"id\":630,\"barang_id\":34,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":630,\"barang_id\":34,\"sistem_operasi_id\":5,\"users_id\":254,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(33, 631, '2024-03-27 04:01:50', 191, '{\"id\":631,\"barang_id\":35,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":631,\"barang_id\":35,\"sistem_operasi_id\":5,\"users_id\":191,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(34, 632, '2024-03-27 04:06:03', 178, '{\"id\":632,\"barang_id\":36,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":632,\"barang_id\":36,\"sistem_operasi_id\":5,\"users_id\":178,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(35, 633, '2024-03-27 05:04:32', 262, '{\"id\":633,\"barang_id\":37,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":633,\"barang_id\":37,\"sistem_operasi_id\":5,\"users_id\":262,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(36, 636, '2024-03-27 05:07:54', 193, '{\"id\":636,\"barang_id\":40,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":636,\"barang_id\":40,\"sistem_operasi_id\":5,\"users_id\":193,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(37, 637, '2024-03-27 05:08:56', 290, '{\"id\":637,\"barang_id\":41,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":637,\"barang_id\":41,\"sistem_operasi_id\":5,\"users_id\":290,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(38, 638, '2024-03-27 05:09:52', 201, '{\"id\":638,\"barang_id\":42,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":638,\"barang_id\":42,\"sistem_operasi_id\":5,\"users_id\":201,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(39, 639, '2024-03-27 05:10:46', 243, '{\"id\":639,\"barang_id\":43,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":639,\"barang_id\":43,\"sistem_operasi_id\":5,\"users_id\":243,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(40, 641, '2024-03-27 05:14:49', 247, '{\"id\":641,\"barang_id\":45,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":641,\"barang_id\":45,\"sistem_operasi_id\":5,\"users_id\":247,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(41, 642, '2024-03-27 05:17:06', 5, '{\"id\":642,\"barang_id\":46,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":642,\"barang_id\":46,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(42, 643, '2024-03-27 05:25:54', 214, '{\"id\":643,\"barang_id\":47,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":643,\"barang_id\":47,\"sistem_operasi_id\":5,\"users_id\":214,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(43, 644, '2024-03-27 05:27:32', 5, '{\"id\":644,\"barang_id\":48,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":644,\"barang_id\":48,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(44, 645, '2024-03-27 05:28:12', 5, '{\"id\":645,\"barang_id\":49,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":645,\"barang_id\":49,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(45, 646, '2024-03-27 05:30:21', 5, '{\"id\":646,\"barang_id\":50,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":646,\"barang_id\":50,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(46, 647, '2024-03-27 05:31:55', 5, '{\"id\":647,\"barang_id\":51,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":647,\"barang_id\":51,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(47, 648, '2024-03-27 05:33:33', 198, '{\"id\":648,\"barang_id\":52,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":648,\"barang_id\":52,\"sistem_operasi_id\":5,\"users_id\":198,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(48, 650, '2024-03-27 05:35:14', 5, '{\"id\":650,\"barang_id\":54,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":650,\"barang_id\":54,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(49, 651, '2024-03-27 05:45:33', 5, '{\"id\":651,\"barang_id\":55,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":651,\"barang_id\":55,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(50, 621, '2024-03-27 05:46:33', 5, '{\"id\":621,\"barang_id\":25,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":621,\"barang_id\":25,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(51, 652, '2024-03-27 05:47:47', 5, '{\"id\":652,\"barang_id\":56,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":652,\"barang_id\":56,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(52, 650, '2024-03-27 05:48:49', 5, '{\"id\":650,\"barang_id\":54,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":650,\"barang_id\":54,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(53, 653, '2024-03-27 05:49:11', 5, '{\"id\":653,\"barang_id\":57,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":653,\"barang_id\":57,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(54, 656, '2024-03-27 05:53:07', 179, '{\"id\":656,\"barang_id\":60,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":656,\"barang_id\":60,\"sistem_operasi_id\":5,\"users_id\":179,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(55, 657, '2024-03-27 05:55:51', 220, '{\"id\":657,\"barang_id\":61,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":657,\"barang_id\":61,\"sistem_operasi_id\":5,\"users_id\":220,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(56, 658, '2024-03-27 06:01:55', 256, '{\"id\":658,\"barang_id\":62,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":658,\"barang_id\":62,\"sistem_operasi_id\":5,\"users_id\":256,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(57, 659, '2024-03-27 06:03:58', 292, '{\"id\":659,\"barang_id\":63,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":659,\"barang_id\":63,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(58, 660, '2024-03-27 06:06:45', 260, '{\"id\":660,\"barang_id\":64,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":660,\"barang_id\":64,\"sistem_operasi_id\":5,\"users_id\":260,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(59, 661, '2024-03-27 06:07:33', 260, '{\"id\":661,\"barang_id\":65,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":661,\"barang_id\":65,\"sistem_operasi_id\":5,\"users_id\":260,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(60, 662, '2024-03-27 06:09:53', 180, '{\"id\":662,\"barang_id\":66,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":662,\"barang_id\":66,\"sistem_operasi_id\":5,\"users_id\":180,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(61, 663, '2024-03-27 06:12:36', 275, '{\"id\":663,\"barang_id\":67,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":663,\"barang_id\":67,\"sistem_operasi_id\":5,\"users_id\":275,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(62, 664, '2024-03-27 06:13:37', 276, '{\"id\":664,\"barang_id\":68,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":664,\"barang_id\":68,\"sistem_operasi_id\":5,\"users_id\":276,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(63, 666, '2024-03-27 08:39:03', 181, '{\"id\":666,\"barang_id\":70,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":666,\"barang_id\":70,\"sistem_operasi_id\":5,\"users_id\":181,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(64, 747, '2024-03-27 08:39:24', 5, '{\"id\":747,\"barang_id\":151,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":747,\"barang_id\":151,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(65, 746, '2024-03-27 08:39:40', 5, '{\"id\":746,\"barang_id\":150,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":746,\"barang_id\":150,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(66, 745, '2024-03-27 08:40:01', 5, '{\"id\":745,\"barang_id\":149,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":745,\"barang_id\":149,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(67, 748, '2024-03-27 08:40:22', 5, '{\"id\":748,\"barang_id\":152,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":748,\"barang_id\":152,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(68, 749, '2024-03-27 08:40:49', 5, '{\"id\":749,\"barang_id\":153,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":749,\"barang_id\":153,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(69, 744, '2024-03-27 08:41:04', 5, '{\"id\":744,\"barang_id\":148,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":744,\"barang_id\":148,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(70, 743, '2024-03-27 08:41:15', 5, '{\"id\":743,\"barang_id\":147,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":743,\"barang_id\":147,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(71, 667, '2024-03-27 08:42:01', 292, '{\"id\":667,\"barang_id\":71,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":667,\"barang_id\":71,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":3,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(72, 740, '2024-03-27 08:43:12', 5, '{\"id\":740,\"barang_id\":144,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":740,\"barang_id\":144,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(73, 741, '2024-03-27 08:43:20', 5, '{\"id\":741,\"barang_id\":145,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":741,\"barang_id\":145,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(74, 668, '2024-03-27 08:50:21', 292, '{\"id\":668,\"barang_id\":72,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":668,\"barang_id\":72,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(75, 668, '2024-03-27 08:50:57', 292, '{\"id\":668,\"barang_id\":72,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":668,\"barang_id\":72,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":3,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(76, 669, '2024-03-27 08:51:21', 292, '{\"id\":669,\"barang_id\":73,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":669,\"barang_id\":73,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":3,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(77, 670, '2024-03-27 08:52:35', 292, '{\"id\":670,\"barang_id\":74,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":670,\"barang_id\":74,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":3,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(78, 671, '2024-03-27 08:53:03', 292, '{\"id\":671,\"barang_id\":75,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":671,\"barang_id\":75,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":3,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(79, 672, '2024-03-27 08:53:33', 292, '{\"id\":672,\"barang_id\":76,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":672,\"barang_id\":76,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":3,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(80, 673, '2024-03-27 09:01:34', 5, '{\"id\":673,\"barang_id\":77,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":673,\"barang_id\":77,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Ringan\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(81, 739, '2024-03-27 09:44:18', 181, '{\"id\":739,\"barang_id\":143,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":739,\"barang_id\":143,\"sistem_operasi_id\":5,\"users_id\":181,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(82, 730, '2024-03-28 00:29:37', 205, '{\"id\":730,\"barang_id\":134,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":730,\"barang_id\":134,\"sistem_operasi_id\":5,\"users_id\":205,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(83, 731, '2024-03-28 00:33:44', 234, '{\"id\":731,\"barang_id\":135,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":731,\"barang_id\":135,\"sistem_operasi_id\":5,\"users_id\":234,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(84, 732, '2024-03-28 00:36:13', 185, '{\"id\":732,\"barang_id\":136,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":732,\"barang_id\":136,\"sistem_operasi_id\":5,\"users_id\":185,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(85, 733, '2024-03-28 00:38:57', 243, '{\"id\":733,\"barang_id\":137,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":733,\"barang_id\":137,\"sistem_operasi_id\":5,\"users_id\":243,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(86, 734, '2024-03-28 00:41:41', 283, '{\"id\":734,\"barang_id\":138,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":734,\"barang_id\":138,\"sistem_operasi_id\":5,\"users_id\":283,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(87, 735, '2024-03-28 00:47:28', 245, '{\"id\":735,\"barang_id\":139,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":735,\"barang_id\":139,\"sistem_operasi_id\":5,\"users_id\":245,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(88, 736, '2024-03-28 00:49:58', 289, '{\"id\":736,\"barang_id\":140,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":736,\"barang_id\":140,\"sistem_operasi_id\":5,\"users_id\":289,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(89, 737, '2024-03-28 00:52:31', 191, '{\"id\":737,\"barang_id\":141,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":737,\"barang_id\":141,\"sistem_operasi_id\":5,\"users_id\":191,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(90, 738, '2024-03-28 01:15:23', 235, '{\"id\":738,\"barang_id\":142,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":738,\"barang_id\":142,\"sistem_operasi_id\":5,\"users_id\":235,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(91, 720, '2024-03-28 01:29:20', 207, '{\"id\":720,\"barang_id\":124,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":720,\"barang_id\":124,\"sistem_operasi_id\":5,\"users_id\":207,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(92, 721, '2024-03-28 01:31:07', 290, '{\"id\":721,\"barang_id\":125,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":721,\"barang_id\":125,\"sistem_operasi_id\":5,\"users_id\":290,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(93, 722, '2024-03-28 01:42:13', 198, '{\"id\":722,\"barang_id\":126,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":722,\"barang_id\":126,\"sistem_operasi_id\":5,\"users_id\":198,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(94, 723, '2024-03-28 01:44:39', 247, '{\"id\":723,\"barang_id\":127,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":723,\"barang_id\":127,\"sistem_operasi_id\":5,\"users_id\":247,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(95, 724, '2024-03-28 01:47:12', 199, '{\"id\":724,\"barang_id\":128,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":724,\"barang_id\":128,\"sistem_operasi_id\":5,\"users_id\":199,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(96, 725, '2024-03-28 01:49:22', 190, '{\"id\":725,\"barang_id\":129,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":725,\"barang_id\":129,\"sistem_operasi_id\":5,\"users_id\":190,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(97, 726, '2024-03-28 02:04:54', 249, '{\"id\":726,\"barang_id\":130,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":35,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":726,\"barang_id\":130,\"sistem_operasi_id\":5,\"users_id\":249,\"ruangan_id\":35,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(98, 712, '2024-03-28 05:49:27', 182, '{\"id\":712,\"barang_id\":116,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":712,\"barang_id\":116,\"sistem_operasi_id\":5,\"users_id\":182,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(99, 710, '2024-03-28 05:50:08', 178, '{\"id\":710,\"barang_id\":114,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":710,\"barang_id\":114,\"sistem_operasi_id\":5,\"users_id\":178,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(100, 714, '2024-03-28 05:52:28', 208, '{\"id\":714,\"barang_id\":118,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":714,\"barang_id\":118,\"sistem_operasi_id\":5,\"users_id\":208,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(101, 715, '2024-03-28 05:53:35', 212, '{\"id\":715,\"barang_id\":119,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":715,\"barang_id\":119,\"sistem_operasi_id\":5,\"users_id\":212,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(102, 716, '2024-03-28 05:54:42', 193, '{\"id\":716,\"barang_id\":120,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":716,\"barang_id\":120,\"sistem_operasi_id\":5,\"users_id\":193,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(103, 718, '2024-03-28 05:57:27', 210, '{\"id\":718,\"barang_id\":122,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":718,\"barang_id\":122,\"sistem_operasi_id\":5,\"users_id\":210,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(104, 719, '2024-03-28 05:58:20', 197, '{\"id\":719,\"barang_id\":123,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":719,\"barang_id\":123,\"sistem_operasi_id\":5,\"users_id\":197,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(105, 700, '2024-03-28 05:59:23', 220, '{\"id\":700,\"barang_id\":104,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":700,\"barang_id\":104,\"sistem_operasi_id\":5,\"users_id\":220,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(106, 701, '2024-03-28 06:01:08', 294, '{\"id\":701,\"barang_id\":105,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":701,\"barang_id\":105,\"sistem_operasi_id\":5,\"users_id\":294,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(107, 702, '2024-03-28 06:02:12', 238, '{\"id\":702,\"barang_id\":106,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":702,\"barang_id\":106,\"sistem_operasi_id\":5,\"users_id\":238,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(108, 703, '2024-03-28 06:03:25', 267, '{\"id\":703,\"barang_id\":107,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":703,\"barang_id\":107,\"sistem_operasi_id\":5,\"users_id\":267,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(109, 704, '2024-03-28 06:04:43', 261, '{\"id\":704,\"barang_id\":108,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":704,\"barang_id\":108,\"sistem_operasi_id\":5,\"users_id\":261,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}');
INSERT INTO `riwayat_barang` (`id`, `barang_id`, `modified_at`, `users_id`, `original_data`, `modified_data`) VALUES
(110, 705, '2024-03-28 06:05:41', 209, '{\"id\":705,\"barang_id\":109,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":705,\"barang_id\":109,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(111, 706, '2024-03-28 06:06:27', 218, '{\"id\":706,\"barang_id\":110,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":706,\"barang_id\":110,\"sistem_operasi_id\":5,\"users_id\":218,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(112, 708, '2024-03-28 06:10:16', 194, '{\"id\":708,\"barang_id\":112,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":708,\"barang_id\":112,\"sistem_operasi_id\":5,\"users_id\":194,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(113, 709, '2024-03-28 06:11:25', 214, '{\"id\":709,\"barang_id\":113,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":709,\"barang_id\":113,\"sistem_operasi_id\":5,\"users_id\":214,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(114, 690, '2024-03-28 06:14:26', 276, '{\"id\":690,\"barang_id\":94,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":690,\"barang_id\":94,\"sistem_operasi_id\":5,\"users_id\":276,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(115, 711, '2024-03-28 06:15:10', 274, '{\"id\":711,\"barang_id\":115,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":711,\"barang_id\":115,\"sistem_operasi_id\":5,\"users_id\":274,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(116, 691, '2024-03-28 06:15:57', 275, '{\"id\":691,\"barang_id\":95,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":691,\"barang_id\":95,\"sistem_operasi_id\":5,\"users_id\":275,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(117, 692, '2024-03-28 06:16:30', 181, '{\"id\":692,\"barang_id\":96,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":692,\"barang_id\":96,\"sistem_operasi_id\":5,\"users_id\":181,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(118, 693, '2024-03-28 06:18:32', 241, '{\"id\":693,\"barang_id\":97,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":693,\"barang_id\":97,\"sistem_operasi_id\":5,\"users_id\":241,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(119, 694, '2024-03-28 06:19:33', 242, '{\"id\":694,\"barang_id\":98,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":694,\"barang_id\":98,\"sistem_operasi_id\":5,\"users_id\":242,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(120, 696, '2024-04-01 05:26:05', 287, '{\"id\":696,\"barang_id\":100,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":696,\"barang_id\":100,\"sistem_operasi_id\":5,\"users_id\":287,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(121, 697, '2024-04-01 05:30:00', 180, '{\"id\":697,\"barang_id\":101,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":10,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":697,\"barang_id\":101,\"sistem_operasi_id\":5,\"users_id\":180,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(122, 698, '2024-04-01 05:40:08', 262, '{\"id\":698,\"barang_id\":102,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":698,\"barang_id\":102,\"sistem_operasi_id\":5,\"users_id\":262,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(123, 674, '2024-04-01 05:41:02', 5, '{\"id\":674,\"barang_id\":78,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":674,\"barang_id\":78,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":3,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(124, 674, '2024-04-01 05:41:37', 292, '{\"id\":674,\"barang_id\":78,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":3,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":674,\"barang_id\":78,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":3,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(125, 675, '2024-04-01 05:41:56', 292, '{\"id\":675,\"barang_id\":79,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":675,\"barang_id\":79,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":3,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(126, 676, '2024-04-01 05:43:04', 292, '{\"id\":676,\"barang_id\":80,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":676,\"barang_id\":80,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":3,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(127, 677, '2024-04-01 05:43:49', 267, '{\"id\":677,\"barang_id\":81,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":677,\"barang_id\":81,\"sistem_operasi_id\":5,\"users_id\":267,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(128, 679, '2024-04-01 05:49:23', 252, '{\"id\":679,\"barang_id\":83,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":679,\"barang_id\":83,\"sistem_operasi_id\":5,\"users_id\":252,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(129, 680, '2024-04-01 06:15:03', 246, '{\"id\":680,\"barang_id\":84,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":680,\"barang_id\":84,\"sistem_operasi_id\":5,\"users_id\":246,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(130, 681, '2024-04-01 06:26:02', 217, '{\"id\":681,\"barang_id\":85,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":681,\"barang_id\":85,\"sistem_operasi_id\":5,\"users_id\":217,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(131, 682, '2024-04-01 06:29:02', 283, '{\"id\":682,\"barang_id\":86,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":682,\"barang_id\":86,\"sistem_operasi_id\":5,\"users_id\":283,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(132, 683, '2024-04-01 06:29:37', 257, '{\"id\":683,\"barang_id\":87,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":683,\"barang_id\":87,\"sistem_operasi_id\":5,\"users_id\":257,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(133, 684, '2024-04-01 06:30:45', 288, '{\"id\":684,\"barang_id\":88,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":684,\"barang_id\":88,\"sistem_operasi_id\":5,\"users_id\":288,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(134, 685, '2024-04-01 06:31:50', 244, '{\"id\":685,\"barang_id\":89,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":2,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":685,\"barang_id\":89,\"sistem_operasi_id\":5,\"users_id\":244,\"ruangan_id\":2,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(135, 686, '2024-04-01 06:33:35', 288, '{\"id\":686,\"barang_id\":90,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":686,\"barang_id\":90,\"sistem_operasi_id\":5,\"users_id\":288,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(136, 687, '2024-04-01 06:33:58', 260, '{\"id\":687,\"barang_id\":91,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":687,\"barang_id\":91,\"sistem_operasi_id\":5,\"users_id\":260,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(137, 688, '2024-04-01 06:34:49', 260, '{\"id\":688,\"barang_id\":92,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":688,\"barang_id\":92,\"sistem_operasi_id\":5,\"users_id\":260,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(138, 689, '2024-04-01 06:35:57', 180, '{\"id\":689,\"barang_id\":93,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":689,\"barang_id\":93,\"sistem_operasi_id\":5,\"users_id\":180,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(139, 742, '2024-04-01 07:12:01', 5, '{\"id\":742,\"barang_id\":146,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":742,\"barang_id\":146,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(140, 729, '2024-04-01 07:17:39', 5, '{\"id\":729,\"barang_id\":133,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":729,\"barang_id\":133,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(141, 599, '2024-04-26 02:01:09', 301, '{\"id\":599,\"barang_id\":3,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":599,\"barang_id\":3,\"sistem_operasi_id\":5,\"users_id\":301,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(142, 602, '2024-04-26 02:01:22', 302, '{\"id\":602,\"barang_id\":6,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":34,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":602,\"barang_id\":6,\"sistem_operasi_id\":5,\"users_id\":302,\"ruangan_id\":34,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(143, 605, '2024-04-26 02:01:41', 303, '{\"id\":605,\"barang_id\":9,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":605,\"barang_id\":9,\"sistem_operasi_id\":5,\"users_id\":303,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(144, 608, '2024-04-26 02:05:19', 304, '{\"id\":608,\"barang_id\":12,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":608,\"barang_id\":12,\"sistem_operasi_id\":5,\"users_id\":304,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(145, 624, '2024-04-26 02:06:15', 300, '{\"id\":624,\"barang_id\":28,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":624,\"barang_id\":28,\"sistem_operasi_id\":5,\"users_id\":300,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(146, 634, '2024-04-26 02:26:00', 305, '{\"id\":634,\"barang_id\":38,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":634,\"barang_id\":38,\"sistem_operasi_id\":5,\"users_id\":305,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(147, 635, '2024-04-26 02:26:18', 306, '{\"id\":635,\"barang_id\":39,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":635,\"barang_id\":39,\"sistem_operasi_id\":5,\"users_id\":306,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(148, 640, '2024-04-26 02:26:33', 307, '{\"id\":640,\"barang_id\":44,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":640,\"barang_id\":44,\"sistem_operasi_id\":5,\"users_id\":307,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(149, 642, '2024-04-26 02:26:47', 308, '{\"id\":642,\"barang_id\":46,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":642,\"barang_id\":46,\"sistem_operasi_id\":5,\"users_id\":308,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(150, 655, '2024-04-26 02:27:55', 309, '{\"id\":655,\"barang_id\":59,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":655,\"barang_id\":59,\"sistem_operasi_id\":5,\"users_id\":309,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(151, 665, '2024-04-26 02:28:10', 299, '{\"id\":665,\"barang_id\":69,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":665,\"barang_id\":69,\"sistem_operasi_id\":5,\"users_id\":299,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(152, 678, '2024-04-26 02:28:24', 310, '{\"id\":678,\"barang_id\":82,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":678,\"barang_id\":82,\"sistem_operasi_id\":5,\"users_id\":310,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(153, 728, '2024-04-26 02:28:44', 311, '{\"id\":728,\"barang_id\":132,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":728,\"barang_id\":132,\"sistem_operasi_id\":5,\"users_id\":311,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(154, 727, '2024-04-26 02:29:01', 302, '{\"id\":727,\"barang_id\":131,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":34,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":727,\"barang_id\":131,\"sistem_operasi_id\":5,\"users_id\":302,\"ruangan_id\":34,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(155, 717, '2024-04-26 02:29:16', 306, '{\"id\":717,\"barang_id\":121,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":717,\"barang_id\":121,\"sistem_operasi_id\":5,\"users_id\":306,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(156, 713, '2024-04-26 02:29:40', 303, '{\"id\":713,\"barang_id\":117,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":713,\"barang_id\":117,\"sistem_operasi_id\":5,\"users_id\":303,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(157, 707, '2024-04-26 02:29:55', 300, '{\"id\":707,\"barang_id\":111,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":707,\"barang_id\":111,\"sistem_operasi_id\":5,\"users_id\":300,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(158, 699, '2024-04-26 02:30:09', 312, '{\"id\":699,\"barang_id\":103,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":699,\"barang_id\":103,\"sistem_operasi_id\":5,\"users_id\":312,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(159, 611, '2024-04-26 05:34:00', 182, '{\"id\":611,\"barang_id\":15,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":611,\"barang_id\":15,\"sistem_operasi_id\":5,\"users_id\":182,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(160, 615, '2024-04-26 05:34:20', 249, '{\"id\":615,\"barang_id\":19,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":615,\"barang_id\":19,\"sistem_operasi_id\":5,\"users_id\":249,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(161, 644, '2024-04-26 05:34:35', 182, '{\"id\":644,\"barang_id\":48,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":644,\"barang_id\":48,\"sistem_operasi_id\":5,\"users_id\":182,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(162, 684, '2024-05-07 02:11:21', 292, '{\"id\":684,\"barang_id\":88,\"sistem_operasi_id\":5,\"users_id\":288,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":684,\"barang_id\":88,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(163, 683, '2024-05-07 02:11:34', 250, '{\"id\":683,\"barang_id\":87,\"sistem_operasi_id\":5,\"users_id\":257,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":683,\"barang_id\":87,\"sistem_operasi_id\":5,\"users_id\":250,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(164, 681, '2024-05-07 02:12:03', 283, '{\"id\":681,\"barang_id\":85,\"sistem_operasi_id\":5,\"users_id\":217,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":681,\"barang_id\":85,\"sistem_operasi_id\":5,\"users_id\":283,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(165, 680, '2024-05-07 02:12:13', 283, '{\"id\":680,\"barang_id\":84,\"sistem_operasi_id\":5,\"users_id\":246,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":680,\"barang_id\":84,\"sistem_operasi_id\":5,\"users_id\":283,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(166, 679, '2024-05-07 02:12:24', 193, '{\"id\":679,\"barang_id\":83,\"sistem_operasi_id\":5,\"users_id\":252,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":679,\"barang_id\":83,\"sistem_operasi_id\":5,\"users_id\":193,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(167, 666, '2024-05-07 02:13:01', 292, '{\"id\":666,\"barang_id\":70,\"sistem_operasi_id\":5,\"users_id\":181,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":666,\"barang_id\":70,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(168, 665, '2024-05-07 02:13:08', 292, '{\"id\":665,\"barang_id\":69,\"sistem_operasi_id\":5,\"users_id\":299,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":665,\"barang_id\":69,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(169, 664, '2024-05-07 02:13:19', 292, '{\"id\":664,\"barang_id\":68,\"sistem_operasi_id\":5,\"users_id\":276,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":664,\"barang_id\":68,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(170, 663, '2024-05-07 02:14:27', 292, '{\"id\":663,\"barang_id\":67,\"sistem_operasi_id\":5,\"users_id\":275,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":663,\"barang_id\":67,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(171, 599, '2024-05-07 02:14:47', 209, '{\"id\":599,\"barang_id\":3,\"sistem_operasi_id\":5,\"users_id\":301,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":599,\"barang_id\":3,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(172, 660, '2024-05-07 02:15:47', 292, '{\"id\":660,\"barang_id\":64,\"sistem_operasi_id\":5,\"users_id\":260,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":660,\"barang_id\":64,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(173, 661, '2024-05-07 02:15:54', 292, '{\"id\":661,\"barang_id\":65,\"sistem_operasi_id\":5,\"users_id\":260,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":661,\"barang_id\":65,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(174, 662, '2024-05-07 02:15:58', 292, '{\"id\":662,\"barang_id\":66,\"sistem_operasi_id\":5,\"users_id\":180,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":662,\"barang_id\":66,\"sistem_operasi_id\":5,\"users_id\":292,\"ruangan_id\":4,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(175, 603, '2024-05-07 02:16:09', 283, '{\"id\":603,\"barang_id\":7,\"sistem_operasi_id\":5,\"users_id\":273,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":603,\"barang_id\":7,\"sistem_operasi_id\":5,\"users_id\":283,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(176, 604, '2024-05-07 02:16:38', 250, '{\"id\":604,\"barang_id\":8,\"sistem_operasi_id\":5,\"users_id\":289,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":604,\"barang_id\":8,\"sistem_operasi_id\":5,\"users_id\":250,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(177, 645, '2024-05-07 02:17:37', 181, '{\"id\":645,\"barang_id\":49,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":645,\"barang_id\":49,\"sistem_operasi_id\":5,\"users_id\":181,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(178, 605, '2024-05-07 02:17:40', 193, '{\"id\":605,\"barang_id\":9,\"sistem_operasi_id\":5,\"users_id\":303,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":605,\"barang_id\":9,\"sistem_operasi_id\":5,\"users_id\":193,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(179, 644, '2024-05-07 02:17:44', 181, '{\"id\":644,\"barang_id\":48,\"sistem_operasi_id\":5,\"users_id\":182,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":644,\"barang_id\":48,\"sistem_operasi_id\":5,\"users_id\":181,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(180, 643, '2024-05-07 02:17:52', 181, '{\"id\":643,\"barang_id\":47,\"sistem_operasi_id\":5,\"users_id\":214,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":643,\"barang_id\":47,\"sistem_operasi_id\":5,\"users_id\":181,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(181, 646, '2024-05-07 02:18:02', 194, '{\"id\":646,\"barang_id\":50,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":646,\"barang_id\":50,\"sistem_operasi_id\":5,\"users_id\":194,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(182, 647, '2024-05-07 02:18:11', 194, '{\"id\":647,\"barang_id\":51,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":647,\"barang_id\":51,\"sistem_operasi_id\":5,\"users_id\":194,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(183, 606, '2024-05-07 02:20:09', 193, '{\"id\":606,\"barang_id\":10,\"sistem_operasi_id\":5,\"users_id\":295,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":606,\"barang_id\":10,\"sistem_operasi_id\":5,\"users_id\":193,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(184, 607, '2024-05-07 02:20:38', 209, '{\"id\":607,\"barang_id\":11,\"sistem_operasi_id\":5,\"users_id\":293,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":607,\"barang_id\":11,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(185, 648, '2024-05-07 02:20:48', 190, '{\"id\":648,\"barang_id\":52,\"sistem_operasi_id\":5,\"users_id\":198,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":648,\"barang_id\":52,\"sistem_operasi_id\":5,\"users_id\":190,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(186, 649, '2024-05-07 02:21:13', 283, '{\"id\":649,\"barang_id\":53,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":649,\"barang_id\":53,\"sistem_operasi_id\":5,\"users_id\":283,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(187, 608, '2024-05-07 02:21:20', 283, '{\"id\":608,\"barang_id\":12,\"sistem_operasi_id\":5,\"users_id\":304,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":608,\"barang_id\":12,\"sistem_operasi_id\":5,\"users_id\":283,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(188, 642, '2024-05-07 02:21:46', 250, '{\"id\":642,\"barang_id\":46,\"sistem_operasi_id\":5,\"users_id\":308,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":642,\"barang_id\":46,\"sistem_operasi_id\":5,\"users_id\":250,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(189, 640, '2024-05-07 02:22:02', 250, '{\"id\":640,\"barang_id\":44,\"sistem_operasi_id\":5,\"users_id\":307,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":640,\"barang_id\":44,\"sistem_operasi_id\":5,\"users_id\":250,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(190, 611, '2024-05-07 02:22:22', 181, '{\"id\":611,\"barang_id\":15,\"sistem_operasi_id\":5,\"users_id\":182,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":611,\"barang_id\":15,\"sistem_operasi_id\":5,\"users_id\":181,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(191, 641, '2024-05-07 02:23:15', 190, '{\"id\":641,\"barang_id\":45,\"sistem_operasi_id\":5,\"users_id\":247,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":641,\"barang_id\":45,\"sistem_operasi_id\":5,\"users_id\":190,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(192, 612, '2024-05-07 02:23:18', 181, '{\"id\":612,\"barang_id\":16,\"sistem_operasi_id\":5,\"users_id\":182,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":612,\"barang_id\":16,\"sistem_operasi_id\":5,\"users_id\":181,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(193, 613, '2024-05-07 02:24:26', 283, '{\"id\":613,\"barang_id\":17,\"sistem_operasi_id\":5,\"users_id\":205,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":613,\"barang_id\":17,\"sistem_operasi_id\":5,\"users_id\":283,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(194, 614, '2024-05-07 02:24:57', 283, '{\"id\":614,\"barang_id\":18,\"sistem_operasi_id\":5,\"users_id\":245,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":614,\"barang_id\":18,\"sistem_operasi_id\":5,\"users_id\":283,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(195, 615, '2024-05-07 02:26:34', 209, '{\"id\":615,\"barang_id\":19,\"sistem_operasi_id\":5,\"users_id\":249,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":615,\"barang_id\":19,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Ringan\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(196, 616, '2024-05-07 02:26:58', 209, '{\"id\":616,\"barang_id\":20,\"sistem_operasi_id\":5,\"users_id\":266,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":616,\"barang_id\":20,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(197, 630, '2024-05-07 02:27:32', 250, '{\"id\":630,\"barang_id\":34,\"sistem_operasi_id\":5,\"users_id\":254,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":630,\"barang_id\":34,\"sistem_operasi_id\":5,\"users_id\":250,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(198, 618, '2024-05-07 02:27:35', 194, '{\"id\":618,\"barang_id\":22,\"sistem_operasi_id\":5,\"users_id\":218,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":618,\"barang_id\":22,\"sistem_operasi_id\":5,\"users_id\":194,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(199, 631, '2024-05-07 02:27:37', 250, '{\"id\":631,\"barang_id\":35,\"sistem_operasi_id\":5,\"users_id\":191,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":631,\"barang_id\":35,\"sistem_operasi_id\":5,\"users_id\":250,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(200, 632, '2024-05-07 02:27:45', 181, '{\"id\":632,\"barang_id\":36,\"sistem_operasi_id\":5,\"users_id\":178,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":632,\"barang_id\":36,\"sistem_operasi_id\":5,\"users_id\":181,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(201, 634, '2024-05-07 02:27:54', 194, '{\"id\":634,\"barang_id\":38,\"sistem_operasi_id\":5,\"users_id\":305,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":634,\"barang_id\":38,\"sistem_operasi_id\":5,\"users_id\":194,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(202, 619, '2024-05-07 02:28:32', 250, '{\"id\":619,\"barang_id\":23,\"sistem_operasi_id\":5,\"users_id\":235,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":619,\"barang_id\":23,\"sistem_operasi_id\":5,\"users_id\":250,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(203, 635, '2024-05-07 02:28:47', 193, '{\"id\":635,\"barang_id\":39,\"sistem_operasi_id\":5,\"users_id\":306,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":635,\"barang_id\":39,\"sistem_operasi_id\":5,\"users_id\":193,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(204, 637, '2024-05-07 02:29:04', 190, '{\"id\":637,\"barang_id\":41,\"sistem_operasi_id\":5,\"users_id\":290,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":637,\"barang_id\":41,\"sistem_operasi_id\":5,\"users_id\":190,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(205, 621, '2024-05-07 02:29:06', 209, '{\"id\":621,\"barang_id\":25,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":621,\"barang_id\":25,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(206, 638, '2024-05-07 02:29:12', 190, '{\"id\":638,\"barang_id\":42,\"sistem_operasi_id\":5,\"users_id\":201,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":638,\"barang_id\":42,\"sistem_operasi_id\":5,\"users_id\":190,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(207, 639, '2024-05-07 02:29:41', 283, '{\"id\":639,\"barang_id\":43,\"sistem_operasi_id\":5,\"users_id\":243,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":639,\"barang_id\":43,\"sistem_operasi_id\":5,\"users_id\":283,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(208, 623, '2024-05-07 02:30:06', 209, '{\"id\":623,\"barang_id\":27,\"sistem_operasi_id\":5,\"users_id\":211,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":623,\"barang_id\":27,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(209, 624, '2024-05-07 02:30:23', 194, '{\"id\":624,\"barang_id\":28,\"sistem_operasi_id\":5,\"users_id\":300,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":624,\"barang_id\":28,\"sistem_operasi_id\":5,\"users_id\":194,\"ruangan_id\":19,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(210, 625, '2024-05-07 02:30:42', 193, '{\"id\":625,\"barang_id\":29,\"sistem_operasi_id\":5,\"users_id\":197,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":625,\"barang_id\":29,\"sistem_operasi_id\":5,\"users_id\":193,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(211, 626, '2024-05-07 02:31:03', 193, '{\"id\":626,\"barang_id\":30,\"sistem_operasi_id\":5,\"users_id\":255,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":626,\"barang_id\":30,\"sistem_operasi_id\":5,\"users_id\":193,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(212, 627, '2024-05-07 02:31:27', 190, '{\"id\":627,\"barang_id\":31,\"sistem_operasi_id\":5,\"users_id\":199,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":627,\"barang_id\":31,\"sistem_operasi_id\":5,\"users_id\":190,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(213, 628, '2024-05-07 02:31:41', 190, '{\"id\":628,\"barang_id\":32,\"sistem_operasi_id\":5,\"users_id\":259,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":628,\"barang_id\":32,\"sistem_operasi_id\":5,\"users_id\":190,\"ruangan_id\":28,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(214, 629, '2024-05-07 02:31:59', 283, '{\"id\":629,\"barang_id\":33,\"sistem_operasi_id\":5,\"users_id\":185,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":629,\"barang_id\":33,\"sistem_operasi_id\":5,\"users_id\":283,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}');
INSERT INTO `riwayat_barang` (`id`, `barang_id`, `modified_at`, `users_id`, `original_data`, `modified_data`) VALUES
(215, 655, '2024-05-07 02:34:05', 5, '{\"id\":655,\"barang_id\":59,\"sistem_operasi_id\":5,\"users_id\":309,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":655,\"barang_id\":59,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(216, 655, '2024-05-07 02:34:16', 5, '{\"id\":655,\"barang_id\":59,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":655,\"barang_id\":59,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(217, 622, '2024-05-07 06:41:28', 313, '{\"id\":622,\"barang_id\":26,\"sistem_operasi_id\":5,\"users_id\":287,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":622,\"barang_id\":26,\"sistem_operasi_id\":5,\"users_id\":313,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(218, 650, '2024-05-07 06:42:06', 209, '{\"id\":650,\"barang_id\":54,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":650,\"barang_id\":54,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(219, 651, '2024-05-07 06:42:19', 209, '{\"id\":651,\"barang_id\":55,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":651,\"barang_id\":55,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(220, 652, '2024-05-07 06:42:27', 209, '{\"id\":652,\"barang_id\":56,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":652,\"barang_id\":56,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(221, 653, '2024-05-07 06:42:39', 209, '{\"id\":653,\"barang_id\":57,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":653,\"barang_id\":57,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(222, 654, '2024-05-07 06:43:06', 313, '{\"id\":654,\"barang_id\":58,\"sistem_operasi_id\":5,\"users_id\":242,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":654,\"barang_id\":58,\"sistem_operasi_id\":5,\"users_id\":313,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(223, 655, '2024-05-07 06:43:15', 209, '{\"id\":655,\"barang_id\":59,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":655,\"barang_id\":59,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(224, 656, '2024-05-07 06:43:43', 313, '{\"id\":656,\"barang_id\":60,\"sistem_operasi_id\":5,\"users_id\":179,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":656,\"barang_id\":60,\"sistem_operasi_id\":5,\"users_id\":313,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(225, 657, '2024-05-07 06:44:51', 313, '{\"id\":657,\"barang_id\":61,\"sistem_operasi_id\":5,\"users_id\":220,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":657,\"barang_id\":61,\"sistem_operasi_id\":5,\"users_id\":313,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(226, 658, '2024-05-07 06:45:44', 313, '{\"id\":658,\"barang_id\":62,\"sistem_operasi_id\":5,\"users_id\":256,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":658,\"barang_id\":62,\"sistem_operasi_id\":5,\"users_id\":313,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(227, 673, '2024-05-07 06:46:08', 209, '{\"id\":673,\"barang_id\":77,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Ringan\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":673,\"barang_id\":77,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":15,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Ringan\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(228, 677, '2024-05-07 06:46:41', 209, '{\"id\":677,\"barang_id\":81,\"sistem_operasi_id\":5,\"users_id\":267,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":677,\"barang_id\":81,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(229, 678, '2024-05-07 06:46:50', 209, '{\"id\":678,\"barang_id\":82,\"sistem_operasi_id\":5,\"users_id\":310,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":678,\"barang_id\":82,\"sistem_operasi_id\":5,\"users_id\":209,\"ruangan_id\":12,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(230, 709, '2024-05-08 00:22:49', 214, '{\"id\":709,\"barang_id\":113,\"sistem_operasi_id\":5,\"users_id\":214,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":709,\"barang_id\":113,\"sistem_operasi_id\":5,\"users_id\":214,\"ruangan_id\":26,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(231, 729, '2024-05-08 00:24:04', 5, '{\"id\":729,\"barang_id\":133,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":729,\"barang_id\":133,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Ringan\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(232, 741, '2024-05-08 00:24:35', 5, '{\"id\":741,\"barang_id\":145,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":741,\"barang_id\":145,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Ringan\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(233, 741, '2024-05-08 00:24:49', 5, '{\"id\":741,\"barang_id\":145,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Ringan\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":741,\"barang_id\":145,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(234, 751, '2024-05-08 01:03:00', 313, '{\"id\":751,\"barang_id\":707,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":5,\"record_time\":\"2024-05-08 00:58:39\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":751,\"barang_id\":707,\"sistem_operasi_id\":5,\"users_id\":313,\"ruangan_id\":12,\"record_time\":\"2024-05-08 00:58:39\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(235, 752, '2024-05-08 01:03:15', 313, '{\"id\":752,\"barang_id\":708,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":5,\"record_time\":\"2024-05-08 01:00:09\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":752,\"barang_id\":708,\"sistem_operasi_id\":5,\"users_id\":313,\"ruangan_id\":12,\"record_time\":\"2024-05-08 01:00:09\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(236, 753, '2024-05-14 03:25:20', 296, '{\"id\":753,\"barang_id\":709,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":5,\"record_time\":\"2024-05-14 03:23:39\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":753,\"barang_id\":709,\"sistem_operasi_id\":5,\"users_id\":296,\"ruangan_id\":30,\"record_time\":\"2024-05-14 03:23:39\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(237, 753, '2024-05-14 03:25:31', 193, '{\"id\":753,\"barang_id\":709,\"sistem_operasi_id\":5,\"users_id\":296,\"ruangan_id\":30,\"record_time\":\"2024-05-14 03:23:39\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":753,\"barang_id\":709,\"sistem_operasi_id\":5,\"users_id\":193,\"ruangan_id\":30,\"record_time\":\"2024-05-14 03:23:39\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(238, 729, '2024-05-14 03:41:12', 5, '{\"id\":729,\"barang_id\":133,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Ringan\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":729,\"barang_id\":133,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Berat\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(239, 741, '2024-05-14 03:41:50', 5, '{\"id\":741,\"barang_id\":145,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":741,\"barang_id\":145,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Ringan\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(240, 741, '2024-05-14 03:42:39', 5, '{\"id\":741,\"barang_id\":145,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Rusak Ringan\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":741,\"barang_id\":145,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(241, 738, '2024-07-02 00:41:56', 257, '{\"id\":738,\"barang_id\":142,\"sistem_operasi_id\":5,\"users_id\":235,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":738,\"barang_id\":142,\"sistem_operasi_id\":5,\"users_id\":257,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),
(242, 735, '2024-07-12 07:28:00', 315, '{\"id\":735,\"barang_id\":139,\"sistem_operasi_id\":5,\"users_id\":245,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}', '{\"id\":735,\"barang_id\":139,\"sistem_operasi_id\":5,\"users_id\":315,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `status_pemeliharaan`
--

CREATE TABLE `status_pemeliharaan` (
  `kode_status` varchar(2) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_pemeliharaan`
--

INSERT INTO `status_pemeliharaan` (`kode_status`, `deskripsi`) VALUES
('0', 'Pengajuan telah dibuat'),
('1', 'Disetujui Oleh Tim BMN'),
('10', 'Barang sudah Dikembalikan kepada Pegawai'),
('2', 'Disetujui Oleh Tim IPDS'),
('3', 'Menunggu Barang Diambil Penyedia'),
('4', 'Sedang Diproses pada Penyedia'),
('5', 'Selesai Perbaikan, Barang Sedang Diperiksa oleh Tim IPDS'),
('6', 'Barang telah selesai diperiksa\r\n'),
('99', 'Barang Rusak Berat');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nip` varchar(255) NOT NULL,
  `bidang` varchar(255) NOT NULL,
  `jabatan_id` bigint(20) UNSIGNED NOT NULL DEFAULT 5,
  `role` varchar(255) NOT NULL DEFAULT 'basic',
  `username` varchar(255) NOT NULL,
  `foto_url` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `email`, `nip`, `bidang`, `jabatan_id`, `role`, `username`, `foto_url`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Po', 'ponim@bps.go.id', '199810132021041001', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'Tim IPDS', 'ponimin351', 'ponimin99.png', NULL, '$2y$10$o.NszZQtemnq5Q3wLGrrJuDU88ZYl2r2JAm1FtGp4X.kuYzY.U1CS', NULL, NULL, '2024-02-05 23:42:15'),
(5, 'Bagian Umum', 'umum7100@bps.go.id', '000000000000000000', 'Bagian Umum', 5, 'basic', 'admin_umum', 'default.jpg', NULL, '$2y$10$OoMnoV7hIy1tVbfzGRI4f.aSIdKv23XAavQcW789taf2iV0k/M1bm', NULL, NULL, NULL),
(178, 'Satria June Adwendi SST', 'satria.adwendi@bps.go.id', '199307102016021001', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'awe', 'default.jpg', NULL, '$2y$10$r/qGcXIu8U88Anb6X5Eu6eL6pMnoeQwptEJQZ3BWOH5vYON84/J0K', NULL, NULL, NULL),
(179, 'Mia Wahyumiranti', 'miaw_miranti@bps.go.id', '198304112005022001', 'Bagian Umum', 5, 'basic', 'spk2', 'default.jpg', NULL, '$2y$10$IzUWHTnhi3At2ejTFTHJa.ZwwGc/vRzIV46BrTYj6DlmkcRak9FS2', NULL, NULL, NULL),
(180, 'Tiara Dameani S.ST', 'dame.simamora@bps.go.id', '198802082009122002', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'dame', 'default.jpg', NULL, '$2y$10$KdH36x5.o7dFLdswIKv4Een/S4a1MvH9STyYzQf/EDRrcWQfcfmNq', NULL, NULL, NULL),
(181, 'Hahotan Sagala SST', 'hase@bps.go.id', '198603202009021004', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'hahotan', 'default.jpg', NULL, '$2y$10$IBjH6uvkgrdEFezOFnOcw.H3GD59aA5mCI8Le3X1lh1xbo/axtd.K', NULL, NULL, NULL),
(182, 'Indira Anastasia Lolowang SE', 'indiraira@bps.go.id', '198301252003122001', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'ira', 'default.jpg', NULL, '$2y$10$qcelzpbUN.GWcluNqhIm7eCXznV5Qcq/apQPko9OFa/YLQFXbQNKG', NULL, NULL, NULL),
(185, 'Erna Kusumawati SST', 'ernakusuma@bps.go.id', '198910192012112001', 'Bagian Umum', 5, 'basic', 'erna_kusumawati', 'default.jpg', NULL, '$2y$10$Kr94Sd.hf1Unq/mlBikHaefwnVTmsCoyGqyE09XNiHmH.56Q2ZBdW', NULL, NULL, NULL),
(186, 'Ir. Nuraini Walangadi', 'n.walangadi@bps.go.id', '196511231992122001', 'Bagian Umum', 5, 'basic', 'ani', 'default.jpg', NULL, '$2y$10$h8fK9i.EovKVsUJZ9iXAD.LwOz6uHFeM0z7ME5nRiW0siGa78f.Py', NULL, NULL, NULL),
(187, 'Simon Andreas August Remiasa S.ST', 'simon@bps.go.id', '197710111999121001', 'Bagian Umum', 5, 'basic', 'simon', 'default.jpg', NULL, '$2y$10$A9A.PZmX1CsLqNZ9j.Vmee6mxX4.tZ0T8dI6kqnja/idzUgU2CYbC', NULL, NULL, NULL),
(189, 'Hahotan Sagala SST', 'hase@bps.go.id', '198603202009021004', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'hase', 'default.jpg', NULL, '$2y$10$8X2DWJm30jOQ6ucdx5CW/.y4YbSqO78NJMsHym9OxjfLyfP54Bjve', NULL, NULL, NULL),
(190, 'Norma Olga Frida Regar, S.Si, M.Si', 'norma@bps.go.id', '196611291986032001', 'Fungsi Neraca Wilayah dan Analisis Statistik', 5, 'basic', 'norma', 'default.jpg', NULL, '$2y$10$OibOvEgZNnoy.xPQ7V1MxeS1/oPcNWN/wpCexAGIBkWBngq/45GIK', NULL, NULL, NULL),
(191, 'Ratna Sulistyowati, SST, SAB, M.Si', 'ratnasuli@bps.go.id', '198505262008012001', 'Fungsi Neraca Wilayah dan Analisis Statistik', 5, 'basic', 'ratna', 'default.jpg', NULL, '$2y$10$w2pCAKsFZWmyoE7gruOdWuiVY3f8qDzB6tHnvbpU8eB8jrrypBqoG', NULL, NULL, NULL),
(193, 'Titien Kristiningsih, SST, SE, M.Si', 'titienk@bps.go.id', '198005252002122003', 'Fungsi Statistik Sosial', 5, 'basic', 'titien', 'default.jpg', NULL, '$2y$10$7DRmgvCJXRluLOaTsh046uvu/Mn2PHQwNoyZIXJnk2uKJl.IEDVYi', NULL, NULL, NULL),
(194, 'Sarjani Harini Martiningsih S.Si', 'rhiniechay@bps.go.id', '198803062011012015', 'Fungsi Statistik Sosial', 5, 'basic', 'rhiniechay', 'default.jpg', NULL, '$2y$10$qnvDwgZj6h/uZ5ZlBe6tCeTlAKUzlfm4nRrH2wUU0TA1ogy44ypnm', NULL, NULL, NULL),
(195, 'Enggelin Giacinta Wongkar, SST', 'enggelingiacinta wongkar@bps.go.id', '199212292014122002', 'Fungsi Neraca Wilayah dan Analisis Statistik', 5, 'basic', 'enggelin', 'default.jpg', NULL, '$2y$10$KhqmxuynKo58sSe4Tq1htOZ7vcZA9/p8Ly83nsQd1hvOyq2Z10/Sa', NULL, NULL, NULL),
(196, 'Ayu Puspita Wulandana B, SST', 'wulandanawulandana b@bps.go.id', '199010082014102001', 'Fungsi Neraca Wilayah dan Analisis Statistik', 5, 'basic', 'wulandana', 'default.jpg', NULL, '$2y$10$MbKslvAaXDBhFH5DDCympuCFUfn6zme9gNHNIBwmcwhRBIo.A8DRO', NULL, NULL, NULL),
(197, 'Sirly Catharina Worotikan, SE., M.Si.', 'sirly@bps.go.id', '196808281994012001', 'Fungsi Statistik Produksi', 5, 'basic', 'sirly', 'default.jpg', NULL, '$2y$10$WPTqoPz7IoIGcrZ0iOV4kuJ8WJZ0Jgc5L.FzQiWYDipkR/b8B5KkO', NULL, NULL, NULL),
(198, 'Starry Nouva Solang, M.Si.', 'starrysolang@bps.go.id', '196709181994012001', 'Fungsi Statistik Produksi', 5, 'basic', 'starry', 'default.jpg', NULL, '$2y$10$Xx228KOg/qSOuH/xHeZBVOPTZJ0gJzlzOqkbIu/YJLrY4XLv6L7Wu', NULL, NULL, NULL),
(199, 'Victor Prima Sirait, SST., M.S.E', 'victorps@bps.go.id', '198103282006021001', 'Fungsi Statistik Produksi', 5, 'basic', 'victor', 'default.jpg', NULL, '$2y$10$C6Z2BmLXGawW2gddoRLbbuHHRQaOK3WcY/CosTWvPciRcdvTtB.gu', NULL, NULL, NULL),
(200, 'Oky Irwan Rosadi', 'oky@bps.go.id', '198610032011011011', 'Bagian Umum', 5, 'basic', 'oky', 'default.jpg', NULL, '$2y$10$8lRdoSiiLUNfZoBApCzcweS.yVa806vkTFEHF4r2FMXCHfj8YD7Ra', NULL, NULL, NULL),
(201, 'Mariane Esther Rantung, SST', 'mariane.rantung@bps.go.id', '199408062017012001', 'Fungsi Statistik Produksi', 5, 'basic', 'esther', 'default.jpg', NULL, '$2y$10$TNnGRElS.zPkXGCEY2bUgOVBbE9qYWmqIKf3r7CRaR5ghMwji3ICy', NULL, NULL, NULL),
(202, 'Abdullah Kango', 'akango@bps.go.id', '197407271997121001', 'Fungsi Statistik Distribusi', 5, 'basic', 'akango', 'akango.jpeg', NULL, '$2y$10$m/3qq.0aIaGgzv8rDUhvNeJujnzFgcXUSCbBkMrQsWpbEIpxpEXyu', NULL, NULL, NULL),
(204, 'Elrini D. Wuisan, SE', 'elriniwuisan@bps.go.id', '198210022010032001', 'Fungsi Statistik Distribusi', 5, 'basic', 'elri', 'default.jpg', NULL, '$2y$10$j2avzft3gBeTuSrfPMgKdOlADahyjks4WQeB9qEOMGrgSx5sW0Wi6', NULL, NULL, NULL),
(205, 'Agnes M. Oroh', 'agnes.oroh@bps.go.id', '198208222008012014', 'Fungsi Statistik Distribusi', 5, 'basic', 'agnes', 'default.jpg', NULL, '$2y$10$DH1gFyiW/MYFHlTV.5xTteg1FsMI/Q6YDfEgffsNe0b6i.ncrkjiC', NULL, NULL, NULL),
(206, 'Firra Rastraaktiva Awaliyah S.Si', 'firra@bps.go.id', '198512142010032002', 'Fungsi Statistik Distribusi', 5, 'basic', 'firra', 'default.jpg', NULL, '$2y$10$y5lCZn4bhN9jvEeBwmAxm.atlqVTkWWDH5p6Pk3f.1laVPIShKooG', NULL, NULL, NULL),
(207, 'Limada Iqbal, SST', 'limada iqbal@bps.go.id', '199506222018021002', 'Fungsi Statistik Produksi', 5, 'basic', 'iqbal', 'iqbal.jpg', NULL, '$2y$10$ECbHmuYiDSlKbzaEPN0C/.7wkatmqOiHOsOrQK.G9c2/giytLFFEa', NULL, NULL, NULL),
(208, 'Bregitta Sisilia Lasut SS', 'bregitta.lasut@bps.go.id', '198209182008012012', 'Sosial', 5, 'basic', 'gita', 'default.jpg', NULL, '$2y$10$7nw7eb3dLFkbs2Z2igfGdOGHBLdMDT6xoeInvTr9FRvFw89lP8jni', NULL, NULL, NULL),
(209, 'Junitha Sahureka', 'junitha@bps.go.id', '198606112009022007', 'Bagian Umum', 5, 'Tim BMN', 'uneth', 'default.jpg', NULL, '$2y$10$WbTBrBRN/5KpPfP/S3Fx8ukPkiAgOP4l6AT97lPBhUV4d96RPkw1u', NULL, NULL, '2024-03-20 01:00:17'),
(210, 'Florentz Magdalena', 'fmagdalena@bps.go.id', '199108212014102000', 'Fungsi Statistik Sosial', 5, 'basic', 'florentz', 'default.jpg', NULL, '$2y$10$J4KWQs1RbFyvPgUz/6Dz5e2Wer/P6TuHi6wMxHgRWsBxzFN5IrWXe', NULL, NULL, NULL),
(211, 'Stela Engeline Doris Lomboan', 'stela@bps.go.id', '197209091992092001', 'Bagian Umum', 5, 'basic', 'stela', 'default.jpg', NULL, '$2y$10$2mmlgbGhVbmcxB4aygmNgeoduO4ejT97.9s8fTTinaBvGW0bOufI.', NULL, NULL, NULL),
(212, 'Joice Juliana Koyongian A.Md', 'joice.koyongian@bps.go.id', '198307062011012015', 'Bagian Umum', 5, 'basic', 'juliana', 'default.jpg', NULL, '$2y$10$X7cVoO7RSyznGedAfBI3LuxCeEnvBFr6miVh7aA.8iQbBIEPQpkj2', NULL, NULL, NULL),
(214, 'Frisda Arisanti T', 'frisda@bps.go.id', '198603082006042001', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'frisda', 'default.jpg', NULL, '$2y$10$6y.vCTORK18bw6JjgQGw4OCQ4IA03ZAMYM23XZKkoErKrDb5MOCQ.', NULL, NULL, NULL),
(215, 'Tiara Dameani S.ST', 'dame.simamora@bps.go.id', '198802082009122002', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'dame_user', 'default.jpg', NULL, '$2y$10$1/3bUwS1EEDa5z3y6oXXc.KOn.wU9bMzqHwjUlWbe34Z77mPpbSFi', NULL, NULL, NULL),
(217, 'Prima Puspita Indramurti', 'prisma.puspita@bps.go.id', '', 'Bagian Umum', 5, 'basic', 'prima', 'default.jpg', NULL, '$2y$10$/lQPs/5fS9H0Vc3ufQ3QDu6Dk/Ik4DhumvG/PYSTZSX7tKArrdVxi', NULL, NULL, NULL),
(218, 'Priska Harto Lolowang', 'pika@bps.go.id', '198211262011011007', 'Bagian Umum', 5, 'basic', 'priska', 'default.jpg', NULL, '$2y$10$JOAyZeChBKpq3wURLg9zx.TWt28Q6DBZCYqNhJc9C9SJuTwt/LOCK', NULL, NULL, NULL),
(219, 'Uyun Rahmawati', 'uyun@bps.go.id', '198502132011012017', 'Bagian Umum', 5, 'basic', 'uyun', 'default.jpg', NULL, '$2y$10$acQ8L9qdffwSG8J5RT4Xg.isfDc0QqWbEDz8lGsnxm3UPo177fntm', NULL, NULL, NULL),
(220, 'Randy Pratama Lumenta', 'mentarandy@bps.go.id', '198911102012111001', '', 5, 'basic', 'randy', 'default.jpg', NULL, '$2y$10$nWBBSFl7mxnc4plty3.FCeWa1hNCXReL/KJYvNlKTlzGgkzhcoM46', NULL, NULL, NULL),
(234, 'Windha Wijaya, SST', 'windhawijaya@bps.go.id', '199008012014102001', 'Fungsi Statistik Distribusi', 5, 'basic', 'windha', 'default.jpg', NULL, '$2y$10$Xa8Y2xGbi.tlQzegwv.wPO92dRPCwohXzpROBWqvmF04A2191Qre2', NULL, NULL, NULL),
(235, 'Mohamad Samsodin', 'mohsam@bps.go.id', '198305082006021001', 'Fungsi Neraca Wilayah dan Analisis Statistik', 5, 'basic', 'mohsam', 'default.jpg', NULL, '$2y$10$QStCvcYLw1xBXF43A5AuvuhF60/kCXiMUjIXMylDYT2rYzXqzbqOW', NULL, NULL, NULL),
(236, 'Sumbodo Aji Cahyono, S.Si, MA', 'sumbodo@bps.go.id', '197703081999011001', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'sumbodo', 'default.jpg', NULL, '$2y$10$0TpwDCL/z8YI7mniejnCiOngK.ADrqN5JlDor1kFQ/xYSC3IBxRmG', NULL, NULL, NULL),
(237, 'Administrator', 'ipds7100@bps.go.id', '240171000000000000', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'admin', 'default.jpg', NULL, '$2y$10$ZsH7YI14/1TBjEIUajfPGusT/ZZBwg9Jlh5CE/JEBOxcQJnnmi1Ym', NULL, NULL, NULL),
(238, 'Radjid Dwi Iskandar A.Md', 'radjid@bps.go.id', '198504112011011009', 'Bagian Umum', 5, 'basic', 'radjid', 'default.jpg', NULL, '$2y$10$oJff9qkhvvMIp84ay1kQTejU/ux8/KztpxxwRw8k.yf0vI.xgsaKO', NULL, NULL, NULL),
(239, 'Yanti Jane Ivonne Kaeng', 'yajaivka@bps.go.id', '198201202008012012', 'Bagian Umum', 5, 'basic', 'spk1', 'default.jpg', NULL, '$2y$10$D43GkZ/tZ3ZFSqbwyRN36e7enJQWMv8GrUllmBxfKvK1SqIkw1h9e', NULL, NULL, NULL),
(241, 'Ridwan Setiawan S.Tr.Stat.', 'ridwanst@bps.go.id', '199604202019011002', 'Bagian Umum', 5, 'basic', 'Ridwan', 'Ridwan.jpg', NULL, '$2y$10$jikkFYXs1HztTkyKZGDJXuoZheI17exKsJl9XDNB.C7BlU6RMyR4O', NULL, NULL, NULL),
(242, 'Karni Hamdani S.Si.', 'karni.hamdani@bps.go.id', '199401312019032001', 'Bagian Umum', 5, 'basic', 'karni', 'default.jpg', NULL, '$2y$10$tS6Y7XZPoIN1cFwAWMyduO2kvYxTp8XHCGT5e6gf/m4PLkjxiubMe', NULL, NULL, NULL),
(243, 'Rosniar Eliana SST., M.Stat.', 'niar@bps.go.id', '198601202009022008', 'Fungsi Statistik Distribusi', 5, 'basic', 'niar', 'default.jpg', NULL, '$2y$10$Fk2umsmfchigEPpa73Kzp.ezrWy/2lJ2vV/bWFjpqUgs3JF3ZWuxu', NULL, NULL, NULL),
(244, 'Danty Welmin Yoshida Fatima S.Tr.Stat.', 'danty.fatima@bps.go.id', '199711032021042001', 'Fungsi Statistik Produksi', 5, 'basic', 'danty123', 'default.jpg', NULL, '$2y$10$PBjlV.CX/mo/vlUmVa5TTOkk5UW2D8TbDDWFudd2stFlNYiaE1Iw.', NULL, NULL, NULL),
(245, 'Inke Margareth Tambeo', 'inkemargareth@bps.go.id', '198403232007012003', 'Fungsi Neraca Wilayah dan Analisis Statistik', 5, 'basic', 'inke', 'default.jpg', NULL, '$2y$10$TYWHFlLaiBgxRvYxGhaGkO9sHm3pSawVJ6Yo.x2Va.O/FOKB4sVci', NULL, NULL, NULL),
(246, 'Nurfadhila Fahmi', 'nurfadhila@bps.go.id', '199510092019032002', 'Fungsi Statistik Distribusi', 5, 'basic', 'dhila', 'default.jpg', NULL, '$2y$10$2ZcAMTjAXZyuQOUJZEO1CO4jOTB6R9r7Zo/Lq.5dwFe8pbUO9/FLy', NULL, NULL, NULL),
(247, 'Eko Siswahto SST, M.SE', 'xsiswahto@bps.go.id', '198504202008011003', 'Fungsi Statistik Produksi', 5, 'basic', 'xsiswahto', 'default.jpg', NULL, '$2y$10$5crcdl/KuFn2CzxG3bAVWeDEFCCvfTIB9pa0HcLXO3.uIIwKMtJ1e', NULL, NULL, NULL),
(249, 'Aidil Adha, SE., ME.', 'asim@bps.go.id', '197609271999011001', 'Kepala BPS Provinsi', 1, 'basic', 'aidil', 'default.jpg', NULL, '$2y$10$VyrMIDoRh2O0UzM/00zyQuP/o8xQALzXwC7xTNmTg2QVX699b3qBK', NULL, NULL, '2024-07-16 00:31:52'),
(250, ' Anton Tri Wijayanto, S.ST, M.Si.', 'antontw@bps.go.id', '198001022002121003', 'Fungsi Neraca Wilayah dan Analisis Statistik', 5, 'basic', 'Anton', 'default.jpg', NULL, '$2y$10$VrxwGqlr3drlgDKXOCxiWOwpTWKRLgncaqHJqiuL0I/qAAgLPW0IW', NULL, NULL, NULL),
(251, 'Dadan Sudarmadi, SST, M.Si.', 'dadan@bps.go.id', '197310141995121001', 'Bagian Umum', 5, 'basic', 'dadan', 'default.jpg', NULL, '$2y$10$kxnuRtvQ2znKGpj2NzDf7ezzudRR05noL5AeKxwBxTF9kLBmgJLQG', NULL, NULL, NULL),
(252, 'Abdul Aziz Makhrus, S.Tr.Stat.', 'amakhrus@bps.go.id ', '199607082019011003', 'Fungsi Statistik Sosial', 5, 'basic', 'aziz', 'default.jpg', NULL, '$2y$10$eEYYcn3cNfSypQN5fpIL4ePM5NlPwHnsmDO/CH9EF90yvi47/pXBa', NULL, NULL, NULL),
(253, 'Dina Atika Rahmawati, SST', 'dina.atika@bps.go.id', '199601152018022001', 'Fungsi Statistik Sosial', 5, 'basic', 'dina', 'default.jpg', NULL, '$2y$10$QDuUXhvfkFSs/lR9PzCsL...lr.C.KWUZqkt./z6ItSUqtzm8PGJe', NULL, NULL, NULL),
(254, 'Zulfa Nur Fajri Ramadhani, S.Tr.Stat.', 'zulfanr@bps.go.id', '199701292019012001', 'Fungsi Statistik Sosial', 5, 'basic', 'zulfa', 'default.jpg', NULL, '$2y$10$z1vfpAUc7bjMFpVPA1FfTeLGsu7AwtLy2htb0Qt3nSFAaI1xcV2hm', NULL, NULL, NULL),
(255, 'Salonica Oktaviani, SST', 'salonica.oktaviani@bps.go.id ', '199410302018022001', 'Fungsi Statistik Sosial', 5, 'basic', 'salonica', 'default.jpg', NULL, '$2y$10$SkF1XX/EgBkabpxILMrbE.MpC8ODEE3QhTjbXeZslfS6kZ7.e.trS', NULL, NULL, NULL),
(256, 'Christian Leonardo Pratama Tamboto, S.Tr.Stat.', 'leonardo.pratama@bps.go.id', '199708072019121001', 'Bagian Umum', 5, 'basic', 'christian', 'default.jpg', NULL, '$2y$10$Ce21FWAvpbeX7tfGtuGkkObtXOIcOVxXo1eIv6HBFD0dmXFEM328a', NULL, NULL, NULL),
(257, 'Untari Rahmawati, S.Tr.Stat.', 'untarirahma@bps.go.id', '199603312019012001', 'Fungsi Neraca Wilayah dan Analisis Statistik', 5, 'basic', 'Untari', 'default.jpg', NULL, '$2y$10$0AoKdXrA3MXGE7/23qAEH.K68nfISx0Lfr6kPZSk8HUPfrEXk.1zK', NULL, NULL, NULL),
(258, 'I Nyoman Pande Suputra, SST', 'in.pande@bps.go.id', '199504272018021002', 'Fungsi Statistik Produksi', 5, 'basic', 'Pande', 'default.jpg', NULL, '$2y$10$ok8heweZKlFoc4P72oWGHeTWPuWqmTUzvLTan3Ilz7lFdTa9oTKt6', NULL, NULL, NULL),
(259, 'Nabella Intan Karasta, S.Tr.Stat', 'nabella.intan@bps.go.id', '196808281994012001', 'Fungsi Statistik Produksi', 5, 'basic', 'nabella', 'default.jpg', NULL, '$2y$10$v2d7tbUTUn3xisqF87cdweqduh2BR/1Nbl5tFj4TaYG0wj8JPlCmC', NULL, NULL, NULL),
(260, 'Yulius Wendi Triandaru SST', 'yulius.wendi@bps.go.id', '199407252018021001', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'Yulius', 'default.jpg', NULL, '$2y$10$IY1HcgPuRsVvstEXiWBPCO8f1vF1Z7FDm9InCMGZXK0y.ZSRvrjw.', NULL, NULL, NULL),
(261, 'Nurul Hidayah S.Tr.Stat.', 'nurul.hidayah@bps.go.id', '199704212019012001', 'Bagian Umum', 5, 'basic', 'ida', 'default.jpg', NULL, '$2y$10$X6kdU0rHDiVkuagLRyYWYulXDe6P4cyQnc4bhtKLoq.XkmFrfOPxK', NULL, NULL, NULL),
(262, 'Wisnu Triaji, SE', 'wisnu.triaji@bps.go.id', '198702142009021002', 'Bagian Umum', 5, 'basic', 'wisnu.triaji', 'default.jpg', NULL, '$2y$10$RbMQkufm6beVBCV/jpEa7OXQQfOaZ2f2gS0eofwKhujtYGio97XZm', NULL, NULL, NULL),
(266, 'Irene Ruth Longkutoy SH', 'airin@bps.go.id', '197403242006042000', 'Bagian Umum', 5, 'basic', 'irene', 'default.jpg', NULL, '$2y$10$16yRqjz0VMBxfVQ.foWRZ.YvVfoRnuB5B91Hp/vGjZKspdHLFNicS', NULL, NULL, NULL),
(267, 'Steven Kalvin Montolalu, SE', 'stevenmontolalu@bps.go.id', '197904062003121000', 'Bagian Umum', 5, 'basic', 'steven', 'default.jpg', NULL, '$2y$10$CIggM.4KsSMFc1UHEjT2FOXQBPx/1srtVz.IF3O9d.AtDf2fuGgsW', NULL, NULL, NULL),
(268, 'Lazia Outenty Bimbangnaung', 'tenty@bps.go.id', '198110000000000000', 'Bagian Umum', 5, 'basic', 'lazia', 'default.jpg', NULL, '$2y$10$UsfMc.OaYoEtyvvOHm00wO0nlBrTr5EyqVnD6GqWbDYdugsNVihLe', NULL, NULL, NULL),
(269, 'Olfiane Silfia Pelealu, SE', 'olfianesilfia pelealu@bps.go.id', '197310042003122000', 'Fungsi Statistik Sosial', 5, 'basic', 'olfiane', 'default.jpg', NULL, '$2y$10$xBHEuQB/OrrQ0jqTvD3hD.2HUPrlmnnLj4ZYJcMbu0iptzAHaOn2K', NULL, NULL, NULL),
(271, 'Elrini Diane Wuisan, SE', 'elriniwuisan@bps.go.id', '198210022010032000', 'Fungsi Statistik Distribusi', 5, 'basic', 'elrini', 'default.jpg', NULL, '$2y$10$YG9WBJzq5igTImCJrbVuGOlqFtLHBLxnEeegnp44oS.QP6KSNZ9F.', NULL, NULL, NULL),
(272, 'Vonny Joice Lalujan, SE', 'vonny@bps.go.id', '196911011992022000', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'vonny', 'default.jpg', NULL, '$2y$10$fQDCpvGPiEkfeV4V3PtYJ.e0F70STcOoakx.8umhvqD4tOgpYSY4K', NULL, NULL, NULL),
(273, 'Dading, S.Si.', 'dading@bps.go.id', '199112202019031000', 'Fungsi Statistik Distribusi', 5, 'basic', 'dading', 'default.jpg', NULL, '$2y$10$MjrdI8EnpKNjlG1ptWbciuo91Jnz.3H2uny/0eDBvgFIvjGwNmj0K', NULL, NULL, NULL),
(274, 'Muhammad Iqbal, S.Stat.', 'iqbal.muh@bps.go.id', '199510132019031001', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'iqbal1', 'default.jpg', NULL, '$2y$10$BOVHR7MUyGPORtDZBDfLbuj8CHBgG9cvvyT.4CBKD8mEmk8ar9Lu2', NULL, NULL, NULL),
(275, 'Ponimin', 'ponim@bps.go.id', '199810132021041000', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'Ponimin', 'default.jpg', NULL, '$2y$10$D8M4i/FUluU2a8khu05ND.Ms4nzqJHNjKhC9GRW3ZNMBaprlGpYni', NULL, NULL, NULL),
(276, 'Muhammad Rifqi Mubarak', 'rifqi.mubarak@bps.go.id', '199901052021041000', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'Rifqi', 'default.jpg', NULL, '$2y$10$iLGCRpmYlu0ZdxYcHPMomOYZvIrk9hMGTdrAXoqDAaYEIlGukAp7W', NULL, NULL, NULL),
(283, 'Ririn Hidayati S.Si., MPP, MSE', 'ririnh@bps.go.id', '197311031998032005', 'Fungsi Distribusi', 5, 'basic', 'ririnh', 'default.jpg', NULL, '$2y$10$efK62i/kYfkoLpn4SEsAdedHcEmFjgczUFY8YiaiNQ3cIRZKQyB1e', NULL, NULL, NULL),
(287, 'Mustika Aridya Arum A.Md.Kb.N.', 'mustika.arum@bps.go.id', '200104112022012001', 'Bagian Tata Usaha', 5, 'basic', 'mustika', 'default.jpg', NULL, '$2y$10$RAgJ5uiYm7hx9TM31sxRfulCfagNKU3yjRpVVLkpkrYu/JjWA2Vzi', NULL, NULL, NULL),
(288, 'Ratriani Retno Wardani S.Tr.Stat.', 'ratriani.wardani@bps.go.id', '199903202022012004', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'ratriani', 'default.jpg', NULL, '$2y$10$eclXs8xxiq/AdnV8P8jBnOh7i/64Kf0kYFlEXh9aq018opCpPtpZK', NULL, NULL, NULL),
(289, 'Daniel Tri Hemawan SE', 'daniel.tri@bps.go.id', '197610102006041003', 'Fungsi Neraca Wilayah dan Analisis', 5, 'basic', 'daniel_tri', 'default.jpg', NULL, '$2y$10$rQV9B4Oe0xl4ByXFDk.BBuiMOVR5lymi7pn/9kVKqiogH3i08cdNS', NULL, NULL, NULL),
(290, 'Yola Christhy Larinse SST', 'yola.larinse@bps.go.id', '199211072014122001', 'Fungsi Statistik Produksi', 5, 'basic', 'yola', 'default.jpg', NULL, '$2y$10$JDFz3l0gi7Vj9Y9BJ4NVl.DymC0oHa3N1WZEhGNAt0Yio.rd1pdaS', NULL, NULL, NULL),
(291, 'Risky SST', 'risky@bps.go.id', '199405192016021001', 'Fungsi Statistik Sosial', 5, 'basic', 'risky', 'default.jpg', NULL, '$2y$10$zd0DPQJDVR.RQOYsHjLWd.Mt.MxWPfuBg413JIzgVbAumEoTjHwlu', NULL, NULL, NULL),
(292, 'Zaenuri Putro Utomo', 'zaenuri@bps.go.id', '198101262011011005', 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik', 5, 'basic', 'zaenuri', 'default.jpg', NULL, '$2y$10$h3s.oFI2w/abO0tbgFsK1uVXErxOyDPe1LeGseVhUGvOOnGZD6YGS', NULL, NULL, NULL),
(293, 'Herman Tinungki SE', 'herman.tinungki@bps.go.id', '196703311986031002', 'Bagian Umum', 5, 'basic', 'herman', 'default.jpg', NULL, '$2y$10$l9e7ZRcb0hsFOkhbGZ8GkO2SfEefkdnxiqOwp8TqT83JLkhahPyLi', NULL, NULL, NULL),
(294, 'Nurul Hayati Unonongo SST', 'nurul.unonongo@bps.go.id', '199311112017012002', 'Bagian Umum', 5, 'basic', 'nurul.unonongo', 'default.jpg', NULL, '$2y$10$o3DsIrKRpw1SdXnyK0W7HuGPakLKNBk6k1XYDMsQZ0GFtCYYeY6/W', NULL, NULL, NULL),
(295, 'Friska Patricia Raintung, SE', 'friska.patricia@bps.go.id', '198912292022032007', 'Bagian Umum', 5, 'basic', 'friska.patricia', 'default.jpg', NULL, '$2y$10$WjvKjtFgZX.WgyV21S1vF.hR5LJ.LLUGHqH2yDjwCIA3baf3daNza', NULL, NULL, NULL),
(296, 'Nova Nurviana SST, M.T.', 'nova.nurviana@bps.go.id', '198911222013112001', 'Statistik Sosial', 5, 'basic', 'nova.nurviana', 'default.jpg', NULL, '$2y$10$bwsm.6YDvSgBF46NBJr9X.KJW5In0hLK9fT7OhKAWc7xzr5p9ArTu', NULL, NULL, NULL),
(298, 'ponim Ponimin', 'user@bps.go.id', '199', 'IPDS', 8, 'Super Admin', 'adminsuper', 'hehe.jpg', NULL, '$2y$10$h77SI0N.GYAfTa1z597A2O0Cu3hnL3hArHBwyLZK69AGQ.SsRJr9G', NULL, '2024-02-05 03:48:33', '2024-02-05 03:48:33'),
(299, 'Agus Purwandi, S.Kom', 'agusp@bps.go.id', '197508312006041002', 'IPDS', 4, 'basic', 'agusp', NULL, NULL, '$2y$10$kLAtetx5/2qVO/D9fODVxOYy/6rKGk8yzKyru10/mIEyE9bO5va96', NULL, '2024-04-26 01:48:53', '2024-04-26 01:48:53'),
(300, 'Tri Hidayati', 'tri.hidayati@bps.go.id', '199408132019032001', 'Bagian Umum', 5, 'basic', 'tri.hidayati', NULL, NULL, '$2y$10$fzV0MswYVK4q6/idVlUiNO2uav/RFU5Y7DpJz2CtHMYHvnc33cDOe', NULL, '2024-04-26 01:54:41', '2024-04-26 01:54:41'),
(301, 'Jermias Oscar Jeffry Sahambangun', 'jeqyje@bps.go.id', '197211151994031006', 'Bagian Umum', 6, 'basic', 'jeqyje', NULL, NULL, '$2y$10$tUGQgh.uFngZx3lPN1J4s.pnkQCKvEYTNVoUSkZJfzxxWGPr7vZ4W', NULL, '2024-04-26 01:57:07', '2024-04-26 01:57:07'),
(302, 'Regina Pangau', 'regina.pangau@bps.go.id', '199706092022032016', 'Bagian Umum', 11, 'basic', 'regina.pangau', NULL, NULL, '$2y$10$.HNRvrYrqDwS5gG0JQ7B8uFi7BRCdpvC1WNr7WE1Enh8IRtoJL/WC', NULL, '2024-04-26 01:58:57', '2024-04-26 01:58:57'),
(303, 'Destiana Fitri', 'destianaf@bps.go.id', '199609292019012001', 'Statistik Sosial', 5, 'basic', 'destianaf', NULL, NULL, '$2y$10$rXFKVzbZOuGO4.Hx8q0v1.cuKSPGdf6fhozDuJxUz1ytRb.2IZLHK', NULL, '2024-04-26 02:00:20', '2024-04-26 02:00:20'),
(304, 'Marnita Simaputang', 'marnitas@bps.go.id', '199102102014102001', '-', 6, 'basic', 'marnitas', NULL, NULL, '$2y$10$IyfE4udq9l1yzIMmZ1NMk.9cqSu6lqf9APk9reSROJPTFQ3xdTLPS', NULL, '2024-04-26 02:03:15', '2024-04-26 02:03:15'),
(305, 'Denis Diego Kaparang', 'dennisdiego-pppk@bps.go.id', '199012052023211024', '-', 12, 'basic', 'dennisdiego-pppk', NULL, NULL, '$2y$10$SlZnoIwGSlLZ.WsisYJ1OeW5BvMvfj6S1UmN/NNFa81KrFpWztUG2', NULL, '2024-04-26 02:09:15', '2024-04-26 02:09:15'),
(306, 'Raymond Nica Seyun Kumolontang', 'raymond@bps.go.id', '197409112003121004', 'Statistik Sosial', 7, 'basic', 'raymond', NULL, NULL, '$2y$10$bZp20JEw.bKjGaOkU9J29u8e8IglFLGaa2a7EzAN8zcm6Pa9UWmOm', NULL, '2024-04-26 02:10:37', '2024-04-26 02:10:37'),
(307, 'Loveria Candra Puspita', 'loveria.candra@bps.go.id', '199504292018022001', '-', 5, 'basic', 'loveria.candra', NULL, NULL, '$2y$10$1ak9YXrhoKhEITTmB9c5a.5atpouaZ0SxkV0/1hDcHZqhlhCp3gYC', NULL, '2024-04-26 02:11:42', '2024-04-26 02:11:42'),
(308, 'Putri Sekarsinung', 'putri.sekarsinung', '199701052019122001', '-', 5, 'basic', 'putri.sekarsinung', NULL, NULL, '$2y$10$L8gNMuvxmFDpDK/Ai2bzY.JHozzDlbEMLCWLQx61ixI0c4oFhWC6O', NULL, '2024-04-26 02:13:11', '2024-04-26 02:13:11'),
(309, 'Afifah Syabaniah Sanubari Langkau', 'afifah.langkau@bps.go.id', '199911272019122002', 'Bagian Umum', 11, 'basic', 'afifah.langkau', NULL, NULL, '$2y$10$WqaBlVcmN4slTozR02rzFuv5vu0rLmoyLiLlBcqY/UP5WdOJ9xTb2', NULL, '2024-04-26 02:14:54', '2024-04-26 02:14:54'),
(310, 'Agustinus Dirga Istanto Mantow', 'dirga.mantow@bps.go.id', '198708172012121002', 'Bagian Umum', 10, 'basic', 'dirga.mantow', NULL, NULL, '$2y$10$yuOxMGD4CCYS18FYJnj3Z.A.tncM67uboua7jYRNo6zfUXTyrDZeq', NULL, '2024-04-26 02:21:30', '2024-04-26 02:21:30'),
(311, 'Edwin Nababan', 'edwin.nababan@bps.go.id', '199305252017011001', '-', 5, 'basic', 'edwin.nababan', NULL, NULL, '$2y$10$.wR5U1.2Q99ea06RNggh7OEHpj97o6yWO2VYkR5qW060UYS5co40O', NULL, '2024-04-26 02:22:44', '2024-04-26 02:22:44'),
(312, 'Wardzatul Khoiriyah', 'wardzatul.khoiriyah@bps.go.id', '200004172022012008', 'Bagian Umum', 13, 'basic', 'wardzatul.khoiriyah', NULL, NULL, '$2y$10$gKFLWflHkbPDA/ZhMoZnju6L7/uf/SJTYbyKzURYC8AGRfuIco5j6', NULL, '2024-04-26 02:25:33', '2024-04-26 02:25:33'),
(313, 'Bhayu Prabowo', 'bhayu@bps.go.id', '199', 'Bagian Umum', 2, 'basic', 'bhayu', NULL, NULL, '$2y$10$7F0uUGBZoccpqFqMxc9vH.4o9b0.9j0C2DefcFTQ3m0Lc3tVKV6de', NULL, '2024-05-07 06:06:11', '2024-05-07 06:06:11'),
(314, 'Rahmadi', 'rahmadi@bps.go.id', '197707202000121002', 'IPDS', 4, 'basic', 'rahmadi@bps.go.id', NULL, NULL, '$2y$10$by7HYmgobFk79dPGIRWWKeWsGXYYyoUtMCNNTpBGkH6ZuxJLzi7SK', NULL, '2024-07-03 08:04:16', '2024-07-03 08:26:46'),
(315, 'Ryko Aprianto Puasa', 'rycoaprianto@bps.go.id', '197604092006041016', 'Statistisi', 6, 'basic', 'rycoaprianto@bps.go.id', NULL, NULL, '$2y$10$NgBBDeWRFn8XAV6h69v3X.HG2gNX6PZUv4dAiu0THIZJQDI5shuBe', NULL, '2024-07-03 08:28:36', '2024-07-03 08:28:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_barang_id_foreign` (`barang_id`),
  ADD KEY `barang_sistem_operasi_id_foreign` (`sistem_operasi_id`),
  ADD KEY `barang_pengguna_id_foreign` (`users_id`),
  ADD KEY `barang_ruangan_id_foreign` (`ruangan_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `maintenances`
--
ALTER TABLE `maintenances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `maintenances_users_id_foreign` (`users_id`);

--
-- Indexes for table `maintenance_sequences`
--
ALTER TABLE `maintenance_sequences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_barang`
--
ALTER TABLE `master_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_jabatan`
--
ALTER TABLE `master_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_perusahaan`
--
ALTER TABLE `master_perusahaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_pj_perusahaan`
--
ALTER TABLE `master_pj_perusahaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_ruangan`
--
ALTER TABLE `master_ruangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_ruangan_users_id_foreign` (`users_id`);

--
-- Indexes for table `master_sistem_operasi`
--
ALTER TABLE `master_sistem_operasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `riwayat_barang`
--
ALTER TABLE `riwayat_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `status_pemeliharaan`
--
ALTER TABLE `status_pemeliharaan`
  ADD PRIMARY KEY (`kode_status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_jabatan_id_foreign` (`jabatan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=754;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenances`
--
ALTER TABLE `maintenances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_sequences`
--
ALTER TABLE `maintenance_sequences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_barang`
--
ALTER TABLE `master_barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=710;

--
-- AUTO_INCREMENT for table `master_jabatan`
--
ALTER TABLE `master_jabatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `master_perusahaan`
--
ALTER TABLE `master_perusahaan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_pj_perusahaan`
--
ALTER TABLE `master_pj_perusahaan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_ruangan`
--
ALTER TABLE `master_ruangan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `master_sistem_operasi`
--
ALTER TABLE `master_sistem_operasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat_barang`
--
ALTER TABLE `riwayat_barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `master_barang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barang_pengguna_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barang_ruangan_id_foreign` FOREIGN KEY (`ruangan_id`) REFERENCES `master_ruangan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barang_sistem_operasi_id_foreign` FOREIGN KEY (`sistem_operasi_id`) REFERENCES `master_sistem_operasi` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `maintenances`
--
ALTER TABLE `maintenances`
  ADD CONSTRAINT `maintenances_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `master_ruangan`
--
ALTER TABLE `master_ruangan`
  ADD CONSTRAINT `master_ruangan_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `riwayat_barang`
--
ALTER TABLE `riwayat_barang`
  ADD CONSTRAINT `riwayat_barang_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_jabatan_id_foreign` FOREIGN KEY (`jabatan_id`) REFERENCES `master_jabatan` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
