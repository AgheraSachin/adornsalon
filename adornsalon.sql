-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2020 at 02:23 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adornsalon`
--

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `item_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `item_number`, `txn_id`, `payment_gross`, `currency_code`, `payment_status`) VALUES
(1, '1', '34K6578970972932H', 0.01, 'GBP', 'Completed'),
(2, '4', '33B2397476599961S', 1.89, 'GBP', 'Completed'),
(4, 'Ex1593059256', '2DU502797H221710E', 84.00, 'GBP', 'Completed'),
(5, 'Ex1593057792', '06062408WW229520U', 45.00, 'GBP', 'Completed'),
(6, '10', '26U529555V6023108', 8.50, 'GBP', 'Completed'),
(7, '17', '291334028U746941E', 26.50, 'GBP', 'Completed'),
(8, '20', '2H85418317557440H', 92.50, 'GBP', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active | 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `status`) VALUES
(1, 'test1', '', 0.01, 1),
(2, 'test2', '', 0.02, 1),
(3, 'test3', '', 0.56, 1),
(4, 'tsst 5', '', 1.89, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `location_id` varchar(50) NOT NULL,
  `remember_token` varchar(256) DEFAULT NULL,
  `insertdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `name`, `email`, `password`, `role_id`, `location_id`, `remember_token`, `insertdate`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$b9YwQANH32cgERGppOHtNuOc2mIRjlAFihtyrJDodgSC/QxRCLHEe', 0, '1,2,3,4,5,6,7,8', NULL, '2020-06-09 10:31:37'),
(4, 'demo', 'demo@gmail.com', '$2y$10$b9YwQANH32cgERGppOHtNuOc2mIRjlAFihtyrJDodgSC/QxRCLHEe', 1, '1,6', NULL, '2020-06-12 09:11:11'),
(7, 'prachi', 'prachikkothari@gmail.com', '$2y$10$2YHlt/LXd2wegZyZHqsfge0a6Q5bral4vvyqGooO.mt916tDTCBae', 1, '2,3', NULL, '2020-07-02 10:49:53');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_appointment`
--

DROP TABLE IF EXISTS `tbl_appointment`;
CREATE TABLE `tbl_appointment` (
  `tbl_appointment_id` int(11) NOT NULL,
  `tbl_appointment_user_id` int(11) DEFAULT NULL,
  `tbl_appointment_staff_id` int(11) NOT NULL DEFAULT '0',
  `tbl_appointment_client_id` int(11) NOT NULL,
  `tbl_appointment_service_id` varchar(50) NOT NULL,
  `tbl_appointment_location_id` int(11) NOT NULL,
  `tbl_appointment_txnid` varchar(256) NOT NULL DEFAULT '0',
  `tbl_appointment_date` date NOT NULL,
  `tbl_appointment_start_time` time NOT NULL,
  `tbl_appointment_end_time` time NOT NULL,
  `tbl_appointment_noofperson` int(11) DEFAULT NULL,
  `tbl_appointment_group` enum('0','1') NOT NULL COMMENT '0-no, 1-yes ',
  `tbl_appointment_total_amount` float DEFAULT NULL,
  `tbl_appointment_comments` varchar(256) NOT NULL,
  `tbl_appointment_payment_type` varchar(100) NOT NULL,
  `tbl_appointment_insertdate` datetime NOT NULL,
  `tbl_appointment_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_appointment`
--

INSERT INTO `tbl_appointment` (`tbl_appointment_id`, `tbl_appointment_user_id`, `tbl_appointment_staff_id`, `tbl_appointment_client_id`, `tbl_appointment_service_id`, `tbl_appointment_location_id`, `tbl_appointment_txnid`, `tbl_appointment_date`, `tbl_appointment_start_time`, `tbl_appointment_end_time`, `tbl_appointment_noofperson`, `tbl_appointment_group`, `tbl_appointment_total_amount`, `tbl_appointment_comments`, `tbl_appointment_payment_type`, `tbl_appointment_insertdate`, `tbl_appointment_updatedate`) VALUES
(1, 1, 3, 1, '1,2', 0, '0', '2020-06-17', '11:54:00', '21:54:00', 2, '0', NULL, 'demo', '', '2020-06-17 13:50:00', '2020-06-17 08:20:00'),
(2, 1, 2, 1, '1', 1, '0', '2020-06-18', '14:44:00', '15:44:00', 0, '0', NULL, '', '', '2020-06-18 14:47:03', '2020-06-18 09:17:03'),
(4, 1, 2, 1, '2', 1, '0', '2020-06-18', '15:53:00', '03:23:00', 0, '0', NULL, '', '', '2020-06-18 14:53:21', '2020-06-18 09:23:21'),
(5, NULL, 2, 1, '1,2', 0, '0', '2020-06-20', '17:00:00', '17:30:00', 0, '0', NULL, 'demo api', '', '2020-06-20 16:34:18', '2020-06-20 11:04:18'),
(10, 1, 0, 13, '1,2,3', 1, '26U529555V6023108', '2020-06-27', '10:15:00', '10:30:00', 0, '0', NULL, 'demo api', '', '2020-06-26 00:50:43', '2020-06-25 19:20:43'),
(11, 1, 2, 13, '1,2', 0, '0', '2020-06-20', '19:00:00', '20:00:00', 0, '0', NULL, 'demo api', '', '2020-06-26 04:12:32', '2020-06-25 22:42:32'),
(12, 1, 2, 13, '1,2', 0, '0', '2020-06-20', '19:00:00', '20:00:00', 0, '0', NULL, 'demo api', '', '2020-06-26 04:13:59', '2020-06-25 22:43:59'),
(15, 1, 0, 13, '1,2,3,5,7,9,11,13', 1, '0', '2020-06-30', '10:00:00', '11:20:00', 0, '0', NULL, 'demo api', '', '2020-06-26 18:23:22', '2020-06-26 12:53:22'),
(16, 1, 0, 13, '1,2,3,4,5,6,7', 1, '0', '2020-06-30', '10:00:00', '10:55:00', 0, '0', NULL, 'demo api', '', '2020-06-26 18:24:42', '2020-06-26 12:54:42'),
(17, 1, 0, 13, '1,2,3,5,6,7,8', 1, '291334028U746941E', '2020-06-30', '10:00:00', '10:50:00', 0, '0', NULL, 'demo api', '', '2020-06-26 18:36:00', '2020-06-26 13:06:00'),
(20, 1, 0, 13, '122,125,126,127,128,129,130,131', 1, '2H85418317557440H', '2020-06-30', '10:00:00', '12:30:00', 0, '0', 92.5, 'demo api', '', '2020-06-26 18:51:47', '2020-06-26 13:21:47'),
(21, 1, 0, 13, '23,25,24,28', 1, '0', '2020-06-27', '11:20:00', '11:40:00', 0, '0', 144, 'demo api', '', '2020-06-26 22:36:36', '2020-06-26 17:06:36'),
(22, 1, 0, 13, '98,100,119', 1, '0', '2020-06-29', '15:10:00', '20:20:00', 0, '0', 135, 'demo api', '', '2020-06-27 03:34:40', '2020-06-26 22:04:40'),
(24, 0, 0, 1, '98,119', 0, '0', '2020-07-01', '11:00:00', '12:00:00', 2, '0', 300, 'from web', 'store', '2020-06-29 12:01:03', '2020-06-29 06:31:03'),
(25, 0, 0, 14, '98,119', 0, '0', '2020-07-01', '11:00:00', '12:00:00', 2, '0', 300, 'from web', 'store', '2020-06-29 12:57:01', '2020-06-29 07:27:01'),
(26, 0, 0, 13, '1260,1284,1293', 1, '0', '2020-07-10', '10:30:00', '11:00:00', 2, '0', 33, 'demo api', 'Pay at salon', '2020-06-29 13:57:18', '2020-06-29 08:27:18'),
(27, 0, 0, 13, '23,26,27,42', 1, '0', '2020-07-02', '13:15:00', '14:20:00', 2, '0', 578, 'demo api', 'Pay at salon', '2020-06-29 13:59:28', '2020-06-29 08:29:28'),
(28, 0, 0, 13, '23,26,27,42', 1, '0', '2020-07-02', '13:15:00', '14:20:00', 2, '0', 578, 'demo api', 'Pay at salon', '2020-06-29 14:00:47', '2020-06-29 08:30:47'),
(29, 0, 0, 13, '12,14', 1, '0', '2020-07-10', '12:05:00', '12:30:00', 2, '0', 44, 'demo api', 'Pay at salon', '2020-06-29 14:01:43', '2020-06-29 08:31:43'),
(30, 0, 0, 15, '15,16', 1, '0', '2020-06-30', '11:20:00', '12:40:00', 3, '0', 240, 'demo api', 'Pay at salon', '2020-06-29 14:13:49', '2020-06-29 08:43:49'),
(31, 0, 0, 13, '118,125,130,142', 1, '0', '2020-07-01', '16:15:00', '17:30:00', 2, '0', 138, 'demo api', 'Pay at salon', '2020-06-29 14:44:08', '2020-06-29 09:14:08'),
(41, 4, 3, 13, '1,2', 1, '0', '2020-07-22', '15:20:00', '15:30:00', 2, '0', 13, 'demo', 'store', '2020-07-01 15:21:20', '2020-07-01 09:51:20'),
(42, 4, 7, 16, '1,10', 1, '0', '2020-07-15', '16:15:00', '16:40:00', 1, '0', 20, '', 'store', '2020-07-01 16:21:28', '2020-07-01 10:51:28'),
(46, 4, 3, 13, '1,2', 1, '0', '2020-07-22', '16:53:00', '17:03:00', 1, '0', 6.5, '', 'store', '2020-07-01 16:54:07', '2020-07-01 11:24:07'),
(47, 4, 4, 13, '6,10', 1, '0', '2020-07-16', '17:17:00', '17:47:00', 1, '0', 21, '', 'store', '2020-07-01 17:17:44', '2020-07-01 11:47:44'),
(48, 4, 5, 13, '171', 1, '0', '2020-07-16', '17:20:00', '18:20:00', 1, '0', 20, '', 'store', '2020-07-01 17:20:15', '2020-07-01 11:50:15'),
(49, 4, 7, 13, '2,3', 1, '0', '2020-07-16', '17:21:00', '17:31:00', 1, '0', 4.5, '', 'store', '2020-07-01 17:21:45', '2020-07-01 11:51:45'),
(50, 4, 3, 13, '4', 1, '0', '2020-07-16', '17:22:00', '17:32:00', 1, '0', 4, '', 'store', '2020-07-01 17:22:50', '2020-07-01 11:52:50'),
(51, 4, 5, 13, '1270', 1, '0', '2020-07-23', '17:28:00', '17:38:00', 1, '0', 4, '', 'store', '2020-07-01 17:28:59', '2020-07-01 11:58:59'),
(52, 4, 5, 13, '1299,1309,1311', 1, '0', '2020-07-23', '17:47:00', '18:32:00', 1, '0', 42, '', 'store', '2020-07-01 18:03:42', '2020-07-01 12:33:43'),
(53, 4, 5, 13, '114,126', 1, '0', '2020-07-20', '18:13:00', '19:43:00', 1, '0', 110, '', 'store', '2020-07-01 18:13:50', '2020-07-01 12:43:50'),
(54, 4, 4, 13, '96', 1, '0', '2020-07-21', '18:14:00', '18:34:00', 1, '0', 10, '', 'store', '2020-07-01 18:15:04', '2020-07-01 12:45:04'),
(57, 0, 0, 13, '11,3,10', 1, '0', '2020-07-11', '11:40:00', '12:30:00', 1, '0', 38, 'demo api', 'Pay at salon', '2020-07-02 12:22:06', '2020-07-02 06:52:06'),
(58, 0, 0, 13, '86,88,87', 1, '0', '2020-07-04', '12:45:00', '15:30:00', 1, '0', 230, 'demo api', 'Pay at salon', '2020-07-02 12:28:26', '2020-07-02 06:58:26'),
(59, 0, 0, 14, '98,119', 1, '0', '2020-07-01', '11:00:00', '12:00:00', 2, '1', 300, 'from web', 'store', '2020-07-03 17:16:01', '2020-07-03 11:46:01'),
(61, 0, 0, 14, '1,2,3', 1, '0', '2020-07-01', '11:00:00', '12:00:00', NULL, '1', 300, 'from web', 'store', '2020-07-05 15:21:47', '2020-07-05 09:51:47'),
(62, 0, 0, 14, '1,2,3', 1, '0', '2020-07-01', '11:00:00', '12:00:00', NULL, '1', 300, 'from web', 'store', '2020-07-06 16:24:14', '2020-07-06 10:54:14'),
(64, 1, 4, 13, '1260,1284,1293', 1, '0', '2020-07-25', '17:47:00', '18:47:00', 1, '0', 40, '', 'store', '2020-07-07 17:48:05', '2020-07-07 12:18:05'),
(65, 4, 7, 13, '3,4,10', 1, '0', '2020-07-24', '10:00:00', '10:18:00', 1, '0', 8.5, '', 'store', '2020-07-10 07:54:46', '2020-07-10 06:54:46'),
(67, 4, 7, 14, '77,94', 1, '0', '2020-07-24', '10:19:00', '10:39:00', 1, '0', 22, '', 'store', '2020-07-10 07:57:43', '2020-07-10 06:57:43'),
(68, 4, 4, 13, '73,74,94', 1, '0', '2020-07-28', '10:00:00', '10:25:00', 1, '0', 30, '', 'store', '2020-07-10 09:50:01', '2020-07-10 08:50:01'),
(69, 4, 0, 13, '73,74,94', 1, '0', '2020-07-18', '10:00:00', '11:00:00', 1, '0', 30, '', 'store', '2020-07-10 09:50:01', '2020-07-10 08:50:01'),
(70, 4, 3, 13, '12', 1, '0', '2020-07-29', '11:18:00', '11:38:00', 1, '0', 16, '', 'store', '2020-07-18 11:18:49', '2020-07-18 10:18:49'),
(77, 4, 5, 14, '114,118', 1, '0', '2020-07-25', '12:43:00', '13:43:00', 1, '1', 149, '', 'store', '2020-07-24 12:44:57', '2020-07-24 11:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clients`
--

DROP TABLE IF EXISTS `tbl_clients`;
CREATE TABLE `tbl_clients` (
  `tbl_clients_id` int(11) NOT NULL,
  `tbl_clients_user_id` int(11) DEFAULT NULL,
  `tbl_clients_unique_id` int(11) NOT NULL,
  `tbl_clients_first_name` varchar(100) NOT NULL,
  `tbl_clients_middle_name` varchar(100) NOT NULL,
  `tbl_clients_last_name` varchar(100) NOT NULL,
  `tbl_clients_user_name` varchar(100) DEFAULT NULL,
  `tbl_clients_email` varchar(256) NOT NULL,
  `tbl_clients_password` varchar(256) NOT NULL,
  `tbl_clients_country_code` varchar(11) NOT NULL,
  `tbl_clients_mobile` varchar(20) NOT NULL,
  `tbl_clients_telephone` varchar(20) DEFAULT NULL,
  `tbl_clients_image` varchar(256) NOT NULL,
  `tbl_clients_notification` enum('1','0') NOT NULL DEFAULT '0' COMMENT '1-enable, 0-disable',
  `tbl_clients_gender` enum('M','F','O') NOT NULL,
  `tbl_clients_referral_source` int(11) DEFAULT NULL,
  `tbl_clients_birthday` date DEFAULT NULL,
  `tbl_clients_address` varchar(256) NOT NULL,
  `tbl_clients_marital_status` enum('0','1') NOT NULL DEFAULT '0',
  `tbl_clients_anniversary_date` date DEFAULT NULL,
  `tbl_clients_location_id` int(11) NOT NULL,
  `tbl_clients_status` enum('1','0') NOT NULL DEFAULT '0' COMMENT '1-active, 0-notactive',
  `tbl_clients_last_login_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tbl_clients_insertdate` datetime NOT NULL,
  `tbl_clients_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_clients`
--

INSERT INTO `tbl_clients` (`tbl_clients_id`, `tbl_clients_user_id`, `tbl_clients_unique_id`, `tbl_clients_first_name`, `tbl_clients_middle_name`, `tbl_clients_last_name`, `tbl_clients_user_name`, `tbl_clients_email`, `tbl_clients_password`, `tbl_clients_country_code`, `tbl_clients_mobile`, `tbl_clients_telephone`, `tbl_clients_image`, `tbl_clients_notification`, `tbl_clients_gender`, `tbl_clients_referral_source`, `tbl_clients_birthday`, `tbl_clients_address`, `tbl_clients_marital_status`, `tbl_clients_anniversary_date`, `tbl_clients_location_id`, `tbl_clients_status`, `tbl_clients_last_login_at`, `tbl_clients_insertdate`, `tbl_clients_updatedate`) VALUES
(13, NULL, 692270, 'prachi', '', 'kothari', 'prachi15', 'prachikkothari@gmail.com', '$2y$10$5fraQDPYVyosrcXNVLjGGO/CD3xhxF7bkrpCZISe5hrIIb8V/mmpS', '91', '9913692942', NULL, '', '1', 'M', 1, '1970-01-01', '', '0', '1970-01-01', 1, '1', '2020-07-06 12:52:16', '2020-06-26 00:50:43', '2020-06-25 19:20:43'),
(14, NULL, 282805, 'ayushi', '', '', '', 'ayushi@gmail.com', '', '0', '9876543210', NULL, '', '0', 'F', NULL, NULL, '', '0', '0000-00-00', 1, '1', '2020-07-01 07:51:17', '2020-06-29 12:57:00', '2020-06-29 07:27:00'),
(16, NULL, 784032, 'pratik', '', 'vaja', 'pratik17', 'pratik.itrd@gmail.com', '$2y$10$9fDcrPvQpZDbxJGGvvjX1OSYxDjRK01CLx8QZVlEwbk9IGnh/8gpm', '91', '9876543210', NULL, '', '1', 'M', 1, '1989-07-25', '', '1', '2020-02-01', 1, '1', '2020-07-06 12:51:58', '2020-07-01 16:21:28', '2020-07-01 10:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_consultationform_data`
--

DROP TABLE IF EXISTS `tbl_consultationform_data`;
CREATE TABLE `tbl_consultationform_data` (
  `tbl_consultationform_data_id` int(11) NOT NULL,
  `tbl_consultationform_data_const_id` int(11) NOT NULL,
  `tbl_consultationform_data_client_id` int(11) NOT NULL,
  `tbl_consultationform_data_data` text NOT NULL,
  `tbl_consultationform_data_location_id` int(11) NOT NULL,
  `tbl_consultationform_data_insertdate` datetime NOT NULL,
  `tbl_consultationform_data_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_consultation_form`
--

DROP TABLE IF EXISTS `tbl_consultation_form`;
CREATE TABLE `tbl_consultation_form` (
  `tbl_consultation_form_id` int(11) NOT NULL,
  `tbl_consultation_form_service_id` int(11) NOT NULL,
  `tbl_consultation_form_title` varchar(100) NOT NULL,
  `tbl_consultation_form_data` text NOT NULL,
  `tbl_consultation_form_location_id` int(11) NOT NULL,
  `tbl_consultation_form_insertdate` datetime NOT NULL,
  `tbl_consultation_form_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_consultation_form`
--

INSERT INTO `tbl_consultation_form` (`tbl_consultation_form_id`, `tbl_consultation_form_service_id`, `tbl_consultation_form_title`, `tbl_consultation_form_data`, `tbl_consultation_form_location_id`, `tbl_consultation_form_insertdate`, `tbl_consultation_form_updatedate`) VALUES
(1, 1, 'Demo', '[{\"datatype\":\"text\",\"label\":\"Enter you Name\",\"name\":\"name\",\"placeholder\":\"\",\"required\":\"required\",\"value\":\"\"}]', 0, '2020-06-18 19:14:25', '2020-06-18 13:44:25'),
(2, 2, 'test2', '[{\"datatype\":\"textarea\",\"label\":\"Label\",\"name\":\"\",\"placeholder\":\"\",\"required\":\"\",\"value\":\"\"},{\"datatype\":\"radio\",\"label\":\"Label\",\"name\":\"\",\"required\":\"\",\"value\":[{\"option\":\"Option<span></span>\",\"value\":\"Value\"}]},{\"datatype\":\"checkbox\",\"label\":\"Label\",\"name\":\"\",\"required\":\"\",\"value\":[{\"option\":\"Option\",\"value\":\"Value\"}]}]', 0, '2020-06-19 19:10:35', '2020-06-19 13:40:35'),
(3, 1, 'demo', '[{\"datatype\":\"text\",\"label\":\"Label\",\"name\":\"\",\"placeholder\":\"\",\"required\":\"\",\"value\":\"\"},{\"datatype\":\"textarea\",\"label\":\"Label\",\"name\":\"\",\"placeholder\":\"\",\"required\":\"\",\"value\":\"\"},{\"datatype\":\"radio\",\"label\":\"Label\",\"name\":\"\",\"required\":\"\",\"value\":[{\"option\":\"Option<span></span>\",\"value\":\"Value\"},{\"option\":\"Option<span></span>\",\"value\":\"Value\"}]}]', 1, '2020-07-23 06:31:00', '2020-07-23 05:31:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country_code`
--

DROP TABLE IF EXISTS `tbl_country_code`;
CREATE TABLE `tbl_country_code` (
  `tbl_country_code_id` int(11) NOT NULL,
  `tbl_country_code_name` varchar(256) NOT NULL,
  `tbl_country_code_iso_code` varchar(10) NOT NULL,
  `tbl_country_code_isd_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_country_code`
--

INSERT INTO `tbl_country_code` (`tbl_country_code_id`, `tbl_country_code_name`, `tbl_country_code_iso_code`, `tbl_country_code_isd_code`) VALUES
(1, 'Afghanistan', 'AF', '93'),
(2, 'Albania', 'AL', '355'),
(3, 'Algeria', 'DZ', '213'),
(4, 'American Samoa', 'AS', '1-684'),
(5, 'Andorra', 'AD', '376'),
(6, 'Angola', 'AO', '244'),
(7, 'Anguilla', 'AI', '1-264'),
(8, 'Antarctica', 'AQ', '672'),
(9, 'Antigua and Barbuda', 'AG', '1-268'),
(10, 'Argentina', 'AR', '54'),
(11, 'Armenia', 'AM', '374'),
(12, 'Aruba', 'AW', '297'),
(13, 'Australia', 'AU', '61'),
(14, 'Austria', 'AT', '43'),
(15, 'Azerbaijan', 'AZ', '994'),
(16, 'Bahamas', 'BS', '1-242'),
(17, 'Bahrain', 'BH', '973'),
(18, 'Bangladesh', 'BD', '880'),
(19, 'Barbados', 'BB', '1-246'),
(20, 'Belarus', 'BY', '375'),
(21, 'Belgium', 'BE', '32'),
(22, 'Belize', 'BZ', '501'),
(23, 'Benin', 'BJ', '229'),
(24, 'Bermuda', 'BM', '1-441'),
(25, 'Bhutan', 'BT', '975'),
(26, 'Bolivia', 'BO', '591'),
(27, 'Bosnia and Herzegowina', 'BA', '387'),
(28, 'Botswana', 'BW', '267'),
(29, 'Bouvet Island', 'BV', '47'),
(30, 'Brazil', 'BR', '55'),
(31, 'British Indian Ocean Territory', 'IO', '246'),
(32, 'Brunei Darussalam', 'BN', '673'),
(33, 'Bulgaria', 'BG', '359'),
(34, 'Burkina Faso', 'BF', '226'),
(35, 'Burundi', 'BI', '257'),
(36, 'Cambodia', 'KH', '855'),
(37, 'Cameroon', 'CM', '237'),
(38, 'Canada', 'CA', '1'),
(39, 'Cape Verde', 'CV', '238'),
(40, 'Cayman Islands', 'KY', '1-345'),
(41, 'Central African Republic', 'CF', '236'),
(42, 'Chad', 'TD', '235'),
(43, 'Chile', 'CL', '56'),
(44, 'China', 'CN', '86'),
(45, 'Christmas Island', 'CX', '61'),
(46, 'Cocos (Keeling) Islands', 'CC', '61'),
(47, 'Colombia', 'CO', '57'),
(48, 'Comoros', 'KM', '269'),
(49, 'Congo Democratic Republic of', 'CG', '242'),
(50, 'Cook Islands', 'CK', '682'),
(51, 'Costa Rica', 'CR', '506'),
(52, 'Cote D\'Ivoire', 'CI', '225'),
(53, 'Croatia', 'HR', '385'),
(54, 'Cuba', 'CU', '53'),
(55, 'Cyprus', 'CY', '357'),
(56, 'Czech Republic', 'CZ', '420'),
(57, 'Denmark', 'DK', '45'),
(58, 'Djibouti', 'DJ', '253'),
(59, 'Dominica', 'DM', '1-767'),
(60, 'Dominican Republic', 'DO', '1-809'),
(61, 'Timor-Leste', 'TL', '670'),
(62, 'Ecuador', 'EC', '593'),
(63, 'Egypt', 'EG', '20'),
(64, 'El Salvador', 'SV', '503'),
(65, 'Equatorial Guinea', 'GQ', '240'),
(66, 'Eritrea', 'ER', '291'),
(67, 'Estonia', 'EE', '372'),
(68, 'Ethiopia', 'ET', '251'),
(69, 'Falkland Islands (Malvinas)', 'FK', '500'),
(70, 'Faroe Islands', 'FO', '298'),
(71, 'Fiji', 'FJ', '679'),
(72, 'Finland', 'FI', '358'),
(73, 'France', 'FR', '33'),
(75, 'French Guiana', 'GF', '594'),
(76, 'French Polynesia', 'PF', '689'),
(77, 'French Southern Territories', 'TF', NULL),
(78, 'Gabon', 'GA', '241'),
(79, 'Gambia', 'GM', '220'),
(80, 'Georgia', 'GE', '995'),
(81, 'Germany', 'DE', '49'),
(82, 'Ghana', 'GH', '233'),
(83, 'Gibraltar', 'GI', '350'),
(84, 'Greece', 'GR', '30'),
(85, 'Greenland', 'GL', '299'),
(86, 'Grenada', 'GD', '1-473'),
(87, 'Guadeloupe', 'GP', '590'),
(88, 'Guam', 'GU', '1-671'),
(89, 'Guatemala', 'GT', '502'),
(90, 'Guinea', 'GN', '224'),
(91, 'Guinea-bissau', 'GW', '245'),
(92, 'Guyana', 'GY', '592'),
(93, 'Haiti', 'HT', '509'),
(94, 'Heard Island and McDonald Islands', 'HM', '011'),
(95, 'Honduras', 'HN', '504'),
(96, 'Hong Kong', 'HK', '852'),
(97, 'Hungary', 'HU', '36'),
(98, 'Iceland', 'IS', '354'),
(99, 'India', 'IN', '91'),
(100, 'Indonesia', 'ID', '62'),
(101, 'Iran (Islamic Republic of)', 'IR', '98'),
(102, 'Iraq', 'IQ', '964'),
(103, 'Ireland', 'IE', '353'),
(104, 'Israel', 'IL', '972'),
(105, 'Italy', 'IT', '39'),
(106, 'Jamaica', 'JM', '1-876'),
(107, 'Japan', 'JP', '81'),
(108, 'Jordan', 'JO', '962'),
(109, 'Kazakhstan', 'KZ', '7'),
(110, 'Kenya', 'KE', '254'),
(111, 'Kiribati', 'KI', '686'),
(112, 'Korea, Democratic People\'s Republic of', 'KP', '850'),
(113, 'South Korea', 'KR', '82'),
(114, 'Kuwait', 'KW', '965'),
(115, 'Kyrgyzstan', 'KG', '996'),
(116, 'Lao People\'s Democratic Republic', 'LA', '856'),
(117, 'Latvia', 'LV', '371'),
(118, 'Lebanon', 'LB', '961'),
(119, 'Lesotho', 'LS', '266'),
(120, 'Liberia', 'LR', '231'),
(121, 'Libya', 'LY', '218'),
(122, 'Liechtenstein', 'LI', '423'),
(123, 'Lithuania', 'LT', '370'),
(124, 'Luxembourg', 'LU', '352'),
(125, 'Macao', 'MO', '853'),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', '389'),
(127, 'Madagascar', 'MG', '261'),
(128, 'Malawi', 'MW', '265'),
(129, 'Malaysia', 'MY', '60'),
(130, 'Maldives', 'MV', '960'),
(131, 'Mali', 'ML', '223'),
(132, 'Malta', 'MT', '356'),
(133, 'Marshall Islands', 'MH', '692'),
(134, 'Martinique', 'MQ', '596'),
(135, 'Mauritania', 'MR', '222'),
(136, 'Mauritius', 'MU', '230'),
(137, 'Mayotte', 'YT', '262'),
(138, 'Mexico', 'MX', '52'),
(139, 'Micronesia, Federated States of', 'FM', '691'),
(140, 'Moldova', 'MD', '373'),
(141, 'Monaco', 'MC', '377'),
(142, 'Mongolia', 'MN', '976'),
(143, 'Montserrat', 'MS', '1-664'),
(144, 'Morocco', 'MA', '212'),
(145, 'Mozambique', 'MZ', '258'),
(146, 'Myanmar', 'MM', '95'),
(147, 'Namibia', 'NA', '264'),
(148, 'Nauru', 'NR', '674'),
(149, 'Nepal', 'NP', '977'),
(150, 'Netherlands', 'NL', '31'),
(151, 'Netherlands Antilles', 'AN', '599'),
(152, 'New Caledonia', 'NC', '687	'),
(153, 'New Zealand', 'NZ', '64'),
(154, 'Nicaragua', 'NI', '505'),
(155, 'Niger', 'NE', '227'),
(156, 'Nigeria', 'NG', '234'),
(157, 'Niue', 'NU', '683'),
(158, 'Norfolk Island', 'NF', '672'),
(159, 'Northern Mariana Islands', 'MP', '1-670'),
(160, 'Norway', 'NO', '47'),
(161, 'Oman', 'OM', '968'),
(162, 'Pakistan', 'PK', '92'),
(163, 'Palau', 'PW', '680'),
(164, 'Panama', 'PA', '507'),
(165, 'Papua New Guinea', 'PG', '675'),
(166, 'Paraguay', 'PY', '595'),
(167, 'Peru', 'PE', '51'),
(168, 'Philippines', 'PH', '63'),
(169, 'Pitcairn', 'PN', '64'),
(170, 'Poland', 'PL', '48'),
(171, 'Portugal', 'PT', '351'),
(172, 'Puerto Rico', 'PR', '1-787'),
(173, 'Qatar', 'QA', '974'),
(174, 'Reunion', 'RE', '262'),
(175, 'Romania', 'RO', '40'),
(176, 'Russian Federation', 'RU', '7'),
(177, 'Rwanda', 'RW', '250'),
(178, 'Saint Kitts and Nevis', 'KN', '1-869'),
(179, 'Saint Lucia', 'LC', '1-758'),
(180, 'Saint Vincent and the Grenadines', 'VC', '1-784'),
(181, 'Samoa', 'WS', '685'),
(182, 'San Marino', 'SM', '378'),
(183, 'Sao Tome and Principe', 'ST', '239'),
(184, 'Saudi Arabia', 'SA', '966'),
(185, 'Senegal', 'SN', '221'),
(186, 'Seychelles', 'SC', '248'),
(187, 'Sierra Leone', 'SL', '232'),
(188, 'Singapore', 'SG', '65'),
(189, 'Slovakia (Slovak Republic)', 'SK', '421'),
(190, 'Slovenia', 'SI', '386'),
(191, 'Solomon Islands', 'SB', '677'),
(192, 'Somalia', 'SO', '252'),
(193, 'South Africa', 'ZA', '27'),
(194, 'South Georgia and the South Sandwich Islands', 'GS', '500'),
(195, 'Spain', 'ES', '34'),
(196, 'Sri Lanka', 'LK', '94'),
(197, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', '290'),
(198, 'St. Pierre and Miquelon', 'PM', '508'),
(199, 'Sudan', 'SD', '249'),
(200, 'Suriname', 'SR', '597'),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', '47'),
(202, 'Swaziland', 'SZ', '268'),
(203, 'Sweden', 'SE', '46'),
(204, 'Switzerland', 'CH', '41'),
(205, 'Syrian Arab Republic', 'SY', '963'),
(206, 'Taiwan', 'TW', '886'),
(207, 'Tajikistan', 'TJ', '992'),
(208, 'Tanzania, United Republic of', 'TZ', '255'),
(209, 'Thailand', 'TH', '66'),
(210, 'Togo', 'TG', '228'),
(211, 'Tokelau', 'TK', '690'),
(212, 'Tonga', 'TO', '676'),
(213, 'Trinidad and Tobago', 'TT', '1-868'),
(214, 'Tunisia', 'TN', '216'),
(215, 'Turkey', 'TR', '90'),
(216, 'Turkmenistan', 'TM', '993'),
(217, 'Turks and Caicos Islands', 'TC', '1-649'),
(218, 'Tuvalu', 'TV', '688'),
(219, 'Uganda', 'UG', '256'),
(220, 'Ukraine', 'UA', '380'),
(221, 'United Arab Emirates', 'AE', '971'),
(222, 'United Kingdom', 'GB', '44'),
(223, 'United States', 'US', '1'),
(224, 'United States Minor Outlying Islands', 'UM', '246'),
(225, 'Uruguay', 'UY', '598'),
(226, 'Uzbekistan', 'UZ', '998'),
(227, 'Vanuatu', 'VU', '678'),
(228, 'Vatican City State (Holy See)', 'VA', '379'),
(229, 'Venezuela', 'VE', '58'),
(230, 'Vietnam', 'VN', '84'),
(231, 'Virgin Islands (British)', 'VG', '1-284'),
(232, 'Virgin Islands (U.S.)', 'VI', '1-340'),
(233, 'Wallis and Futuna Islands', 'WF', '681'),
(234, 'Western Sahara', 'EH', '212'),
(235, 'Yemen', 'YE', '967'),
(236, 'Serbia', 'RS', '381'),
(238, 'Zambia', 'ZM', '260'),
(239, 'Zimbabwe', 'ZW', '263'),
(240, 'Aaland Islands', 'AX', '358'),
(241, 'Palestine', 'PS', '970'),
(242, 'Montenegro', 'ME', '382'),
(243, 'Guernsey', 'GG', '44-1481'),
(244, 'Isle of Man', 'IM', '44-1624'),
(245, 'Jersey', 'JE', '44-1534'),
(247, 'Curaçao', 'CW', '599'),
(248, 'Ivory Coast', 'CI', '225'),
(249, 'Kosovo', 'XK', '383');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_events`
--

DROP TABLE IF EXISTS `tbl_events`;
CREATE TABLE `tbl_events` (
  `tbl_events_id` int(11) NOT NULL,
  `tbl_events_title` varchar(256) NOT NULL,
  `tbl_events_startdate` date NOT NULL,
  `tbl_events_enddate` date NOT NULL,
  `tbl_events_location_id` int(11) NOT NULL,
  `tbl_events_insertdate` datetime NOT NULL,
  `tbl_events_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group_appointment`
--

DROP TABLE IF EXISTS `tbl_group_appointment`;
CREATE TABLE `tbl_group_appointment` (
  `tbl_group_appointment_id` int(11) NOT NULL,
  `tbl_group_appointment_app_id` int(11) NOT NULL,
  `tbl_group_appointment_servicetype_id` int(11) NOT NULL,
  `tbl_group_appointment_service_id` varchar(100) NOT NULL,
  `tbl_group_appointment_name` varchar(100) NOT NULL,
  `tbl_group_appointment_gender` enum('M','F') NOT NULL,
  `tbl_group_appointment_date` date NOT NULL,
  `tbl_group_appointment_total_amount` float DEFAULT NULL,
  `tbl_group_appointment_starttime` time NOT NULL,
  `tbl_group_appointment_insertdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_group_appointment`
--

INSERT INTO `tbl_group_appointment` (`tbl_group_appointment_id`, `tbl_group_appointment_app_id`, `tbl_group_appointment_servicetype_id`, `tbl_group_appointment_service_id`, `tbl_group_appointment_name`, `tbl_group_appointment_gender`, `tbl_group_appointment_date`, `tbl_group_appointment_total_amount`, `tbl_group_appointment_starttime`, `tbl_group_appointment_insertdate`) VALUES
(1, 59, 0, '1,2,3', 'prachi', 'F', '2020-07-01', NULL, '11:00:00', '2020-07-03 11:46:01'),
(2, 59, 0, '1', 'pratik', 'M', '2020-07-01', NULL, '11:00:00', '2020-07-03 11:46:01'),
(3, 61, 0, '1,3', 'ayushi', 'F', '2020-07-01', NULL, '11:00:00', '2020-07-05 09:51:48'),
(4, 61, 0, '5', 'pratik', 'M', '2020-07-01', NULL, '11:00:00', '2020-07-05 09:51:48'),
(5, 64, 0, '12,13', 'ayushi', 'F', '2020-07-01', NULL, '11:00:00', '2020-07-07 08:36:35'),
(7, 64, 0, '145,132', 'demo', 'M', '2020-07-01', NULL, '11:00:00', '2020-07-07 08:36:35'),
(8, 69, 0, '73,74', 'pratik', 'M', '2020-07-18', NULL, '10:00:00', '2020-07-17 13:44:54'),
(9, 69, 0, '73,74', 'ayushi', 'F', '2020-07-18', NULL, '10:00:00', '2020-07-17 13:44:54'),
(19, 77, 1, '11,13', 'prachi', 'F', '2020-07-25', 25, '12:43:00', '2020-07-24 12:00:44'),
(20, 77, 5, '65,66', 'harsh', 'M', '2020-07-25', 47, '12:43:00', '2020-07-24 12:00:45'),
(21, 77, 8, '102', 'charmi', 'F', '2020-07-25', 25, '12:43:00', '2020-07-24 12:00:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_locations`
--

DROP TABLE IF EXISTS `tbl_locations`;
CREATE TABLE `tbl_locations` (
  `tbl_locations_id` int(11) NOT NULL,
  `tbl_locations_name` varchar(256) NOT NULL,
  `tbl_locations_contact_person` varchar(100) NOT NULL,
  `tbl_locations_number` varchar(20) NOT NULL,
  `tbl_locations_email` varchar(256) NOT NULL,
  `tbl_locations_full_address` text NOT NULL,
  `tbl_locations_start_time` time NOT NULL,
  `tbl_locations_end_time` time NOT NULL,
  `tbl_locations_status` enum('1','0') NOT NULL COMMENT '1-Active, 0-Inactive',
  `tbl_locations_insertdate` datetime NOT NULL,
  `tbl_locations_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_locations`
--

INSERT INTO `tbl_locations` (`tbl_locations_id`, `tbl_locations_name`, `tbl_locations_contact_person`, `tbl_locations_number`, `tbl_locations_email`, `tbl_locations_full_address`, `tbl_locations_start_time`, `tbl_locations_end_time`, `tbl_locations_status`, `tbl_locations_insertdate`, `tbl_locations_updatedate`) VALUES
(1, 'Slough', 'test', '', 'Adornhairandbeautyltd@gmail.com', 'This is full address as of now for test purpose onlyyyyy', '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00', '2020-06-23 07:37:50'),
(2, 'High Wycombe', '', '', 'Adornhairandbeautyltd@gmail.com', '', '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00', '2020-06-23 07:37:50'),
(3, 'Lakeside', '', '', 'adorn.beauty01@yahoo.com', '', '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00', '2020-06-23 07:37:50'),
(4, 'Watford (High Street)', '', '', 'Adornbeautyloyalty@gmail.com', '', '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00', '2020-06-23 07:37:50'),
(5, 'Aylesbury (Friars Square Centre)', '', '', 'Adornbeautyuxbridge@gmail.com', '', '10:00:00', '18:00:00', '0', '0000-00-00 00:00:00', '2020-06-23 07:37:50'),
(6, 'Aylesbury (Hale Leys Centre)', '', '', 'Adornbeautyloyalty@gmail.com', '', '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00', '2020-06-23 07:37:50'),
(7, 'Uxbridge', '', '', 'Adornbeautyuxbridge@gmail.com', '', '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00', '2020-06-23 07:37:50'),
(8, 'Watford (Harlequin Centre)', '', '', 'Adornbeautyloyalty@gmail.com', '', '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00', '2020-06-23 07:37:50'),
(9, 'Greenford', '', '', 'Adornhairandbeautyltd@gmail.com', '', '10:00:00', '18:00:00', '1', '0000-00-00 00:00:00', '2020-07-07 14:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
CREATE TABLE `tbl_roles` (
  `tbl_roles_id` int(11) NOT NULL,
  `tbl_roles_types` varchar(50) NOT NULL,
  `tbl_roles_insertdate` datetime NOT NULL,
  `tbl_roles_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`tbl_roles_id`, `tbl_roles_types`, `tbl_roles_insertdate`, `tbl_roles_updatedate`) VALUES
(1, 'Admin', '2020-06-26 03:52:39', '2020-06-25 22:22:39');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role_rights`
--

DROP TABLE IF EXISTS `tbl_role_rights`;
CREATE TABLE `tbl_role_rights` (
  `tbl_role_rights_id` int(11) NOT NULL,
  `tbl_role_rights_role_id` int(11) NOT NULL,
  `tbl_role_rights_page_name` varchar(100) NOT NULL,
  `tbl_role_rights_index` enum('0','1') NOT NULL,
  `tbl_role_rights_add` enum('0','1') NOT NULL,
  `tbl_role_rights_edit` enum('0','1') NOT NULL,
  `tbl_role_rights_delete` enum('0','1') NOT NULL,
  `tbl_role_rights_insertdate` datetime NOT NULL,
  `tbl_role_rights_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_role_rights`
--

INSERT INTO `tbl_role_rights` (`tbl_role_rights_id`, `tbl_role_rights_role_id`, `tbl_role_rights_page_name`, `tbl_role_rights_index`, `tbl_role_rights_add`, `tbl_role_rights_edit`, `tbl_role_rights_delete`, `tbl_role_rights_insertdate`, `tbl_role_rights_updatedate`) VALUES
(53, 1, 'AdminController', '1', '1', '1', '1', '2020-07-02 12:57:41', '2020-07-02 07:27:41'),
(54, 1, 'RoleRightsController', '0', '0', '0', '0', '2020-07-02 12:57:41', '2020-07-02 07:27:41'),
(55, 1, 'RoleController', '0', '1', '1', '1', '2020-07-02 12:57:41', '2020-07-02 07:27:41'),
(56, 1, 'ServiceTypesController', '1', '1', '1', '1', '2020-07-02 12:57:41', '2020-07-02 07:27:41'),
(57, 1, 'ServiceController', '1', '1', '1', '1', '2020-07-02 12:57:41', '2020-07-02 07:27:41'),
(58, 1, 'ServicePackageController', '1', '1', '1', '1', '2020-07-02 12:57:41', '2020-07-02 07:27:41'),
(59, 1, 'ClientController', '1', '1', '1', '1', '2020-07-02 12:57:41', '2020-07-02 07:27:41'),
(60, 1, 'StaffController', '1', '1', '1', '1', '2020-07-02 12:57:41', '2020-07-02 07:27:41'),
(61, 1, 'AppointmentController', '1', '1', '1', '1', '2020-07-02 12:57:41', '2020-07-02 07:27:41'),
(62, 1, 'LocationController', '0', '0', '0', '0', '2020-07-02 12:57:41', '2020-07-02 07:27:41'),
(63, 1, 'ConsultationFormController', '1', '1', '1', '1', '2020-07-02 12:57:41', '2020-07-02 07:27:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_services`
--

DROP TABLE IF EXISTS `tbl_services`;
CREATE TABLE `tbl_services` (
  `tbl_services_id` int(11) NOT NULL,
  `tbl_services_user_id` int(11) NOT NULL,
  `tbl_services_name` varchar(100) NOT NULL,
  `tbl_services_type` int(11) NOT NULL,
  `tbl_services_image` varchar(256) NOT NULL,
  `tbl_services_for` enum('M','F','O') NOT NULL,
  `tbl_services_description` text NOT NULL,
  `tbl_services_enable_online` enum('1','0') NOT NULL COMMENT '1-yes, 0-no',
  `tbl_services_commission` float NOT NULL,
  `tbl_services_status` enum('1','0') NOT NULL COMMENT '1-expired, 0-not_expired',
  `tbl_services_retail_price` float NOT NULL,
  `tbl_services_special_price` float NOT NULL,
  `tbl_services_tax` int(11) NOT NULL,
  `tbl_services_duration_time` varchar(256) NOT NULL,
  `tbl_services_location_id` int(11) NOT NULL,
  `tbl_services_insertdate` datetime NOT NULL,
  `tbl_services_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_services`
--

INSERT INTO `tbl_services` (`tbl_services_id`, `tbl_services_user_id`, `tbl_services_name`, `tbl_services_type`, `tbl_services_image`, `tbl_services_for`, `tbl_services_description`, `tbl_services_enable_online`, `tbl_services_commission`, `tbl_services_status`, `tbl_services_retail_price`, `tbl_services_special_price`, `tbl_services_tax`, `tbl_services_duration_time`, `tbl_services_location_id`, `tbl_services_insertdate`, `tbl_services_updatedate`) VALUES
(1, 1, 'Eyebrows Shaping (Threading)', 1, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '5', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 'Middle of the Brows (Threading)', 1, '', '', 'Threading', '1', 0, '0', 2, 0, 0, '3', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 'Upper Lips (Threading)', 1, '', 'F', 'Threading', '1', 0, '0', 2.5, 0, 0, '4', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 'Lower Lips (Threading)', 1, '', 'F', 'Threading', '1', 0, '0', 2, 0, 0, '4', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 'Chin Only (Threading)', 1, '', 'F', 'Threading', '1', 0, '0', 4, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 1, 'Chin Extended to Neck (Threading)', 1, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, 'Jaw Line (Threading)', 1, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1, 'Sides (Threading)', 1, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1, 'Cheeks (Threading)', 1, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '8', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1, 'Forehead (Threading)', 1, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, 'Neck (Threading)', 1, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 1, 'Full Face (Threading)', 1, '', 'F', 'Threading', '1', 0, '0', 16, 0, 0, '20', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 1, 'Full Face & Neck (Threading)', 1, '', 'F', 'Threading', '1', 0, '0', 20, 0, 0, '25', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 1, 'Eyebrows Tint', 2, '', '', 'Tinting', '1', 0, '0', 7, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 1, 'Eyelash Tint', 2, '', '', 'Tinting', '1', 0, '0', 12, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 1, 'Eyebrows & Eyelashed Tint', 2, '', '', 'Tinting', '1', 0, '0', 15, 0, 0, '15', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 1, 'Full Set Cluster Lashes', 3, '', 'F', 'Lashes', '0', 0, '0', 30, 0, 0, '45', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 1, 'Extend individual Lashes Full Set', 3, '', 'F', 'Lashes', '0', 0, '0', 75, 0, 0, '60', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 1, 'Extend individual Lashes Half Set', 3, '', 'F', 'Lashes', '0', 0, '0', 60, 0, 0, '40', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 1, 'Lash Removal', 3, '', 'F', 'Lashes', '1', 0, '0', 12, 0, 0, '25', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 1, 'LVL (Eyelash Lift)', 3, '', 'F', 'Lashes', '0', 0, '0', 50, 0, 0, '45', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 1, 'High Definition Brows Full Treatment', 4, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 1, 'High Definition Tint Only', 4, '', '', 'BROWS', '0', 0, '0', 15, 0, 0, '15', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 1, 'High Definition Lash Tint', 4, '', '', 'BROWS', '0', 0, '0', 20, 0, 0, '15', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 1, 'Henna Brows', 4, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 1, 'Eyebrows Shaping (Strip Wax)', 5, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '5', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 1, 'Middle of the Brows (Strip Wax)', 5, '', '', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '3', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 1, 'Upper Lips (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '4', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 1, 'Lower Lips (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '1', 0, '0', 2.5, 0, 0, '4', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 1, 'Chin Only (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '1', 0, '0', 5, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 1, 'Chin Extended to Neck (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7.5, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 1, 'Jaw Line (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6.5, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 1, 'Sides (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 1, 'Cheeks (Strip Wax)', 5, '', '', 'Regular Strip Wax', '1', 0, '0', 5, 0, 0, '8', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 1, 'Forehead (Strip Wax)', 5, '', '', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 1, 'Neck (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 1, 'Full Face (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '1', 0, '0', 18, 0, 0, '20', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 1, 'Full Face & Neck  (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '1', 0, '0', 22, 0, 0, '25', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 1, 'Nose (Inside Only)  (Strip Wax)', 5, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 1, 'Nose (Top Only) (Strip Wax)', 5, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '5', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 1, 'Ear Strip Wax (No Inside) (Strip Wax)', 5, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '8', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 1, 'Knuckles (Strip Wax)', 5, '', '', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '6', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 1, 'Hand (Strip Wax)', 5, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '6', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 1, 'Back of The Neck (Strip Wax)', 5, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '8', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 1, 'Full Arms (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12.5, 0, 0, '20', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 1, 'Half Arms (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 8, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 1, '3/4 Arms (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 10, 0, 0, '15', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 1, 'Chest Wax (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 1, 'Under Arms or Bikini Line (Thigh not included) (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '1', 0, '0', 5, 0, 0, '8', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 1, 'Full Legs (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '25', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 1, 'Top Half Legs (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 14.5, 0, 0, '22', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 1, 'Bottom Half Legs (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12.5, 0, 0, '15', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 1, '3/4 Legs (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '20', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 1, 'Deep Bikini Line (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 10, 0, 0, '15', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 1, 'Brazilian (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '20', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 1, 'Hollywood (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '25', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 1, 'Buttocks (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 1, 'Perianal Only (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 5, 0, 0, '8', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 1, 'Full Stomach OR Full Back (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 18, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 1, 'Half Stomach OR Half Back (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '20', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 1, 'Full Stomach AND Full Back (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 33, 0, 0, '45', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 1, 'Full Waxing (Not Breakable) (Includes F/Arms, F/Legs, U/Arms, B/Line) (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 40, 0, 0, '35', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 1, 'Full Body Waxing (Not Breakable) (F/Arms, F/Legs, U/Arms, B/Line, F/Stomach & F/Back) (Strip Wax)', 5, '', 'F', 'Regular Strip Wax', '0', 0, '0', 65, 0, 0, '65', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 1, 'Full Back (Strip Wax)', 5, '', 'M', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 1, '1/4 Back (Strip Wax)', 5, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '15', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 1, 'Chest Wax (Strip Wax)', 5, '', 'M', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '25', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 1, 'Stomach (Strip Wax)', 5, '', 'M', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '15', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 1, 'Shoulders (Strip Wax)', 5, '', 'M', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 1, 'Shoulders + Neck (Strip Wax)', 5, '', 'M', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '15', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 1, 'Top 1/4 Arms (Strip Wax)', 5, '', 'M', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '20', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 1, 'Full Back + Chest (Strip Wax)', 5, '', 'M', 'Regular Strip Wax', '0', 0, '0', 55, 0, 0, '55', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 1, 'Full Arms (Strip Wax)', 5, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 1, 'Eyebrows Shaping  (Hot Wax)', 6, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 1, 'Upper Lips  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '5', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 1, 'Lower Lips  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 7, 0, 0, '5', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 1, 'Chin Only  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 1, 'Chin Extended to Neck  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 1, 'Sides  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 1, 'Cheeks  (Hot Wax)', 6, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '5', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 1, 'Back of the Neck  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 1, 'Jawline  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '5', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 1, 'Nose (Inside Only)  (Hot Wax)', 6, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 1, 'Ear (Out Side Only)  (Hot Wax)', 6, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 1, 'Nose (Top Only)  (Hot Wax)', 6, '', '', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '6', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 1, 'Forehead  (Hot Wax)', 6, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '8', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 1, 'Full Face (Icludes Eyebrows Threading)  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 32, 0, 0, '25', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 1, 'Full Face & Neck (Including Eyebrows Threading)  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 42, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 1, 'Under Arms  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 15, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 1, 'Bikini Line (Thigh Not Included)  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 12, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 1, 'Deep Bikini Line  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '15', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 1, 'Brazillian  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 30, 0, 0, '20', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 1, 'Hollywood  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 40, 0, 0, '25', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 1, 'Buttocks  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '20', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 1, 'Perianal Only  (Hot Wax)', 6, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 10, 0, 0, '10', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 1, 'Mini Manicure (extra ?5 for french tips)', 7, '', '', 'Manicure/Pedicure', '1', 0, '0', 10, 0, 0, '20', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 1, 'Mini Pedicure(extra ?5 for french tips)', 7, '', '', 'Manicure/Pedicure', '1', 0, '0', 10, 0, 0, '20', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 1, 'Spa Manicure(extra ?5 for french tips)', 7, '', '', 'Manicure/Pedicure', '0', 0, '0', 20, 0, 0, '35', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 1, 'Spa Manicure with Mud/Paraffin Mask(extra ?5 for french tips)', 7, '', '', 'Manicure/Pedicure', '0', 0, '0', 28, 0, 0, '35', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 1, 'Spa Pedicure(extra ?5 for french tips)', 7, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '35', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 1, 'Spa Pedicure with Mud/Paraffin Mask(extra ?5 for french tips)', 7, '', '', 'Manicure/Pedicure', '0', 0, '0', 32, 0, 0, '35', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 1, 'New-Callus Peel Treatment', 7, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '25', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 1, 'Shellac/OPI Polsih (Includes File & Buff)(extra ?5 for french tips)', 8, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 25, 0, 0, '40', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 1, 'Shellac/OPI French Polish (Includes Files & Buff)(extra ?5 for french tips)', 8, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 30, 0, 0, '40', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 1, 'Shellac/OPI with Spa Pedicure (?5 Extra for French Polish)', 8, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 45, 0, 0, '40', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 1, 'Shellac/OPI with Spa Manicure (?5 Extra for French Polish)', 8, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 40, 0, 0, '40', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 1, 'Shellac/OPI Removal and Re-application (?5 extra for French Polish)', 8, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 32, 0, 0, '40', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 1, 'Shellac/OPI Removal Only', 8, '', 'F', 'Shellac/OPI Gel Polish', '1', 0, '0', 10, 0, 0, '20', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 1, 'Swedish Body Massage', 9, '', '', 'Massages', '0', 0, '0', 50, 0, 0, '60', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 1, 'Full Body Massage with Aroma Therapu', 9, '', '', 'Massages', '0', 0, '0', 55, 0, 0, '60', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 1, 'Back Massage with Aroma Therapy', 9, '', '', 'Massages', '0', 0, '0', 35, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 1, 'Indian Head, Neck and Shoulder Massage', 9, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 1, 'Leg or Arm Massage', 9, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 1, 'Full Body Mineral Salt Scrub Therapy', 10, '', '', 'Body Therapies', '0', 0, '0', 35, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 1, 'Back Cleanse Treatment', 10, '', '', 'Body Therapies', '0', 0, '0', 30, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 1, 'Adorn Skin Whitening', 11, '', '', 'Classic Facials', '0', 0, '0', 40, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 1, 'Skin Hydrating Collagen Facial Treatment', 11, '', '', 'Classic Facials', '0', 0, '0', 40, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 1, 'Skin Refining & Re-Balancing Facial Treatment', 11, '', '', 'Classic Facials', '0', 0, '0', 40, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 1, 'Vital Eye Treatment', 11, '', '', 'Classic Facials', '0', 0, '0', 22, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 1, 'Deep Cleansing Facial', 11, '', '', 'Classic Facials', '0', 0, '0', 30, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 1, 'Dermalogica Express Facial', 12, '', '', 'Dermalogica Treatments', '0', 0, '0', 35, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 1, 'Dermalogica Prescreptive Facial', 12, '', '', 'Dermalogica Treatments', '0', 0, '0', 55, 0, 0, '60', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 1, 'Dermalogica Teenage Facial', 12, '', '', 'Dermalogica Treatments', '0', 0, '0', 35, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 1, 'Dermalogica Men\'s Facial', 12, '', '', 'Dermalogica Treatments', '0', 0, '0', 50, 0, 0, '60', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 1, 'Dermalogica Pro Power Peel Treatment 30 minutes', 12, '', '', 'Dermalogica Treatments', '0', 0, '0', 70, 0, 0, '30', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 1, 'Dermalogica Pro Power Peel Treatment 60 minutes', 12, '', '', 'Dermalogica Treatments', '0', 0, '0', 120, 0, 0, '60', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 1, 'Diamond Peel Dermabrasion with Dermalogica Facial', 13, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 80, 0, 0, '60', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 1, 'Diamond Peel Dermabrasion with Steam & Extraction', 13, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 65, 0, 0, '60', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 1, 'Oxygen Therapy & Diamond Peel Dermabrasion', 13, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 90, 0, 0, '60', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 1, 'Oxygen Therapy', 13, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 55, 0, 0, '40', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 1, 'Oxygen Therapy with Ultrasonic Peel', 13, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 85, 0, 0, '60', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 1, 'Eyebrows Shaping (Threading)', 14, '', '', 'Threading', '1', 0, '0', 6, 0, 0, '5', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 1, 'Middle of the Brows (Threading)', 14, '', '', 'Threading', '1', 0, '0', 2, 0, 0, '3', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 1, 'Upper Lips (Threading)', 14, '', 'F', 'Threading', '1', 0, '0', 3.5, 0, 0, '4', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 1, 'Lower Lips (Threading)', 14, '', 'F', 'Threading', '1', 0, '0', 2.5, 0, 0, '4', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 1, 'Chin Only (Threading)', 14, '', 'F', 'Threading', '1', 0, '0', 4.5, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 1, 'Chin Extended to Neck (Threading)', 14, '', 'F', 'Threading', '1', 0, '0', 5.5, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 1, 'Jaw Line (Threading)', 14, '', 'F', 'Threading', '1', 0, '0', 5.5, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 1, 'Sides (Threading)', 14, '', 'F', 'Threading', '1', 0, '0', 6, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 1, 'Cheeks (Threading)', 14, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '8', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 1, 'Forehead (Threading)', 14, '', '', 'Threading', '1', 0, '0', 5, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 1, 'Neck (Threading)', 14, '', 'F', 'Threading', '1', 0, '0', 6.5, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 1, 'Full Face (Threading)', 14, '', 'F', 'Threading', '1', 0, '0', 19, 0, 0, '20', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 1, 'Full Face & Neck (Threading)', 14, '', 'F', 'Threading', '1', 0, '0', 23, 0, 0, '25', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 1, 'Eyebrows Tint', 15, '', '', 'Tinting', '1', 0, '0', 7, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 1, 'Eyelash Tint', 15, '', '', 'Tinting', '1', 0, '0', 12, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 1, 'Eyebrows & Eyelashed Tint', 15, '', '', 'Tinting', '1', 0, '0', 15, 0, 0, '15', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 1, 'Full Set Cluster Lashes', 16, '', 'F', 'Lashes', '0', 0, '0', 30, 0, 0, '45', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 1, 'Extend individual Lashes Full Set', 16, '', 'F', 'Lashes', '0', 0, '0', 75, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 1, 'Extend individual Lashes Half Set', 16, '', 'F', 'Lashes', '0', 0, '0', 60, 0, 0, '40', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 1, 'Lash Removal', 16, '', 'F', 'Lashes', '1', 0, '0', 10, 0, 0, '25', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 1, 'LVL (Eyelash Lift)', 16, '', 'F', 'Lashes', '0', 0, '0', 50, 0, 0, '45', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 1, 'High Definition Brows Full Treatment', 17, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 1, 'High Definition Tint Only', 17, '', '', 'BROWS', '0', 0, '0', 15, 0, 0, '15', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 1, 'High Definition Lash Tint', 17, '', '', 'BROWS', '0', 0, '0', 20, 0, 0, '15', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 1, 'Henna Brows', 17, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 1, 'Eyebrows Shaping (Strip Wax)', 18, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '5', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 1, 'Middle of the Brows (Strip Wax)', 18, '', '', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '3', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 1, 'Upper Lips (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '4', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 1, 'Lower Lips (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '4', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 1, 'Chin Only (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '1', 0, '0', 5.5, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 1, 'Chin Extended to Neck (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 1, 'Jaw Line (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 1, 'Sides (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 1, 'Cheeks (Strip Wax)', 18, '', '', 'Regular Strip Wax', '1', 0, '0', 5.5, 0, 0, '8', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 1, 'Forehead (Strip Wax)', 18, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 1, 'Neck (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 1, 'Full Face (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '1', 0, '0', 24, 0, 0, '20', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 1, 'Full Face & Neck  (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '1', 0, '0', 28, 0, 0, '25', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 1, 'Nose (Inside Only)  (Strip Wax)', 18, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 1, 'Nose (Top Only) (Strip Wax)', 18, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '5', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 1, 'Ear Strip Wax (No Inside) (Strip Wax)', 18, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '8', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 1, 'Knuckles (Strip Wax)', 18, '', '', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '6', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 1, 'Hand (Strip Wax)', 18, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '6', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 1, 'Back of The Neck (Strip Wax)', 18, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '8', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 1, 'Full Arms (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '20', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 1, 'Half Arms (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 1, '3/4 Arms (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 14.5, 0, 0, '15', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 1, 'Chest Wax (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 1, 'Under Arms or Bikini Line (Thigh not included) (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '8', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 1, 'Full Legs (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '25', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 1, 'Top Half Legs (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16.5, 0, 0, '22', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 1, 'Bottom Half Legs (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 14.5, 0, 0, '15', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 1, '3/4 Legs (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '20', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 1, 'Deep Bikini Line (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 1, 'Brazilian (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 18, 0, 0, '20', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 1, 'Hollywood (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 1, 'Buttocks (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 1, 'Perianal Only (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 5, 0, 0, '8', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 1, 'Full Stomach OR Full Back (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 1, 'Half Stomach OR Half Back (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '20', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 1, 'Full Stomach AND Full Back (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 35, 0, 0, '45', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 1, 'Full Waxing (Not Breakable) (Includes F/Arms, F/Legs, U/Arms, B/Line) (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 45, 0, 0, '35', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 1, 'Full Body Waxing (Not Breakable) (F/Arms, F/Legs, U/Arms, B/Line, F/Stomach & F/Back) (Strip Wax)', 18, '', 'F', 'Regular Strip Wax', '0', 0, '0', 70, 0, 0, '65', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 1, 'Full Back (Strip Wax)', 18, '', 'M', 'Regular Strip Wax', '0', 0, '0', 40, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 1, '1/4 Back (Strip Wax)', 18, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '15', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 1, 'Chest Wax (Strip Wax)', 18, '', 'M', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '25', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 1, 'Stomach (Strip Wax)', 18, '', 'M', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '15', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 1, 'Shoulders (Strip Wax)', 18, '', 'M', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 1, 'Shoulders + Neck (Strip Wax)', 18, '', 'M', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '15', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 1, 'Top 1/4 Arms (Strip Wax)', 18, '', 'M', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '20', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 1, 'Full Back + Chest (Strip Wax)', 18, '', 'M', 'Regular Strip Wax', '0', 0, '0', 55, 0, 0, '55', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 1, 'Full Arms (Strip Wax)', 18, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 1, 'Eyebrows Shaping  (Hot Wax)', 19, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 1, 'Upper Lips  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '5', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 1, 'Lower Lips  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 7, 0, 0, '5', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 1, 'Chin Only  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 1, 'Chin Extended to Neck  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 1, 'Sides  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 1, 'Cheeks  (Hot Wax)', 19, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '5', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 1, 'Back of the Neck  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 1, 'Jawline  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '5', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 1, 'Nose (Inside Only)  (Hot Wax)', 19, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 1, 'Ear (Out Side Only)  (Hot Wax)', 19, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 1, 'Nose (Top Only)  (Hot Wax)', 19, '', '', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '6', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 1, 'Forehead  (Hot Wax)', 19, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '8', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 1, 'Full Face (Icludes Eyebrows Threading)  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 32, 0, 0, '25', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 1, 'Full Face & Neck (Including Eyebrows Threading)  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 42, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 1, 'Under Arms  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 15, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 1, 'Bikini Line (Thigh Not Included)  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 12, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 1, 'Deep Bikini Line  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '15', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 1, 'Brazillian  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 30, 0, 0, '20', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 1, 'Hollywood  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 40, 0, 0, '25', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 1, 'Buttocks  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '20', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 1, 'Perianal Only  (Hot Wax)', 19, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 10, 0, 0, '10', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 1, 'Mini Manicure (extra ?5 for french tips)', 20, '', '', 'Manicure/Pedicure', '1', 0, '0', 10, 0, 0, '20', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 1, 'Mini Pedicure(extra ?5 for french tips)', 20, '', '', 'Manicure/Pedicure', '1', 0, '0', 10, 0, 0, '20', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 1, 'Spa Manicure(extra ?5 for french tips)', 20, '', '', 'Manicure/Pedicure', '0', 0, '0', 20, 0, 0, '35', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 1, 'Spa Manicure with Mud/Paraffin Mask(extra ?5 for french tips)', 20, '', '', 'Manicure/Pedicure', '0', 0, '0', 28, 0, 0, '35', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 1, 'Spa Pedicure(extra ?5 for french tips)', 20, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '35', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 1, 'Spa Pedicure with Mud/Paraffin Mask(extra ?5 for french tips)', 20, '', '', 'Manicure/Pedicure', '0', 0, '0', 32, 0, 0, '35', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 1, 'New-Callus Peel Treatment', 20, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '25', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 1, 'Shellac/OPI Polsih (Includes File & Buff)(extra ?5 for french tips)', 21, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 25, 0, 0, '40', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 1, 'Shellac/OPI French Polish (Includes Files & Buff)(extra ?5 for french tips)', 21, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 30, 0, 0, '40', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 1, 'Shellac/OPI with Spa Pedicure (?5 Extra for French Polish)', 21, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 45, 0, 0, '40', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 1, 'Shellac/OPI with Spa Manicure (?5 Extra for French Polish)', 21, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 40, 0, 0, '40', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 1, 'Shellac/OPI Removal and Re-application (?5 extra for French Polish)', 21, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 32, 0, 0, '40', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 1, 'Shellac/OPI Removal Only', 21, '', 'F', 'Shellac/OPI Gel Polish', '1', 0, '0', 10, 0, 0, '20', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 1, 'Swedish Body Massage', 22, '', '', 'Massages', '0', 0, '0', 50, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 1, 'Full Body Massage with Aroma Therapu', 22, '', '', 'Massages', '0', 0, '0', 55, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 1, 'Back Massage with Aroma Therapy', 22, '', '', 'Massages', '0', 0, '0', 35, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 1, 'Indian Head, Neck and Shoulder Massage', 22, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 1, 'Leg or Arm Massage', 22, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 1, 'Full Body Mineral Salt Scrub Therapy', 23, '', '', 'Body Therapies', '0', 0, '0', 40, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 1, 'Back Cleanse Treatment', 23, '', '', 'Body Therapies', '0', 0, '0', 35, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 1, 'Elemis Pro-Collagen Age Defy', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 99, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 1, 'Elemis Pro-Collagen Definition Lift and Contour', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 99, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 1, 'Elemis Dynamic Resurfacing Precision Peel', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 99, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 1, 'Elemis Peptide 24/7 Skin Sync', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 90, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 1, 'Elemis Superfood Pro-Radiance', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 95, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 1, 'Elemis Sensitive Skin Soother', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 80, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 1, 'Elemis Anti-Blemish Mattify and Calm', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 80, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 1, 'Elemis Biotec Line Eraser', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 1, 'Elmis Biotec 24/7 Sync', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 1, 'Elemis Biotex Firm-A-Lift', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 1, 'Elemis Biotex Anti-Pigment Brightener', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 1, 'Elemis Biotec Skin Resurfacer', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 1, 'Elemis Biotec Radiance Renew', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 1, 'Elemis Biotec Blemish Control', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 1, 'Elemis Biotec Sensitive Skin Soother', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 1, 'Elem is Biotec Super-Charger For Men', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 1, 'Elemis Biotec Eye Treatment', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 1, 'Elemis Biotec Neck Treatment', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 1, 'Elemis Couture Technology', 24, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 1, 'Pro Skin 30', 25, '', '', 'Dermalogica Treatments', '0', 0, '0', 35, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 1, 'Pro Skin 60', 25, '', '', 'Dermalogica Treatments', '0', 0, '0', 65, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 1, 'Pro Power Peel 30', 25, '', '', 'Dermalogica Treatments', '0', 0, '0', 70, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 1, 'Pro Power Peel 60', 25, '', '', 'Dermalogica Treatments', '0', 0, '0', 120, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 1, '3D Hydro2 30 Min Express Treatment', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 45, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 1, '3D Hydro2 60 Min Express Treatment', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 99, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 1, '3D Hydro2 90 Min Express Treatment', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 130, 0, 0, '90', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 1, 'The Frozen Facial', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 100, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 1, 'H20 Glow', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 95, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 1, 'COMCIT Elite', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 1, 'Crystal Clear Microdermabrasion Only', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 55, 0, 0, '40', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 1, 'Deluxe MDA Facial with Mini Lift Mask', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 65, 0, 0, '50', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 1, 'Deluxe MDA Facial with Mini Lift Mask, Steam and Extraction', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 75, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 1, 'Deluxe MDA Facial with OXYGEN INFUSION', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 90, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 1, 'Back', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 60, 0, 0, '45', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 1, 'Half Back', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 40, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 1, 'Half Legs', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 40, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 1, 'Half Arms', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 40, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 1, 'Hands', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 40, 0, 0, '30', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 1, 'Crystal Clear Micro Dermabrasion + Dermalogica Facial', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 90, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 1, 'Cystal Clear Micro Dermabrasion with Elemis Facial', 26, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 110, 0, 0, '60', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 1, 'Eyebrows Shaping (Threading)', 27, '', '', 'Threading', '1', 0, '0', 6, 0, 0, '5', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 1, 'Middle of the Brows (Threading)', 27, '', '', 'Threading', '1', 0, '0', 2, 0, 0, '3', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 1, 'Upper Lips (Threading)', 27, '', 'F', 'Threading', '1', 0, '0', 3.5, 0, 0, '4', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 1, 'Lower Lips (Threading)', 27, '', 'F', 'Threading', '1', 0, '0', 2.5, 0, 0, '4', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 1, 'Chin Only (Threading)', 27, '', 'F', 'Threading', '1', 0, '0', 4.5, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 1, 'Chin Extended to Neck (Threading)', 27, '', 'F', 'Threading', '1', 0, '0', 5.5, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 1, 'Jaw Line (Threading)', 27, '', 'F', 'Threading', '1', 0, '0', 5.5, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 1, 'Sides (Threading)', 27, '', 'F', 'Threading', '1', 0, '0', 6, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 1, 'Cheeks (Threading)', 27, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '8', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 1, 'Forehead (Threading)', 27, '', '', 'Threading', '1', 0, '0', 5, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 1, 'Neck (Threading)', 27, '', 'F', 'Threading', '1', 0, '0', 6.5, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 1, 'Full Face (Threading)', 27, '', 'F', 'Threading', '1', 0, '0', 19, 0, 0, '20', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 1, 'Full Face & Neck (Threading)', 27, '', 'F', 'Threading', '1', 0, '0', 23, 0, 0, '25', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 1, 'Eyebrows Tint', 28, '', '', 'Tinting', '1', 0, '0', 7, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 1, 'Eyelash Tint', 28, '', '', 'Tinting', '1', 0, '0', 12, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 1, 'Eyebrows & Eyelashed Tint', 28, '', '', 'Tinting', '1', 0, '0', 15, 0, 0, '15', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 1, 'Full Set Cluster Lashes', 29, '', 'F', 'Lashes', '0', 0, '0', 30, 0, 0, '45', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 1, 'Extend individual Lashes Full Set', 29, '', 'F', 'Lashes', '0', 0, '0', 75, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 1, 'Extend individual Lashes Half Set', 29, '', 'F', 'Lashes', '0', 0, '0', 60, 0, 0, '40', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 1, 'Lash Removal', 29, '', 'F', 'Lashes', '1', 0, '0', 10, 0, 0, '25', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 1, 'LVL (Eyelash Lift)', 29, '', 'F', 'Lashes', '0', 0, '0', 50, 0, 0, '45', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 1, 'High Definition Brows Full Treatment', 30, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 1, 'High Definition Tint Only', 30, '', '', 'BROWS', '0', 0, '0', 15, 0, 0, '15', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 1, 'High Definition Lash Tint', 30, '', '', 'BROWS', '0', 0, '0', 20, 0, 0, '15', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 1, 'Henna Brows', 30, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 1, 'Eyebrows Shaping (Strip Wax)', 31, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '5', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 1, 'Middle of the Brows (Strip Wax)', 31, '', '', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '3', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 1, 'Upper Lips (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '4', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 1, 'Lower Lips (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '4', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 1, 'Chin Only (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '1', 0, '0', 5.5, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 1, 'Chin Extended to Neck (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 1, 'Jaw Line (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 1, 'Sides (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 1, 'Cheeks (Strip Wax)', 31, '', '', 'Regular Strip Wax', '1', 0, '0', 5.5, 0, 0, '8', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 1, 'Forehead (Strip Wax)', 31, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 1, 'Neck (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 1, 'Full Face (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '1', 0, '0', 24, 0, 0, '20', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 1, 'Full Face & Neck  (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '1', 0, '0', 28, 0, 0, '25', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 1, 'Nose (Inside Only)  (Strip Wax)', 31, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 1, 'Nose (Top Only) (Strip Wax)', 31, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '5', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 1, 'Ear Strip Wax (No Inside) (Strip Wax)', 31, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '8', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 1, 'Knuckles (Strip Wax)', 31, '', '', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '6', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 1, 'Hand (Strip Wax)', 31, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '6', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 1, 'Back of The Neck (Strip Wax)', 31, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '8', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 1, 'Full Arms (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '20', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 1, 'Half Arms (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 1, '3/4 Arms (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 14.5, 0, 0, '15', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 1, 'Chest Wax (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_services` (`tbl_services_id`, `tbl_services_user_id`, `tbl_services_name`, `tbl_services_type`, `tbl_services_image`, `tbl_services_for`, `tbl_services_description`, `tbl_services_enable_online`, `tbl_services_commission`, `tbl_services_status`, `tbl_services_retail_price`, `tbl_services_special_price`, `tbl_services_tax`, `tbl_services_duration_time`, `tbl_services_location_id`, `tbl_services_insertdate`, `tbl_services_updatedate`) VALUES
(333, 1, 'Under Arms or Bikini Line (Thigh not included) (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '8', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 1, 'Full Legs (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '25', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 1, 'Top Half Legs (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16.5, 0, 0, '22', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 1, 'Bottom Half Legs (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 14.5, 0, 0, '15', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 1, '3/4 Legs (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '20', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 1, 'Deep Bikini Line (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 1, 'Brazilian (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 18, 0, 0, '20', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 1, 'Hollywood (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 1, 'Buttocks (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 1, 'Perianal Only (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 5, 0, 0, '8', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 1, 'Full Stomach OR Full Back (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 1, 'Half Stomach OR Half Back (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '20', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 1, 'Full Stomach AND Full Back (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 35, 0, 0, '45', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 1, 'Full Waxing (Not Breakable) (Includes F/Arms, F/Legs, U/Arms, B/Line) (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 45, 0, 0, '35', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 1, 'Full Body Waxing (Not Breakable) (F/Arms, F/Legs, U/Arms, B/Line, F/Stomach & F/Back) (Strip Wax)', 31, '', 'F', 'Regular Strip Wax', '0', 0, '0', 70, 0, 0, '65', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 1, 'Full Back (Strip Wax)', 31, '', 'M', 'Regular Strip Wax', '0', 0, '0', 40, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 1, '1/4 Back (Strip Wax)', 31, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '15', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 1, 'Chest Wax (Strip Wax)', 31, '', 'M', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '25', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 1, 'Stomach (Strip Wax)', 31, '', 'M', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '15', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 1, 'Shoulders (Strip Wax)', 31, '', 'M', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 1, 'Shoulders + Neck (Strip Wax)', 31, '', 'M', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '15', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 1, 'Top 1/4 Arms (Strip Wax)', 31, '', 'M', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '20', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 1, 'Full Back + Chest (Strip Wax)', 31, '', 'M', 'Regular Strip Wax', '0', 0, '0', 55, 0, 0, '55', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 1, 'Full Arms (Strip Wax)', 31, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 1, 'Eyebrows Shaping  (Hot Wax)', 32, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 1, 'Upper Lips  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '5', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 1, 'Lower Lips  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 7, 0, 0, '5', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 1, 'Chin Only  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, 1, 'Chin Extended to Neck  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 1, 'Sides  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 1, 'Cheeks  (Hot Wax)', 32, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '5', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 1, 'Back of the Neck  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, 1, 'Jawline  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '5', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, 1, 'Nose (Inside Only)  (Hot Wax)', 32, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, 1, 'Ear (Out Side Only)  (Hot Wax)', 32, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 1, 'Nose (Top Only)  (Hot Wax)', 32, '', '', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '6', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 1, 'Forehead  (Hot Wax)', 32, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '8', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, 1, 'Full Face (Icludes Eyebrows Threading)  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 32, 0, 0, '25', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, 1, 'Full Face & Neck (Including Eyebrows Threading)  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 42, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, 1, 'Under Arms  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 15, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 1, 'Bikini Line (Thigh Not Included)  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 12, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 1, 'Deep Bikini Line  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '15', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 1, 'Brazillian  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 30, 0, 0, '20', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 1, 'Hollywood  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 40, 0, 0, '25', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 1, 'Buttocks  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '20', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 1, 'Perianal Only  (Hot Wax)', 32, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 10, 0, 0, '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, 1, 'Mini Manicure (extra ?5 for french tips)', 33, '', '', 'Manicure/Pedicure', '1', 0, '0', 10, 0, 0, '20', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, 1, 'Mini Pedicure(extra ?5 for french tips)', 33, '', '', 'Manicure/Pedicure', '1', 0, '0', 10, 0, 0, '20', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, 1, 'Spa Manicure(extra ?5 for french tips)', 33, '', '', 'Manicure/Pedicure', '0', 0, '0', 20, 0, 0, '35', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, 1, 'Spa Manicure with Mud/Paraffin Mask(extra ?5 for french tips)', 33, '', '', 'Manicure/Pedicure', '0', 0, '0', 28, 0, 0, '35', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, 1, 'Spa Pedicure(extra ?5 for french tips)', 33, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '35', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, 1, 'Spa Pedicure with Mud/Paraffin Mask(extra ?5 for french tips)', 33, '', '', 'Manicure/Pedicure', '0', 0, '0', 32, 0, 0, '35', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 1, 'New-Callus Peel Treatment', 33, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '25', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, 1, 'Shellac/OPI Polsih (Includes File & Buff)(extra ?5 for french tips)', 34, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 25, 0, 0, '40', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 1, 'Shellac/OPI French Polish (Includes Files & Buff)(extra ?5 for french tips)', 34, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 30, 0, 0, '40', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 1, 'Shellac/OPI with Spa Pedicure (?5 Extra for French Polish)', 34, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 45, 0, 0, '40', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 1, 'Shellac/OPI with Spa Manicure (?5 Extra for French Polish)', 34, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 40, 0, 0, '40', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 1, 'Shellac/OPI Removal and Re-application (?5 extra for French Polish)', 34, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 32, 0, 0, '40', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 1, 'Shellac/OPI Removal Only', 34, '', 'F', 'Shellac/OPI Gel Polish', '1', 0, '0', 10, 0, 0, '20', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 1, 'Swedish Body Massage', 35, '', '', 'Massages', '0', 0, '0', 50, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 1, 'Full Body Massage with Aroma Therapu', 35, '', '', 'Massages', '0', 0, '0', 55, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 1, 'Back Massage with Aroma Therapy', 35, '', '', 'Massages', '0', 0, '0', 35, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 1, 'Indian Head, Neck and Shoulder Massage', 35, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 1, 'Leg or Arm Massage', 35, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 1, 'Full Body Mineral Salt Scrub Therapy', 36, '', '', 'Body Therapies', '0', 0, '0', 40, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 1, 'Back Cleanse Treatment', 36, '', '', 'Body Therapies', '0', 0, '0', 35, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 1, 'Elemis Pro-Collagen Age Defy', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 99, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 1, 'Elemis Pro-Collagen Definition Lift and Contour', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 99, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 1, 'Elemis Dynamic Resurfacing Precision Peel', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 99, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 1, 'Elemis Peptide 24/7 Skin Sync', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 90, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 1, 'Elemis Superfood Pro-Radiance', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 95, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, 1, 'Elemis Sensitive Skin Soother', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 80, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 1, 'Elemis Anti-Blemish Mattify and Calm', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 80, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 1, 'Elemis Biotec Line Eraser', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 1, 'Elmis Biotec 24/7 Sync', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 1, 'Elemis Biotex Firm-A-Lift', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 1, 'Elemis Biotex Anti-Pigment Brightener', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 1, 'Elemis Biotec Skin Resurfacer', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 1, 'Elemis Biotec Radiance Renew', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 1, 'Elemis Biotec Blemish Control', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 1, 'Elemis Biotec Sensitive Skin Soother', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 1, 'Elem is Biotec Super-Charger For Men', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 1, 'Elemis Biotec Eye Treatment', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, 1, 'Elemis Biotec Neck Treatment', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, 1, 'Elemis Couture Technology', 37, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, 1, 'Pro Skin 30', 38, '', '', 'Dermalogica Treatments', '0', 0, '0', 35, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 1, 'Pro Skin 60', 38, '', '', 'Dermalogica Treatments', '0', 0, '0', 65, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, 1, 'Pro Power Peel 30', 38, '', '', 'Dermalogica Treatments', '0', 0, '0', 70, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 1, 'Pro Power Peel 60', 38, '', '', 'Dermalogica Treatments', '0', 0, '0', 120, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 1, '3D Hydro2 30 Min Express Treatment', 39, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 45, 0, 0, '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, 1, '3D Hydro2 60 Min Express Treatment', 39, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 99, 0, 0, '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, 1, '3D Hydro2 90 Min Express Treatment', 39, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 130, 0, 0, '90', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, 1, 'Eyebrows Shaping (Threading)', 40, '', '', 'Threading', '1', 0, '0', 7, 0, 0, '5', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, 1, 'Middle of the Brows (Threading)', 40, '', '', 'Threading', '1', 0, '0', 2, 0, 0, '3', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, 1, 'Upper Lips (Threading)', 40, '', 'F', 'Threading', '1', 0, '0', 3.5, 0, 0, '4', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, 1, 'Lower Lips (Threading)', 40, '', 'F', 'Threading', '1', 0, '0', 2.5, 0, 0, '4', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, 1, 'Chin Only (Threading)', 40, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, 1, 'Chin Extended to Neck (Threading)', 40, '', 'F', 'Threading', '1', 0, '0', 6, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, 1, 'Jaw Line (Threading)', 40, '', 'F', 'Threading', '1', 0, '0', 6, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 1, 'Sides (Threading)', 40, '', 'F', 'Threading', '1', 0, '0', 6, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 1, 'Cheeks (Threading)', 40, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '8', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, 1, 'Forehead (Threading)', 40, '', '', 'Threading', '1', 0, '0', 5, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, 1, 'Neck (Threading)', 40, '', 'F', 'Threading', '1', 0, '0', 7, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, 1, 'Full Face (Threading)', 40, '', 'F', 'Threading', '1', 0, '0', 20, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, 1, 'Full Face & Neck (Threading)', 40, '', 'F', 'Threading', '1', 0, '0', 24, 0, 0, '25', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 1, 'Eyebrows Tint', 41, '', '', 'Tinting', '1', 0, '0', 8, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 1, 'Eyelash Tint', 41, '', '', 'Tinting', '1', 0, '0', 13, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, 1, 'Eyebrows & Eyelashed Tint', 41, '', '', 'Tinting', '1', 0, '0', 17, 0, 0, '15', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 1, 'Full Set Cluster Lashes', 42, '', 'F', 'Lashes', '0', 0, '0', 30, 0, 0, '45', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, 1, 'Extend individual Lashes Full Set', 42, '', 'F', 'Lashes', '0', 0, '0', 75, 0, 0, '60', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, 1, 'Extend individual Lashes Half Set', 42, '', 'F', 'Lashes', '0', 0, '0', 60, 0, 0, '40', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, 1, 'Lash Removal', 42, '', 'F', 'Lashes', '1', 0, '0', 12, 0, 0, '25', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, 1, 'LVL (Eyelash Lift)', 42, '', 'F', 'Lashes', '0', 0, '0', 50, 0, 0, '45', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, 1, 'High Definition Brows Full Treatment', 43, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, 1, 'High Definition Tint Only', 43, '', '', 'BROWS', '0', 0, '0', 15, 0, 0, '15', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, 1, 'High Definition Lash Tint', 43, '', '', 'BROWS', '0', 0, '0', 20, 0, 0, '15', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, 1, 'Henna Brows', 43, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, 1, 'Eyebrows Shaping (Strip Wax)', 44, '', '', 'Regular Strip Wax', '1', 0, '0', 9, 0, 0, '5', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, 1, 'Middle of the Brows (Strip Wax)', 44, '', '', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '3', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 1, 'Upper Lips (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '4', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 1, 'Lower Lips (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '4', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, 1, 'Chin Only (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, 1, 'Chin Extended to Neck (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, 1, 'Jaw Line (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6.5, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, 1, 'Sides (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7.5, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(458, 1, 'Cheeks (Strip Wax)', 44, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '8', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, 1, 'Forehead (Strip Wax)', 44, '', '', 'Regular Strip Wax', '1', 0, '0', 6.5, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, 1, 'Neck (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7.5, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, 1, 'Full Face (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '1', 0, '0', 25, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, 1, 'Full Face & Neck  (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '1', 0, '0', 29, 0, 0, '25', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, 1, 'Nose (Inside Only)  (Strip Wax)', 44, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, 1, 'Nose (Top Only) (Strip Wax)', 44, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '5', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, 1, 'Ear Strip Wax (No Inside) (Strip Wax)', 44, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '8', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, 1, 'Knuckles (Strip Wax)', 44, '', '', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '6', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, 1, 'Hand (Strip Wax)', 44, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '6', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, 1, 'Back of The Neck (Strip Wax)', 44, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '8', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, 1, 'Full Arms (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 18, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, 1, 'Half Arms (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 13, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, 1, '3/4 Arms (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '15', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, 1, 'Chest Wax (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16.5, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, 1, 'Under Arms or Bikini Line (Thigh not included) (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '1', 0, '0', 9, 0, 0, '8', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, 1, 'Full Legs (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 21, 0, 0, '25', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, 1, 'Top Half Legs (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '22', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(476, 1, 'Bottom Half Legs (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '15', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, 1, '3/4 Legs (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 18, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, 1, 'Deep Bikini Line (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, 1, 'Brazilian (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 18, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, 1, 'Hollywood (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, 1, 'Buttocks (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, 1, 'Perianal Only (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 5, 0, 0, '8', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, 1, 'Full Stomach OR Full Back (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 21, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, 1, 'Half Stomach OR Half Back (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, 1, 'Full Stomach AND Full Back (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 37, 0, 0, '45', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, 1, 'Full Waxing (Not Breakable) (Includes F/Arms, F/Legs, U/Arms, B/Line) (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 49, 0, 0, '35', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, 1, 'Full Body Waxing (Not Breakable) (F/Arms, F/Legs, U/Arms, B/Line, F/Stomach & F/Back) (Strip Wax)', 44, '', 'F', 'Regular Strip Wax', '0', 0, '0', 80, 0, 0, '65', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, 1, 'Full Back (Strip Wax)', 44, '', 'M', 'Regular Strip Wax', '0', 0, '0', 40, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, 1, '1/4 Back (Strip Wax)', 44, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '15', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, 1, 'Chest Wax (Strip Wax)', 44, '', 'M', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '25', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, 1, 'Stomach (Strip Wax)', 44, '', 'M', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '15', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, 1, 'Shoulders (Strip Wax)', 44, '', 'M', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(493, 1, 'Shoulders + Neck (Strip Wax)', 44, '', 'M', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '15', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(494, 1, 'Top 1/4 Arms (Strip Wax)', 44, '', 'M', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(495, 1, 'Full Back + Chest (Strip Wax)', 44, '', 'M', 'Regular Strip Wax', '0', 0, '0', 55, 0, 0, '55', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, 1, 'Full Arms (Strip Wax)', 44, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, 1, 'Eyebrows Shaping  (Hot Wax)', 45, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, 1, 'Upper Lips  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '5', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, 1, 'Lower Lips  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 7, 0, 0, '5', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(500, 1, 'Chin Only  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, 1, 'Chin Extended to Neck  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(502, 1, 'Sides  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, 1, 'Cheeks  (Hot Wax)', 45, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '5', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, 1, 'Back of the Neck  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(505, 1, 'Jawline  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '5', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(506, 1, 'Nose (Inside Only)  (Hot Wax)', 45, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(507, 1, 'Ear (Out Side Only)  (Hot Wax)', 45, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(508, 1, 'Nose (Top Only)  (Hot Wax)', 45, '', '', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '6', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, 1, 'Forehead  (Hot Wax)', 45, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '8', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(510, 1, 'Full Face (Icludes Eyebrows Threading)  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 32, 0, 0, '25', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(511, 1, 'Full Face & Neck (Including Eyebrows Threading)  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 42, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(512, 1, 'Under Arms  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 15, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(513, 1, 'Bikini Line (Thigh Not Included)  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 12, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(514, 1, 'Deep Bikini Line  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '15', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(515, 1, 'Brazillian  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 30, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(516, 1, 'Hollywood  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 40, 0, 0, '25', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(517, 1, 'Buttocks  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(518, 1, 'Perianal Only  (Hot Wax)', 45, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 10, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(519, 1, 'Mini Manicure (extra ?5 for french tips)', 46, '', '', 'Manicure/Pedicure', '1', 0, '0', 12, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(520, 1, 'Mini Pedicure(extra ?5 for french tips)', 46, '', '', 'Manicure/Pedicure', '1', 0, '0', 12, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, 1, 'Spa Manicure(extra ?5 for french tips)', 46, '', '', 'Manicure/Pedicure', '0', 0, '0', 22, 0, 0, '35', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, 1, 'Spa Manicure with Mud/Paraffin Mask(extra ?5 for french tips)', 46, '', '', 'Manicure/Pedicure', '0', 0, '0', 30, 0, 0, '35', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(523, 1, 'Spa Pedicure(extra ?5 for french tips)', 46, '', '', 'Manicure/Pedicure', '0', 0, '0', 29, 0, 0, '35', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(524, 1, 'Spa Pedicure with Mud/Paraffin Mask(extra ?5 for french tips)', 46, '', '', 'Manicure/Pedicure', '0', 0, '0', 36, 0, 0, '35', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(525, 1, 'New-Callus Peel Treatment', 46, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '25', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(526, 1, 'Shellac/OPI Polsih (Includes File & Buff)(extra ?5 for french tips)', 47, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 25, 0, 0, '40', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(527, 1, 'Shellac/OPI French Polish (Includes Files & Buff)(extra ?5 for french tips)', 47, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 30, 0, 0, '40', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(528, 1, 'Shellac/OPI with Spa Pedicure (?5 Extra for French Polish)', 47, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 45, 0, 0, '40', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(529, 1, 'Shellac/OPI with Spa Manicure (?5 Extra for French Polish)', 47, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 40, 0, 0, '40', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(530, 1, 'Shellac/OPI Removal and Re-application (?5 extra for French Polish)', 47, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 32, 0, 0, '40', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(531, 1, 'Shellac/OPI Removal Only', 47, '', 'F', 'Shellac/OPI Gel Polish', '1', 0, '0', 10, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, 1, 'Swedish Body Massage', 48, '', '', 'Massages', '0', 0, '0', 50, 0, 0, '60', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, 1, 'Full Body Massage with Aroma Therapu', 48, '', '', 'Massages', '0', 0, '0', 55, 0, 0, '60', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(534, 1, 'Back Massage with Aroma Therapy', 48, '', '', 'Massages', '0', 0, '0', 35, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(535, 1, 'Indian Head, Neck and Shoulder Massage', 48, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(536, 1, 'Leg or Arm Massage', 48, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(537, 1, 'Full Body Mineral Salt Scrub Therapy', 49, '', '', 'Body Therapies', '0', 0, '0', 40, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(538, 1, 'Back Cleanse Treatment', 49, '', '', 'Body Therapies', '0', 0, '0', 35, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, 1, 'Short Hair Length', 50, '', 'F', 'Wash & Cut', '0', 0, '0', 25, 0, 0, '20', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, 1, 'Medium Hair Length', 50, '', 'F', 'Wash & Cut', '0', 0, '0', 30, 0, 0, '25', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(541, 1, 'Long Hair Length', 50, '', 'F', 'Wash & Cut', '0', 0, '0', 35, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(542, 1, 'Short Hair Length', 51, '', 'F', 'Wash & Blow-Dry', '0', 0, '0', 20, 0, 0, '30', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(543, 1, 'Medium Hair Length', 51, '', 'F', 'Wash & Blow-Dry', '0', 0, '0', 25, 0, 0, '40', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(544, 1, 'Long Hair Length', 51, '', 'F', 'Wash & Blow-Dry', '0', 0, '0', 30, 0, 0, '50', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, 1, 'Short Hair Length', 52, '', 'F', 'Wash, Cut & Blow-Dry', '0', 0, '0', 35, 0, 0, '40', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(546, 1, 'Medium Hair Length', 52, '', 'F', 'Wash, Cut & Blow-Dry', '0', 0, '0', 40, 0, 0, '50', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(547, 1, 'Long Hair Length', 52, '', 'F', 'Wash, Cut & Blow-Dry', '0', 0, '0', 45, 0, 0, '60', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(548, 1, 'Fringe', 53, '', 'F', 'Cut', '0', 0, '0', 8, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(549, 1, 'Under 14 Wash & Cut', 53, '', 'F', 'Cut', '0', 0, '0', 20, 0, 0, '40', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(550, 1, 'Roots', 54, '', 'F', 'Colors', '0', 0, '0', 40, 0, 0, '45', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, 1, 'Full Head Color', 54, '', 'F', 'Colors', '0', 0, '0', 55, 0, 0, '60', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(552, 1, '1/4 Head Highlights', 54, '', 'F', 'Colors', '0', 0, '0', 35, 0, 0, '40', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(553, 1, '1/2 Head Highlights', 54, '', 'F', 'Colors', '0', 0, '0', 5, 0, 0, '50', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(554, 1, 'Full Head Highlights', 54, '', 'F', 'Colors', '0', 0, '0', 85, 0, 0, '90', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(555, 1, 'Ombre/Balayage ', 54, '', 'F', 'Colors', '0', 0, '0', 125, 0, 0, '90', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(556, 1, 'Ombre/Balayage Long Hair', 54, '', 'F', 'Colors', '0', 0, '0', 150, 0, 0, '90', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(557, 1, 'Crazy Creative Color - Short Hair', 54, '', 'F', 'Colors', '0', 0, '0', 55, 0, 0, '60', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(558, 1, 'Crazy Creative Color - Medium Hair', 54, '', 'F', 'Colors', '0', 0, '0', 65, 0, 0, '70', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(559, 1, 'Crazy Creative Color - Long Hair', 54, '', 'F', 'Colors', '0', 0, '0', 75, 0, 0, '80', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(560, 1, 'French Plaits', 55, '', 'F', 'Hair Styling', '0', 0, '0', 10, 0, 0, '10', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(561, 1, 'Brazillian BlowDry', 56, '', 'F', 'Hair Treatment', '0', 0, '0', 150, 0, 0, '240', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(562, 1, 'Permanent Straightening', 56, '', 'F', 'Hair Treatment', '0', 0, '0', 150, 0, 0, '240', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(563, 1, 'Rebonding', 56, '', 'F', 'Hair Treatment', '0', 0, '0', 150, 0, 0, '240', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(564, 1, 'Eyebrows Shaping (Threading)', 57, '', '', 'Threading', '1', 0, '0', 6, 0, 0, '5', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(565, 1, 'Middle of the Brows (Threading)', 57, '', '', 'Threading', '1', 0, '0', 2, 0, 0, '3', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(566, 1, 'Upper Lips (Threading)', 57, '', 'F', 'Threading', '1', 0, '0', 3.5, 0, 0, '4', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(567, 1, 'Lower Lips (Threading)', 57, '', 'F', 'Threading', '1', 0, '0', 2.5, 0, 0, '4', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(568, 1, 'Chin Only (Threading)', 57, '', 'F', 'Threading', '1', 0, '0', 4.5, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(569, 1, 'Chin Extended to Neck (Threading)', 57, '', 'F', 'Threading', '1', 0, '0', 5.5, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(570, 1, 'Jaw Line (Threading)', 57, '', 'F', 'Threading', '1', 0, '0', 5.5, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(571, 1, 'Sides (Threading)', 57, '', 'F', 'Threading', '1', 0, '0', 6, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(572, 1, 'Cheeks (Threading)', 57, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '8', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(573, 1, 'Forehead (Threading)', 57, '', '', 'Threading', '1', 0, '0', 5, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(574, 1, 'Neck (Threading)', 57, '', 'F', 'Threading', '1', 0, '0', 6.5, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(575, 1, 'Full Face (Threading)', 57, '', 'F', 'Threading', '1', 0, '0', 19, 0, 0, '20', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(576, 1, 'Full Face & Neck (Threading)', 57, '', 'F', 'Threading', '1', 0, '0', 23, 0, 0, '25', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(577, 1, 'Eyebrows Tint', 58, '', '', 'Tinting', '1', 0, '0', 7, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(578, 1, 'Eyelash Tint', 58, '', '', 'Tinting', '1', 0, '0', 12, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(579, 1, 'Eyebrows & Eyelashed Tint', 58, '', '', 'Tinting', '1', 0, '0', 15, 0, 0, '15', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(580, 1, 'Full Set Cluster Lashes', 59, '', 'F', 'Lashes', '0', 0, '0', 30, 0, 0, '45', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(581, 1, 'Extend individual Lashes Full Set', 59, '', 'F', 'Lashes', '0', 0, '0', 75, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(582, 1, 'Extend individual Lashes Half Set', 59, '', 'F', 'Lashes', '0', 0, '0', 60, 0, 0, '40', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(583, 1, 'Lash Removal', 59, '', 'F', 'Lashes', '1', 0, '0', 10, 0, 0, '25', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(584, 1, 'LVL (Eyelash Lift)', 59, '', 'F', 'Lashes', '0', 0, '0', 50, 0, 0, '45', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(585, 1, 'High Definition Brows Full Treatment', 60, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(586, 1, 'High Definition Tint Only', 60, '', '', 'BROWS', '0', 0, '0', 15, 0, 0, '15', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(587, 1, 'High Definition Lash Tint', 60, '', '', 'BROWS', '0', 0, '0', 20, 0, 0, '15', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(588, 1, 'Henna Brows', 60, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(589, 1, 'Eyebrows Shaping (Strip Wax)', 61, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '5', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(590, 1, 'Middle of the Brows (Strip Wax)', 61, '', '', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '3', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(591, 1, 'Upper Lips (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '4', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(592, 1, 'Lower Lips (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '4', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(593, 1, 'Chin Only (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '1', 0, '0', 5.5, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, 1, 'Chin Extended to Neck (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(595, 1, 'Jaw Line (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(596, 1, 'Sides (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(597, 1, 'Cheeks (Strip Wax)', 61, '', '', 'Regular Strip Wax', '1', 0, '0', 5.5, 0, 0, '8', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(598, 1, 'Forehead (Strip Wax)', 61, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(599, 1, 'Neck (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(600, 1, 'Full Face (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '1', 0, '0', 24, 0, 0, '20', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(601, 1, 'Full Face & Neck  (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '1', 0, '0', 28, 0, 0, '25', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(602, 1, 'Nose (Inside Only)  (Strip Wax)', 61, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(603, 1, 'Nose (Top Only) (Strip Wax)', 61, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '5', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(604, 1, 'Ear Strip Wax (No Inside) (Strip Wax)', 61, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '8', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(605, 1, 'Knuckles (Strip Wax)', 61, '', '', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '6', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(606, 1, 'Hand (Strip Wax)', 61, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '6', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(607, 1, 'Back of The Neck (Strip Wax)', 61, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '8', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(608, 1, 'Full Arms (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '20', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(609, 1, 'Half Arms (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(610, 1, '3/4 Arms (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 14.5, 0, 0, '15', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(611, 1, 'Chest Wax (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(612, 1, 'Under Arms or Bikini Line (Thigh not included) (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '8', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(613, 1, 'Full Legs (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '25', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(614, 1, 'Top Half Legs (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16.5, 0, 0, '22', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(615, 1, 'Bottom Half Legs (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 14.5, 0, 0, '15', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(616, 1, '3/4 Legs (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '20', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(617, 1, 'Deep Bikini Line (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(618, 1, 'Brazilian (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 18, 0, 0, '20', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(619, 1, 'Hollywood (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(620, 1, 'Buttocks (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(621, 1, 'Perianal Only (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 5, 0, 0, '8', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(622, 1, 'Full Stomach OR Full Back (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(623, 1, 'Half Stomach OR Half Back (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '20', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(624, 1, 'Full Stomach AND Full Back (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 35, 0, 0, '45', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(625, 1, 'Full Waxing (Not Breakable) (Includes F/Arms, F/Legs, U/Arms, B/Line) (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 45, 0, 0, '35', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(626, 1, 'Full Body Waxing (Not Breakable) (F/Arms, F/Legs, U/Arms, B/Line, F/Stomach & F/Back) (Strip Wax)', 61, '', 'F', 'Regular Strip Wax', '0', 0, '0', 70, 0, 0, '65', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(627, 1, 'Full Back (Strip Wax)', 61, '', 'M', 'Regular Strip Wax', '0', 0, '0', 40, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(628, 1, '1/4 Back (Strip Wax)', 61, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '15', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(629, 1, 'Chest Wax (Strip Wax)', 61, '', 'M', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '25', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(630, 1, 'Stomach (Strip Wax)', 61, '', 'M', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '15', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(631, 1, 'Shoulders (Strip Wax)', 61, '', 'M', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(632, 1, 'Shoulders + Neck (Strip Wax)', 61, '', 'M', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '15', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(633, 1, 'Top 1/4 Arms (Strip Wax)', 61, '', 'M', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '20', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(634, 1, 'Full Back + Chest (Strip Wax)', 61, '', 'M', 'Regular Strip Wax', '0', 0, '0', 55, 0, 0, '55', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(635, 1, 'Full Arms (Strip Wax)', 61, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(636, 1, 'Eyebrows Shaping  (Hot Wax)', 62, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(637, 1, 'Upper Lips  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '5', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(638, 1, 'Lower Lips  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 7, 0, 0, '5', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(639, 1, 'Chin Only  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(640, 1, 'Chin Extended to Neck  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(641, 1, 'Sides  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(642, 1, 'Cheeks  (Hot Wax)', 62, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '5', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(643, 1, 'Back of the Neck  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(644, 1, 'Jawline  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '5', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(645, 1, 'Nose (Inside Only)  (Hot Wax)', 62, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(646, 1, 'Ear (Out Side Only)  (Hot Wax)', 62, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(647, 1, 'Nose (Top Only)  (Hot Wax)', 62, '', '', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '6', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(648, 1, 'Forehead  (Hot Wax)', 62, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '8', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(649, 1, 'Full Face (Icludes Eyebrows Threading)  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 32, 0, 0, '25', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(650, 1, 'Full Face & Neck (Including Eyebrows Threading)  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 42, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(651, 1, 'Under Arms  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 15, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(652, 1, 'Bikini Line (Thigh Not Included)  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 12, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(653, 1, 'Deep Bikini Line  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '15', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(654, 1, 'Brazillian  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 30, 0, 0, '20', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(655, 1, 'Hollywood  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 40, 0, 0, '25', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(656, 1, 'Buttocks  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '20', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(657, 1, 'Perianal Only  (Hot Wax)', 62, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 10, 0, 0, '10', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(658, 1, 'Mini Manicure (extra ?5 for french tips)', 63, '', '', 'Manicure/Pedicure', '1', 0, '0', 10, 0, 0, '20', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(659, 1, 'Mini Pedicure(extra ?5 for french tips)', 63, '', '', 'Manicure/Pedicure', '1', 0, '0', 10, 0, 0, '20', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(660, 1, 'Spa Manicure(extra ?5 for french tips)', 63, '', '', 'Manicure/Pedicure', '0', 0, '0', 20, 0, 0, '35', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(661, 1, 'Spa Manicure with Mud/Paraffin Mask(extra ?5 for french tips)', 63, '', '', 'Manicure/Pedicure', '0', 0, '0', 28, 0, 0, '35', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(662, 1, 'Spa Pedicure(extra ?5 for french tips)', 63, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '35', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(663, 1, 'Spa Pedicure with Mud/Paraffin Mask(extra ?5 for french tips)', 63, '', '', 'Manicure/Pedicure', '0', 0, '0', 32, 0, 0, '35', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_services` (`tbl_services_id`, `tbl_services_user_id`, `tbl_services_name`, `tbl_services_type`, `tbl_services_image`, `tbl_services_for`, `tbl_services_description`, `tbl_services_enable_online`, `tbl_services_commission`, `tbl_services_status`, `tbl_services_retail_price`, `tbl_services_special_price`, `tbl_services_tax`, `tbl_services_duration_time`, `tbl_services_location_id`, `tbl_services_insertdate`, `tbl_services_updatedate`) VALUES
(664, 1, 'New-Callus Peel Treatment', 63, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '25', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(665, 1, 'Shellac/OPI Polsih (Includes File & Buff)(extra ?5 for french tips)', 64, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 25, 0, 0, '40', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(666, 1, 'Shellac/OPI French Polish (Includes Files & Buff)(extra ?5 for french tips)', 64, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 30, 0, 0, '40', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(667, 1, 'Shellac/OPI with Spa Pedicure (?5 Extra for French Polish)', 64, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 45, 0, 0, '40', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(668, 1, 'Shellac/OPI with Spa Manicure (?5 Extra for French Polish)', 64, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 40, 0, 0, '40', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(669, 1, 'Shellac/OPI Removal and Re-application (?5 extra for French Polish)', 64, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 32, 0, 0, '40', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(670, 1, 'Shellac/OPI Removal Only', 64, '', 'F', 'Shellac/OPI Gel Polish', '1', 0, '0', 10, 0, 0, '20', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(671, 1, 'Swedish Body Massage', 65, '', '', 'Massages', '0', 0, '0', 50, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(672, 1, 'Full Body Massage with Aroma Therapu', 65, '', '', 'Massages', '0', 0, '0', 55, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(673, 1, 'Back Massage with Aroma Therapy', 65, '', '', 'Massages', '0', 0, '0', 35, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(674, 1, 'Indian Head, Neck and Shoulder Massage', 65, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(675, 1, 'Leg or Arm Massage', 65, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(676, 1, 'Full Body Mineral Salt Scrub Therapy', 66, '', '', 'Body Therapies', '0', 0, '0', 40, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(677, 1, 'Back Cleanse Treatment', 66, '', '', 'Body Therapies', '0', 0, '0', 35, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(678, 1, 'Elemis Pro-Collagen Age Defy', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 99, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(679, 1, 'Elemis Pro-Collagen Definition Lift and Contour', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 99, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(680, 1, 'Elemis Dynamic Resurfacing Precision Peel', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 99, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(681, 1, 'Elemis Peptide 24/7 Skin Sync', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 90, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(682, 1, 'Elemis Superfood Pro-Radiance', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 95, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(683, 1, 'Elemis Sensitive Skin Soother', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 80, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(684, 1, 'Elemis Anti-Blemish Mattify and Calm', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 80, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(685, 1, 'Elemis Biotec Line Eraser', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(686, 1, 'Elmis Biotec 24/7 Sync', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(687, 1, 'Elemis Biotex Firm-A-Lift', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(688, 1, 'Elemis Biotex Anti-Pigment Brightener', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(689, 1, 'Elemis Biotec Skin Resurfacer', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(690, 1, 'Elemis Biotec Radiance Renew', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(691, 1, 'Elemis Biotec Blemish Control', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(692, 1, 'Elemis Biotec Sensitive Skin Soother', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(693, 1, 'Elem is Biotec Super-Charger For Men', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(694, 1, 'Elemis Biotec Eye Treatment', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(695, 1, 'Elemis Biotec Neck Treatment', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(696, 1, 'Elemis Couture Technology', 67, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(697, 1, 'Pro Skin 30', 68, '', '', 'Dermalogica Treatments', '0', 0, '0', 35, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(698, 1, 'Pro Skin 60', 68, '', '', 'Dermalogica Treatments', '0', 0, '0', 65, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(699, 1, 'Pro Power Peel 30', 68, '', '', 'Dermalogica Treatments', '0', 0, '0', 70, 0, 0, '30', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(700, 1, 'Pro Power Peel 60', 68, '', '', 'Dermalogica Treatments', '0', 0, '0', 120, 0, 0, '60', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(701, 1, 'Eyebrows Shaping (Threading)', 69, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '5', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(702, 1, 'Middle of the Brows (Threading)', 69, '', '', 'Threading', '1', 0, '0', 2, 0, 0, '3', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(703, 1, 'Upper Lips (Threading)', 69, '', 'F', 'Threading', '1', 0, '0', 2.5, 0, 0, '4', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(704, 1, 'Lower Lips (Threading)', 69, '', 'F', 'Threading', '1', 0, '0', 2, 0, 0, '4', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(705, 1, 'Chin Only (Threading)', 69, '', 'F', 'Threading', '1', 0, '0', 4, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(706, 1, 'Chin Extended to Neck (Threading)', 69, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(707, 1, 'Jaw Line (Threading)', 69, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(708, 1, 'Sides (Threading)', 69, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(709, 1, 'Cheeks (Threading)', 69, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '8', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(710, 1, 'Forehead (Threading)', 69, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(711, 1, 'Neck (Threading)', 69, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(712, 1, 'Full Face (Threading)', 69, '', 'F', 'Threading', '1', 0, '0', 16, 0, 0, '20', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(713, 1, 'Full Face & Neck (Threading)', 69, '', 'F', 'Threading', '1', 0, '0', 20, 0, 0, '25', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(714, 1, 'Eyebrows Tint', 70, '', '', 'Tinting', '1', 0, '0', 7, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(715, 1, 'Eyelash Tint', 70, '', '', 'Tinting', '1', 0, '0', 12, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(716, 1, 'Eyebrows & Eyelashed Tint', 70, '', '', 'Tinting', '1', 0, '0', 15, 0, 0, '15', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(717, 1, 'Full Set Cluster Lashes', 71, '', 'F', 'Lashes', '0', 0, '0', 30, 0, 0, '45', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(718, 1, 'Extend individual Lashes Full Set', 71, '', 'F', 'Lashes', '0', 0, '0', 75, 0, 0, '60', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(719, 1, 'Extend individual Lashes Half Set', 71, '', 'F', 'Lashes', '0', 0, '0', 60, 0, 0, '40', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(720, 1, 'Lash Removal', 71, '', 'F', 'Lashes', '1', 0, '0', 12, 0, 0, '25', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(721, 1, 'LVL (Eyelash Lift)', 71, '', 'F', 'Lashes', '0', 0, '0', 50, 0, 0, '45', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(722, 1, 'High Definition Brows Full Treatment', 72, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(723, 1, 'High Definition Tint Only', 72, '', '', 'BROWS', '0', 0, '0', 15, 0, 0, '15', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(724, 1, 'High Definition Lash Tint', 72, '', '', 'BROWS', '0', 0, '0', 20, 0, 0, '15', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(725, 1, 'Henna Brows', 72, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(726, 1, 'Eyebrows Shaping (Strip Wax)', 73, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '5', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(727, 1, 'Middle of the Brows (Strip Wax)', 73, '', '', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '3', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(728, 1, 'Upper Lips (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '4', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(729, 1, 'Lower Lips (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '1', 0, '0', 2.5, 0, 0, '4', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(730, 1, 'Chin Only (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '1', 0, '0', 5, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(731, 1, 'Chin Extended to Neck (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7.5, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(732, 1, 'Jaw Line (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6.5, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(733, 1, 'Sides (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(734, 1, 'Cheeks (Strip Wax)', 73, '', '', 'Regular Strip Wax', '1', 0, '0', 5, 0, 0, '8', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(735, 1, 'Forehead (Strip Wax)', 73, '', '', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(736, 1, 'Neck (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(737, 1, 'Full Face (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '1', 0, '0', 18, 0, 0, '20', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(738, 1, 'Full Face & Neck  (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '1', 0, '0', 22, 0, 0, '25', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(739, 1, 'Nose (Inside Only)  (Strip Wax)', 73, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(740, 1, 'Nose (Top Only) (Strip Wax)', 73, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '5', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(741, 1, 'Ear Strip Wax (No Inside) (Strip Wax)', 73, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '8', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(742, 1, 'Knuckles (Strip Wax)', 73, '', '', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '6', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(743, 1, 'Hand (Strip Wax)', 73, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '6', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(744, 1, 'Back of The Neck (Strip Wax)', 73, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '8', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(745, 1, 'Full Arms (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12.5, 0, 0, '20', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(746, 1, 'Half Arms (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 8, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(747, 1, '3/4 Arms (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 10, 0, 0, '15', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(748, 1, 'Chest Wax (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(749, 1, 'Under Arms or Bikini Line (Thigh not included) (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '1', 0, '0', 5, 0, 0, '8', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(750, 1, 'Full Legs (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '25', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(751, 1, 'Top Half Legs (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 14.5, 0, 0, '22', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(752, 1, 'Bottom Half Legs (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12.5, 0, 0, '15', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(753, 1, '3/4 Legs (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '20', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(754, 1, 'Deep Bikini Line (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 10, 0, 0, '15', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(755, 1, 'Brazilian (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '20', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(756, 1, 'Hollywood (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '25', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(757, 1, 'Buttocks (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(758, 1, 'Perianal Only (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 5, 0, 0, '8', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(759, 1, 'Full Stomach OR Full Back (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 18, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(760, 1, 'Half Stomach OR Half Back (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '20', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(761, 1, 'Full Stomach AND Full Back (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 33, 0, 0, '45', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(762, 1, 'Full Waxing (Not Breakable) (Includes F/Arms, F/Legs, U/Arms, B/Line) (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 40, 0, 0, '35', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(763, 1, 'Full Body Waxing (Not Breakable) (F/Arms, F/Legs, U/Arms, B/Line, F/Stomach & F/Back) (Strip Wax)', 73, '', 'F', 'Regular Strip Wax', '0', 0, '0', 65, 0, 0, '65', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(764, 1, 'Full Back (Strip Wax)', 73, '', 'M', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(765, 1, '1/4 Back (Strip Wax)', 73, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '15', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(766, 1, 'Chest Wax (Strip Wax)', 73, '', 'M', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '25', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(767, 1, 'Stomach (Strip Wax)', 73, '', 'M', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '15', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(768, 1, 'Shoulders (Strip Wax)', 73, '', 'M', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(769, 1, 'Shoulders + Neck (Strip Wax)', 73, '', 'M', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '15', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(770, 1, 'Top 1/4 Arms (Strip Wax)', 73, '', 'M', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '20', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(771, 1, 'Full Back + Chest (Strip Wax)', 73, '', 'M', 'Regular Strip Wax', '0', 0, '0', 55, 0, 0, '55', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(772, 1, 'Full Arms (Strip Wax)', 73, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(773, 1, 'Eyebrows Shaping  (Hot Wax)', 74, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(774, 1, 'Upper Lips  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '5', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(775, 1, 'Lower Lips  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 7, 0, 0, '5', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(776, 1, 'Chin Only  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(777, 1, 'Chin Extended to Neck  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(778, 1, 'Sides  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(779, 1, 'Cheeks  (Hot Wax)', 74, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '5', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(780, 1, 'Back of the Neck  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(781, 1, 'Jawline  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '5', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(782, 1, 'Nose (Inside Only)  (Hot Wax)', 74, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(783, 1, 'Ear (Out Side Only)  (Hot Wax)', 74, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(784, 1, 'Nose (Top Only)  (Hot Wax)', 74, '', '', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '6', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(785, 1, 'Forehead  (Hot Wax)', 74, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '8', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(786, 1, 'Full Face (Icludes Eyebrows Threading)  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 32, 0, 0, '25', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(787, 1, 'Full Face & Neck (Including Eyebrows Threading)  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 42, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(788, 1, 'Under Arms  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 15, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(789, 1, 'Bikini Line (Thigh Not Included)  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 12, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(790, 1, 'Deep Bikini Line  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '15', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(791, 1, 'Brazillian  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 30, 0, 0, '20', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(792, 1, 'Hollywood  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 40, 0, 0, '25', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(793, 1, 'Buttocks  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '20', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(794, 1, 'Perianal Only  (Hot Wax)', 74, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 10, 0, 0, '10', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(795, 1, 'Mini Manicure (extra ?5 for french tips)', 75, '', '', 'Manicure/Pedicure', '1', 0, '0', 10, 0, 0, '20', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(796, 1, 'Mini Pedicure(extra ?5 for french tips)', 75, '', '', 'Manicure/Pedicure', '1', 0, '0', 10, 0, 0, '20', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(797, 1, 'Spa Manicure(extra ?5 for french tips)', 75, '', '', 'Manicure/Pedicure', '0', 0, '0', 20, 0, 0, '35', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(798, 1, 'Spa Manicure with Mud/Paraffin Mask(extra ?5 for french tips)', 75, '', '', 'Manicure/Pedicure', '0', 0, '0', 28, 0, 0, '35', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(799, 1, 'Spa Pedicure(extra ?5 for french tips)', 75, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '35', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(800, 1, 'Spa Pedicure with Mud/Paraffin Mask(extra ?5 for french tips)', 75, '', '', 'Manicure/Pedicure', '0', 0, '0', 32, 0, 0, '35', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(801, 1, 'New-Callus Peel Treatment', 75, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '25', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(802, 1, 'Shellac/OPI Polsih (Includes File & Buff)(extra ?5 for french tips)', 76, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 25, 0, 0, '40', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(803, 1, 'Shellac/OPI French Polish (Includes Files & Buff)(extra ?5 for french tips)', 76, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 30, 0, 0, '40', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(804, 1, 'Shellac/OPI with Spa Pedicure (?5 Extra for French Polish)', 76, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 45, 0, 0, '40', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(805, 1, 'Shellac/OPI with Spa Manicure (?5 Extra for French Polish)', 76, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 40, 0, 0, '40', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(806, 1, 'Shellac/OPI Removal and Re-application (?5 extra for French Polish)', 76, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 32, 0, 0, '40', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(807, 1, 'Shellac/OPI Removal Only', 76, '', 'F', 'Shellac/OPI Gel Polish', '1', 0, '0', 10, 0, 0, '20', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(808, 1, 'Swedish Body Massage', 77, '', '', 'Massages', '0', 0, '0', 50, 0, 0, '60', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(809, 1, 'Full Body Massage with Aroma Therapu', 77, '', '', 'Massages', '0', 0, '0', 55, 0, 0, '60', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(810, 1, 'Back Massage with Aroma Therapy', 77, '', '', 'Massages', '0', 0, '0', 35, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(811, 1, 'Indian Head, Neck and Shoulder Massage', 77, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(812, 1, 'Leg or Arm Massage', 77, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(813, 1, 'Full Body Mineral Salt Scrub Therapy', 78, '', '', 'Body Therapies', '0', 0, '0', 35, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(814, 1, 'Back Cleanse Treatment', 78, '', '', 'Body Therapies', '0', 0, '0', 30, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(815, 1, 'Adorn Skin Whitening', 79, '', '', 'Classic Facials', '0', 0, '0', 40, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(816, 1, 'Skin Hydrating Collagen Facial Treatment', 79, '', '', 'Classic Facials', '0', 0, '0', 40, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(817, 1, 'Skin Refining & Re-Balancing Facial Treatment', 79, '', '', 'Classic Facials', '0', 0, '0', 40, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(818, 1, 'Vital Eye Treatment', 79, '', '', 'Classic Facials', '0', 0, '0', 22, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(819, 1, 'Deep Cleansing Facial', 79, '', '', 'Classic Facials', '0', 0, '0', 30, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(820, 1, 'Dermalogica Express Facial', 80, '', '', 'Dermalogica Treatments', '0', 0, '0', 35, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(821, 1, 'Dermalogica Prescreptive Facial', 80, '', '', 'Dermalogica Treatments', '0', 0, '0', 55, 0, 0, '60', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(822, 1, 'Dermalogica Teenage Facial', 80, '', '', 'Dermalogica Treatments', '0', 0, '0', 35, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(823, 1, 'Dermalogica Men\'s Facial', 80, '', '', 'Dermalogica Treatments', '0', 0, '0', 50, 0, 0, '60', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(824, 1, 'Dermalogica Pro Power Peel Treatment 30 minutes', 80, '', '', 'Dermalogica Treatments', '0', 0, '0', 70, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(825, 1, 'Dermalogica Pro Power Peel Treatment 60 minutes', 80, '', '', 'Dermalogica Treatments', '0', 0, '0', 120, 0, 0, '60', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(826, 1, 'Diamond Peel Dermabrasion with Dermalogica Facial', 81, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 80, 0, 0, '60', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(827, 1, 'Diamond Peel Dermabrasion with Steam & Extraction', 81, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 65, 0, 0, '60', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(828, 1, 'Oxygen Therapy & Diamond Peel Dermabrasion', 81, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 90, 0, 0, '60', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(829, 1, 'Oxygen Therapy', 81, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 55, 0, 0, '40', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(830, 1, 'Oxygen Therapy with Ultrasonic Peel', 81, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 85, 0, 0, '60', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(831, 1, 'Radio Frequency Facial Treatment', 81, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 60, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(832, 1, 'Collagen Mask Radio Frequency Facial Treatment', 81, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 90, 0, 0, '60', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(833, 1, '3D Hydro2 30 Min Express Treatment', 81, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 45, 0, 0, '30', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(834, 1, '3D Hydro2 60 Min Express Treatment', 81, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 99, 0, 0, '60', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(835, 1, '3D Hydro2 90 Min Express Treatment', 81, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 130, 0, 0, '90', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(836, 1, 'Eyebrows Shaping (Threading)', 82, '', '', 'Threading', '1', 0, '0', 7, 0, 0, '5', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(837, 1, 'Middle of the Brows (Threading)', 82, '', '', 'Threading', '1', 0, '0', 2, 0, 0, '3', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(838, 1, 'Upper Lips (Threading)', 82, '', 'F', 'Threading', '1', 0, '0', 3.5, 0, 0, '4', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(839, 1, 'Lower Lips (Threading)', 82, '', 'F', 'Threading', '1', 0, '0', 2.5, 0, 0, '4', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(840, 1, 'Chin Only (Threading)', 82, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(841, 1, 'Chin Extended to Neck (Threading)', 82, '', 'F', 'Threading', '1', 0, '0', 6, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(842, 1, 'Jaw Line (Threading)', 82, '', 'F', 'Threading', '1', 0, '0', 6, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(843, 1, 'Sides (Threading)', 82, '', 'F', 'Threading', '1', 0, '0', 6, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(844, 1, 'Cheeks (Threading)', 82, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '8', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(845, 1, 'Forehead (Threading)', 82, '', '', 'Threading', '1', 0, '0', 5, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(846, 1, 'Neck (Threading)', 82, '', 'F', 'Threading', '1', 0, '0', 7, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(847, 1, 'Full Face (Threading)', 82, '', 'F', 'Threading', '1', 0, '0', 20, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(848, 1, 'Full Face & Neck (Threading)', 82, '', 'F', 'Threading', '1', 0, '0', 24, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(849, 1, 'Eyebrows Tint', 83, '', '', 'Tinting', '1', 0, '0', 8, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(850, 1, 'Eyelash Tint', 83, '', '', 'Tinting', '1', 0, '0', 13, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(851, 1, 'Eyebrows & Eyelashed Tint', 83, '', '', 'Tinting', '1', 0, '0', 17, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(852, 1, 'Full Set Cluster Lashes', 84, '', 'F', 'Lashes', '0', 0, '0', 30, 0, 0, '45', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(853, 1, 'Extend individual Lashes Full Set', 84, '', 'F', 'Lashes', '0', 0, '0', 75, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(854, 1, 'Extend individual Lashes Half Set', 84, '', 'F', 'Lashes', '0', 0, '0', 60, 0, 0, '40', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(855, 1, 'Lash Removal', 84, '', 'F', 'Lashes', '1', 0, '0', 12, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(856, 1, 'LVL (Eyelash Lift)', 84, '', 'F', 'Lashes', '0', 0, '0', 50, 0, 0, '45', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(857, 1, 'High Definition Brows Full Treatment', 85, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(858, 1, 'High Definition Tint Only', 85, '', '', 'BROWS', '0', 0, '0', 15, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(859, 1, 'High Definition Lash Tint', 85, '', '', 'BROWS', '0', 0, '0', 20, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(860, 1, 'Henna Brows', 85, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(861, 1, 'Eyebrows Shaping (Strip Wax)', 86, '', '', 'Regular Strip Wax', '1', 0, '0', 9, 0, 0, '5', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(862, 1, 'Middle of the Brows (Strip Wax)', 86, '', '', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '3', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(863, 1, 'Upper Lips (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '4', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(864, 1, 'Lower Lips (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '4', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(865, 1, 'Chin Only (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(866, 1, 'Chin Extended to Neck (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(867, 1, 'Jaw Line (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6.5, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(868, 1, 'Sides (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7.5, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(869, 1, 'Cheeks (Strip Wax)', 86, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '8', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(870, 1, 'Forehead (Strip Wax)', 86, '', '', 'Regular Strip Wax', '1', 0, '0', 6.5, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(871, 1, 'Neck (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7.5, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(872, 1, 'Full Face (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '1', 0, '0', 25, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(873, 1, 'Full Face & Neck  (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '1', 0, '0', 29, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(874, 1, 'Nose (Inside Only)  (Strip Wax)', 86, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(875, 1, 'Nose (Top Only) (Strip Wax)', 86, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '5', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(876, 1, 'Ear Strip Wax (No Inside) (Strip Wax)', 86, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '8', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(877, 1, 'Knuckles (Strip Wax)', 86, '', '', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '6', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(878, 1, 'Hand (Strip Wax)', 86, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '6', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(879, 1, 'Back of The Neck (Strip Wax)', 86, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '8', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(880, 1, 'Full Arms (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 18, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(881, 1, 'Half Arms (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 13, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(882, 1, '3/4 Arms (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(883, 1, 'Chest Wax (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16.5, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(884, 1, 'Under Arms or Bikini Line (Thigh not included) (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '1', 0, '0', 9, 0, 0, '8', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(885, 1, 'Full Legs (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 21, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(886, 1, 'Top Half Legs (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '22', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(887, 1, 'Bottom Half Legs (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(888, 1, '3/4 Legs (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 18, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(889, 1, 'Deep Bikini Line (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(890, 1, 'Brazilian (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 18, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(891, 1, 'Hollywood (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(892, 1, 'Buttocks (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(893, 1, 'Perianal Only (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 5, 0, 0, '8', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(894, 1, 'Full Stomach OR Full Back (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 21, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(895, 1, 'Half Stomach OR Half Back (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(896, 1, 'Full Stomach AND Full Back (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 37, 0, 0, '45', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(897, 1, 'Full Waxing (Not Breakable) (Includes F/Arms, F/Legs, U/Arms, B/Line) (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 49, 0, 0, '35', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(898, 1, 'Full Body Waxing (Not Breakable) (F/Arms, F/Legs, U/Arms, B/Line, F/Stomach & F/Back) (Strip Wax)', 86, '', 'F', 'Regular Strip Wax', '0', 0, '0', 80, 0, 0, '65', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(899, 1, 'Full Back (Strip Wax)', 86, '', 'M', 'Regular Strip Wax', '0', 0, '0', 40, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(900, 1, '1/4 Back (Strip Wax)', 86, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(901, 1, 'Chest Wax (Strip Wax)', 86, '', 'M', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(902, 1, 'Stomach (Strip Wax)', 86, '', 'M', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(903, 1, 'Shoulders (Strip Wax)', 86, '', 'M', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(904, 1, 'Shoulders + Neck (Strip Wax)', 86, '', 'M', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(905, 1, 'Top 1/4 Arms (Strip Wax)', 86, '', 'M', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(906, 1, 'Full Back + Chest (Strip Wax)', 86, '', 'M', 'Regular Strip Wax', '0', 0, '0', 55, 0, 0, '55', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(907, 1, 'Full Arms (Strip Wax)', 86, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(908, 1, 'Eyebrows Shaping  (Hot Wax)', 87, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(909, 1, 'Upper Lips  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '5', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(910, 1, 'Lower Lips  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 7, 0, 0, '5', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(911, 1, 'Chin Only  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(912, 1, 'Chin Extended to Neck  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(913, 1, 'Sides  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(914, 1, 'Cheeks  (Hot Wax)', 87, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '5', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(915, 1, 'Back of the Neck  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(916, 1, 'Jawline  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '5', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(917, 1, 'Nose (Inside Only)  (Hot Wax)', 87, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(918, 1, 'Ear (Out Side Only)  (Hot Wax)', 87, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(919, 1, 'Nose (Top Only)  (Hot Wax)', 87, '', '', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '6', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(920, 1, 'Forehead  (Hot Wax)', 87, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '8', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(921, 1, 'Full Face (Icludes Eyebrows Threading)  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 32, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(922, 1, 'Full Face & Neck (Including Eyebrows Threading)  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 42, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(923, 1, 'Under Arms  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 15, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(924, 1, 'Bikini Line (Thigh Not Included)  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 12, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(925, 1, 'Deep Bikini Line  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(926, 1, 'Brazillian  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 30, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(927, 1, 'Hollywood  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 40, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(928, 1, 'Buttocks  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(929, 1, 'Perianal Only  (Hot Wax)', 87, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 10, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(930, 1, 'Mini Manicure (extra ?5 for french tips)', 88, '', '', 'Manicure/Pedicure', '1', 0, '0', 12, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(931, 1, 'Mini Pedicure(extra ?5 for french tips)', 88, '', '', 'Manicure/Pedicure', '1', 0, '0', 12, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(932, 1, 'Spa Manicure(extra ?5 for french tips)', 88, '', '', 'Manicure/Pedicure', '0', 0, '0', 22, 0, 0, '35', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(933, 1, 'Spa Manicure with Mud/Paraffin Mask(extra ?5 for french tips)', 88, '', '', 'Manicure/Pedicure', '0', 0, '0', 30, 0, 0, '35', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(934, 1, 'Spa Pedicure(extra ?5 for french tips)', 88, '', '', 'Manicure/Pedicure', '0', 0, '0', 29, 0, 0, '35', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(935, 1, 'Spa Pedicure with Mud/Paraffin Mask(extra ?5 for french tips)', 88, '', '', 'Manicure/Pedicure', '0', 0, '0', 36, 0, 0, '35', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(936, 1, 'New-Callus Peel Treatment', 88, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(937, 1, 'Shellac/OPI Polsih (Includes File & Buff)(extra ?5 for french tips)', 89, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 25, 0, 0, '40', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(938, 1, 'Shellac/OPI French Polish (Includes Files & Buff)(extra ?5 for french tips)', 89, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 30, 0, 0, '40', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(939, 1, 'Shellac/OPI with Spa Pedicure (?5 Extra for French Polish)', 89, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 45, 0, 0, '40', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(940, 1, 'Shellac/OPI with Spa Manicure (?5 Extra for French Polish)', 89, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 40, 0, 0, '40', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(941, 1, 'Shellac/OPI Removal and Re-application (?5 extra for French Polish)', 89, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 32, 0, 0, '40', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(942, 1, 'Shellac/OPI Removal Only', 89, '', 'F', 'Shellac/OPI Gel Polish', '1', 0, '0', 10, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(943, 1, 'Swedish Body Massage', 90, '', '', 'Massages', '0', 0, '0', 50, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(944, 1, 'Full Body Massage with Aroma Therapu', 90, '', '', 'Massages', '0', 0, '0', 55, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(945, 1, 'Back Massage with Aroma Therapy', 90, '', '', 'Massages', '0', 0, '0', 35, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(946, 1, 'Indian Head, Neck and Shoulder Massage', 90, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(947, 1, 'Leg or Arm Massage', 90, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(948, 1, 'Full Body Mineral Salt Scrub Therapy', 91, '', '', 'Body Therapies', '0', 0, '0', 40, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(949, 1, 'Back Cleanse Treatment', 91, '', '', 'Body Therapies', '0', 0, '0', 35, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(950, 1, 'Elemis Pro-Collagen Age Defy', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 99, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(951, 1, 'Elemis Pro-Collagen Definition Lift and Contour', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 99, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(952, 1, 'Elemis Dynamic Resurfacing Precision Peel', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 99, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(953, 1, 'Elemis Peptide 24/7 Skin Sync', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 90, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(954, 1, 'Elemis Superfood Pro-Radiance', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 95, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(955, 1, 'Elemis Sensitive Skin Soother', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 80, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(956, 1, 'Elemis Anti-Blemish Mattify and Calm', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 80, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(957, 1, 'Elemis Biotec Line Eraser', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(958, 1, 'Elmis Biotec 24/7 Sync', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(959, 1, 'Elemis Biotex Firm-A-Lift', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(960, 1, 'Elemis Biotex Anti-Pigment Brightener', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(961, 1, 'Elemis Biotec Skin Resurfacer', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(962, 1, 'Elemis Biotec Radiance Renew', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(963, 1, 'Elemis Biotec Blemish Control', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(964, 1, 'Elemis Biotec Sensitive Skin Soother', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(965, 1, 'Elem is Biotec Super-Charger For Men', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(966, 1, 'Elemis Biotec Eye Treatment', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(967, 1, 'Elemis Biotec Neck Treatment', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(968, 1, 'Elemis Couture Technology', 92, '', '', 'Elemis Skin Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(969, 1, 'Pro Skin 30', 93, '', '', 'Dermalogica Treatments', '0', 0, '0', 35, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(970, 1, 'Pro Skin 60', 93, '', '', 'Dermalogica Treatments', '0', 0, '0', 65, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(971, 1, 'Pro Power Peel 30', 93, '', '', 'Dermalogica Treatments', '0', 0, '0', 70, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(972, 1, 'Pro Power Peel 60', 93, '', '', 'Dermalogica Treatments', '0', 0, '0', 120, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(973, 1, 'The Frozen Facial', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 100, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(974, 1, 'H20 Glow', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 95, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(975, 1, 'COMCIT Elite', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(976, 1, 'Crystal Clear Microdermabrasion Only', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 55, 0, 0, '40', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(977, 1, 'Deluxe MDA Facial with Mini Lift Mask', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 65, 0, 0, '50', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(978, 1, 'Deluxe MDA Facial with Mini Lift Mask, Steam and Extraction', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 75, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(979, 1, 'Deluxe MDA Facial with OXYGEN INFUSION', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 90, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(980, 1, 'Back', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 60, 0, 0, '45', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(981, 1, 'Half Back', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 40, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(982, 1, 'Half Legs', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 40, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(983, 1, 'Half Arms', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 40, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(984, 1, 'Hands', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 40, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(985, 1, 'Crystal Clear Micro Dermabrasion + Dermalogica Facial', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 90, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(986, 1, 'Cystal Clear Micro Dermabrasion with Elemis Facial', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 110, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(987, 1, '3D Hydro2 30 Min Express Treatment', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 45, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(988, 1, '3D Hydro2 60 Min Express Treatment', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 99, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_services` (`tbl_services_id`, `tbl_services_user_id`, `tbl_services_name`, `tbl_services_type`, `tbl_services_image`, `tbl_services_for`, `tbl_services_description`, `tbl_services_enable_online`, `tbl_services_commission`, `tbl_services_status`, `tbl_services_retail_price`, `tbl_services_special_price`, `tbl_services_tax`, `tbl_services_duration_time`, `tbl_services_location_id`, `tbl_services_insertdate`, `tbl_services_updatedate`) VALUES
(989, 1, '3D Hydro2 90 Min Express Treatment', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 130, 0, 0, '90', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(990, 1, '3D Hifu Chin', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 149, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(991, 1, '3D Hifu Forehead', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 149, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(992, 1, '3D Crows Feet', 94, '', 'F', 'Advanced Aesthetics Treatments', '0', 0, '0', 99, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(993, 1, '3D Hifu Brows', 94, '', 'F', 'Advanced Aesthetics Treatments', '0', 0, '0', 99, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(994, 1, '3D Hifu Decollate', 94, '', 'F', 'Advanced Aesthetics Treatments', '0', 0, '0', 399, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(995, 1, '3D Hifu Neck', 94, '', 'F', 'Advanced Aesthetics Treatments', '0', 0, '0', 199, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(996, 1, '3D Hifu Neck & Jawline', 94, '', 'F', 'Advanced Aesthetics Treatments', '0', 0, '0', 349, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(997, 1, '3D Hifu Full Face', 94, '', 'F', 'Advanced Aesthetics Treatments', '0', 0, '0', 499, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(998, 1, '3d Hifu Full Face & Neck', 94, '', 'F', 'Advanced Aesthetics Treatments', '0', 0, '0', 699, 0, 0, '75', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(999, 1, '3D Hifu Full Face, Neck & Decollate', 94, '', 'F', 'Advanced Aesthetics Treatments', '0', 0, '0', 799, 0, 0, '90', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1000, 1, 'Radio Frequency with Collagen Mask', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 99, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1001, 1, 'Full Face Treatment', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 159, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1002, 1, 'Cryopen (Skin Tag Removal) 15 Min Treatment per session', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 60, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1003, 1, 'Thread Vain Removal 20 Min Treatment Per Session', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 99, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1004, 1, 'Female Hollywood 1 Session (+ Underarms Free)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 55, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1005, 1, 'Female 1/2 Legs, Hollywood 1 Session (+ Underarms Free)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 112, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1006, 1, 'Female Full Legs, Hollywood 1 Session (+ Underarms Free)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 127, 0, 0, '40', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1007, 1, 'Female 1/2 Arms, Hollywood 1 Session (+ Underarms Free)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 119, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1008, 1, 'Female Full Arms, Hollywood 1 Session (+ Underarms Free)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 149, 0, 0, '40', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1009, 1, 'Female Full Body 1 session (+Full Face Free)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 295, 0, 0, '75', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1010, 1, 'Lips', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 19, 0, 0, '5', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1011, 1, 'Nose', 95, '', '', 'Laser Hair Removal Treatment', '0', 0, '0', 20, 0, 0, '5', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1012, 1, 'Chin', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 25, 0, 0, '8', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1013, 1, 'Ears', 95, '', '', 'Laser Hair Removal Treatment', '0', 0, '0', 20, 0, 0, '8', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1014, 1, 'Lips + Chin', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 29, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1015, 1, 'Chin + Jawline', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 49, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1016, 1, 'Sides of Face', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 39, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1017, 1, 'Full Face', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 59, 0, 0, '17', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1018, 1, 'Face & Neck', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 79, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1019, 1, 'Facial Sculpting (Male)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 89, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1020, 1, 'Basic Bikini Line', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 25, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1021, 1, 'Hollywood (Female)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 55, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1022, 1, 'Anus', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 25, 0, 0, '12', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1023, 1, 'Buttocks', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 39, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1024, 1, '1/2 Legs (Female)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 79, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1025, 1, '1/2 Les (Male)', 95, '', 'M', 'Laser Hair Removal Treatment', '0', 0, '0', 89, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1026, 1, 'Full Legs (Female)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 89, 0, 0, '35', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1027, 1, 'Feet and Toes', 95, '', '', 'Laser Hair Removal Treatment', '0', 0, '0', 32, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1028, 1, 'Under Arms', 95, '', '', 'Laser Hair Removal Treatment', '0', 0, '0', 29, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1029, 1, 'Neck (Front or Back)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 40, 0, 0, '8', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1030, 1, 'Hands and Fingers', 95, '', '', 'Laser Hair Removal Treatment', '0', 0, '0', 32, 0, 0, '8', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1031, 1, '1/2 Arms (Female)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 59, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1032, 1, '1/2 Arms (Male)', 95, '', 'M', 'Laser Hair Removal Treatment', '0', 0, '0', 72, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1033, 1, 'Full Arms (Female)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 69, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1034, 1, 'Full Arms (Male)', 95, '', 'M', 'Laser Hair Removal Treatment', '0', 0, '0', 83, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1035, 1, 'Lower Back (Female)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 55, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1036, 1, 'Lower Back (Male)', 95, '', 'M', 'Laser Hair Removal Treatment', '0', 0, '0', 73, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1037, 1, 'Full Back (Female)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 110, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1038, 1, 'Full Back (Male)', 95, '', 'M', 'Laser Hair Removal Treatment', '0', 0, '0', 129, 0, 0, '25', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1039, 1, 'Shoulders (Female)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 59, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1040, 1, 'Shoulders (Male)', 95, '', 'M', 'Laser Hair Removal Treatment', '0', 0, '0', 69, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1041, 1, 'Back and Shoulders (Female)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 103, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1042, 1, 'Back and Shoulders (Male)', 95, '', 'M', 'Laser Hair Removal Treatment', '0', 0, '0', 103, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1043, 1, 'Chest (Female)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 79, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1044, 1, 'Chest (Male)', 95, '', 'M', 'Laser Hair Removal Treatment', '0', 0, '0', 79, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1045, 1, 'Stomach (Female)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 72, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1046, 1, 'Stomach (Male)', 95, '', 'M', 'Laser Hair Removal Treatment', '0', 0, '0', 82, 0, 0, '20', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1047, 1, 'Chest & Stomach (Female)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 119, 0, 0, '45', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1048, 1, 'Chest & Stomach (Male)', 95, '', 'M', 'Laser Hair Removal Treatment', '0', 0, '0', 103, 0, 0, '45', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1049, 1, 'Belly Line', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 9, 0, 0, '15', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1050, 1, 'Areola (Nippple)', 95, '', 'F', 'Laser Hair Removal Treatment', '0', 0, '0', 25, 0, 0, '10', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1051, 1, '3D Lipo Fat Freezing (Cryolipolysis)1 Area/Per Head (ask for package)', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 150, 0, 0, '45', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1052, 1, '3D Lipo Fat Freezing (Cryolipolysis)2  Areas/Per Head (ask for package)', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 200, 0, 0, '45', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1053, 1, '3D Lipo Body Contouring and Inch Loss 1 Treatment (ask for package)', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 125, 0, 0, '60', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1054, 1, '3D Lipo Arm Tightening 1 Treatment (ask for package)', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 100, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1055, 1, '3D Lipo Bum Lift 1 Treatment (ask for package)', 94, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 150, 0, 0, '30', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1056, 1, 'Eyebrows Shaping (Threading)', 96, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '5', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1057, 1, 'Middle of the Brows (Threading)', 96, '', '', 'Threading', '1', 0, '0', 2, 0, 0, '3', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1058, 1, 'Upper Lips (Threading)', 96, '', 'F', 'Threading', '1', 0, '0', 2.5, 0, 0, '4', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1059, 1, 'Lower Lips (Threading)', 96, '', 'F', 'Threading', '1', 0, '0', 2, 0, 0, '4', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1060, 1, 'Chin Only (Threading)', 96, '', 'F', 'Threading', '1', 0, '0', 4, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1061, 1, 'Chin Extended to Neck (Threading)', 96, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1062, 1, 'Jaw Line (Threading)', 96, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1063, 1, 'Sides (Threading)', 96, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1064, 1, 'Cheeks (Threading)', 96, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '8', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1065, 1, 'Forehead (Threading)', 96, '', '', 'Threading', '1', 0, '0', 4, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1066, 1, 'Neck (Threading)', 96, '', 'F', 'Threading', '1', 0, '0', 5, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1067, 1, 'Full Face (Threading)', 96, '', 'F', 'Threading', '1', 0, '0', 16, 0, 0, '20', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1068, 1, 'Full Face & Neck (Threading)', 96, '', 'F', 'Threading', '1', 0, '0', 20, 0, 0, '25', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1069, 1, 'Eyebrows Tint', 97, '', '', 'Tinting', '1', 0, '0', 7, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1070, 1, 'Eyelash Tint', 97, '', '', 'Tinting', '1', 0, '0', 12, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1071, 1, 'Eyebrows & Eyelashed Tint', 97, '', '', 'Tinting', '1', 0, '0', 15, 0, 0, '15', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1072, 1, 'Full Set Cluster Lashes', 98, '', 'F', 'Lashes', '0', 0, '0', 30, 0, 0, '45', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1073, 1, 'Extend individual Lashes Full Set', 98, '', 'F', 'Lashes', '0', 0, '0', 75, 0, 0, '60', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1074, 1, 'Extend individual Lashes Half Set', 98, '', 'F', 'Lashes', '0', 0, '0', 60, 0, 0, '40', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1075, 1, 'Lash Removal', 98, '', 'F', 'Lashes', '1', 0, '0', 12, 0, 0, '25', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1076, 1, 'LVL (Eyelash Lift)', 98, '', 'F', 'Lashes', '0', 0, '0', 50, 0, 0, '45', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1077, 1, 'High Definition Brows Full Treatment', 99, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1078, 1, 'High Definition Tint Only', 99, '', '', 'BROWS', '0', 0, '0', 15, 0, 0, '15', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1079, 1, 'High Definition Lash Tint', 99, '', '', 'BROWS', '0', 0, '0', 20, 0, 0, '15', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1080, 1, 'Henna Brows', 99, '', '', 'BROWS', '0', 0, '0', 35, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1081, 1, 'Eyebrows Shaping (Strip Wax)', 100, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '5', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1082, 1, 'Middle of the Brows (Strip Wax)', 100, '', '', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '3', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1083, 1, 'Upper Lips (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '1', 0, '0', 3, 0, 0, '4', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1084, 1, 'Lower Lips (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '1', 0, '0', 2.5, 0, 0, '4', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1085, 1, 'Chin Only (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '1', 0, '0', 5, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1086, 1, 'Chin Extended to Neck (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '1', 0, '0', 7.5, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1087, 1, 'Jaw Line (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6.5, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1088, 1, 'Sides (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1089, 1, 'Cheeks (Strip Wax)', 100, '', '', 'Regular Strip Wax', '1', 0, '0', 5, 0, 0, '8', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1090, 1, 'Forehead (Strip Wax)', 100, '', '', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1091, 1, 'Neck (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1092, 1, 'Full Face (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '1', 0, '0', 18, 0, 0, '20', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1093, 1, 'Full Face & Neck  (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '1', 0, '0', 22, 0, 0, '25', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1094, 1, 'Nose (Inside Only)  (Strip Wax)', 100, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1095, 1, 'Nose (Top Only) (Strip Wax)', 100, '', '', 'Regular Strip Wax', '1', 0, '0', 6, 0, 0, '5', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1096, 1, 'Ear Strip Wax (No Inside) (Strip Wax)', 100, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '8', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1097, 1, 'Knuckles (Strip Wax)', 100, '', '', 'Regular Strip Wax', '1', 0, '0', 4, 0, 0, '6', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1098, 1, 'Hand (Strip Wax)', 100, '', '', 'Regular Strip Wax', '1', 0, '0', 8, 0, 0, '6', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1099, 1, 'Back of The Neck (Strip Wax)', 100, '', '', 'Regular Strip Wax', '1', 0, '0', 10, 0, 0, '8', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1100, 1, 'Full Arms (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12.5, 0, 0, '20', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1101, 1, 'Half Arms (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 8, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1102, 1, '3/4 Arms (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 10, 0, 0, '15', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1103, 1, 'Chest Wax (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1104, 1, 'Under Arms or Bikini Line (Thigh not included) (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '1', 0, '0', 5, 0, 0, '8', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1105, 1, 'Full Legs (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '25', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1106, 1, 'Top Half Legs (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 14.5, 0, 0, '22', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1107, 1, 'Bottom Half Legs (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12.5, 0, 0, '15', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1108, 1, '3/4 Legs (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '20', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1109, 1, 'Deep Bikini Line (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 10, 0, 0, '15', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1110, 1, 'Brazilian (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 15, 0, 0, '20', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1111, 1, 'Hollywood (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '25', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1112, 1, 'Buttocks (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '15', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1113, 1, 'Perianal Only (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 5, 0, 0, '8', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1114, 1, 'Full Stomach OR Full Back (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 18, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1115, 1, 'Half Stomach OR Half Back (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '20', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1116, 1, 'Full Stomach AND Full Back (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 33, 0, 0, '45', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1117, 1, 'Full Waxing (Not Breakable) (Includes F/Arms, F/Legs, U/Arms, B/Line) (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 40, 0, 0, '35', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1118, 1, 'Full Body Waxing (Not Breakable) (F/Arms, F/Legs, U/Arms, B/Line, F/Stomach & F/Back) (Strip Wax)', 100, '', 'F', 'Regular Strip Wax', '0', 0, '0', 65, 0, 0, '65', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1119, 1, 'Full Back (Strip Wax)', 100, '', 'M', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1120, 1, '1/4 Back (Strip Wax)', 100, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '15', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1121, 1, 'Chest Wax (Strip Wax)', 100, '', 'M', 'Regular Strip Wax', '0', 0, '0', 22, 0, 0, '25', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1122, 1, 'Stomach (Strip Wax)', 100, '', 'M', 'Regular Strip Wax', '0', 0, '0', 17, 0, 0, '15', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1123, 1, 'Shoulders (Strip Wax)', 100, '', 'M', 'Regular Strip Wax', '0', 0, '0', 12, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1124, 1, 'Shoulders + Neck (Strip Wax)', 100, '', 'M', 'Regular Strip Wax', '0', 0, '0', 20, 0, 0, '15', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1125, 1, 'Top 1/4 Arms (Strip Wax)', 100, '', 'M', 'Regular Strip Wax', '0', 0, '0', 16, 0, 0, '20', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1126, 1, 'Full Back + Chest (Strip Wax)', 100, '', 'M', 'Regular Strip Wax', '0', 0, '0', 55, 0, 0, '55', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1127, 1, 'Full Arms (Strip Wax)', 100, '', 'M', 'Regular Strip Wax', '0', 0, '0', 25, 0, 0, '25', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1128, 1, 'Eyebrows Shaping  (Hot Wax)', 101, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1129, 1, 'Upper Lips  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '5', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1130, 1, 'Lower Lips  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 7, 0, 0, '5', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1131, 1, 'Chin Only  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1132, 1, 'Chin Extended to Neck  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1133, 1, 'Sides  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1134, 1, 'Cheeks  (Hot Wax)', 101, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '5', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1135, 1, 'Back of the Neck  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1136, 1, 'Jawline  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '5', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1137, 1, 'Nose (Inside Only)  (Hot Wax)', 101, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1138, 1, 'Ear (Out Side Only)  (Hot Wax)', 101, '', '', 'Lycon Hot Wax', '1', 0, '0', 12, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1139, 1, 'Nose (Top Only)  (Hot Wax)', 101, '', '', 'Lycon Hot Wax', '1', 0, '0', 8, 0, 0, '6', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1140, 1, 'Forehead  (Hot Wax)', 101, '', '', 'Lycon Hot Wax', '1', 0, '0', 10, 0, 0, '8', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1141, 1, 'Full Face (Icludes Eyebrows Threading)  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 32, 0, 0, '25', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1142, 1, 'Full Face & Neck (Including Eyebrows Threading)  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 42, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1143, 1, 'Under Arms  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '1', 0, '0', 15, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1144, 1, 'Bikini Line (Thigh Not Included)  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 12, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1145, 1, 'Deep Bikini Line  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '15', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1146, 1, 'Brazillian  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 30, 0, 0, '20', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1147, 1, 'Hollywood  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 40, 0, 0, '25', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1148, 1, 'Buttocks  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 20, 0, 0, '20', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1149, 1, 'Perianal Only  (Hot Wax)', 101, '', 'F', 'Lycon Hot Wax', '0', 0, '0', 10, 0, 0, '10', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1150, 1, 'Mini Manicure (extra ?5 for french tips)', 102, '', '', 'Manicure/Pedicure', '1', 0, '0', 10, 0, 0, '20', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1151, 1, 'Mini Pedicure(extra ?5 for french tips)', 102, '', '', 'Manicure/Pedicure', '1', 0, '0', 10, 0, 0, '20', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1152, 1, 'Spa Manicure(extra ?5 for french tips)', 102, '', '', 'Manicure/Pedicure', '0', 0, '0', 20, 0, 0, '35', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1153, 1, 'Spa Manicure with Mud/Paraffin Mask(extra ?5 for french tips)', 102, '', '', 'Manicure/Pedicure', '0', 0, '0', 28, 0, 0, '35', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1154, 1, 'Spa Pedicure(extra ?5 for french tips)', 102, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '35', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1155, 1, 'Spa Pedicure with Mud/Paraffin Mask(extra ?5 for french tips)', 102, '', '', 'Manicure/Pedicure', '0', 0, '0', 32, 0, 0, '35', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1156, 1, 'New-Callus Peel Treatment', 102, '', '', 'Manicure/Pedicure', '0', 0, '0', 25, 0, 0, '25', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1157, 1, 'Shellac/OPI Polsih (Includes File & Buff)(extra ?5 for french tips)', 103, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 25, 0, 0, '40', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1158, 1, 'Shellac/OPI French Polish (Includes Files & Buff)(extra ?5 for french tips)', 103, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 30, 0, 0, '40', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1159, 1, 'Shellac/OPI with Spa Pedicure (?5 Extra for French Polish)', 103, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 45, 0, 0, '40', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1160, 1, 'Shellac/OPI with Spa Manicure (?5 Extra for French Polish)', 103, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 40, 0, 0, '40', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1161, 1, 'Shellac/OPI Removal and Re-application (?5 extra for French Polish)', 103, '', 'F', 'Shellac/OPI Gel Polish', '0', 0, '0', 32, 0, 0, '40', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1162, 1, 'Shellac/OPI Removal Only', 103, '', 'F', 'Shellac/OPI Gel Polish', '1', 0, '0', 10, 0, 0, '20', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1163, 1, 'Swedish Body Massage', 104, '', '', 'Massages', '0', 0, '0', 50, 0, 0, '60', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1164, 1, 'Full Body Massage with Aroma Therapu', 104, '', '', 'Massages', '0', 0, '0', 55, 0, 0, '60', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1165, 1, 'Back Massage with Aroma Therapy', 104, '', '', 'Massages', '0', 0, '0', 35, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1166, 1, 'Indian Head, Neck and Shoulder Massage', 104, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1167, 1, 'Leg or Arm Massage', 104, '', '', 'Massages', '0', 0, '0', 30, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1168, 1, 'Full Body Mineral Salt Scrub Therapy', 105, '', '', 'Body Therapies', '0', 0, '0', 35, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1169, 1, 'Back Cleanse Treatment', 105, '', '', 'Body Therapies', '0', 0, '0', 30, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1170, 1, 'Adorn Skin Whitening', 106, '', '', 'Classic Facials', '0', 0, '0', 40, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1171, 1, 'Skin Hydrating Collagen Facial Treatment', 106, '', '', 'Classic Facials', '0', 0, '0', 40, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1172, 1, 'Skin Refining & Re-Balancing Facial Treatment', 106, '', '', 'Classic Facials', '0', 0, '0', 40, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1173, 1, 'Vital Eye Treatment', 106, '', '', 'Classic Facials', '0', 0, '0', 22, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1174, 1, 'Deep Cleansing Facial', 106, '', '', 'Classic Facials', '0', 0, '0', 30, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1175, 1, 'Dermalogica Express Facial', 107, '', '', 'Dermalogica Treatments', '0', 0, '0', 35, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1176, 1, 'Dermalogica Prescreptive Facial', 107, '', '', 'Dermalogica Treatments', '0', 0, '0', 55, 0, 0, '60', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1177, 1, 'Dermalogica Teenage Facial', 107, '', '', 'Dermalogica Treatments', '0', 0, '0', 35, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1178, 1, 'Dermalogica Men\'s Facial', 107, '', '', 'Dermalogica Treatments', '0', 0, '0', 50, 0, 0, '60', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1179, 1, 'Dermalogica Pro Power Peel Treatment 30 minutes', 107, '', '', 'Dermalogica Treatments', '0', 0, '0', 70, 0, 0, '30', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1180, 1, 'Dermalogica Pro Power Peel Treatment 60 minutes', 107, '', '', 'Dermalogica Treatments', '0', 0, '0', 120, 0, 0, '60', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1181, 1, 'Diamond Peel Dermabrasion with Dermalogica Facial', 108, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 80, 0, 0, '60', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1182, 1, 'Diamond Peel Dermabrasion with Steam & Extraction', 108, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 65, 0, 0, '60', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1183, 1, 'Oxygen Therapy & Diamond Peel Dermabrasion', 108, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 90, 0, 0, '60', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1184, 1, 'Oxygen Therapy', 108, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 55, 0, 0, '40', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1185, 1, 'Oxygen Therapy with Ultrasonic Peel', 108, '', '', 'Advanced Aesthetics Treatments', '0', 0, '0', 85, 0, 0, '60', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service_package`
--

DROP TABLE IF EXISTS `tbl_service_package`;
CREATE TABLE `tbl_service_package` (
  `tbl_service_package_id` int(11) NOT NULL,
  `tbl_service_package_user_id` int(11) NOT NULL,
  `tbl_service_package_unique_id` varchar(50) NOT NULL,
  `tbl_service_package_service_id` varchar(50) NOT NULL,
  `tbl_service_package_name` varchar(100) NOT NULL,
  `tbl_service_package_price` float NOT NULL,
  `tbl_service_package_special_price` float NOT NULL,
  `tbl_service_package_description` varchar(256) NOT NULL,
  `tbl_service_package_special_note` varchar(256) NOT NULL,
  `tbl_service_package_months` int(11) NOT NULL,
  `tbl_service_package_image` varchar(256) NOT NULL,
  `tbl_service_package_status` enum('1','0') NOT NULL COMMENT '1-expired, 0-not_expired',
  `tbl_service_package_location_id` int(11) NOT NULL,
  `tbl_service_package_insertdate` datetime NOT NULL,
  `tbl_service_package_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_service_package`
--

INSERT INTO `tbl_service_package` (`tbl_service_package_id`, `tbl_service_package_user_id`, `tbl_service_package_unique_id`, `tbl_service_package_service_id`, `tbl_service_package_name`, `tbl_service_package_price`, `tbl_service_package_special_price`, `tbl_service_package_description`, `tbl_service_package_special_note`, `tbl_service_package_months`, `tbl_service_package_image`, `tbl_service_package_status`, `tbl_service_package_location_id`, `tbl_service_package_insertdate`, `tbl_service_package_updatedate`) VALUES
(1, 1, 'test55302', '1', 'test', 700, 500, 'This is for testing', 'nothing', 3, 'logo.png', '0', 0, '2020-06-13 17:13:05', '2020-06-13 11:43:05'),
(2, 1, 'VLCC Facial Package12380', '1,2', 'VLCC Facial Package', 3000, 2000, '', 'This is for demo', 6, '', '0', 0, '2020-06-19 11:17:23', '2020-06-19 05:47:23'),
(3, 4, 'demo52709', '1,2,3,6', 'demo', 500, 200, '', '', 2, '', '1', 1, '2020-07-02 18:39:45', '2020-07-02 13:09:45'),
(4, 4, 'demo62034', '1236,1241,1242', 'demo', 5, 0, '<p><br></p>', '', 2, '', '0', 1, '2020-07-08 14:08:21', '2020-07-08 13:08:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service_types`
--

DROP TABLE IF EXISTS `tbl_service_types`;
CREATE TABLE `tbl_service_types` (
  `tbl_service_types_id` int(11) NOT NULL,
  `tbl_service_types_types` varchar(256) NOT NULL,
  `tbl_service_types_description` text NOT NULL,
  `tbl_service_types_location_id` int(11) NOT NULL,
  `tbl_service_types_status` enum('1','0') NOT NULL COMMENT '1-Active, 0-Inactive',
  `tbl_service_types_insertdate` datetime NOT NULL,
  `tbl_service_types_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_service_types`
--

INSERT INTO `tbl_service_types` (`tbl_service_types_id`, `tbl_service_types_types`, `tbl_service_types_description`, `tbl_service_types_location_id`, `tbl_service_types_status`, `tbl_service_types_insertdate`, `tbl_service_types_updatedate`) VALUES
(1, 'Threading', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Tinting', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Lashes', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'BROWS', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Regular Strip Wax', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Lycon Hot Wax', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Manicure/Pedicure', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Shellac/OPI Gel Polish', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Massages', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Body Therapies', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Classic Facials', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Dermalogica Treatments', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Advanced Aesthetics Treatments', '', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Threading', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Tinting', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Lashes', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'BROWS', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Regular Strip Wax', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Lycon Hot Wax', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Manicure/Pedicure', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Shellac/OPI Gel Polish', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Massages', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Body Therapies', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Elemis Skin Treatments', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Dermalogica Treatments', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Advanced Aesthetics Treatments', '', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Threading', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Tinting', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Lashes', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'BROWS', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Regular Strip Wax', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Lycon Hot Wax', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'Manicure/Pedicure', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Shellac/OPI Gel Polish', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Massages', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Body Therapies', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Elemis Skin Treatments', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Dermalogica Treatments', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'Advanced Aesthetics Treatments', '', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'Threading', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'Tinting', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Lashes', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'BROWS', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'Regular Strip Wax', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'Lycon Hot Wax', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'Manicure/Pedicure', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'Shellac/OPI Gel Polish', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'Massages', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'Body Therapies', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'Wash & Cut', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'Wash & Blow-Dry', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'Wash, Cut & Blow-Dry', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'Cut', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'Colors', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'Hair Styling', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'Hair Treatment', '', 4, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'Threading', '', 6, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'Tinting', '', 6, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'Lashes', '', 6, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'BROWS', '', 6, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'Regular Strip Wax', '', 6, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'Lycon Hot Wax', '', 6, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'Manicure/Pedicure', '', 6, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'Shellac/OPI Gel Polish', '', 6, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'Massages', '', 6, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'Body Therapies', '', 6, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'Elemis Skin Treatments', '', 6, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'Dermalogica Treatments', '', 6, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'Threading', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'Tinting', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'Lashes', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'BROWS', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'Regular Strip Wax', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Lycon Hot Wax', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'Manicure/Pedicure', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'Shellac/OPI Gel Polish', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'Massages', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'Body Therapies', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'Classic Facials', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'Dermalogica Treatments', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'Advanced Aesthetics Treatments', '', 7, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'Threading', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'Tinting', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'Lashes', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'BROWS', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'Regular Strip Wax', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'Lycon Hot Wax', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'Manicure/Pedicure', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'Shellac/OPI Gel Polish', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'Massages', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'Body Therapies', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'Elemis Skin Treatments', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Dermalogica Treatments', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Advanced Aesthetics Treatments', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'Laser Hair Removal Treatment', '', 8, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Threading', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'Tinting', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'Lashes', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'BROWS', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'Regular Strip Wax', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'Lycon Hot Wax', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'Manicure/Pedicure', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'Shellac/OPI Gel Polish', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'Massages', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'Body Therapies', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'Classic Facials', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'Dermalogica Treatments', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'Advanced Aesthetics Treatments', '', 9, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

DROP TABLE IF EXISTS `tbl_staff`;
CREATE TABLE `tbl_staff` (
  `tbl_staff_id` int(11) NOT NULL,
  `tbl_staff_user_id` int(11) NOT NULL,
  `tbl_staff_unique_id` int(11) NOT NULL,
  `tbl_staff_first_name` varchar(100) NOT NULL,
  `tbl_staff_last_name` varchar(100) NOT NULL,
  `tbl_staff_email` varchar(256) NOT NULL,
  `tbl_staff_mobile` varchar(20) DEFAULT NULL,
  `tbl_staff_telephone` varchar(20) DEFAULT NULL,
  `tbl_staff_type` int(11) NOT NULL,
  `tbl_staff_image` varchar(256) NOT NULL,
  `tbl_staff_emmergency_name` varchar(100) NOT NULL,
  `tbl_staff_emmergency_relation` varchar(100) NOT NULL,
  `tbl_staff_emmergency_contact` bigint(20) DEFAULT NULL,
  `tbl_staff_permission_rights` varchar(50) NOT NULL,
  `tbl_staff_enable_online_bookings` enum('1','0') NOT NULL COMMENT '1-yes, 0-no',
  `tbl_staff_start_date` date NOT NULL,
  `tbl_staff_end_date` date DEFAULT NULL,
  `tbl_staff_appointment_color_code` varchar(100) NOT NULL,
  `tbl_staff_service_commission` float DEFAULT NULL,
  `tbl_staff_product_commission` float DEFAULT NULL,
  `tbl_staff_voucher_commission` float DEFAULT NULL,
  `tbl_staff_break_time` varchar(256) NOT NULL,
  `tbl_staff_salary` float NOT NULL,
  `tbl_staff_password` varchar(256) NOT NULL,
  `tbl_staff_location_id` int(11) NOT NULL,
  `tbl_staff_status` enum('1','0') NOT NULL COMMENT '1-active, 0-inactive',
  `tbl_staff_insertdate` datetime NOT NULL,
  `tbl_staff_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`tbl_staff_id`, `tbl_staff_user_id`, `tbl_staff_unique_id`, `tbl_staff_first_name`, `tbl_staff_last_name`, `tbl_staff_email`, `tbl_staff_mobile`, `tbl_staff_telephone`, `tbl_staff_type`, `tbl_staff_image`, `tbl_staff_emmergency_name`, `tbl_staff_emmergency_relation`, `tbl_staff_emmergency_contact`, `tbl_staff_permission_rights`, `tbl_staff_enable_online_bookings`, `tbl_staff_start_date`, `tbl_staff_end_date`, `tbl_staff_appointment_color_code`, `tbl_staff_service_commission`, `tbl_staff_product_commission`, `tbl_staff_voucher_commission`, `tbl_staff_break_time`, `tbl_staff_salary`, `tbl_staff_password`, `tbl_staff_location_id`, `tbl_staff_status`, `tbl_staff_insertdate`, `tbl_staff_updatedate`) VALUES
(3, 4, 954822, 'Philips', 'Amber', 'philips@gmail.com', '9876543210', NULL, 1, '', '', '', NULL, '1', '0', '2020-06-19', '2020-06-01', '#71d0b0', NULL, NULL, NULL, '12:05 PM', 80000, 'welcome1', 1, '1', '2020-06-25 23:50:58', '2020-06-25 18:20:58'),
(4, 4, 594058, 'Aden', 'Linkan', 'aden123@gmail.com', '9876543100', NULL, 1, '', '', '', NULL, '1', '1', '2020-06-04', '2020-06-27', '#ee5391', NULL, NULL, NULL, '01:45 PM', 45000, 'vuc$pHBtc<t', 1, '1', '2020-06-25 23:52:22', '2020-06-25 18:22:22'),
(5, 4, 270268, 'Gill', 'Avery', 'gillavery1@gmail.com', '9808765687', NULL, 1, '', '', '', NULL, '1', '1', '2020-08-12', '2020-11-30', '#cae273', NULL, NULL, NULL, '02:19 PM', 20000, 'gO2#9KLxqb%', 1, '1', '2020-06-25 23:54:17', '2020-06-25 18:24:17'),
(6, 4, 843779, 'Barbie', 'Doll', 'barbiee@gmail.com', '9876543210', NULL, 1, '', '', '', NULL, '1', '1', '2020-06-20', '2020-10-31', '#39b18d', NULL, NULL, NULL, '01:55 PM', 90000, 'passwordnull', 1, '0', '2020-06-25 23:56:54', '2020-06-25 18:26:54'),
(7, 4, 980704, 'Amber', 'parekh', 'amber@gmail.com', '9913692942', NULL, 1, '', '', '', NULL, '1', '1', '2020-06-04', '2020-06-02', '#d4b3df', NULL, NULL, NULL, '12:00 PM', 67000, 'vuc$pHBtc<t', 1, '1', '2020-06-26 22:00:51', '2020-06-26 16:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff_services`
--

DROP TABLE IF EXISTS `tbl_staff_services`;
CREATE TABLE `tbl_staff_services` (
  `tbl_staff_services_id` int(11) NOT NULL,
  `tbl_staff_services_user_id` int(11) NOT NULL,
  `tbl_staff_services_staff_id` int(11) NOT NULL,
  `tbl_staff_services_service_id` int(11) NOT NULL,
  `tbl_staff_services_location_id` int(11) NOT NULL,
  `tbl_staff_services_status` enum('1','0') NOT NULL COMMENT '1-active, 0-inactive',
  `tbl_staff_services_insertdate` datetime NOT NULL,
  `tbl_staff_services_updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_staff_services`
--

INSERT INTO `tbl_staff_services` (`tbl_staff_services_id`, `tbl_staff_services_user_id`, `tbl_staff_services_staff_id`, `tbl_staff_services_service_id`, `tbl_staff_services_location_id`, `tbl_staff_services_status`, `tbl_staff_services_insertdate`, `tbl_staff_services_updatedate`) VALUES
(32, 4, 6, 3, 1, '1', '2020-06-26 23:28:37', '2020-06-26 17:58:37'),
(33, 4, 6, 4, 1, '1', '2020-06-26 23:28:37', '2020-06-26 17:58:37'),
(34, 4, 6, 5, 1, '1', '2020-06-26 23:28:37', '2020-06-26 17:58:37'),
(35, 4, 3, 1, 1, '1', '2020-07-01 16:56:47', '2020-07-01 11:26:47'),
(36, 4, 3, 2, 1, '1', '2020-07-01 16:56:47', '2020-07-01 11:26:47'),
(37, 4, 3, 3, 1, '1', '2020-07-01 16:56:47', '2020-07-01 11:26:47'),
(38, 4, 3, 4, 1, '1', '2020-07-01 16:56:47', '2020-07-01 11:26:47'),
(39, 4, 5, 10, 1, '1', '2020-07-01 17:16:50', '2020-07-01 11:46:50'),
(40, 4, 5, 11, 1, '1', '2020-07-01 17:16:50', '2020-07-01 11:46:50'),
(41, 4, 5, 12, 1, '1', '2020-07-01 17:16:50', '2020-07-01 11:46:50'),
(42, 4, 5, 13, 1, '1', '2020-07-01 17:16:50', '2020-07-01 11:46:50'),
(44, 4, 4, 7, 1, '1', '2020-07-01 17:17:19', '2020-07-01 11:47:19'),
(45, 4, 4, 6, 1, '1', '2020-07-01 17:17:19', '2020-07-01 11:47:19'),
(46, 4, 4, 8, 1, '1', '2020-07-01 17:17:19', '2020-07-01 11:47:19'),
(47, 4, 4, 7, 1, '1', '2020-07-01 17:17:19', '2020-07-01 11:47:19'),
(48, 4, 4, 9, 1, '1', '2020-07-01 17:17:19', '2020-07-01 11:47:19'),
(49, 4, 4, 8, 1, '1', '2020-07-01 17:17:19', '2020-07-01 11:47:19'),
(50, 4, 4, 10, 1, '1', '2020-07-01 17:17:19', '2020-07-01 11:47:19'),
(51, 4, 4, 9, 1, '1', '2020-07-01 17:17:19', '2020-07-01 11:47:19'),
(52, 4, 4, 10, 1, '1', '2020-07-01 17:17:19', '2020-07-01 11:47:19'),
(65, 1, 7, 1, 1, '1', '2020-07-07 19:42:53', '2020-07-07 14:12:53'),
(66, 1, 7, 2, 1, '1', '2020-07-07 19:42:53', '2020-07-07 14:12:53'),
(67, 1, 7, 3, 1, '1', '2020-07-07 19:42:53', '2020-07-07 14:12:53'),
(68, 1, 7, 10, 1, '1', '2020-07-07 19:42:54', '2020-07-07 14:12:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_appointment`
--
ALTER TABLE `tbl_appointment`
  ADD PRIMARY KEY (`tbl_appointment_id`);

--
-- Indexes for table `tbl_clients`
--
ALTER TABLE `tbl_clients`
  ADD PRIMARY KEY (`tbl_clients_id`);

--
-- Indexes for table `tbl_consultationform_data`
--
ALTER TABLE `tbl_consultationform_data`
  ADD PRIMARY KEY (`tbl_consultationform_data_id`);

--
-- Indexes for table `tbl_consultation_form`
--
ALTER TABLE `tbl_consultation_form`
  ADD PRIMARY KEY (`tbl_consultation_form_id`);

--
-- Indexes for table `tbl_country_code`
--
ALTER TABLE `tbl_country_code`
  ADD PRIMARY KEY (`tbl_country_code_id`);

--
-- Indexes for table `tbl_events`
--
ALTER TABLE `tbl_events`
  ADD PRIMARY KEY (`tbl_events_id`);

--
-- Indexes for table `tbl_group_appointment`
--
ALTER TABLE `tbl_group_appointment`
  ADD PRIMARY KEY (`tbl_group_appointment_id`);

--
-- Indexes for table `tbl_locations`
--
ALTER TABLE `tbl_locations`
  ADD PRIMARY KEY (`tbl_locations_id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`tbl_roles_id`);

--
-- Indexes for table `tbl_role_rights`
--
ALTER TABLE `tbl_role_rights`
  ADD PRIMARY KEY (`tbl_role_rights_id`);

--
-- Indexes for table `tbl_services`
--
ALTER TABLE `tbl_services`
  ADD PRIMARY KEY (`tbl_services_id`);

--
-- Indexes for table `tbl_service_package`
--
ALTER TABLE `tbl_service_package`
  ADD PRIMARY KEY (`tbl_service_package_id`);

--
-- Indexes for table `tbl_service_types`
--
ALTER TABLE `tbl_service_types`
  ADD PRIMARY KEY (`tbl_service_types_id`);

--
-- Indexes for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD PRIMARY KEY (`tbl_staff_id`);

--
-- Indexes for table `tbl_staff_services`
--
ALTER TABLE `tbl_staff_services`
  ADD PRIMARY KEY (`tbl_staff_services_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_appointment`
--
ALTER TABLE `tbl_appointment`
  MODIFY `tbl_appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `tbl_clients`
--
ALTER TABLE `tbl_clients`
  MODIFY `tbl_clients_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_consultation_form`
--
ALTER TABLE `tbl_consultation_form`
  MODIFY `tbl_consultation_form_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_country_code`
--
ALTER TABLE `tbl_country_code`
  MODIFY `tbl_country_code_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `tbl_events`
--
ALTER TABLE `tbl_events`
  MODIFY `tbl_events_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_group_appointment`
--
ALTER TABLE `tbl_group_appointment`
  MODIFY `tbl_group_appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_locations`
--
ALTER TABLE `tbl_locations`
  MODIFY `tbl_locations_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `tbl_roles_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_role_rights`
--
ALTER TABLE `tbl_role_rights`
  MODIFY `tbl_role_rights_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `tbl_services`
--
ALTER TABLE `tbl_services`
  MODIFY `tbl_services_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1186;

--
-- AUTO_INCREMENT for table `tbl_service_package`
--
ALTER TABLE `tbl_service_package`
  MODIFY `tbl_service_package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_service_types`
--
ALTER TABLE `tbl_service_types`
  MODIFY `tbl_service_types_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  MODIFY `tbl_staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_staff_services`
--
ALTER TABLE `tbl_staff_services`
  MODIFY `tbl_staff_services_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
