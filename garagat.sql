-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 29 نوفمبر 2020 الساعة 02:13
-- إصدار الخادم: 5.6.41-84.1
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hexa_garagat`
--

-- --------------------------------------------------------

--
-- بنية الجدول `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `image`, `email_verified_at`, `password`, `remember_token`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Weenah', 'admin@weenah.com', NULL, NULL, '$2y$10$cyvG2Twq1QYIof0T3F3PAuuph/998Se9A6xow6GqlgxgSWduKutGy', NULL, 'active', NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(2, 'sereen saqer', 'sereensaqer1998@gmail.com', NULL, NULL, '$2y$10$XkGucbWkgP3STt5.bqMqquiZA0yyHeTKzjaCG4egcyZmskW2NTlHK', NULL, 'active', NULL, '2020-11-01 15:39:47', '2020-11-12 16:20:18'),
(3, 'sereen', 'sereensaqer@gmail.com', NULL, NULL, '$2y$10$FteY7YJ2Ywne3Du3AM7ywehOsxRiF1GXH0BiZtBuCsP933YmCrmwG', NULL, 'active', NULL, '2020-11-12 14:51:09', '2020-11-12 16:20:18'),
(4, 'TEST01', 'test@hexa.com', NULL, NULL, '$2y$10$dFVsv1zNzHunQL1gyUpA2eEPMHvGQbGfAtYOogcKwEu262kQStqZO', NULL, 'active', NULL, '2020-11-12 16:21:03', '2020-11-12 16:21:03'),
(5, 'test01', 'test012@hexa.com', NULL, NULL, '$2y$10$lln0iYSljCFY5OBMC3qjoeKM5soBtN2oWSWdXChj0Hdac5SgFyL3G', NULL, 'active', NULL, '2020-11-17 15:28:45', '2020-11-22 18:06:43');

-- --------------------------------------------------------

--
-- بنية الجدول `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `advertisements`
--

INSERT INTO `advertisements` (`id`, `image`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ads/gjFx05Ql6WpgfFLg8boPzZSN6CbYT2QQQn66YuJz.png', NULL, 'active', '2020-10-27 17:43:40', '2020-11-12 19:52:49'),
(2, 'ads/WWJTvWN8GURDEKGvxKenrTrVfbnYXHIM3IHfaGAs.jpeg', NULL, 'not_active', '2020-11-01 15:21:22', '2020-11-12 19:52:42'),
(3, 'ads/Zar0LxBpUve7RBF58odXeyoGXHj2qRPZy0zLTi7A.jpeg', NULL, 'not_active', '2020-11-11 14:55:29', '2020-11-12 19:52:42'),
(4, 'ads/hbYrO8jcbOENPyxZVfMSoEq6io04PXMJabkcy9DO.png', NULL, 'not_active', '2020-11-12 14:51:54', '2020-11-12 19:52:42');

-- --------------------------------------------------------

--
-- بنية الجدول `advertisement_translations`
--

CREATE TABLE `advertisement_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `advertisement_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `advertisement_translations`
--

INSERT INTO `advertisement_translations` (`id`, `locale`, `title`, `description`, `advertisement_id`, `created_at`, `updated_at`) VALUES
(1, 'ar', 'ads title', 'ads content', 1, '2020-10-27 17:43:40', '2020-10-27 17:59:24'),
(2, 'en', 'ads title', 'ads content', 1, '2020-10-27 17:43:40', '2020-10-27 17:59:24'),
(3, 'ar', 'تيست تيست', 'تيست تيست', 2, '2020-11-01 15:21:22', '2020-11-01 15:21:22'),
(4, 'en', 'Test Test', 'Test Test', 2, '2020-11-01 15:21:22', '2020-11-01 15:21:22'),
(5, 'ar', 'تست', 'aaa', 3, '2020-11-11 14:55:29', '2020-11-11 14:55:29'),
(6, 'en', 'test', 'aaa', 3, '2020-11-11 14:55:29', '2020-11-11 14:55:29'),
(7, 'ar', 'تيست تيست', 'تيست تيست تيست تيست تيست تيست', 4, '2020-11-12 14:51:54', '2020-11-12 14:51:54'),
(8, 'en', 'Test Test SS', 'Test Test SSTest Test SSTest Test SS', 4, '2020-11-12 14:51:54', '2020-11-12 14:51:54');

-- --------------------------------------------------------

--
-- بنية الجدول `car_types`
--

CREATE TABLE `car_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `car_types`
--

