-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: mariadb:3306
-- Generation Time: Apr 15, 2019 at 03:54 AM
-- Server version: 10.4.3-MariaDB-1:10.4.3+maria~bionic
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop-test`
--

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, 'color', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(2, 'size', '2019-04-15 02:55:05', '2019-04-15 02:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `feature_values`
--

CREATE TABLE `feature_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `feature_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feature_values`
--

INSERT INTO `feature_values` (`id`, `feature_id`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, 'white', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(2, 1, 'black', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(3, 2, 'small', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(4, 2, 'medium', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(5, 2, 'big', '2019-04-15 02:55:05', '2019-04-15 02:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `feature_value_product`
--

CREATE TABLE `feature_value_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `feature_value_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feature_value_product`
--

INSERT INTO `feature_value_product` (`id`, `feature_value_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 5, 3, NULL, NULL),
(5, 2, 5, NULL, NULL),
(6, 3, 5, NULL, NULL),
(7, 1, 6, NULL, NULL),
(8, 5, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(2, 'ru', 'Русский', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(3, 'ua', 'Українська', '2019-04-15 02:55:05', '2019-04-15 02:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(677, '2014_10_12_000000_create_users_table', 1),
(678, '2014_10_12_100000_create_password_resets_table', 1),
(679, '2019_04_14_122720_create_products_table', 1),
(680, '2019_04_14_123047_create_features_table', 1),
(681, '2019_04_14_123235_create_feature_values_table', 1),
(682, '2019_04_14_123521_create_languages_table', 1),
(683, '2019_04_14_123543_create_translations_table', 1),
(684, '2019_04_15_021054_create_feature_value_product_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `parent_id`, `code`, `price`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ZofIKNhlAF', '26.40', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(2, 1, 'c3P0hSc7sg', '32.90', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(3, 1, 'xbF9sN6bn0', '31.60', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(4, NULL, 'CKRFidmqOm', '120.67', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(5, 4, 'kcvoyuM9hG', NULL, '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(6, 4, '8BMghAKL94', NULL, '2019-04-15 02:55:06', '2019-04-15 02:55:06');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `target_type` enum('feature','feature_value','product') COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `language_id`, `target_type`, `target_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'feature', 1, 'Color', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(2, 2, 'feature', 1, 'Цвет', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(3, 3, 'feature', 1, 'Колір', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(4, 1, 'feature_value', 1, 'White', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(5, 2, 'feature_value', 1, 'Белый', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(6, 3, 'feature_value', 1, 'Білий', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(7, 1, 'feature_value', 2, 'Black', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(8, 2, 'feature_value', 2, 'Черный', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(9, 3, 'feature_value', 2, 'Чорний', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(10, 1, 'feature', 2, 'Size', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(11, 2, 'feature', 2, 'Размер', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(12, 3, 'feature', 2, 'Розмір', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(13, 1, 'feature_value', 3, 'White', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(14, 2, 'feature_value', 3, 'Белый', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(15, 3, 'feature_value', 3, 'Білий', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(16, 1, 'feature_value', 4, 'Medium', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(17, 2, 'feature_value', 4, 'Средний', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(18, 3, 'feature_value', 4, 'Середній', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(19, 1, 'feature_value', 5, 'Big', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(20, 2, 'feature_value', 5, 'Большой', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(21, 3, 'feature_value', 5, 'Великий', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(22, 1, 'product', 1, 'Wallet', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(23, 2, 'product', 1, 'Кошелек', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(24, 3, 'product', 1, 'Гаманець', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(25, 1, 'product', 4, 'Suit', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(26, 2, 'product', 4, 'Костюм', '2019-04-15 02:55:05', '2019-04-15 02:55:05'),
(27, 3, 'product', 4, 'Костюм', '2019-04-15 02:55:05', '2019-04-15 02:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `features_code_unique` (`code`);

--
-- Indexes for table `feature_values`
--
ALTER TABLE `feature_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feature_values_feature_id_foreign` (`feature_id`);

--
-- Indexes for table `feature_value_product`
--
ALTER TABLE `feature_value_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feature_value_product_feature_value_id_foreign` (`feature_value_id`),
  ADD KEY `feature_value_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`),
  ADD KEY `products_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_language_id_foreign` (`language_id`);

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
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feature_values`
--
ALTER TABLE `feature_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feature_value_product`
--
ALTER TABLE `feature_value_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=685;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feature_values`
--
ALTER TABLE `feature_values`
  ADD CONSTRAINT `feature_values_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feature_value_product`
--
ALTER TABLE `feature_value_product`
  ADD CONSTRAINT `feature_value_product_feature_value_id_foreign` FOREIGN KEY (`feature_value_id`) REFERENCES `feature_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feature_value_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
