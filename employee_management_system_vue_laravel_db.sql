-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2021 at 01:25 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee_management_system_vue_laravel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rawalpindi', '2021-12-20 04:19:09', '2021-12-20 04:46:32'),
(2, 1, 'Lahore', '2021-12-20 04:20:58', '2021-12-20 04:20:58'),
(3, 2, 'Bangal', '2021-12-20 04:28:48', '2021-12-20 04:50:13'),
(7, 3, 'New York City', '2021-12-20 04:49:53', '2021-12-20 04:49:53'),
(8, 1, 'Sialkott', '2021-12-20 05:07:40', '2021-12-20 05:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `name`, `created_at`, `updated_at`) VALUES
(3, 'PK', 'Pakistan', '2021-12-19 08:11:28', '2021-12-19 08:11:28'),
(4, 'IN', 'India', '2021-12-19 08:11:41', '2021-12-19 08:11:41'),
(5, 'USA', 'America', '2021-12-19 08:12:01', '2021-12-19 08:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin Department', '2021-12-20 07:01:41', '2021-12-20 07:01:41'),
(2, 'Finance department', '2021-12-20 07:01:54', '2021-12-20 07:13:46'),
(4, 'Employee Affairs', '2021-12-20 07:13:25', '2021-12-20 07:13:25');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `zip_code` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` datetime DEFAULT NULL,
  `date_hired` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `last_name`, `first_name`, `middle_name`, `address`, `department_id`, `country_id`, `state_id`, `city_id`, `zip_code`, `birthdate`, `date_hired`, `created_at`, `updated_at`) VALUES
(1, 'Hasnain', 'Ahmed', 'mughal', 'f-594, satellite town', 1, 3, 1, 1, '123', '2021-12-01 00:00:00', '2021-12-31 00:00:00', '2021-12-21 10:28:29', '2021-12-22 09:31:59'),
(9, 'Umer Khan', 'Ahmed', 'shums', 'f-594, satellite town', 2, 3, 1, 1, '123', '2021-12-04 00:00:00', '2021-12-08 00:00:00', '2021-12-22 04:57:35', '2021-12-22 09:32:15'),
(10, 'usman', 'Ahmed', 'khan', 'f-594, satellite town', 4, 5, 3, 7, '789', '2021-12-15 00:00:00', '2021-12-24 00:00:00', '2021-12-22 04:58:06', '2021-12-22 04:58:06'),
(11, 'khan', 'junaid', 'shumsy', 'f-594, satellite town', 2, 3, 1, 2, '789', '2021-12-09 00:00:00', '2021-12-09 00:00:00', '2021-12-22 04:58:54', '2021-12-22 04:58:54'),
(13, 'ibrahim', 'Ahmed', 'shumsy', 'f-594, satellite town', 1, 3, 1, 1, '456', '2021-12-02 00:00:00', '2021-12-18 00:00:00', '2021-12-22 08:50:16', '2021-12-22 08:50:16'),
(14, 'hamza', 'Rao', 'shumsy', 'f-594, satellite town', 2, 3, 1, 1, '123', '2021-12-01 00:00:00', '2021-12-15 00:00:00', '2021-12-22 08:53:41', '2021-12-22 08:53:41'),
(15, 'hamza', 'Rao', 'shumsy', 'f-594, satellite town', 2, 3, 1, 1, '123', '2021-12-01 00:00:00', '2021-12-15 00:00:00', '2021-12-22 08:54:05', '2021-12-22 08:54:05'),
(16, 'asd', 'Rao', 'asd', 'f-594, satellite town', 2, 3, 1, 2, 'ada', '2021-12-02 00:00:00', '2021-12-08 00:00:00', '2021-12-22 09:00:00', '2021-12-22 09:00:00'),
(17, 'aksd', 'Rao', 'asd', 'f-594, satellite town', 2, 3, 1, 2, 'asd', '2021-12-01 00:00:00', '2021-12-25 00:00:00', '2021-12-22 09:01:28', '2021-12-22 09:01:28'),
(18, 'kj', 'Rao', 'kjh', 'f-594, satellite town', 1, 3, 1, 1, 'mb', '2021-12-08 00:00:00', '2021-12-10 00:00:00', '2021-12-22 09:03:03', '2021-12-22 09:03:03'),
(19, ',jh', 'Rao', 'kug', 'f-594, satellite town', 1, 3, 1, 1, ',jb', '2021-12-08 00:00:00', '2021-12-08 00:00:00', '2021-12-22 09:04:08', '2021-12-22 09:04:08'),
(20, 'kjab', 'Rao', 'kajs', 'f-594, satellite town', 1, 3, 1, 1, ',mb', '2021-12-01 00:00:00', '2021-12-09 00:00:00', '2021-12-22 09:04:39', '2021-12-22 09:04:39'),
(21, ',b', 'Rao', 'mhv', 'f-594, satellite town', 1, 3, 1, 2, 'mbh', '2021-12-09 00:00:00', '2021-12-03 00:00:00', '2021-12-22 09:05:19', '2021-12-22 09:05:19'),
(22, 'lsdasd', 'Rao', 'asd', 'f-594, satellite town', 2, 3, 1, 1, 'asd', '2021-12-02 00:00:00', '2021-12-11 00:00:00', '2021-12-22 09:06:07', '2021-12-22 09:06:07'),
(23, 'jhv', 'Rao', 'jgv', 'f-594, satellite town', 1, 3, 1, 1, 'hjv', '2021-12-01 00:00:00', '2021-12-09 00:00:00', '2021-12-22 09:06:58', '2021-12-22 09:06:58'),
(24, 'kjb', 'Rao', 'mhv', 'f-594, satellite town', 1, 3, 1, 1, 'hkhb', '2021-12-01 00:00:00', '2021-12-11 00:00:00', '2021-12-22 09:17:27', '2021-12-22 09:17:27'),
(25, 'ku', 'Ahmed', 'hv', 'f-594, satellite town', 4, 3, 1, 1, 'jhv', '2021-12-01 00:00:00', '2021-12-25 00:00:00', '2021-12-22 09:22:01', '2021-12-22 09:22:01'),
(26, 'kuh', 'Rao', 'asd', 'f-594, satellite town', 1, 3, 1, 2, 'kjb', '2021-12-02 00:00:00', '2021-12-15 00:00:00', '2021-12-22 09:23:56', '2021-12-22 09:23:56'),
(27, 'mv', 'Rao', 'hv', 'f-594, satellite town', 1, 3, 1, 1, 'kjjb', '2021-12-02 00:00:00', '2021-12-23 00:00:00', '2021-12-22 09:30:13', '2021-12-22 09:30:13');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_16_102759_create_countries_table', 1),
(6, '2021_12_16_102831_create_states_table', 1),
(7, '2021_12_16_102905_create_cities_table', 1),
(8, '2021_12_16_102925_create_departments_table', 1),
(9, '2021_12_16_112630_create_employees_table', 1);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 3, 'Punjab', '2021-12-19 10:22:43', '2021-12-19 10:22:43'),
(2, 4, 'Mahrashtra', '2021-12-19 10:23:06', '2021-12-19 10:23:06'),
(3, 5, 'Miami', '2021-12-19 10:23:17', '2021-12-19 10:37:58'),
(5, 3, 'Sindh', '2021-12-19 10:23:42', '2021-12-19 10:23:42'),
(6, 5, 'Florida', '2021-12-19 10:40:02', '2021-12-19 10:40:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ahmedhasnainshumsy', 'ahmed', 'hasnain', 'ahmedhasnainmughal@gmail.com', NULL, '$2y$10$i8PuQsMnEqq8xaA8p96DVuzHNjYDNg3Gg7ixmG9oIKRG0xcR0dNQq', 'oW6amKr1hWIZtf9FXD2sCfJtjXjlkzqFtZsuG9K952LuARV5L6hhP8MOxUSC', '2021-12-16 07:03:02', '2021-12-17 08:34:01'),
(3, 'A_Umer_ (-_-)', 'ahmed', 'umer', 'umer@gmail.com', NULL, '$2y$10$ykoK3zYQqrAW59hxs7GdVu9dp6A1y.UcjNh.FidU7tmKEbq4RlsUC', NULL, '2021-12-16 10:42:01', '2021-12-16 10:42:01'),
(7, 'zain12345', 'ahmed', 'zain123', 'zain@gmail.com', NULL, '$2y$10$XmArvQG9kg0k6p/g7dnD7.5gE3a9SebWAJaPg2OdENDeD.FmPKo9m', NULL, '2021-12-17 08:59:51', '2021-12-19 05:19:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_department_id_foreign` (`department_id`),
  ADD KEY `employees_country_id_foreign` (`country_id`),
  ADD KEY `employees_state_id_foreign` (`state_id`),
  ADD KEY `employees_city_id_foreign` (`city_id`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

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
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `employees_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `employees_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
