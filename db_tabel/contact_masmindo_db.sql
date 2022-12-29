-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 29, 2022 at 07:48 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `contact_masmindo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `nama`, `alamat`, `no_hp`, `foto`, `created_at`, `updated_at`) VALUES
(0, 'Roy Marulido Situmorang', '<p>Karawaci Tanggerang</p>', '0875656545454', 't9AVqEZUEr6wHDrEp2fDrgshYzD2I57o2Ah5EB6q.png', '2022-12-24 06:47:59', '2022-12-24 06:47:59'),
(3, 'endah pita', '<p>sdddssssssssssssssssssssss</p>', '0875656545454', 'idzqKOQsrjkxURhrQCyIrJGjbTSBGmfH26j4jRWb.png', '2022-12-24 10:49:36', '2022-12-24 10:49:36'),
(4, 'rrrrrrrrrrrrrrrrrrrrrrreeeeeeeeerrrrrrrrrrrr', 'asdssssssssssssssssss', '11111111111111111', 'nuiIEEPALVzVx5A1KnEys8iEqdQfmcRvOoenf0I7.png', '2022-12-29 10:48:34', '2022-12-29 10:48:34'),
(5, 'rrrrrrrrrrrrrrrrrrrrrrreeeeeeeeerrrrrrrrrrrr', 'asdssssssssssssssssss', '11111111111111111', 'cydN8bEVxQQ05bap2ZSlFDHXEeOZMWhVLL9OMyvK.png', '2022-12-29 11:07:18', '2022-12-29 11:07:18'),
(6, 'rrrrrrrrrrrrrrrrrrrrrrreeeeeeeeerrrrrrrrrrrr', 'asdssssssssssssssssss', '11111111111111111', 'jlAa3N7dpp5yuBsQOlHI1CRd4OLS6w4nJJigb8eN.png', '2022-12-29 11:22:49', '2022-12-29 11:22:49'),
(7, 'rrrrrrrrrrrrrrrrrrrrrrreeeeeeeeerrrrrrrrrrrr', 'asdssssssssssssssssss', '11111111111111111', 'QfiufZsvotKcOUt7JwuhpgzXLHWSmH0Afz65YRC0.png', '2022-12-29 11:23:44', '2022-12-29 11:23:44');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2022_12_24_064209_create_contacts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'tesroy@masmindo.com', NULL, '$2y$10$RheE3E5JigZvma8xHkbU.uM5GhajfmAWsHygq78zdsZHRV39ybCJG', NULL, '2022-12-24 08:09:29', '2022-12-24 08:09:29'),
(2, 'roy', 'adminroy@masmindo.com', NULL, '$2y$10$xe4BPGXumstlgaxkj2gr9uapezeNc/0c3Z/McnDzt8qk/XipBKKTi', NULL, '2022-12-24 10:30:40', '2022-12-24 10:30:40'),
(3, 'trddddd', 'tes@gmail.com', NULL, '$2y$10$m/PNhEco.ZStAIgr4Ha/xubhImE9YAE8Tp1HDufqa4YoYfEmIu7bG', NULL, '2022-12-27 23:41:10', '2022-12-27 23:41:10'),
(4, 'endah', 'endah@gmail.com', NULL, '$2y$10$dCruN8ZPF0JVio3m.IgAI.DFpcmCil4ys7cOoaEEGmi7oDpJd3SGm', NULL, '2022-12-27 23:51:06', '2022-12-27 23:51:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
