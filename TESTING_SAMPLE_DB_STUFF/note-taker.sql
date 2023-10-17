-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 17, 2023 at 01:30 PM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `note-taker`
--

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `size` varchar(4) NOT NULL,
  `content` text NOT NULL,
  `children_order` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `note_id`, `type`, `parent_id`, `size`, `content`, `children_order`) VALUES
(1, 1, 'dropdown', NULL, 'xl', 'This is the first block of the first note. It is a dropdown. It is size XL.', '[4, 5, 6]'),
(2, 1, 'p', NULL, 'base', 'This is the second block of the first note. It is a p tag. It is size base.', NULL),
(3, 1, 'p', NULL, 'sm', 'This is the third block of the first note. It is a p tag. It is size sm.', NULL),
(4, 1, 'p', 1, 'base', 'This is the first child block of block 1. It is a p tag. It is size base.', NULL),
(5, 1, 'dropdown', 1, 'xl', 'This is the second child block of block 1. It is a dropdown. It is size xl.', '[7, 8]'),
(6, 1, 'p', 1, 'base', 'This is the third child block of block 1. It is a p tag. It is size base.', NULL),
(7, 1, 'p', 5, 'base', 'This is the first child block of block 1-2. It is a p tag. It is size base.', NULL),
(8, 1, 'p', 5, 'base', 'This is second first child block of block 1-2. It is a p tag. It is size sm.', NULL),
(9, 2, 'p', NULL, 'base', 'This is the 1st child block of Scott\'s second note. It should be base size.', NULL),
(10, 2, 'dropdown', NULL, 'base', 'This is the 2nd child block of Scott\'s second note. It is a dropdown with 1 child.', '[11]'),
(11, 2, 'p', 10, 'xl', 'This is the 1st child block of Scott\'s second note\'s dropdown. It should be xl size.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `block_order` json DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `title`, `block_order`, `date_created`, `last_modified`) VALUES
(1, 1, 'Test Note #1', NULL, '2023-10-17 11:34:27', '2023-10-17 11:34:27'),
(2, 1, 'Test Note #2', NULL, '2023-10-17 11:34:27', '2023-10-17 11:34:27'),
(3, 1, 'Test Note #3', NULL, '2023-10-17 11:34:27', '2023-10-17 11:34:27'),
(4, 2, 'Harvey Test Note #1', NULL, '2023-10-17 11:34:27', '2023-10-17 11:34:27'),
(5, 2, 'Harvey Test Note #2', NULL, '2023-10-17 11:34:27', '2023-10-17 11:34:27'),
(6, 3, 'Alice Test Note #1', NULL, '2023-10-17 11:34:27', '2023-10-17 11:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `notes_tags_map`
--

CREATE TABLE `notes_tags_map` (
  `note_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notes_tags_map`
--

INSERT INTO `notes_tags_map` (`note_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tag` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `user_id`, `tag`) VALUES
(1, 1, 'password'),
(2, 1, 'website'),
(3, 1, 'strolid'),
(4, 1, 'wcoding'),
(5, 2, 'important'),
(6, 2, 'xavier school'),
(7, 3, 'work');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `date_created`, `is_active`) VALUES
(1, 'scott', '$2y$10$va1bmPOJXYTo1fvvfvyFqOq9q.qevaCH30KIfl1PmsStfGO7NNEga', '2023-10-17 11:32:06', 1),
(2, 'harvey', '$2y$10$E1sK01KsgJupeOmMeJ8a9eMRYo8fk9a25f.cYLCDLAstGC4xRtcqC', '2023-10-17 11:35:12', 1),
(3, 'alice', '$2y$10$8TBpbkn3X5BcG76fwSTwquAERPpxKlhwSvrr/Xb.GxTbOEO7zOX/C', '2023-10-17 11:40:35', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes_tags_map`
--
ALTER TABLE `notes_tags_map`
  ADD PRIMARY KEY (`note_id`,`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
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
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
