-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2019 at 09:33 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_vildan_günay_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `booking_no` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `insurance` tinyint(1) DEFAULT NULL,
  `fk_license_no` int(11) DEFAULT NULL,
  `fk_emp_id` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`booking_no`, `from_date`, `to_date`, `insurance`, `fk_license_no`, `fk_emp_id`, `fk_invoice_id`) VALUES
(1, '2019-09-11', '2019-09-25', 1, 2, 1, 2),
(2, '2019-09-26', '2019-09-29', 1, 1, 1, 3),
(3, '2019-10-26', '2019-10-29', 1, 3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_no` int(11) NOT NULL,
  `license_plate` varchar(20) DEFAULT NULL,
  `no_of_ppl` int(11) DEFAULT NULL,
  `fuel` varchar(15) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `fk_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_no`, `license_plate`, `no_of_ppl`, `fuel`, `type`, `fk_location_id`) VALUES
(1, 'W3650VV', 4, 'diesel', 'combi', 2),
(2, 'ES3650VV', 2, 'diesel', 'cabrio', 1),
(3, 'PL3650VV', 1, 'gas', 'mini', 3);

-- --------------------------------------------------------

--
-- Table structure for table `carsbookings`
--

CREATE TABLE `carsbookings` (
  `fk_car_no` int(11) DEFAULT NULL,
  `fk_booking_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carsbookings`
--

INSERT INTO `carsbookings` (`fk_car_no`, `fk_booking_no`) VALUES
(2, 1),
(1, 3),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `license_no` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`license_no`, `first_name`, `last_name`) VALUES
(1, 'Vildan', 'Günay'),
(2, 'Jakob', 'Günay'),
(3, 'Monika', 'Günay');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`) VALUES
(1, 'Peter', 'Jackson'),
(2, 'Franz', 'Bauer'),
(3, 'Julia', 'Klotz');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `sum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `date`, `sum`) VALUES
(1, '2019-09-18', 400),
(2, '2019-06-25', 550),
(3, '2018-12-25', 950);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `pick_up` varchar(60) DEFAULT NULL,
  `drop_off` varchar(60) DEFAULT NULL,
  `availability` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `pick_up`, `drop_off`, `availability`) VALUES
(1, 'Prager Straße 4', 'Julius-Ficker Straße 2', 10),
(2, 'Brünner Straße 2', 'Prager Straße 4', 18),
(3, 'Julius-Ficker Straße 2', 'Brünner Straße 2', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`booking_no`),
  ADD KEY `fk_license_no` (`fk_license_no`),
  ADD KEY `fk_emp_id` (`fk_emp_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_no`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Indexes for table `carsbookings`
--
ALTER TABLE `carsbookings`
  ADD KEY `fk_car_no` (`fk_car_no`),
  ADD KEY `fk_booking_no` (`fk_booking_no`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`license_no`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`fk_license_no`) REFERENCES `customer` (`license_no`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`fk_emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`fk_license_no`) REFERENCES `customer` (`license_no`),
  ADD CONSTRAINT `book_ibfk_4` FOREIGN KEY (`fk_emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `book_ibfk_5` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `carsbookings`
--
ALTER TABLE `carsbookings`
  ADD CONSTRAINT `carsbookings_ibfk_1` FOREIGN KEY (`fk_car_no`) REFERENCES `car` (`car_no`),
  ADD CONSTRAINT `carsbookings_ibfk_2` FOREIGN KEY (`fk_booking_no`) REFERENCES `book` (`booking_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
