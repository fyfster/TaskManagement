-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2016 at 08:13 PM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taskmanagement`
--
CREATE DATABASE IF NOT EXISTS `taskmanagement` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `taskmanagement`;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `description` varchar(500) COLLATE utf8_bin NOT NULL,
  `status` varchar(10) COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `description`, `status`, `date`) VALUES
(1, 'Primul task', 'nefacut', '2016-03-24'),
(2, 'Task nr 2', 'facut', '2016-03-02'),
(5, 'o descriere mai lunga pentru a vede tabel', 'nefacut', '2016-03-25'),
(6, '231321', 'facut', '2016-03-25'),
(7, '231321', 'facut', '2016-03-25'),
(8, '231321', 'nefacut', '2016-03-25'),
(9, '231321', 'facut', '2016-03-25'),
(10, '231321', 'nefacut', '2016-03-25'),
(11, '231321', 'nefacut', '2016-03-25'),
(12, '231321', 'facut', '2016-03-25'),
(13, 'dsadsa', 'nefacut', '2016-03-31'),
(14, 'dsa', 'nefacut', '2016-03-31'),
(15, 'dsadsa', 'facut', '2016-03-30'),
(16, 'dsa', 'nefacut', '2016-03-30'),
(17, 'dsads', 'nefacut', '2016-03-29'),
(18, 'Task corect', 'facut', '2016-04-01'),
(19, 'Task corect', 'nefacut', '2016-04-01'),
(20, '1', 'nefacut', '2016-03-25'),
(22, 'test', 'facut', '2016-03-29'),
(23, 'Ultimul', 'nefacut', '2016-03-25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