INSERT INTO `car_types` (`id`, `title`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Kia', 'active', NULL, NULL, NULL),
(2, 'Abarth', 'active', NULL, NULL, NULL),
(3, 'Acura', 'active', NULL, NULL, NULL),
(4, 'Aston Martin	', 'active', NULL, NULL, NULL),
(5, 'BMW', 'active', NULL, NULL, NULL),
(6, 'Buick', 'active', NULL, NULL, NULL),
(7, 'Cadillac', 'active', NULL, NULL, NULL),
(8, 'Chevrolet', 'active', NULL, NULL, NULL),
(9, 'Chrysler', 'active', NULL, NULL, NULL),
(10, 'Citreon', 'active', NULL, NULL, NULL),
(11, 'Dacia', 'active', NULL, NULL, NULL),
(12, 'Dodge', 'active', NULL, NULL, NULL),
(13, 'BMW', 'active', NULL, '2020-11-01 15:18:52', '2020-11-01 15:18:52'),
(14, 'BMWBMWBMW', 'not_active', NULL, '2020-11-12 14:48:39', '2020-11-22 18:14:31'),
(15, 'TEST001', 'not_active', NULL, '2020-11-12 16:17:22', '2020-11-22 18:13:55'),
(16, 'atest', 'not_active', NULL, '2020-11-22 18:14:09', '2020-11-22 18:14:24');

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `count_services` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`id`, `image`, `status`, `deleted_at`, `created_at`, `updated_at`, `count_services`) VALUES
(1, 'icon-car.svg', 'active', NULL, '2020-10-27 15:05:34', '2020-11-26 20:06:08', 1),
(2, 'icon-car.svg', 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 18:46:49', 2),
(3, 'icon-car.svg', 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:11:34', 0),
(4, 'icon-car.svg', 'active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:12:25', 0),
(5, 'icon-car.svg', 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:11:34', 0),
(6, 'icon-car.svg', 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:11:34', 0),
(7, 'icon-car.svg', 'active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:12:25', 0),
(8, 'icon-car.svg', 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:11:34', 0),
(9, 'icon-car.svg', 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 14:43:19', 0),
(10, 'categories/2jLU6xulbmcPn29kCIrh4ZMqb8df6qdCfx3b9G7E.jpeg', 'active', NULL, '2020-11-01 15:17:13', '2020-11-18 19:11:25', 1),
(11, 'categories/U1Uik5zjved4BNfw6YVCfBKrEbWNPakfTH7XdFtd.png', 'not_active', NULL, '2020-11-12 14:43:50', '2020-11-12 16:10:31', 0);

-- --------------------------------------------------------

--
-- بنية الجدول `category_translations`
--

CREATE TABLE `category_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `category_translations`
--

INSERT INTO `category_translations` (`id`, `locale`, `title`, `category_id`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'en', 'Bicycle Maintenance  1', 1, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'Bicycle-Maintenance--1'),
(2, 'ar', 'صيانة الدراجات  1', 1, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'صيانة-الدراجات--1'),
(3, 'en', 'Bicycle Maintenance  2', 2, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'Bicycle-Maintenance--2'),
(4, 'ar', 'صيانة الدراجات  2', 2, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'صيانة-الدراجات--2'),
(5, 'en', 'Bicycle Maintenance  3', 3, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'Bicycle-Maintenance--3'),
(6, 'ar', 'صيانة الدراجات  3', 3, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'صيانة-الدراجات--3'),
(7, 'en', 'Car Maintenance  1', 4, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'Car-Maintenance--1'),
(8, 'ar', 'صيانة السيارات  1', 4, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'صيانة-السيارات--1'),
(9, 'en', 'Car Maintenance  2', 5, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'Car-Maintenance--2'),
(10, 'ar', 'صيانة السيارات  2', 5, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'صيانة-السيارات--2'),
(11, 'en', 'Car Maintenance  3', 6, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'Car-Maintenance--3'),
(12, 'ar', 'صيانة السيارات  3', 6, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'صيانة-السيارات--3'),
(13, 'en', 'Steamer Maintenance  1', 7, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'Steamer-Maintenance--1'),
(14, 'ar', 'صيانة المراكب  1', 7, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'صيانة-المراكب--1'),
(15, 'en', 'Steamer Maintenance  2', 8, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'Steamer-Maintenance--2'),
(16, 'ar', 'صيانة المراكب  2', 8, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'صيانة-المراكب--2'),
(17, 'en', 'Steamer Maintenance  3', 9, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'Steamer-Maintenance--3'),
(18, 'ar', 'صيانة المراكب  3', 9, '2020-10-27 15:05:34', '2020-10-27 15:05:34', 'صيانة-المراكب--3'),
(19, 'ar', 'تيست تيست', 10, '2020-11-01 15:17:13', '2020-11-01 15:17:13', 'تيست-تيست'),
(20, 'en', 'Test Test123', 10, '2020-11-01 15:17:13', '2020-11-01 18:55:15', 'Test-Test123'),
(21, 'ar', 'تيست تيست', 11, '2020-11-12 14:43:50', '2020-11-12 14:43:50', 'تيست-تيست-1'),
(22, 'en', 'Test Test SS', 11, '2020-11-12 14:43:50', '2020-11-12 14:43:50', 'Test-Test-SS');

-- --------------------------------------------------------

--
-- بنية الجدول `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `description`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@hexa.com', '123321', 'test message', '2020-11-11 19:55:50', '2020-11-11 19:55:10', '2020-11-11 19:55:50'),
(3, '‏Emad', 'emad@hexacit.com', '5588447755', 'test ‎test ‎by ‎emad', NULL, '2020-11-18 19:08:39', '2020-11-18 19:08:39');

-- --------------------------------------------------------

--
-- بنية الجدول `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `finances`
--

CREATE TABLE `finances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `garage_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `txnId` bigint(20) UNSIGNED DEFAULT NULL,
  `merchantTxnId` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','rejected','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` double(8,2) DEFAULT NULL,
  `payment_response` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `finances`
--

INSERT INTO `finances` (`id`, `user_id`, `garage_id`, `plan_id`, `txnId`, `merchantTxnId`, `status`, `amount`, `payment_response`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 21, 1, 1, 4218560147609761, 1, 'completed', 300.00, NULL, NULL, '2020-11-22 18:43:34', '2020-11-22 19:04:45'),
(2, 21, 1, 1, 2682308571655007, 2, 'completed', 300.00, NULL, NULL, '2020-11-22 19:08:39', '2020-11-22 19:09:36'),
(3, 21, 1, 1, 7916269196506013, 3, 'completed', 300.00, NULL, NULL, '2020-11-24 13:38:58', '2020-11-24 14:44:50'),
(4, 21, 1, 1, NULL, NULL, 'pending', 300.00, NULL, NULL, '2020-11-24 13:59:59', '2020-11-24 13:59:59'),
(5, 21, 1, 1, NULL, NULL, 'pending', 300.00, NULL, NULL, '2020-11-24 14:00:31', '2020-11-24 14:00:31'),
(6, 21, 1, 1, NULL, NULL, 'pending', 300.00, NULL, NULL, '2020-11-24 14:01:07', '2020-11-24 14:01:07'),
(7, 21, 1, 1, NULL, NULL, 'pending', 300.00, NULL, NULL, '2020-11-24 14:12:02', '2020-11-24 14:12:02'),
(8, 21, 1, 1, NULL, NULL, 'pending', 300.00, NULL, NULL, '2020-11-24 14:26:27', '2020-11-24 14:26:27'),
(9, 21, 1, 1, NULL, NULL, 'pending', 300.00, NULL, NULL, '2020-11-24 14:35:12', '2020-11-24 14:35:12'),
(10, 21, 1, 1, 5291569879594414, 10, 'completed', 300.00, NULL, NULL, '2020-11-24 14:38:19', '2020-11-24 14:41:39'),
(11, 21, 1, 1, 7658936460182137, 11, 'completed', 300.00, NULL, NULL, '2020-11-24 14:51:22', '2020-11-24 14:52:26');

-- --------------------------------------------------------

--
-- بنية الجدول `garages`
--

CREATE TABLE `garages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `rate` double(8,2) NOT NULL DEFAULT '0.00',
  `count_reviewers` int(11) NOT NULL DEFAULT '0',
  `is_special` tinyint(1) NOT NULL DEFAULT '0',
  `amount` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `garages`
--

INSERT INTO `garages` (`id`, `user_id`, `category_id`, `lat`, `lng`, `deleted_at`, `created_at`, `updated_at`, `plan_id`, `start_date`, `end_date`, `status`, `rate`, `count_reviewers`, `is_special`, `amount`) VALUES
(1, 21, 1, '5050', '5050', NULL, '2020-10-27 15:05:38', '2020-11-29 02:08:23', 1, '2020-11-29 02:08:23', '2020-12-29 02:08:23', 'active', 2.93, 27, 1, 300.00),
(2, 22, 8, '52.467875', '34.08119', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(3, 23, 2, '-23.981153', '-77.381057', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(4, 24, 2, '69.367217', '1.433454', NULL, '2020-10-27 15:05:38', '2020-11-12 13:58:53', 1, '2020-11-12 13:58:53', '2020-11-15 13:58:53', 'active', 0.00, 0, 1, 300.00),
(5, 25, 2, '-55.493894', '-165.416297', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(6, 26, 8, '11.553811', '78.291628', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(7, 27, 5, '76.888209', '31.152879', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(8, 28, 9, '-89.937819', '-71.046673', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(9, 29, 5, '73.168445', '-81.716328', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(10, 30, 3, '57.285081', '-2.509577', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(11, 31, 3, '-34.007791', '78.107792', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(12, 32, 2, '-5.924924', '-159.093358', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(13, 33, 7, '-59.858579', '-72.114318', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(14, 34, 5, '30.881871', '-161.553091', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(15, 35, 3, '-89.143714', '-166.945584', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(16, 36, 4, '-4.511459', '-8.535782', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(17, 37, 8, '-85.821646', '-3.034275', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(18, 38, 2, '-37.419993', '97.18284', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(19, 39, 6, '-70.614776', '-171.782167', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(20, 40, 5, '52.404205', '-141.816486', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(21, 41, 3, '48.951119', '-122.502209', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(22, 42, 6, '77.243219', '122.184374', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(23, 43, 2, '44.968019', '93.317737', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(24, 44, 3, '66.102419', '69.780789', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(25, 45, 9, '85.457657', '-44.40417', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(26, 46, 5, '-0.694774', '131.02076', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(27, 47, 5, '-72.739073', '-123.069027', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(28, 48, 6, '1.411392', '70.177094', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(29, 49, 4, '57.987791', '60.898053', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(30, 50, 7, '18.257866', '-100.683828', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 1, '2020-10-27 05:00:00', '2020-10-30 05:00:00', 'active', 0.00, 0, 0, NULL),
(31, 51, 5, '31.537643199999998', '34.4465169', NULL, '2020-11-01 15:14:40', '2020-11-01 15:14:40', 1, '2020-11-01 15:14:40', '2020-11-04 15:14:40', 'active', 0.00, 0, 0, 300.00),
(32, 53, NULL, '37.785834', '-122.406417', NULL, '2020-11-01 17:13:50', '2020-11-01 17:13:50', NULL, NULL, NULL, 'not_active', 0.00, 0, 0, NULL),
(33, 55, 2, '-25.363', '131.044', NULL, '2020-11-11 14:51:12', '2020-11-12 13:56:22', 2, '2020-11-12 13:56:22', '2020-11-24 13:56:22', 'active', 5.00, 2, 0, 45.00),
(34, 59, 4, '31.537920599999996', '34.4469579', NULL, '2020-11-12 14:41:39', '2020-11-12 18:48:35', 2, '2020-11-12 18:48:35', '2020-11-24 18:48:35', 'active', 0.00, 0, 0, 45.00),
(35, 68, NULL, '31.5351627', '34.4635197', NULL, '2020-11-29 02:21:12', '2020-11-29 02:21:12', NULL, NULL, NULL, 'not_active', 0.00, 0, 0, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `garage_car_type`
--

CREATE TABLE `garage_car_type` (
  `garage_id` bigint(20) UNSIGNED NOT NULL,
  `car_type_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `garage_car_type`
--

INSERT INTO `garage_car_type` (`garage_id`, `car_type_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(2, 3),
(2, 4),
(2, 8),
(2, 11),
(3, 1),
(3, 2),
(3, 10),
(3, 11),
(4, 3),
(4, 4),
(4, 8),
(4, 11),
(5, 1),
(5, 2),
(5, 3),
(5, 10),
(6, 1),
(6, 2),
(6, 4),
(6, 10),
(7, 1),
(7, 4),
(7, 7),
(7, 10),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(9, 2),
(9, 3),
(9, 6),
(9, 8),
(10, 4),
(10, 9),
(10, 10),
(10, 11),
(11, 2),
(11, 4),
(11, 9),
(11, 12),
(12, 2),
(12, 5),
(12, 8),
(12, 12),
(13, 2),
(13, 5),
(13, 11),
(13, 12),
(14, 2),
(14, 7),
(14, 8),
(14, 9),
(15, 1),
(15, 5),
(15, 6),
(15, 8),
(16, 2),
(16, 3),
(16, 5),
(16, 12),
(17, 1),
(17, 5),
(17, 9),
(17, 12),
(18, 4),
(18, 9),
(18, 10),
(18, 11),
(19, 2),
(19, 5),
(19, 7),
(19, 10),
(20, 6),
(20, 9),
(20, 11),
(20, 12),
(21, 2),
(21, 4),
(21, 7),
(21, 10),
(22, 1),
(22, 2),
(22, 5),
(22, 8),
(23, 2),
(23, 7),
(23, 8),
(23, 9),
(24, 2),
(24, 6),
(24, 7),
(24, 9),
(25, 1),
(25, 2),
(25, 6),
(25, 8),
(26, 1),
(26, 5),
(26, 10),
(26, 11),
(27, 2),
(27, 3),
(27, 5),
(27, 11),
(28, 2),
(28, 6),
(28, 7),
(28, 10),
(29, 3),
(29, 4),
(29, 7),
(29, 9),
(30, 2),
(30, 3),
(30, 5),
(30, 9),
(31, 3),
(31, 5),
(33, 1),
(33, 2),
(33, 3),
(33, 4),
(33, 5),
(33, 6),
(33, 7),
(33, 8),
(33, 9),
(33, 10),
(33, 11),
(33, 12),
(33, 13),
(34, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `garage_images`
--

CREATE TABLE `garage_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `garage_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `garage_images`
--

INSERT INTO `garage_images` (`id`, `image`, `garage_id`, `created_at`, `updated_at`) VALUES
(1, 'slick.png', 1, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(5, 'slick.png', 2, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(6, 'slick.png', 2, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(7, 'slick.png', 2, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(8, 'slick.png', 2, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(9, 'slick.png', 3, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(10, 'slick.png', 3, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(11, 'slick.png', 3, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(12, 'slick.png', 3, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(13, 'slick.png', 4, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(14, 'slick.png', 4, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(15, 'slick.png', 4, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(16, 'slick.png', 4, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(17, 'slick.png', 5, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(18, 'slick.png', 5, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(19, 'slick.png', 5, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(20, 'slick.png', 5, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(21, 'slick.png', 6, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(22, 'slick.png', 6, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(23, 'slick.png', 6, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(24, 'slick.png', 6, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(25, 'slick.png', 7, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(26, 'slick.png', 7, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(27, 'slick.png', 7, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(28, 'slick.png', 7, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(29, 'slick.png', 8, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(30, 'slick.png', 8, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(31, 'slick.png', 8, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(32, 'slick.png', 8, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(33, 'slick.png', 9, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(34, 'slick.png', 9, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(35, 'slick.png', 9, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(36, 'slick.png', 9, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(37, 'slick.png', 10, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(38, 'slick.png', 10, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(39, 'slick.png', 10, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(40, 'slick.png', 10, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(41, 'slick.png', 11, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(42, 'slick.png', 11, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(43, 'slick.png', 11, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(44, 'slick.png', 11, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(45, 'slick.png', 12, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(46, 'slick.png', 12, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(47, 'slick.png', 12, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(48, 'slick.png', 12, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(49, 'slick.png', 13, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(50, 'slick.png', 13, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(51, 'slick.png', 13, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(52, 'slick.png', 13, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(53, 'slick.png', 14, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(54, 'slick.png', 14, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(55, 'slick.png', 14, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(56, 'slick.png', 14, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(57, 'slick.png', 15, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(58, 'slick.png', 15, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(59, 'slick.png', 15, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(60, 'slick.png', 15, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(61, 'slick.png', 16, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(62, 'slick.png', 16, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(63, 'slick.png', 16, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(64, 'slick.png', 16, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(65, 'slick.png', 17, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(66, 'slick.png', 17, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(67, 'slick.png', 17, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(68, 'slick.png', 17, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(69, 'slick.png', 18, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(70, 'slick.png', 18, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(71, 'slick.png', 18, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(72, 'slick.png', 18, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(73, 'slick.png', 19, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(74, 'slick.png', 19, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(75, 'slick.png', 19, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(76, 'slick.png', 19, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(77, 'slick.png', 20, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(78, 'slick.png', 20, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(79, 'slick.png', 20, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(80, 'slick.png', 20, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(81, 'slick.png', 21, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(82, 'slick.png', 21, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(83, 'slick.png', 21, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(84, 'slick.png', 21, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(85, 'slick.png', 22, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(86, 'slick.png', 22, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(87, 'slick.png', 22, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(88, 'slick.png', 22, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(89, 'slick.png', 23, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(90, 'slick.png', 23, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(91, 'slick.png', 23, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(92, 'slick.png', 23, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(93, 'slick.png', 24, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(94, 'slick.png', 24, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(95, 'slick.png', 24, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(96, 'slick.png', 24, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(97, 'slick.png', 25, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(98, 'slick.png', 25, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(99, 'slick.png', 25, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(100, 'slick.png', 25, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(101, 'slick.png', 26, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(102, 'slick.png', 26, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(103, 'slick.png', 26, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(104, 'slick.png', 26, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(105, 'slick.png', 27, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(106, 'slick.png', 27, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(107, 'slick.png', 27, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(108, 'slick.png', 27, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(109, 'slick.png', 28, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(110, 'slick.png', 28, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(111, 'slick.png', 28, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(112, 'slick.png', 28, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(113, 'slick.png', 29, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(114, 'slick.png', 29, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(115, 'slick.png', 29, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(116, 'slick.png', 29, '2020-10-27 15:05:39', '2020-10-27 15:05:39'),
(117, 'slick.png', 30, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(118, 'slick.png', 30, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(119, 'slick.png', 30, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(120, 'slick.png', 30, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(121, 'garages/UFw9CkgOb0jVQUbkkJvRjKeX24A3Wm1uW079tQmR.jpeg', 31, '2020-11-01 15:14:40', '2020-11-01 15:14:40'),
(123, 'garages/efQl8dzoJ9VNJb3TFJ7fZ1mP7mtVSNKwFPXIy9bj.jpeg', 1, '2020-11-07 00:57:50', '2020-11-07 00:57:50'),
(124, 'garages/9VPOBCzfqnlT35qKxivDnUMtbztLzSysgAtszZsD.jpeg', 33, '2020-11-11 14:51:12', '2020-11-11 14:51:12'),
(125, 'garages/4cNXOHurgjtiyTEBBmqbZ7A48U8OWV8PilO29XTW.png', 34, '2020-11-12 14:41:39', '2020-11-12 14:41:39'),
(126, 'garages/xuMbcKxmWykpYRYxzOIvDrY1cCJDdW6wNu3u8m1D.jpeg', 1, '2020-11-19 18:21:00', '2020-11-19 18:21:00');

-- --------------------------------------------------------

--
-- بنية الجدول `garage_requests`
--

CREATE TABLE `garage_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('accepted','rejected','waiting') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commercial_license_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reason_reject_message` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `garage_requests`
--

INSERT INTO `garage_requests` (`id`, `lat`, `lng`, `owner_name`, `mobile`, `status`, `email`, `logo`, `commercial_license_image`, `created_at`, `updated_at`, `reason_reject_message`) VALUES
(1, '335.75', '205.72', 'yehia  1', '123456789', 'waiting', 'email@email.com', 'garages/ejEFPEuVzZiyIkBTmomhObSPugkJaNAVs3As7QCr.jpeg', 'commercial_license_image/hSp5mB0jMxanBonrYUDjejf0SqDMaror7aqD1pJJ.jpeg', '2020-11-01 13:32:14', '2020-11-01 13:32:14', NULL),
(2, '335.75', '205.72', 'yehia  1', '123456789', 'waiting', 'email@email.com', 'garages/yHAej1BDZ92TARzMOoi5HRNMkaTTgto0PskbdJyO.jpeg', 'commercial_license_image/QeCyxnKua1PkPDWrD27BvaRCS7nAmU6R2RW2llWt.jpeg', '2020-11-01 13:45:30', '2020-11-01 13:45:30', NULL),
(3, '37.785834', '-122.406417', 'Mosab', '12345678', 'accepted', 'mosabgarage@gmail.com', 'garages/2s9yTz5575xkKBcu3cSH6LtCaLMjbBUAlGuqryTV.jpeg', 'commercial_license_image/tMmEUNGheCfYfqDx23xWJcxbbHAcuUmmRk9G0hXF.jpeg', '2020-11-01 14:11:47', '2020-11-01 17:13:50', NULL),
(4, '335.75', '205.72', 'yehia  1', '123456789', 'waiting', 'elassoulidev@gmail.com', 'garages/ZrBazfMk0hGYBkbwYniKH1fQehbk5g8tNmcrhPIu.jpeg', 'commercial_license_image/iEy3ywT9Jcz2C16fvMPzYrRj5nX4SfVlaD6DFn5e.jpeg', '2020-11-01 15:53:52', '2020-11-01 15:53:52', NULL),
(5, '31.5379874', '34.4469941', 'sereen ‎', '0598563124', 'waiting', 'sereen97@gmail.com', 'garages/52k7GzDjW0P5FZwT6fTsqrazBECaxWu5CxELxqce.jpeg', 'commercial_license_image/Tckka7gPv6ZKz2hjojNsIeeu3AGSQO7fZtsSH7e6.jpeg', '2020-11-12 15:05:13', '2020-11-12 15:05:13', NULL),
(6, '31.5380019', '34.4470041', 'Sereen98', '0593362415', 'waiting', 'seree98@gmail.com', 'garages/OcRoxsX0Ogbtlv8n8ZECKh5SnSCgnFJbf6CLUzRu.jpeg', 'commercial_license_image/mPegyZ0CaW7FSO5iMLOEKUV4eEeNHnvXUWsGLOKf.jpeg', '2020-11-12 15:09:03', '2020-11-12 15:09:03', NULL),
(7, '31.5016503', '34.4345349', 'test1', '123', 'waiting', 'ggg@gmai.com', 'garages/gjpcH7TqCx5FnWBRCWFCaJDCb2nBrYjri6K4P0V9.jpeg', 'commercial_license_image/JxMh88qOetvk0Gbnuv5PYUTL25bebYM5NlFwFKTo.jpeg', '2020-11-15 15:11:37', '2020-11-15 15:11:37', NULL),
(8, '31.5351627', '34.4635197', 'عماد', '868356865', 'accepted', 'emadtraner@gmail.com', 'garages/MCQFD24t0TKflSwa6YU9ZOjI3fGI4Yb8vUlIKgLz.jpeg', 'commercial_license_image/rmJ1dB6USKW8opcy41gbncLsYCtKYZeRkzyjVEe0.jpeg', '2020-11-28 02:12:40', '2020-11-29 02:21:12', NULL),
(9, '31.5329962', '34.4734679', 'ali', '54477560', 'waiting', 'test@ggg.com', 'garages/VmIt4lgZltMPUhZJOzXLH45Zo51GmC2jj1LXnBAD.jpeg', 'commercial_license_image/lMLAhkYrTKoKbO59S0CHRax3TakdaGbLJk3oTo0I.jpeg', '2020-11-28 02:14:48', '2020-11-28 02:14:48', NULL),
(10, '37.78583393502708', '-122.40641713142396', 'test name', '12345678', 'waiting', 'test@gmail.com', 'garages/HQNjHzgetaT2CsCT3ViG6FUtbKZqv3QQ4gzXkUJO.jpeg', 'commercial_license_image/zgBH9HL4u0JLu48ILxen8JFmrpSN3snTvEFcy4y4.jpeg', '2020-11-28 21:11:23', '2020-11-28 21:11:23', NULL),
(11, '37.78583393502708', '-122.40641713142396', 'jgfgjdfgdf', '354535', 'waiting', 'gfdgd@g.com', 'garages/QzHpLI7KtlQdsrnERu9bDeTdACFdurCJ6RCVktNh.jpeg', 'commercial_license_image/gQa4sBjNjsv6QMzTHx10qVm4Y4LX6tmKp77YfVZO.jpeg', '2020-11-28 21:21:54', '2020-11-28 21:21:54', NULL),
(12, '31.5282411', '34.4566021', 'عبد العزيز', '8558882555', 'waiting', 'qds@gmail.com', 'garages/xScwbH1eaIOvC0cwydIuDixjuAujxvicjGrshVMi.jpeg', 'commercial_license_image/kLmR5UGmDoZcxz7JhdH4wd9UBuYMFoTgZHam0VIh.jpeg', '2020-11-28 22:28:50', '2020-11-28 22:28:50', NULL),
(13, '31.535206', '34.46425429999999', 'فيصل', '8800880088', 'waiting', 'rami@gmail.com', 'garages/oqiHm5qYagIDxfJpKvyao7fNnD5cAlOIsccBDbrb.png', 'commercial_license_image/exr8s0N1gDFOWfOIi8lBxaNuv5waM6n09txgv4js.jpeg', '2020-11-29 13:22:16', '2020-11-29 13:22:16', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `garage_request_translations`
--

CREATE TABLE `garage_request_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `garage_request_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `garage_request_translations`
--

INSERT INTO `garage_request_translations` (`id`, `locale`, `title`, `description`, `address`, `garage_request_id`, `created_at`, `updated_at`) VALUES
(1, 'ar', 'garage one', 'test test', 'gaza', 1, '2020-11-01 13:32:14', '2020-11-01 13:32:14'),
(2, 'en', 'garage test', 'testetsasd', 'gazaaaa', 1, '2020-11-01 13:32:14', '2020-11-01 13:32:14'),
(3, 'ar', 'garage one', 'test test', 'gaza', 2, '2020-11-01 13:45:30', '2020-11-01 13:45:30'),
(4, 'en', 'garage test', 'testetsasd', 'gazaaaa', 2, '2020-11-01 13:45:30', '2020-11-01 13:45:30'),
(5, 'ar', 'كراج ‏مصعب', 'وصف الكراج', 'العنوان', 3, '2020-11-01 14:11:47', '2020-11-01 14:11:47'),
(6, 'en', 'mosab ‎garage', 'garage description', 'address ‎', 3, '2020-11-01 14:11:47', '2020-11-01 14:11:47'),
(7, 'ar', 'garage one', 'test test', 'gaza', 4, '2020-11-01 15:53:52', '2020-11-01 15:53:52'),
(8, 'en', 'garage test', 'testetsasd', 'gazaaaa', 4, '2020-11-01 15:53:52', '2020-11-01 15:53:52'),
(9, 'ar', 'كراح', 'تسيت س تيست', 'غزة', 5, '2020-11-12 15:05:13', '2020-11-12 15:05:13'),
(10, 'en', 'garage', 'Test S Test', 'gaza', 5, '2020-11-12 15:05:13', '2020-11-12 15:05:13'),
(11, 'ar', 'تيست', 'تيسسست', 'غزة', 6, '2020-11-12 15:09:03', '2020-11-12 15:09:03'),
(12, 'en', 'test', 'tessst', 'gaza', 6, '2020-11-12 15:09:03', '2020-11-12 15:09:03'),
(13, 'ar', 'tets', 'a', 'aa', 7, '2020-11-15 15:11:37', '2020-11-15 15:11:37'),
(14, 'en', 'test', 'a', 'aa', 7, '2020-11-15 15:11:37', '2020-11-15 15:11:37'),
(15, 'ar', 'عماد', 'كراج للفحص', 'الكويت', 8, '2020-11-28 02:12:40', '2020-11-28 02:12:40'),
(16, 'en', 'Emad', 'test garage', 'kw', 8, '2020-11-28 02:12:40', '2020-11-28 02:12:40'),
(17, 'ar', 'كراج المحبة', 'فحص انشاء حساب كراج', 'الكويت', 9, '2020-11-28 02:14:48', '2020-11-28 02:14:48'),
(18, 'en', 'test garsge', 'test', 'kw', 9, '2020-11-28 02:14:48', '2020-11-28 02:14:48'),
(19, 'ar', 'test ar', 'test desc ar', 'address ar', 10, '2020-11-28 21:11:23', '2020-11-28 21:11:23'),
(20, 'en', 'test en', 'test desc en', 'address en', 10, '2020-11-28 21:11:23', '2020-11-28 21:11:23'),
(21, 'ar', 'gfdgd', 'gfdgdfg', 'gfdg', 11, '2020-11-28 21:21:54', '2020-11-28 21:21:54'),
(22, 'en', 'fdgdfgd', 'fdgdfg', 'gfdgdfgfdg', 11, '2020-11-28 21:21:54', '2020-11-28 21:21:54'),
(23, 'ar', 'القدس', 'القدس القدس', 'الكويت', 12, '2020-11-28 22:28:50', '2020-11-28 22:28:50'),
(24, 'en', 'quds', 'test', '‏kkw', 12, '2020-11-28 22:28:50', '2020-11-28 22:28:50'),
(25, 'ar', 'القاهرة', 'فحص بالعربي', 'الكويت', 13, '2020-11-29 13:22:16', '2020-11-29 13:22:16'),
(26, 'en', 'AlQahera', 'test in english', '‏kkw', 13, '2020-11-29 13:22:16', '2020-11-29 13:22:16');

-- --------------------------------------------------------

--
-- بنية الجدول `garage_reviews`
--

CREATE TABLE `garage_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `garage_id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `garage_reviews`
--

INSERT INTO `garage_reviews` (`id`, `user_id`, `garage_id`, `content`, `rate`, `created_at`, `updated_at`, `order_id`) VALUES
(1, 1, 1, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(2, 1, 2, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(3, 1, 3, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(4, 1, 4, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(5, 1, 5, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(6, 1, 6, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(7, 1, 7, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(8, 1, 8, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(9, 1, 9, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(10, 1, 10, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(11, 1, 11, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(12, 1, 12, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(13, 1, 13, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(14, 1, 14, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(15, 1, 15, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(16, 1, 16, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(17, 1, 17, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(18, 1, 18, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(19, 1, 19, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(20, 1, 20, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(21, 1, 21, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(22, 1, 22, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(23, 1, 23, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(24, 1, 24, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(25, 1, 25, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(26, 1, 26, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(27, 1, 27, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(28, 1, 28, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(29, 1, 29, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(30, 1, 30, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(31, 2, 1, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(32, 2, 2, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(33, 2, 3, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(34, 2, 4, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(35, 2, 5, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(36, 2, 6, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(37, 2, 7, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(38, 2, 8, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(39, 2, 9, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(40, 2, 10, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(41, 2, 11, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(42, 2, 12, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(43, 2, 13, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(44, 2, 14, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(45, 2, 15, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(46, 2, 16, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(47, 2, 17, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(48, 2, 18, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(49, 2, 19, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(50, 2, 20, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(51, 2, 21, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(52, 2, 22, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(53, 2, 23, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(54, 2, 24, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(55, 2, 25, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(56, 2, 26, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(57, 2, 27, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(58, 2, 28, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(59, 2, 29, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(60, 2, 30, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(61, 3, 1, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(62, 3, 2, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(63, 3, 3, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(64, 3, 4, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(65, 3, 5, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(66, 3, 6, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(67, 3, 7, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(68, 3, 8, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(69, 3, 9, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(70, 3, 10, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(71, 3, 11, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(72, 3, 12, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(73, 3, 13, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(74, 3, 14, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(75, 3, 15, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(76, 3, 16, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(77, 3, 17, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(78, 3, 18, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(79, 3, 19, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(80, 3, 20, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(81, 3, 21, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(82, 3, 22, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(83, 3, 23, 'the best garage', 2.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(84, 3, 24, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(85, 3, 25, 'the best garage', 1.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(86, 3, 26, 'the best garage', 4.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(87, 3, 27, 'the best garage', 5.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(88, 3, 28, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(89, 3, 29, 'the best garage', 3.00, '2020-10-27 15:06:18', '2020-10-27 15:06:18', NULL),
(90, 3, 30, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(91, 4, 1, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(92, 4, 2, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(93, 4, 3, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(94, 4, 4, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(95, 4, 5, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(96, 4, 6, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(97, 4, 7, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(98, 4, 8, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(99, 4, 9, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(100, 4, 10, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(101, 4, 11, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(102, 4, 12, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(103, 4, 13, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(104, 4, 14, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(105, 4, 15, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(106, 4, 16, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(107, 4, 17, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(108, 4, 18, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(109, 4, 19, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(110, 4, 20, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(111, 4, 21, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(112, 4, 22, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(113, 4, 23, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(114, 4, 24, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(115, 4, 25, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(116, 4, 26, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(117, 4, 27, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(118, 4, 28, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(119, 4, 29, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(120, 4, 30, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(121, 5, 1, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(122, 5, 2, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(123, 5, 3, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(124, 5, 4, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(125, 5, 5, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(126, 5, 6, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(127, 5, 7, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(128, 5, 8, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(129, 5, 9, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(130, 5, 10, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(131, 5, 11, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(132, 5, 12, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(133, 5, 13, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(134, 5, 14, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(135, 5, 15, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(136, 5, 16, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(137, 5, 17, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(138, 5, 18, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(139, 5, 19, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(140, 5, 20, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(141, 5, 21, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(142, 5, 22, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(143, 5, 23, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(144, 5, 24, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(145, 5, 25, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(146, 5, 26, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(147, 5, 27, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(148, 5, 28, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(149, 5, 29, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(150, 5, 30, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(151, 6, 1, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(152, 6, 2, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(153, 6, 3, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(154, 6, 4, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(155, 6, 5, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(156, 6, 6, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(157, 6, 7, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(158, 6, 8, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(159, 6, 9, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(160, 6, 10, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(161, 6, 11, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(162, 6, 12, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(163, 6, 13, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(164, 6, 14, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(165, 6, 15, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(166, 6, 16, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(167, 6, 17, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(168, 6, 18, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(169, 6, 19, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(170, 6, 20, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(171, 6, 21, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(172, 6, 22, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(173, 6, 23, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(174, 6, 24, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(175, 6, 25, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(176, 6, 26, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(177, 6, 27, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(178, 6, 28, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(179, 6, 29, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(180, 6, 30, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(181, 7, 1, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(182, 7, 2, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(183, 7, 3, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(184, 7, 4, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(185, 7, 5, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(186, 7, 6, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(187, 7, 7, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(188, 7, 8, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(189, 7, 9, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(190, 7, 10, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(191, 7, 11, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(192, 7, 12, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(193, 7, 13, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(194, 7, 14, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(195, 7, 15, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(196, 7, 16, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(197, 7, 17, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(198, 7, 18, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(199, 7, 19, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(200, 7, 20, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(201, 7, 21, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(202, 7, 22, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(203, 7, 23, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(204, 7, 24, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(205, 7, 25, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(206, 7, 26, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(207, 7, 27, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(208, 7, 28, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(209, 7, 29, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(210, 7, 30, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(211, 8, 1, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(212, 8, 2, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(213, 8, 3, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(214, 8, 4, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(215, 8, 5, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(216, 8, 6, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(217, 8, 7, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(218, 8, 8, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(219, 8, 9, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(220, 8, 10, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(221, 8, 11, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(222, 8, 12, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(223, 8, 13, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(224, 8, 14, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(225, 8, 15, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(226, 8, 16, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(227, 8, 17, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(228, 8, 18, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(229, 8, 19, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(230, 8, 20, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(231, 8, 21, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(232, 8, 22, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(233, 8, 23, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(234, 8, 24, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(235, 8, 25, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(236, 8, 26, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(237, 8, 27, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(238, 8, 28, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(239, 8, 29, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(240, 8, 30, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(241, 9, 1, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(242, 9, 2, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(243, 9, 3, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(244, 9, 4, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(245, 9, 5, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(246, 9, 6, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(247, 9, 7, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(248, 9, 8, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(249, 9, 9, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(250, 9, 10, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(251, 9, 11, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(252, 9, 12, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(253, 9, 13, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(254, 9, 14, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(255, 9, 15, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(256, 9, 16, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(257, 9, 17, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(258, 9, 18, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(259, 9, 19, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(260, 9, 20, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(261, 9, 21, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(262, 9, 22, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(263, 9, 23, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(264, 9, 24, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(265, 9, 25, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(266, 9, 26, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(267, 9, 27, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(268, 9, 28, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(269, 9, 29, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(270, 9, 30, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(271, 10, 1, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(272, 10, 2, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(273, 10, 3, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(274, 10, 4, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(275, 10, 5, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(276, 10, 6, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(277, 10, 7, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(278, 10, 8, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(279, 10, 9, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(280, 10, 10, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(281, 10, 11, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(282, 10, 12, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(283, 10, 13, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(284, 10, 14, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(285, 10, 15, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(286, 10, 16, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(287, 10, 17, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(288, 10, 18, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(289, 10, 19, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(290, 10, 20, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(291, 10, 21, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(292, 10, 22, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(293, 10, 23, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(294, 10, 24, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(295, 10, 25, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(296, 10, 26, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(297, 10, 27, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(298, 10, 28, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(299, 10, 29, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(300, 10, 30, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(301, 11, 1, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(302, 11, 2, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(303, 11, 3, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(304, 11, 4, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(305, 11, 5, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(306, 11, 6, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(307, 11, 7, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(308, 11, 8, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(309, 11, 9, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(310, 11, 10, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(311, 11, 11, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(312, 11, 12, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(313, 11, 13, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(314, 11, 14, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(315, 11, 15, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(316, 11, 16, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(317, 11, 17, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(318, 11, 18, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(319, 11, 19, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(320, 11, 20, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(321, 11, 21, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(322, 11, 22, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(323, 11, 23, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(324, 11, 24, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(325, 11, 25, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(326, 11, 26, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(327, 11, 27, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(328, 11, 28, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(329, 11, 29, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(330, 11, 30, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(331, 12, 1, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(332, 12, 2, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(333, 12, 3, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(334, 12, 4, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(335, 12, 5, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(336, 12, 6, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(337, 12, 7, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(338, 12, 8, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(339, 12, 9, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(340, 12, 10, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(341, 12, 11, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(342, 12, 12, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(343, 12, 13, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(344, 12, 14, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(345, 12, 15, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(346, 12, 16, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(347, 12, 17, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(348, 12, 18, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(349, 12, 19, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(350, 12, 20, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(351, 12, 21, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(352, 12, 22, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(353, 12, 23, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(354, 12, 24, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(355, 12, 25, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(356, 12, 26, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(357, 12, 27, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(358, 12, 28, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(359, 12, 29, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(360, 12, 30, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(361, 13, 1, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(362, 13, 2, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(363, 13, 3, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(364, 13, 4, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(365, 13, 5, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(366, 13, 6, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(367, 13, 7, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(368, 13, 8, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(369, 13, 9, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(370, 13, 10, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(371, 13, 11, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(372, 13, 12, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(373, 13, 13, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(374, 13, 14, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(375, 13, 15, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(376, 13, 16, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(377, 13, 17, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(378, 13, 18, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(379, 13, 19, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(380, 13, 20, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(381, 13, 21, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(382, 13, 22, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(383, 13, 23, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(384, 13, 24, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(385, 13, 25, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(386, 13, 26, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(387, 13, 27, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(388, 13, 28, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(389, 13, 29, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(390, 13, 30, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(391, 14, 1, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(392, 14, 2, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(393, 14, 3, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(394, 14, 4, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(395, 14, 5, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(396, 14, 6, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(397, 14, 7, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(398, 14, 8, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(399, 14, 9, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(400, 14, 10, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(401, 14, 11, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(402, 14, 12, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(403, 14, 13, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(404, 14, 14, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(405, 14, 15, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(406, 14, 16, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(407, 14, 17, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(408, 14, 18, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(409, 14, 19, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(410, 14, 20, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(411, 14, 21, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(412, 14, 22, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(413, 14, 23, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(414, 14, 24, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(415, 14, 25, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(416, 14, 26, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(417, 14, 27, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(418, 14, 28, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(419, 14, 29, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(420, 14, 30, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(421, 15, 1, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(422, 15, 2, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(423, 15, 3, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(424, 15, 4, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(425, 15, 5, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(426, 15, 6, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(427, 15, 7, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(428, 15, 8, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(429, 15, 9, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(430, 15, 10, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(431, 15, 11, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(432, 15, 12, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(433, 15, 13, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(434, 15, 14, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(435, 15, 15, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(436, 15, 16, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(437, 15, 17, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(438, 15, 18, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(439, 15, 19, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(440, 15, 20, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(441, 15, 21, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(442, 15, 22, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(443, 15, 23, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(444, 15, 24, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(445, 15, 25, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(446, 15, 26, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(447, 15, 27, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(448, 15, 28, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(449, 15, 29, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(450, 15, 30, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(451, 16, 1, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(452, 16, 2, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(453, 16, 3, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(454, 16, 4, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(455, 16, 5, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(456, 16, 6, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(457, 16, 7, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(458, 16, 8, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(459, 16, 9, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(460, 16, 10, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(461, 16, 11, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(462, 16, 12, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(463, 16, 13, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(464, 16, 14, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(465, 16, 15, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(466, 16, 16, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(467, 16, 17, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(468, 16, 18, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(469, 16, 19, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(470, 16, 20, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(471, 16, 21, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(472, 16, 22, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(473, 16, 23, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(474, 16, 24, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(475, 16, 25, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(476, 16, 26, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(477, 16, 27, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(478, 16, 28, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(479, 16, 29, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(480, 16, 30, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(481, 17, 1, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(482, 17, 2, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(483, 17, 3, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(484, 17, 4, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(485, 17, 5, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(486, 17, 6, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(487, 17, 7, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(488, 17, 8, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(489, 17, 9, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(490, 17, 10, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(491, 17, 11, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(492, 17, 12, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(493, 17, 13, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(494, 17, 14, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(495, 17, 15, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(496, 17, 16, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(497, 17, 17, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(498, 17, 18, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(499, 17, 19, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(500, 17, 20, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(501, 17, 21, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(502, 17, 22, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(503, 17, 23, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(504, 17, 24, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(505, 17, 25, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(506, 17, 26, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(507, 17, 27, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(508, 17, 28, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(509, 17, 29, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(510, 17, 30, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(511, 18, 1, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(512, 18, 2, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(513, 18, 3, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(514, 18, 4, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(515, 18, 5, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(516, 18, 6, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(517, 18, 7, 'the best garage', 5.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(518, 18, 8, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(519, 18, 9, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(520, 18, 10, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(521, 18, 11, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(522, 18, 12, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(523, 18, 13, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(524, 18, 14, 'the best garage', 4.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(525, 18, 15, 'the best garage', 2.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(526, 18, 16, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(527, 18, 17, 'the best garage', 1.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(528, 18, 18, 'the best garage', 3.00, '2020-10-27 15:06:19', '2020-10-27 15:06:19', NULL),
(529, 18, 19, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(530, 18, 20, 'the best garage', 2.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(531, 18, 21, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(532, 18, 22, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(533, 18, 23, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(534, 18, 24, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(535, 18, 25, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(536, 18, 26, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(537, 18, 27, 'the best garage', 2.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(538, 18, 28, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(539, 18, 29, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(540, 18, 30, 'the best garage', 2.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(541, 19, 1, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(542, 19, 2, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(543, 19, 3, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(544, 19, 4, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(545, 19, 5, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(546, 19, 6, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(547, 19, 7, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(548, 19, 8, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(549, 19, 9, 'the best garage', 2.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(550, 19, 10, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(551, 19, 11, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(552, 19, 12, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(553, 19, 13, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(554, 19, 14, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(555, 19, 15, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(556, 19, 16, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(557, 19, 17, 'the best garage', 2.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(558, 19, 18, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(559, 19, 19, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(560, 19, 20, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL);
INSERT INTO `garage_reviews` (`id`, `user_id`, `garage_id`, `content`, `rate`, `created_at`, `updated_at`, `order_id`) VALUES
(561, 19, 21, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(562, 19, 22, 'the best garage', 2.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(563, 19, 23, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(564, 19, 24, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(565, 19, 25, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(566, 19, 26, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(567, 19, 27, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(568, 19, 28, 'the best garage', 2.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(569, 19, 29, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(570, 19, 30, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(571, 20, 1, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(572, 20, 2, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(573, 20, 3, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(574, 20, 4, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(575, 20, 5, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(576, 20, 6, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(577, 20, 7, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(578, 20, 8, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(579, 20, 9, 'the best garage', 2.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(580, 20, 10, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(581, 20, 11, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(582, 20, 12, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(583, 20, 13, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(584, 20, 14, 'the best garage', 2.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(585, 20, 15, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(586, 20, 16, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(587, 20, 17, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(588, 20, 18, 'the best garage', 2.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(589, 20, 19, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(590, 20, 20, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(591, 20, 21, 'the best garage', 4.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(592, 20, 22, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(593, 20, 23, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(594, 20, 24, 'the best garage', 1.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(595, 20, 25, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(596, 20, 26, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(597, 20, 27, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(598, 20, 28, 'the best garage', 2.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(599, 20, 29, 'the best garage', 5.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(600, 20, 30, 'the best garage', 3.00, '2020-10-27 15:06:20', '2020-10-27 15:06:20', NULL),
(601, 1, 1, 'very good.', 4.00, '2020-10-29 16:54:29', '2020-10-29 16:54:29', 2),
(602, 57, 33, 'go0od , test', 5.00, '2020-11-11 15:56:00', '2020-11-11 15:56:00', 12),
(603, 58, 33, 'good', 5.00, '2020-11-11 19:36:29', '2020-11-11 19:36:29', 13),
(605, 64, 1, 'رائع', 4.00, '2020-11-20 17:32:21', '2020-11-20 17:32:21', 24),
(606, 64, 1, 'بسم الله', 2.00, '2020-11-20 17:34:16', '2020-11-20 17:34:16', 23),
(607, 64, 1, 'تمام التمام', 3.00, '2020-11-26 21:32:45', '2020-11-26 21:32:45', 26),
(608, 1, 1, 'جيد جدا', 3.00, '2020-11-26 21:46:49', '2020-11-26 21:46:49', 19),
(609, 1, 1, 'good', 4.00, '2020-11-27 07:43:13', '2020-11-27 07:43:13', 18),
(610, 1, 1, 'جيد', 2.00, '2020-11-27 11:09:00', '2020-11-27 11:09:00', 25);

-- --------------------------------------------------------

--
-- بنية الجدول `garage_service`
--

CREATE TABLE `garage_service` (
  `garage_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `garage_service`
--

INSERT INTO `garage_service` (`garage_id`, `service_id`) VALUES
(1, 1),
(1, 10),
(1, 19),
(2, 8),
(2, 17),
(2, 26),
(3, 2),
(3, 11),
(3, 20),
(4, 2),
(4, 11),
(4, 20),
(5, 2),
(5, 11),
(5, 20),
(6, 8),
(6, 17),
(6, 26),
(7, 5),
(7, 14),
(7, 23),
(8, 9),
(8, 18),
(8, 27),
(9, 5),
(9, 14),
(9, 23),
(10, 3),
(10, 12),
(10, 21),
(11, 3),
(11, 12),
(11, 21),
(12, 2),
(12, 11),
(12, 20),
(13, 7),
(13, 16),
(13, 25),
(14, 5),
(14, 14),
(14, 23),
(15, 3),
(15, 12),
(15, 21),
(16, 4),
(16, 13),
(16, 22),
(17, 8),
(17, 17),
(17, 26),
(18, 2),
(18, 11),
(18, 20),
(19, 6),
(19, 15),
(19, 24),
(20, 5),
(20, 14),
(20, 23),
(21, 3),
(21, 12),
(21, 21),
(22, 6),
(22, 15),
(22, 24),
(23, 2),
(23, 11),
(23, 20),
(24, 3),
(24, 12),
(24, 21),
(25, 9),
(25, 18),
(25, 27),
(26, 5),
(26, 14),
(26, 23),
(27, 5),
(27, 14),
(27, 23),
(28, 6),
(28, 15),
(28, 24),
(29, 4),
(29, 13),
(29, 22),
(30, 7),
(30, 16),
(30, 25),
(31, 23),
(31, 26),
(33, 2),
(34, 13);

-- --------------------------------------------------------

--
-- بنية الجدول `garage_translations`
--

CREATE TABLE `garage_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `garage_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `garage_translations`
--

INSERT INTO `garage_translations` (`id`, `locale`, `description`, `address`, `garage_id`, `created_at`, `updated_at`, `name`, `slug`) VALUES
(1, 'ar', 'Quia quia sint porro esse ducimus accusantium esse. Quas pariatur aspernatur deleniti adipisci.', 'السعودية - الرياض - حي عرقه', 1, '2020-10-27 15:05:38', '2020-11-17 18:18:39', 'كراج بلدنا5', 'كراج-بلدنا5'),
(2, 'en', 'Quia quia sint porro esse ducimus accusantium esse. Quas pariatur aspernatur deleniti adipisci.', 'السعودية - الرياض - حي عرقه', 1, '2020-10-27 15:05:38', '2020-11-07 00:57:49', 'كراج بلدنا5', 'كراج-بلدنا5-1'),
(3, 'ar', 'Nulla et dolore sint aliquid cumque quasi quia est. Eos velit ipsam odio ut amet nihil et.', 'السعودية - الرياض - حي عرقه', 2, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-1'),
(4, 'en', 'In quia earum quibusdam blanditiis. Est magni et neque eum sed. Repellat est nihil fugiat aut.', 'KSA - Alryad - Souad King Str', 2, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-1'),
(5, 'ar', 'Dolores quibusdam voluptatum esse nemo aut et provident. In cum qui voluptas at sed quia.', 'السعودية - الرياض - حي عرقه', 3, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-2'),
(6, 'en', 'Molestiae dolorem autem voluptatem. Molestiae velit a debitis quasi ut ea ea.', 'KSA - Alryad - Souad King Str', 3, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-2'),
(7, 'ar', 'Sed odit delectus numquam molestiae nostrum. At cupiditate dolores et.', 'السعودية - الرياض - حي عرقه', 4, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-3'),
(8, 'en', 'Doloribus nemo qui voluptatem illo facilis aliquam. Id tenetur sint expedita est id explicabo.', 'KSA - Alryad - Souad King Str', 4, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-3'),
(9, 'ar', 'Deserunt non laboriosam sed vel. Fugit qui id ut eum. Vel laborum non qui iure excepturi nisi odio.', 'السعودية - الرياض - حي عرقه', 5, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-4'),
(10, 'en', 'Laboriosam asperiores eius ad vel voluptates. Est esse quis veritatis odio.', 'KSA - Alryad - Souad King Str', 5, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-4'),
(11, 'ar', 'Aliquam qui qui qui tempore. Sunt nemo et a id qui vel aspernatur.', 'السعودية - الرياض - حي عرقه', 6, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-5'),
(12, 'en', 'Quaerat eos laudantium quo dolor. Quos tenetur commodi aliquid et ipsam dolorem harum.', 'KSA - Alryad - Souad King Str', 6, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-5'),
(13, 'ar', 'Ullam sequi dolorem nesciunt qui qui. Dolorum quod sunt explicabo autem neque rerum.', 'السعودية - الرياض - حي عرقه', 7, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-6'),
(14, 'en', 'Accusantium et corporis doloremque sequi harum. Aperiam id vero cupiditate nihil.', 'KSA - Alryad - Souad King Str', 7, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-6'),
(15, 'ar', 'Non consequatur velit qui incidunt et corrupti. Porro ipsam velit aliquam porro hic adipisci ipsam.', 'السعودية - الرياض - حي عرقه', 8, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-7'),
(16, 'en', 'Qui nostrum consequuntur ut. Animi neque quos nesciunt.', 'KSA - Alryad - Souad King Str', 8, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-7'),
(17, 'ar', 'Ea in ab ut qui in itaque quia. Veniam blanditiis consequatur voluptatem.', 'السعودية - الرياض - حي عرقه', 9, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-8'),
(18, 'en', 'Ea qui aut quia earum. Vel iure quia ut explicabo et. Enim eveniet omnis ipsum dolorem et.', 'KSA - Alryad - Souad King Str', 9, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-8'),
(19, 'ar', 'Saepe deleniti et voluptatem voluptatum voluptas. Sunt reprehenderit distinctio in.', 'السعودية - الرياض - حي عرقه', 10, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-9'),
(20, 'en', 'Repellendus sint molestias voluptate non. Voluptate quam quae et est qui aut.', 'KSA - Alryad - Souad King Str', 10, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-9'),
(21, 'ar', 'Et et ut quis modi qui praesentium illo. Minima aut ipsum ipsum nobis doloremque.', 'السعودية - الرياض - حي عرقه', 11, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-10'),
(22, 'en', 'Dolores nulla quasi impedit sed. Quasi maiores praesentium ut sit. Aliquam earum at fuga ea.', 'KSA - Alryad - Souad King Str', 11, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-10'),
(23, 'ar', 'Aut magni sit assumenda optio qui rem. Est qui nemo quia. Dolores ipsa odio est velit sunt vel.', 'السعودية - الرياض - حي عرقه', 12, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-11'),
(24, 'en', 'Vitae illo ut omnis. Sint autem similique praesentium animi tempora.', 'KSA - Alryad - Souad King Str', 12, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-11'),
(25, 'ar', 'Deserunt quo autem sed blanditiis et omnis. Explicabo quia ea veniam omnis nisi consequatur.', 'السعودية - الرياض - حي عرقه', 13, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-12'),
(26, 'en', 'Voluptatem expedita ipsam ipsum est et est. Consectetur praesentium dicta quis natus possimus.', 'KSA - Alryad - Souad King Str', 13, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-12'),
(27, 'ar', 'Voluptas error esse quo sunt illum quia quisquam. Sunt ullam accusamus vitae quam dolor.', 'السعودية - الرياض - حي عرقه', 14, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-13'),
(28, 'en', 'Omnis ea explicabo aliquam sit. Assumenda ut consequuntur explicabo doloribus.', 'KSA - Alryad - Souad King Str', 14, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-13'),
(29, 'ar', 'Veniam ut repellendus molestiae nisi sed ipsa. Ut similique et quis minus doloribus.', 'السعودية - الرياض - حي عرقه', 15, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'كراج بلدنا', 'كراج-بلدنا-14'),
(30, 'en', 'Expedita architecto et et maiores vero ut. Officiis saepe quia rem quas.', 'KSA - Alryad - Souad King Str', 15, '2020-10-27 15:05:38', '2020-10-27 15:05:38', 'Pladna Garage', 'Pladna-Garage-14'),
(31, 'ar', 'Ut laborum ut reiciendis at placeat ducimus vel. Libero porro perspiciatis atque qui.', 'السعودية - الرياض - حي عرقه', 16, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-15'),
(32, 'en', 'Qui voluptate occaecati vel eaque exercitationem. Perferendis ut quis temporibus eligendi.', 'KSA - Alryad - Souad King Str', 16, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-15'),
(33, 'ar', 'Sit quia incidunt blanditiis. Animi qui expedita aut sed consequuntur similique officia.', 'السعودية - الرياض - حي عرقه', 17, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-16'),
(34, 'en', 'Fuga quae et suscipit voluptas qui quidem vitae aut. Esse voluptas impedit aliquam voluptas ab.', 'KSA - Alryad - Souad King Str', 17, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-16'),
(35, 'ar', 'Non velit et sint pariatur reiciendis consequatur sequi voluptatum. Repellendus ea qui alias alias.', 'السعودية - الرياض - حي عرقه', 18, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-17'),
(36, 'en', 'Aperiam recusandae nostrum non mollitia impedit iure. Cum et est culpa velit quas consectetur.', 'KSA - Alryad - Souad King Str', 18, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-17'),
(37, 'ar', 'Incidunt porro molestias dolor exercitationem quo. Corporis sint rerum quia veritatis est ut.', 'السعودية - الرياض - حي عرقه', 19, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-18'),
(38, 'en', 'Quia dolore aperiam numquam unde. Quia corrupti facilis optio. Repellat ab dolores facere facilis.', 'KSA - Alryad - Souad King Str', 19, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-18'),
(39, 'ar', 'Id quo nesciunt at fugit tempore placeat. Rerum dolores corporis facere repudiandae officia.', 'السعودية - الرياض - حي عرقه', 20, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-19'),
(40, 'en', 'Vero esse cum odio. Maxime voluptatibus id ea veritatis.', 'KSA - Alryad - Souad King Str', 20, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-19'),
(41, 'ar', 'Quo hic vitae sit aliquid a tempore ea. Distinctio sit saepe expedita doloribus porro quod omnis.', 'السعودية - الرياض - حي عرقه', 21, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-20'),
(42, 'en', 'Inventore dolor asperiores amet est sint facilis. Modi ut animi repellat adipisci.', 'KSA - Alryad - Souad King Str', 21, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-20'),
(43, 'ar', 'Et sapiente voluptatem at ut id. Adipisci nihil ducimus eius nulla illum.', 'السعودية - الرياض - حي عرقه', 22, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-21'),
(44, 'en', 'Minus distinctio et et cum est saepe. Ratione sed debitis ea quia voluptates quis sit repellat.', 'KSA - Alryad - Souad King Str', 22, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-21'),
(45, 'ar', 'Iure corrupti provident occaecati similique. Dolorem corporis quibusdam maiores.', 'السعودية - الرياض - حي عرقه', 23, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-22'),
(46, 'en', 'Tempore aut et ut sequi sed et libero. Rerum corrupti adipisci et expedita eaque incidunt et.', 'KSA - Alryad - Souad King Str', 23, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-22'),
(47, 'ar', 'Iste sint quo aut totam. Et eveniet omnis natus soluta aut ratione.', 'السعودية - الرياض - حي عرقه', 24, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-23'),
(48, 'en', 'Earum quo ut nulla nam repellat. Nulla earum at incidunt deleniti eius ut optio eos.', 'KSA - Alryad - Souad King Str', 24, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-23'),
(49, 'ar', 'Id fuga quis voluptates qui doloribus ut similique. Amet eum necessitatibus reiciendis aut autem.', 'السعودية - الرياض - حي عرقه', 25, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-24'),
(50, 'en', 'Amet in qui et. Veritatis sint labore quo blanditiis. Nemo nihil possimus ad eveniet.', 'KSA - Alryad - Souad King Str', 25, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-24'),
(51, 'ar', 'Quia voluptates accusamus ullam aut ad. Non et ratione eligendi doloremque sit officiis sed.', 'السعودية - الرياض - حي عرقه', 26, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-25'),
(52, 'en', 'Animi odit voluptatem deserunt quaerat. Id adipisci inventore eum. Ut modi expedita sit non.', 'KSA - Alryad - Souad King Str', 26, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-25'),
(53, 'ar', 'Expedita suscipit aut explicabo quis. Porro officia labore eos expedita et dolores eos.', 'السعودية - الرياض - حي عرقه', 27, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-26'),
(54, 'en', 'Amet ab aut placeat pariatur eaque unde. Veniam nam voluptatem pariatur ut repellendus voluptatem.', 'KSA - Alryad - Souad King Str', 27, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-26'),
(55, 'ar', 'Qui quia voluptate voluptatibus. Beatae maiores id suscipit velit. Sed exercitationem aperiam qui.', 'السعودية - الرياض - حي عرقه', 28, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-27'),
(56, 'en', 'Natus tempore enim a. Et quas voluptatem est soluta expedita deleniti quia.', 'KSA - Alryad - Souad King Str', 28, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-27'),
(57, 'ar', 'Minima et ut reprehenderit quaerat et iste. Quia saepe omnis tempore ut.', 'السعودية - الرياض - حي عرقه', 29, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'كراج بلدنا', 'كراج-بلدنا-28'),
(58, 'en', 'Illum reprehenderit modi aut enim molestias ex fuga. Nobis rerum ipsam et. Aut nihil quo ipsa.', 'KSA - Alryad - Souad King Str', 29, '2020-10-27 15:05:39', '2020-10-27 15:05:39', 'Pladna Garage', 'Pladna-Garage-28'),
(59, 'ar', 'Natus veniam magnam aut dolor. Fugiat repellat aliquid veritatis aliquid in.', 'السعودية - الرياض - حي عرقه', 30, '2020-10-27 15:05:40', '2020-10-27 15:05:40', 'كراج بلدنا', 'كراج-بلدنا-29'),
(60, 'en', 'Beatae ut quam facilis sit omnis autem et. Labore nihil sunt delectus.', 'KSA - Alryad - Souad King Str', 30, '2020-10-27 15:05:40', '2020-10-27 15:05:40', 'Pladna Garage', 'Pladna-Garage-29'),
(61, 'en', 'Test', 'AhmedAlShoqery', 31, '2020-11-01 15:14:40', '2020-11-01 15:14:40', 'sereen saqer', 'sereen-saqer'),
(62, 'ar', 'تيست', 'Gaza Strip', 31, '2020-11-01 15:14:40', '2020-11-01 15:14:40', 'سيرين صقر', 'سيرين-صقر'),
(63, 'ar', 'وصف الكراج', 'العنوان', 32, '2020-11-01 17:13:50', '2020-11-01 17:13:50', 'كراج ‏مصعب', 'كراج-‏مصعب'),
(64, 'en', 'garage description', 'address ‎', 32, '2020-11-01 17:13:50', '2020-11-01 17:13:50', 'mosab ‎garage', 'mosab-‎garage'),
(65, 'en', 'a1', 'st.', 33, '2020-11-11 14:51:12', '2020-11-11 19:46:02', 'test0111', 'test0111-1'),
(66, 'ar', 'a1', 'st.', 33, '2020-11-11 14:51:12', '2020-11-11 19:45:20', 'test0111', 'test0111'),
(67, 'en', 'StestStestStestStestStestStest', 'Gaza Strip', 34, '2020-11-12 14:41:39', '2020-11-12 14:41:39', 'Stest', 'Stest'),
(68, 'ar', 'تيست س تيست', 'غزة', 34, '2020-11-12 14:41:39', '2020-11-12 14:41:39', 'تيست س تيست', 'تيست-س-تيست'),
(69, 'ar', 'كراج للفحص', 'الكويت', 35, '2020-11-29 02:21:12', '2020-11-29 02:21:12', 'عماد', 'عماد'),
(70, 'en', 'test garage', 'kw', 35, '2020-11-29 02:21:12', '2020-11-29 02:21:12', 'Emad', 'Emad');

-- --------------------------------------------------------

--
-- بنية الجدول `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `languages`
--

INSERT INTO `languages` (`id`, `lang`, `flag`, `created_at`, `updated_at`) VALUES
(1, 'ar', 'ar.png', '2020-10-27 15:14:54', '2020-10-27 15:14:54'),
(2, 'en', 'en.png', '2020-10-27 15:14:54', '2020-10-27 15:14:54');

-- --------------------------------------------------------

--
-- بنية الجدول `language_translations`
--

CREATE TABLE `language_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `language_translations`
--

INSERT INTO `language_translations` (`id`, `locale`, `name`, `language_id`) VALUES
(1, 'ar', 'عربي', 1),
(2, 'en', 'Arabic', 1),
(3, 'ar', 'انجليزي', 2),
(4, 'en', 'English', 2);

-- --------------------------------------------------------

--
-- بنية الجدول `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2020_09_28_104134_create_car_types_table', 1),
(10, '2020_09_28_133417_create_categories_table', 1),
(11, '2020_09_28_133617_create_category_translations_table', 1),
(12, '2020_09_28_133633_create_services_table', 1),
(13, '2020_09_28_133657_create_service_translations_table', 1),
(14, '2020_09_28_134602_create_tokens_table', 1),
(15, '2020_09_28_134728_create_garages_table', 1),
(16, '2020_09_28_134751_create_garage_translations_table', 1),
(17, '2020_09_28_134821_create_garage_reviews_table', 1),
(18, '2020_09_28_134837_create_garage_images_table', 1),
(19, '2020_09_28_134958_create_garage_car_type_table', 1),
(20, '2020_09_28_134958_create_garage_service_table', 1),
(21, '2020_09_28_135035_create_orders_table', 1),
(22, '2020_09_28_135052_create_order_images_table', 1),
(23, '2020_09_28_135137_create_order_service_table', 1),
(24, '2020_09_28_135151_create_settings_table', 1),
(25, '2020_09_28_135217_create_contact_us_table', 1),
(26, '2020_09_28_135235_create_admins_table', 1),
(27, '2020_09_30_142314_create_notifications_table', 1),
(28, '2020_10_05_054703_create_plans_table', 1),
(29, '2020_10_05_054730_alter_plan_an_start_date_and_end_date_to_garages_table', 1),
(30, '2020_10_05_054822_create_plan_translations_table', 1),
(31, '2020_10_13_091853_create_languages_table', 1),
(32, '2020_10_13_091921_create_language_translations_table', 1),
(33, '2020_10_18_052623_create_permissions_table', 1),
(34, '2020_10_18_052708_create_permission_translations_table', 1),
(35, '2020_10_18_052741_create_user_permissions_table', 1),
(36, '2020_10_21_091031_alter_count_services_to_categories_table', 1),
(37, '2020_10_21_091229_alter_count_services_and_to_category_translation_table', 1),
(38, '2020_10_22_105143_alter_rate_and_number_reviewers_to_garage_table', 1),
(39, '2020_10_25_093037_alter_is_special_to_garages_table', 1),
(40, '2020_10_27_085044_alter_name_slug_to_garage_translations_table', 1),
(43, '2020_10_27_112137_create_advertisements_table', 2),
(44, '2020_10_27_112226_create_advertisement_translations_table', 2),
(45, '2020_10_28_092931_create_pages_table', 1),
(46, '2020_10_28_093150_create_page_translations_table', 1),
(47, '2020_10_29_083415_alter_is_reviewed_to_orders_table', 3),
(48, '2020_10_29_083559_alter_order_id_to_garage_reviews_table', 3),
(49, '2020_10_29_091636_alter_ammount_to_garages_table', 3),
(50, '2020_10_29_132508_create_garage_requests_table', 4),
(51, '2020_10_29_132653_create_garage_request_translations_table', 4),
(52, '2020_11_01_083030_alter_reason_reject_message_to_garage_requests_table', 5);

-- --------------------------------------------------------

--
-- بنية الجدول `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `notifications`
--

INSERT INTO `notifications` (`id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, '2020-11-22 19:18:14', '2020-11-22 19:18:14', NULL),
(3, '2020-11-24 13:10:40', '2020-11-24 13:10:40', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `notification_translations`
--

CREATE TABLE `notification_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `notification_translations`
--

INSERT INTO `notification_translations` (`id`, `locale`, `title`, `message`, `notification_id`, `created_at`, `updated_at`) VALUES
(3, 'ar', 'test', 'tets', 2, '2020-11-22 19:18:14', '2020-11-22 19:18:14'),
(4, 'en', 'test en', 'test en', 2, '2020-11-22 19:18:14', '2020-11-22 19:18:14'),
(5, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 3, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(6, 'en', 'Weenah', 'You in save  with Weenah App', 3, '2020-11-24 13:10:40', '2020-11-24 13:10:40');

-- --------------------------------------------------------

--
-- بنية الجدول `notifies`
--

CREATE TABLE `notifies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `message_type` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `notifies`
--

INSERT INTO `notifies` (`id`, `user_id`, `order_id`, `message_type`, `status`, `read_at`, `created_at`, `updated_at`) VALUES
(201, 1, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(202, 2, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(203, 3, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(204, 4, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(205, 5, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(206, 6, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(207, 7, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(208, 8, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(209, 9, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(210, 10, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(211, 11, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(212, 12, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(213, 13, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(214, 14, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(215, 15, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(216, 16, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(217, 17, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(218, 18, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(219, 19, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(220, 20, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(221, 21, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(222, 22, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(223, 23, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(224, 24, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(225, 25, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(226, 26, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(227, 27, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(228, 28, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(229, 29, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(230, 30, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(231, 31, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(232, 32, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(233, 33, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(234, 34, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(235, 35, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(236, 36, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(237, 37, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(238, 38, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(239, 39, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(240, 40, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(241, 41, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(242, 42, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(243, 43, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(244, 44, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(245, 45, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(246, 46, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(247, 47, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(248, 48, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(249, 49, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(250, 50, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(251, 51, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(252, 52, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(253, 53, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(254, 54, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(255, 55, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(256, 57, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(257, 58, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(258, 59, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(259, 60, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(260, 61, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(261, 62, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(262, 63, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(263, 64, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(264, 65, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(265, 66, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(266, 67, 0, 0, 'active', NULL, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(267, 21, 26, 0, 'active', NULL, '2020-11-26 20:11:36', '2020-11-26 20:11:36'),
(268, 64, 26, 0, 'active', NULL, '2020-11-26 21:31:02', '2020-11-26 21:31:02'),
(269, 21, 27, 0, 'active', NULL, '2020-11-27 01:13:19', '2020-11-27 01:13:19'),
(270, 64, 27, 0, 'active', NULL, '2020-11-27 01:23:40', '2020-11-27 01:23:40'),
(271, 64, 27, 0, 'active', NULL, '2020-11-27 01:25:49', '2020-11-27 01:25:49'),
(272, 1, 25, 0, 'active', NULL, '2020-11-27 07:45:45', '2020-11-27 07:45:45'),
(273, 21, 28, 0, 'active', NULL, '2020-11-27 07:47:43', '2020-11-27 07:47:43'),
(274, 21, 29, 0, 'active', NULL, '2020-11-27 07:48:52', '2020-11-27 07:48:52'),
(275, 1, 28, 0, 'active', NULL, '2020-11-27 07:50:35', '2020-11-27 07:50:35'),
(276, 1, 29, 0, 'active', NULL, '2020-11-27 07:52:00', '2020-11-27 07:52:00'),
(277, 21, 30, 0, 'active', NULL, '2020-11-28 01:54:57', '2020-11-28 01:54:57'),
(278, 64, 30, 0, 'active', NULL, '2020-11-28 02:02:28', '2020-11-28 02:02:28'),
(279, 21, 31, 0, 'active', NULL, '2020-11-28 21:23:23', '2020-11-28 21:23:23'),
(280, 1, 31, 0, 'active', NULL, '2020-11-28 21:29:06', '2020-11-28 21:29:06');

-- --------------------------------------------------------

--
-- بنية الجدول `notify_translations`
--

CREATE TABLE `notify_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `notify_translations`
--

INSERT INTO `notify_translations` (`id`, `locale`, `title`, `message`, `notify_id`, `created_at`, `updated_at`) VALUES
(1, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 201, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(2, 'en', 'Weenah', 'You in save  with Weenah App', 201, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(3, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 202, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(4, 'en', 'Weenah', 'You in save  with Weenah App', 202, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(5, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 203, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(6, 'en', 'Weenah', 'You in save  with Weenah App', 203, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(7, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 204, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(8, 'en', 'Weenah', 'You in save  with Weenah App', 204, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(9, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 205, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(10, 'en', 'Weenah', 'You in save  with Weenah App', 205, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(11, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 206, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(12, 'en', 'Weenah', 'You in save  with Weenah App', 206, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(13, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 207, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(14, 'en', 'Weenah', 'You in save  with Weenah App', 207, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(15, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 208, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(16, 'en', 'Weenah', 'You in save  with Weenah App', 208, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(17, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 209, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(18, 'en', 'Weenah', 'You in save  with Weenah App', 209, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(19, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 210, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(20, 'en', 'Weenah', 'You in save  with Weenah App', 210, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(21, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 211, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(22, 'en', 'Weenah', 'You in save  with Weenah App', 211, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(23, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 212, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(24, 'en', 'Weenah', 'You in save  with Weenah App', 212, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(25, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 213, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(26, 'en', 'Weenah', 'You in save  with Weenah App', 213, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(27, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 214, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(28, 'en', 'Weenah', 'You in save  with Weenah App', 214, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(29, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 215, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(30, 'en', 'Weenah', 'You in save  with Weenah App', 215, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(31, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 216, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(32, 'en', 'Weenah', 'You in save  with Weenah App', 216, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(33, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 217, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(34, 'en', 'Weenah', 'You in save  with Weenah App', 217, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(35, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 218, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(36, 'en', 'Weenah', 'You in save  with Weenah App', 218, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(37, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 219, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(38, 'en', 'Weenah', 'You in save  with Weenah App', 219, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(39, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 220, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(40, 'en', 'Weenah', 'You in save  with Weenah App', 220, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(41, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 221, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(42, 'en', 'Weenah', 'You in save  with Weenah App', 221, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(43, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 222, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(44, 'en', 'Weenah', 'You in save  with Weenah App', 222, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(45, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 223, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(46, 'en', 'Weenah', 'You in save  with Weenah App', 223, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(47, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 224, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(48, 'en', 'Weenah', 'You in save  with Weenah App', 224, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(49, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 225, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(50, 'en', 'Weenah', 'You in save  with Weenah App', 225, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(51, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 226, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(52, 'en', 'Weenah', 'You in save  with Weenah App', 226, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(53, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 227, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(54, 'en', 'Weenah', 'You in save  with Weenah App', 227, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(55, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 228, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(56, 'en', 'Weenah', 'You in save  with Weenah App', 228, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(57, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 229, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(58, 'en', 'Weenah', 'You in save  with Weenah App', 229, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(59, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 230, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(60, 'en', 'Weenah', 'You in save  with Weenah App', 230, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(61, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 231, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(62, 'en', 'Weenah', 'You in save  with Weenah App', 231, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(63, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 232, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(64, 'en', 'Weenah', 'You in save  with Weenah App', 232, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(65, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 233, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(66, 'en', 'Weenah', 'You in save  with Weenah App', 233, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(67, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 234, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(68, 'en', 'Weenah', 'You in save  with Weenah App', 234, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(69, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 235, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(70, 'en', 'Weenah', 'You in save  with Weenah App', 235, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(71, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 236, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(72, 'en', 'Weenah', 'You in save  with Weenah App', 236, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(73, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 237, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(74, 'en', 'Weenah', 'You in save  with Weenah App', 237, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(75, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 238, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(76, 'en', 'Weenah', 'You in save  with Weenah App', 238, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(77, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 239, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(78, 'en', 'Weenah', 'You in save  with Weenah App', 239, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(79, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 240, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(80, 'en', 'Weenah', 'You in save  with Weenah App', 240, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(81, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 241, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(82, 'en', 'Weenah', 'You in save  with Weenah App', 241, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(83, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 242, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(84, 'en', 'Weenah', 'You in save  with Weenah App', 242, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(85, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 243, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(86, 'en', 'Weenah', 'You in save  with Weenah App', 243, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(87, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 244, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(88, 'en', 'Weenah', 'You in save  with Weenah App', 244, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(89, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 245, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(90, 'en', 'Weenah', 'You in save  with Weenah App', 245, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(91, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 246, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(92, 'en', 'Weenah', 'You in save  with Weenah App', 246, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(93, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 247, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(94, 'en', 'Weenah', 'You in save  with Weenah App', 247, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(95, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 248, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(96, 'en', 'Weenah', 'You in save  with Weenah App', 248, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(97, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 249, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(98, 'en', 'Weenah', 'You in save  with Weenah App', 249, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(99, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 250, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(100, 'en', 'Weenah', 'You in save  with Weenah App', 250, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(101, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 251, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(102, 'en', 'Weenah', 'You in save  with Weenah App', 251, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(103, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 252, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(104, 'en', 'Weenah', 'You in save  with Weenah App', 252, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(105, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 253, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(106, 'en', 'Weenah', 'You in save  with Weenah App', 253, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(107, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 254, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(108, 'en', 'Weenah', 'You in save  with Weenah App', 254, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(109, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 255, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(110, 'en', 'Weenah', 'You in save  with Weenah App', 255, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(111, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 256, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(112, 'en', 'Weenah', 'You in save  with Weenah App', 256, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(113, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 257, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(114, 'en', 'Weenah', 'You in save  with Weenah App', 257, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(115, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 258, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(116, 'en', 'Weenah', 'You in save  with Weenah App', 258, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(117, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 259, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(118, 'en', 'Weenah', 'You in save  with Weenah App', 259, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(119, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 260, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(120, 'en', 'Weenah', 'You in save  with Weenah App', 260, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(121, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 261, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(122, 'en', 'Weenah', 'You in save  with Weenah App', 261, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(123, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 262, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(124, 'en', 'Weenah', 'You in save  with Weenah App', 262, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(125, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 263, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(126, 'en', 'Weenah', 'You in save  with Weenah App', 263, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(127, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 264, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(128, 'en', 'Weenah', 'You in save  with Weenah App', 264, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(129, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 265, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(130, 'en', 'Weenah', 'You in save  with Weenah App', 265, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(131, 'ar', 'وينة', 'يومك في أمان  مع تطبيق وينه', 266, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(132, 'en', 'Weenah', 'You in save  with Weenah App', 266, '2020-11-24 13:10:40', '2020-11-24 13:10:40'),
(133, 'ar', 'Weenah', '  طلب  جديد #26 ', 267, '2020-11-26 20:11:36', '2020-11-26 20:11:36'),
(134, 'en', 'Weenah', 'There is a new order #26', 267, '2020-11-26 20:11:37', '2020-11-26 20:11:37'),
(135, 'ar', 'Weenah', ' تم قبول طلب رقم #26', 268, '2020-11-26 21:31:02', '2020-11-26 21:31:02'),
(136, 'en', 'Weenah', 'Your order #26 has been accepted', 268, '2020-11-26 21:31:02', '2020-11-26 21:31:02'),
(137, 'ar', 'Weenah', '  طلب  جديد #27 ', 269, '2020-11-27 01:13:19', '2020-11-27 01:13:19'),
(138, 'en', 'Weenah', 'There is a new order #27', 269, '2020-11-27 01:13:19', '2020-11-27 01:13:19'),
(139, 'ar', 'Weenah', ' تم قبول طلب رقم #27', 270, '2020-11-27 01:23:40', '2020-11-27 01:23:40'),
(140, 'en', 'Weenah', 'Your order #27 has been accepted', 270, '2020-11-27 01:23:40', '2020-11-27 01:23:40'),
(141, 'ar', 'Weenah', ' تم قبول طلب رقم #27', 271, '2020-11-27 01:25:49', '2020-11-27 01:25:49'),
(142, 'en', 'Weenah', 'Your order #27 has been accepted', 271, '2020-11-27 01:25:49', '2020-11-27 01:25:49'),
(143, 'ar', 'Weenah', ' تم قبول طلب رقم #25', 272, '2020-11-27 07:45:45', '2020-11-27 07:45:45'),
(144, 'en', 'Weenah', 'Your order #25 has been accepted', 272, '2020-11-27 07:45:45', '2020-11-27 07:45:45'),
(145, 'ar', 'Weenah', '  طلب  جديد #28 ', 273, '2020-11-27 07:47:43', '2020-11-27 07:47:43'),
(146, 'en', 'Weenah', 'There is a new order #28', 273, '2020-11-27 07:47:43', '2020-11-27 07:47:43'),
(147, 'ar', 'Weenah', '  طلب  جديد #29 ', 274, '2020-11-27 07:48:52', '2020-11-27 07:48:52'),
(148, 'en', 'Weenah', 'There is a new order #29', 274, '2020-11-27 07:48:52', '2020-11-27 07:48:52'),
(149, 'ar', 'Weenah', ' تم رفض طلب رقم #28', 275, '2020-11-27 07:50:35', '2020-11-27 07:50:35'),
(150, 'en', 'Weenah', 'Your order #28 has been rejected', 275, '2020-11-27 07:50:35', '2020-11-27 07:50:35'),
(151, 'ar', 'Weenah', ' تم قبول طلب رقم #29', 276, '2020-11-27 07:52:00', '2020-11-27 07:52:00'),
(152, 'en', 'Weenah', 'Your order #29 has been accepted', 276, '2020-11-27 07:52:00', '2020-11-27 07:52:00'),
(153, 'ar', 'Weenah', '  طلب  جديد #30 ', 277, '2020-11-28 01:54:57', '2020-11-28 01:54:57'),
(154, 'en', 'Weenah', 'There is a new order #30', 277, '2020-11-28 01:54:57', '2020-11-28 01:54:57'),
(155, 'ar', 'Weenah', ' تم رفض طلب رقم #30', 278, '2020-11-28 02:02:28', '2020-11-28 02:02:28'),
(156, 'en', 'Weenah', 'Your order #30 has been rejected', 278, '2020-11-28 02:02:28', '2020-11-28 02:02:28'),
(157, 'ar', 'Weenah', '  طلب  جديد #31 ', 279, '2020-11-28 21:23:23', '2020-11-28 21:23:23'),
(158, 'en', 'Weenah', 'There is a new order #31', 279, '2020-11-28 21:23:23', '2020-11-28 21:23:23'),
(159, 'ar', 'Weenah', ' تم رفض طلب رقم #31', 280, '2020-11-28 21:29:06', '2020-11-28 21:29:06'),
(160, 'en', 'Weenah', 'Your order #31 has been rejected', 280, '2020-11-28 21:29:06', '2020-11-28 21:29:06');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('06a6714bcef9925626bf2c13e74bb3a84076f49f27a2168764308ba7c8ac1db33a5e1876b7b29cf5', 1, 1, 'mobile', '[]', 0, '2020-11-24 13:01:54', '2020-11-24 13:01:54', '2021-11-24 07:01:54'),
('074122a7372292cfe5a696107d0087a334566581b217918534c00cd36261032115638002592f3a33', 1, 1, 'mobile', '[]', 0, '2020-10-28 13:22:31', '2020-10-28 13:22:31', '2021-10-28 08:22:31'),
('0bf2878f73b6fd7ef9fe393b778b75f25ede2537bfa2cd7c688bad85ada448e32fae8089075bfc00', 57, 1, 'mobile', '[]', 1, '2020-11-12 15:49:51', '2020-11-12 15:49:51', '2021-11-12 09:49:51'),
('10e45fdec221be7e5548e7fe57786ef4a1d278a9b66f34a909588efae4cb0455f5f2b20f6611f027', 54, 1, 'mobile', '[]', 1, '2020-11-11 14:35:36', '2020-11-11 14:35:36', '2021-11-11 08:35:36'),
('112914aab9a49c5f2047571bb6060ecc14d973129dfca9ba6f432c00ea43faba4e8b7f3d3fcc4441', 64, 1, 'mobile', '[]', 1, '2020-11-26 20:09:14', '2020-11-26 20:09:14', '2021-11-26 14:09:14'),
('129537afb3c95f7471a4ac2acb63dd9108850ea592a9e194f70ccc7678f02bb52426dc290c506702', 21, 1, 'mobile', '[]', 0, '2020-11-06 20:07:13', '2020-11-06 20:07:13', '2021-11-06 14:07:13'),
('14cfa4f1a768c9a974866ccbdd6a2bc975e4f45e3e0071e9498759da65ffe7d6092356a6da79ffd4', 1, 1, 'mobile', '[]', 0, '2020-11-22 09:56:33', '2020-11-22 09:56:33', '2021-11-22 03:56:33'),
('15c0f481c1927f57f06784e33509406703d0cff109dd83d8655e396e0c8786b8f810a7e1b29e0ba5', 1, 1, 'mobile', '[]', 1, '2020-11-22 13:07:09', '2020-11-22 13:07:09', '2021-11-22 07:07:09'),
('1657340a002c7497551b20e9996b5af10ca4200dd892f444903ea7b04604d6f5bd41dc0c4fc629ec', 64, 1, 'mobile', '[]', 1, '2020-11-28 01:49:29', '2020-11-28 01:49:29', '2021-11-27 19:49:29'),
('184888f8feb183b7e6eda6aa83a50eb881e31729aad8e846062ddbdb8d8c475cc63bb76969475234', 21, 1, 'mobile', '[]', 1, '2020-11-06 22:20:29', '2020-11-06 22:20:29', '2021-11-06 16:20:29'),
('1bc754a1d5db7af15312143d370636e8691228cd4ba4b295f9bc6e798021add7c3ed13db616f32c9', 21, 1, 'mobile', '[]', 0, '2020-11-24 13:38:14', '2020-11-24 13:38:14', '2021-11-24 07:38:14'),
('22c5f4249e7c146a30cc231959b1bad3413a61b56f4ad2674d6d1c4a3aac44d8ed8deaf213e70976', 1, 1, 'mobile', '[]', 1, '2020-10-28 20:08:18', '2020-10-28 20:08:18', '2021-10-28 15:08:18'),
('22c760346afb2d05ae3708313547045154de8a571ab60dd829518a69e4fea3cea4df440c2a5e3a3a', 1, 1, 'mobile', '[]', 0, '2020-10-29 16:51:57', '2020-10-29 16:51:57', '2021-10-29 11:51:57'),
('23aa359ead7adeac7652750841935801efb316f934bc1db9f45eb3bdd3a7d60ac73901b46b84ed13', 1, 1, 'mobile', '[]', 0, '2020-11-16 22:29:38', '2020-11-16 22:29:38', '2021-11-16 16:29:38'),
('2468c902b7f49c848cba64322e88f356f7bc4e43b87a6df41b7ab5eceee55b7522a948094dfb4cf5', 1, 1, 'mobile', '[]', 1, '2020-10-29 17:47:33', '2020-10-29 17:47:33', '2021-10-29 12:47:33'),
('24b84d22f5ef50c3cf15b643fbc86a7a8f032322cd3c950b9bd1d2ae4391af45c0aac44db21c98e1', 2, 1, 'mobile', '[]', 0, '2020-11-06 18:45:08', '2020-11-06 18:45:08', '2021-11-06 12:45:08'),
('2a544e39a7954d7adefbfbe83c31e1704bbc082f382b022ca503c049c1060a603610b743b03c4563', 1, 1, 'mobile', '[]', 0, '2020-11-27 11:07:52', '2020-11-27 11:07:52', '2021-11-27 05:07:52'),
('2b712106ffd3586e1849596001f7afe94f241bdef0a9d66f8403769ea578f24c8a95c6cc6bbe6275', 1, 1, 'mobile', '[]', 1, '2020-11-16 13:19:08', '2020-11-16 13:19:08', '2021-11-16 07:19:08'),
('2d95992cd996af66514fe808a599a2851c232ecdf24e4319c7fe387e18db6dafddb84e291c970256', 1, 1, 'mobile', '[]', 1, '2020-11-24 14:32:13', '2020-11-24 14:32:13', '2021-11-24 08:32:13'),
('2eefa46cc28c6c529a635149e8dc23a4c62e73c1ed3ff1c5303db376aa41e5ace40637528a9b28aa', 1, 1, 'mobile', '[]', 1, '2020-11-20 23:06:56', '2020-11-20 23:06:56', '2021-11-20 17:06:56'),
('32fbccdf95b7755a0e0c9176d4de9903bc69383943e16f68866948d7199d9fe8edc97a260b8cdc76', 1, 1, 'mobile', '[]', 1, '2020-10-29 11:48:38', '2020-10-29 11:48:38', '2021-10-29 06:48:38'),
('37186892dfda3a843cba0767545191db102c0025596538bcf631b0cb15fe9bf66a855b36c15676f7', 21, 1, 'mobile', '[]', 0, '2020-11-22 13:52:46', '2020-11-22 13:52:46', '2021-11-22 07:52:46'),
('38b861cb52d15a0c637357bcee45cbcd417c9cf965765d2b5fb5581802c7f4582c1c531c612e6d5d', 1, 1, 'mobile', '[]', 0, '2020-11-24 15:06:00', '2020-11-24 15:06:00', '2021-11-24 09:06:00'),
('3c393d5676851f7314b91987d77c24af96d0d892f66dc3ca6de26c07dcda6b56fc3d6ebb97be6644', 1, 1, 'mobile', '[]', 0, '2020-11-22 14:08:28', '2020-11-22 14:08:28', '2021-11-22 08:08:28'),
('3e9ea50b0cbe7144026657a76016e74c860c7fc64fa19442ca3dfb719b9c0f5235b316f9ddbb0d4c', 58, 1, 'mobile', '[]', 1, '2020-11-12 14:40:43', '2020-11-12 14:40:43', '2021-11-12 08:40:43'),
('426a853afa1616a0b3c3b2e751537bcf857f37b2bc7ae9f4b96d77528e8844bf288432dbf77720ce', 21, 1, 'mobile', '[]', 0, '2020-11-06 18:46:39', '2020-11-06 18:46:39', '2021-11-06 12:46:39'),
('428148fb908f2def9194a09b59805e0ab4035ba7a00b4ec5881e6dd4333ebeb456f73846fc4c8ef9', 61, 1, 'mobile', '[]', 1, '2020-11-12 15:06:23', '2020-11-12 15:06:23', '2021-11-12 09:06:23'),
('46bf8036267c0e27520c7245375fceabb851aa1f03fc47e130d8af3d2cea2ba39eda666737a7153a', 21, 1, 'mobile', '[]', 1, '2020-11-28 01:52:10', '2020-11-28 01:52:10', '2021-11-27 19:52:10'),
('47595e795f3d23b953266ec7c0c9817ec600e2f98f65e9aa5a9e446e45fff493aebf39de3f1b5a77', 21, 1, 'mobile', '[]', 0, '2020-11-24 14:26:13', '2020-11-24 14:26:13', '2021-11-24 08:26:13'),
('47e994c22c3d96c7182c5091a5f9090ebb215195a7f0fda3ebb6b82b95a19af1e89309397c2804fc', 21, 1, 'mobile', '[]', 1, '2020-11-16 16:56:02', '2020-11-16 16:56:02', '2021-11-16 10:56:02'),
('4c73dc1898b572adac625d5288d91a6e25b684f81ac3ca07c23ab24788c7be27f3c637070356262e', 21, 1, 'mobile', '[]', 1, '2020-11-22 13:35:31', '2020-11-22 13:35:31', '2021-11-22 07:35:31'),
('4fee1ce74dd56b21e1ddf9c7a2497185e5955edcfac814a5baccb2a0901805ef53769f2f401d8941', 21, 1, 'mobile', '[]', 1, '2020-11-22 15:13:39', '2020-11-22 15:13:39', '2021-11-22 09:13:39'),
('517964cb9e519a44cc8fdbd83b4a1f53a607cf0171b3c16ae3029e6946cd4923d43e8de6cf8d366a', 21, 1, 'mobile', '[]', 1, '2020-11-26 21:24:28', '2020-11-26 21:24:28', '2021-11-26 15:24:28'),
('5278df2506acd54c0224c8b9a1e30ad04d47524dfe987b9359e044f911b30844eb667fcd48e3abf7', 21, 1, 'mobile', '[]', 1, '2020-10-29 17:50:59', '2020-10-29 17:50:59', '2021-10-29 12:50:59'),
('52b5c50330e51a61bab6a70fe7bf497ddaecd9f2bdd412746756576622ed77b6925cc8ab78e83ce4', 59, 1, 'mobile', '[]', 1, '2020-11-12 15:10:53', '2020-11-12 15:10:53', '2021-11-12 09:10:53'),
('53f692ef48d5bf97ed87ccfe9056b41ab7a39a413cb8ed6a3e0446bbbacd578b5801e09612e35413', 64, 1, 'mobile', '[]', 0, '2020-11-19 19:26:53', '2020-11-19 19:26:53', '2021-11-19 13:26:53'),
('54ae938a0ce47304b2a309fff043d881591c0c67c3dd174e7c8ea4cb7002266f6b7ad9e997a4215b', 21, 1, 'mobile', '[]', 1, '2020-11-06 20:10:46', '2020-11-06 20:10:46', '2021-11-06 14:10:46'),
('58b17b8c3a173c7f9b77d9f7a23eb473a58f9cdc2d2f568a1cbbe98be65827580daa700d95835526', 1, 1, 'mobile', '[]', 1, '2020-11-01 14:43:08', '2020-11-01 14:43:08', '2021-11-01 08:43:08'),
('5de4aedddf178eb15a4860d88448f837a86a9d6eb1e10bb92e2a7dc8aa81c3dfd6bc9b41316972b2', 1, 1, 'mobile', '[]', 0, '2020-11-22 13:04:50', '2020-11-22 13:04:50', '2021-11-22 07:04:50'),
('5eedab191517c02eec60c2bea7cd4be82ccb33642f47167dfe2684ebf49633751c6ec195ae85690e', 21, 1, 'mobile', '[]', 1, '2020-11-06 19:27:25', '2020-11-06 19:27:25', '2021-11-06 13:27:25'),
('5fe1532505762b742f41447382c8f71140b3e00357b80baa46e63f90a4b4a616788a819d7a3fbc7d', 1, 1, 'mobile', '[]', 0, '2020-10-28 11:45:31', '2020-10-28 11:45:31', '2021-10-28 06:45:31'),
('62248d7f54954225bf05a24dd0db128fdba14cbae1f99d620d31cfb7988f21dfbeb2f15a91819917', 21, 1, 'mobile', '[]', 1, '2020-11-02 03:07:41', '2020-11-02 03:07:41', '2021-11-01 21:07:41'),
('63901b2128c8294359d3d562f46956567cdc75f325ec8a1d921c6091778b672ef01b8bee58d2d769', 21, 1, 'mobile', '[]', 0, '2020-11-24 14:11:53', '2020-11-24 14:11:53', '2021-11-24 08:11:53'),
('64151f95e6c5273ede1f7a7b649beec35abbcbf9def260394689198f5a6d7f616c5e8c66d49955d3', 1, 1, 'mobile', '[]', 0, '2020-11-02 21:11:34', '2020-11-02 21:11:34', '2021-11-02 15:11:34'),
('6851dd6db78bef6c2d2dfef57a3938e442a3bbe62b31c30b8b190a08caaf1cc7e3bd6e2a9989ba0d', 21, 1, 'mobile', '[]', 1, '2020-11-16 18:35:01', '2020-11-16 18:35:01', '2021-11-16 12:35:01'),
('698e9c360f9daac1cf87449252defce6ac417d4a76f8282855da483a2e4982bddf07097f7106c783', 1, 1, 'mobile', '[]', 1, '2020-11-16 20:39:43', '2020-11-16 20:39:43', '2021-11-16 14:39:43'),
('6a8f8ac88999e4ba9a4056d69481d8ec736c484b70d928391a446565adbdf3089663f9aa321d619a', 1, 1, 'mobile', '[]', 1, '2020-11-02 02:54:40', '2020-11-02 02:54:40', '2021-11-01 20:54:40'),
('6b4f7018593f9181f683a165ea98edf2444eda19cd74f71af202f9229146769a49a280b09757bb6e', 1, 1, 'mobile', '[]', 1, '2020-11-27 07:37:48', '2020-11-27 07:37:48', '2021-11-27 01:37:48'),
('6cb008fc688d91d59783e336e9d918f6822748dfb78f8304847b8d4e6b16d7593fcac1c18abb1882', 1, 1, 'mobile', '[]', 1, '2020-11-16 20:26:36', '2020-11-16 20:26:36', '2021-11-16 14:26:36'),
('714731778ca299af2054e7e8d57e60ed11e1218661e0261547be402cfc9cd7f2ad0759da48c0219b', 21, 1, 'mobile', '[]', 1, '2020-10-30 00:16:56', '2020-10-30 00:16:56', '2021-10-29 19:16:56'),
('7323c439629c1b01c14ccdadea42911d1e2615a62e6028c33256cac7839eb5ea2d10a6aa518c51c2', 1, 1, 'mobile', '[]', 1, '2020-10-29 16:45:32', '2020-10-29 16:45:32', '2021-10-29 11:45:32'),
('73e23b188db025ebab51de388b14c680dc6d686bd9547fc468ad43442427fb21420d3915a2b4ed02', 1, 1, 'mobile', '[]', 1, '2020-11-16 22:29:39', '2020-11-16 22:29:39', '2021-11-16 16:29:39'),
('74f6fcca4ff1aa5662e9b98619977811a5f1b7cd25e176b7d213929c13ebb72399288d94250bb8e5', 64, 1, 'mobile', '[]', 1, '2020-11-26 21:32:03', '2020-11-26 21:32:03', '2021-11-26 15:32:03'),
('7508805a6aad24872c77a1f236dad299b5c072fe1508ef7750b203de72ebfdede39a677eab9b2a61', 21, 1, 'mobile', '[]', 1, '2020-10-28 20:21:43', '2020-10-28 20:21:43', '2021-10-28 15:21:43'),
('75adef4ad43c6b7ac6071368d95ba8c65f67999927849e9de82ea749a54570c0e1ce9ca6e17ffd3a', 1, 1, 'mobile', '[]', 0, '2020-11-15 15:06:58', '2020-11-15 15:06:58', '2021-11-15 09:06:58'),
('75f7fb325f8efdaef6321bfe1a2c16a56b3c62d29645e53a3ea9dde2e3af12b73ccc33f9ac4fa649', 21, 1, 'mobile', '[]', 1, '2020-11-06 18:41:37', '2020-11-06 18:41:37', '2021-11-06 12:41:37'),
('789015d26d86623e85256f306b33eb0ed452fcfb309e360c13c51eb20da3f405b04f620e33fc7eae', 21, 1, 'mobile', '[]', 0, '2020-11-06 19:50:31', '2020-11-06 19:50:31', '2021-11-06 13:50:31'),
('7bc9aafe91b84de18b5b1ac49a7569f3cb8ff77d656b57ceabd798547bfd57b2ac454ec73d9fae68', 64, 1, 'mobile', '[]', 1, '2020-11-20 17:39:35', '2020-11-20 17:39:35', '2021-11-20 11:39:35'),
('7d40ce68deaaf7792a7fd5bd3bb04544b431f2681156b1aa417867bc7618a6de1e202e79f252a376', 1, 1, 'mobile', '[]', 1, '2020-11-15 17:27:33', '2020-11-15 17:27:33', '2021-11-15 11:27:33'),
('7dc89038c15e243b890cde9f303a756d4c7f42acf9e01c52ee85d189e7e194c04ce2dd4b7bdaaa04', 1, 1, 'mobile', '[]', 1, '2020-11-16 16:54:49', '2020-11-16 16:54:49', '2021-11-16 10:54:49'),
('7e8360396904d0f7147ede9a9d615f444d4514cf9703f6c13ebe0c4362f655c6048b0860d65ac030', 21, 1, 'mobile', '[]', 1, '2020-11-22 14:56:37', '2020-11-22 14:56:37', '2021-11-22 08:56:37'),
('7eb26758538d269dff2feda1af08ff0c2d9dd253b765a4fb582ea35184924209f8fe7654d2ef113d', 1, 1, 'mobile', '[]', 1, '2020-10-29 19:36:45', '2020-10-29 19:36:45', '2021-10-29 14:36:45'),
('7fd7b1199393c56ad48ad13cff680c5c8b89dc119d00d8e1b8003887584545d181b973c445ca873b', 1, 1, 'mobile', '[]', 1, '2020-11-01 16:58:37', '2020-11-01 16:58:37', '2021-11-01 10:58:37'),
('8309ff3147404311b9ea6cbe9d185f7e3b7d0c2903a2ee2df11688bffedc7e113125cac42bc626bb', 1, 1, 'mobile', '[]', 0, '2020-10-29 13:18:52', '2020-10-29 13:18:52', '2021-10-29 08:18:52'),
('8365983cc49df020e204e1c06ca2ccc91759ce562d3974f5bcd1b7877962a9afc16082f715bcf8ab', 1, 1, 'mobile', '[]', 0, '2020-11-06 20:43:21', '2020-11-06 20:43:21', '2021-11-06 14:43:21'),
('83788054909b4bf5acffd00a8ccc2b8d189a241bf945a04b3457accea3eef8458d10b19a8c7d9ab0', 1, 1, 'mobile', '[]', 1, '2020-11-27 07:46:35', '2020-11-27 07:46:35', '2021-11-27 01:46:35'),
('8728c0b84f11db770861c7329cfe55c7d71833a3fa01b3994724372349235a9e848cd1f737a0404e', 1, 1, 'mobile', '[]', 1, '2020-11-29 05:22:55', '2020-11-29 05:22:55', '2021-11-28 23:22:55'),
('8a12ba4b81c178f2957ef800ac153ce0fe9de6a41996a67e88aa0f1f1dd5e0d353719d22f47c8869', 2, 1, 'mobile', '[]', 0, '2020-11-16 18:24:36', '2020-11-16 18:24:36', '2021-11-16 12:24:36'),
('8a3ccfd17ad538f3a5a9ea72c7c19f9727f0f996bf21cff9cb3b33cce16027519f6a53bfe7f0e134', 2, 1, 'mobile', '[]', 0, '2020-10-28 13:28:01', '2020-10-28 13:28:01', '2021-10-28 08:28:01'),
('8a88535615a27f96a73224e94e93175397decff621d833dea973d41cf82907f2a437ea08db8421d9', 21, 1, 'mobile', '[]', 0, '2020-11-22 14:51:01', '2020-11-22 14:51:01', '2021-11-22 08:51:01'),
('8bf5e9f654cdf2e649223f375636a15c4f9b100bc41f071101edd3898fae907aeb6f9bbf82ff0e47', 1, 1, 'mobile', '[]', 0, '2020-11-24 16:07:59', '2020-11-24 16:07:59', '2021-11-24 10:07:59'),
('8d3833b88a432d313c1111e36a9c37f7bd13a1cfae341d8fd7c8f10cda1b777684fadae7bd74ed8a', 1, 1, 'mobile', '[]', 0, '2020-11-22 15:16:16', '2020-11-22 15:16:16', '2021-11-22 09:16:16'),
('8f1d1104db1b4f7ec0511bfb16ca97bccf672eb214e1936bfa3e4ed6cd8390128ba82ca548d41eae', 21, 1, 'mobile', '[]', 1, '2020-11-16 22:35:41', '2020-11-16 22:35:41', '2021-11-16 16:35:41'),
('8f91058870a145052874a8fd981bec57138adc7a26a913a2d99b834ce105527b85c77058109b06f8', 1, 1, 'mobile', '[]', 1, '2020-11-16 20:23:29', '2020-11-16 20:23:29', '2021-11-16 14:23:29'),
('93dcd53c67a9916db0a6ad8410fbbf9f4abde8726aec81747a3224d17ce6f39871843ea2e90a1dd7', 1, 1, 'mobile', '[]', 1, '2020-10-28 13:10:29', '2020-10-28 13:10:29', '2021-10-28 08:10:29'),
('9480b653ce612ebe0f70239ba50bd19c43304efcc7c92c85f58533807e7ea6ab12d74016e6d3715a', 62, 1, 'mobile', '[]', 0, '2020-11-12 19:27:55', '2020-11-12 19:27:55', '2021-11-12 13:27:55'),
('960ebb6200e94b73f557423e46851035a2f77f61b9d10c4ef42af6b9c7303c1e837e2c0630ae60d2', 1, 1, 'mobile', '[]', 1, '2020-10-29 14:00:19', '2020-10-29 14:00:19', '2021-10-29 09:00:19'),
('98255ab8972580d14ffd3c1ba61da0c6f80812078e62fea29e8cbe2956fdc6fea4ba6e50be0d9693', 21, 1, 'mobile', '[]', 1, '2020-11-06 19:52:35', '2020-11-06 19:52:35', '2021-11-06 13:52:35'),
('9850ce0613d34ef1054835917ea9ba970cad7a1d260510dfdd14607527656e50a59187614769c4f2', 64, 1, 'mobile', '[]', 1, '2020-11-15 03:16:35', '2020-11-15 03:16:35', '2021-11-14 21:16:35'),
('99af32888c249b73d5f65dee6b92cf0df75cbeb85c619c27ffac4fa4642bb089ae86450b90f566db', 2, 1, 'mobile', '[]', 0, '2020-10-28 12:17:29', '2020-10-28 12:17:29', '2021-10-28 07:17:29'),
('99fd3c6f8441ea5b01f9cc9d93b67f8e8a2ddad286083099dee630202f981d2acbd9bba62c0dff41', 1, 1, 'mobile', '[]', 1, '2020-11-06 19:59:43', '2020-11-06 19:59:43', '2021-11-06 13:59:43'),
('9c38f5bc49f91c653006faa1087b60137b882b362b447f486315da010b2119fdf46ab90b71cf0dcb', 21, 1, 'mobile', '[]', 0, '2020-11-17 18:18:01', '2020-11-17 18:18:01', '2021-11-17 12:18:01'),
('a20b53bec302765b6abd1c206bacbfb8eea8235031ff915c16ee0aaee6a2b30df399226236a23b31', 64, 1, 'mobile', '[]', 1, '2020-11-29 13:43:52', '2020-11-29 13:43:52', '2021-11-29 07:43:52'),
('a261defff00321e1e99f1e41ced645e0c9333017820a1c8d7aba32465d95ffda1c3f728e57107fcd', 21, 1, 'mobile', '[]', 0, '2020-11-27 01:20:26', '2020-11-27 01:20:26', '2021-11-26 19:20:26'),
('a848d8b2ad244a08e9076b42eae101ecf0d0e1ad8f15522e1953490f6b25274823e89a0e9e435fb8', 64, 1, 'mobile', '[]', 0, '2020-11-20 17:56:39', '2020-11-20 17:56:39', '2021-11-20 11:56:39'),
('aaa10a317f75bea4a6e3e8afe8ea89b8401784d06ba60e897750bd41a2b1a64c0d2b7db394257a09', 21, 1, 'mobile', '[]', 1, '2020-10-28 13:15:19', '2020-10-28 13:15:19', '2021-10-28 08:15:19'),
('ad80b9eac70bbcf82c3588d0efb58ae5cd00774ad728d6071ea57b44a16551c1747e784b0200ccbd', 1, 1, 'mobile', '[]', 1, '2020-10-30 00:13:15', '2020-10-30 00:13:15', '2021-10-29 19:13:15'),
('aeebfeb08c76ccd3eff26106fe97b0d66421a4db3c55474108cd9b2ff87448a5e05095af9e680802', 21, 1, 'mobile', '[]', 0, '2020-10-31 22:47:43', '2020-10-31 22:47:43', '2021-10-31 17:47:43'),
('afa3a462376a66d13e54c3449eeb267a271ee15a11a5f6b63e29e3be32317cfbd312802b0909b725', 1, 1, 'mobile', '[]', 1, '2020-11-15 19:46:27', '2020-11-15 19:46:27', '2021-11-15 13:46:27'),
('afed7b816dd0889c5105a48787aedf5228601b87c08862a7381a51f3688e1f3da707a378d2e971c8', 63, 1, 'mobile', '[]', 1, '2020-11-15 03:08:43', '2020-11-15 03:08:43', '2021-11-14 21:08:43'),
('b2f6d26d97a3d43bdb29a35937d6c99de34f060ca4f28930dc540f4f462e7235da9d258511f0bc05', 21, 1, 'mobile', '[]', 0, '2020-10-28 12:34:47', '2020-10-28 12:34:47', '2021-10-28 07:34:47'),
('b3abdfc471037fceb1d41cc339d9b42b8760d57747cd9e7c0a228c32c49deec741e2c4565c94d48b', 1, 1, 'mobile', '[]', 1, '2020-11-22 00:53:48', '2020-11-22 00:53:48', '2021-11-21 18:53:48'),
('b5abd9a0b445deb536948f619ef8ce556d364150d123cbbc9d73e54938c34e63985d8ad67748b4d8', 21, 1, 'mobile', '[]', 0, '2020-11-06 20:09:19', '2020-11-06 20:09:19', '2021-11-06 14:09:19'),
('b6157ae3317b7b05b5c7af5a7545163d2b2d9c2088c0351f1ff9e92f51ecf3c32fb14d0653308a4a', 1, 1, 'mobile', '[]', 1, '2020-10-28 20:32:27', '2020-10-28 20:32:27', '2021-10-28 15:32:27'),
('b8970db979ead076bf8c98bbb21a9ac855d81a558f9bc7040700d19d92aa7c1367196bd8d0697386', 1, 1, 'mobile', '[]', 0, '2020-11-06 22:58:47', '2020-11-06 22:58:47', '2021-11-06 16:58:47'),
('bbd8a35db7e6efd4a5f48d023d7fd1422c792c39c82d628546f23ec02216d95a687a67b56502278d', 66, 1, 'mobile', '[]', 1, '2020-11-15 19:52:39', '2020-11-15 19:52:39', '2021-11-15 13:52:39'),
('bd4c60c285a45701821e223fb2b0ded2685db37858f8de690f0c80fa19843b9c52d45107aba8aa17', 1, 1, 'mobile', '[]', 1, '2020-11-22 14:45:31', '2020-11-22 14:45:31', '2021-11-22 08:45:31'),
('c2853e4ecf1917bbbd9b386f4496623db144d973cfaced86ac67e8d734f61c31d54fac466ae8ffac', 1, 1, 'mobile', '[]', 1, '2020-11-16 18:14:36', '2020-11-16 18:14:36', '2021-11-16 12:14:36'),
('c5b48a48e1c356b6b846d9e5d9294d2814663570197eefc573dbc888559a56189e2b42c78b1468e2', 21, 1, 'mobile', '[]', 0, '2020-11-24 14:35:00', '2020-11-24 14:35:00', '2021-11-24 08:35:00'),
('c8a22e89a120a62e9d696683837f0c12efc2e48bca1259507af5af7ac7860ed71af10962f4aeb03c', 21, 1, 'mobile', '[]', 1, '2020-11-16 18:28:38', '2020-11-16 18:28:38', '2021-11-16 12:28:38'),
('cb04604471f28a80f271e8bf9e4ab410498b5230dbd710576c774a757500af69aaca22ce151aac64', 1, 1, 'mobile', '[]', 0, '2020-11-16 16:54:49', '2020-11-16 16:54:49', '2021-11-16 10:54:49'),
('ce1f04174bb0b6460969c92ae90199052cec9eebb382877cb16b5908ab1fde6de796c8ed63436576', 21, 1, 'mobile', '[]', 0, '2020-11-06 22:12:09', '2020-11-06 22:12:09', '2021-11-06 16:12:09'),
('ce9e1270c077b8403a597e820e71a92786d9de1c954855a664e8c987986343f2d3f7152e1ac01121', 1, 1, 'mobile', '[]', 1, '2020-11-07 00:40:38', '2020-11-07 00:40:38', '2021-11-06 18:40:38'),
('d00b5c8a4caf10fc03154a11e80ae7986ee3785a152ee150b4ca0398ee724ff7acc1cc16bb5649ac', 1, 1, 'mobile', '[]', 1, '2020-11-28 21:22:30', '2020-11-28 21:22:30', '2021-11-28 15:22:30'),
('d088eb286d5f34850e24a00a8aac47087e12b598153440403b8748f718a0a3e9a340a8f8f6b7b270', 1, 1, 'mobile', '[]', 0, '2020-11-15 17:29:34', '2020-11-15 17:29:34', '2021-11-15 11:29:34'),
('d1ec36328c17047d74987ea0f20211c3284fedecf81ca56d2ef4183ce899be51ae98df830312c415', 65, 1, 'mobile', '[]', 0, '2020-11-15 19:40:59', '2020-11-15 19:40:59', '2021-11-15 13:40:59'),
('d22ad0ba35deb6ed51d2da538c29f71534dae89e42a3296a66d0c29537def5dc582ac482db93ef36', 21, 1, 'mobile', '[]', 0, '2020-11-06 20:08:09', '2020-11-06 20:08:09', '2021-11-06 14:08:09'),
('d2917b9c48aec2aba6e0675e99ac11c6cccbca2542793e84757cc1a1a202a2b180c62c6a676491e7', 21, 1, 'mobile', '[]', 1, '2020-11-27 07:50:13', '2020-11-27 07:50:13', '2021-11-27 01:50:13'),
('d458f85ee1c08a2f496488b225e5f74bdf0e6f3f2d854418e240ccea092622a9451b1133572b63c6', 64, 1, 'mobile', '[]', 1, '2020-11-19 18:26:52', '2020-11-19 18:26:52', '2021-11-19 12:26:52'),
('d465d09330b4f66f9819f0d71ae7ff951f133c1c5038dd10c2806981acbbfcee1697e61d855d93af', 1, 1, 'mobile', '[]', 1, '2020-10-28 13:00:43', '2020-10-28 13:00:43', '2021-10-28 08:00:43'),
('d64930338fceda5b56bbc5626704f67929278041551a9c0288a6150309a7700a0eeaa84108a6ece8', 1, 1, 'mobile', '[]', 1, '2020-11-06 20:11:42', '2020-11-06 20:11:42', '2021-11-06 14:11:42'),
('d84c6de14eb3d3903ecac9924e425f6cb9c6bd7c48c6686ceca74f51381239a5966ea56855cfec43', 55, 1, 'mobile', '[]', 1, '2020-11-11 19:24:27', '2020-11-11 19:24:27', '2021-11-11 13:24:27'),
('dc790b5e9f8d1df3c5ebb00af2c75c26b6f17fc90a171cf41f07630166c54f00c93b7c76582659c6', 1, 1, 'mobile', '[]', 1, '2020-11-07 01:01:30', '2020-11-07 01:01:30', '2021-11-06 19:01:30'),
('dc976eb8d6e335a09754c91d6d8a5d8c5229e6e53c5437b56c608969a6aef5d900aa0b17fc7904e6', 1, 1, 'mobile', '[]', 1, '2020-11-16 20:27:39', '2020-11-16 20:27:39', '2021-11-16 14:27:39'),
('ddb5b8381fa748992a8608277259f253c602bc7c94264495a7c9348cfefa7b2683c80c163e0ab013', 21, 1, 'mobile', '[]', 0, '2020-11-06 21:58:09', '2020-11-06 21:58:09', '2021-11-06 15:58:09'),
('de8f1f955f9ca8ca7f625fef1fde3cd74fc7009f97759a51cf0425dd523654c9caa026b4b2f657a0', 21, 1, 'mobile', '[]', 1, '2020-11-24 14:55:39', '2020-11-24 14:55:39', '2021-11-24 08:55:39'),
('df788ae6000b5ec1ab20ef36266a5e948cbd3fc3314ab6d46aa76da7e6c99c065bfc52342c14de67', 1, 1, 'mobile', '[]', 0, '2020-11-22 03:52:06', '2020-11-22 03:52:06', '2021-11-21 21:52:06'),
('e076b8136f393b9fd0c3c79958b9a91ffbdb28fc291ae9d53ff751658d9121717319a026f64fb2e9', 66, 1, 'mobile', '[]', 1, '2020-11-15 19:53:27', '2020-11-15 19:53:27', '2021-11-15 13:53:27'),
('e22fc49fc333d78adbec965a6aeed08f064f4f22fa1a2b1cc944a4f97a3eb8b71e75bd5905c2ed80', 64, 1, 'mobile', '[]', 1, '2020-11-28 22:20:40', '2020-11-28 22:20:40', '2021-11-28 16:20:40'),
('e2addf4a0dfaab5f08f8ab9c24a629e3e8bdcbb10d229ae81539e2f68098a7a1a7c4b17e3a51f28d', 64, 1, 'mobile', '[]', 1, '2020-11-20 16:53:34', '2020-11-20 16:53:34', '2021-11-20 10:53:34'),
('e6826e26e1b171830aeead94c8dfb70cbf2dbb816eaca6779d9239d7fd8d3ca33e3d18becb748837', 21, 1, 'mobile', '[]', 1, '2020-11-02 03:18:48', '2020-11-02 03:18:48', '2021-11-01 21:18:48'),
('e78b27dfcf355ea0072532089e6458ce75b7f92983baed27c6edae4fcfadf8608091cc88ed3fc960', 2, 1, 'mobile', '[]', 0, '2020-10-29 16:51:46', '2020-10-29 16:51:46', '2021-10-29 11:51:46'),
('eb2c532830242f29498e182e66cd7ee706d1479229991fb6ed505372a7b8a847d3fbc41c1db1d96d', 1, 1, 'mobile', '[]', 0, '2020-10-28 12:33:27', '2020-10-28 12:33:27', '2021-10-28 07:33:27'),
('ec916f73d56d650724cc05afdb229bb65ca24846a37e7f053a2a70aec38a6574afec7832f1b20730', 21, 1, 'mobile', '[]', 0, '2020-11-06 19:06:30', '2020-11-06 19:06:30', '2021-11-06 13:06:30'),
('ecc784019f4b05c4a255332152b0edf4b510eea172bb904300e366601b919a1b7783d9eba171f5af', 21, 1, 'mobile', '[]', 1, '2020-11-27 07:44:30', '2020-11-27 07:44:30', '2021-11-27 01:44:30'),
('edb7830eb504aee357e36a8c0bdac3fda60359d114f8d0bd4b987b4878bcaee7ccd6ff35bb85c31a', 1, 1, 'mobile', '[]', 0, '2020-11-24 12:54:15', '2020-11-24 12:54:15', '2021-11-24 06:54:15'),
('f1791443af2b2a2f778385a4d1e1fdc9739d26d12759060dfde0cf040cd621f8375562965b993ebb', 1, 1, 'mobile', '[]', 1, '2020-11-22 13:56:28', '2020-11-22 13:56:28', '2021-11-22 07:56:28'),
('f225720791fd4e430d3a9f5b776f0b94d2ad56b5a21f8d2da08d91cd917e0d47c423de76e85b44e0', 1, 1, 'mobile', '[]', 0, '2020-11-22 01:41:06', '2020-11-22 01:41:06', '2021-11-21 19:41:06'),
('f2645fca9619dce7e2678f0841b351300bb08e8913c109f1ab4cad835d05d0be514a227d29cf3659', 21, 1, 'mobile', '[]', 1, '2020-10-29 13:02:30', '2020-10-29 13:02:30', '2021-10-29 08:02:30'),
('f4ce99828acffa062a803aefd1285700de0a37a319776e990040b81d35df551aa6b9f1fc24614522', 21, 1, 'mobile', '[]', 1, '2020-11-15 15:06:24', '2020-11-15 15:06:24', '2021-11-15 09:06:24'),
('f5db7aebfac4d101c584d0ed103f9741fe14a9f92999d5f367545dbcdbca901483798ca8b7641222', 64, 1, 'mobile', '[]', 1, '2020-11-20 17:42:00', '2020-11-20 17:42:00', '2021-11-20 11:42:00'),
('f67039bc028777f985bcb1b72e086837a8021051e57ffbb9a0ca0e611739c82eba7bcf70d37e8310', 1, 1, 'mobile', '[]', 1, '2020-11-22 11:31:34', '2020-11-22 11:31:34', '2021-11-22 05:31:34'),
('fad6ea10303256679efb558faeef53cb9a5cc7ab7a39f9bec9220ebe972764a80eadee534b39f971', 21, 1, 'mobile', '[]', 1, '2020-11-12 19:36:55', '2020-11-12 19:36:55', '2021-11-12 13:36:55'),
('fea212be04fb1ed93dd60925853f9eecbec970d5be073b05bb938d1ac2518881ac49ccc6aeb12084', 21, 1, 'mobile', '[]', 0, '2020-11-28 21:26:50', '2020-11-28 21:26:50', '2021-11-28 15:26:50'),
('ffb3a8ffe58699f77214c137469019d81d2e7d5e5fa6a8b66783d3d9e5f88b297d711293ff1b5556', 21, 1, 'mobile', '[]', 1, '2020-11-07 00:52:32', '2020-11-07 00:52:32', '2021-11-06 18:52:32');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'yes', 'QDU8pHE4o8pYIZBh7bWZT2lFtYbvJnezaWS1eZhk', NULL, 'http://localhost', 1, 0, 0, '2020-10-28 11:45:24', '2020-10-28 11:45:24');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-28 11:45:24', '2020-10-28 11:45:24');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `garage_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('accepted','rejected','waiting') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `rejected_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_reviewed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `orders`
--

INSERT INTO `orders` (`id`, `garage_id`, `user_id`, `date`, `time`, `description`, `status`, `rejected_message`, `created_at`, `updated_at`, `is_reviewed`) VALUES
(1, 21, 1, '2020-10-28', '13:09:00', 'gdfgdfgfd', 'waiting', NULL, '2020-10-28 16:09:18', '2020-10-28 16:09:18', 0),
(2, 1, 1, '2020-10-30', '15:17:00', 'تمام.', 'accepted', NULL, '2020-10-28 20:18:08', '2020-10-29 16:54:29', 1),
(3, 21, 1, '2020-10-29', '08:56:00', 'fdgdfgdfgf', 'waiting', NULL, '2020-10-29 11:56:42', '2020-10-29 11:56:42', 0),
(4, 2, 1, '2020-10-29', '14:48:00', 'غسيل للسيارة.', 'waiting', NULL, '2020-10-29 17:48:51', '2020-10-29 17:48:51', 0),
(5, 2, 1, '2020-10-31', '19:33:00', 'غسيل للسيارة.', 'waiting', NULL, '2020-10-31 22:34:58', '2020-10-31 22:34:58', 0),
(6, 21, 1, '2020-11-06', '16:30:00', 'gfdgfdgfdg', 'waiting', NULL, '2020-11-06 20:36:17', '2020-11-06 20:36:17', 0),
(7, 21, 1, '2020-11-06', '16:39:00', 'hgfhgfh', 'waiting', NULL, '2020-11-06 20:39:32', '2020-11-06 20:39:32', 0),
(8, 31, 1, '2020-11-06', '19:00:00', 'تفاصبييل', 'waiting', NULL, '2020-11-06 23:01:25', '2020-11-06 23:01:25', 0),
(9, 31, 1, '2020-11-06', '20:42:00', 'وصفف', 'waiting', NULL, '2020-11-07 00:42:56', '2020-11-07 00:42:56', 0),
(10, 1, 1, '2020-11-20', '03:11:00', 'Washing', 'rejected', 'test', '2020-11-07 09:13:40', '2020-11-12 15:56:55', 0),
(11, 31, 54, '2020-11-11', '10:59:00', 'a', 'waiting', NULL, '2020-11-11 15:01:03', '2020-11-11 15:01:03', 0),
(12, 33, 57, '2020-11-11', '11:55:00', 'test', 'rejected', 'not available now', '2020-11-11 15:54:24', '2020-11-11 15:56:01', 1),
(13, 33, 58, '2020-11-11', '15:35:00', 'testorder', 'accepted', NULL, '2020-11-11 19:34:58', '2020-11-11 19:36:29', 1),
(14, 33, 58, '2020-11-12', '10:31:00', 'تست', 'rejected', 'test', '2020-11-12 14:31:29', '2020-11-12 14:34:35', 0),
(15, 33, 58, '2020-11-12', '10:31:00', 'تست', 'rejected', 'test', '2020-11-12 14:31:29', '2020-11-12 14:36:20', 0),
(16, 31, 58, '2020-11-12', '10:42:00', 'test', 'waiting', NULL, '2020-11-12 14:43:24', '2020-11-12 14:43:24', 0),
(17, 1, 57, '2020-11-12', '11:53:00', 'testtt', 'rejected', 'test done', '2020-11-12 15:53:33', '2020-11-12 15:56:07', 0),
(18, 1, 1, '2020-11-15', '11:07:00', 'kjhjgk', 'accepted', NULL, '2020-11-15 15:08:08', '2020-11-27 07:43:13', 1),
(19, 1, 1, '2020-11-15', '11:09:00', 'tyuytyutuyui', 'accepted', NULL, '2020-11-15 15:09:35', '2020-11-26 21:46:49', 1),
(20, 1, 67, '2020-11-17', '14:23:00', 'test', 'rejected', 'test', '2020-11-17 18:22:15', '2020-11-17 19:19:03', 0),
(21, 1, 67, '2020-11-17', '14:53:00', 'aaa', 'rejected', 'test', '2020-11-17 18:52:37', '2020-11-17 19:19:18', 0),
(22, 1, 57, '2020-11-19', '14:22:00', 'test', 'rejected', 'test', '2020-11-19 18:21:45', '2020-11-19 18:24:29', 0),
(23, 2, 64, '2020-11-23', '16:00:00', 'فخص تطبيق وينه', 'accepted', NULL, '2020-11-20 17:03:11', '2020-11-20 17:34:16', 1),
(24, 1, 64, '2020-11-24', '13:29:00', 'فخص حجز موعد مع التقييم', 'accepted', NULL, '2020-11-20 17:30:55', '2020-11-20 17:32:21', 0),
(25, 1, 1, '2020-11-28', '01:16:00', 'غسيل.', 'accepted', NULL, '2020-11-22 14:16:44', '2020-11-27 11:09:00', 1),
(26, 1, 64, '2020-11-29', '16:00:00', 'فحص تطبيق وينه - حجز الموعد', 'accepted', NULL, '2020-11-26 20:11:36', '2020-11-26 21:32:45', 1),
(27, 1, 64, '2020-11-30', '09:00:00', 'فحص التطبيق', 'accepted', NULL, '2020-11-27 01:13:19', '2020-11-27 01:25:49', 0),
(28, 1, 1, '2020-11-27', '03:47:00', 'gfdgdfg', 'rejected', 'gfdgdgdfg', '2020-11-27 07:47:43', '2020-11-27 07:50:35', 0),
(29, 1, 1, '2020-11-27', '03:48:00', 'sfdsdffdgdfg', 'accepted', NULL, '2020-11-27 07:48:52', '2020-11-27 07:52:00', 0),
(30, 1, 64, '2020-11-28', '09:00:00', 'فحص الاشعارات', 'rejected', 'لا تتوفر الخدمة', '2020-11-28 01:54:57', '2020-11-28 02:02:28', 0),
(31, 1, 1, '2020-11-28', '17:22:00', 'fdsfdsfsdf', 'rejected', NULL, '2020-11-28 21:23:22', '2020-11-28 21:29:06', 0);

-- --------------------------------------------------------

--
-- بنية الجدول `order_images`
--

CREATE TABLE `order_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `order_images`
--

INSERT INTO `order_images` (`id`, `image`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 'orders/h753MHbctxaG30CUryMMHfmfNq4HcKqthrUphdqW.jpeg', 6, '2020-11-06 20:36:17', '2020-11-06 20:36:17'),
(2, 'orders/08FbMZelWMYzMhcZbTemu1L99TK5oMBlbfWe46qj.jpeg', 6, '2020-11-06 20:36:17', '2020-11-06 20:36:17'),
(3, 'orders/pO54qSwWnqfSoOEc1UBtpoq7a9wxcaUSwBDJd2lz.jpeg', 6, '2020-11-06 20:36:17', '2020-11-06 20:36:17'),
(4, 'orders/ZTxxjQ7YdCDmPEMKK8Z2Ysr3xchrZrGhGxJjZybn.jpeg', 7, '2020-11-06 20:39:32', '2020-11-06 20:39:32'),
(5, 'orders/GAXtwyBRJLqRP5KRLNgEZhEfVLLqUrOEbC1HdHER.jpeg', 8, '2020-11-06 23:01:25', '2020-11-06 23:01:25'),
(6, 'orders/bjxwmVD2tUlqd3EhFthoJTEvvTJDWWQ3kdJ4JUmh.jpeg', 8, '2020-11-06 23:01:25', '2020-11-06 23:01:25'),
(7, 'orders/7jQbiirqFAlDSjaoySCTzJ1PEDHhE32uLa3ldfge.jpeg', 9, '2020-11-07 00:42:56', '2020-11-07 00:42:56'),
(8, 'orders/KfRbCU4gtMvMaiCKG2286Cr7vBiLrsOITkusel9E.jpeg', 9, '2020-11-07 00:42:56', '2020-11-07 00:42:56'),
(9, 'orders/UKZEYIZngR4EVrgCO8HxG5kvDi2D0pa2x2RD3klY.jpeg', 10, '2020-11-07 09:13:40', '2020-11-07 09:13:40'),
(10, 'orders/RyShWiMc8tVQh4ig5ECVQVSWX77xA9lSXVohJlS9.jpeg', 10, '2020-11-07 09:13:40', '2020-11-07 09:13:40'),
(11, 'orders/KdR4oAQvQ8qae19N66P2eeeryDAQZmSdFnNksJNz.jpeg', 10, '2020-11-07 09:13:40', '2020-11-07 09:13:40'),
(12, 'orders/zaDpEH3dU2TiVFypUInLwRK4tVe7pMhphZ7jXYhU.jpeg', 10, '2020-11-07 09:13:40', '2020-11-07 09:13:40'),
(13, 'orders/8IOi0k6SEZeAq0h3cCETQlBwfIzucx1kXWcfLRo9.jpeg', 10, '2020-11-07 09:13:40', '2020-11-07 09:13:40'),
(14, 'orders/gSicJu2eJSBO9Y8eBAdi0Hd46WbarjpFhyklO0oP.jpeg', 10, '2020-11-07 09:13:40', '2020-11-07 09:13:40'),
(15, 'orders/WT3gfaHXSJCImDsb8K1ayL17RTm83CUXnzYYn6ma.jpeg', 11, '2020-11-11 15:01:03', '2020-11-11 15:01:03'),
(16, 'orders/ullrhyO6UacGHl5i9964L9o4D4krT4PtvXzBUJm5.jpeg', 12, '2020-11-11 15:54:24', '2020-11-11 15:54:24'),
(17, 'orders/Cyxnze3p7kUrtBgiz7VdHch03P5pQvoSFmbthEBS.jpeg', 13, '2020-11-11 19:34:58', '2020-11-11 19:34:58'),
(18, 'orders/vkQxh55BxK90gaQ1QCs41f76G3jn9qujsLlzWQv6.jpeg', 14, '2020-11-12 14:31:29', '2020-11-12 14:31:29'),
(19, 'orders/TcsGSUSgEY0EiBNT3taKuecY9KJW45x4rCw05Czj.jpeg', 15, '2020-11-12 14:31:29', '2020-11-12 14:31:29'),
(20, 'orders/XavgVa7y1y7U4bghHR4cLgWWMUdsKw7d34l2H0Ns.jpeg', 16, '2020-11-12 14:43:24', '2020-11-12 14:43:24'),
(21, 'orders/GQsYCFGP0kFSHR2xt6VmuZAzloDPgZatwz6TbQoq.jpeg', 17, '2020-11-12 15:53:33', '2020-11-12 15:53:33'),
(22, 'orders/sHFTdFJ8zjbBBWa2DFOs6FBb8zbQqYo0hE2nVdRP.jpeg', 18, '2020-11-15 15:08:08', '2020-11-15 15:08:08'),
(23, 'orders/pcFhl7yYZ1hu9frGpZCfDfN6Jsuas5ZndVi5zf9u.jpeg', 18, '2020-11-15 15:08:08', '2020-11-15 15:08:08'),
(24, 'orders/zkRMAANo6QzokFyx4nL0SAGFdkPmEgn5oTe7x9wF.jpeg', 19, '2020-11-15 15:09:35', '2020-11-15 15:09:35'),
(25, 'orders/7m3AP1k4LMSiQVLVfMrDiPXMj7FdYgfEjufPVx02.jpeg', 19, '2020-11-15 15:09:35', '2020-11-15 15:09:35'),
(26, 'orders/8FtWdWcS6pQ3vYFM55b6iK4MZfq8TSBV0tN8HfNa.jpeg', 20, '2020-11-17 18:22:15', '2020-11-17 18:22:15'),
(27, 'orders/PAQ8UVHKSD26tEhmH6JdSjk1PDs7BsB3JuVHFWCp.jpeg', 21, '2020-11-17 18:52:37', '2020-11-17 18:52:37'),
(28, 'orders/BiMrqPqQvptKGfxWAEql0LqHfCDD7crIGT2R6n3z.jpeg', 22, '2020-11-19 18:21:45', '2020-11-19 18:21:45'),
(29, 'orders/JGvAcxdR1LDToQFGAR2xb7V5PIXYLikL2gBjbV5v.jpeg', 23, '2020-11-20 17:03:11', '2020-11-20 17:03:11'),
(30, 'orders/e4BSnirh9L1TYpTFo8Tl98hgTRCWgJdSKCS3lnMl.jpeg', 23, '2020-11-20 17:03:11', '2020-11-20 17:03:11'),
(31, 'orders/Fjnm6rFz4gW4fjuustgJT967CJRhp0tdlAkwxXMI.jpeg', 24, '2020-11-20 17:30:55', '2020-11-20 17:30:55'),
(32, 'orders/YeHA10Y6k3CHKqxETBJJSg0FEg8kILzamTaHhKnf.jpeg', 25, '2020-11-22 14:16:44', '2020-11-22 14:16:44'),
(33, 'orders/282a1n8A30t4xuxkF92FyxpoN29reAC0kdr56pze.jpeg', 25, '2020-11-22 14:16:44', '2020-11-22 14:16:44'),
(34, 'orders/tsJ5hHSDauuQsDnitkwc6JHlploc9nZdY3z6Kcf3.jpeg', 26, '2020-11-26 20:11:36', '2020-11-26 20:11:36'),
(35, 'orders/dE8FdOiqPe01IUp2zecp70NPKDOHbuLZgzaZWPUa.jpeg', 27, '2020-11-27 01:13:19', '2020-11-27 01:13:19'),
(36, 'orders/QRPrpA8q5hw7qPnQUBvuk0svJ5yPkoYRvAnguWqk.jpeg', 28, '2020-11-27 07:47:43', '2020-11-27 07:47:43'),
(37, 'orders/zG5OaTLYRPXLQY7vHnBOn0Y9Qsqk8V4BzfN8CKQk.jpeg', 29, '2020-11-27 07:48:52', '2020-11-27 07:48:52'),
(38, 'orders/GM9XENKyQDGsroF4Txekf2Ys7r2kA5iiOEMzyZlN.jpeg', 30, '2020-11-28 01:54:57', '2020-11-28 01:54:57'),
(39, 'orders/El4lX70Ohk0S6k389J8dQGPXLxIOBPN1U7SAohE9.jpeg', 31, '2020-11-28 21:23:22', '2020-11-28 21:23:22');

-- --------------------------------------------------------

--
-- بنية الجدول `order_service`
--

CREATE TABLE `order_service` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `order_service`
--

INSERT INTO `order_service` (`order_id`, `service_id`) VALUES
(1, 3),
(1, 12),
(1, 21),
(2, 13),
(2, 22),
(3, 3),
(3, 21),
(4, 8),
(4, 17),
(4, 26),
(5, 26),
(6, 12),
(6, 21),
(7, 3),
(8, 26),
(9, 23),
(9, 26),
(10, 4),
(10, 13),
(10, 18),
(10, 27),
(10, 28),
(11, 23),
(12, 1),
(13, 10),
(14, 2),
(15, 2),
(16, 23),
(17, 28),
(18, 10),
(19, 10),
(20, 10),
(21, 10),
(22, 10),
(23, 8),
(24, 19),
(25, 1),
(25, 10),
(25, 19),
(26, 1),
(27, 1),
(28, 1),
(28, 10),
(28, 19),
(29, 1),
(29, 19),
(30, 1),
(31, 1),
(31, 19);

-- --------------------------------------------------------

--
-- بنية الجدول `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `pages`
--

INSERT INTO `pages` (`id`, `image`, `name`, `views`, `created_at`, `updated_at`) VALUES
(1, 'pages/Zx8Yu6tjJBhTHW6YsTpgRFS6KKMtVkSuht6be0MV.png', 'about_us', 0, '2020-10-28 16:04:33', '2020-10-29 16:01:26'),
(2, NULL, 'privacy_policy', 0, '2020-10-28 16:04:33', '2020-10-28 16:04:33'),
(3, NULL, 'terms_of_use', 0, '2020-10-28 16:04:33', '2020-10-28 16:04:33');

-- --------------------------------------------------------

--
-- بنية الجدول `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `page_translations`
--

INSERT INTO `page_translations` (`id`, `locale`, `slug`, `title`, `description`, `keywords`, `page_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'About-us', 'About us', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ar</p>', NULL, 1, '2020-10-28 16:04:33', '2020-10-29 16:01:26'),
(2, 'ar', 'من-نحن', 'من نحن', '<p>Lorem&nbsp;Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ar</p>', NULL, 1, '2020-10-28 16:04:33', '2020-11-18 18:50:24'),
(3, 'en', 'Privacy-Policy', 'Privacy Policy', '<div class=\"en section_container active\" style=\"box-sizing: border-box; opacity: 1; animation: 1s ease 0s 1 normal none running fade;\">\r\n<div class=\"agreement_md\" id=\"md_en\" style=\"box-sizing: border-box;\">\r\n<div class=\"en section_container active\" style=\"box-sizing: border-box; opacity: 1; animation: 1s ease 0s 1 normal none running fade;\">\r\n<div class=\"agreement_md\" id=\"md_en\" style=\"box-sizing: border-box;\">\r\n<div class=\"en section_container active\" style=\"box-sizing: border-box; opacity: 1; animation: 1s ease 0s 1 normal none running fade;\">\r\n<div class=\"agreement_md\" id=\"md_en\" style=\"box-sizing: border-box;\">\r\n<div class=\"en section_container active\" style=\"box-sizing: border-box; opacity: 1; animation: 1s ease 0s 1 normal none running fade;\">\r\n<div class=\"agreement_md\" id=\"md_en\" style=\"box-sizing: border-box;\">\r\n<h1>Privacy Policy</h1>\r\n\r\n<p>Last updated: November 17, 2020</p>\r\n\r\n<p>This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.</p>\r\n\r\n<h1>Interpretation and Definitions</h1>\r\n\r\n<h2>Interpretation</h2>\r\n\r\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\r\n\r\n<h2>Definitions</h2>\r\n\r\n<p>For the purposes of this Privacy Policy:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Account&nbsp;means a unique account created for You to access our Service or parts of our Service.</p>\r\n	</li>\r\n	<li>\r\n	<p>Company&nbsp;(referred to as either &quot;the Company&quot;, &quot;We&quot;, &quot;Us&quot; or &quot;Our&quot; in this Agreement) refers to garage, saudi arabia.</p>\r\n	</li>\r\n	<li>\r\n	<p>Cookies&nbsp;are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.</p>\r\n	</li>\r\n	<li>\r\n	<p>Device&nbsp;means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>\r\n	</li>\r\n	<li>\r\n	<p>Personal Data&nbsp;is any information that relates to an identified or identifiable individual.</p>\r\n	</li>\r\n	<li>\r\n	<p>Service Provider&nbsp;means any natural or legal person who processes the data on behalf of the Company.</p>\r\n	</li>\r\n	<li>\r\n	<p>Usage Data&nbsp;refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).</p>\r\n	</li>\r\n	<li>\r\n	<p>Website&nbsp;refers to karajat, accessible from&nbsp;<a href=\"http://garagat.hexacit.com/en\" rel=\"external nofollow noopener\" style=\"color: rgb(73, 57, 106); box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.3s ease 0s;\" target=\"_blank\">http://garagat.hexacit.com/en</a></p>\r\n	</li>\r\n	<li>\r\n	<p>You&nbsp;means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h1>Collecting and Using Your Personal Data</h1>\r\n\r\n<h2>Types of Data Collected</h2>\r\n\r\n<h3><u><strong>Personal Data</strong></u></h3>\r\n\r\n<p>While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Email address ,First name and last name ,Phone number ,Address, State, Province, ZIP/Postal code, City ,Usage Data</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><u><strong>Usage Data</strong></u></h3>\r\n\r\n<p>Usage Data is collected automatically when using the Service.</p>\r\n\r\n<p>Usage Data may include information such as Your Device&#39;s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.</p>\r\n\r\n<p>When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.</p>\r\n\r\n<p>We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.</p>\r\n\r\n<h3><u><strong>Tracking Technologies and Cookies</strong></u></h3>\r\n\r\n<p>We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:</p>\r\n\r\n<ul>\r\n	<li>Cookies or Browser Cookies.&nbsp;A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.</li>\r\n	<li>Flash Cookies.&nbsp;Certain features of our Service may use local stored objects (or Flash Cookies) to collect and store information about Your preferences or Your activity on our Service. Flash Cookies are not managed by the same browser settings as those used for Browser Cookies.</li>\r\n</ul>\r\n\r\n<p>Cookies can be &quot;Persistent&quot; or &quot;Session&quot; Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser. Learn more about cookies:&nbsp;<a href=\"https://www.freeprivacypolicy.com/blog/cookies/\" style=\"color: rgb(73, 57, 106); box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.3s ease 0s;\" target=\"_blank\">Cookies: What Do They Do?</a>.</p>\r\n\r\n<p>For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.</p>\r\n\r\n<h2><u>Use of Your Personal Data</u></h2>\r\n\r\n<p>The Company may use Personal Data for the following purposes:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>To provide and maintain our Service, including to monitor the usage of our Service.</p>\r\n	</li>\r\n	<li>\r\n	<p>To manage Your Account:&nbsp;to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.</p>\r\n	</li>\r\n	<li>\r\n	<p>For the performance of a contract:&nbsp;the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.</p>\r\n	</li>\r\n	<li>\r\n	<p>To contact You:&nbsp;To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application&#39;s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.</p>\r\n	</li>\r\n	<li>\r\n	<p>To provide You&nbsp;with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.</p>\r\n	</li>\r\n	<li>\r\n	<p>To manage Your requests:&nbsp;To attend and manage Your requests to Us.</p>\r\n	</li>\r\n	<li>\r\n	<p>For business transfers:&nbsp;We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.</p>\r\n	</li>\r\n	<li>\r\n	<p>For other purposes: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>We may share Your personal information in the following situations:</p>\r\n\r\n<ul>\r\n	<li>With Service Providers:&nbsp;We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.</li>\r\n	<li>For business transfers:&nbsp;We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.</li>\r\n	<li>With Affiliates:&nbsp;We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.</li>\r\n	<li>With business partners:&nbsp;We may share Your information with Our business partners to offer You certain products, services or promotions.</li>\r\n	<li>With other users:&nbsp;when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside. If You interact with other users or register through a Third-Party Social Media Service, Your contacts on the Third-Party Social Media Service may see Your name, profile, pictures and description of Your activity. Similarly, other users will be able to view descriptions of Your activity, communicate with You and view Your profile.</li>\r\n	<li>With Your consent: We may disclose Your personal information for any other purpose with Your consent.</li>\r\n</ul>\r\n\r\n<h2><u>Retention of Your Personal Data</u></h2>\r\n\r\n<p>The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.</p>\r\n\r\n<p>The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.</p>\r\n\r\n<h2><u>Transfer of Your Personal Data</u></h2>\r\n\r\n<p>Your information, including Personal Data, is processed at the Company&#39;s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to &mdash; and maintained on &mdash; computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.</p>\r\n\r\n<p>Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.</p>\r\n\r\n<p>The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.</p>\r\n\r\n<h2><u>Disclosure of Your Personal Data</u></h2>\r\n\r\n<h3>Business Transactions</h3>\r\n\r\n<p>If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.</p>\r\n\r\n<h3>Law enforcement</h3>\r\n\r\n<p>Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).</p>\r\n\r\n<h3>Other legal requirements</h3>\r\n\r\n<p>The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:</p>\r\n\r\n<ul>\r\n	<li>Comply with a legal obligation</li>\r\n	<li>Protect and defend the rights or property of the Company</li>\r\n	<li>Prevent or investigate possible wrongdoing in connection with the Service</li>\r\n	<li>Protect the personal safety of Users of the Service or the public</li>\r\n	<li>Protect against legal liability</li>\r\n</ul>\r\n\r\n<h2><u>Security of Your Personal Data</u></h2>\r\n\r\n<p>The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.</p>\r\n\r\n<h1>Changes to this Privacy Policy</h1>\r\n\r\n<p>We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the &quot;Last updated&quot; date at the top of this Privacy Policy.</p>\r\n\r\n<p>You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p>\r\n\r\n<h1>Contact Us</h1>\r\n\r\n<p>If you have any questions about this Privacy Policy, You can contact us:</p>\r\n\r\n<ul>\r\n	<li>By visiting this page on our website:&nbsp;<a href=\"http://garagat.hexacit.com/en/contact_us\" rel=\"external nofollow noopener\" style=\"color: rgb(34, 19, 65); box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.3s ease 0s;\" target=\"_blank\">http://garagat.hexacit.com/en/contact_us</a></li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\"agreement_output\" id=\"out_en\" style=\"box-sizing: border-box;\">&nbsp;</div>\r\n</div>\r\n\r\n<div class=\"container\" style=\"box-sizing: border-box; position: relative; max-width: 980px; margin-left: auto; margin-right: auto; padding-left: 20px; padding-right: 20px;\">Privacy Policy for weenah.</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, 2, '2020-10-28 16:04:33', '2020-11-19 16:08:43'),
(4, 'ar', 'سياية-الخصوصية', 'سياية الخصوصية', '<div class=\"en section_container active\" style=\"box-sizing: border-box; opacity: 1; animation: 1s ease 0s 1 normal none running fade;\">\r\n<div class=\"agreement_md\" id=\"md_en\" style=\"box-sizing: border-box;\">\r\n<h1>Privacy Policy</h1>\r\n\r\n<p>Last updated: November 17, 2020</p>\r\n\r\n<p>This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.</p>\r\n\r\n<h1>Interpretation and Definitions</h1>\r\n\r\n<h2>Interpretation</h2>\r\n\r\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\r\n\r\n<h2>Definitions</h2>\r\n\r\n<p>For the purposes of this Privacy Policy:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Account&nbsp;means a unique account created for You to access our Service or parts of our Service.</p>\r\n	</li>\r\n	<li>\r\n	<p>Company&nbsp;(referred to as either &quot;the Company&quot;, &quot;We&quot;, &quot;Us&quot; or &quot;Our&quot; in this Agreement) refers to garage, saudi arabia.</p>\r\n	</li>\r\n	<li>\r\n	<p>Cookies&nbsp;are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.</p>\r\n	</li>\r\n	<li>\r\n	<p>Device&nbsp;means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>\r\n	</li>\r\n	<li>\r\n	<p>Personal Data&nbsp;is any information that relates to an identified or identifiable individual.</p>\r\n	</li>\r\n	<li>\r\n	<p>Service Provider&nbsp;means any natural or legal person who processes the data on behalf of the Company.</p>\r\n	</li>\r\n	<li>\r\n	<p>Usage Data&nbsp;refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).</p>\r\n	</li>\r\n	<li>\r\n	<p>Website&nbsp;refers to karajat, accessible from&nbsp;<a href=\"http://garagat.hexacit.com/en\" rel=\"external nofollow noopener\" style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; color: rgb(73, 57, 106); transition: color 0.3s ease 0s;\" target=\"_blank\">http://garagat.hexacit.com/en</a></p>\r\n	</li>\r\n	<li>\r\n	<p>You&nbsp;means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h1>Collecting and Using Your Personal Data</h1>\r\n\r\n<h2>Types of Data Collected</h2>\r\n\r\n<h3><u><strong>Personal Data</strong></u></h3>\r\n\r\n<p>While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Email address ,First name and last name ,Phone number ,Address, State, Province, ZIP/Postal code, City ,Usage Data</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><u><strong>Usage Data</strong></u></h3>\r\n\r\n<p>Usage Data is collected automatically when using the Service.</p>\r\n\r\n<p>Usage Data may include information such as Your Device&#39;s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.</p>\r\n\r\n<p>When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.</p>\r\n\r\n<p>We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.</p>\r\n\r\n<h3><u><strong>Tracking Technologies and Cookies</strong></u></h3>\r\n\r\n<p>We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:</p>\r\n\r\n<ul>\r\n	<li>Cookies or Browser Cookies.&nbsp;A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.</li>\r\n	<li>Flash Cookies.&nbsp;Certain features of our Service may use local stored objects (or Flash Cookies) to collect and store information about Your preferences or Your activity on our Service. Flash Cookies are not managed by the same browser settings as those used for Browser Cookies.</li>\r\n</ul>\r\n\r\n<p>Cookies can be &quot;Persistent&quot; or &quot;Session&quot; Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser. Learn more about cookies:&nbsp;<a href=\"https://www.freeprivacypolicy.com/blog/cookies/\" style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; color: rgb(73, 57, 106); transition: color 0.3s ease 0s;\" target=\"_blank\">Cookies: What Do They Do?</a>.</p>\r\n\r\n<p>For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.</p>\r\n\r\n<h2><u>Use of Your Personal Data</u></h2>\r\n\r\n<p>The Company may use Personal Data for the following purposes:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>To provide and maintain our Service, including to monitor the usage of our Service.</p>\r\n	</li>\r\n	<li>\r\n	<p>To manage Your Account:&nbsp;to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.</p>\r\n	</li>\r\n	<li>\r\n	<p>For the performance of a contract:&nbsp;the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.</p>\r\n	</li>\r\n	<li>\r\n	<p>To contact You:&nbsp;To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application&#39;s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.</p>\r\n	</li>\r\n	<li>\r\n	<p>To provide You&nbsp;with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.</p>\r\n	</li>\r\n	<li>\r\n	<p>To manage Your requests:&nbsp;To attend and manage Your requests to Us.</p>\r\n	</li>\r\n	<li>\r\n	<p>For business transfers:&nbsp;We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.</p>\r\n	</li>\r\n	<li>\r\n	<p>For other purposes: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>We may share Your personal information in the following situations:</p>\r\n\r\n<ul>\r\n	<li>With Service Providers:&nbsp;We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.</li>\r\n	<li>For business transfers:&nbsp;We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.</li>\r\n	<li>With Affiliates:&nbsp;We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.</li>\r\n	<li>With business partners:&nbsp;We may share Your information with Our business partners to offer You certain products, services or promotions.</li>\r\n	<li>With other users:&nbsp;when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside. If You interact with other users or register through a Third-Party Social Media Service, Your contacts on the Third-Party Social Media Service may see Your name, profile, pictures and description of Your activity. Similarly, other users will be able to view descriptions of Your activity, communicate with You and view Your profile.</li>\r\n	<li>With Your consent: We may disclose Your personal information for any other purpose with Your consent.</li>\r\n</ul>\r\n\r\n<h2><u>Retention of Your Personal Data</u></h2>\r\n\r\n<p>The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.</p>\r\n\r\n<p>The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.</p>\r\n\r\n<h2><u>Transfer of Your Personal Data</u></h2>\r\n\r\n<p>Your information, including Personal Data, is processed at the Company&#39;s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to &mdash; and maintained on &mdash; computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.</p>\r\n\r\n<p>Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.</p>\r\n\r\n<p>The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.</p>\r\n\r\n<h2><u>Disclosure of Your Personal Data</u></h2>\r\n\r\n<h3>Business Transactions</h3>\r\n\r\n<p>If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.</p>\r\n\r\n<h3>Law enforcement</h3>\r\n\r\n<p>Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).</p>\r\n\r\n<h3>Other legal requirements</h3>\r\n\r\n<p>The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:</p>\r\n\r\n<ul>\r\n	<li>Comply with a legal obligation</li>\r\n	<li>Protect and defend the rights or property of the Company</li>\r\n	<li>Prevent or investigate possible wrongdoing in connection with the Service</li>\r\n	<li>Protect the personal safety of Users of the Service or the public</li>\r\n	<li>Protect against legal liability</li>\r\n</ul>\r\n\r\n<h2><u>Security of Your Personal Data</u></h2>\r\n\r\n<p>The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.</p>\r\n\r\n<h1>Changes to this Privacy Policy</h1>\r\n\r\n<p>We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the &quot;Last updated&quot; date at the top of this Privacy Policy.</p>\r\n\r\n<p>You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p>\r\n\r\n<h1>Contact Us</h1>\r\n\r\n<p>If you have any questions about this Privacy Policy, You can contact us:</p>\r\n\r\n<ul>\r\n	<li>By visiting this page on our website:&nbsp;<a href=\"http://garagat.hexacit.com/en/contact_us\" rel=\"external nofollow noopener\" style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; color: rgb(34, 19, 65); transition: color 0.3s ease 0s;\" target=\"_blank\">http://garagat.hexacit.com/en/contact_us</a></li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\"agreement_output\" id=\"out_en\" style=\"box-sizing: border-box;\">&nbsp;</div>\r\n</div>\r\n\r\n<div class=\"container\" style=\"box-sizing: border-box; position: relative; max-width: 980px; margin-left: auto; margin-right: auto; padding-left: 20px; padding-right: 20px;\">Privacy Policy for weenah.</div>', NULL, 2, '2020-10-28 16:04:33', '2020-11-19 16:08:21'),
(5, 'en', 'Terms-Of-Use', 'Terms Of Use', '<p>Last updated: November 17, 2020</p>\r\n\r\n<p>Please read these terms and conditions carefully before using Our Service.</p>\r\n\r\n<h1>Acknowledgment</h1>\r\n\r\n<p>These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.</p>\r\n\r\n<p>Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.</p>\r\n\r\n<p>By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.</p>\r\n\r\n<p>You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.</p>\r\n\r\n<p>Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.</p>\r\n\r\n<h1>Termination</h1>\r\n\r\n<p>We may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.</p>\r\n\r\n<p>Upon termination, Your right to use the Service will cease immediately.</p>\r\n\r\n<h1>Limitation of Liability</h1>\r\n\r\n<p>Notwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven&#39;t purchased anything through the Service.</p>\r\n\r\n<p>To the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.</p>\r\n\r\n<p>Some states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party&#39;s liability will be limited to the greatest extent permitted by law.</p>\r\n\r\n<h1>&quot;AS IS&quot; and &quot;AS AVAILABLE&quot; Disclaimer</h1>\r\n\r\n<p>The Service is provided to You &quot;AS IS&quot; and &quot;AS AVAILABLE&quot; and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own behalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and makes no representation of any kind that the Service will meet Your requirements, achieve any intended results, be compatible or work with any other software, applications, systems or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.</p>\r\n\r\n<h1>Governing Law</h1>\r\n\r\n<p>The laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also be subject to other local, state, national, or international laws.</p>\r\n\r\n<h1>Changes to These Terms and Conditions</h1>\r\n\r\n<p>We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days&#39; notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.</p>\r\n\r\n<p>By continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.</p>\r\n\r\n<h1>Contact Us</h1>\r\n\r\n<p>If you have any questions about these Terms and Conditions, You can contact us:&nbsp;By visiting this page on our website:&nbsp;<a href=\"http://garagat.hexacit.com/en/contact_us\" rel=\"external nofollow noopener\" style=\"color: rgb(68, 68, 68); box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.3s ease 0s;\" target=\"_blank\">http://garagat.hexacit.com/en/contact_</a></p>', NULL, 3, '2020-10-28 16:04:33', '2020-11-19 16:22:24'),
(6, 'ar', 'شروط-الاستخدام', 'شروط الاستخدام', '<p>Last updated: November 17, 2020</p>\r\n\r\n<p>Please read these terms and conditions carefully before using Our Service.</p>\r\n\r\n<h1>Acknowledgment</h1>\r\n\r\n<p>These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.</p>\r\n\r\n<p>Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.</p>\r\n\r\n<p>By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.</p>\r\n\r\n<p>You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.</p>\r\n\r\n<p>Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.</p>\r\n\r\n<h1>Termination</h1>\r\n\r\n<p>We may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.</p>\r\n\r\n<p>Upon termination, Your right to use the Service will cease immediately.</p>\r\n\r\n<h1>Limitation of Liability</h1>\r\n\r\n<p>Notwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven&#39;t purchased anything through the Service.</p>\r\n\r\n<p>To the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.</p>\r\n\r\n<p>Some states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party&#39;s liability will be limited to the greatest extent permitted by law.</p>\r\n\r\n<h1>&quot;AS IS&quot; and &quot;AS AVAILABLE&quot; Disclaimer</h1>\r\n\r\n<p>The Service is provided to You &quot;AS IS&quot; and &quot;AS AVAILABLE&quot; and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own behalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and makes no representation of any kind that the Service will meet Your requirements, achieve any intended results, be compatible or work with any other software, applications, systems or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.</p>\r\n\r\n<h1>Governing Law</h1>\r\n\r\n<p>The laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also be subject to other local, state, national, or international laws.</p>\r\n\r\n<h1>Changes to These Terms and Conditions</h1>\r\n\r\n<p>We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days&#39; notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.</p>\r\n\r\n<p>By continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.</p>\r\n\r\n<h1>Contact Us</h1>\r\n\r\n<p>If you have any questions about these Terms and Conditions, You can contact us: By visiting this page on our website:&nbsp;<a href=\"http://garagat.hexacit.com/en/contact_us\" rel=\"external nofollow noopener\" style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; color: rgb(68, 68, 68); transition: color 0.3s ease 0s;\" target=\"_blank\">http://garagat.hexacit.com/en/contact_us</a></p>', NULL, 3, '2020-10-28 16:04:33', '2020-11-19 16:22:24');

-- --------------------------------------------------------

--
-- بنية الجدول `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `roleSlug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `permissions`
--

INSERT INTO `permissions` (`id`, `roleSlug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'users', NULL, '2020-10-27 17:52:19', '2020-10-27 17:52:19'),
(2, 'car-type', NULL, '2020-10-27 17:52:19', '2020-10-27 17:52:19'),
(3, 'categories', NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(4, 'garages', NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(5, 'orders', NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(6, 'contact-us', NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(7, 'settings', NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(8, 'plans', NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(9, 'services', NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(10, 'admins', NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(11, 'notifications', NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(12, 'advertisements', NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(13, 'sliders', NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(14, 'garage-requests', NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20');

-- --------------------------------------------------------

--
-- بنية الجدول `permission_translations`
--

CREATE TABLE `permission_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `permission_translations`
--

INSERT INTO `permission_translations` (`id`, `locale`, `name`, `permission_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'en', 'Customers', 1, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(2, 'ar', 'العملاء', 1, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(3, 'en', 'Car Type', 2, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(4, 'ar', 'أنواع السيارات', 2, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(5, 'en', 'Categories', 3, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(6, 'ar', 'التصنيفات', 3, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(7, 'en', 'Garages', 4, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(8, 'ar', 'الكراجات', 4, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(9, 'en', 'Orders', 5, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(10, 'ar', 'الطلبات', 5, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(11, 'en', 'Contact us', 6, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(12, 'ar', 'رسائل اتصل بنا', 6, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(13, 'en', 'Settings', 7, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(14, 'ar', 'الاعدادات', 7, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(15, 'en', 'Plans', 8, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(16, 'ar', 'خطط الاشتراك', 8, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(17, 'en', 'Services', 9, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(18, 'ar', 'الخدمات', 9, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(19, 'en', 'Admins', 10, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(20, 'ar', 'المدراء والمشرفين', 10, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(21, 'en', 'Notifications', 11, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(22, 'ar', 'الإشعارات', 11, NULL, '2020-10-27 15:04:21', '2020-10-27 15:04:21'),
(23, 'en', 'Customers', 1, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(24, 'ar', 'العملاء', 1, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(25, 'en', 'Car Type', 2, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(26, 'ar', 'أنواع السيارات', 2, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(27, 'en', 'Categories', 3, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(28, 'ar', 'التصنيفات', 3, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(29, 'en', 'Garages', 4, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(30, 'ar', 'الكراجات', 4, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(31, 'en', 'Orders', 5, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(32, 'ar', 'الطلبات', 5, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(33, 'en', 'Contact us', 6, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(34, 'ar', 'رسائل اتصل بنا', 6, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(35, 'en', 'Settings', 7, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(36, 'ar', 'الاعدادات', 7, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(37, 'en', 'Plans', 8, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(38, 'ar', 'خطط الاشتراك', 8, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(39, 'en', 'Services', 9, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(40, 'ar', 'الخدمات', 9, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(41, 'en', 'Admins', 10, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(42, 'ar', 'المدراء والمشرفين', 10, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(43, 'en', 'Notifications', 11, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(44, 'ar', 'الإشعارات', 11, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(45, 'en', 'Customers', 1, NULL, '2020-10-27 17:52:19', '2020-10-27 17:52:19'),
(46, 'ar', 'العملاء', 1, NULL, '2020-10-27 17:52:19', '2020-10-27 17:52:19'),
(47, 'en', 'Car Type', 2, NULL, '2020-10-27 17:52:19', '2020-10-27 17:52:19'),
(48, 'ar', 'أنواع السيارات', 2, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(49, 'en', 'Categories', 3, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(50, 'ar', 'التصنيفات', 3, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(51, 'en', 'Garages', 4, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(52, 'ar', 'الكراجات', 4, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(53, 'en', 'Orders', 5, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(54, 'ar', 'الطلبات', 5, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(55, 'en', 'Contact us', 6, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(56, 'ar', 'رسائل اتصل بنا', 6, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(57, 'en', 'Settings', 7, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(58, 'ar', 'الاعدادات', 7, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(59, 'en', 'Plans', 8, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(60, 'ar', 'خطط الاشتراك', 8, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(61, 'en', 'Services', 9, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(62, 'ar', 'الخدمات', 9, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(63, 'en', 'Admins', 10, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(64, 'ar', 'المدراء والمشرفين', 10, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(65, 'en', 'Notifications', 11, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(66, 'ar', 'الإشعارات', 11, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(67, 'en', 'advertisements', 12, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(68, 'ar', 'الإعلانانات', 12, NULL, '2020-10-27 17:52:20', '2020-10-27 17:52:20'),
(69, 'en', 'Sliders', 13, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(70, 'ar', 'سلايدر', 13, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(71, 'en', 'Garage Requests', 14, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40'),
(72, 'ar', 'طلبات الكراجات', 14, NULL, '2020-10-27 15:05:40', '2020-10-27 15:05:40');

-- --------------------------------------------------------

--
-- بنية الجدول `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'duration in days',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `plans`
--

INSERT INTO `plans` (`id`, `price`, `duration`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 300.00, 30, 'active', NULL, '2020-10-27 15:05:35', '2020-11-24 13:23:00'),
(2, 45.00, 12, 'not_active', NULL, '2020-11-01 15:19:29', '2020-11-19 16:53:58'),
(3, 45.00, 5, 'not_active', NULL, '2020-11-12 14:49:24', '2020-11-12 19:53:10'),
(4, 100.00, 5, 'not_active', NULL, '2020-11-12 18:46:11', '2020-11-12 19:53:10');

-- --------------------------------------------------------

--
-- بنية الجدول `plan_translations`
--

CREATE TABLE `plan_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `plan_translations`
--

INSERT INTO `plan_translations` (`id`, `locale`, `title`, `description`, `plan_id`, `created_at`, `updated_at`) VALUES
(1, 'ar', 'حزمة شهرية', 'Qui dolore repellat id qui sed.', 1, '2020-10-27 15:04:16', '2020-11-19 16:53:33'),
(2, 'en', 'monthly plan', 'Laudantium quis aliquid odit autem doloribus.', 1, '2020-10-27 15:05:35', '2020-11-19 16:53:33'),
(3, 'ar', 'تيست تيست', 'تيست تيست', 2, '2020-11-01 15:19:29', '2020-11-01 15:19:29'),
(4, 'en', 'Test Test', 'Test Test', 2, '2020-11-01 15:19:29', '2020-11-01 15:19:29'),
(5, 'ar', 'تيست تيست', 'تيست تيست تيست تيست', 3, '2020-11-12 14:49:24', '2020-11-12 14:49:24'),
(6, 'en', 'Test Test SS', 'Test Test SSTest Test SSTest Test SS', 3, '2020-11-12 14:49:24', '2020-11-12 14:49:24'),
(7, 'ar', 'Test', 'Test01', 4, '2020-11-12 18:46:11', '2020-11-12 18:46:11'),
(8, 'en', 'Test', 'Test01', 4, '2020-11-12 18:46:11', '2020-11-12 18:46:11');

-- --------------------------------------------------------

--
-- بنية الجدول `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `services`
--

INSERT INTO `services` (`id`, `image`, `category_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'services/2GzaRXF4ZoTyXvrn3ffAf70Wy7FkDfxdNJYLHw9V.png', 1, 'active', NULL, '2020-10-27 15:05:34', '2020-11-26 20:06:08'),
(2, 'mascara.png', 2, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:56'),
(3, 'mascara.png', 3, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:56'),
(4, 'mascara.png', 4, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:56'),
(5, 'mascara.png', 5, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:56'),
(6, 'mascara.png', 6, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:14:15'),
(7, 'mascara.png', 7, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:14:15'),
(8, 'mascara.png', 8, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:14:15'),
(9, 'mascara.png', 9, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:14:15'),
(10, 'mascara.png', 1, 'active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:15:03'),
(11, 'mascara.png', 2, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:14:15'),
(12, 'mascara.png', 3, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:14:15'),
(13, 'mascara.png', 4, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:14:15'),
(14, 'mascara.png', 5, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:56'),
(15, 'mascara.png', 6, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:56'),
(16, 'mascara.png', 7, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:56'),
(17, 'mascara.png', 8, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:32'),
(18, 'mascara.png', 9, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:32'),
(19, 'mascara.png', 1, 'active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:14:42'),
(20, 'mascara.png', 2, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:32'),
(21, 'mascara.png', 3, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:56'),
(22, 'mascara.png', 4, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:56'),
(23, 'mascara.png', 5, 'not_active', NULL, '2020-10-27 15:05:34', '2020-11-12 16:13:56'),
(24, 'mascara.png', 6, 'not_active', NULL, '2020-10-27 15:05:35', '2020-11-12 16:13:32'),
(25, 'mascara.png', 7, 'not_active', NULL, '2020-10-27 15:05:35', '2020-11-12 16:13:32'),
(26, 'mascara.png', 8, 'not_active', NULL, '2020-10-27 15:05:35', '2020-11-12 16:13:32'),
(27, 'mascara.png', 9, 'not_active', NULL, '2020-10-27 15:05:35', '2020-11-12 16:13:32'),
(28, 'services/V5Sori84tv1cULhUlBQETwL0mCFjXnv9Lj8Q9nd4.jpeg', 10, 'active', NULL, '2020-11-01 15:18:28', '2020-11-12 16:15:58'),
(29, 'services/YeADa6VBQpOwKyICREOado6RMbedhvNqmm8l8hAC.png', 2, 'not_active', NULL, '2020-11-12 14:46:59', '2020-11-12 16:13:32');

-- --------------------------------------------------------

--
-- بنية الجدول `service_translations`
--

CREATE TABLE `service_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `service_translations`
--

INSERT INTO `service_translations` (`id`, `locale`, `title`, `service_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'Bicycle service  1', 1, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(2, 'ar', 'خدمة الدراجات  1', 1, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(3, 'en', 'Bicycle service  2', 2, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(4, 'ar', 'خدمة الدراجات  2', 2, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(5, 'en', 'Bicycle service  3', 3, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(6, 'ar', 'خدمة الدراجات  3', 3, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(7, 'en', 'Bicycle service  4', 4, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(8, 'ar', 'خدمة الدراجات  4', 4, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(9, 'en', 'Bicycle service  5', 5, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(10, 'ar', 'خدمة الدراجات  5', 5, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(11, 'en', 'Bicycle service  6', 6, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(12, 'ar', 'خدمة الدراجات  6', 6, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(13, 'en', 'Bicycle service  7', 7, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(14, 'ar', 'خدمة الدراجات  7', 7, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(15, 'en', 'Bicycle service  8', 8, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(16, 'ar', 'خدمة الدراجات  8', 8, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(17, 'en', 'Bicycle service  9', 9, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(18, 'ar', 'خدمة الدراجات  9', 9, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(19, 'en', 'Car service  1', 10, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(20, 'ar', 'خدمة السيارات  1', 10, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(21, 'en', 'Car service  2', 11, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(22, 'ar', 'خدمة السيارات  2', 11, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(23, 'en', 'Car service  3', 12, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(24, 'ar', 'خدمة السيارات  3', 12, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(25, 'en', 'Car service  4', 13, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(26, 'ar', 'خدمة السيارات  4', 13, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(27, 'en', 'Car service  5', 14, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(28, 'ar', 'خدمة السيارات  5', 14, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(29, 'en', 'Car service  6', 15, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(30, 'ar', 'خدمة السيارات  6', 15, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(31, 'en', 'Car service  7', 16, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(32, 'ar', 'خدمة السيارات  7', 16, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(33, 'en', 'Car service  8', 17, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(34, 'ar', 'خدمة السيارات  8', 17, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(35, 'en', 'Car service  9', 18, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(36, 'ar', 'خدمة السيارات  9', 18, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(37, 'en', 'Steamer service  1', 19, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(38, 'ar', 'خدمة المراكب  1', 19, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(39, 'en', 'Steamer service  2', 20, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(40, 'ar', 'خدمة المراكب  2', 20, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(41, 'en', 'Steamer service  3', 21, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(42, 'ar', 'خدمة المراكب  3', 21, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(43, 'en', 'Steamer service  4', 22, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(44, 'ar', 'خدمة المراكب  4', 22, '2020-10-27 15:05:34', '2020-10-27 15:05:34'),
(45, 'en', 'Steamer service  5', 23, '2020-10-27 15:05:35', '2020-10-27 15:05:35'),
(46, 'ar', 'خدمة المراكب  5', 23, '2020-10-27 15:05:35', '2020-10-27 15:05:35'),
(47, 'en', 'Steamer service  6', 24, '2020-10-27 15:05:35', '2020-10-27 15:05:35'),
(48, 'ar', 'خدمة المراكب  6', 24, '2020-10-27 15:05:35', '2020-10-27 15:05:35'),
(49, 'en', 'Steamer service  7', 25, '2020-10-27 15:05:35', '2020-10-27 15:05:35'),
(50, 'ar', 'خدمة المراكب  7', 25, '2020-10-27 15:05:35', '2020-10-27 15:05:35'),
(51, 'en', 'Steamer service  8', 26, '2020-10-27 15:05:35', '2020-10-27 15:05:35'),
(52, 'ar', 'خدمة المراكب  8', 26, '2020-10-27 15:05:35', '2020-10-27 15:05:35'),
(53, 'en', 'Steamer service  9', 27, '2020-10-27 15:05:35', '2020-10-27 15:05:35'),
(54, 'ar', 'خدمة المراكب  9', 27, '2020-10-27 15:05:35', '2020-10-27 15:05:35'),
(55, 'ar', 'تيست تيست', 28, '2020-11-01 15:18:28', '2020-11-01 15:18:28'),
(56, 'en', 'Test Test', 28, '2020-11-01 15:18:28', '2020-11-01 15:18:28'),
(57, 'ar', 'تيست تيست', 29, '2020-11-12 14:46:59', '2020-11-12 14:46:59'),
(58, 'en', 'Test Test	Test Test', 29, '2020-11-12 14:46:59', '2020-11-12 14:46:59');

-- --------------------------------------------------------

--
-- بنية الجدول `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `app_store_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `play_store_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `settings`
--

INSERT INTO `settings` (`id`, `facebook`, `instagram`, `twitter`, `mobile`, `email`, `rate_number`, `app_store_url`, `play_store_url`, `logo`, `favicon`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'www.facebook.com', 'www.instagram.com', 'www.twitter.com', '059500000000', 'info@rahegcom.com', '0', 'https://garagat.hexacit.com/', 'https://garagat.hexacit.com/', 'settings/XhNZqoESBspZqWDBebrhISiHic85MzZZdN9rHlWG.png', 'settings/ufZaUo8Yt1TJhiC53exjiWXysRaCUOxW5uZS3Aqb.png', 'settings/Rz5UifsEaWsVdcyXXdt35V91C6zfYg88N3CdlD7c.png', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `setting_translations`
--

CREATE TABLE `setting_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `download_app_text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `setting_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `setting_translations`
--

INSERT INTO `setting_translations` (`id`, `locale`, `address`, `title`, `description`, `download_app_text`, `created_at`, `updated_at`, `setting_id`) VALUES
(1, 'en', 'السعودية - الرياض - حي عرقه', 'Weenah', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', '2020-11-22 14:25:11', '2020-11-22 14:25:11', 1),
(2, 'ar', 'السعودية - الرياض - حي عرقه', 'وينـه', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', '2020-11-22 14:25:11', '2020-11-22 14:25:11', 1);

-- --------------------------------------------------------

--
-- بنية الجدول `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'sliders/Ul3jX3lKRDImb9ui2ioUoKECNRNkBAKAxMe6g8O5.jpeg', NULL, 'active', '2020-11-18 21:15:54', '2020-11-19 18:21:11'),
(2, 'sliders/MOQSJRmf242uURU6OE4azA6WW5dg5Hkw1VfDsOw7.png', NULL, 'active', '2020-11-26 17:19:56', '2020-11-26 17:19:56');

-- --------------------------------------------------------

--
-- بنية الجدول `slider_translations`
--

CREATE TABLE `slider_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `slider_translations`
--

INSERT INTO `slider_translations` (`id`, `locale`, `title`, `slider_id`, `created_at`, `updated_at`) VALUES
(1, 'ar', NULL, 1, '2020-11-18 21:15:54', '2020-11-26 17:36:10'),
(2, 'en', 'wenh', 1, '2020-11-18 21:15:54', '2020-11-18 21:15:54'),
(3, 'ar', 'صيانة ناجحة', 2, '2020-11-26 17:19:56', '2020-11-26 17:19:56'),
(4, 'en', 'Good repair', 2, '2020-11-26 17:19:56', '2020-11-26 17:19:56');

-- --------------------------------------------------------

--
-- بنية الجدول `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fcm_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accept_notification` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `tokens`
--

INSERT INTO `tokens` (`id`, `fcm_token`, `device_type`, `lang`, `accept_notification`, `user_id`, `created_at`, `updated_at`) VALUES
(47, 'cgpNErdDZBg:APA91bEi-DRuNxYImwvZGDy7nCS4CA4IJ87OaS2QRb7jKHnzbRo6uN9Ne0ILvQeKqntQYb2os8L1nUYeCyTvrPopwWw9vPT_U2nF-P6Ghwy8McEe5cJjFf_0CtKP2DOsVs-Y5008aay_', 'android', 'ar', 1, 62, '2020-11-12 19:27:55', '2020-11-12 19:27:55');

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `image`, `email_verified_at`, `password`, `role`, `remember_token`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Mosab', 'mosab@gmail.com', '123456789', 'users/I3gX07HyYa00Fsvod7IC0KxQRmPEs0A5670Y6O6k.jpeg', '2020-10-27 15:05:35', '$2y$10$SZ4o2uGEhdgYiOhhMvDy4uoqvmsqWyZFzuzbbuLHXnqoW31gDlC/C', 'customer', 'uTAmTfbL2x5dFkth5XUIsdpXSdBjmOpYnAHfuZOTGdVdX2dO7d6kzRzFrR44', 'active', NULL, '2020-10-27 15:05:36', '2020-11-22 14:02:00'),
(2, 'Maida Lang', 'wkub@example.net', '670-960-3432', NULL, '2020-10-27 15:05:35', '$2y$10$wYGLl8Zou.7JWp.oUJpMle9sB8IWMMnRz83eZqFoNX/nvZH589dT2', 'customer', 'HBP1SqPu3T', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(3, 'Ashtyn Macejkovic', 'preynolds@example.com', '270.917.6683', NULL, '2020-10-27 15:05:35', '$2y$10$kvKRblSgdBmOEev6pqDafesTok4EWlJ1Pd9m6ZOd51Uz.atN2Dl/G', 'customer', '4PuItUDebT', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(4, 'Ms. Danika Roob', 'hallie.rosenbaum@example.net', '(790) 239-9522', NULL, '2020-10-27 15:05:35', '$2y$10$VKi0ZW64bchbX4x.uAvSfeDjPhDA5uJ0pkeT3usB0cuJJSHT1GHSi', 'customer', 'RcXSWLTun8', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(5, 'Claire Bogan', 'okey.boyer@example.com', '+1.235.702.1995', NULL, '2020-10-27 15:05:35', '$2y$10$XnKZ4m7BFiXhiys0sVN6VOZaF3SnZpVqbCWvNQs/rt5M7/DMnSxOW', 'customer', 'bptyvQohpO', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(6, 'Miss Hailie Davis I', 'liana.keebler@example.org', '+1-840-501-6106', NULL, '2020-10-27 15:05:35', '$2y$10$Ct.WqCuo2WiMewe36WQZheiQhtgeUKN4WjbY4W0Of5m6FuX0VFLsq', 'customer', 'g9exZnunAt', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(7, 'Jon Bosco', 'smarvin@example.net', '236.596.9932 x24798', NULL, '2020-10-27 15:05:35', '$2y$10$xEwED1WkRPo5ttkKJ/XA5.xN2E9pIn8bwBxKgdumtNWlWQi3q23ne', 'customer', 'HMa9TsHCMe', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(8, 'Johanna Larson', 'albina.volkman@example.org', '705-721-8905 x7021', NULL, '2020-10-27 15:05:35', '$2y$10$CFcpkbBr5UjO07mQ4pjq0Ob9uSieU.0N7PudwKqOyOXssauE0/R.G', 'customer', 'tWJDE1Yu0E', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(9, 'Marcos Casper', 'rigoberto.robel@example.org', '430.513.5462', NULL, '2020-10-27 15:05:35', '$2y$10$O25RD1jZnwLBpJ2bZwxLxOklH2I5ZX4W7xgW8rMNjt6K1p5VodAhe', 'customer', 'rPnrOABpVe', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(10, 'Janessa Hill', 'evalyn41@example.net', '748-544-4235 x19474', NULL, '2020-10-27 15:05:35', '$2y$10$y3ob83ESHX/YR32dgFOizuaP22I1ZAHk..zkXplJD6.BsPIjNKpxS', 'customer', 'nm3sLEK5mp', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(11, 'Ms. Kailyn Walker', 'qpowlowski@example.org', '+1.385.389.7800', NULL, '2020-10-27 15:05:35', '$2y$10$CKgEP3BBfavCyFVi30Y1kuSh39O9uN37iTlUnpxu5KDFcDFpzXUKq', 'customer', 'VyCjS5if6s', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(12, 'Sedrick Schinner', 'baylee18@example.org', '597-755-5488 x86391', NULL, '2020-10-27 15:05:35', '$2y$10$trplK.gSUqBH/FA8Su4UC.g7Jvj81WfEyWUpWHWIBZq4cMHP7r/FW', 'customer', 'p454yoadsJ', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(13, 'Schuyler Rippin', 'tschroeder@example.net', '203.889.0217', NULL, '2020-10-27 15:05:35', '$2y$10$KtHJydzMu.owhsNVNIlAQekbwHhOcESC94xRn4hPgDhB5ONG0mIry', 'customer', 'IBlTRi2GNh', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(14, 'Kiara Runte', 'ivory.funk@example.com', '829.841.9998 x70714', NULL, '2020-10-27 15:05:35', '$2y$10$HpVpa/nyvAP9xEoGhedANO5q6ekZbouvVtcNe3AhimuQWHYbvbQVu', 'customer', 'tkQoJzOXgR', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(15, 'Meredith Altenwerth', 'kerluke.bessie@example.org', '258-352-1215 x85194', NULL, '2020-10-27 15:05:35', '$2y$10$MlLD3VxmFx9CoFp4Y2Q2VOTABJ14xaryxJGnpWrYW8PF5zvuwDos2', 'customer', 'bCENFJLutl', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(16, 'Dr. Hunter Feil DDS', 'una.dickens@example.com', '592-401-7107 x0801', NULL, '2020-10-27 15:05:35', '$2y$10$qDNVTpcd0vMRXmYqAVz3F.839XcH1gY0PlMtMlN39cR5MLzmZpzbi', 'customer', 'BlNsEcCpHj', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(17, 'Mr. Orion Rolfson', 'vandervort.anabelle@example.net', '272-605-6998 x34006', NULL, '2020-10-27 15:05:36', '$2y$10$xxDdpcOuIvvQ3cL.V2nuHeGyGy1Yqp5bfTpKekPMov47HSUZi3q5e', 'customer', 'V9Rjn3sVZp', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(18, 'Erika Rempel', 'chelsey46@example.com', '+1.759.201.8355', NULL, '2020-10-27 15:05:36', '$2y$10$nXk6D0OL0odo5teHGK2FW.9hnnG/hWL4QwGNosKczPrhEBmpAeEBe', 'customer', 'oTnn6jmt6T', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(19, 'Cara Rath I', 'edwin24@example.com', '1-485-347-5086', NULL, '2020-10-27 15:05:36', '$2y$10$Jgrb6O08EBTP8RsCTbIUWeno4ZsTOK4lyCHOQ6h10DxsCAzv7XtUK', 'customer', 'qFRswN2HJ1', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(20, 'Prof. Johnathon Goyette IV', 'lily17@example.org', '505.360.0456 x823', NULL, '2020-10-27 15:05:36', '$2y$10$rBx7/4sIOjeFGKE.uScbN.XStcAZdY54QS65L99j/j8RWCkecz3C.', 'customer', 'E9oj2mu7Ea', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(21, 'Madelyn O\'Kon', 'mossab@garagat.com', '+15989134473', 'users/ROd4tSx67U0s1vAyA2GteyddLvC01ym9djHIZg1f.jpeg', '2020-10-27 15:05:36', '$2y$10$IaITlMxROs.lwCHIGmvzje5ij2gFiYwY.esaiHzU0iJYUITJHLtZO', 'garage', 'F2j1Zfy9Gt', 'active', NULL, '2020-10-27 15:05:36', '2020-11-29 02:08:23'),
(22, 'Vicente Hodkiewicz', 'larkin.keaton@example.com', '420.564.8716', NULL, '2020-10-27 15:05:36', '$2y$10$73vGuICC7JgyEB1i1wBH2e68gbyTTquegQL2hS5iWmJzK9iDkTAQm', 'garage', 'ryEn1vq3Q9', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(23, 'Kitty Kuhic', 'gulgowski.virginia@example.net', '574-608-9423', NULL, '2020-10-27 15:05:36', '$2y$10$GhRINF0ez22L22bcjgvYHeWBkv2qgSQbmN/ofRef2nT30h7zM6lRa', 'garage', 'SZ6qfLvtnW', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(24, 'Alexanne Keebler', 'walsh.roosevelt@example.com', '353-397-1712 x8557', NULL, '2020-10-27 15:05:36', '$2y$10$pA967HiIo4A7y8KCYtMUSeiaAlDT.Ow/An5WqJhE1U0vmfMgdyL6q', 'garage', 'G4BuEQpBIp', 'active', NULL, '2020-10-27 15:05:36', '2020-11-12 13:58:53'),
(25, 'Trudie Kub', 'nrenner@example.net', '(807) 800-2788 x33559', NULL, '2020-10-27 15:05:36', '$2y$10$B8cfu3qBBhD1TBwyzYBcaePUMtmUhcJc3duDC8Nv92lxOXj3qCxgO', 'garage', 'kbcxuDU25Z', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(26, 'Corine Bartell', 'jazmin.johns@example.com', '312.262.5339 x002', NULL, '2020-10-27 15:05:36', '$2y$10$mo7gZ1wRRwgPKc2Zk9UkZ.Lypj.ISjU4l6Hbbi6ivIsudpudWR7oW', 'garage', '3yQUoMpgCb', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(27, 'Raleigh Pfannerstill', 'ivory18@example.com', '+1-359-468-5219', NULL, '2020-10-27 15:05:36', '$2y$10$exEBMc3RRO1FUAyjxCKQdeIjMLXleo04tuXLMRpVF4OP/n4B6M7yu', 'garage', 'WStJIE5hrh', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(28, 'Mrs. Kenya Kirlin', 'dudley.botsford@example.com', '223-822-1067', NULL, '2020-10-27 15:05:36', '$2y$10$yVvMnOoHE2Y36cAtsTwHKe.OzFZbqBgy0F.qIfGey/B.MH4Z9j1Wm', 'garage', 'qvVOKYjyWE', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(29, 'General McClure PhD', 'khartmann@example.net', '1-430-656-9922 x043', NULL, '2020-10-27 15:05:36', '$2y$10$jGTV9SmnImBl2uOsgYSIjutXL2eHJULwTx3bw07cE3bYWOlJexSmK', 'garage', '6kDBEtRrfr', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(30, 'Prof. Brycen Koch', 'tromp.rodger@example.net', '519.623.0352 x8682', NULL, '2020-10-27 15:05:36', '$2y$10$fpv9gUX0Pqkg9Odq3wGS7O2lMwhROXcK/Dmtr8sTv6QCXmPGsRvhm', 'garage', 'pWYZOClZCE', 'active', NULL, '2020-10-27 15:05:36', '2020-10-27 15:05:36'),
(31, 'Madonna Senger', 'fisher.vernice@example.com', '774-815-1848', NULL, '2020-10-27 15:05:36', '$2y$10$QDPcTARQBXiU8msfThBJ1ebOXLHtVXwK9T5wdlDJi0/.E3oyCNNce', 'garage', 'ojGmgJjRCX', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(32, 'Herbert Legros', 'madge.donnelly@example.net', '1-336-948-0826 x662', NULL, '2020-10-27 15:05:37', '$2y$10$nYyDgtew6zxV8ottDQwwn.UeLnAz9YNZqzt/l.jEnn/gZF7KwbvbS', 'garage', 'XifuIWRwIw', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(33, 'Edgardo Roberts', 'isidro47@example.net', '1-627-731-6522 x8337', NULL, '2020-10-27 15:05:37', '$2y$10$jf7SjC89OmmSih74tEjPvO1tXp2ayu/qrcIIinVdV.qRnfmQWAeo2', 'garage', 'ND86tSiv4L', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(34, 'Hertha Herzog DVM', 'chanel62@example.net', '578-300-6437 x39235', NULL, '2020-10-27 15:05:37', '$2y$10$kwDXgEEUver/TsJ7gAtyy.Pjd.kIGWiG7cu5R9XlyK1pP.ZIT7WrG', 'garage', 'LDHoO2tVAb', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(35, 'Kathlyn McDermott', 'rosenbaum.abbigail@example.net', '813.876.8337', NULL, '2020-10-27 15:05:37', '$2y$10$SdSajYoKFeujV1PoXZMsKuT5Qs0apoZdxw8pfFaV/1jqpnTtkdmUu', 'garage', 'HBtO5jQjI3', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(36, 'Dr. Haley Davis PhD', 'janessa21@example.org', '1-258-912-9951 x500', NULL, '2020-10-27 15:05:37', '$2y$10$VF/X/m6IvCe9gxDkYBeRWejZxc72iQH.n0oUDMG7LT3abfqDsAfua', 'garage', '4wATmaifsX', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(37, 'Shawn Macejkovic Jr.', 'lillie.ohara@example.org', '1-789-918-1871 x712', NULL, '2020-10-27 15:05:37', '$2y$10$C5jvgUNTBVjfcjJm.mH8KuwOAOC2rRXsTL9LiIPCvKXeZ0lMMGRsK', 'garage', 'ztO4EzX8kK', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(38, 'Tate Ferry', 'ludwig48@example.com', '+1-426-647-1918', NULL, '2020-10-27 15:05:37', '$2y$10$IOQHXbgnTVv8kT9iz/1SqOe5OnF.qoSHW.ugWIAsy5ZieUGsoz/EG', 'garage', 'c9oI2i5JSy', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(39, 'Mr. Wilson Botsford II', 'caroline.rodriguez@example.org', '(563) 305-3983 x547', NULL, '2020-10-27 15:05:37', '$2y$10$088qTAflZKAosn1bbHkMve8SbuqnCbKUA4MQfNIhK0zJBHUXyrZVm', 'garage', 'R4cNj60t5a', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(40, 'Ms. Vilma Kuhn DVM', 'keara80@example.com', '386.766.7700 x4649', NULL, '2020-10-27 15:05:37', '$2y$10$Ojn/rkqMSZSfDdqP9uDiJe/FkrXSy9yn6xc/jlQ38cunGHzcDZiVm', 'garage', 'ZdJYi8ZFub', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(41, 'Mrs. Karelle Kozey DVM', 'lakin.cecil@example.com', '(415) 534-3298 x5011', NULL, '2020-10-27 15:05:37', '$2y$10$Zqnh8aV94wST5Hac/nbcRuMgWJS0pyJIw1kTtowSfEk27U03Riq0m', 'garage', 'CZHn050aW3', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(42, 'Jamal Schoen', 'wyman.schiller@example.org', '+15744732461', NULL, '2020-10-27 15:05:37', '$2y$10$Mfl3nNefX3QimbBac6IZr./priKid068NuFfqTaKCaQJvJPOQLI7S', 'garage', 'ekc29HgaQc', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(43, 'Jo Luettgen III', 'hreilly@example.org', '(295) 703-9467 x4261', NULL, '2020-10-27 15:05:37', '$2y$10$bbcLWgvg0WvJXsGRM409nu/GD/ZxL5LDhzPLdxLLRyQGhcwhEFPqW', 'garage', 'dPwpuihydi', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(44, 'Max Lemke V', 'tremblay.lincoln@example.com', '789.688.9107 x02824', NULL, '2020-10-27 15:05:37', '$2y$10$vjKnTXyvP7IpZNo2tObuW.1EqZ37X3whmA..khT67CJ/wbW8JCH4q', 'garage', 'ktSAbvjPkN', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(45, 'Fleta Hammes', 'sanford.frieda@example.net', '(474) 297-7252', NULL, '2020-10-27 15:05:37', '$2y$10$1k3dM8ljOSwjSWdhl8uQc.X67Dam/nOq6VdeJw4KZfTHy9pKGulS2', 'garage', 'gtm70GDKJr', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(46, 'Gerald Becker', 'zachary12@example.com', '(938) 264-6552', NULL, '2020-10-27 15:05:37', '$2y$10$7Mkxe5P1ACd/XUphxs7zGO9MM8P.9ou26vi3phzy75A5rrUA2PahS', 'garage', 'PuXekXWkiV', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(47, 'Ava Fahey', 'fferry@example.net', '+1 (528) 290-2237', NULL, '2020-10-27 15:05:37', '$2y$10$IlZAh56fTGb5pzUp.0rXruDdOC2bAf6cO96iwY079Scj1OCLy48se', 'garage', 'F9GW7XBUmD', 'active', NULL, '2020-10-27 15:05:37', '2020-10-27 15:05:37'),
(48, 'Albertha Parker', 'fpfannerstill@example.org', '218.922.5409 x8452', NULL, '2020-10-27 15:05:37', '$2y$10$G6sOKU8213cw1SUUykkEOevp/J91FmDwLHvRBBdoulb36bR/p5tN.', 'garage', 'lKUOJ3GyuY', 'active', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(49, 'Abner Stehr', 'bbeer@example.com', '+1.330.254.8373', NULL, '2020-10-27 15:05:38', '$2y$10$HQHXirhWhAof6AFnlOo7GuWH4vg.hvryBs5qbOt/WDr/Fm9ZxVqiq', 'garage', 'mZYsB2zhWD', 'active', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(50, 'Harmony Heathcote', 'rhett38@example.org', '440-687-3729 x48962', NULL, '2020-10-27 15:05:38', '$2y$10$s0O3wDpoXVuAjllzJhdHFeGbHVLHjqV0hN53ac99VmtLHR07uHmwy', 'garage', 'xxZdGLpmdv', 'active', NULL, '2020-10-27 15:05:38', '2020-10-27 15:05:38'),
(51, 'sereen saqer', 'sereensaqer1998@gmail.com', '975983622222', NULL, NULL, '$2y$10$LwdEtICvIT..RN2s87XE7OdIiKxqShhOF9ogw3SAeoPus/Gb2O/aW', 'garage', NULL, 'active', NULL, '2020-11-01 15:14:40', '2020-11-01 15:14:40'),
(52, 'sereen saqer1', 'sereensaqer@gmail.com', '970589663', NULL, NULL, '$2y$10$BjJUNVSnxhD.e.im2atXnOWkpRrY9ZupMPWfHRG8hOQAzmTd3vKLm', 'customer', NULL, 'active', NULL, '2020-11-01 15:16:03', '2020-11-12 13:42:08'),
(53, 'Mosab', 'mosabgarage@gmail.com', '12345678', 'garages/2s9yTz5575xkKBcu3cSH6LtCaLMjbBUAlGuqryTV.jpeg', NULL, '$2y$10$5kKmDc9jMezPB8F5u55FmORjqY0n4mHqr29a6TwwAzYmUutEmkAO6', 'garage', NULL, 'active', NULL, '2020-11-01 17:13:50', '2020-11-01 17:13:50'),
(54, 'test01', 'test01@hexa.com', '972567683083+', NULL, NULL, '$2y$10$lVCvBTtaOqa3ojfDmzLNyOfkhT3RLxx7oN36FIxlOkmfYlQFy29dq', 'customer', NULL, 'active', NULL, '2020-11-11 14:35:35', '2020-11-11 15:16:16'),
(55, 'test', 'test@hexa.com', '111111', NULL, NULL, '$2y$10$YPKJN8hn0sed7S9UDDo8uuP99VRzQixqe5o0hif.a6n4hx90udm8C', 'garage', NULL, 'active', NULL, '2020-11-11 14:51:12', '2020-11-12 13:56:22'),
(57, 'test11', 'test30@hexa.com', '123', NULL, NULL, '$2y$10$ijFtOA/wHNctsrRDBskfVuEk7Vl4Bz3eS2MDhExM.WXQgWDSFbph2', 'customer', NULL, 'active', NULL, '2020-11-11 15:45:37', '2020-11-19 18:19:34'),
(58, 'test01', 'test333@hexa.com', '123321', NULL, NULL, '$2y$10$rdwA9kDzWZUTvZ6gIA/hjOk1Ops/QbJoCE3BeYTEEExX4m.KO0fXG', 'customer', NULL, 'active', NULL, '2020-11-11 19:32:45', '2020-11-12 19:57:27'),
(59, 'Stest', 'teststest1@gmail.com', '059866355', 'users/Ob4gU8Cc0GChfiRgjNjIJj7ljx7PbpY3XWeH7sSJ.png', NULL, '$2y$10$fBS7wKQZbdO1XUGG.C2zje/V3QzCWBTfe/q9GXLv8f8M3rEL2p54q', 'garage', NULL, 'active', NULL, '2020-11-12 14:41:39', '2020-11-12 18:48:35'),
(60, 'sereen saqer', 'sereen@gmail.com', '0598258562', NULL, NULL, '$2y$10$SlE0B.KjuoZx39tjFhX2n.pV3y1HKM4T/7BAmlZO6j1jXJaxathzm', 'customer', NULL, 'active', NULL, '2020-11-12 14:54:31', '2020-11-12 19:57:27'),
(61, 'sereen', 'sereen97@gmail.com', '0597763564', NULL, NULL, '$2y$10$g93okw2bL1lvI/oP6pAMH.qMUvLHpPW3aMzZzXzS7TxIXhMZufM2O', 'customer', NULL, 'active', NULL, '2020-11-12 15:06:23', '2020-11-12 19:57:27'),
(62, 'user', 'user@gmail.com', '0599876543', NULL, NULL, '$2y$10$DhpgrPOR/5RMtRTJ8.A.f.LYVqAqSubkUi2M7j6Dj9DrHYgGFthJm', 'customer', NULL, 'active', NULL, '2020-11-12 19:27:55', '2020-11-12 19:57:27'),
(63, 'emad', 'emadtraner@gnail.com', '965123123', NULL, NULL, '$2y$10$.DUBpJU8ux3bny0.hfezTe5VWdZyCyJUENkc91zGdXjotiu/GjEOa', 'customer', NULL, 'active', NULL, '2020-11-15 03:08:43', '2020-11-15 03:08:43'),
(64, 'emad2', 'emad@hexacit.com', '6577522294', 'users/xNdJvSa6cTfmoGh1hhgEKYIkuLBb9vUFdIE7Pi1X.jpeg', NULL, '$2y$10$4vt07VcEn0Mr.7IIWK.nseaiSU/ju60178OcgPryz3V.KrOgzm8Oe', 'customer', NULL, 'active', NULL, '2020-11-15 03:16:35', '2020-11-26 21:19:37'),
(65, 'yehia', 'email@email.com', '123456789', NULL, NULL, '$2y$10$vVDhEvdBETG2qmpQwnQaHOkZbQ85M3djixE8Lm5.mn2WDwkmz.fai', 'customer', NULL, 'active', NULL, '2020-11-15 19:40:59', '2020-11-15 19:40:59'),
(66, 'testac', 'testac@gmail.com', '12345678', NULL, NULL, '$2y$10$i1AaCzW9oT/eQKSM0GVF.ux8RjJKJ07derqA5PxJhW8W5X4sniubC', 'customer', NULL, 'active', NULL, '2020-11-15 19:52:39', '2020-11-15 19:52:39'),
(67, 'test90', 'test90@hexa.com', '9090', 'users/UK6PN9OhzO1WQapFVm0bNLvixgCtbpoSh3zuGKEF.png', NULL, '$2y$10$TCU7qI0xs79WoYugikEorewaax2UveU2VYR0cH7dt7.4tUJGGAk.m', 'customer', NULL, 'active', NULL, '2020-11-17 17:29:35', '2020-11-17 17:29:35'),
(68, 'عماد', 'emadtraner@gmail.com', '868356865', 'garages/MCQFD24t0TKflSwa6YU9ZOjI3fGI4Yb8vUlIKgLz.jpeg', NULL, '$2y$10$vMViGEIBXzsTkmcdMWMeHeQQOf9pM4mSAvLAcGLs1KPhL8pAUZ1iG', 'garage', NULL, 'active', NULL, '2020-11-29 02:21:12', '2020-11-29 02:21:12');

-- --------------------------------------------------------

--
-- بنية الجدول `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `permission` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `permission`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'garages', NULL, '2020-11-01 15:39:47', '2020-11-01 15:39:47'),
(2, 3, 'car-type', NULL, '2020-11-12 14:51:09', '2020-11-12 14:51:09'),
(3, 4, 'car-type', NULL, '2020-11-12 16:21:03', '2020-11-12 16:21:03'),
(4, 5, 'contact-us', NULL, '2020-11-17 15:28:45', '2020-11-17 15:28:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisement_translations`
--
ALTER TABLE `advertisement_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_translations_advertisement_id_foreign` (`advertisement_id`),
  ADD KEY `advertisement_translations_locale_index` (`locale`);

--
-- Indexes for table `car_types`
--
ALTER TABLE `car_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_translations_category_id_foreign` (`category_id`),
  ADD KEY `category_translations_locale_index` (`locale`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finances`
--
ALTER TABLE `finances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `garages`
--
ALTER TABLE `garages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `garages_user_id_foreign` (`user_id`),
  ADD KEY `garages_category_id_foreign` (`category_id`),
  ADD KEY `garages_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `garage_car_type`
--
ALTER TABLE `garage_car_type`
  ADD PRIMARY KEY (`car_type_id`,`garage_id`),
  ADD KEY `garage_car_type_garage_id_foreign` (`garage_id`);

--
-- Indexes for table `garage_images`
--
ALTER TABLE `garage_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `garage_images_garage_id_foreign` (`garage_id`);

--
-- Indexes for table `garage_requests`
--
ALTER TABLE `garage_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `garage_request_translations`
--
ALTER TABLE `garage_request_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `garage_request_translations_locale_index` (`locale`),
  ADD KEY `garage_request_translations_garage_request_id_foreign` (`garage_request_id`) USING BTREE;

--
-- Indexes for table `garage_reviews`
--
ALTER TABLE `garage_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `garage_reviews_user_id_foreign` (`user_id`),
  ADD KEY `garage_reviews_garage_id_foreign` (`garage_id`),
  ADD KEY `garage_reviews_order_id_foreign` (`order_id`);

--
-- Indexes for table `garage_service`
--
ALTER TABLE `garage_service`
  ADD PRIMARY KEY (`service_id`,`garage_id`),
  ADD KEY `garage_service_garage_id_foreign` (`garage_id`);

--
-- Indexes for table `garage_translations`
--
ALTER TABLE `garage_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `garage_translations_garage_id_foreign` (`garage_id`),
  ADD KEY `garage_translations_locale_index` (`locale`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_translations`
--
ALTER TABLE `language_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_translations_language_id_foreign` (`language_id`),
  ADD KEY `language_translations_locale_index` (`locale`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_translations`
--
ALTER TABLE `notification_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_translations_notification_id_foreign` (`notification_id`),
  ADD KEY `notification_translations_locale_index` (`locale`);

--
-- Indexes for table `notifies`
--
ALTER TABLE `notifies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notify_translations`
--
ALTER TABLE `notify_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notify_translations_notify_id_foreign` (`notify_id`),
  ADD KEY `notify_translations_locale_index` (`locale`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_garage_id_foreign` (`garage_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_images`
--
ALTER TABLE `order_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_images_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_service`
--
ALTER TABLE `order_service`
  ADD PRIMARY KEY (`service_id`,`order_id`),
  ADD KEY `order_service_order_id_foreign` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_translations_page_id_foreign` (`page_id`),
  ADD KEY `page_translations_locale_index` (`locale`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_translations`
--
ALTER TABLE `permission_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_translations_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_translations_locale_index` (`locale`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_translations`
--
ALTER TABLE `plan_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_translations_plan_id_foreign` (`plan_id`),
  ADD KEY `plan_translations_locale_index` (`locale`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_category_id_foreign` (`category_id`);

--
-- Indexes for table `service_translations`
--
ALTER TABLE `service_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_translations_service_id_foreign` (`service_id`),
  ADD KEY `service_translations_locale_index` (`locale`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_translations_setting_id_foreign` (`setting_id`),
  ADD KEY `setting_translations_locale_index` (`locale`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_translations`
--
ALTER TABLE `slider_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slider_translations_slider_id_foreign` (`slider_id`),
  ADD KEY `slider_translations_locale_index` (`locale`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `advertisement_translations`
--
ALTER TABLE `advertisement_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `car_types`
--
ALTER TABLE `car_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finances`
--
ALTER TABLE `finances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `garages`
--
ALTER TABLE `garages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `garage_images`
--
ALTER TABLE `garage_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `garage_requests`
--
ALTER TABLE `garage_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `garage_request_translations`
--
ALTER TABLE `garage_request_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `garage_reviews`
--
ALTER TABLE `garage_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=611;

--
-- AUTO_INCREMENT for table `garage_translations`
--
ALTER TABLE `garage_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `language_translations`
--
ALTER TABLE `language_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notification_translations`
--
ALTER TABLE `notification_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifies`
--
ALTER TABLE `notifies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `notify_translations`
--
ALTER TABLE `notify_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `order_images`
--
ALTER TABLE `order_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `permission_translations`
--
ALTER TABLE `permission_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `plan_translations`
--
ALTER TABLE `plan_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `service_translations`
--
ALTER TABLE `service_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setting_translations`
--
ALTER TABLE `setting_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slider_translations`
--
ALTER TABLE `slider_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `advertisement_translations`
--
ALTER TABLE `advertisement_translations`
  ADD CONSTRAINT `advertisement_translations_advertisement_id_foreign` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `garages`
--
ALTER TABLE `garages`
  ADD CONSTRAINT `garages_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `garages_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `garages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `garage_car_type`
--
ALTER TABLE `garage_car_type`
  ADD CONSTRAINT `garage_car_type_car_type_id_foreign` FOREIGN KEY (`car_type_id`) REFERENCES `car_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `garage_car_type_garage_id_foreign` FOREIGN KEY (`garage_id`) REFERENCES `garages` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `garage_images`
--
ALTER TABLE `garage_images`
  ADD CONSTRAINT `garage_images_garage_id_foreign` FOREIGN KEY (`garage_id`) REFERENCES `garages` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `garage_request_translations`
--
ALTER TABLE `garage_request_translations`
  ADD CONSTRAINT `garage_request_translations_garage_requests_id_foreign` FOREIGN KEY (`garage_request_id`) REFERENCES `garage_requests` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `garage_reviews`
--
ALTER TABLE `garage_reviews`
  ADD CONSTRAINT `garage_reviews_garage_id_foreign` FOREIGN KEY (`garage_id`) REFERENCES `garages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `garage_reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `garage_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `garage_service`
--
ALTER TABLE `garage_service`
  ADD CONSTRAINT `garage_service_garage_id_foreign` FOREIGN KEY (`garage_id`) REFERENCES `garages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `garage_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `garage_translations`
--
ALTER TABLE `garage_translations`
  ADD CONSTRAINT `garage_translations_garage_id_foreign` FOREIGN KEY (`garage_id`) REFERENCES `garages` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `language_translations`
--
ALTER TABLE `language_translations`
  ADD CONSTRAINT `language_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `notification_translations`
--
ALTER TABLE `notification_translations`
  ADD CONSTRAINT `notification_translations_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `notify_translations`
--
ALTER TABLE `notify_translations`
  ADD CONSTRAINT `notify_translations_notify_id_foreign` FOREIGN KEY (`notify_id`) REFERENCES `notifies` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_garage_id_foreign` FOREIGN KEY (`garage_id`) REFERENCES `garages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `order_images`
--
ALTER TABLE `order_images`
  ADD CONSTRAINT `order_images_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `order_service`
--
ALTER TABLE `order_service`
  ADD CONSTRAINT `order_service_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `permission_translations`
--
ALTER TABLE `permission_translations`
  ADD CONSTRAINT `permission_translations_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `plan_translations`
--
ALTER TABLE `plan_translations`
  ADD CONSTRAINT `plan_translations_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `service_translations`
--
ALTER TABLE `service_translations`
  ADD CONSTRAINT `service_translations_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE SET NULL;

--
-- القيود للجدول `slider_translations`
--
ALTER TABLE `slider_translations`
  ADD CONSTRAINT `slider_translations_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
