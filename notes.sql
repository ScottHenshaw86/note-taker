-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 16, 2023 at 12:01 PM
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
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `owner`, `title`, `content`, `date_created`, `last_updated`) VALUES
(1, 1, 'TEST #1', '{\r\n    \"blocks\": [\r\n        {\r\n            \"type\": \"p\",\r\n            \"style\": \"bold\",\r\n            \"size\": \"base\",\r\n            \"text\": \"This is the first block of text in this note. It should be 16px and bold.\"\r\n        },\r\n        {\r\n            \"type\": \"p\",\r\n            \"style\": \"italic\",\r\n            \"size\": \"2xl\",\r\n            \"text\": \"This is the second block of text in this note. It should be 24px and italic.\"\r\n        },\r\n        {\r\n            \"type\": \"dropdown\",\r\n            \"style\": \"regular\",\r\n            \"size\": \"sm\",\r\n            \"text\": \"This is the third block of text in this note. It should be 10px and regular.\",\r\n            \"children\": [\r\n                {\r\n                    \"type\": \"p\",\r\n                    \"style\": \"bold\",\r\n                    \"size\": \"base\",\r\n                    \"text\": \"This is the first block of text in this note. It should be 16px and bold.\"\r\n                },\r\n                {\r\n                    \"type\": \"p\",\r\n                    \"style\": \"italic\",\r\n                    \"size\": \"3xl\",\r\n                    \"text\": \"This is the second block of text in this note. It should be 24px and italic.\"\r\n                }\r\n            ]\r\n        }\r\n    ]\r\n}', '2023-10-15 15:04:00', '2023-10-15 15:04:00'),
(2, 1, 'Test Note #2', '{\r\n    \"blocks\": [\r\n        {\r\n            \"type\": \"p\",\r\n            \"style\": \"bold\",\r\n            \"size\": \"base\",\r\n            \"text\": \"Test #1. It should be 16px and bold.\"\r\n        },\r\n        {\r\n            \"type\": \"dropdown\",\r\n            \"style\": \"regular\",\r\n            \"size\": \"xs\",\r\n            \"text\": \"Test #2. It should be 10px and regular.\",\r\n            \"children\": [\r\n                {\r\n                    \"type\": \"p\",\r\n                    \"style\": \"bold\",\r\n                    \"size\": \"base\",\r\n                    \"text\": \"This is the first block of text in this note. It should be 16px and bold.\"\r\n                },\r\n                {\r\n                    \"type\": \"p\",\r\n                    \"style\": \"italic\",\r\n                    \"size\": \"2xl\",\r\n                    \"text\": \"This is the second block of text in this note. It should be 24px and italic.\"\r\n                }\r\n            ]\r\n        },\r\n        {\r\n            \"type\": \"p\",\r\n            \"style\": \"italic\",\r\n            \"size\": \"2xl\",\r\n            \"text\": \"Test #3. It should be 24px and italic.\"\r\n        }\r\n    ]\r\n}', '2023-10-15 15:08:08', '2023-10-15 15:08:08'),
(3, 1, 'Test Note #3', '{\r\n    \"blocks\": [\r\n        {\r\n            \"type\": \"p\",\r\n            \"style\": \"bold\",\r\n            \"size\": \"base\",\r\n            \"text\": \"Note 3. Test #1. It should be 16px and bold.\"\r\n        },\r\n        {\r\n            \"type\": \"dropdown\",\r\n            \"style\": \"regular\",\r\n            \"size\": \"xs\",\r\n            \"text\": \"Note 3. Test #2. It should be 10px and regular.\",\r\n            \"children\": [\r\n                {\r\n                    \"type\": \"p\",\r\n                    \"style\": \"bold\",\r\n                    \"size\": \"base\",\r\n                    \"text\": \"This is the first block of text in this note. It should be 16px and bold.\"\r\n                },\r\n                {\r\n                    \"type\": \"p\",\r\n                    \"style\": \"italic\",\r\n                    \"size\": \"2xl\",\r\n                    \"text\": \"This is the second block of text in this note. It should be 24px and italic.\"\r\n                }\r\n            ]\r\n        },\r\n        {\r\n            \"type\": \"p\",\r\n            \"style\": \"italic\",\r\n            \"size\": \"2xl\",\r\n            \"text\": \"note 3. Test #3. It should be 24px and italic.\"\r\n        }\r\n    ]\r\n}', '2023-10-15 15:08:08', '2023-10-15 15:08:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
