-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2020 at 11:23 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atmanirbhar`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_qty` int(11) NOT NULL,
  `item_price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `item_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_image` varchar(255) NOT NULL,
  `item_price` int(100) NOT NULL,
  `item_type` varchar(100) NOT NULL,
  `item_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`item_id`, `vendor_id`, `item_name`, `item_image`, `item_price`, `item_type`, `item_desc`) VALUES
(13, 11, 'Office chair', 'uploads/2020_05_30_10_41_59_chair.jpg', 2000, 'Study & Office', 'The flexible high-grade nylon mesh back is designed for air-circulation and support when you lean ba'),
(14, 11, 'Computer Chair', 'uploads/2020_05_30_10_44_21_compchair.jpg', 2500, 'Study & Office', 'The flexible high-grade nylon mesh back is designed for air-circulation and support when you lean ba'),
(15, 11, 'Office chair', 'uploads/2020_05_30_10_45_34_chair3.jpg', 5000, 'Study & Office', 'Adjustable Arm Rest in Leatherette'),
(16, 11, 'Study Table', 'uploads/2020_05_30_10_47_29_table1.jpg', 5000, 'Study & Office', 'Engineered Wood & Melamine Finish Wallmount Writing Desk Space saver'),
(17, 12, 'Office chair', 'uploads/2020_05_30_10_56_42_chair2.jpg', 3500, 'Study & Office', 'The flexible high-grade nylon mesh back is designed for air-circulation and support when you lean ba'),
(18, 12, 'Kids bed', 'uploads/2020_05_30_10_58_31_kb.jpg', 49000, 'Bedroom', 'Utilising minimum space with maximum comfort, our whimsical looking trundle bed is most convenient f'),
(19, 12, 'Single bed', 'uploads/2020_05_30_10_59_06_db.jpg', 35000, 'Bedroom', 'Utilising minimum space with maximum comfort, our whimsical looking trundle bed is most convenient f');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_number` bigint(20) DEFAULT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `fname`, `lname`, `email`, `contact_number`, `password`) VALUES
(14, 'Sachin', 'Vashisth', 'sachin@gmail.com', 8700726603, 'd8578edf8458ce06fbc5bb76a58c5ca4');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `mode_of_payment` varchar(100) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `mobile` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `vendor_id`, `address`, `date`, `mode_of_payment`, `total`, `mobile`) VALUES
(12, 14, 11, 'Rohini', '2020-05-30', 'Cash on Delivery', 7500, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `vendor_name` varchar(100) NOT NULL,
  `vendor_city` varchar(100) NOT NULL,
  `vendor_number` bigint(20) DEFAULT NULL,
  `vendor_email` varchar(100) NOT NULL,
  `vendor_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `vendor_name`, `vendor_city`, `vendor_number`, `vendor_email`, `vendor_password`) VALUES
(11, 'Royal Woods', 'Delhi', 112397352, 'royalwoods@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4'),
(12, 'Wallmount', 'Ghaziabad', 1127348031, 'wallmount@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catalog`
--
ALTER TABLE `catalog`
  ADD CONSTRAINT `catalog_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
