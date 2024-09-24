-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2024 at 03:32 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`) VALUES
(1, 'Admin User', 'admin@admin.admin', 'admin'),
(2, 'Student User', 'student@student.student', 'student'),
(3, 'Doctor User', 'doctor@doctor.doctor', 'doctor'),
(4, 'Accountant User', 'accountant@accountant.accountant', 'accountant'),
(5, 'Discipline User', 'discipline@discipline.discipline', 'discipline');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `student_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `date`, `time`, `student_id`, `reason`, `status`) VALUES
(1, '2023-05-01', '10:00:00', 1, 'Flu symptoms', 'Pending'),
(2, '2023-05-02', '14:30:00', 2, 'Headache', 'Scheduled'),
(3, '2023-05-03', '09:45:00', 3, 'Stomach pain', 'Completed'),
(4, '2023-05-04', '16:20:00', 4, 'Skin rash', 'Pending'),
(5, '2023-05-05', '11:15:00', 5, 'Fever', 'Scheduled'),
(6, '2023-05-06', '13:00:00', 6, 'Injury', 'Completed'),
(7, '2023-05-07', '15:45:00', 7, 'Allergic reaction', 'Pending'),
(8, '2023-05-08', '10:30:00', 8, 'Respiratory issues', 'Scheduled'),
(9, '2023-05-09', '14:00:00', 9, 'Dental problems', 'Completed'),
(10, '2023-05-10', '12:10:00', 10, 'Vision check-up', 'Pending'),
(11, '2023-05-11', '09:30:00', 11, 'Back pain', 'Pending'),
(12, '2023-05-12', '11:45:00', 12, 'Ear infection', 'Scheduled'),
(13, '2023-05-13', '14:15:00', 13, 'Cold and cough', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `closed_notifications`
--

CREATE TABLE `closed_notifications` (
  `id` int(11) NOT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `closed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `closed_notifications`
--

INSERT INTO `closed_notifications` (`id`, `notification_id`, `closed_at`) VALUES
(1, 1, '2024-06-06 12:18:34'),
(2, 1, '2024-06-06 12:18:37'),
(3, 1, '2024-06-06 12:18:38'),
(4, 1, '2024-06-06 12:18:54'),
(5, 1, '2024-06-06 12:18:55'),
(6, 1, '2024-06-06 12:18:56'),
(7, 1, '2024-06-06 12:19:32'),
(8, 3, '2024-06-06 12:19:35'),
(9, 4, '2024-06-06 12:19:36'),
(10, 4, '2024-06-06 12:19:39'),
(11, 4, '2024-06-06 12:23:09'),
(12, 2, '2024-06-06 12:39:45'),
(16, 15, '2024-06-06 12:56:03'),
(17, 17, '2024-06-06 12:56:11'),
(18, 7, '2024-06-06 12:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`) VALUES
(100, 'Physics'),
(200, 'PHP'),
(300, 'Mathematics');

-- --------------------------------------------------------

--
-- Table structure for table `discipline`
--

CREATE TABLE `discipline` (
  `id` int(11) NOT NULL,
  `cat_marks` int(11) NOT NULL,
  `exam_marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discipline`
--

INSERT INTO `discipline` (`id`, `cat_marks`, `exam_marks`) VALUES
(1, 70, 100),
(2, 82, 80);

-- --------------------------------------------------------

--
-- Table structure for table `embedded_systems`
--

CREATE TABLE `embedded_systems` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `cat_marks` int(11) DEFAULT NULL,
  `exam_marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `embedded_systems`
--

INSERT INTO `embedded_systems` (`id`, `student_id`, `cat_marks`, `exam_marks`) VALUES
(1, 1, 88, 92),
(2, 2, 78, 86);

-- --------------------------------------------------------

--
-- Table structure for table `english`
--

CREATE TABLE `english` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `cat_marks` int(11) DEFAULT NULL,
  `exam_marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `english`
--

INSERT INTO `english` (`id`, `student_id`, `cat_marks`, `exam_marks`) VALUES
(1, 1, 100, 100),
(2, 2, 1234, 80),
(3, 5, 99999999, 100),
(5, 5, 0, 0),
(6, 5, 0, 0),
(7, 5, 0, 0),
(8, 5, 100, 100),
(9, NULL, 0, 0),
(10, NULL, 0, 0),
(11, NULL, 0, 0),
(12, NULL, 0, 0),
(13, NULL, 0, 0),
(14, NULL, 0, 0),
(15, NULL, 0, 0),
(16, NULL, 0, 0),
(17, NULL, 0, 0),
(18, NULL, 0, 0),
(19, NULL, 0, 0),
(20, NULL, 0, 0),
(21, NULL, 0, 0),
(22, NULL, 0, 0),
(23, NULL, 0, 0),
(24, NULL, 0, 0),
(25, NULL, 0, 0),
(26, NULL, 0, 0),
(27, NULL, 0, 0),
(28, NULL, 0, 0),
(29, NULL, 0, 0),
(30, NULL, 0, 0),
(31, NULL, 0, 0),
(32, NULL, 0, 0),
(33, NULL, 0, 0),
(34, NULL, 0, 0),
(35, NULL, 0, 0),
(36, NULL, 0, 0),
(37, NULL, 0, 0),
(38, NULL, 0, 0),
(39, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fundamentals_of_programming`
--

CREATE TABLE `fundamentals_of_programming` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `cat_marks` int(11) DEFAULT NULL,
  `exam_marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fundamentals_of_programming`
--

INSERT INTO `fundamentals_of_programming` (`id`, `student_id`, `cat_marks`, `exam_marks`) VALUES
(1, 1, 85, 88),
(2, 2, 82, 86),
(3, NULL, 10, 100),
(5, NULL, 10, 0),
(6, NULL, 0, 0),
(7, NULL, 0, 0),
(8, NULL, 0, 0),
(9, NULL, 0, 0),
(10, NULL, 0, 0),
(11, NULL, 0, 0),
(12, NULL, 0, 0),
(13, NULL, 0, 0),
(14, NULL, 0, 0),
(15, NULL, 0, 0),
(16, NULL, 0, 0),
(17, NULL, 0, 0),
(18, NULL, 0, 0),
(19, NULL, 0, 0),
(20, NULL, 0, 0),
(21, NULL, 0, 0),
(22, NULL, 0, 0),
(23, NULL, 0, 0),
(24, NULL, 0, 0),
(25, NULL, 0, 0),
(26, NULL, 0, 0),
(27, NULL, 0, 0),
(28, NULL, 0, 0),
(29, NULL, 0, 0),
(30, NULL, 0, 0),
(31, NULL, 0, 0),
(32, NULL, 0, 0),
(33, NULL, 0, 0),
(34, NULL, 0, 0),
(35, NULL, 0, 0),
(36, NULL, 0, 0),
(37, NULL, 0, 0),
(38, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gui`
--

CREATE TABLE `gui` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `cat_marks` int(11) DEFAULT NULL,
  `exam_marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gui`
--

INSERT INTO `gui` (`id`, `student_id`, `cat_marks`, `exam_marks`) VALUES
(1, 1, 78, 86),
(2, 2, 75, 82);

-- --------------------------------------------------------

--
-- Table structure for table `javascript`
--

CREATE TABLE `javascript` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `cat_marks` int(11) DEFAULT NULL,
  `exam_marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `javascript`
--

INSERT INTO `javascript` (`id`, `student_id`, `cat_marks`, `exam_marks`) VALUES
(1, 1, 80, 84),
(2, 2, 85, 90),
(3, NULL, 0, 0),
(5, NULL, 0, 0),
(6, NULL, 0, 0),
(7, NULL, 0, 0),
(8, NULL, 0, 0),
(9, NULL, 0, 0),
(10, NULL, 0, 0),
(11, NULL, 0, 0),
(12, NULL, 0, 0),
(13, NULL, 0, 0),
(14, NULL, 0, 0),
(15, NULL, 0, 0),
(16, NULL, 0, 0),
(17, NULL, 0, 0),
(18, NULL, 0, 0),
(19, NULL, 0, 0),
(20, NULL, 0, 0),
(21, NULL, 0, 0),
(22, NULL, 0, 0),
(23, NULL, 0, 0),
(24, NULL, 0, 0),
(25, NULL, 0, 0),
(26, NULL, 0, 0),
(27, NULL, 0, 0),
(28, NULL, 0, 0),
(29, NULL, 0, 0),
(30, NULL, 0, 0),
(31, NULL, 0, 0),
(32, NULL, 0, 0),
(33, NULL, 0, 0),
(34, NULL, 0, 0),
(35, NULL, 0, 0),
(36, NULL, 0, 0),
(37, NULL, 0, 0),
(38, NULL, 0, 0),
(39, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mathematics`
--

CREATE TABLE `mathematics` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `cat_marks` int(11) DEFAULT NULL,
  `exam_marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mathematics`
--

INSERT INTO `mathematics` (`id`, `student_id`, `cat_marks`, `exam_marks`) VALUES
(1, 1, 80, 85),
(2, 2, 85, 88);

-- --------------------------------------------------------

--
-- Table structure for table `mathematics_marks_year1a`
--

CREATE TABLE `mathematics_marks_year1a` (
  `id` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `CAT` int(11) DEFAULT floor(rand() * 100),
  `EXAM` int(11) DEFAULT floor(rand() * 100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mathematics_marks_year1a`
--

INSERT INTO `mathematics_marks_year1a` (`id`, `student_name`, `CAT`, `EXAM`) VALUES
(1, 'Emma Reponse', 58, 61),
(2, 'Regine', 58, 61),
(3, 'Landry', 100, 61),
(4, 'Benite', 58, 61),
(5, 'Andre', 58, 61),
(6, 'Chael', 58, 61),
(7, 'Eliane Mac Monia', 58, 61),
(8, 'Danny Mike', 58, 61),
(9, 'Charles', 58, 61),
(10, 'Elvin', 58, 61),
(11, 'Brillante', 58, 61),
(12, 'Keren', 58, 61),
(13, 'Kevine', 58, 61),
(14, 'Princess', 58, 61),
(15, 'Souvenir', 58, 61),
(16, 'Saly Nelson', 58, 61),
(17, 'Nadine', 58, 61),
(18, 'Livia', 58, 61),
(19, 'Alain', 58, 61),
(20, 'Honore', 58, 61),
(21, 'Yvan', 58, 61),
(22, 'Jeremie', 58, 61),
(23, 'Isimbi Vieira', 58, 61),
(24, 'Samuel', 58, 61),
(25, 'Angel', 58, 61),
(26, 'Ruth', 58, 61),
(27, 'Esther Hope', 58, 61),
(28, 'Olga', 58, 61),
(29, 'Ange Kevine', 58, 61);

-- --------------------------------------------------------

--
-- Table structure for table `mathematics_marks_year1b`
--

CREATE TABLE `mathematics_marks_year1b` (
  `id` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `mathematics_mark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_assistance_requests`
--

CREATE TABLE `medical_assistance_requests` (
  `id` int(11) NOT NULL,
  `date_requested` date NOT NULL,
  `student_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_assistance_requests`
--

INSERT INTO `medical_assistance_requests` (`id`, `date_requested`, `student_id`, `reason`, `status`) VALUES
(1, '2023-05-01', 1, 'Feeling unwell', 'Pending'),
(2, '2023-05-02', 2, 'Injured during PE class', 'Approved'),
(3, '2023-05-03', 3, 'Requires medication refill', 'Pending'),
(4, '2023-05-04', 4, 'Experiencing allergic symptoms', 'Approved'),
(5, '2023-05-05', 5, 'Needs mental health support', 'Pending'),
(6, '2023-05-06', 6, 'Requires physical therapy', 'Approved'),
(7, '2023-05-07', 7, 'Dental emergency', 'Pending'),
(8, '2023-05-08', 8, 'Vision problems', 'Approved'),
(9, '2023-05-09', 9, 'Requires dietary advice', 'Pending'),
(10, '2023-05-10', 10, 'Experiencing chronic pain', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `medical_care_history`
--

CREATE TABLE `medical_care_history` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `diagnosis` text NOT NULL,
  `treatment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_care_history`
--

INSERT INTO `medical_care_history` (`id`, `student_id`, `date`, `diagnosis`, `treatment`) VALUES
(1, 1, '2023-04-15', 'Flu', 'Prescribed medication'),
(2, 2, '2023-03-20', 'Sprained ankle', 'Provided first aid, recommended physical therapy'),
(3, 3, '2023-02-10', 'Allergic reaction', 'Administered epinephrine, referred to specialist'),
(4, 4, '2023-01-25', 'Strep throat', 'Prescribed antibiotics'),
(5, 5, '2022-12-05', 'Anxiety', 'Referred to counseling services'),
(6, 6, '2022-11-18', 'Concussion', 'Recommended rest and follow-up evaluation'),
(7, 7, '2022-10-02', 'Cavity', 'Performed dental filling'),
(8, 8, '2022-09-14', 'Myopia', 'Prescribed glasses'),
(9, 9, '2022-08-07', 'Nutrition deficiency', 'Recommended dietary changes and supplements'),
(10, 10, '2022-07-01', 'Chronic back pain', 'Referred to physical therapy');

-- --------------------------------------------------------

--
-- Stand-in structure for view `nelson`
-- (See below for the actual view)
--
CREATE TABLE `nelson` (
`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `php`
--

CREATE TABLE `php` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `cat_marks` int(11) DEFAULT NULL,
  `exam_marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `php`
--

INSERT INTO `php` (`id`, `student_id`, `cat_marks`, `exam_marks`) VALUES
(1, 1, 82, 90),
(2, 2, 80, 84);

-- --------------------------------------------------------

--
-- Table structure for table `php_marks_year1a`
--

CREATE TABLE `php_marks_year1a` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `php_marks_year1a`
--

INSERT INTO `php_marks_year1a` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 102030, 'Emma Reponse', '1A', 14, 28),
(2, 102030, 'Regine', '1A', 96, 51),
(3, 102030, 'Landry', '1A', 100, 88),
(4, 102030, 'Benite', '1A', 98, 90),
(5, 102030, 'Andre', '1A', 80, 48),
(6, 102030, 'Chael', '1A', 4, 68),
(7, 102030, 'Eliane Mac Monia', '1A', 81, 97),
(8, 102030, 'Danny Mike', '1A', 94, 81),
(9, 102030, 'Charles', '1A', 26, 16),
(10, 102030, 'Elvin', '1A', 49, 36),
(11, 102030, 'Brillante', '1A', 67, 33),
(12, 102030, 'Keren', '1A', 87, 56),
(13, 102030, 'Kevine', '1A', 32, 81),
(14, 102030, 'Princess', '1A', 2, 40),
(15, 102030, 'Souvenir', '1A', 12, 55),
(16, 102030, 'Saly Nelson', '1A', 57, 56),
(17, 102030, 'Nadine', '1A', 46, 16),
(18, 102030, 'Livia', '1A', 62, 10),
(19, 102030, 'Alain', '1A', 71, 5),
(20, 102030, 'Honore', '1A', 67, 97),
(21, 102030, 'Yvan', '1A', 22, 69),
(22, 102030, 'Jeremie', '1A', 8, 55),
(23, 102030, 'Isimbi Vieira', '1A', 74, 69),
(24, 102030, 'Samuel', '1A', 47, 78),
(25, 102030, 'Angel', '1A', 12, 84),
(26, 102030, 'Ruth', '1A', 20, 87),
(27, 102030, 'Esther Hope', '1A', 62, 84),
(28, 102030, 'Olga', '1A', 50, 59),
(29, 102030, 'Ange Kevine', '1A', 65, 43),
(30, 102030, 'Irasubiza', '1A', 72, 39);

-- --------------------------------------------------------

--
-- Table structure for table `php_marks_year1b`
--

CREATE TABLE `php_marks_year1b` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `php_marks_year1b`
--

INSERT INTO `php_marks_year1b` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 102030, 'Kessia', '1B', 23, 68),
(2, 102030, 'Aimee Princesse', '1B', 63, 22),
(3, 102030, 'Patrick', '1B', 46, 7),
(4, 102030, 'Christian', '1B', 44, 71),
(5, 102030, 'Fred', '1B', 79, 32),
(6, 102030, 'Emmanuel', '1B', 64, 51),
(7, 102030, 'Jolie Princesse', '1B', 85, 56),
(8, 102030, 'Beni Samuel', '1B', 32, 27),
(9, 102030, 'Hyguette', '1B', 6, 68),
(10, 102030, 'Sergine', '1B', 34, 62),
(11, 102030, 'Neilla Gisa', '1B', 53, 4),
(12, 102030, 'Ivan', '1B', 62, 33),
(13, 102030, 'Chrispin', '1B', 52, 56),
(14, 102030, 'Prosper', '1B', 72, 81),
(15, 102030, 'Reine Kheira', '1B', 6, 36),
(16, 102030, 'Loicke Bedo', '1B', 12, 37),
(17, 102030, 'Marie Ange Gabriella', '1B', 41, 80),
(18, 102030, 'Oreste', '1B', 70, 88),
(19, 102030, 'Raphael', '1B', 27, 0),
(20, 102030, 'Cynthia Marie', '1B', 26, 36),
(21, 102030, 'Divine', '1B', 47, 80),
(22, 102030, 'Patrick', '1B', 56, 92),
(23, 102030, 'Prince', '1B', 42, 21),
(24, 102030, 'David', '1B', 39, 31),
(25, 102030, 'Marie', '1B', 71, 90),
(26, 102030, 'Paradie Emmanuella', '1B', 37, 59),
(27, 102030, 'Tracy', '1B', 73, 25),
(28, 102030, 'Christian', '1B', 53, 50),
(29, 102030, 'Nice Josiane', '1B', 47, 74),
(30, 102030, 'Sylvie', '1B', 76, 20);

-- --------------------------------------------------------

--
-- Table structure for table `php_marks_year1c`
--

CREATE TABLE `php_marks_year1c` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `php_marks_year1c`
--

INSERT INTO `php_marks_year1c` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 102030, 'Nikita', '1C', 39, 81),
(2, 102030, 'Bonny', '1C', 69, 43),
(3, 102030, 'Joyeuse', '1C', 25, 73),
(4, 102030, 'Love', '1C', 21, 35),
(5, 102030, 'Leandre', '1C', 29, 59),
(6, 102030, 'Kenny', '1C', 81, 89),
(7, 102030, 'Aimable', '1C', 17, 70),
(8, 102030, 'Albert', '1C', 44, 84),
(9, 102030, 'Prince Babou', '1C', 70, 9),
(10, 102030, 'Melvin', '1C', 16, 96),
(11, 102030, 'Gloire Marie', '1C', 69, 51),
(12, 102030, 'Faith', '1C', 97, 70),
(13, 102030, 'Pacifique', '1C', 79, 98),
(14, 102030, 'Pascal', '1C', 5, 78),
(15, 102030, 'Samuella', '1C', 88, 97),
(16, 102030, 'Jessica', '1C', 26, 53),
(17, 102030, 'Patience Isimbi', '1C', 65, 72),
(18, 102030, 'Ciara', '1C', 48, 3),
(19, 102030, 'Nicole', '1C', 43, 0),
(20, 102030, 'Hope', '1C', 71, 89),
(21, 102030, 'Paulin', '1C', 29, 46),
(22, 102030, 'Annick', '1C', 29, 65),
(23, 102030, 'Prince', '1C', 59, 89),
(24, 102030, 'Laurent', '1C', 7, 48),
(25, 102030, 'Salim', '1C', 59, 72),
(26, 102030, 'Gael', '1C', 75, 20),
(27, 102030, 'Raissa', '1C', 96, 81),
(28, 102030, 'Darlene', '1C', 56, 47),
(29, 102030, 'Narasha', '1C', 94, 93),
(30, 102030, 'Mahinga Rodin', '1C', 99, 22),
(31, 102030, 'Nikita', '1C', 59, 33),
(32, 102030, 'Bonny', '1C', 50, 0),
(33, 102030, 'Joyeuse', '1C', 72, 99),
(34, 102030, 'Love', '1C', 13, 99),
(35, 102030, 'Leandre', '1C', 49, 98),
(36, 102030, 'Kenny', '1C', 5, 91),
(37, 102030, 'Aimable', '1C', 77, 64),
(38, 102030, 'Albert', '1C', 70, 48),
(39, 102030, 'Prince Babou', '1C', 20, 46),
(40, 102030, 'Melvin', '1C', 91, 87),
(41, 102030, 'Gloire Marie', '1C', 92, 0),
(42, 102030, 'Faith', '1C', 89, 37),
(43, 102030, 'Pacifique', '1C', 69, 88),
(44, 102030, 'Pascal', '1C', 77, 28),
(45, 102030, 'Samuella', '1C', 79, 76),
(46, 102030, 'Jessica', '1C', 64, 95),
(47, 102030, 'Patience Isimbi', '1C', 83, 50),
(48, 102030, 'Ciara', '1C', 25, 63),
(49, 102030, 'Nicole', '1C', 66, 67),
(50, 102030, 'Hope', '1C', 47, 47),
(51, 102030, 'Paulin', '1C', 80, 35),
(52, 102030, 'Annick', '1C', 14, 32),
(53, 102030, 'Prince', '1C', 56, 56),
(54, 102030, 'Laurent', '1C', 69, 87),
(55, 102030, 'Salim', '1C', 10, 65),
(56, 102030, 'Gael', '1C', 97, 65),
(57, 102030, 'Raissa', '1C', 36, 31),
(58, 102030, 'Darlene', '1C', 35, 60),
(59, 102030, 'Narasha', '1C', 55, 7),
(60, 102030, 'Mahinga Rodin', '1C', 71, 58);

-- --------------------------------------------------------

--
-- Table structure for table `php_marks_year1d`
--

CREATE TABLE `php_marks_year1d` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `php_marks_year1d`
--

INSERT INTO `php_marks_year1d` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 102030, 'Elise', '1D', 49, 66),
(2, 102030, 'Emile', '1D', 36, 60),
(3, 102030, 'Beatrice', '1D', 68, 1),
(4, 102030, 'Derick', '1D', 26, 27),
(5, 102030, 'Eliel', '1D', 24, 31),
(6, 102030, 'Grace', '1D', 70, 73),
(7, 102030, 'Trinity', '1D', 18, 73),
(8, 102030, 'Kathy', '1D', 55, 47),
(9, 102030, 'Nelson', '1D', 68, 18),
(10, 102030, 'Sandrine', '1D', 99, 49),
(11, 102030, 'Olivia', '1D', 38, 93),
(12, 102030, 'Fabiola', '1D', 14, 18),
(13, 102030, 'Theophile', '1D', 94, 12),
(14, 102030, 'Hosea', '1D', 80, 5),
(15, 102030, 'Vicky', '1D', 59, 88),
(16, 102030, 'Maurice', '1D', 35, 28),
(17, 102030, 'Dieudonne', '1D', 23, 75),
(18, 102030, 'Marie Noel', '1D', 49, 90),
(19, 102030, 'Elie', '1D', 91, 27),
(20, 102030, 'Ernest', '1D', 54, 64),
(21, 102030, 'Marlene', '1D', 81, 42),
(22, 102030, 'Felicien', '1D', 56, 19),
(23, 102030, 'Peter', '1D', 62, 68),
(24, 102030, 'Celestin', '1D', 27, 85),
(25, 102030, 'Gilbert', '1D', 63, 19),
(26, 102030, 'Aline', '1D', 70, 42),
(27, 102030, 'Pacis', '1D', 43, 51),
(28, 102030, 'Benie', '1D', 41, 32),
(29, 102030, 'Jules', '1D', 78, 8),
(30, 102030, 'Ellen', '1D', 38, 42);

-- --------------------------------------------------------

--
-- Table structure for table `php_marks_year2a`
--

CREATE TABLE `php_marks_year2a` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `php_marks_year2a`
--

INSERT INTO `php_marks_year2a` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 20020, 'Viateur', '2A', 74, 89),
(2, 20020, 'Cyuzuzo Accarie Davine', '2A', 43, 19),
(3, 20020, 'Louange Lidvine', '2A', 94, 26),
(4, 20020, 'Aimable', '2A', 39, 77),
(5, 20020, 'Kenny Debrice', '2A', 13, 5),
(6, 20020, 'Iradukunda Elissa', '2A', 47, 94),
(7, 20020, 'Aimee Daniella', '2A', 96, 54),
(8, 20020, 'Remy Claudien', '2A', 40, 92),
(9, 20020, 'Tony Herve', '2A', 12, 98),
(10, 20020, 'Agasaro Sandra', '2A', 41, 15),
(11, 20020, 'Faith', '2A', 66, 80),
(12, 20020, 'Cinta Castella', '2A', 9, 57),
(13, 20020, 'Munyaneza Celia', '2A', 47, 43),
(14, 20020, 'Niyongira Bernice', '2A', 9, 46),
(15, 20020, 'Edolyne Exaucee', '2A', 3, 1),
(16, 20020, 'Dan', '2A', 86, 68),
(17, 20020, 'Regis', '2A', 24, 37),
(18, 20020, 'Yves', '2A', 60, 83),
(19, 20020, 'Teta Linda', '2A', 28, 5),
(20, 20020, 'Remy Tresor', '2A', 60, 76),
(21, 20020, 'Hirwa Andy Melvin', '2A', 14, 67),
(22, 20020, 'Thierry', '2A', 93, 6),
(23, 20020, 'Isimbi Marie Deborah', '2A', 23, 30),
(24, 20020, 'Jonas', '2A', 36, 32),
(25, 20020, 'Frank', '2A', 11, 69),
(26, 20020, 'Lisa', '2A', 45, 52),
(27, 20020, 'Anne Leslie', '2A', 92, 53),
(28, 20020, 'Ornella', '2A', 25, 8),
(29, 20020, 'Remy Chiessa', '2A', 50, 84),
(30, 20020, 'Zamzam', '2A', 76, 96);

-- --------------------------------------------------------

--
-- Table structure for table `php_marks_year2b`
--

CREATE TABLE `php_marks_year2b` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `php_marks_year2b`
--

INSERT INTO `php_marks_year2b` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 20020, 'Aime Pacifique', '2B', 39, 28),
(2, 20020, 'Sheja Eduige', '2B', 77, 53),
(3, 20020, 'Blaise', '2B', 67, 81),
(4, 20020, 'Alliance Dieudonne', '2B', 7, 48),
(5, 20020, 'Dieudonne', '2B', 31, 96),
(6, 20020, 'Mugisha Herve', '2B', 33, 35),
(7, 20020, 'Bella Ariane', '2B', 73, 88),
(8, 20020, 'Mustafa', '2B', 68, 37),
(9, 20020, 'Sylvain', '2B', 21, 22),
(10, 20020, 'Angela Lorie', '2B', 99, 99),
(11, 20020, 'Nina Henriette', '2B', 32, 29),
(12, 20020, 'Christelle', '2B', 62, 48),
(13, 20020, 'Jean Marie Vianney', '2B', 17, 54),
(14, 20020, 'Latifa', '2B', 97, 26),
(15, 20020, 'Honorine', '2B', 33, 68),
(16, 20020, 'Noel', '2B', 77, 61),
(17, 20020, 'Lilian', '2B', 85, 4),
(18, 20020, 'Ishimwe Peace', '2B', 94, 39),
(19, 20020, 'Gloria', '2B', 15, 81),
(20, 20020, 'Nzivugira Arsene', '2B', 93, 89),
(21, 20020, 'Nathan', '2B', 21, 2),
(22, 20020, 'Nicola', '2B', 26, 45),
(23, 20020, 'Lydia', '2B', 67, 19),
(24, 20020, 'David', '2B', 56, 59),
(25, 20020, 'Siborurema Christian', '2B', 77, 38),
(26, 20020, 'Nicaise', '2B', 21, 13),
(27, 20020, 'Kevin', '2B', 71, 54),
(28, 20020, 'Rita', '2B', 91, 32),
(29, 20020, 'Agnes', '2B', 44, 99),
(30, 20020, 'Seminega Vanessa', '2B', 47, 0);

-- --------------------------------------------------------

--
-- Table structure for table `php_marks_year2c`
--

CREATE TABLE `php_marks_year2c` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `php_marks_year2d`
--

CREATE TABLE `php_marks_year2d` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `php_marks_year2d`
--

INSERT INTO `php_marks_year2d` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 20020, 'Marie Angele', '2D', 86, 2),
(2, 20020, 'Heritier', '2D', 41, 10),
(3, 20020, 'Yasmine', '2D', 47, 46),
(4, 20020, 'Yves', '2D', 10, 1),
(5, 20020, 'Gloria', '2D', 12, 65),
(6, 20020, 'Bertin', '2D', 29, 22),
(7, 20020, 'Shimirwa Rolande', '2D', 10, 16),
(8, 20020, 'Regis Dieu Merci', '2D', 62, 15),
(9, 20020, 'Blessing Gianna', '2D', 80, 28),
(10, 20020, 'Mudahinyuka Hugues', '2D', 15, 95),
(11, 20020, 'Justin', '2D', 33, 92),
(12, 20020, 'Divine', '2D', 21, 76),
(13, 20020, 'Peace Exaucee', '2D', 8, 4),
(14, 20020, 'Audrey', '2D', 75, 90),
(15, 20020, 'Iriza Celia', '2D', 53, 42),
(16, 20020, 'Louange Liza', '2D', 38, 40),
(17, 20020, 'Moses', '2D', 32, 76),
(18, 20020, 'Jean Aime', '2D', 45, 59),
(19, 20020, 'Shami Innocent', '2D', 28, 67),
(20, 20020, 'Verygood', '2D', 7, 60),
(21, 20020, 'Mike Peter', '2D', 48, 1),
(22, 20020, 'Divin', '2D', 22, 22),
(23, 20020, 'Prince', '2D', 64, 9),
(24, 20020, 'Henri Tresor', '2D', 57, 80),
(25, 20020, 'Naome', '2D', 89, 72),
(26, 20020, 'Ishimwe Arsene', '2D', 77, 20),
(27, 20020, 'Alleluia Queen Doris', '2D', 18, 84),
(28, 20020, 'Honorine', '2D', 60, 60),
(29, 20020, 'Asterie', '2D', 46, 52);

-- --------------------------------------------------------

--
-- Table structure for table `physics`
--

CREATE TABLE `physics` (
  `id` int(11) NOT NULL,
  `cat` int(11) NOT NULL,
  `exam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `physics`
--

INSERT INTO `physics` (`id`, `cat`, `exam`) VALUES
(1, 88, 92),
(2, 80, 88),
(3, 22, 0),
(5, 0, 1),
(5, 0, 1),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0),
(11, 0, 0),
(12, 0, 0),
(13, 0, 0),
(14, 0, 0),
(15, 0, 0),
(16, 0, 0),
(17, 0, 0),
(18, 0, 0),
(19, 0, 0),
(20, 0, 0),
(21, 0, 0),
(22, 0, 0),
(23, 0, 0),
(24, 0, 0),
(25, 0, 0),
(26, 0, 0),
(27, 0, 0),
(28, 0, 0),
(29, 0, 0),
(30, 0, 0),
(31, 0, 0),
(32, 0, 0),
(33, 0, 0),
(34, 0, 0),
(35, 0, 0),
(36, 0, 0),
(37, 0, 0),
(38, 0, 0),
(39, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `physics_marks_year1a`
--

CREATE TABLE `physics_marks_year1a` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class` varchar(10) NOT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `physics_marks_year1a`
--

INSERT INTO `physics_marks_year1a` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 102030, 'Emma Reponse', '1A', 75, 83),
(2, 102031, 'Regine', '1A', 89, 95),
(3, 102032, 'Landry', '1A', 10, 62),
(4, 102033, 'Benite', '1A', 79, 8),
(5, 102034, 'Andre', '1A', 5, 99),
(6, 102035, 'Chael', '1A', 82, 10),
(7, 102036, 'Eliane Mac Monia', '1A', 0, 0),
(8, 102037, 'Danny Mike', '1A', 0, 0),
(9, 102038, 'Charles', '1A', 0, 0),
(10, 102039, 'Elvin', '1A', 0, 0),
(11, 102040, 'Brillante', '1A', 0, 0),
(12, 102041, 'Keren', '1A', 0, 0),
(13, 102042, 'Kevine', '1A', 0, 0),
(14, 102043, 'Princess', '1A', 0, 0),
(15, 102044, 'Souvenir', '1A', 0, 0),
(16, 102045, 'Saly Nelson', '1A', 0, 0),
(17, 102046, 'Nadine', '1A', 0, 0),
(18, 102047, 'Livia', '1A', 0, 0),
(19, 102048, 'Alain', '1A', 0, 0),
(20, 102049, 'Honore', '1A', 0, 0),
(21, 102050, 'Yvan', '1A', 0, 0),
(22, 102051, 'Jeremie', '1A', 0, 0),
(23, 102052, 'Isimbi Vieira', '1A', 0, 0),
(24, 102053, 'Samuel', '1A', 0, 0),
(25, 102054, 'Angel', '1A', 0, 0),
(26, 102055, 'Ruth', '1A', 0, 0),
(27, 102056, 'Esther Hope', '1A', 0, 0),
(28, 102057, 'Olga', '1A', 0, 0),
(29, 102058, 'Ange Kevine', '1A', 0, 0),
(30, 102059, 'Irasubiza', '1A', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `physics_marks_year1b`
--

CREATE TABLE `physics_marks_year1b` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class` varchar(10) NOT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `physics_marks_year1b`
--

INSERT INTO `physics_marks_year1b` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 102030, 'Kessia', '1B', 89, 28),
(2, 102030, 'Aimee Princesse', '1B', 91, 78),
(3, 102030, 'Patrick', '1B', 66, 7),
(4, 102030, 'Christian', '1B', 78, 2),
(5, 102030, 'Fred', '1B', 92, 88),
(6, 102030, 'Emmanuel', '1B', 81, 33),
(7, 102030, 'Jolie Princesse', '1B', 85, 3),
(8, 102030, 'Beni Samuel', '1B', 59, 15),
(9, 102030, 'Hyguette', '1B', 77, 68),
(10, 102030, 'Sergine', '1B', 61, 94),
(11, 102030, 'Neilla Gisa', '1B', 80, 67),
(12, 102030, 'Ivan', '1B', 82, 55),
(13, 102030, 'Chrispin', '1B', 90, 75),
(14, 102030, 'Prosper', '1B', 68, 11),
(15, 102030, 'Reine Kheira', '1B', 72, 31),
(16, 102030, 'Loicke Bedo', '1B', 55, 22),
(17, 102030, 'Marie Ange Gabriella', '1B', 84, 17),
(18, 102030, 'Oreste', '1B', 66, 20),
(19, 102030, 'Raphael', '1B', 74, 50),
(20, 102030, 'Cynthia Marie', '1B', 88, 92),
(21, 102030, 'Divine', '1B', 64, 9),
(22, 102030, 'Patrick', '1B', 92, 69),
(23, 102030, 'Prince', '1B', 79, 19),
(24, 102030, 'David', '1B', 75, 90),
(25, 102030, 'Marie', '1B', 83, 95),
(26, 102030, 'Paradie Emmanuella', '1B', 67, 2),
(27, 102030, 'Tracy', '1B', 91, 25),
(28, 102030, 'Christian', '1B', 86, 19),
(29, 102030, 'Nice Josiane', '1B', 77, 23),
(30, 102030, 'Sylvie', '1B', 88, 59);

-- --------------------------------------------------------

--
-- Table structure for table `physics_marks_year1c`
--

CREATE TABLE `physics_marks_year1c` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `physics_marks_year1c`
--

INSERT INTO `physics_marks_year1c` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 102030, 'Nikita', '1C', 74, 25),
(2, 102030, 'Bonny', '1C', 66, 50),
(3, 102030, 'Joyeuse', '1C', 79, 75),
(4, 102030, 'Love', '1C', 62, 24),
(5, 102030, 'Leandre', '1C', 84, 98),
(6, 102030, 'Kenny', '1C', 80, 16),
(7, 102030, 'Aimable', '1C', 89, 87),
(8, 102030, 'Albert', '1C', 77, 86),
(9, 102030, 'Prince Babou', '1C', 68, 70),
(10, 102030, 'Melvin', '1C', 76, 93),
(11, 102030, 'Gloire Marie', '1C', 69, 56),
(12, 102030, 'Faith', '1C', 75, 2),
(13, 102030, 'Pacifique', '1C', 72, 41),
(14, 102030, 'Pascal', '1C', 94, 2),
(15, 102030, 'Samuella', '1C', 87, 86),
(16, 102030, 'Jessica', '1C', 82, 23),
(17, 102030, 'Patience Isimbi', '1C', 88, 58),
(18, 102030, 'Ciara', '1C', 79, 22),
(19, 102030, 'Nicole', '1C', 91, 36),
(20, 102030, 'Hope', '1C', 78, 14),
(21, 102030, 'Paulin', '1C', 74, 63),
(22, 102030, 'Annick', '1C', 82, 74),
(23, 102030, 'Prince', '1C', 83, 81),
(24, 102030, 'Laurent', '1C', 80, 82),
(25, 102030, 'Salim', '1C', 76, 68),
(26, 102030, 'Gael', '1C', 84, 95),
(27, 102030, 'Raissa', '1C', 88, 71),
(28, 102030, 'Darlene', '1C', 92, 69),
(29, 102030, 'Narasha', '1C', 79, 35),
(30, 102030, 'Mahinga Rodin', '1C', 91, 69);

-- --------------------------------------------------------

--
-- Table structure for table `physics_marks_year1d`
--

CREATE TABLE `physics_marks_year1d` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `physics_marks_year1d`
--

INSERT INTO `physics_marks_year1d` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 102030, 'Elise', '1D', 76, 38),
(2, 102030, 'Emile', '1D', 67, 83),
(3, 102030, 'Beatrice', '1D', 82, 4),
(4, 102030, 'Derick', '1D', 59, 69),
(5, 102030, 'Eliel', '1D', 83, 34),
(6, 102030, 'Grace', '1D', 75, 62),
(7, 102030, 'Trinity', '1D', 78, 9),
(8, 102030, 'Kathy', '1D', 72, 60),
(9, 102030, 'Nelson', '1D', 91, 74),
(10, 102030, 'Sandrine', '1D', 77, 90),
(11, 102030, 'Olivia', '1D', 64, 27),
(12, 102030, 'Fabiola', '1D', 89, 69),
(13, 102030, 'Theophile', '1D', 73, 61),
(14, 102030, 'Hosea', '1D', 84, 2),
(15, 102030, 'Vicky', '1D', 90, 26),
(16, 102030, 'Maurice', '1D', 62, 23),
(17, 102030, 'Dieudonne', '1D', 78, 37),
(18, 102030, 'Marie Noel', '1D', 65, 16),
(19, 102030, 'Elie', '1D', 88, 71),
(20, 102030, 'Ernest', '1D', 76, 9),
(21, 102030, 'Marlene', '1D', 83, 31),
(22, 102030, 'Felicien', '1D', 68, 28),
(23, 102030, 'Peter', '1D', 79, 50),
(24, 102030, 'Celestin', '1D', 88, 63),
(25, 102030, 'Gilbert', '1D', 72, 68),
(26, 102030, 'Aline', '1D', 91, 50),
(27, 102030, 'Pacis', '1D', 70, 47),
(28, 102030, 'Benie', '1D', 87, 86),
(29, 102030, 'Jules', '1D', 78, 88),
(30, 102030, 'Ellen', '1D', 75, 84);

-- --------------------------------------------------------

--
-- Table structure for table `physics_marks_year2a`
--

CREATE TABLE `physics_marks_year2a` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `physics_marks_year2a`
--

INSERT INTO `physics_marks_year2a` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 20020, 'Viateur', '2A', 34, 55),
(2, 20020, 'Cyuzuzo Accarie Davine', '2A', 21, 23),
(3, 20020, 'Louange Lidvine', '2A', 1, 53),
(4, 20020, 'Aimable', '2A', 44, 97),
(5, 20020, 'Kenny Debrice', '2A', 17, 24),
(6, 20020, 'Iradukunda Elissa', '2A', 51, 32),
(7, 20020, 'Aimee Daniella', '2A', 3, 87),
(8, 20020, 'Remy Claudien', '2A', 64, 38),
(9, 20020, 'Tony Herve', '2A', 9, 31),
(10, 20020, 'Agasaro Sandra', '2A', 54, 40),
(11, 20020, 'Faith', '2A', 41, 10),
(12, 20020, 'Cinta Castella', '2A', 45, 27),
(13, 20020, 'Munyaneza Celia', '2A', 0, 9),
(14, 20020, 'Niyongira Bernice', '2A', 68, 62),
(15, 20020, 'Edolyne Exaucee', '2A', 38, 86),
(16, 20020, 'Dan', '2A', 86, 45),
(17, 20020, 'Regis', '2A', 15, 67),
(18, 20020, 'Yves', '2A', 18, 98),
(19, 20020, 'Teta Linda', '2A', 46, 93),
(20, 20020, 'Remy Tresor', '2A', 73, 68),
(21, 20020, 'Hirwa Andy Melvin', '2A', 30, 64),
(22, 20020, 'Thierry', '2A', 32, 16),
(23, 20020, 'Isimbi Marie Deborah', '2A', 67, 87),
(24, 20020, 'Jonas', '2A', 40, 88),
(25, 20020, 'Frank', '2A', 98, 81),
(26, 20020, 'Lisa', '2A', 72, 39),
(27, 20020, 'Anne Leslie', '2A', 64, 52),
(28, 20020, 'Ornella', '2A', 3, 46),
(29, 20020, 'Remy Chiessa', '2A', 23, 75),
(30, 20020, 'Zamzam', '2A', 9, 35);

-- --------------------------------------------------------

--
-- Table structure for table `physics_marks_year2b`
--

CREATE TABLE `physics_marks_year2b` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `physics_marks_year2b`
--

INSERT INTO `physics_marks_year2b` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 20020, 'Aime Pacifique', '2B', 30, 51),
(2, 20020, 'Sheja Eduige', '2B', 23, 51),
(3, 20020, 'Blaise', '2B', 22, 3),
(4, 20020, 'Alliance Dieudonne', '2B', 41, 64),
(5, 20020, 'Dieudonne', '2B', 40, 11),
(6, 20020, 'Mugisha Herve', '2B', 78, 61),
(7, 20020, 'Bella Ariane', '2B', 69, 75),
(8, 20020, 'Mustafa', '2B', 13, 93),
(9, 20020, 'Sylvain', '2B', 56, 39),
(10, 20020, 'Angela Lorie', '2B', 40, 18),
(11, 20020, 'Nina Henriette', '2B', 33, 74),
(12, 20020, 'Christelle', '2B', 44, 17),
(13, 20020, 'Jean Marie Vianney', '2B', 20, 62),
(14, 20020, 'Latifa', '2B', 71, 59),
(15, 20020, 'Honorine', '2B', 92, 9),
(16, 20020, 'Noel', '2B', 49, 71),
(17, 20020, 'Lilian', '2B', 68, 28),
(18, 20020, 'Ishimwe Peace', '2B', 94, 25),
(19, 20020, 'Gloria', '2B', 65, 43),
(20, 20020, 'Nzivugira Arsene', '2B', 45, 41),
(21, 20020, 'Nathan', '2B', 27, 75),
(22, 20020, 'Nicola', '2B', 3, 52),
(23, 20020, 'Lydia', '2B', 34, 36),
(24, 20020, 'David', '2B', 60, 23),
(25, 20020, 'Siborurema Christian', '2B', 98, 7),
(26, 20020, 'Nicaise', '2B', 12, 68),
(27, 20020, 'Kevin', '2B', 63, 21),
(28, 20020, 'Rita', '2B', 80, 2),
(29, 20020, 'Agnes', '2B', 12, 46),
(30, 20020, 'Seminega Vanessa', '2B', 17, 23);

