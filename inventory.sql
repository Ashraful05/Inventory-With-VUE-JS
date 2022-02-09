-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2022 at 12:18 PM
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
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Juice', '2022-01-23 23:20:16', '2022-01-23 23:20:16'),
(2, 'Chocolate', '2022-01-23 23:25:38', '2022-01-23 23:25:38'),
(3, 'Sports', '2022-01-27 11:49:56', '2022-01-27 11:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Rohit11', 'rohot@yahoo.com', '0232435343', 'babupara', 'backend/customer/1643478489.jpeg', '2022-01-29 11:01:06', '2022-01-29 11:01:06'),
(2, 'rubel', 'rubel@outlook.com', '017343535', 'mistripara', 'backend/customer/1643475912.jpeg', '2022-01-29 11:05:12', '2022-01-29 11:05:12'),
(3, 'Virat', 'virat@outlook.com', '46546464', 'adgafasf', 'backend/customer/1643478765.jpeg', '2022-01-29 11:52:45', '2022-01-29 11:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `address`, `phone`, `salary`, `joining_date`, `nid`, `photo`, `created_at`, `updated_at`) VALUES
(3, 'shova', 'shova@gmail.com', 'babupara', '132334422', '24000', '2022-01-06', '45354322', 'backend/employee/1642868449.jpeg', '2022-01-19 10:09:48', '2022-01-19 10:09:48'),
(6, 'Sabuj', 'sobuj@gmail.com', 'babupara', '08675643424', '2200', '2022-01-08', '346476554', 'backend/employee/1642842037.jpeg', '2022-01-22 03:00:37', '2022-01-22 03:00:37'),
(7, 'Afridi', 'afridi@yahoo.com', 'pakistan', '43534539', '33000', '2022-01-02', '024342980', 'backend/employee/1642868591.jpeg', '2022-01-22 10:23:11', '2022-01-22 10:23:11'),
(8, 'Malik', 'malik@gmail.com', 'Multan', '4534654090', '32000', '2022-01-01', '9532453561', 'backend/employee/1642868736.jpeg', '2022-01-22 10:24:28', '2022-01-22 10:24:28');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `details`, `amount`, `expense_date`, `created_at`, `updated_at`) VALUES
(1, 'Computer Bill', '3500', '2022-01-26', '2022-01-25 23:10:14', '2022-01-25 23:53:34'),
(2, 'Electricity Bill', '500', '2022-01-26', '2022-01-25 23:23:19', '2022-01-25 23:23:19'),
(3, 'Phone Bill', '300', '2022-01-26', '2022-01-25 23:23:56', '2022-01-25 23:23:56');

-- --------------------------------------------------------

--
-- Table structure for table `extra`
--

CREATE TABLE `extra` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vat` int(11) DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra`
--

