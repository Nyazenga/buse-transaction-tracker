-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2025 at 04:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transaction_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `description`, `date`, `created_at`) VALUES
(1, 2, 12.00, 'Fees Payment', '2025-02-11 22:00:00', '2025-02-12 10:00:54'),
(2, 2, 45.00, 'Fees Payment', '2025-02-10 22:00:00', '2025-02-12 10:01:11'),
(3, 2, 10.50, 'Groceries', '2025-02-01 12:15:00', '2025-02-12 10:09:18'),
(4, 2, 25.75, 'Electricity Bill', '2025-02-02 08:30:00', '2025-02-12 10:09:18'),
(5, 2, 7.20, 'Transport Fare', '2025-02-03 06:45:00', '2025-02-12 10:09:18'),
(6, 2, 50.00, 'Internet Subscription', '2025-02-04 10:00:00', '2025-02-12 10:09:18'),
(7, 2, 15.00, 'Airtime Purchase', '2025-02-05 07:20:00', '2025-02-12 10:09:18'),
(8, 2, 30.00, 'Water Bill', '2025-02-06 09:40:00', '2025-02-12 10:09:18'),
(9, 2, 12.99, 'Movie Streaming Subscription', '2025-02-07 16:10:00', '2025-02-12 10:09:18'),
(10, 2, 60.45, 'Fuel Refill', '2025-02-08 13:00:00', '2025-02-12 10:09:18'),
(11, 2, 100.00, 'Rent Payment', '2025-02-09 20:30:00', '2025-02-12 10:09:18'),
(12, 2, 5.50, 'Coffee Purchase', '2025-02-10 05:45:00', '2025-02-12 10:09:18'),
(13, 2, 80.25, 'Loan Repayment', '2025-02-11 17:05:00', '2025-02-12 10:09:18'),
(14, 2, 40.00, 'Dinner at Restaurant', '2025-02-12 18:30:00', '2025-02-12 10:09:18'),
(15, 2, 12.00, 'Online Shopping', '2025-02-13 15:50:00', '2025-02-12 10:09:18'),
(16, 2, 35.75, 'Gym Membership', '2025-02-14 04:00:00', '2025-02-12 10:09:18'),
(17, 2, 18.90, 'Laundry Service', '2025-02-15 11:25:00', '2025-02-12 10:09:18'),
(18, 2, 22.50, 'Car Maintenance', '2025-02-16 12:15:00', '2025-02-12 10:09:18'),
(19, 2, 10.00, 'Books Purchase', '2025-02-17 10:45:00', '2025-02-12 10:09:18'),
(20, 2, 45.99, 'Clothing Shopping', '2025-02-18 14:20:00', '2025-02-12 10:09:18'),
(21, 2, 9.99, 'Fast Food Meal', '2025-02-19 16:50:00', '2025-02-12 10:09:18'),
(22, 2, 200.00, 'Salary Deposit', '2025-02-20 06:00:00', '2025-02-12 10:09:18'),
(25, 2, -56.00, 'gajav', '2025-02-12 10:30:10', '2025-02-12 10:30:33'),
(26, 2, -56.00, 'tracks', '2025-02-12 10:30:53', '2025-02-12 10:32:21'),
(27, 2, 230.00, 'Fees', '2025-02-12 10:51:50', '2025-02-12 10:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'test', '$2b$10$PLrlEteGjIoiOd00PCAGV.JT12W7hipymyiQFNnlxx1LFQ1bVHAJe', '2025-02-12 08:43:34'),
(2, 'admin', '$2b$10$a0OxSEELmO12Zcod5pECF.27BhwSM5vF6WmsNl/JDRRBIwkbsnaL.', '2025-02-12 09:57:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