-- --------------------------------------------------------

--
-- Table structure for table `physics_marks_year2c`
--

CREATE TABLE `physics_marks_year2c` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `physics_marks_year2d`
--

CREATE TABLE `physics_marks_year2d` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `CAT` int(11) DEFAULT NULL,
  `EXAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `physics_marks_year2d`
--

INSERT INTO `physics_marks_year2d` (`id`, `student_id`, `name`, `class`, `CAT`, `EXAM`) VALUES
(1, 20020, 'Marie Angele', '2D', 1, 79),
(2, 20020, 'Heritier', '2D', 66, 28),
(3, 20020, 'Yasmine', '2D', 27, 1),
(4, 20020, 'Yves', '2D', 38, 24),
(5, 20020, 'Gloria', '2D', 9, 15),
(6, 20020, 'Bertin', '2D', 31, 5),
(7, 20020, 'Shimirwa Rolande', '2D', 29, 79),
(8, 20020, 'Regis Dieu Merci', '2D', 52, 81),
(9, 20020, 'Blessing Gianna', '2D', 73, 67),
(10, 20020, 'Mudahinyuka Hugues', '2D', 9, 95),
(11, 20020, 'Justin', '2D', 26, 73),
(12, 20020, 'Divine', '2D', 4, 82),
(13, 20020, 'Peace Exaucee', '2D', 41, 91),
(14, 20020, 'Audrey', '2D', 93, 11),
(15, 20020, 'Iriza Celia', '2D', 42, 81),
(16, 20020, 'Louange Liza', '2D', 31, 73),
(17, 20020, 'Moses', '2D', 27, 22),
(18, 20020, 'Jean Aime', '2D', 45, 92),
(19, 20020, 'Shami Innocent', '2D', 43, 96),
(20, 20020, 'Verygood', '2D', 80, 4),
(21, 20020, 'Mike Peter', '2D', 73, 31),
(22, 20020, 'Divin', '2D', 22, 42),
(23, 20020, 'Prince', '2D', 92, 21),
(24, 20020, 'Henri Tresor', '2D', 96, 77),
(25, 20020, 'Naome', '2D', 1, 23),
(26, 20020, 'Ishimwe Arsene', '2D', 17, 86),
(27, 20020, 'Alleluia Queen Doris', '2D', 81, 60),
(28, 20020, 'Honorine', '2D', 54, 42),
(29, 20020, 'Asterie', '2D', 30, 31);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stud_id` int(11) NOT NULL,
  `studentName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stud_id`, `studentName`, `email`, `password`) VALUES