INSERT INTO `extra` (`id`, `vat`, `logo`, `favicon`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(5, '2022_01_17_154935_create_employees_table', 2),
(6, '2022_01_23_050256_create_suppliers_table', 3),
(7, '2022_01_24_045351_create_categories_table', 4),
(8, '2022_01_24_055940_create_products_table', 5),
(9, '2022_01_26_041810_create_expenses_table', 6),
(10, '2022_01_26_060000_create_salaries_table', 7),
(11, '2022_01_29_163118_create_customers_table', 8),
(12, '2022_02_03_162348_create_pos_table', 9),
(13, '2022_02_05_124846_create_extra_table', 10),
(14, '2022_02_06_070522_create_orders_table', 11),
(15, '2022_02_06_070615_create_order_details_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `qty`, `sub_total`, `vat`, `total`, `pay`, `due`, `pay_by`, `order_date`, `order_month`, `order_year`, `created_at`, `updated_at`) VALUES
(1, 1, '9', NULL, '5', '9870', '8000', '1870', 'giftcard', '06/02/2022', 'February', '2022', NULL, NULL),
(2, 2, '6', NULL, '5', '4305', '4000', '305', 'giftcard', '06/02/2022', 'February', '2022', NULL, NULL),
(3, 3, '5', NULL, '5', '4935', '4500', '200', 'handcash', '06/02/2022', 'February', '2022', NULL, NULL),
(4, 2, '6', NULL, '5', '6720', '5000', '1400', 'giftcard', '07/02/2022', 'February', '2022', NULL, NULL),
(5, 3, '4', NULL, '5', '6720', '6000', '720', 'cheque', '07/02/2022', 'February', '2022', NULL, NULL),
(6, 1, '2', '1000', '5', '1050', '500', '550', 'handcash', '07/02/2022', 'February', '2022', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `pro_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `pro_quantity`, `pro_price`, `sub_total`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '4', '1600', '6400', NULL, NULL),
(2, 1, 2, '5', '600', '3000', NULL, NULL),
(3, 1, 1, '0', '500', '0', NULL, NULL),
(4, 2, 3, '1', '1600', '1600', NULL, NULL),
(5, 2, 1, '5', '500', '2500', NULL, NULL),
(6, 3, 3, '2', '1600', '3200', NULL, NULL),
(7, 3, 1, '3', '500', '1500', NULL, NULL),
(8, 4, 3, '3', '1600', '4800', NULL, NULL),
(9, 4, 2, '1', '600', '600', NULL, NULL),
(10, 4, 1, '2', '500', '1000', NULL, NULL),
(11, 5, 3, '4', '1600', '6400', NULL, NULL),
(12, 6, 1, '2', '500', '1000', NULL, NULL);

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
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pro_id` int(11) DEFAULT NULL,
  `pro_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `root` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buying_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buying_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `supplier_id`, `product_name`, `product_code`, `root`, `buying_price`, `selling_price`, `buying_date`, `image`, `product_quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Product1', '111', 'root', '400', '500', '2022-01-23', 'backend/product/1643089920.png', '538', '2022-01-24 23:52:00', '2022-01-24 23:52:00'),
(2, 2, 2, 'Product2', '112', 'root', '500', '600', '2022-01-16', 'backend/product/1643095104.png', '994', '2022-01-24 23:55:27', '2022-01-24 23:55:27'),
(3, 3, 4, 'Bat', 'bat101', 'sports', '1200', '1600', '2022-01-18', 'backend/product/1643305998.jpeg', '186', '2022-01-27 11:53:18', '2022-01-27 11:53:18');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `salary_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`id`, `employee_id`, `amount`, `salary_date`, `salary_month`, `salary_year`, `created_at`, `updated_at`) VALUES
(1, 3, 24000, '27/01/2022', 'January', '2022', '2022-01-26 23:54:33', '2022-01-26 23:54:33'),
(2, 3, 24000, '27/01/2022', 'February', '2022', '2022-01-26 23:57:24', '2022-01-26 23:57:24'),
(3, 3, 24000, '27/01/2022', 'March', '2022', '2022-01-26 23:57:29', '2022-01-26 23:57:29'),
(4, 6, 2200, '27/01/2022', 'January', '2022', '2022-01-26 23:57:34', '2022-01-26 23:57:34'),
(5, 6, 20000, '27/01/2022', 'February', '2022', '2022-01-26 23:57:40', '2022-01-26 23:57:40'),
(6, 6, 2200, '27/01/2022', 'March', '2022', '2022-01-26 23:57:44', '2022-01-26 23:57:44'),
(7, 7, 33000, '27/01/2022', 'January', '2022', '2022-01-26 23:57:50', '2022-01-26 23:57:50'),
(8, 7, 33000, '27/01/2022', 'February', '2022', '2022-01-26 23:57:55', '2022-01-26 23:57:55'),
(9, 7, 33000, '27/01/2022', 'March', '2022', '2022-01-26 23:57:58', '2022-01-26 23:57:58'),
(10, 8, 32000, '27/01/2022', 'January', '2022', '2022-01-26 23:58:04', '2022-01-26 23:58:04'),
(11, 8, 32000, '27/01/2022', 'February', '2022', '2022-01-26 23:58:09', '2022-01-26 23:58:09'),
(12, 8, 32000, '27/01/2022', 'March', '2022', '2022-01-26 23:58:13', '2022-01-26 23:58:13'),
(13, 6, 20000, '27/01/2022', 'April', '2022', '2022-01-27 10:31:02', '2022-01-27 10:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `address`, `photo`, `shopname`, `created_at`, `updated_at`) VALUES
(1, 'Ashraf', 'ashraf@gmail.com', '018733509', 'munshipara', 'backend/supplier/1642919113.png', 'asraf&tech', '2022-01-22 23:39:50', '2022-01-22 23:39:50'),
(2, 'simul', 'simul@outlook.com', '075364564', 'gazipur', 'backend/supplier/1642919227.jpeg', 'pran', '2022-01-23 00:27:07', '2022-01-23 00:27:07'),
(3, 'ratul', 'ratul@yahoo.com', '23454345', 'munshiganj', 'backend/supplier/1642919320.png', 'walton', '2022-01-23 00:28:40', '2022-01-23 00:28:40'),
(4, 'CA', 'ca@pk.com', '90834232', 'sialkot', 'backend/supplier/1643305991.jpeg', 'CA Sports Marketing Limited', '2022-01-27 11:51:37', '2022-01-27 11:51:37');

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
(1, 'ashraf', 'ashraf@gmail.com', NULL, '$2a$12$EAq5m4/OxQzmXU7S00Hte.Q6f7gta5Rtdxx.uVyqqEVVRmTFYh2Lu', NULL, NULL, NULL),
(2, 'jamil', 'jamil@gmail.com', NULL, '$2y$10$ukCQXV9RxR6j64gTblgL7edNN/T1X/VnzpCWSSQ9GbCMH71B0iYv2', NULL, '2022-01-15 10:22:57', '2022-01-15 10:22:57'),
(3, 'arif', 'arif@gmail.com', NULL, '$2y$10$e8Lj.bCbDtbuDI0WvMw.hOfHS/licVul/KfrFBfwUhauEUNly0O92', NULL, '2022-01-15 10:34:07', '2022-01-15 10:34:07'),
(4, 'azad', 'azad@gmail.com', NULL, '$2y$10$8W9/.9J/eN5zr6flboSWNOt17k.6AnJPO5xYaVS/pWg4o5PjtwWHW', NULL, '2022-01-15 10:37:21', '2022-01-15 10:37:21'),
(5, 'azad1', 'azad1@gmail.com', NULL, '$2y$10$GvshOxK18Y2X01WpLAt./ODV4Z9IrsGZgNgfAnrSsBP1XdEwo0UbK', NULL, '2022-01-15 10:46:22', '2022-01-15 10:46:22'),
(6, 'shubho', 'shubho@yahoo.com', NULL, '$2y$10$FpoP1gt4bwPpFD6u/1M1ge.ORSL1IK84lGIffmcU9rdOmCAhgYdhe', NULL, '2022-01-15 10:50:13', '2022-01-15 10:50:13'),
(7, 'rajib', 'rajib@yahoo.com', NULL, '$2y$10$M4O9E/SqH.oXrNJ03DpP9e8GsfVCui0mEG/LJ5jBEPBDisQwA7zeO', NULL, '2022-01-15 11:40:06', '2022-01-15 11:40:06'),
(8, 'raju', 'raju@gmail.com', NULL, '$2y$10$BP7akL/CWmXU5jAxP080nevBXrofDESeGDaVukLb6zbNvGKmjgC.W', NULL, '2022-01-16 12:08:36', '2022-01-16 12:08:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra`
--
ALTER TABLE `extra`
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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
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
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `extra`
--
ALTER TABLE `extra`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
