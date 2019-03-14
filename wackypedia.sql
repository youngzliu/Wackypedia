-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 14, 2019 at 11:45 AM
-- Server version: 5.7.24-log
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wackypedia`
--
CREATE DATABASE IF NOT EXISTS `wackypedia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wackypedia`;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`ID`, `title`) VALUES
(1, 'Bob'),
(2, 'Bob'),
(3, 'Bob'),
(4, 'Bob'),
(5, 'Bob'),
(6, 'iron'),
(7, 'wiki'),
(8, 'wub'),
(9, 'Bob'),
(10, 'BOB'),
(11, 'Bob');

-- --------------------------------------------------------

--
-- Table structure for table `articles_authors`
--

CREATE TABLE `articles_authors` (
  `ID` int(11) NOT NULL,
  `article_ID` int(11) NOT NULL,
  `author_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles_authors`
--

INSERT INTO `articles_authors` (`ID`, `article_ID`, `author_ID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 10, 11),
(12, 10, 12),
(13, 10, 13),
(14, 11, 14),
(15, 11, 15),
(16, 11, 16),
(17, 11, 17),
(18, 10, 18);

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`ID`, `name`) VALUES
(1, 'Foo'),
(2, 'Foo'),
(3, 'Foo'),
(4, 'Foo'),
(5, 'Foo'),
(6, 'man'),
(7, 'peeeeedia'),
(8, 'wubwub'),
(9, 'Foo'),
(10, 'rewarwaerwra'),
(11, 'wrwarwrawr'),
(12, 'wearawrawrewar'),
(13, 'awrwaer'),
(14, 'Foo'),
(15, 'pwoekrtpw'),
(16, 'werawerawrwa'),
(17, 'werwarwera'),
(18, 'AAAAAAAAAAAAAAAAAAA');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `imageLink` varchar(255) NOT NULL,
  `body` mediumtext NOT NULL,
  `articleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`ID`, `title`, `imageLink`, `body`, `articleID`) VALUES
(1, 'Bob', 'https://pbs.twimg.com/profile_images/999306909600501761/PlDpesZh_400x400.jpg', 'erwrwra', 10),
(2, 'Bob', ' a', 'ewrawerawerawer', 10),
(3, 'Bob', 'empty', 'aewrwaerwaeraw', 10),
(4, 'werjawoirjwaeoreji', 'empty', 'weoprkawpotrkwareiojtraowirjeaowrjiawjr', 11),
(5, 'Bob', 'empty', 'w', 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `articles_authors`
--
ALTER TABLE `articles_authors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `articles_authors`
--
ALTER TABLE `articles_authors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