(1, 'honore', 'honore@gmail.com', 'honore250'),
(2, 'nelson', 'nelson@gmail.com', 'nelson250');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `academic_year` varchar(50) NOT NULL,
  `parent` varchar(255) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `age`, `gender`, `email`, `password`, `academic_year`, `parent`, `contact`, `image`) VALUES
(1, 'Ange Nadette', 18, 'Female', 'ange.nadette@example.com', 'password1', 'Year 1', 'Parent Nadette', '+250780123456', ''),
(2, 'Auda Beta', 19, 'Male', 'auda.beta@example.com', 'password2', 'Year 1', 'Parent Beta', '+250780123457', ''),
(3, 'TURIKUMWENIMANA LANDRY', 20, 'Male', 'landry@example.com', 'password123', 'Year 1', 'Parent Landry', '+250123456789', ''),
(4, 'Josue', 18, 'Male', 'josue@example.com', 'password4', 'Year 1', 'Parent Josue', '+250780123459', ''),
(5, 'Ghislain', 19, 'Male', 'ghislain@example.com', 'password5', 'Year 1', 'Parent Ghislain', '+250780123460', ''),
(6, 'Niyonizeye Joric Paladi', 20, 'Male', 'joric.paladi@example.com', 'password6', 'Year 1', 'Parent Joric Paladi', '+250780123461', ''),
(7, 'Rukundo Hope', 18, 'Female', 'rukundo.hope@example.com', 'password7', 'Year 1', 'Parent Rukundo', '+250780123462', ''),
(8, 'Sangwa Sean', 19, 'Male', 'sangwa.sean@example.com', 'password8', 'Year 1', 'Parent Sangwa', '+250780123463', ''),
(9, 'Bella Blandine', 20, 'Female', 'bella.blandine@example.com', 'password9', 'Year 1', 'Parent Bella', '+250780123464', ''),
(10, 'Lucky Believe', 18, 'Male', 'lucky.believe@example.com', 'password10', 'Year 1', 'Parent Lucky', '+250780123465', ''),
(11, 'Nicole', 19, 'Female', 'nicole@example.com', 'password11', 'Year 1', 'Parent Nicole', '+250780123466', ''),
(12, 'Benie Giramata', 20, 'Female', 'benie.giramata@example.com', 'password12', 'Year 1', 'Parent Benie', '+250780123467', ''),
(13, 'Joella', 18, 'Female', 'joella@example.com', 'password13', 'Year 1', 'Parent Joella', '+250780123468', ''),
(14, 'Chloe', 19, 'Female', 'chloe@example.com', 'password14', 'Year 1', 'Parent Chloe', '+250780123469', ''),
(15, 'Fabrice', 20, 'Male', 'fabrice@example.com', 'password15', 'Year 1', 'Parent Fabrice', '+250780123470', ''),
(16, 'Mugisha Benjamin', 18, 'Male', 'mugisha.benjamin@example.com', 'password16', 'Year 1', 'Parent Mugisha', '+250780123471', ''),
(17, 'Sammy', 19, 'Male', 'sammy@example.com', 'password17', 'Year 1', 'Parent Sammy', '+250780123472', ''),
(18, 'Ineza Emmy Gretta', 20, 'Female', 'ineza.emmy@example.com', 'password18', 'Year 1', 'Parent Ineza', '+250780123473', ''),
(19, 'Akuzwe Gisele', 18, 'Female', 'akuzwe.gisele@example.com', 'password19', 'Year 1', 'Parent Akuzwe', '+250780123474', ''),
(20, 'Teta Sangwa Assia', 19, 'Female', 'teta.assia@example.com', 'password20', 'Year 1', 'Parent Teta Assia', '+250780123475', ''),
(21, 'Elite', 20, 'Male', 'elite@example.com', 'password21', 'Year 1', 'Parent Elite', '+250780123476', ''),
(22, 'Bruce', 18, 'Male', 'bruce@example.com', 'password22', 'Year 1', 'Parent Bruce', '+250780123477', ''),
(23, 'Jean De Dieu', 19, 'Male', 'jean.dieu@example.com', 'password23', 'Year 1', 'Parent Jean De Dieu', '+250780123478', ''),
(24, 'Mutoni Belinda', 20, 'Female', 'mutoni.belinda@example.com', 'password24', 'Year 1', 'Parent Mutoni', '+250780123479', ''),
(25, 'Edouard', 18, 'Male', 'edouard@example.com', 'password25', 'Year 1', 'Parent Edouard', '+250780123480', ''),
(26, 'Elissa', 19, 'Female', 'elissa@example.com', 'password26', 'Year 1', 'Parent Elissa', '+250780123481', ''),
(27, 'Kaze Joanna Michelle', 20, 'Female', 'kaze.michelle@example.com', 'password27', 'Year 1', 'Parent Kaze Michelle', '+250780123482', ''),
(28, 'Denyse', 18, 'Female', 'denyse@example.com', 'password28', 'Year 1', 'Parent Denyse', '+250780123483', ''),
(29, 'Sheja Joie Darlene', 19, 'Female', 'sheja.darlene@example.com', 'password29', 'Year 1', 'Parent Sheja', '+250780123484', ''),
(30, 'Singizwa Ella', 20, 'Female', 'singizwa.ella@example.com', 'password30', 'Year 1', 'Parent Singizwa', '+250780123485', ''),
(31, 'Aime Pacifique', 18, 'Male', 'aime.pacifique@example.com', 'password31', 'Year 1', 'Parent Aime', '+250780123486', ''),
(32, 'Sheja Eduige', 19, 'Female', 'sheja.eduige@example.com', 'password32', 'Year 1', 'Parent Sheja Eduige', '+250780123487', ''),
(33, 'Blaise', 20, 'Male', 'blaise@example.com', 'password33', 'Year 1', 'Parent Blaise', '+250780123488', ''),
(34, 'Alliance Dieudonne', 18, 'Male', 'alliance.dieudonne@example.com', 'password34', 'Year 1', 'Parent Alliance', '+250780123489', ''),
(35, 'Dieudonne', 19, 'Male', 'dieudonne@example.com', 'password35', 'Year 1', 'Parent Dieudonne', '+250780123490', ''),
(36, 'Mugisha Herve', 20, 'Male', 'mugisha.herve@example.com', 'password36', 'Year 1', 'Parent Mugisha Herve', '+250780123491', ''),
(37, 'Bella Ariane', 18, 'Female', 'bella.ariane@example.com', 'password37', 'Year 1', 'Parent Bella Ariane', '+250780123492', ''),
(38, 'Mustafa', 19, 'Male', 'mustafa@example.com', 'password38', 'Year 1', 'Parent Mustafa', '+250780123493', ''),
(39, 'Sylvain', 20, 'Male', 'sylvain@example.com', 'password39', 'Year 1', 'Parent Sylvain', '+250780123494', ''),
(40, 'Angela Lorie', 18, 'Female', 'angela.lorie@example.com', 'password40', 'Year 1', 'Parent Angela Lorie', '+250780123495', ''),
(41, 'Nina Henriette', 19, 'Female', 'nina.henriette@example.com', 'password41', 'Year 1', 'Parent Nina Henriette', '+250780123496', ''),
(42, 'Christelle', 20, 'Female', 'christelle@example.com', 'password42', 'Year 1', 'Parent Christelle', '+250780123497', ''),
(43, 'Jean Marie Vianney', 18, 'Male', 'jean.vianney@example.com', 'password43', 'Year 1', 'Parent Jean Vianney', '+250780123498', ''),
(44, 'Latifa', 19, 'Female', 'latifa@example.com', 'password44', 'Year 1', 'Parent Latifa', '+250780123499', ''),
(45, 'Honorine', 20, 'Female', 'honorine@example.com', 'password45', 'Year 1', 'Parent Honorine', '+250780123400', ''),
(46, 'Noel', 18, 'Male', 'noel@example.com', 'password46', 'Year 1', 'Parent Noel', '+250780123401', ''),
(47, 'Lilian', 19, 'Female', 'lilian@example.com', 'password47', 'Year 1', 'Parent Lilian', '+250780123402', ''),
(48, 'Ishimwe Peace', 20, 'Female', 'ishimwe.peace@example.com', 'password48', 'Year 1', 'Parent Ishimwe Peace', '+250780123403', ''),
(49, 'Gloria', 18, 'Female', 'gloria@example.com', 'password49', 'Year 1', 'Parent Gloria', '+250780123404', ''),
(50, 'Nzivugira Arsene', 19, 'Male', 'nzivugira.arsene@example.com', 'password50', 'Year 1', 'Parent Arsene', '+250780123405', ''),
(51, 'Nathan', 18, 'Male', 'nathan@example.com', 'password51', 'Year 1', 'Parent Nathan', '+250780123406', ''),
(52, 'Esther', 19, 'Female', 'esther@example.com', 'password52', 'Year 1', 'Parent Esther', '+250780123407', ''),
(53, 'Immaculee', 20, 'Female', 'immaculee@example.com', 'password53', 'Year 1', 'Parent Immaculee', '+250780123408', ''),
(54, 'Gad', 18, 'Male', 'gad@example.com', 'password54', 'Year 1', 'Parent Gad', '+250780123409', ''),
(55, 'Audrey', 19, 'Female', 'audrey@example.com', 'password55', 'Year 1', 'Parent Audrey', '+250780123410', ''),
(56, 'Patrick', 20, 'Male', 'patrick@example.com', 'password56', 'Year 1', 'Parent Patrick', '+250780123411', ''),
(57, 'Esperance', 18, 'Female', 'esperance@example.com', 'password57', 'Year 1', 'Parent Esperance', '+250780123412', ''),
(58, 'Trinity', 19, 'Female', 'trinity@example.com', 'password58', 'Year 1', 'Parent Trinity', '+250780123413', ''),
(59, 'Angela', 20, 'Female', 'angela@example.com', 'password59', 'Year 1', 'Parent Angela', '+250780123414', ''),
(60, 'Eric', 18, 'Male', 'eric@example.com', 'password60', 'Year 1', 'Parent Eric', '+250780123415', ''),
(61, 'Nadine', 19, 'Female', 'nadine@example.com', 'password61', 'Year 1', 'Parent Nadine', '+250780123416', ''),
(62, 'Kelvin', 20, 'Male', 'kelvin@example.com', 'password62', 'Year 1', 'Parent Kelvin', '+250780123417', ''),
(63, 'Ange', 18, 'Male', 'ange@example.com', 'password63', 'Year 1', 'Parent Ange', '+250780123418', ''),
(64, 'Nathalie', 19, 'Female', 'nathalie@example.com', 'password64', 'Year 1', 'Parent Nathalie', '+250780123419', ''),
(65, 'Jonathan', 20, 'Male', 'jonathan@example.com', 'password65', 'Year 1', 'Parent Jonathan', '+250780123420', ''),
(66, 'Chantal', 18, 'Female', 'chantal@example.com', 'password66', 'Year 1', 'Parent Chantal', '+250780123421', ''),
(67, 'Patricia', 19, 'Female', 'patricia@example.com', 'password67', 'Year 1', 'Parent Patricia', '+250780123422', ''),
(68, 'James', 20, 'Male', 'james@example.com', 'password68', 'Year 1', 'Parent James', '+250780123423', ''),
(69, 'Josiane', 18, 'Female', 'josiane@example.com', 'password69', 'Year 1', 'Parent Josiane', '+250780123424', ''),
(70, 'Marie Claire', 19, 'Female', 'marie.claire@example.com', 'password70', 'Year 1', 'Parent Marie Claire', '+250780123425', ''),
(71, 'Serge', 20, 'Male', 'serge@example.com', 'password71', 'Year 1', 'Parent Serge', '+250780123426', ''),
(72, 'Manzi', 18, 'Male', 'manzi@example.com', 'password72', 'Year 1', 'Parent Manzi', '+250780123427', ''),
(73, 'Jack', 19, 'Male', 'jack@example.com', 'password73', 'Year 1', 'Parent Jack', '+250780123428', ''),
(74, 'Clarisse', 20, 'Female', 'clarisse@example.com', 'password74', 'Year 1', 'Parent Clarisse', '+250780123429', ''),
(75, 'Max', 18, 'Male', 'max@example.com', 'password75', 'Year 1', 'Parent Max', '+250780123430', ''),
(76, 'Clara', 19, 'Female', 'clara@example.com', 'password76', 'Year 1', 'Parent Clara', '+250780123431', ''),
(77, 'Paul', 20, 'Male', 'paul@example.com', 'password77', 'Year 1', 'Parent Paul', '+250780123432', ''),
(78, 'Marie', 18, 'Female', 'marie@example.com', 'password78', 'Year 1', 'Parent Marie', '+250780123433', ''),
(79, 'Jean', 19, 'Male', 'jean@example.com', 'password79', 'Year 1', 'Parent Jean', '+250780123434', ''),
(80, 'Lina', 20, 'Female', 'lina@example.com', 'password80', 'Year 1', 'Parent Lina', '+250780123435', ''),
(81, 'Josephine', 18, 'Female', 'josephine@example.com', 'password81', 'Year 1', 'Parent Josephine', '+250780123436', ''),
(82, 'Desire', 19, 'Male', 'desire@example.com', 'password82', 'Year 1', 'Parent Desire', '+250780123437', ''),
(83, 'Juliette', 20, 'Female', 'juliette@example.com', 'password83', 'Year 1', 'Parent Juliette', '+250780123438', ''),
(84, 'Jules', 18, 'Male', 'jules@example.com', 'password84', 'Year 1', 'Parent Jules', '+250780123439', ''),
(85, 'Brenda', 19, 'Female', 'brenda@example.com', 'password85', 'Year 1', 'Parent Brenda', '+250780123440', ''),
(86, 'Frank', 20, 'Male', 'frank@example.com', 'password86', 'Year 1', 'Parent Frank', '+250780123441', ''),
(87, 'Jean Paul', 18, 'Male', 'jean.paul@example.com', 'password87', 'Year 1', 'Parent Jean Paul', '+250780123442', ''),
(88, 'Alain', 19, 'Male', 'alain@example.com', 'password88', 'Year 1', 'Parent Alain', '+250780123443', ''),
(89, 'Irene', 20, 'Female', 'irene@example.com', 'password89', 'Year 1', 'Parent Irene', '+250780123444', ''),
(90, 'Steven', 18, 'Male', 'steven@example.com', 'password90', 'Year 1', 'Parent Steven', '+250780123445', ''),
(91, 'Carine', 19, 'Female', 'carine@example.com', 'password91', 'Year 1', 'Parent Carine', '+250780123446', ''),
(92, 'Jacques', 20, 'Male', 'jacques@example.com', 'password92', 'Year 1', 'Parent Jacques', '+250780123447', ''),
(93, 'Josiane N', 18, 'Female', 'josiane.n@example.com', 'password93', 'Year 1', 'Parent Josiane N', '+250780123448', ''),
(94, 'Eva', 19, 'Female', 'eva@example.com', 'password94', 'Year 1', 'Parent Eva', '+250780123449', ''),
(95, 'Jean Bosco', 20, 'Male', 'jean.bosco@example.com', 'password95', 'Year 1', 'Parent Jean Bosco', '+250780123450', ''),
(96, 'Uwamahoro', 18, 'Female', 'uwamahoro@example.com', 'password96', 'Year 1', 'Parent Uwamahoro', '+250780123451', ''),
(97, 'Nicole K', 19, 'Female', 'nicole.k@example.com', 'password97', 'Year 1', 'Parent Nicole K', '+250780123452', ''),
(98, 'Yvette', 20, 'Female', 'yvette@example.com', 'password98', 'Year 1', 'Parent Yvette', '+250780123453', ''),
(99, 'Alice', 18, 'Female', 'alice@example.com', 'password99', 'Year 1', 'Parent Alice', '+250780123454', ''),
(100, 'Athanase', 19, 'Male', 'athanase@example.com', 'password100', 'Year 1', 'Parent Athanase', '+250780123455', ''),
(101, 'Emma Reponse', 18, 'Female', 'emma.reponse@example.com', 'password123', 'Year 1', 'Parent Reponse', '+250123456789', ''),
(102, 'Regine', 19, 'Female', 'regine@example.com', 'password123', 'Year 1', 'Parent Regine', '+250123456789', ''),
(104, 'Benite', 18, 'Female', 'benite@example.com', 'password123', 'Year 1', 'Parent Benite', '+250123456789', ''),
(105, 'Andre', 19, 'Male', 'andre@example.com', 'password123', 'Year 1', 'Parent Andre', '+250123456789', ''),
(106, 'Chael', 20, 'Male', 'chael@example.com', 'password123', 'Year 1', 'Parent Chael', '+250123456789', ''),
(107, 'Eliane Mac Monia', 18, 'Female', 'eliane.mac@example.com', 'password123', 'Year 1', 'Parent Eliane', '+250123456789', ''),
(108, 'Danny Mike', 19, 'Male', 'danny.mike@example.com', 'password123', 'Year 1', 'Parent Danny', '+250123456789', ''),
(109, 'Charles', 20, 'Male', 'charles@example.com', 'password123', 'Year 1', 'Parent Charles', '+250123456789', ''),
(110, 'Elvin', 18, 'Male', 'elvin@example.com', 'password123', 'Year 1', 'Parent Elvin', '+250123456789', ''),
(111, 'Brillante', 19, 'Female', 'brillante@example.com', 'password123', 'Year 1', 'Parent Brillante', '+250123456789', ''),
(112, 'Keren', 20, 'Female', 'keren@example.com', 'password123', 'Year 1', 'Parent Keren', '+250123456789', ''),
(113, 'Kevine', 18, 'Male', 'kevine@example.com', 'password123', 'Year 1', 'Parent Kevine', '+250123456789', ''),
(114, 'Princess', 19, 'Female', 'princess@example.com', 'password123', 'Year 1', 'Parent Princess', '+250123456789', ''),
(115, 'Souvenir', 20, 'Male', 'souvenir@example.com', 'password123', 'Year 1', 'Parent Souvenir', '+250123456789', ''),
(116, 'Saly Nelson', 18, 'Female', 'saly.nelson@example.com', 'password123', 'Year 1', 'Parent Saly', '+250123456789', ''),
(117, 'Nadine', 19, 'Female', 'nadine@example.com', 'password123', 'Year 1', 'Parent Nadine', '+250123456789', ''),
(118, 'Livia', 20, 'Female', 'livia@example.com', 'password123', 'Year 1', 'Parent Livia', '+250123456789', ''),
(119, 'Alain', 18, 'Male', 'alain@example.com', 'password123', 'Year 1', 'Parent Alain', '+250123456789', ''),
(120, 'Honore', 19, 'Male', 'honore@example.com', 'password123', 'Year 1', 'Parent Honore', '+250123456789', ''),
(121, 'Yvan', 20, 'Male', 'yvan@example.com', 'password123', 'Year 1', 'Parent Yvan', '+250123456789', ''),
(122, 'Jeremie', 18, 'Male', 'jeremie@example.com', 'password123', 'Year 1', 'Parent Jeremie', '+250123456789', ''),
(123, 'Isimbi Vieira', 19, 'Female', 'isimbi.vieira@example.com', 'password123', 'Year 1', 'Parent Isimbi', '+250123456789', ''),
(124, 'Samuel', 20, 'Male', 'samuel@example.com', 'password123', 'Year 1', 'Parent Samuel', '+250123456789', ''),
(125, 'Angel', 18, 'Female', 'angel@example.com', 'password123', 'Year 1', 'Parent Angel', '+250123456789', ''),
(126, 'Ruth', 19, 'Female', 'ruth@example.com', 'password123', 'Year 1', 'Parent Ruth', '+250123456789', ''),
(127, 'Esther Hope', 20, 'Female', 'esther.hope@example.com', 'password123', 'Year 1', 'Parent Esther', '+250123456789', ''),
(128, 'Olga', 18, 'Female', 'olga@example.com', 'password123', 'Year 1', 'Parent Olga', '+250123456789', ''),
(129, 'Ange Kevine', 19, 'Male', 'ange.kevine@example.com', 'password123', 'Year 1', 'Parent Ange', '+250123456789', ''),
(202, 'IRASUBIZA Saly Nelson', 100, 'male', 'irasubizasalynelson@gmail.com', 'nelson', '2024', 'sarongo', '0788763827', 'IMG-20240630-WA0010.jpg'),
(203, 'IRASUBIZA Saly Nelson', 10, 'male', 'nelson@gmail.com', 'nelson', '3033', 'sarongo', '98767890987789098', 'fike.jpg'),
(204, 'mama', 23, 'male', 'mama@gmail.com', 'nelsondf', '4567', 'nelsonn', '346789056', 'baby (2).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE `student_courses` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_messages`
--

CREATE TABLE `student_messages` (
  `id` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `student_email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date_written` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_messages`
--

INSERT INTO `student_messages` (`id`, `student_name`, `student_email`, `message`, `date_written`, `delivery_date`) VALUES
(1, 'nelson', 'irasubizasalynelson@gmail.com', 'nelson', NULL, NULL),
(2, 'saly', 'saliskdjf@gkdsf.dfijds', 'hii', NULL, NULL),
(3, 'gadi', 'irasubiza@gadi.com', 'hello', NULL, NULL),
(4, 'gloria', 'gloria@gmail.com', 'chefftaine', NULL, NULL),
(7, 'nelson', 'nelson@gmail.com', 'my name is nelson, i am an artist. one of my song is called embeded systems, anotehr is phyics', NULL, NULL),
(15, 'Michael Johnson', 'michael.johnson@example.com', 'This is a sample message 3', '2024-06-06', '2024-06-13'),
(17, 'David Brown', 'david.brown@example.com', 'This is a sample message 5', '2024-06-06', '2024-06-13');

-- --------------------------------------------------------

--
-- Table structure for table `student_records`
--

CREATE TABLE `student_records` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `is_sick` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_records`
--

INSERT INTO `student_records` (`id`, `name`, `age`, `grade`, `is_sick`) VALUES
(1, 'John Doe', 18, 'A', 0),
(2, 'Jane Smith', 17, 'B', 1),
(3, 'Michael Johnson', 19, 'A', 0),
(4, 'Emily Davis', 16, 'C', 1),
(5, 'David Lee', 20, 'B', 0),
(6, 'Sarah Kim', 17, 'A', 1),
(7, 'James Park', 18, 'C', 0),
(8, 'Lisa Chen', 19, 'B', 1),
(9, 'Michael Zhang', 16, 'A', 0),
(10, 'Emily Wang', 17, 'C', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `subject` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `email`, `password`, `subject`) VALUES
(1, 'maths@gmail.com', 'maths_password', 'maths'),
(2, 'physics@gmail.com', 'physics_password', 'physics'),
(7, 'wui@gmail.com', 'WUI', 'WUI'),
(8, 'gui@gmail.com', 'GUI', 'GUI'),
(9, 'fundamentals@gmail.com', 'fundamentals_of_programming', 'fundamentals_of_programming'),
(10, 'networking@gmail.com', 'networking', 'networking'),
(11, 'php@gmail.com', 'php', 'php'),
(12, 'javascript@gmail.com', 'javascript', 'javascript'),
(13, 'english@gmail.com', 'english', 'english');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `filename`, `file_path`, `uploaded_at`) VALUES
(1, 'ResultSlip.pdf', 'assignments/ResultSlip.pdf', '2024-06-07 13:56:16'),
(2, 'ResultSlip_3.pdf', 'assignments/ResultSlip_3.pdf', '2024-06-07 14:28:08'),
(3, 'ResultSlip_2.pdf', 'assignments/ResultSlip_2.pdf', '2024-06-07 14:28:18'),
(4, 'ResultSlip_4.pdf', 'assignments/ResultSlip_4.pdf', '2024-06-07 14:28:18'),
(5, 'ResultSlip_5.pdf', 'assignments/ResultSlip_5.pdf', '2024-06-07 14:28:18'),
(6, 'ResultSlip_6.pdf', 'assignments/ResultSlip_6.pdf', '2024-06-07 14:28:18'),
(7, 'internetbanking.sql', 'assignments/internetbanking.sql', '2024-06-26 19:40:08'),
(8, 'akarabo.jpg', 'assignments/akarabo.jpg', '2024-07-07 12:25:47'),
(9, 'akandi.png', 'assignments/akandi.png', '2024-07-07 12:28:54'),
(10, 'big_mitzing.jpg', 'assignments/big_mitzing.jpg', '2024-07-08 11:29:43'),
(11, 'fike.jpg', 'assignments/fike.jpg', '2024-07-10 20:51:43');

-- --------------------------------------------------------

--
-- Table structure for table `wui`
--

CREATE TABLE `wui` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `cat_marks` int(11) DEFAULT NULL,
  `exam_marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wui`
--

INSERT INTO `wui` (`id`, `student_id`, `cat_marks`, `exam_marks`) VALUES
(1, 1, 85, 90),
(2, 2, 80, 85);

-- --------------------------------------------------------

--
-- Table structure for table `year1a_marks`
--

CREATE TABLE `year1a_marks` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `max_marks` int(11) NOT NULL,
  `course` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `year1a_marks`
--

INSERT INTO `year1a_marks` (`id`, `date`, `max_marks`, `course`, `password`) VALUES
(1, '1212-12-12', 100, 'phsics', 'physics'),
(2, '1212-12-12', 100, 'phsics', 'physics'),
(3, '1212-12-12', 100, 'phsics', 'physics');

-- --------------------------------------------------------

--
-- Structure for view `nelson`
--
DROP TABLE IF EXISTS `nelson`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nelson`  AS SELECT `students`.`name` AS `name` FROM `students` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `closed_notifications`
--
ALTER TABLE `closed_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `discipline`
--
ALTER TABLE `discipline`
  ADD KEY `id` (`id`);

--
-- Indexes for table `embedded_systems`
--
ALTER TABLE `embedded_systems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `english`
--
ALTER TABLE `english`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `fundamentals_of_programming`
--
ALTER TABLE `fundamentals_of_programming`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `gui`
--
ALTER TABLE `gui`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `javascript`
--
ALTER TABLE `javascript`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `mathematics`
--
ALTER TABLE `mathematics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `mathematics_marks_year1a`
--
ALTER TABLE `mathematics_marks_year1a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mathematics_marks_year1b`
--
ALTER TABLE `mathematics_marks_year1b`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_assistance_requests`
--
ALTER TABLE `medical_assistance_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_care_history`
--
ALTER TABLE `medical_care_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `php`
--
ALTER TABLE `php`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `php_marks_year1a`
--
ALTER TABLE `php_marks_year1a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `php_marks_year1b`
--
ALTER TABLE `php_marks_year1b`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `php_marks_year1c`
--
ALTER TABLE `php_marks_year1c`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `php_marks_year1d`
--
ALTER TABLE `php_marks_year1d`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `php_marks_year2a`
--
ALTER TABLE `php_marks_year2a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `php_marks_year2b`
--
ALTER TABLE `php_marks_year2b`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `php_marks_year2c`
--
ALTER TABLE `php_marks_year2c`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `php_marks_year2d`
--
ALTER TABLE `php_marks_year2d`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `physics`
--
ALTER TABLE `physics`
  ADD KEY `id` (`id`);

--
-- Indexes for table `physics_marks_year1a`
--
ALTER TABLE `physics_marks_year1a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `physics_marks_year1b`
--
ALTER TABLE `physics_marks_year1b`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `physics_marks_year1c`
--
ALTER TABLE `physics_marks_year1c`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `physics_marks_year1d`
--
ALTER TABLE `physics_marks_year1d`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `physics_marks_year2a`
--
ALTER TABLE `physics_marks_year2a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `physics_marks_year2b`
--
ALTER TABLE `physics_marks_year2b`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `physics_marks_year2c`
--
ALTER TABLE `physics_marks_year2c`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `physics_marks_year2d`
--
ALTER TABLE `physics_marks_year2d`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stud_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_student_course` (`student_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `student_messages`
--
ALTER TABLE `student_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_records`
--
ALTER TABLE `student_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wui`
--
ALTER TABLE `wui`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `year1a_marks`
--
ALTER TABLE `year1a_marks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `closed_notifications`
--
ALTER TABLE `closed_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `embedded_systems`
--
ALTER TABLE `embedded_systems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `english`
--
ALTER TABLE `english`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `fundamentals_of_programming`
--
ALTER TABLE `fundamentals_of_programming`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `gui`
--
ALTER TABLE `gui`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `javascript`
--
ALTER TABLE `javascript`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `mathematics`
--
ALTER TABLE `mathematics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mathematics_marks_year1a`
--
ALTER TABLE `mathematics_marks_year1a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `mathematics_marks_year1b`
--
ALTER TABLE `mathematics_marks_year1b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medical_assistance_requests`
--
ALTER TABLE `medical_assistance_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `medical_care_history`
--
ALTER TABLE `medical_care_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `php`
--
ALTER TABLE `php`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `php_marks_year1a`
--
ALTER TABLE `php_marks_year1a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `php_marks_year1b`
--
ALTER TABLE `php_marks_year1b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `php_marks_year1c`
--
ALTER TABLE `php_marks_year1c`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `php_marks_year1d`
--
ALTER TABLE `php_marks_year1d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `php_marks_year2a`
--
ALTER TABLE `php_marks_year2a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `php_marks_year2b`
--
ALTER TABLE `php_marks_year2b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `php_marks_year2c`
--
ALTER TABLE `php_marks_year2c`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `php_marks_year2d`
--
ALTER TABLE `php_marks_year2d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `physics_marks_year1a`
--
ALTER TABLE `physics_marks_year1a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `physics_marks_year1b`
--
ALTER TABLE `physics_marks_year1b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `physics_marks_year1c`
--
ALTER TABLE `physics_marks_year1c`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `physics_marks_year1d`
--
ALTER TABLE `physics_marks_year1d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `physics_marks_year2a`
--
ALTER TABLE `physics_marks_year2a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `physics_marks_year2b`
--
ALTER TABLE `physics_marks_year2b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `physics_marks_year2c`
--
ALTER TABLE `physics_marks_year2c`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `physics_marks_year2d`
--
ALTER TABLE `physics_marks_year2d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_messages`
--
ALTER TABLE `student_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `student_records`
--
ALTER TABLE `student_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wui`
--
ALTER TABLE `wui`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `year1a_marks`
--
ALTER TABLE `year1a_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD CONSTRAINT `student_courses_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
