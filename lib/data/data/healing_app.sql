-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2023 at 12:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healing_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `accommodations`
--

CREATE TABLE `accommodations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accommodations`
--

INSERT INTO `accommodations` (`id`, `name`, `description`, `destination_id`, `created_at`, `updated_at`) VALUES
(5, 'Eiffel Tower Hotel', 'A luxurious hotel near the Eiffel Tower', 7, '2023-06-30 00:16:34', '2023-06-30 00:16:34'),
(6, 'Transportasi', 'Transportasi ke Kuil Angkor Wat', 9, '2023-06-30 00:30:23', '2023-06-30 00:30:23'),
(7, 'Hotel', 'Menginap di hotel nyaman di sekitaran Kuil Angkor Wat', 9, '2023-06-30 00:31:00', '2023-06-30 00:31:00'),
(8, 'Hotel', 'Penginapan yang nyaman di sekitaran pantai maldive', 5, '2023-06-30 00:35:33', '2023-06-30 00:35:33'),
(9, 'Tour Guide', 'Tour Guide Propesional', 6, '2023-06-30 00:36:01', '2023-06-30 00:36:01'),
(10, 'Penginapan di tepi pantai', 'Penginapan yang nyaman di sekitaran Pantai Bora Bora', 8, '2023-06-30 00:45:00', '2023-06-30 00:45:00'),
(11, 'Transportasi dari Bandara', 'Penjemputan tamu dari bandara', 11, '2023-06-30 01:51:34', '2023-06-30 01:51:34');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(2, NULL, 1, 'Category 2', 'category-2', '2023-06-21 22:43:56', '2023-06-21 22:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`, `image`, `description`) VALUES
(1, 'Indonesia', '2023-06-25 07:05:41', '2023-06-29 02:49:41', 'countries\\June2023\\UAJeRc67g3vuBT4MLS5i.jpeg', 'Nikmati liburan seru di Indonesia, negeri dengan kekayaan alam dan budaya yang tak terbatas. Menikmati matahari terbenam di pantai Bali, menjelajahi hutan tropis Kalimantan, atau menyelam di perairan Kepulauan Raja Ampat. Temukan keindahan alam yang memukau, kuliner lezat, dan keramahan penduduk setempat yang hangat.'),
(2, 'Amerika', '2023-06-25 07:06:04', '2023-06-29 03:01:27', 'countries\\June2023\\FHVPiIdMiry7zQfVtY65.jpg', 'Jelajahi keindahan dan keanekaragaman Amerika, negara yang menawarkan berbagai macam pengalaman. Dari keramaian New York City hingga keindahan alam Grand Canyon dan Yosemite National Park. Menjelajahi kota-kota seperti San Francisco, Las Vegas, atau Los Angeles, dan mengeksplorasi taman nasional yang menakjubkan seperti Yellowstone dan Great Smoky Mountains. Amerika menawarkan petualangan dan liburan yang tak terlupakan bagi setiap pengunjung.'),
(3, 'France', '2023-06-25 07:07:52', '2023-06-29 02:50:40', 'countries\\June2023\\VhfYvzOzxeA1OIKqCkbV.jpg', 'Jelajahi pesona Prancis, negara yang dikenal dengan arsitektur klasiknya, seni, dan masakan yang lezat. Berkeliling di Paris, mengunjungi Menara Eiffel, Louvre, dan Notre-Dame. Menikmati anggur di Provence, mengeksplorasi pantai Mediterania yang mempesona, atau menjelajahi desa-desa cantik di pedesaan Prancis. Dalam perjalanan ini, Anda akan terpesona oleh keindahan dan pesona yang tak terlupakan.'),
(4, 'Nepal', '2023-06-25 07:34:57', '2023-06-29 02:54:05', 'countries\\June2023\\FU0ZAWSiwxzND6NZyJme.jpg', 'Berkeliaran di Nepal akan membawa Anda ke dataran tinggi Himalaya yang memukau. Mendaki ke Puncak Everest, titik tertinggi di dunia, menjadi mimpi petualangan bagi banyak orang. Menikmati keindahan pegunungan, menjelajahi lembah Kathmandu yang kaya akan budaya dan sejarah, atau mengunjungi Kuil Pashupatinath yang suci, akan membuat liburan Anda di Nepal menjadi tak terlupakan.'),
(5, 'Maldives', '2023-06-25 07:37:56', '2023-06-29 02:58:13', 'countries\\June2023\\Aqh5dIo8CvgYLfhJtYCJ.webp', 'Hadiri liburan mewah di Maladewa, surga tropis yang terkenal dengan keindahan pantainya. Nikmati bungalow mengapung di atas air, menjelajahi terumbu karang yang memukau dengan menyelam atau snorkeling, atau hanya bersantai di pantai pasir putih yang indah. Dalam perjalanan ini, Anda akan merasa damai dan terhubung dengan keajaiban alam yang menakjubkan.'),
(6, 'Kamboja', '2023-06-25 07:40:08', '2023-06-29 02:55:44', 'countries\\June2023\\iF9MqYNOwbmpDoV53cWo.jpg', 'Liburan di Kamboja akan membawa Anda ke dunia sejarah yang menakjubkan. Mengunjungi Angkor Wat, kuil kuno yang menjadi salah satu keajaiban dunia, adalah pengalaman yang luar biasa. Menyaksikan matahari terbit di atas kompleks kuil yang megah, menjelajahi pasar lokal, atau menikmati keindahan pantai Koh Rong, akan melengkapi petualangan Anda di negara ini.'),
(7, 'Polinesia Prancis', '2023-06-25 07:43:14', '2023-06-29 03:00:21', 'countries\\June2023\\LW6NcYoQsNgORnGCg2aK.jpg', 'Nikmati liburan eksotis yang mengagumkan di Polinesia Prancis, destinasi tropis yang memikat dengan pantai berpasir putih, air laut biru jernih, dan terumbu karang yang memukau. Jelajahi pulau-pulau indah seperti Bora Bora, Tahiti, dan Moorea, temukan budaya Polinesia yang kaya, dan nikmati kegiatan seperti snorkeling, menyelam, atau berenang bersama hiu paus. Polinesia Prancis adalah tempat yang sempurna untuk melarikan diri dan menikmati keindahan alam yang luar biasa');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(64, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(65, 13, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(66, 13, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 3),
(67, 13, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4),
(68, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(69, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(70, 13, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(82, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(83, 21, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(84, 21, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(86, 21, 'destination_id', 'text', 'Destination Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(87, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(88, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(91, 21, 'accommodation_belongsto_destination_relationship', 'relationship', 'destinations', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Destination\",\"table\":\"destinations\",\"type\":\"belongsTo\",\"column\":\"destination_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accommodations\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(110, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(111, 26, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(112, 26, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(114, 26, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(115, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(116, 26, 'destination_hasmany_accommodation_relationship', 'relationship', 'accommodations', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Accommodation\",\"table\":\"accommodations\",\"type\":\"hasMany\",\"column\":\"destination_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accommodations\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(119, 26, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 2),
(121, 26, 'destination_belongstomany_package_relationship', 'relationship', 'packages', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Package\",\"table\":\"packages\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"package_destinations\",\"pivot\":\"1\",\"taggable\":\"0\"}', 10),
(131, 30, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(132, 30, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(133, 30, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(134, 30, 'price', 'number', 'Price', 0, 1, 1, 1, 1, 1, '{}', 5),
(135, 30, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
(136, 30, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(137, 30, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 2),
(138, 30, 'start_date', 'date', 'Start Date', 0, 1, 1, 1, 1, 1, '{}', 6),
(139, 30, 'end_date', 'date', 'End Date', 0, 1, 1, 1, 1, 1, '{}', 7),
(140, 30, 'max_capacity', 'number', 'Max Capacity', 0, 1, 1, 1, 1, 1, '{}', 8),
(141, 32, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(142, 32, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(143, 32, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(144, 32, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(145, 33, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(146, 33, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(147, 33, 'country_id', 'text', 'Country Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(148, 33, 'city', 'text', 'City', 0, 1, 1, 1, 1, 1, '{}', 4),
(149, 33, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(150, 33, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(151, 33, 'location_belongsto_country_relationship', 'relationship', 'countries', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Country\",\"table\":\"countries\",\"type\":\"belongsTo\",\"column\":\"country_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accommodations\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(152, 32, 'country_hasmany_location_relationship', 'relationship', 'locations', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Location\",\"table\":\"locations\",\"type\":\"hasMany\",\"column\":\"country_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accommodations\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(153, 26, 'destination_belongsto_location_relationship', 'relationship', 'locations', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Location\",\"table\":\"locations\",\"type\":\"belongsTo\",\"column\":\"location_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accommodations\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(154, 26, 'location_id', 'text', 'Location Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(155, 30, 'package_belongstomany_destination_relationship', 'relationship', 'destinations', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Destination\",\"table\":\"destinations\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"package_destinations\",\"pivot\":\"1\",\"taggable\":\"0\"}', 12),
(156, 26, 'rating', 'number', 'Rating', 0, 1, 1, 1, 1, 1, '{}', 6),
(157, 36, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(158, 36, 'package_id', 'text', 'Package Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(159, 36, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(160, 36, 'destination_id', 'text', 'Destination Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(161, 36, 'transaction_date', 'date', 'Transaction Date', 0, 1, 1, 1, 1, 1, '{}', 5),
(162, 36, 'total_amount', 'number', 'Total Amount', 0, 1, 1, 1, 1, 1, '{}', 6),
(163, 36, 'payment_status', 'text', 'Payment Status', 0, 1, 1, 1, 1, 1, '{}', 7),
(164, 36, 'payment_method', 'text', 'Payment Method', 0, 1, 1, 1, 1, 1, '{}', 8),
(165, 36, 'participant_count', 'number', 'Participant Count', 0, 1, 1, 1, 1, 1, '{}', 9),
(166, 36, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 10),
(167, 36, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(168, 36, 'transaction_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accommodations\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(169, 36, 'transaction_belongsto_package_relationship', 'relationship', 'packages', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Package\",\"table\":\"packages\",\"type\":\"belongsTo\",\"column\":\"package_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accommodations\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(170, 36, 'transaction_belongsto_destination_relationship', 'relationship', 'destinations', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Destination\",\"table\":\"destinations\",\"type\":\"belongsTo\",\"column\":\"destination_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accommodations\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(171, 32, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 2),
(172, 32, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(174, 37, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(175, 37, 'package_id', 'text', 'Package Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(176, 37, 'waktu_mulai', 'time', 'Waktu Mulai', 0, 1, 1, 1, 1, 1, '{}', 5),
(177, 37, 'waktu_selesai', 'time', 'Waktu Selesai', 0, 1, 1, 1, 1, 1, '{}', 6),
(178, 37, 'destinasi', 'text', 'Destinasi', 0, 1, 1, 1, 1, 1, '{}', 3),
(180, 37, 'aktifitas', 'text', 'Aktifitas', 0, 1, 1, 1, 1, 1, '{}', 4),
(181, 37, 'itinerary_belongsto_package_relationship', 'relationship', 'packages', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Package\",\"table\":\"packages\",\"type\":\"belongsTo\",\"column\":\"package_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"accommodations\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(182, 30, 'package_hasmany_itinerary_relationship', 'relationship', 'itineraries', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Itinerary\",\"table\":\"itineraries\",\"type\":\"hasMany\",\"column\":\"package_id\",\"key\":\"id\",\"label\":\"destinasi\",\"pivot_table\":\"accommodations\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(183, 30, 'days', 'number', 'Days', 0, 1, 1, 1, 1, 1, '{}', 11),
(184, 37, 'hari', 'select_dropdown', 'Hari', 0, 1, 1, 1, 1, 1, '{\"default\":\"hari pertama\",\"options\":{\"hari pertama\":\"hari petama\",\"hari kedua\":\"hari kedua\",\"hari ketiga\":\"hari ketiga\",\"hari keempat\":\"hari keempat\",\"hari kelima\":\"hari kelima\",\"hari keenam\":\"hari keenam\",\"hari ketujuh\":\"hari ketujuh\"}}', 2),
(185, 37, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(186, 37, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(10, 'product', 'product', 'Product', 'Products', NULL, 'App\\Models\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-06-21 22:55:47', '2023-06-21 22:55:47'),
(13, 'products', 'products', 'Product', 'Products', 'voyager-params', 'App\\Models\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-21 23:12:42', '2023-06-21 23:17:24'),
(21, 'accommodations', 'accommodations', 'Accommodation', 'Accommodations', NULL, 'App\\Models\\Accommodation', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-22 02:24:21', '2023-06-30 00:12:40'),
(26, 'destinations', 'destinations', 'Destination', 'Destinations', NULL, 'App\\Models\\Destination', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-23 07:28:04', '2023-06-26 04:16:26'),
(30, 'packages', 'packages', 'Package', 'Packages', NULL, 'App\\Models\\Package', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-24 22:17:11', '2023-06-29 20:27:16'),
(32, 'countries', 'countries', 'Country', 'Countries', NULL, 'App\\Models\\Country', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-25 07:00:56', '2023-06-29 02:39:47'),
(33, 'locations', 'locations', 'Location', 'Locations', NULL, 'App\\Models\\Location', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-25 07:02:13', '2023-06-25 07:03:38'),
(36, 'transactions', 'transactions', 'Transaction', 'Transactions', NULL, 'App\\Models\\Transaction', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-27 10:45:16', '2023-06-27 10:52:41'),
(37, 'itineraries', 'itineraries', 'Itinerary', 'Itineraries', NULL, 'App\\Models\\Itinerary', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-29 20:14:22', '2023-06-29 21:04:09');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` text DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `rating` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `name`, `description`, `created_at`, `updated_at`, `image`, `location_id`, `rating`) VALUES
(5, 'Pulau Maldives', '<p>Nikmati keindahan Pulau Maldives yang memukau dengan pasir putih, air laut yang jernih, dan vila-vila mewah menghadap lautan. Rasakan romansa yang memikat dengan pemandangan matahari terbenam yang spektakuler dan pengalaman menyelam bersama pasangan Anda</p>', '2023-06-23 22:15:36', '2023-06-26 04:17:43', 'destinations\\June2023\\EhFWUKIh0UsOCQdhTyjL.jpg', 30, 4.9),
(6, 'Gunung Everest', '<p>Gunung Everest, yang terletak di Pegunungan Himalaya, adalah puncak tertinggi di dunia. Petualangan ini ditujukan untuk para pendaki yang berani menaklukkan puncak tertinggi ini. Menyertai ekspedisi mendaki Gunung Everest adalah pengalaman yang menguji keberanian, ketahanan, dan dedikasi, dengan pemandangan spektakuler dan perasaan prestasi yang tak terlupakan saat mencapai puncak.</p>', '2023-06-23 22:21:26', '2023-06-26 04:17:31', 'destinations\\June2023\\v89cw6GkkbrFMOO2Ult8.jpg', 29, 3.5),
(7, 'Paris', '<p>Deskripsi: Disneyland Paris adalah taman hiburan yang menyenangkan bagi seluruh keluarga. Dengan berbagai atraksi dan wahana yang menarik, pertunjukan karakter Disney, dan suasana magis yang tak tertandingi, destinasi ini menawarkan kesenangan dan kegembiraan bagi anak-anak dan orang dewasa. Nikmati petualangan dengan karakter favorit Disney dan buat kenangan yang indah bersama keluarga Anda.</p>', '2023-06-23 22:42:55', '2023-06-30 00:22:23', 'destinations\\June2023\\8jTUcypo6xY2leCQTBuE.webp', 2, 4.3),
(8, 'Pantai Bora Bora', '<p>Pantai Bora Bora adalah surga tropis di Polinesia Prancis. Dengan pasir putih yang lembut, air laut berwarna biru turquoise yang menakjubkan, dan bungalow-bungalow terapung di atas air, destinasi ini adalah tempat ideal untuk bersantai dan menikmati keindahan alam. Aktivitas seperti menyelam, snorkeling, atau berlayar di perairan yang tenang akan menambah kesenangan liburan Anda.</p>', '2023-06-23 22:47:36', '2023-06-26 04:17:08', 'destinations\\June2023\\XKc98FF8AY1wu826Q7ZZ.jpg', 32, 4.9),
(9, 'Kuil Angkor Wat, Kamboja', '<p>Kuil Angkor Wat di Kamboja adalah sebuah keajaiban arsitektur dan peninggalan sejarah yang menakjubkan. Dengan struktur yang megah dan indah, kuil ini adalah tujuan yang sangat menarik bagi pecinta budaya dan sejarah. Jelajahi kompleks kuil yang luas, saksikan keindahan seni dan ornamen yang rumit, dan rasakan keajaiban dan keagungan masa lalu yang tersimpan di tempat ini.</p>', '2023-06-23 22:53:37', '2023-06-26 04:16:57', 'destinations\\June2023\\lHeK1GzBh2F45j3aHkDG.jpg', 31, 4),
(11, 'Labuan Bajo', '<p>Labuan Bajo adalah gerbang menuju Taman Nasional Komodo yang terkenal. Anda dapat menjelajahi pulau-pulau kecil di sekitar Labuan Bajo, melakukan snorkeling atau diving di perairan yang kaya akan kehidupan laut, dan menyaksikan matahari terbenam yang memukau.</p>', '2023-06-25 18:37:00', '2023-06-26 04:16:44', 'destinations\\June2023\\4TvFsUdK5ta1ImfFN2uj.jpg', 1, 4.5);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `itineraries`
--

CREATE TABLE `itineraries` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `waktu_selesai` time DEFAULT NULL,
  `destinasi` tinytext DEFAULT NULL,
  `aktifitas` text DEFAULT NULL,
  `hari` tinytext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itineraries`
--

INSERT INTO `itineraries` (`id`, `package_id`, `waktu_mulai`, `waktu_selesai`, `destinasi`, `aktifitas`, `hari`, `created_at`, `updated_at`) VALUES
(11, 9, '09:00:00', '10:00:00', 'Paris', 'Kunjungan Menara Eiffel', 'hari pertama', '2023-06-29 20:48:00', '2023-06-29 21:05:04'),
(12, 9, '11:00:00', '12:30:00', 'Louvre Museum', 'Melihat Mona Lisa dan karya seni terkenal lainnya', 'hari pertama', '2023-06-29 20:50:00', '2023-06-29 21:06:17'),
(13, 9, '13:00:00', '14:00:00', 'Makan Siang', 'Restoran lokal di dekat Louvre Museum', 'hari pertama', '2023-06-29 20:51:00', '2023-06-29 21:06:39'),
(14, 9, '15:00:00', '17:00:00', 'Seine River Cruise', 'Menikmati pemandangan kota Paris dari sungai', 'hari pertama', '2023-06-29 20:52:00', '2023-06-29 21:06:54'),
(15, 9, '10:00:00', '12:00:00', 'Versailles', 'Mengunjungi Istana Versailles', 'hari kedua', '2023-06-29 20:52:00', '2023-06-29 21:07:05'),
(16, 9, '12:30:00', '14:00:00', 'Makan Siang', 'Restoran di dekat Istana Versailles', 'hari kedua', '2023-06-29 20:53:00', '2023-06-29 21:07:18'),
(17, 9, '14:30:00', '16:00:00', 'Gardens of Versailles', 'Jalan-jalan di taman-taman Versailles', 'hari kedua', '2023-06-29 20:53:00', '2023-06-29 21:07:35'),
(18, 9, '09:00:00', '10:30:00', 'Amsterdam', 'Kunjungan Museum Van Gogh', 'hari ketiga', '2023-06-29 20:54:00', '2023-06-29 21:07:56'),
(19, 9, '11:00:00', '12:30:00', 'Canal Cruise', 'Menjelajahi kanal-kanal Amsterdam', 'hari ketiga', '2023-06-29 20:55:00', '2023-06-29 21:08:23'),
(20, 9, '13:00:00', '14:00:00', 'Makan Siang', 'Kafe terkenal di dekat Museum Van Gogh', 'hari ketiga', '2023-06-29 20:55:00', '2023-06-29 21:08:17'),
(21, 9, '14:30:00', '16:00:00', 'Anne Frank House', 'Mengunjungi rumah Anne Frank', 'hari ketiga', '2023-06-29 20:56:00', '2023-06-29 21:08:10'),
(22, 9, '19:00:00', '21:00:00', 'Makan Malam', 'Restoran khas Amsterdam', 'hari ketiga', '2023-06-29 20:57:00', '2023-06-29 21:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `country_id`, `city`, `created_at`, `updated_at`) VALUES
(1, 'Bali', 1, 'Denpasar', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(2, 'Paris', 3, 'Paris', '2023-06-25 07:09:12', '2023-06-25 07:35:52'),
(3, 'Aceh', 1, 'Banda Aceh', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(4, 'Sumatera Utara', 1, 'Medan', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(5, 'Sumatera Barat', 1, 'Padang', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(6, 'Riau', 1, 'Pekanbaru', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(7, 'Jawa Barat', 1, 'Bandung', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(8, 'Jawa Tengah', 1, 'Semarang', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(9, 'DI Yogyakarta', 1, 'Yogyakarta', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(10, 'Jawa Timur', 1, 'Surabaya', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(11, 'Banten', 1, 'Serang', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(12, 'Bali', 1, 'Denpasar', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(13, 'Nusa Tenggara Barat', 1, 'Mataram', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(14, 'Nusa Tenggara Timur', 1, 'Kupang', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(15, 'Kalimantan Barat', 1, 'Pontianak', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(16, 'Kalimantan Tengah', 1, 'Palangka Raya', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(17, 'Kalimantan Selatan', 1, 'Banjarmasin', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(18, 'Kalimantan Timur', 1, 'Samarinda', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(19, 'Sulawesi Utara', 1, 'Manado', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(20, 'Sulawesi Tengah', 1, 'Palu', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(21, 'Sulawesi Selatan', 1, 'Makassar', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(22, 'Sulawesi Tenggara', 1, 'Kendari', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(23, 'Gorontalo', 1, 'Gorontalo', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(24, 'Sulawesi Barat', 1, 'Mamuju', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(25, 'Maluku', 1, 'Ambon', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(26, 'Maluku Utara', 1, 'Ternate', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(27, 'Papua Barat', 1, 'Manokwari', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(28, 'Papua', 1, 'Jayapura', '2023-06-25 07:06:55', '2023-06-25 07:07:14'),
(29, 'Khumjung', 4, 'Khumjung', '2023-06-25 07:35:36', '2023-06-25 07:35:36'),
(30, 'Maldives', 5, 'Maldives', '2023-06-25 07:38:10', '2023-06-25 07:38:10'),
(31, 'Kamboja', 6, 'Kamboja', '2023-06-25 07:40:43', '2023-06-25 07:40:43'),
(32, 'Polinesia Prancis', 7, 'Polinesia Prancis', '2023-06-25 07:43:31', '2023-06-25 07:43:31');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-06-21 22:43:55', '2023-06-21 22:43:55');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-06-21 22:43:55', '2023-06-21 22:43:55', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2023-06-21 22:43:55', '2023-06-29 20:26:17', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 4, '2023-06-21 22:43:55', '2023-06-29 20:26:17', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 3, '2023-06-21 22:43:55', '2023-06-25 07:53:09', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2023-06-21 22:43:55', '2023-06-29 20:26:17', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2023-06-21 22:43:55', '2023-06-25 07:51:59', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2023-06-21 22:43:55', '2023-06-25 07:51:59', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2023-06-21 22:43:55', '2023-06-25 07:51:59', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2023-06-21 22:43:55', '2023-06-25 07:51:59', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2023-06-21 22:43:55', '2023-06-29 20:26:17', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2023-06-21 22:43:56', '2023-06-29 20:26:17', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2023-06-21 22:43:56', '2023-06-29 20:26:17', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2023-06-21 22:43:56', '2023-06-29 20:26:17', 'voyager.pages.index', NULL),
(17, 1, 'Products', '', '_self', NULL, NULL, NULL, 11, '2023-06-21 23:12:42', '2023-06-29 20:26:17', 'voyager.products.index', NULL),
(20, 1, 'Accommodations', '', '_self', NULL, NULL, 28, 4, '2023-06-22 02:24:22', '2023-06-25 18:28:14', 'voyager.accommodations.index', NULL),
(23, 1, 'Destinations', '', '_self', NULL, NULL, 28, 2, '2023-06-23 07:28:04', '2023-06-25 18:28:10', 'voyager.destinations.index', NULL),
(25, 1, 'Packages', '', '_self', NULL, NULL, 28, 1, '2023-06-24 22:17:11', '2023-06-25 18:28:10', 'voyager.packages.index', NULL),
(26, 1, 'Countries', '', '_self', NULL, NULL, 28, 3, '2023-06-25 07:00:56', '2023-06-25 18:28:12', 'voyager.countries.index', NULL),
(27, 1, 'Locations', '', '_self', NULL, NULL, 28, 5, '2023-06-25 07:02:13', '2023-06-25 18:28:14', 'voyager.locations.index', NULL),
(28, 1, 'Healing apps', '', '_self', 'voyager-boat', '#000000', NULL, 2, '2023-06-25 07:51:47', '2023-06-25 07:54:07', NULL, ''),
(29, 1, 'Transactions', '', '_self', NULL, NULL, 28, 6, '2023-06-27 10:45:16', '2023-06-29 20:26:09', 'voyager.transactions.index', NULL),
(30, 1, 'Itineraries', '', '_self', NULL, NULL, 28, 7, '2023-06-29 20:14:22', '2023-06-29 20:26:17', 'voyager.itineraries.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `max_capacity` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`, `image`, `start_date`, `end_date`, `max_capacity`, `days`) VALUES
(7, 'Paket Liburan Romantis', '<p>Nikmati momen romantis bersama pasangan Anda dengan paket liburan ini. Dengan pemandangan yang indah dan akomodasi mewah, paket ini akan menciptakan kenangan tak terlupakan.</p>', 5000000, '2023-06-23 22:10:29', '2023-06-29 20:25:44', 'packages\\June2023\\DlbeHqw4Z8lzx7Q10UMr.jpg', '2023-06-26', '2023-06-30', 2, 5),
(8, 'Paket Liburan Petualangan', '<p>Tantang adrenalin Anda dengan paket liburan petualangan ini. Menyertai berbagai kegiatan ekstrem seperti hiking, arung jeram, dan panjat tebing, Anda akan merasakan sensasi yang tak terlupakan</p>', 7500000, '2023-06-23 22:19:04', '2023-06-29 20:25:30', 'packages\\June2023\\W2Iu9uxXxvpTpdGNo4nQ.jpg', '2023-06-25', '2023-06-27', 3, 10),
(9, 'Paket Liburan Keluarga', '<p>Jadikan waktu bersama keluarga lebih istimewa dengan paket liburan ini. Dengan berbagai fasilitas dan kegiatan yang ramah keluarga, paket ini akan memberikan kegembiraan kepada seluruh anggota keluarga</p>', 4000000, '2023-06-23 22:41:05', '2023-07-07 20:15:32', 'packages\\June2023\\QzI0dY5IqR1qtEyIvtxq.jpg', '2023-07-08', '2023-07-31', 5, 3),
(10, 'Paket Liburan Santai', '<p>Rehatkan diri Anda dengan paket liburan santai ini. Nikmati pasir putih dan air laut yang jernih, sambil menikmati pijatan lembut di spa. Paket ini akan membawa kedamaian dan ketenangan.</p>', 3500000, '2023-06-23 22:45:42', '2023-07-07 20:13:43', 'packages\\June2023\\DevHmb6U7JmNa4QWvgG3.jpg', '2023-06-22', '2023-07-31', 2, 5),
(11, 'Paket Liburan Budaya', '<p>Temukan kekayaan budaya dengan paket liburan ini. Kunjungi tempat-tempat bersejarah, museum, dan pertunjukan seni yang memukau. Paket ini akan memberikan pengalaman yang mendalam tentang warisan budaya.</p>', 6000000, '2023-06-23 22:51:27', '2023-07-07 20:13:28', 'packages\\June2023\\SSoUHSiECoZBQ1PYgGlU.jpg', '2023-06-25', '2023-07-31', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `package_destinations`
--

CREATE TABLE `package_destinations` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_destinations`
--

INSERT INTO `package_destinations` (`id`, `package_id`, `destination_id`, `created_at`, `updated_at`) VALUES
(1, 6, 3, NULL, NULL),
(2, 6, 4, NULL, NULL),
(3, 7, 5, NULL, NULL),
(4, 8, 6, NULL, NULL),
(5, 9, 7, NULL, NULL),
(6, 10, 8, NULL, NULL),
(7, 11, 9, NULL, NULL),
(9, 7, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2023-06-21 22:43:56', '2023-06-21 22:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(2, 'browse_bread', NULL, '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(3, 'browse_database', NULL, '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(4, 'browse_media', NULL, '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(5, 'browse_compass', NULL, '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(6, 'browse_menus', 'menus', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(7, 'read_menus', 'menus', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(8, 'edit_menus', 'menus', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(9, 'add_menus', 'menus', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(10, 'delete_menus', 'menus', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(11, 'browse_roles', 'roles', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(12, 'read_roles', 'roles', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(13, 'edit_roles', 'roles', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(14, 'add_roles', 'roles', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(15, 'delete_roles', 'roles', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(16, 'browse_users', 'users', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(17, 'read_users', 'users', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(18, 'edit_users', 'users', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(19, 'add_users', 'users', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(20, 'delete_users', 'users', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(21, 'browse_settings', 'settings', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(22, 'read_settings', 'settings', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(23, 'edit_settings', 'settings', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(24, 'add_settings', 'settings', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(25, 'delete_settings', 'settings', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(26, 'browse_categories', 'categories', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(27, 'read_categories', 'categories', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(28, 'edit_categories', 'categories', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(29, 'add_categories', 'categories', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(30, 'delete_categories', 'categories', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(31, 'browse_posts', 'posts', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(32, 'read_posts', 'posts', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(33, 'edit_posts', 'posts', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(34, 'add_posts', 'posts', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(35, 'delete_posts', 'posts', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(36, 'browse_pages', 'pages', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(37, 'read_pages', 'pages', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(38, 'edit_pages', 'pages', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(39, 'add_pages', 'pages', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(40, 'delete_pages', 'pages', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(46, 'browse_product', 'product', '2023-06-21 22:55:47', '2023-06-21 22:55:47'),
(47, 'read_product', 'product', '2023-06-21 22:55:47', '2023-06-21 22:55:47'),
(48, 'edit_product', 'product', '2023-06-21 22:55:47', '2023-06-21 22:55:47'),
(49, 'add_product', 'product', '2023-06-21 22:55:47', '2023-06-21 22:55:47'),
(50, 'delete_product', 'product', '2023-06-21 22:55:47', '2023-06-21 22:55:47'),
(56, 'browse_products', 'products', '2023-06-21 23:12:42', '2023-06-21 23:12:42'),
(57, 'read_products', 'products', '2023-06-21 23:12:42', '2023-06-21 23:12:42'),
(58, 'edit_products', 'products', '2023-06-21 23:12:42', '2023-06-21 23:12:42'),
(59, 'add_products', 'products', '2023-06-21 23:12:42', '2023-06-21 23:12:42'),
(60, 'delete_products', 'products', '2023-06-21 23:12:42', '2023-06-21 23:12:42'),
(71, 'browse_accommodations', 'accommodations', '2023-06-22 02:24:22', '2023-06-22 02:24:22'),
(72, 'read_accommodations', 'accommodations', '2023-06-22 02:24:22', '2023-06-22 02:24:22'),
(73, 'edit_accommodations', 'accommodations', '2023-06-22 02:24:22', '2023-06-22 02:24:22'),
(74, 'add_accommodations', 'accommodations', '2023-06-22 02:24:22', '2023-06-22 02:24:22'),
(75, 'delete_accommodations', 'accommodations', '2023-06-22 02:24:22', '2023-06-22 02:24:22'),
(86, 'browse_destinations', 'destinations', '2023-06-23 07:28:04', '2023-06-23 07:28:04'),
(87, 'read_destinations', 'destinations', '2023-06-23 07:28:04', '2023-06-23 07:28:04'),
(88, 'edit_destinations', 'destinations', '2023-06-23 07:28:04', '2023-06-23 07:28:04'),
(89, 'add_destinations', 'destinations', '2023-06-23 07:28:04', '2023-06-23 07:28:04'),
(90, 'delete_destinations', 'destinations', '2023-06-23 07:28:04', '2023-06-23 07:28:04'),
(96, 'browse_packages', 'packages', '2023-06-24 22:17:11', '2023-06-24 22:17:11'),
(97, 'read_packages', 'packages', '2023-06-24 22:17:11', '2023-06-24 22:17:11'),
(98, 'edit_packages', 'packages', '2023-06-24 22:17:11', '2023-06-24 22:17:11'),
(99, 'add_packages', 'packages', '2023-06-24 22:17:11', '2023-06-24 22:17:11'),
(100, 'delete_packages', 'packages', '2023-06-24 22:17:11', '2023-06-24 22:17:11'),
(101, 'browse_countries', 'countries', '2023-06-25 07:00:56', '2023-06-25 07:00:56'),
(102, 'read_countries', 'countries', '2023-06-25 07:00:56', '2023-06-25 07:00:56'),
(103, 'edit_countries', 'countries', '2023-06-25 07:00:56', '2023-06-25 07:00:56'),
(104, 'add_countries', 'countries', '2023-06-25 07:00:56', '2023-06-25 07:00:56'),
(105, 'delete_countries', 'countries', '2023-06-25 07:00:56', '2023-06-25 07:00:56'),
(106, 'browse_locations', 'locations', '2023-06-25 07:02:13', '2023-06-25 07:02:13'),
(107, 'read_locations', 'locations', '2023-06-25 07:02:13', '2023-06-25 07:02:13'),
(108, 'edit_locations', 'locations', '2023-06-25 07:02:13', '2023-06-25 07:02:13'),
(109, 'add_locations', 'locations', '2023-06-25 07:02:13', '2023-06-25 07:02:13'),
(110, 'delete_locations', 'locations', '2023-06-25 07:02:13', '2023-06-25 07:02:13'),
(111, 'browse_transactions', 'transactions', '2023-06-27 10:45:16', '2023-06-27 10:45:16'),
(112, 'read_transactions', 'transactions', '2023-06-27 10:45:16', '2023-06-27 10:45:16'),
(113, 'edit_transactions', 'transactions', '2023-06-27 10:45:16', '2023-06-27 10:45:16'),
(114, 'add_transactions', 'transactions', '2023-06-27 10:45:16', '2023-06-27 10:45:16'),
(115, 'delete_transactions', 'transactions', '2023-06-27 10:45:16', '2023-06-27 10:45:16'),
(116, 'browse_itineraries', 'itineraries', '2023-06-29 20:14:22', '2023-06-29 20:14:22'),
(117, 'read_itineraries', 'itineraries', '2023-06-29 20:14:22', '2023-06-29 20:14:22'),
(118, 'edit_itineraries', 'itineraries', '2023-06-29 20:14:22', '2023-06-29 20:14:22'),
(119, 'add_itineraries', 'itineraries', '2023-06-29 20:14:22', '2023-06-29 20:14:22'),
(120, 'delete_itineraries', 'itineraries', '2023-06-29 20:14:22', '2023-06-29 20:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(90, 1),
(90, 2),
(96, 1),
(96, 2),
(97, 1),
(97, 2),
(98, 1),
(98, 2),
(99, 1),
(99, 2),
(100, 1),
(100, 2),
(101, 1),
(101, 2),
(102, 1),
(102, 2),
(103, 1),
(103, 2),
(104, 1),
(104, 2),
(105, 1),
(105, 2),
(106, 1),
(106, 2),
(107, 1),
(107, 2),
(108, 1),
(108, 2),
(109, 1),
(109, 2),
(110, 1),
(110, 2),
(111, 1),
(111, 2),
(112, 1),
(112, 2),
(113, 1),
(113, 2),
(114, 1),
(114, 2),
(115, 1),
(115, 2),
(116, 1),
(116, 2),
(117, 1),
(117, 2),
(118, 1),
(118, 2),
(119, 1),
(119, 2),
(120, 1),
(120, 2);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(10, 'App\\Models\\User', 1, 'auth_token', '086234238e1d39bf244cf2e5839acef7291cd2e6be9fac8892f250b650e28ec2', '[\"*\"]', '2023-06-27 11:41:27', NULL, '2023-06-27 07:38:56', '2023-06-27 11:41:27'),
(42, 'App\\Models\\User', 3, 'auth_token', '13143b0865e34429b06d5e5c18b4c0dd8b72c45f00467b47632e13947ede14e5', '[\"*\"]', NULL, NULL, '2023-06-29 05:32:59', '2023-06-29 05:32:59');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-06-21 22:43:56', '2023-06-21 22:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Product pertama', 32000, 'products\\June2023\\Je8cfa3rQ6UF8W7TqUE4.jpg', '2023-06-21 23:18:00', '2023-06-21 23:19:17', '2023-06-22 06:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-06-21 22:43:55', '2023-06-21 22:43:55'),
(2, 'user', 'Normal User', '2023-06-21 22:43:55', '2023-06-21 22:43:55');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT 'pending',
  `payment_method` text DEFAULT NULL,
  `participant_count` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `package_id`, `user_id`, `destination_id`, `transaction_date`, `total_amount`, `payment_status`, `payment_method`, `participant_count`, `created_at`, `updated_at`) VALUES
(1, 7, 3, 5, '2023-06-29', 50000000, 'Panding', 'Transfer Bank', 3, '2023-06-27 10:52:02', '2023-06-27 10:52:02'),
(2, 8, 3, 6, '2023-06-30', 4000000, 'Panding', 'Transfer Bank', 3, '2023-06-27 10:54:05', '2023-06-27 10:54:21');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-06-21 22:43:56', '2023-06-21 22:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `nomor_telp` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `tanggal_lahir`, `alamat`, `nomor_telp`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, NULL, NULL, NULL, '$2y$10$/EP/G05/fSoIYm5pnUfh1eQukUWIYPxyjCt9.twvKyscsYoOoWWpK', 'USvFjwd3bBsC29i3pguF0qZQXbl05vkMJ9ZDxx1qNrK81L03mmJE1IjE0yGt', NULL, '2023-06-21 22:43:56', '2023-06-21 22:43:56'),
(3, 2, 'Zulkarnaen', 'member@gmail.com', 'users/default.png', '1998-01-24', 'Jalan Kutilang', '0888888888', NULL, '$2y$10$RBAfKmBf.MmvbUtRwOGaA.KmA1x/cugWPw2YChQIfWCtiIbiJofc6', NULL, NULL, '2023-06-27 07:26:53', '2023-06-27 07:26:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accommodations`
--
ALTER TABLE `accommodations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `itineraries`
--
ALTER TABLE `itineraries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_destinations`
--
ALTER TABLE `package_destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accommodations`
--
ALTER TABLE `accommodations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itineraries`
--
ALTER TABLE `itineraries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `package_destinations`
--
ALTER TABLE `package_destinations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
