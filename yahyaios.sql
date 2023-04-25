-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2022 at 01:44 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yahyaios`
--

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `id` int(11) NOT NULL,
  `code` text COLLATE utf8_unicode_ci NOT NULL,
  `uuid` text COLLATE utf8_unicode_ci NOT NULL,
  `status` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `code_time` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `code_use` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `code_exp` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `codes`
--

INSERT INTO `codes` (`id`, `code`, `uuid`, `status`, `date`, `code_time`, `code_use`, `code_exp`) VALUES
(30, 'G08UG2K20338', 'mkmmkm', 'expired', '2022-01-18 15:53:46', '1m', '2022/01/18 16:07:53', '2022/02/17 16:07:53'),
(33, '0GP2B22G86AH', '', 'Activated', '2022-01-21 01:41:24', '1d', '2022/01/21 01:46:36', '2022/01/22 01:46:36'),
(34, 'P31U8AHC02G2', '', 'NotActivated', '2022-01-21 01:41:24', '1d', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'azoz', 'azoz@admin.com', 'd23158af210b329458d8441adb1ac2e0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `codes`
--
ALTER TABLE `codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
