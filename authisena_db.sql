-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2024 at 02:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `authisena_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `pasiens`
--

CREATE TABLE `pasiens` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tgllahir` varchar(255) NOT NULL,
  `umur` int(11) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `norm` int(11) NOT NULL,
  `nobpjs` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasiens`
--

INSERT INTO `pasiens` (`id`, `uuid`, `nama`, `tgllahir`, `umur`, `alamat`, `norm`, `nobpjs`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, '2724a91a-93f8-4d9e-a540-f36bade74067', 'Fajar', '22-01-2002', 22, 'Griya Pakel Permai', 210283053, 2131515, 1, '2024-04-25 17:36:19', '2024-04-25 17:36:19');

-- --------------------------------------------------------

--
-- Table structure for table `pfs`
--

CREATE TABLE `pfs` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `unitpelayanan` varchar(255) NOT NULL,
  `keluhanutama` varchar(255) NOT NULL,
  `keluhantambahan` varchar(255) NOT NULL,
  `riwayatpenyakitsekarang` varchar(255) NOT NULL,
  `riwayatpenyakitdahulu` varchar(255) NOT NULL,
  `riwayatpenyakitkeluarga` varchar(255) NOT NULL,
  `riwayatalergi` varchar(255) NOT NULL,
  `terapiyangpernahdijalani` varchar(255) NOT NULL,
  `obatnyangseringdigunakan` varchar(255) DEFAULT NULL,
  `obatyangsedangdikonsumsi` varchar(255) NOT NULL,
  `keadaanumum` varchar(255) NOT NULL,
  `kesadaranGCS` varchar(255) NOT NULL,
  `tekanandarah` int(11) NOT NULL,
  `nadi` int(11) NOT NULL,
  `suhu` int(11) NOT NULL,
  `freknafas` int(11) NOT NULL,
  `beratbadan` int(11) NOT NULL,
  `tinggibadan` int(11) NOT NULL,
  `imtBBTB` int(11) NOT NULL,
  `kepala` varchar(255) NOT NULL,
  `thorax` varchar(255) NOT NULL,
  `abdormen` varchar(255) NOT NULL,
  `ekstremitas` varchar(255) NOT NULL,
  `lainnya` varchar(255) NOT NULL,
  `statusmental` varchar(255) NOT NULL,
  `responemosi` varchar(255) NOT NULL,
  `hubunganpasiendengankeluarga` varchar(255) NOT NULL,
  `ketaatanmenjalaniibadah` varchar(255) NOT NULL,
  `bahasa` varchar(255) NOT NULL,
  `pasienId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pfs`
--

INSERT INTO `pfs` (`id`, `uuid`, `unitpelayanan`, `keluhanutama`, `keluhantambahan`, `riwayatpenyakitsekarang`, `riwayatpenyakitdahulu`, `riwayatpenyakitkeluarga`, `riwayatalergi`, `terapiyangpernahdijalani`, `obatnyangseringdigunakan`, `obatyangsedangdikonsumsi`, `keadaanumum`, `kesadaranGCS`, `tekanandarah`, `nadi`, `suhu`, `freknafas`, `beratbadan`, `tinggibadan`, `imtBBTB`, `kepala`, `thorax`, `abdormen`, `ekstremitas`, `lainnya`, `statusmental`, `responemosi`, `hubunganpasiendengankeluarga`, `ketaatanmenjalaniibadah`, `bahasa`, `pasienId`, `createdAt`, `updatedAt`) VALUES
(1, 'b76369d3-8eef-44eb-89e7-46f0b93a229d', 'Polgigi', 'Gigi berlubang', 'tidak ada', 'sakit gigi terasa nyeri', 'sesak nafas', 'tidak ada', 'alergi udang', 'periksa gigi secara rutin', 'paracetamol', 'paracetamol', 'agak stress', 'kurang tau', 120, 90, 37, 50, 64, 170, 214, 'baik', 'baik', 'baik juga lah', 'ngga tau apa itu', 'tidak ada', 'aman/baik', 'aman/baik', 'baik', 'sangat taat', 'Indonesia', NULL, '2024-04-26 12:05:05', '2024-04-26 12:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('-o9vUEEtCylAcc7mM_Qbkw5cuZjnrz5v', '2024-04-26 17:55:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:55:43', '2024-04-25 17:55:43'),
('-tCGOtQXinm_f4KRf0AV4VEJhV2PfePj', '2024-04-26 18:23:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:23:10', '2024-04-25 18:23:10'),
('0RvCmhpm3lENfcnbU4K60phgXJYr8JSs', '2024-04-26 18:19:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:19:22', '2024-04-25 18:19:22'),
('1yzCLj-X2xY_pyyZ9vgoDeVhfn3pRZNT', '2024-04-26 18:04:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:04:50', '2024-04-25 18:04:50'),
('61V5vM8YbAz69HugXGiXebZIQxb5tmAd', '2024-04-26 18:17:39', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:17:39', '2024-04-25 18:17:39'),
('7g78pIdI75z9o_AlwAVW_RPB9_7-zbFl', '2024-04-26 17:55:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:55:43', '2024-04-25 17:55:43'),
('7LH8KdOWWtM1nymM5pakOQGeCibNmlMe', '2024-04-26 15:52:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 15:52:02', '2024-04-25 15:52:02'),
('8AwgPa71xZpnKoBlWEpE43oiibr7q2nQ', '2024-04-26 18:21:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:21:01', '2024-04-25 18:21:01'),
('9b9PnZ2NjLsmikhR3b8hzT0uY2ncZHE0', '2024-04-26 17:58:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:58:10', '2024-04-25 17:58:10'),
('9DpK6rEb4sKQWaPSP1rqHAXJOplU3Au_', '2024-04-27 06:15:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"84c5e772-a6c8-4509-8934-1386e82be9ef\",\"username\":\"prasetyo\"}', '2024-04-26 05:43:04', '2024-04-26 06:15:54'),
('9FqexoZqDOd6iVjuQuxPl5P23S_HBQO4', '2024-04-26 17:54:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:54:21', '2024-04-25 17:54:21'),
('ADwXDxgN2oRCSmaN2xHCBbzTVb1PlywE', '2024-04-26 17:58:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:58:22', '2024-04-25 17:58:22'),
('bAYqaDqOqeW6lihL6k6b3Mj-YmtFKYUb', '2024-04-26 17:30:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:30:49', '2024-04-25 17:30:49'),
('BFwryfZQAFoOd-CQqach0005w21ERYey', '2024-04-27 06:15:51', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-26 06:15:51', '2024-04-26 06:15:51'),
('bHoUX0R77Peiq6SKTiWNArImcA-BRCOd', '2024-04-26 17:00:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:00:54', '2024-04-25 17:00:54'),
('Bwdh79w670BovRRkxeFpOhlH4XP8Mhkm', '2024-04-26 18:21:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:21:41', '2024-04-25 18:21:41'),
('c0uKeEX6Kca-pG98r2j6wjZVxrrH34y7', '2024-04-26 17:10:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:10:29', '2024-04-25 17:10:29'),
('D7D6Dq0oLXbE0nQvip9UjFFCnrFucYA3', '2024-04-26 18:23:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:23:16', '2024-04-25 18:23:16'),
('F29bLcOvSgizXxufIVuPCfmmH7Y9Gp1I', '2024-04-26 17:58:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:58:03', '2024-04-25 17:58:03'),
('fLqMIlkE5HRD4SUvIxifvoxa8xP1XirD', '2024-04-27 06:17:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-26 06:17:04', '2024-04-26 06:17:04'),
('GdXbMjpXc8WOZZVkpD2faeaTP-vyhKeP', '2024-04-26 18:23:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:23:01', '2024-04-25 18:23:01'),
('HlRxLBk_a76UCM7aCZI2K1DA-8QXkn-u', '2024-04-26 18:23:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:23:31', '2024-04-25 18:23:31'),
('iBHWjeqPJnOPM2e0IIX9LnyjnT8SMpW7', '2024-04-26 18:05:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:05:28', '2024-04-25 18:05:28'),
('iHoSjz3xzruOM4h_LzGwD_rgXT3sNq0g', '2024-04-26 17:54:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:54:21', '2024-04-25 17:54:21'),
('IkCFKyTUJXAXmxhGV-CVeC897FleQs3k', '2024-04-26 17:54:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:54:30', '2024-04-25 17:54:30'),
('JNEOSOBRdpI2b34ShDTIeR9oWjaJJCgK', '2024-04-26 17:51:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:51:10', '2024-04-25 17:51:10'),
('JrTr_vov8wlgwguNpfk5geWREts_h2Pg', '2024-04-26 17:59:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:59:56', '2024-04-25 17:59:56'),
('jXJq-yKyhP1S1ssCyLLa5nntpTzslFy4', '2024-04-26 19:04:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"84c5e772-a6c8-4509-8934-1386e82be9ef\",\"username\":\"prasetyo\"}', '2024-04-24 16:28:01', '2024-04-25 19:04:54'),
('kf9RBAU3nNNaimj3frbDMQg8Xg4pcVfq', '2024-04-26 18:18:39', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:18:39', '2024-04-25 18:18:39'),
('MBFpETRu8_-Q5dniXzwSULuAOvRUMlU3', '2024-04-26 17:59:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:59:56', '2024-04-25 17:59:56'),
('MprfM-ts_PYOaZurLTVombgaFRGy9VvA', '2024-04-26 15:52:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 15:52:10', '2024-04-25 15:52:10'),
('MtQKxd4Ai_Wbqoz4MfuspOXbPCMZo4xX', '2024-04-27 06:17:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-26 06:17:07', '2024-04-26 06:17:07'),
('OPy9TG42U4NeqaiHlXaZIDV4X0lpOR67', '2024-04-26 19:04:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 19:04:41', '2024-04-25 19:04:41'),
('Os-pEjFJ5EQjZgAn_PK6fa6tJnmJgOry', '2024-04-27 05:43:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-26 05:43:03', '2024-04-26 05:43:03'),
('pSXSvV8XwcqdVw5fF4xGe4z6ZQTgQ7XJ', '2024-04-26 17:00:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:00:41', '2024-04-25 17:00:41'),
('Qa8RLsHPEfFtRk8cnASmKA1kbGlEVdj7', '2024-04-26 17:01:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:01:17', '2024-04-25 17:01:17'),
('qjMKa1ZkPZB2_EYmYet97-E1NNG1WluW', '2024-04-26 17:58:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:58:22', '2024-04-25 17:58:22'),
('QyV-MQn-ZIFLnbDepO0JRyAY-fZeefs1', '2024-04-26 18:17:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:17:28', '2024-04-25 18:17:28'),
('S4-0CmakBorROamENNbD5Ng898BMAQct', '2024-04-26 17:00:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:00:23', '2024-04-25 17:00:23'),
('sk2eEDCwZY1AynhUjYchhLq-8mDyR_8L', '2024-04-26 17:58:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:58:10', '2024-04-25 17:58:10'),
('SQ1kvQxtcxumzvIptXZBxaw3qM3Kbvif', '2024-04-26 17:54:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:54:30', '2024-04-25 17:54:30'),
('SQkyL11nDTqFTdKb6ACVv_6eyu67_Bbx', '2024-04-27 05:47:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-26 05:47:15', '2024-04-26 05:47:15'),
('t4SL4lD3RSRgtm2_HTuISBtN4TvHWmRQ', '2024-04-26 19:04:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 19:04:50', '2024-04-25 19:04:50'),
('U4knN3Q6BmlbY82_3JOSuhOweXT5tkjX', '2024-04-26 19:02:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 19:02:43', '2024-04-25 19:02:43'),
('UaaII-MDMxDdyX4ZhLV0P7OroiAgCWI5', '2024-04-27 06:17:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"84c5e772-a6c8-4509-8934-1386e82be9ef\"}', '2024-04-24 16:39:14', '2024-04-26 06:17:07'),
('ujikMDeHTfaijxg6gOs9Itw01YJBpt1_', '2024-04-26 16:53:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 16:53:21', '2024-04-25 16:53:21'),
('UlxQjmOk9Mv5LEMwwxmf67PuxlWCQEmk', '2024-04-26 17:56:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:56:05', '2024-04-25 17:56:05'),
('up1A1m1I1nAwmJrc5E4lf3nwTFqAxEM1', '2024-04-26 17:44:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:44:26', '2024-04-25 17:44:26'),
('uYu13BMKSMwe8KRMiti5Lk-pbqbKhK9a', '2024-04-27 12:21:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"84c5e772-a6c8-4509-8934-1386e82be9ef\",\"pasienId\":\"2724a91a-93f8-4d9e-a540-f36bade74067\"}', '2024-04-25 17:21:04', '2024-04-26 12:21:02'),
('VBzN73czV5zWlgixHahOcIl-LObCJXjT', '2024-04-27 06:15:53', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-26 06:15:53', '2024-04-26 06:15:53'),
('WAXr-XIEUxUwRn2TULckLpE6cVQiHe34', '2024-04-26 19:03:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 19:03:24', '2024-04-25 19:03:24'),
('Wi1hJJnEF_1TB95OTDgjM7nCf4ewTA--', '2024-04-26 18:23:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 18:23:23', '2024-04-25 18:23:23'),
('wpSxdGbOmUMVhydH8cgTtdw9OxFAnxyN', '2024-04-26 19:03:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 19:03:33', '2024-04-25 19:03:33'),
('xs5Oo6_kAgmYKx10fwfBoegSZyDdm-sI', '2024-04-26 17:51:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-04-25 17:51:10', '2024-04-25 17:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `jwt_token` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `username`, `email`, `password`, `role`, `jwt_token`, `createdAt`, `updatedAt`) VALUES
(1, '84c5e772-a6c8-4509-8934-1386e82be9ef', 'prasetyo', 'prasetyo@admin.com', '$argon2id$v=19$m=65536,t=3,p=4$lQyBs0Kh/jY0wNPHnMLVpA$8AmTHwYSjl3s3ceRNsa2AjBxnbqTc1Cb9XRQe7dKAQY', 'admin', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiODRjNWU3NzItYTZjOC00NTA5LTg5MzQtMTM4NmU4MmJlOWVmIiwidXNlcm5hbWUiOiJwcmFzZXR5byIsImVtYWlsIjoicHJhc2V0eW9AYWRtaW4uY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNzE0MTEyMjI0LCJleHAiOjE3MTQxOTg2MjR9.Rp2d7k0Mlo8YM7gW7e7apocWB24gmZIccslhHFw0BAo', '2024-04-23 18:20:03', '2024-04-26 06:17:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pasiens`
--
ALTER TABLE `pasiens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `pfs`
--
ALTER TABLE `pfs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasienId` (`pasienId`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pasiens`
--
ALTER TABLE `pasiens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pfs`
--
ALTER TABLE `pfs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pasiens`
--
ALTER TABLE `pasiens`
  ADD CONSTRAINT `pasiens_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pfs`
--
ALTER TABLE `pfs`
  ADD CONSTRAINT `pfs_ibfk_1` FOREIGN KEY (`pasienId`) REFERENCES `pasiens` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
