-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2019 at 05:59 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qtoesdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `phone`, `email`, `user_name`, `password`) VALUES
(1, 'admin', '100', 'admin@gmail.com', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_exam`
--

CREATE TABLE `assigned_exam` (
  `s_no` int(10) NOT NULL,
  `u_id` int(10) NOT NULL,
  `d_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `domain`
--

CREATE TABLE `domain` (
  `d_id` int(10) NOT NULL,
  `dname` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `f_id` int(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `python`
--

CREATE TABLE `python` (
  `q_id` int(20) NOT NULL,
  `question` varchar(200) NOT NULL,
  `op1` varchar(200) NOT NULL,
  `op2` varchar(200) NOT NULL,
  `op3` varchar(200) NOT NULL,
  `op4` varchar(200) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `r_id` int(10) NOT NULL,
  `u_id` int(10) NOT NULL,
  `d_id` int(10) NOT NULL,
  `l1` int(5) NOT NULL,
  `l2` int(5) NOT NULL,
  `l3` int(5) NOT NULL,
  `marks` int(10) NOT NULL,
  `dateandtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `qualification` varchar(25) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `phone`, `address`, `email`, `qualification`, `user_name`, `password`) VALUES
(1, 'sanad', '6361470547', 'Nitte', 'sanadsadhik@gmail.com', 'MS', 'sanad', 'sanad');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `password` (`password`);

--
-- Indexes for table `assigned_exam`
--
ALTER TABLE `assigned_exam`
  ADD PRIMARY KEY (`s_no`),
  ADD KEY `u_id` (`u_id`),
  ADD KEY `d_id` (`d_id`);

--
-- Indexes for table `domain`
--
ALTER TABLE `domain`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `python`
--
ALTER TABLE `python`
  ADD PRIMARY KEY (`q_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `d_id` (`d_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password` (`password`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assigned_exam`
--
ALTER TABLE `assigned_exam`
  MODIFY `s_no` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domain`
--
ALTER TABLE `domain`
  MODIFY `d_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `f_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `python`
--
ALTER TABLE `python`
  MODIFY `q_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `r_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigned_exam`
--
ALTER TABLE `assigned_exam`
  ADD CONSTRAINT `assigned_exam_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `assigned_exam_ibfk_2` FOREIGN KEY (`d_id`) REFERENCES `domain` (`d_id`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `domain` (`d_id`),
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
