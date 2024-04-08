-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 23 Mar 2024, 11:20:21
-- Sunucu sürümü: 10.4.27-MariaDB
-- PHP Sürümü: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `db_xmoze`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `about_sections`
--

CREATE TABLE `about_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2','style3','style4','style5','style6','style7','style8') NOT NULL DEFAULT 'style1',
  `section_image` text DEFAULT NULL,
  `section_image_2` text DEFAULT NULL,
  `section_image_3` text DEFAULT NULL,
  `video_type` enum('youtube','other') DEFAULT NULL,
  `video_url` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `item` text DEFAULT NULL,
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `about_section_counters`
--

CREATE TABLE `about_section_counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style2','style8') DEFAULT 'style2',
  `counter` text DEFAULT NULL,
  `extra_text` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `about_section_features`
--

CREATE TABLE `about_section_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style7') NOT NULL DEFAULT 'style7',
  `type` enum('icon','image') NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `section_image` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2','style3') NOT NULL DEFAULT 'style1',
  `section_image` varchar(255) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `button_name_2` text DEFAULT NULL,
  `button_url_2` text DEFAULT NULL,
  `button_image` varchar(255) DEFAULT NULL,
  `button_image_url` text DEFAULT NULL,
  `button_image_2` varchar(255) DEFAULT NULL,
  `button_image_url_2` text DEFAULT NULL,
  `button_image_3` varchar(255) DEFAULT NULL,
  `button_image_url_3` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `banner_clients`
--

CREATE TABLE `banner_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style3') NOT NULL DEFAULT 'style3',
  `section_image` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `banner_client_sections`
--

CREATE TABLE `banner_client_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style3') NOT NULL DEFAULT 'style3',
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` text NOT NULL,
  `description` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `section_image` text DEFAULT NULL,
  `section_image_2` text DEFAULT NULL,
  `type` enum('with_this_account','anonymous') NOT NULL,
  `slug` text NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` enum('published','draft') NOT NULL DEFAULT 'published',
  `tag` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blog_details`
--

CREATE TABLE `blog_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blog_images`
--

CREATE TABLE `blog_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `section_image` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blog_sections`
--

CREATE TABLE `blog_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `section_item` int(11) NOT NULL DEFAULT 3,
  `paginate_item` int(11) NOT NULL DEFAULT 6,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bottom_button_widgets`
--

CREATE TABLE `bottom_button_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `button_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `button_name_2` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `status_whatsapp` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `breadcrumb_images`
--

CREATE TABLE `breadcrumb_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `buy_nows`
--

CREATE TABLE `buy_nows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `section_image` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `buy_now_sections`
--

CREATE TABLE `buy_now_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `call_to_actions`
--

CREATE TABLE `call_to_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2','style3') NOT NULL DEFAULT 'style1',
  `section_image` varchar(255) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `button_image` varchar(255) DEFAULT NULL,
  `button_image_url` text DEFAULT NULL,
  `button_image_2` varchar(255) DEFAULT NULL,
  `button_image_url_2` text DEFAULT NULL,
  `button_image_3` varchar(255) DEFAULT NULL,
  `button_image_url_3` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `careers`
--

CREATE TABLE `careers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1') NOT NULL DEFAULT 'style1',
  `category_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `type` enum('icon','image') NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `section_image` text DEFAULT NULL,
  `title` text NOT NULL,
  `short_description` text DEFAULT NULL,
  `career_slug` text NOT NULL,
  `status` enum('published','draft') NOT NULL DEFAULT 'published',
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `career_categories`
--

CREATE TABLE `career_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `career_category_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `career_contents`
--

CREATE TABLE `career_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `career_id` bigint(20) UNSIGNED NOT NULL,
  `section_image` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `career_sections`
--

CREATE TABLE `career_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `section_title` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `company_title` text DEFAULT NULL,
  `company_description` text DEFAULT NULL,
  `company_contact_title` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `section_item` int(11) NOT NULL DEFAULT 6,
  `paginate_item` int(11) NOT NULL DEFAULT 12,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `category_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `color_options`
--

CREATE TABLE `color_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color_option` int(11) NOT NULL DEFAULT 0,
  `main_color` varchar(255) DEFAULT NULL,
  `secondary_color` varchar(255) DEFAULT NULL,
  `tertiary_color` varchar(255) DEFAULT NULL,
  `scroll_button_color` varchar(255) DEFAULT NULL,
  `bottom_button_color` varchar(255) DEFAULT NULL,
  `bottom_button_hover_color` varchar(255) DEFAULT NULL,
  `side_button_color` varchar(255) DEFAULT NULL,
  `type` enum('default','customize') NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contact_infos`
--

CREATE TABLE `contact_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('icon','image') NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `section_image` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `read` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `draft_views`
--

CREATE TABLE `draft_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `external_urls`
--

CREATE TABLE `external_urls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
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
-- Tablo için tablo yapısı `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2','style3') NOT NULL DEFAULT 'style1',
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `faq_sections`
--

CREATE TABLE `faq_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2','style3') NOT NULL DEFAULT 'style1',
  `section_image` text DEFAULT NULL,
  `video_type` enum('youtube','other') NOT NULL DEFAULT 'youtube',
  `video_url` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `extra_text` text DEFAULT NULL,
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `favicons`
--

CREATE TABLE `favicons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `favicon_image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2','style3') NOT NULL DEFAULT 'style1',
  `type` enum('icon','image') NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `section_image` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `feature_sections`
--

CREATE TABLE `feature_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style3') NOT NULL DEFAULT 'style1',
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fixed_page_settings`
--

CREATE TABLE `fixed_page_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `header_style` enum('style1','style2','style3') NOT NULL DEFAULT 'style1',
  `subscribe_section` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `footer_style` enum('style1','style2','style3') NOT NULL DEFAULT 'style1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fonts`
--

CREATE TABLE `fonts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_font_link` text DEFAULT NULL,
  `title_font_family` text DEFAULT NULL,
  `text_font_link` text DEFAULT NULL,
  `text_font_family` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `footers`
--

CREATE TABLE `footers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `url` text NOT NULL,
  `status` enum('published','draft') NOT NULL DEFAULT 'published',
  `order` int(11) NOT NULL DEFAULT 0,
  `footer_slug` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `footer_categories`
--

CREATE TABLE `footer_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `footer_category_slug` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `footer_images`
--

CREATE TABLE `footer_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2','style3') NOT NULL DEFAULT 'style1',
  `section_image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `frontend_keywords`
--

CREATE TABLE `frontend_keywords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `key` text DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `frontend_keywords`
--

INSERT INTO `frontend_keywords` (`id`, `language_id`, `key`, `value`) VALUES
(1, 1, 'home', 'Home'),
(2, 1, 'name', 'Name'),
(3, 1, 'email_address', 'Email Address'),
(4, 1, 'phone_number', 'Phone Number'),
(5, 1, 'write_your_message', 'Write your message'),
(6, 1, 'message_submit', 'Message Submit'),
(7, 1, 'read_more', 'Read More'),
(8, 1, 'view_details', 'View Details'),
(9, 1, 'enter_your_email', 'Enter your email'),
(10, 1, 'subscribe_now', 'Subscribe Now'),
(11, 1, 'type_to_search', 'Type to search...'),
(12, 1, 'categories', 'Categories'),
(13, 1, 'recent_posts', 'Recent Posts'),
(14, 1, 'popular_tags', 'Popular Tags'),
(15, 1, 'tags', 'Tags'),
(16, 1, 'next_post', 'Next Post'),
(17, 1, 'prev_post', 'Previous Post'),
(18, 1, 'copy_link_and_share', 'Copy Url and Share:'),
(19, 1, 'share_on', 'Share on: '),
(20, 1, 'nothing_found', 'Nothing found.'),
(21, 1, 'all', 'All');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gallery_images`
--

CREATE TABLE `gallery_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `section_image` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gallery_image_sections`
--

CREATE TABLE `gallery_image_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `section_item` int(11) NOT NULL DEFAULT 3,
  `paginate_item` int(11) NOT NULL DEFAULT 6,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `google_analytics`
--

CREATE TABLE `google_analytics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `google_analytic` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `header_images`
--

CREATE TABLE `header_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2','style3') NOT NULL DEFAULT 'style1',
  `section_image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_name` varchar(255) NOT NULL,
  `language_code` varchar(255) NOT NULL,
  `direction` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `display_dropdown` int(11) NOT NULL,
  `default_site_language` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `direction`, `status`, `display_dropdown`, `default_site_language`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 0, 1, 1, 1, '2024-03-23 07:18:25', '2024-03-23 07:18:25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `maps`
--

CREATE TABLE `maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `map_iframe` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `uri` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `status` enum('published','draft') NOT NULL DEFAULT 'published',
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `menus`
--

INSERT INTO `menus` (`id`, `language_id`, `menu_name`, `uri`, `url`, `view`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'Home', '#', NULL, 0, 'published', 0, NULL, NULL),
(2, 1, 'About', 'about', NULL, 0, 'published', 0, NULL, NULL),
(3, 1, 'Pages', '#', NULL, 0, 'published', 0, NULL, NULL),
(4, 1, 'News', '#', NULL, 0, 'published', 0, NULL, NULL),
(5, 1, 'Contact', 'contact', NULL, 0, 'published', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_03_13_171754_create_sessions_table', 1),
(7, '2023_03_13_212902_create_languages_table', 1),
(8, '2023_03_13_212916_create_panel_keywords_table', 1),
(9, '2023_03_13_212935_create_frontend_keywords_table', 1),
(10, '2023_03_13_220600_create_permission_tables', 1),
(11, '2023_03_14_024627_create_banners_table', 1),
(12, '2023_04_10_232147_create_site_infos_table', 1),
(13, '2023_04_11_120934_create_features_table', 1),
(14, '2023_04_11_121142_create_feature_sections_table', 1),
(15, '2023_04_12_110018_create_favicons_table', 1),
(16, '2023_04_12_110037_create_header_images_table', 1),
(17, '2023_04_12_110052_create_footer_images_table', 1),
(18, '2023_04_12_120359_create_external_urls_table', 1),
(19, '2023_04_12_133509_create_banner_clients_table', 1),
(20, '2023_04_12_133537_create_banner_client_sections_table', 1),
(21, '2023_04_14_152419_create_about_sections_table', 1),
(22, '2023_04_14_152436_create_about_section_counters_table', 1),
(23, '2023_04_15_143103_create_buy_nows_table', 1),
(24, '2023_04_15_143128_create_buy_now_sections_table', 1),
(25, '2023_04_18_150312_create_work_processes_table', 1),
(26, '2023_04_18_150323_create_work_process_sections_table', 1),
(27, '2023_04_19_124444_create_testimonials_table', 1),
(28, '2023_04_19_124452_create_testimonial_sections_table', 1),
(29, '2023_04_20_235907_create_faqs_table', 1),
(30, '2023_04_20_235916_create_faq_sections_table', 1),
(31, '2023_04_22_035047_create_categories_table', 1),
(32, '2023_04_22_035106_create_blogs_table', 1),
(33, '2023_04_22_035115_create_blog_sections_table', 1),
(34, '2023_04_24_154815_create_call_to_actions_table', 1),
(35, '2023_04_26_121311_create_socials_table', 1),
(36, '2023_04_29_100441_create_tawk_tos_table', 1),
(37, '2023_04_29_105535_create_color_options_table', 1),
(38, '2023_05_09_125843_create_blog_details_table', 1),
(39, '2023_05_09_125948_create_blog_images_table', 1),
(40, '2023_05_11_084604_create_footer_categories_table', 1),
(41, '2023_05_11_092810_create_footers_table', 1),
(42, '2023_05_16_132304_create_plans_table', 1),
(43, '2023_05_16_132336_create_plan_sections_table', 1),
(44, '2023_07_06_132028_create_page_names_table', 1),
(45, '2023_07_06_140307_create_page_builders_table', 1),
(46, '2023_07_12_095945_create_about_section_features_table', 1),
(47, '2023_07_12_125353_create_menus_table', 1),
(48, '2023_07_12_125403_create_submenus_table', 1),
(49, '2023_07_31_131631_create_seos_table', 1),
(50, '2023_08_01_133227_create_preloaders_table', 1),
(51, '2023_08_02_053410_create_google_analytics_table', 1),
(52, '2023_08_11_051329_create_panel_images_table', 1),
(53, '2023_08_12_074725_create_photos_table', 1),
(54, '2023_09_04_055154_create_subscribe_sections_table', 1),
(55, '2023_09_10_113849_create_subscribes_table', 1),
(56, '2023_09_11_113842_create_contact_infos_table', 1),
(57, '2023_09_28_132904_create_gallery_images_table', 1),
(58, '2023_09_28_132915_create_gallery_image_sections_table', 1),
(59, '2023_09_30_114716_create_bottom_button_widgets_table', 1),
(60, '2023_09_30_114811_create_side_button_widgets_table', 1),
(61, '2023_10_10_070220_create_fixed_page_settings_table', 1),
(62, '2023_10_18_102034_create_contact_messages_table', 1),
(63, '2023_11_13_022825_create_service_categories_table', 1),
(64, '2023_11_13_024753_create_services_table', 1),
(65, '2023_11_13_024820_create_service_sections_table', 1),
(66, '2023_11_13_024845_create_service_contents_table', 1),
(67, '2023_11_13_024902_create_service_processes_table', 1),
(68, '2023_11_13_024912_create_service_items_table', 1),
(69, '2023_11_20_030759_create_team_categories_table', 1),
(70, '2023_11_20_030855_create_teams_table', 1),
(71, '2023_11_20_030901_create_team_sections_table', 1),
(72, '2023_11_20_104012_create_maps_table', 1),
(73, '2023_11_21_035123_create_portfolio_categories_table', 1),
(74, '2023_11_21_035131_create_portfolios_table', 1),
(75, '2023_11_21_035141_create_portfolio_sections_table', 1),
(76, '2023_11_21_035206_create_portfolio_contents_table', 1),
(77, '2023_11_21_035228_create_portfolio_details_table', 1),
(78, '2023_11_21_035233_create_portfolio_detail_sections_table', 1),
(79, '2023_12_12_115104_create_fonts_table', 1),
(80, '2024_01_02_120922_create_portfolio_images_table', 1),
(81, '2024_01_11_105005_create_draft_views_table', 1),
(82, '2024_01_15_120836_create_career_categories_table', 1),
(83, '2024_01_15_120844_create_careers_table', 1),
(84, '2024_01_15_120853_create_career_sections_table', 1),
(85, '2024_01_16_120226_create_career_contents_table', 1),
(86, '2024_01_20_025100_create_pages_table', 1),
(87, '2024_03_14_072722_create_breadcrumb_images_table', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `description` text DEFAULT NULL,
  `section_image` text DEFAULT NULL,
  `page_slug` text NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` enum('published','draft') NOT NULL DEFAULT 'published',
  `breadcrumb_status` enum('yes','no') NOT NULL DEFAULT 'no',
  `custom_breadcrumb_image` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `page_builders`
--

CREATE TABLE `page_builders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_uri` varchar(255) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `page_name_id` int(11) NOT NULL,
  `default_item` text DEFAULT NULL,
  `updated_item` text DEFAULT NULL,
  `breadcrumb_title` text DEFAULT NULL,
  `breadcrumb_item` text DEFAULT NULL,
  `breadcrumb_status` enum('yes','no') NOT NULL DEFAULT 'no',
  `custom_breadcrumb_image` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `segment_count` int(11) NOT NULL DEFAULT 1,
  `is_default` enum('yes','no') NOT NULL DEFAULT 'no',
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `page_builders`
--

INSERT INTO `page_builders` (`id`, `page_uri`, `page_name`, `page_name_id`, `default_item`, `updated_item`, `breadcrumb_title`, `breadcrumb_item`, `breadcrumb_status`, `custom_breadcrumb_image`, `meta_title`, `meta_description`, `meta_keyword`, `order`, `segment_count`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, '/', 'public-homepage-index', 1, '[{\"id\":\"header-style1\",\"folder\":\"header\",\"order\":0},{\"id\":\"banner-style1\",\"folder\":\"banner\",\"order\":0},{\"id\":\"feature-style1\",\"folder\":\"feature\",\"order\":0},{\"id\":\"about-style1\",\"folder\":\"about\",\"order\":0},{\"id\":\"buy-now-style1\",\"folder\":\"buy_now\",\"order\":0},{\"id\":\"work-process-style1\",\"folder\":\"work_process\",\"order\":0},{\"id\":\"testimonial-style1\",\"folder\":\"testimonial\",\"order\":0},{\"id\":\"faq-style1\",\"folder\":\"faq\",\"order\":0},{\"id\":\"blog-style1\",\"folder\":\"blog\",\"order\":0},{\"id\":\"call-to-action-style1\",\"folder\":\"call_to_action\",\"order\":0},{\"id\":\"footer-style1\",\"folder\":\"footer\",\"order\":0}]', NULL, NULL, NULL, 'no', NULL, 'Homepage', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(2, 'index-2', 'homepage-2-index', 2, '[{\"id\":\"header-style2\",\"folder\":\"header\",\"order\":0},{\"id\":\"banner-style2\",\"folder\":\"banner\",\"order\":0},{\"id\":\"feature-style2\",\"folder\":\"feature\",\"order\":0},{\"id\":\"about-style2\",\"folder\":\"about\",\"order\":0},{\"id\":\"about-style3\",\"folder\":\"about\",\"order\":0},{\"id\":\"service-style2\",\"folder\":\"service\",\"order\":0},{\"id\":\"about-style4\",\"folder\":\"about\",\"order\":0},{\"id\":\"plan-style1\",\"folder\":\"plan\",\"order\":0},{\"id\":\"testimonial-style2\",\"folder\":\"testimonial\",\"order\":0},{\"id\":\"call-to-action-style2\",\"folder\":\"call_to_action\",\"order\":0},{\"id\":\"footer-style2\",\"folder\":\"footer\",\"order\":0}]', NULL, NULL, NULL, 'no', NULL, 'Homepage', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(3, 'index-3', 'homepage-3-index', 3, '[{\"id\":\"header-style3\",\"folder\":\"header\",\"order\":0},{\"id\":\"banner-style3\",\"folder\":\"banner\",\"order\":0},{\"id\":\"feature-style3\",\"folder\":\"feature\",\"order\":0},{\"id\":\"about-style5\",\"folder\":\"about\",\"order\":0},{\"id\":\"about-style6\",\"folder\":\"about\",\"order\":0},{\"id\":\"work-process-style2\",\"folder\":\"work_process\",\"order\":0},{\"id\":\"plan-style1\",\"folder\":\"plan\",\"order\":0},{\"id\":\"testimonial-style3\",\"folder\":\"testimonial\",\"order\":0},{\"id\":\"faq-style2\",\"folder\":\"faq\",\"order\":0},{\"id\":\"call-to-action-style3\",\"folder\":\"call_to_action\",\"order\":0},{\"id\":\"footer-style2\",\"folder\":\"footer\",\"order\":0}]', NULL, NULL, NULL, 'no', NULL, 'Homepage', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(4, 'about', 'about-index', 4, '[{\"id\":\"header-style1\",\"folder\":\"header\",\"order\":0},{\"id\":\"breadcrumb-style1\",\"folder\":\"breadcrumb\",\"order\":0},{\"id\":\"about-style7\",\"folder\":\"about\",\"order\":0},{\"id\":\"about-style8\",\"folder\":\"about\",\"order\":0},{\"id\":\"testimonial-style1\",\"folder\":\"testimonial\",\"order\":0},{\"id\":\"team-style1\",\"folder\":\"team\",\"order\":0},{\"id\":\"subscribe-style1\",\"folder\":\"subscribe\",\"order\":0},{\"id\":\"footer-style1\",\"folder\":\"footer\",\"order\":0}]', NULL, 'About Us', '<a href=\"#\">Home</a>, About Us', 'no', NULL, 'About Us', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(5, 'services', 'service-index', 5, '[{\"id\":\"header-style1\",\"folder\":\"header\",\"order\":0},{\"id\":\"breadcrumb-style1\",\"folder\":\"breadcrumb\",\"order\":0},{\"id\":\"service-style3\",\"folder\":\"service\",\"order\":0},{\"id\":\"footer-style1\",\"folder\":\"footer\",\"order\":0}]', NULL, 'Our Services', '<a href=\"#\">Home</a>, Our Services', 'no', NULL, 'Our Services', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(6, 'service', 'service-detail-show', 6, NULL, NULL, 'Service Detail', '<a href=\"#\">Home</a>, Service Detail', 'no', NULL, NULL, NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(7, 'service/category', 'service-category-index', 7, NULL, NULL, 'Service Category', '<a href=\"#\">Home</a>, Service Category', 'no', NULL, NULL, NULL, NULL, 0, 2, 'yes', 1, NULL, NULL),
(8, 'faqs', 'faq-index', 8, '[{\"id\":\"header-style1\",\"folder\":\"header\",\"order\":0},{\"id\":\"breadcrumb-style1\",\"folder\":\"breadcrumb\",\"order\":0},{\"id\":\"faq-style3\",\"folder\":\"faq\",\"order\":0},{\"id\":\"footer-style1\",\"folder\":\"footer\",\"order\":0}]', NULL, 'Faqs', '<a href=\"#\">Home</a>, Our Faqs', 'no', NULL, 'Fags', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(9, 'gallery', 'gallery-index', 9, '[{\"id\":\"header-style1\",\"folder\":\"header\",\"order\":0},{\"id\":\"breadcrumb-style1\",\"folder\":\"breadcrumb\",\"order\":0},{\"id\":\"gallery-style2\",\"folder\":\"gallery\",\"order\":0},{\"id\":\"footer-style1\",\"folder\":\"footer\",\"order\":0}]', NULL, 'Gallery', '<a href=\"#\">Home</a>, Our Gallery', 'no', NULL, 'Gallery', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(10, 'teams', 'team-index', 10, '[{\"id\":\"header-style1\",\"folder\":\"header\",\"order\":0},{\"id\":\"breadcrumb-style1\",\"folder\":\"breadcrumb\",\"order\":0},{\"id\":\"team-style2\",\"folder\":\"team\",\"order\":0},{\"id\":\"footer-style1\",\"folder\":\"footer\",\"order\":0}]', NULL, 'Teams', '<a href=\"#\">Home</a>, Our Teams', 'no', NULL, 'Teams', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(11, 'team/category', 'team-category-index', 11, NULL, NULL, 'Team Category', '<a href=\"#\">Home</a>, Team Category', 'no', NULL, NULL, NULL, NULL, 0, 2, 'yes', 1, NULL, NULL),
(12, 'portfolios', 'portfolio-index', 12, '[{\"id\":\"header-style1\",\"folder\":\"header\",\"order\":1},{\"id\":\"breadcrumb-style1\",\"folder\":\"breadcrumb\",\"order\":0},{\"id\":\"portfolio-style2\",\"folder\":\"portfolio\",\"order\":0},{\"id\":\"footer-style1\",\"folder\":\"footer\",\"order\":0}]', NULL, 'Portfolio', '<a href=\"#\">Home</a>, Our Portfolio', 'no', NULL, 'Portfolio', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(13, 'portfolio', 'portfolio-detail-show', 13, NULL, NULL, 'Portfolio Detail', '<a href=\"#\">Home</a>, Portfolio Detail', 'no', NULL, NULL, NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(14, 'portfolio/category', 'portfolio-category-index', 14, NULL, NULL, 'Portfolio Category', '<a href=\"#\">Home</a>, Portfolio Category', 'no', NULL, NULL, NULL, NULL, 0, 2, 'yes', 1, NULL, NULL),
(15, 'plans', 'plan-index', 15, '[{\"id\":\"header-style1\",\"folder\":\"header\",\"order\":0},{\"id\":\"breadcrumb-style1\",\"folder\":\"breadcrumb\",\"order\":0},{\"id\":\"plan-style1\",\"folder\":\"plan\",\"order\":0},{\"id\":\"footer-style1\",\"folder\":\"footer\",\"order\":0}]', NULL, 'Pricing', '<a href=\"#\">Home</a>, Plans', 'no', NULL, 'Pricing', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(16, 'careers', 'career-index', 16, '[{\"id\":\"header-style1\",\"folder\":\"header\",\"order\":0},{\"id\":\"breadcrumb-style1\",\"folder\":\"breadcrumb\",\"order\":0},{\"id\":\"career-style2\",\"folder\":\"career\",\"order\":0},{\"id\":\"footer-style1\",\"folder\":\"footer\",\"order\":0}]', NULL, 'Our Careers', '<a href=\"#\">Home</a>, Our Careers', 'no', NULL, 'Career', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(17, 'career', 'career-detail-show', 17, NULL, NULL, 'Career Detail', '<a href=\"#\">Home</a>, Career Detail', 'no', NULL, NULL, NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(18, 'blogs', 'blog-index', 18, '[{\"id\":\"header-style1\",\"folder\":\"header\",\"order\":0},{\"id\":\"breadcrumb-style1\",\"folder\":\"breadcrumb\",\"order\":0},{\"id\":\"blog-style2\",\"folder\":\"blog\",\"order\":0},{\"id\":\"footer-style1\",\"folder\":\"footer\",\"order\":0}]', NULL, 'Our Blogs', '<a href=\"#\">Home</a>, Blogs', 'no', NULL, 'Our Blogs', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(19, 'blog', 'blog-detail-show', 19, NULL, NULL, 'Blog Detail', '<a href=\"#\">Home</a>, Blog Detail', 'no', NULL, 'Blog Detail', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(20, 'blog/category', 'blog-category-index', 20, NULL, NULL, 'Blog Category', '<a href=\"#\">Home</a>, Blog Category', 'no', NULL, NULL, NULL, NULL, 0, 2, 'yes', 1, NULL, NULL),
(21, 'blog/tag', 'blog-tag-index', 21, NULL, NULL, 'Blog Tag', '<a href=\"#\">Home</a>, Blog Tag', 'no', NULL, NULL, NULL, NULL, 0, 2, 'yes', 1, NULL, NULL),
(22, 'blog/search', 'blog-search-index', 22, NULL, NULL, 'Search Results', '<a href=\"#\">Home</a>, Search Results', 'no', NULL, NULL, NULL, NULL, 0, 2, 'yes', 1, NULL, NULL),
(23, 'contact', 'contact-index', 23, '[{\"id\":\"header-style1\",\"folder\":\"header\",\"order\":0},{\"id\":\"breadcrumb-style1\",\"folder\":\"breadcrumb\",\"order\":0},{\"id\":\"contact-style1\",\"folder\":\"contact\",\"order\":0},{\"id\":\"map-style1\",\"folder\":\"map\",\"order\":0},{\"id\":\"footer-style1\",\"folder\":\"footer\",\"order\":0}]', NULL, 'Contact Us', '<a href=\"#\">Home</a>, Contact Us', 'no', NULL, 'Contact Us', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL),
(24, 'page', 'page-detail-show', 24, NULL, NULL, 'Page Detail', '<a href=\"#\">Home</a>, Page Detail', 'no', NULL, 'Page Detail', NULL, NULL, 0, 1, 'yes', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `page_names`
--

CREATE TABLE `page_names` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `is_default` enum('yes','no') NOT NULL,
  `page_builder` enum('yes','no') NOT NULL,
  `segment_count` int(11) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `page_names`
--

INSERT INTO `page_names` (`id`, `page_name`, `is_default`, `page_builder`, `segment_count`, `order`, `created_at`, `updated_at`) VALUES
(1, 'public-homepage-index', 'yes', 'yes', 1, 0, NULL, NULL),
(2, 'homepage-2-index', 'yes', 'yes', 1, 0, NULL, NULL),
(3, 'homepage-3-index', 'yes', 'yes', 1, 0, NULL, NULL),
(4, 'about-index', 'yes', 'yes', 1, 0, NULL, NULL),
(5, 'service-index', 'yes', 'yes', 1, 0, NULL, NULL),
(6, 'service-detail-show', 'yes', 'no', 1, 0, NULL, NULL),
(7, 'service-category-index', 'yes', 'no', 2, 0, NULL, NULL),
(8, 'faq-index', 'yes', 'yes', 1, 0, NULL, NULL),
(9, 'gallery-index', 'yes', 'yes', 1, 0, NULL, NULL),
(10, 'team-index', 'yes', 'yes', 1, 0, NULL, NULL),
(11, 'team-category-index', 'yes', 'no', 2, 0, NULL, NULL),
(12, 'portfolio-index', 'yes', 'yes', 1, 0, NULL, NULL),
(13, 'portfolio-detail-show', 'yes', 'no', 1, 0, NULL, NULL),
(14, 'portfolio-category-index', 'yes', 'no', 2, 0, NULL, NULL),
(15, 'plan-index', 'yes', 'yes', 1, 0, NULL, NULL),
(16, 'career-index', 'yes', 'yes', 1, 0, NULL, NULL),
(17, 'career-detail-show', 'yes', 'no', 1, 0, NULL, NULL),
(18, 'blog-index', 'yes', 'yes', 1, 0, NULL, NULL),
(19, 'blog-detail-show', 'yes', 'no', 1, 0, NULL, NULL),
(20, 'blog-category-index', 'yes', 'no', 2, 0, NULL, NULL),
(21, 'blog-tag-index', 'yes', 'no', 2, 0, NULL, NULL),
(22, 'blog-search-index', 'yes', 'no', 2, 0, NULL, NULL),
(23, 'contact-index', 'yes', 'yes', 1, 0, NULL, NULL),
(24, 'page-detail-show', 'yes', 'no', 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `panel_images`
--

CREATE TABLE `panel_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_image` text DEFAULT NULL,
  `section_image_2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `panel_keywords`
--

CREATE TABLE `panel_keywords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `key` text DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `panel_keywords`
--

INSERT INTO `panel_keywords` (`id`, `language_id`, `key`, `value`) VALUES
(1, 1, 'admin_role_manage', 'Admin Role Manage'),
(2, 1, 'add_admin_role', 'Add Admin Role'),
(3, 1, 'role_name', 'Role Name'),
(4, 1, 'permissions', 'Permissions'),
(5, 1, 'set_permissions_for_this_role', 'set permissions for this role'),
(6, 1, 'submit', 'Submit'),
(7, 1, 'admin_roles', 'Admin Roles'),
(8, 1, 'has_all_permissions', 'has all permissions'),
(9, 1, 'action', 'Action'),
(10, 1, 'edit_admin_role', 'Edit Admin Role'),
(11, 1, 'admin_manage', 'Admin Manage'),
(12, 1, 'all_admin', 'All Admin'),
(13, 1, 'all_admin_created_by_super_admin', 'All Admin Created By Super Admin'),
(14, 1, 'add_admin_user', 'Add Admin User'),
(15, 1, 'edit_admin_user', 'Edit Admin User'),
(16, 1, 'name', 'Name'),
(17, 1, 'email', 'Email'),
(18, 1, 'new_password', 'New Password'),
(19, 1, 'confirm_password', 'Confirm Password'),
(20, 1, 'image', 'Image'),
(21, 1, 'size', 'size'),
(22, 1, 'delete', 'Delete'),
(23, 1, 'close', 'Close'),
(24, 1, 'you_wont_be_able_to_revert_this', 'You wont be able to revert this!'),
(25, 1, 'cancel', 'Cancel'),
(26, 1, 'yes_delete_it', 'Yes, delete it!'),
(27, 1, 'success', 'Success'),
(28, 1, 'warning', 'Warning'),
(29, 1, 'error', 'Error'),
(30, 1, 'created_successfully', 'Created Successfully'),
(31, 1, 'updated_successfully', 'Updated Successfully'),
(32, 1, 'deleted_successfully', 'Deleted Successfully'),
(33, 1, 'current_image', 'Current Image'),
(34, 1, 'dashboard', 'Dashboard'),
(35, 1, 'uploads', 'Uploads'),
(36, 1, 'add_photo', 'Add Photo'),
(37, 1, 'photos', 'Photos'),
(38, 1, 'order', 'Order'),
(39, 1, 'copy_image_link', 'Copy Image Link'),
(40, 1, 'edit_photo', 'Edit Photo'),
(41, 1, 'title', 'Title'),
(42, 1, 'description', 'Description'),
(43, 1, 'please_use_recommended_sizes', 'You do not have to use the recommended sizes. However, please use the recommended sizes for your site design to look its best.'),
(44, 1, 'blogs', 'Blogs'),
(45, 1, 'categories', 'Categories'),
(46, 1, 'add_category', 'Add Category'),
(47, 1, 'edit_category', 'Edit Category'),
(48, 1, 'category_name', 'Category Name'),
(49, 1, 'please_choose', 'Please choose.'),
(50, 1, 'please_create_a_category', 'Please create a category.'),
(51, 1, 'status', 'Status'),
(52, 1, 'select_your_option', 'Select Your Option'),
(53, 1, 'not_yet_created', 'Not yet created.'),
(54, 1, 'category', 'Category'),
(55, 1, 'post_date', 'Post Date'),
(56, 1, 'view', 'View'),
(57, 1, 'add_blog', 'Add Blog'),
(58, 1, 'edit_blog', 'Edit Blog'),
(59, 1, 'short_description', 'Short Description'),
(60, 1, 'tag', 'Tag'),
(61, 1, 'separate_with_commas', 'Separate with commas'),
(62, 1, 'author', 'Author'),
(63, 1, 'with_this_account', 'With this account'),
(64, 1, 'anonymous', 'Anonymous'),
(65, 1, 'seo_optimization', 'Seo Optimization'),
(66, 1, 'meta_title', 'Meta Title'),
(67, 1, 'meta_description', 'Meta Description'),
(68, 1, 'meta_keyword', 'Meta Keyword'),
(69, 1, 'breadcrumb', 'Breadcrumb'),
(70, 1, 'edit_breadcrumb', 'Edit Breadcrumb'),
(71, 1, 'edit_breadcrumb_and_page_seo', 'Edit Breadcrumb and Page Seo'),
(72, 1, 'breadcrumb_customization', 'Breadcrumb Customization'),
(73, 1, 'use_special_breadcrumb', 'Do you want to use special breadcrumb for the page?'),
(74, 1, 'yes', 'Yes'),
(75, 1, 'no', 'No'),
(76, 1, 'custom_breadcrumb_image', 'Custom Breadcrumb Image'),
(77, 1, 'published', 'Published'),
(78, 1, 'draft', 'Draft'),
(79, 1, 'popular_tag', 'Popular Tag'),
(80, 1, 'section_item', 'Section Item'),
(81, 1, 'paginate_item', 'Paginate Item'),
(82, 1, 'section_title', 'Section Title'),
(83, 1, 'section_title_and_description', 'Section Title/Description'),
(84, 1, 'edit_section_title_description', 'Edit Section Title/Description'),
(85, 1, 'add_new', 'Add New'),
(86, 1, 'page_builder', 'Page Builder'),
(87, 1, 'page_names', 'Page Names'),
(88, 1, 'page_name', 'Page Name'),
(89, 1, 'is_default', 'Is Default'),
(90, 1, 'add_page_name', 'Add Page Name'),
(91, 1, 'edit_page_name', 'Edit Page Name'),
(92, 1, 'pages', 'Pages'),
(93, 1, 'page_uri', 'Page Uri'),
(94, 1, 'add_page', 'Add Page'),
(95, 1, 'edit_page', 'Edit Page'),
(96, 1, 'example', 'Example: '),
(97, 1, '1_segment_usage', '1 Segment Usage ->'),
(98, 1, '2_segment_usage', '2 Segment Usage ->'),
(99, 1, 'please_base_on_the_count_of_segments', 'Please base on the count of segments.'),
(100, 1, 'sections', 'Sections'),
(101, 1, 'updated_page_sections', 'Updated page sections'),
(102, 1, 'return_to_default_page_settings', 'Return to default page settings'),
(103, 1, 'yes_apply', 'Yes apply!'),
(104, 1, 'update', 'Update'),
(105, 1, 'breadcrumb_title', 'Breadcrumb Title'),
(106, 1, 'breadcrumb_item', 'Breadcrumb Item'),
(107, 1, 'page_builder_is_not_available_on_this_page', 'Page builder is not available on this page.'),
(108, 1, 'menus', 'Menus'),
(109, 1, 'menu', 'Menu'),
(110, 1, 'menu_name', 'Menu Name'),
(111, 1, 'add_menu_name', 'Add Menu Name'),
(112, 1, 'edit_menu_name', 'Edit Menu Name'),
(113, 1, 'pages_within_the_site', 'Pages within the site'),
(114, 1, 'empty', 'Empty'),
(115, 1, 'to_use_the_url_enter_empty_in_this_field', 'To use the url enter empty in this field.'),
(116, 1, 'uri', 'Uri'),
(117, 1, 'url', 'Url'),
(118, 1, 'submenu', 'Submenu'),
(119, 1, 'submenu_name', 'Submenu Name'),
(120, 1, 'add_submenu', 'Add Submenu'),
(121, 1, 'edit_submenu', 'Edit Submenu'),
(122, 1, 'reset', 'Reset'),
(123, 1, 'banner', 'Banner'),
(124, 1, 'edit_banner', 'Edit Banner'),
(125, 1, 'button_image_url', 'Button Image Url'),
(126, 1, 'button_image_url_2', 'Button Image Url 2'),
(127, 1, 'button_image_url_3', 'Button Image Url 3'),
(128, 1, 'features', 'Features'),
(129, 1, 'add_feature', 'Add Feature'),
(130, 1, 'edit_feature', 'Edit Feature'),
(131, 1, 'type', 'Type'),
(132, 1, 'icon', 'Icon'),
(133, 1, 'back', 'Back'),
(134, 1, 'about', 'About'),
(135, 1, 'edit_about', 'Edit About'),
(136, 1, 'button_name', 'Button Name'),
(137, 1, 'button_url', 'Button Url'),
(138, 1, 'button_name_2', 'Button Name 2'),
(139, 1, 'button_url_2', 'Button Url 2'),
(140, 1, 'recommended_tags', 'Recommended tags'),
(141, 1, 'buy_now', 'Buy Now'),
(142, 1, 'add_buy_now', 'Add Buy Now'),
(143, 1, 'edit_buy_now', 'Edit Buy Now'),
(144, 1, 'subtitle', 'Subtitle'),
(145, 1, 'price', 'Price'),
(146, 1, 'work_process', 'Work Process'),
(147, 1, 'add_work_process', 'Add Work Process'),
(148, 1, 'edit_work_process', 'Edit Work Process'),
(149, 1, 'testimonials', 'Testimonials'),
(150, 1, 'add_testimonial', 'Add Testimonial'),
(151, 1, 'edit_testimonial', 'Edit Testimonial'),
(152, 1, 'job', 'Job'),
(153, 1, 'star', 'Star'),
(154, 1, 'faqs', 'Faqs'),
(155, 1, 'add_faq', 'Add Faq'),
(156, 1, 'edit_faq', 'Edit Faq'),
(157, 1, 'answer', 'Answer'),
(158, 1, 'question', 'Question'),
(159, 1, 'plan', 'Plan'),
(160, 1, 'add_plan', 'Add Plan'),
(161, 1, 'edit_plan', 'Edit Plan'),
(162, 1, 'currency', 'Currency'),
(163, 1, 'extra_text', 'Extra Text'),
(164, 1, 'feature_list', 'Feature List'),
(165, 1, 'non_feature_list', 'Non Feature List'),
(166, 1, 'recommended', 'Recommended'),
(167, 1, 'teams', 'Teams'),
(168, 1, 'add_team', 'Add Team'),
(169, 1, 'edit_team', 'Edit Team'),
(170, 1, 'subscribe', 'Subscribe'),
(171, 1, 'edit_subscribe', 'Edit Subscribe'),
(172, 1, 'call_to_action', 'Call To Action'),
(173, 1, 'edit_call_to_action', 'Edit Call To Action'),
(174, 1, 'button_image', 'Button Image'),
(175, 1, 'contact_info', 'Contact Info'),
(176, 1, 'add_contact_info', 'Add Contact Info'),
(177, 1, 'edit_contact_info', 'Edit Contact Info'),
(178, 1, 'contact', 'Contact'),
(179, 1, 'map_iframe', 'Map Iframe (link in src)'),
(180, 1, 'map_iframe_desc_placeholder', 'Please find your address on Google Map. And click the Share Button on the Left Side. You will see the Map Placement Area. In the Copy Html field in this section Copy and paste the link in the src from the code inside.'),
(181, 1, 'footer', 'Footer'),
(182, 1, 'add_footer', 'Add Footer'),
(183, 1, 'edit_footer', 'Edit Footer'),
(184, 1, 'add_footer_category', 'Add Footer Category'),
(185, 1, 'services', 'Services'),
(186, 1, 'add_service', 'Add Service'),
(187, 1, 'edit_service', 'Edit Service'),
(188, 1, 'additional_features', 'Additional Features'),
(189, 1, 'service_content', 'Service Content'),
(190, 1, 'edit_service_content', 'Edit Service Content'),
(191, 1, 'service_process', 'Service Process'),
(192, 1, 'add_service_process', 'Add Service Process'),
(193, 1, 'edit_service_process', 'Edit Service Process'),
(194, 1, 'service_items', 'Service Items'),
(195, 1, 'add_service_item', 'Add Service Item'),
(196, 1, 'edit_service_item', 'Edit Service Item'),
(197, 1, 'portfolio', 'Portfolio'),
(198, 1, 'add_portfolio', 'Add Portfolio'),
(199, 1, 'edit_portfolio', 'Edit Portfolio'),
(200, 1, 'thumbnail', 'Thumbnail'),
(201, 1, 'images', 'Images'),
(202, 1, 'add_image', 'Add Image'),
(203, 1, 'edit_image', 'Edit Image'),
(204, 1, 'details', 'Details'),
(205, 1, 'add_detail', 'Add Detail'),
(206, 1, 'edit_detail', 'Edit Detail'),
(207, 1, 'gallery', 'Gallery'),
(208, 1, 'add_gallery', 'Add Gallery'),
(209, 1, 'edit_gallery', 'Edit Gallery'),
(210, 1, 'settings', 'Settings'),
(211, 1, 'preloader', 'Preloader'),
(212, 1, 'preloader_text', 'Preloader Text'),
(213, 1, 'favicon', 'Favicon'),
(214, 1, 'header_image', 'Header Image'),
(215, 1, 'footer_image', 'Footer Image'),
(216, 1, 'edit_footer_image', 'Edit Footer Image'),
(217, 1, 'panel_image', 'Panel Image'),
(218, 1, 'admin_logo', 'Admin Logo'),
(219, 1, 'admin_small_logo', 'Admin Small Logo'),
(220, 1, 'external_url', 'External Url'),
(221, 1, 'site_info', 'Site Info'),
(222, 1, 'edit_site_info', 'Edit Site Info'),
(223, 1, 'copyright', 'Copyright'),
(224, 1, 'socials', 'Socials'),
(225, 1, 'add_social', 'Add Social'),
(226, 1, 'edit_social', 'Edit Social'),
(227, 1, 'google_analytic', 'Google Analytic'),
(228, 1, 'tawk_to', 'Tawk to'),
(229, 1, 'quick_access_buttons', 'Quick Access Buttons'),
(230, 1, 'side_buttons', 'Side Buttons'),
(231, 1, 'email_or_whatsapp', 'Email or Whatsapp'),
(232, 1, 'enable', 'Enable'),
(233, 1, 'disable', 'Disable'),
(234, 1, 'bottom_buttons', 'Bottom Buttons'),
(235, 1, 'whatsapp', 'Whatsapp'),
(236, 1, 'color_option', 'Color Option'),
(237, 1, 'ready_color_option', 'Ready Color Option'),
(238, 1, 'customize_color', 'Customize Color'),
(239, 1, 'main_color', 'Main Color'),
(240, 1, 'secondary_color', 'Secondary Color'),
(241, 1, 'tertiary_color', 'Tertiary Color'),
(242, 1, 'scroll_button_color', 'Scroll Button Color'),
(243, 1, 'bottom_button_color', 'Bottom Button Color'),
(244, 1, 'bottom_button_hover_color', 'Bottom Button Hover Color'),
(245, 1, 'side_button_color', 'Side Button Color'),
(246, 1, 'fixed_page_setting', 'Fixed Page Setting'),
(247, 1, 'header_style', 'Header Style'),
(248, 1, 'footer_style', 'Footer Style'),
(249, 1, 'for_pages_without_page_builder', 'for pages without page builder'),
(250, 1, 'subscribe_section', 'Subscribe Section'),
(251, 1, 'you_can_see_this_section_on_some_pages_that_do_not_have_a_page_builder', 'You can see this section on some pages that do not have a page builder'),
(252, 1, 'recent_portfolio_section', 'Recent Portfolio Section'),
(253, 1, 'messages', 'Messages'),
(254, 1, 'mark_all_as_read', 'Mark All As Read'),
(255, 1, 'phone', 'Phone'),
(256, 1, 'message', 'Message'),
(257, 1, 'read_status', 'Read Status'),
(258, 1, 'read', 'Read'),
(259, 1, 'unread', 'Unread'),
(260, 1, 'mark', 'Mark'),
(261, 1, 'seo', 'Seo'),
(262, 1, 'site_title', 'Site Title'),
(263, 1, 'site_description', 'Site Description'),
(264, 1, 'site_keywords', 'Site Keywords'),
(265, 1, 'languages', 'Languages'),
(266, 1, 'default_site_language', 'Default Site Language'),
(267, 1, 'add_language', 'Add Language'),
(268, 1, 'language_name', 'Language Name'),
(269, 1, 'language_code', 'Language Code'),
(270, 1, 'direction', 'Direction'),
(271, 1, 'display_dropdown', 'Display Dropdown?'),
(272, 1, 'show', 'Show'),
(273, 1, 'hide', 'Hide'),
(274, 1, 'keywords', 'Keywords'),
(275, 1, 'for_admin_panel', 'For Admin Panel'),
(276, 1, 'for_frontend', 'For Frontend'),
(277, 1, 'profile', 'Profile'),
(278, 1, 'change_password', 'Change Password'),
(279, 1, 'current_password', 'Current Password'),
(280, 1, 'pending_approval', 'Pending Approval'),
(281, 1, 'approval', 'Approval'),
(282, 1, 'data_language', 'Data Language'),
(283, 1, 'which_language', 'Which language do you want to create the data?'),
(284, 1, 'reminding', 'Please note that all the entries you create will be based on your chosen language.'),
(285, 1, 'notifications', 'Notifications'),
(286, 1, 'logout', 'Logout'),
(287, 1, 'optimizer', 'Optimizer'),
(288, 1, 'required_fields', 'Fields marked are required'),
(289, 1, 'site', 'Site'),
(290, 1, 'add_keyword', 'Add Keyword'),
(291, 1, 'key', 'Key'),
(292, 1, 'value', 'Value'),
(293, 1, 'delete_selected', 'Delete selected?'),
(294, 1, 'comments', 'Comments'),
(295, 1, 'all', 'All'),
(296, 1, 'logo', 'Logo'),
(297, 1, 'see_edit', 'See Edit'),
(298, 1, 'subscribers', 'Subscribers'),
(299, 1, 'add_subscriber', 'Add Subscriber'),
(300, 1, 'default_page', 'Default Page'),
(301, 1, 'custom_page', 'Custom Page'),
(302, 1, 'language', 'Language'),
(303, 1, 'video_type', 'Video Type'),
(304, 1, 'youtube', 'Youtube'),
(305, 1, 'other', 'Other'),
(306, 1, 'video_url', 'Video Url'),
(307, 1, 'add_more', 'Add More'),
(308, 1, 'counter_list', 'Counter List'),
(309, 1, 'add_counter', 'Add Counter'),
(310, 1, 'counter', 'Counter'),
(311, 1, 'item', 'Item'),
(312, 1, 'client', 'Client'),
(313, 1, 'add_client', 'Add Client'),
(314, 1, 'edit_client', 'Edit Client'),
(315, 1, 'segment_count', 'Segment Count: '),
(316, 1, 'careers', 'Careers'),
(317, 1, 'add_career', 'Add Career'),
(318, 1, 'edit_career', 'Edit Career'),
(319, 1, 'when_you_leave_this_section_blank_it_will_go_to_its_own_detail_page', 'When you leave this section blank it will go to its own detail page'),
(320, 1, 'move', 'Move'),
(321, 1, 'touch', 'Touch'),
(322, 1, 'add_blog_image', 'Add Blog Image'),
(323, 1, 'add_blog_detail', 'Add Blog Detail'),
(324, 1, 'view_draft', 'View Draft'),
(325, 1, 'map', 'Map'),
(326, 1, 'select', 'Select'),
(327, 1, 'portfolio_content', 'Portfolio Content'),
(328, 1, 'portfolio_details', 'Portfolio Details'),
(329, 1, 'portfolio_images', 'Portfolio Images'),
(330, 1, 'add_portfolio_image', 'Add Portfolio Image'),
(331, 1, 'add_portfolio_content', 'Add Portfolio Content'),
(332, 1, 'add_portfolio_detail', 'Add Portfolio Detail'),
(333, 1, 'facebook_url', 'Facebook URL'),
(334, 1, 'twitter_url', 'X URL'),
(335, 1, 'instagram_url', 'Instagram URL'),
(336, 1, 'youtube_url', 'Youtube URL'),
(337, 1, 'linkedin_url', 'Linkedin URL'),
(338, 1, 'company_title', 'Company Title'),
(339, 1, 'company_description', 'Company Description'),
(340, 1, 'company_contact_title', 'Company Contact Title'),
(341, 1, 'address', 'Address'),
(342, 1, 'career_content', 'Career Content'),
(343, 1, 'edit_career_content', 'Edit Career Content'),
(344, 1, 'copy_url', 'Copy URL'),
(345, 1, 'font', 'Font'),
(346, 1, 'draft_view', 'Draft View'),
(347, 1, 'add_blog_category', 'Add Blog Category'),
(348, 1, 'you_can_enable_or_disable_draft_sections_on_the_front_side', 'You can enable or disable draft sections on the front side'),
(349, 1, 'edit_portfolio_content', 'Edit Portfolio Content'),
(350, 1, 'style1', 'style 1'),
(351, 1, 'style2', 'style 2'),
(352, 1, 'style3', 'style 3'),
(353, 1, 'style4', 'style 4'),
(354, 1, 'style5', 'style 5'),
(355, 1, 'style6', 'style 6'),
(356, 1, 'style7', 'style 7'),
(357, 1, 'style8', 'style 8');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'upload check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(2, 'page builder check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(3, 'menu check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(4, 'blog check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(5, 'section check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(6, 'service check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(7, 'portfolio check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(8, 'gallery check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(9, 'setting check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(10, 'contact message check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(11, 'subscribe check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(12, 'comments check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(13, 'language check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25'),
(14, 'clear cache check', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal_access_tokens`
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

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gallery_image` text NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `currency` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `extra_text` text DEFAULT NULL,
  `feature_list` text DEFAULT NULL,
  `non_feature_list` text DEFAULT NULL,
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `recommended` enum('yes','no') NOT NULL DEFAULT 'no',
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `plan_sections`
--

CREATE TABLE `plan_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1') NOT NULL DEFAULT 'style1',
  `category_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `section_image` text DEFAULT NULL,
  `portfolio_slug` text NOT NULL,
  `status` enum('published','draft') NOT NULL DEFAULT 'published',
  `url` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `portfolio_categories`
--

CREATE TABLE `portfolio_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `portfolio_category_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `portfolio_contents`
--

CREATE TABLE `portfolio_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` bigint(20) UNSIGNED NOT NULL,
  `section_image` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `portfolio_details`
--

CREATE TABLE `portfolio_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `portfolio_detail_sections`
--

CREATE TABLE `portfolio_detail_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` bigint(20) UNSIGNED NOT NULL,
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `portfolio_images`
--

CREATE TABLE `portfolio_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` bigint(20) UNSIGNED NOT NULL,
  `section_image` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `portfolio_sections`
--

CREATE TABLE `portfolio_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `section_item` int(11) NOT NULL DEFAULT 6,
  `paginate_item` int(11) NOT NULL DEFAULT 12,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `preloaders`
--

CREATE TABLE `preloaders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `preloader_text` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'web', '2024-03-23 07:18:25', '2024-03-23 07:18:25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `seos`
--

CREATE TABLE `seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `fb_app_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1') NOT NULL DEFAULT 'style1',
  `category_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `type` enum('icon','image') NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `section_image` text DEFAULT NULL,
  `section_image_2` text DEFAULT NULL,
  `title` text NOT NULL,
  `short_description` text DEFAULT NULL,
  `service_slug` text NOT NULL,
  `status` enum('published','draft') NOT NULL DEFAULT 'published',
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `service_category_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `service_contents`
--

CREATE TABLE `service_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `section_image` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `service_items`
--

CREATE TABLE `service_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `service_processes`
--

CREATE TABLE `service_processes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `service_sections`
--

CREATE TABLE `service_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `section_item` int(11) NOT NULL DEFAULT 6,
  `paginate_item` int(11) NOT NULL DEFAULT 12,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('YqVGvI0kWTf9nrcNsvF4pSNgFODBoL9zevdIhimw', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN01hNzJodFFFbmIzQUxZM2NyaUlkd1ZWYnZINUl6eEFpU2w0ZFA3NSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0NDoiaHR0cDovL2xvY2FsaG9zdDo4MTgxL2xhcmF2ZWwxMC14bW96ZS9wdWJsaWMiO319', 1711189165);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `side_button_widgets`
--

CREATE TABLE `side_button_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `social_media` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `contact` varchar(255) NOT NULL,
  `email_or_whatsapp` varchar(255) DEFAULT NULL,
  `status_whatsapp` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `phone` varchar(255) DEFAULT NULL,
  `status_phone` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `site_infos`
--

CREATE TABLE `site_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `socials`
--

CREATE TABLE `socials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `social_media` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `submenus`
--

CREATE TABLE `submenus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `submenu_name` text NOT NULL,
  `uri` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `status` enum('published','draft') NOT NULL DEFAULT 'published',
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `submenus`
--

INSERT INTO `submenus` (`id`, `language_id`, `menu_id`, `menu_name`, `submenu_name`, `uri`, `url`, `view`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Home', 'Home Version 01', '/', NULL, 0, 'published', 0, NULL, NULL),
(2, 1, 1, 'Home', 'Home Version 02', 'index-2', NULL, 0, 'published', 0, NULL, NULL),
(3, 1, 1, 'Home', 'Home Version 03', 'index-3', NULL, 0, 'published', 0, NULL, NULL),
(4, 1, 3, 'Pages', 'Faqs', 'faqs', NULL, 0, 'published', 0, NULL, NULL),
(5, 1, 3, 'Pages', 'Gallery', 'gallery', NULL, 0, 'published', 0, NULL, NULL),
(6, 1, 3, 'Pages', 'Teams', 'teams', NULL, 0, 'published', 0, NULL, NULL),
(7, 1, 3, 'Pages', 'Services', 'services', NULL, 0, 'published', 0, NULL, NULL),
(8, 1, 3, 'Pages', 'Portfolio', 'portfolios', NULL, 0, 'published', 0, NULL, NULL),
(9, 1, 3, 'Pages', 'Plans', 'plans', NULL, 0, 'published', 0, NULL, NULL),
(10, 1, 3, 'Pages', 'Career', 'careers', NULL, 0, 'published', 0, NULL, NULL),
(11, 1, 4, 'News', 'Blogs', 'blogs', NULL, 0, 'published', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subscribe_sections`
--

CREATE TABLE `subscribe_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2') NOT NULL DEFAULT 'style1',
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tawk_tos`
--

CREATE TABLE `tawk_tos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tawk_to` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1') NOT NULL DEFAULT 'style1',
  `category_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `section_image` text DEFAULT NULL,
  `name` text NOT NULL,
  `job` text DEFAULT NULL,
  `facebook_url` text DEFAULT NULL,
  `twitter_url` text DEFAULT NULL,
  `instagram_url` text DEFAULT NULL,
  `youtube_url` text DEFAULT NULL,
  `linkedin_url` text DEFAULT NULL,
  `team_slug` text NOT NULL,
  `status` enum('published','draft') NOT NULL DEFAULT 'published',
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `team_categories`
--

CREATE TABLE `team_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `team_category_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `team_sections`
--

CREATE TABLE `team_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `button_name` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `section_item` int(11) NOT NULL DEFAULT 3,
  `paginate_item` int(11) NOT NULL DEFAULT 12,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2','style3') NOT NULL DEFAULT 'style1',
  `section_image` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `job` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `star` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimonial_sections`
--

CREATE TABLE `testimonial_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2','style3') NOT NULL DEFAULT 'style1',
  `title` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Super-Admin User', 'superadmin16@elsecolor.com', '2024-03-23 07:18:26', '$2y$10$WlxZO/COQSermIsJJLsUfupzhSeNJPHvopAULIBq3VWRMOScQe/uS', NULL, NULL, NULL, '5Dk8V5x8IdFP97j7t6OXeZceycFG2joClI04Z1KW4ip1HKEfbNDBDE9UVAMY', NULL, NULL, 0, '2024-03-23 07:18:26', '2024-03-23 07:18:26');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `work_processes`
--

CREATE TABLE `work_processes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2') NOT NULL DEFAULT 'style1',
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `work_process_sections`
--

CREATE TABLE `work_process_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `style` enum('style1','style2') NOT NULL DEFAULT 'style1',
  `section_image` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `about_sections`
--
ALTER TABLE `about_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `about_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `about_section_counters`
--
ALTER TABLE `about_section_counters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `about_section_counters_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `about_section_features`
--
ALTER TABLE `about_section_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `about_section_features_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `banner_clients`
--
ALTER TABLE `banner_clients`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `banner_client_sections`
--
ALTER TABLE `banner_client_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banner_client_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `blog_details`
--
ALTER TABLE `blog_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_details_blog_id_foreign` (`blog_id`);

--
-- Tablo için indeksler `blog_images`
--
ALTER TABLE `blog_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_images_blog_id_foreign` (`blog_id`);

--
-- Tablo için indeksler `blog_sections`
--
ALTER TABLE `blog_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `bottom_button_widgets`
--
ALTER TABLE `bottom_button_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bottom_button_widgets_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `breadcrumb_images`
--
ALTER TABLE `breadcrumb_images`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `buy_nows`
--
ALTER TABLE `buy_nows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buy_nows_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `buy_now_sections`
--
ALTER TABLE `buy_now_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buy_now_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `call_to_actions`
--
ALTER TABLE `call_to_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `call_to_actions_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `careers_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `career_categories`
--
ALTER TABLE `career_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `career_categories_category_name_unique` (`category_name`),
  ADD KEY `career_categories_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `career_contents`
--
ALTER TABLE `career_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `career_contents_career_id_foreign` (`career_id`);

--
-- Tablo için indeksler `career_sections`
--
ALTER TABLE `career_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `career_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_name_unique` (`category_name`),
  ADD KEY `categories_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `color_options`
--
ALTER TABLE `color_options`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `contact_infos`
--
ALTER TABLE `contact_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_infos_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `draft_views`
--
ALTER TABLE `draft_views`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `external_urls`
--
ALTER TABLE `external_urls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `external_urls_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `faq_sections`
--
ALTER TABLE `faq_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `favicons`
--
ALTER TABLE `favicons`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `features_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `feature_sections`
--
ALTER TABLE `feature_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feature_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `fixed_page_settings`
--
ALTER TABLE `fixed_page_settings`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `fonts`
--
ALTER TABLE `fonts`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `footers`
--
ALTER TABLE `footers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `footers_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `footer_categories`
--
ALTER TABLE `footer_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `footer_categories_category_name_unique` (`category_name`),
  ADD KEY `footer_categories_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `footer_images`
--
ALTER TABLE `footer_images`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `frontend_keywords`
--
ALTER TABLE `frontend_keywords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frontend_keywords_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_images_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `gallery_image_sections`
--
ALTER TABLE `gallery_image_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_image_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `google_analytics`
--
ALTER TABLE `google_analytics`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `header_images`
--
ALTER TABLE `header_images`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `maps_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_menu_name_unique` (`menu_name`),
  ADD KEY `menus_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Tablo için indeksler `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Tablo için indeksler `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `page_builders`
--
ALTER TABLE `page_builders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_builders_page_uri_unique` (`page_uri`);

--
-- Tablo için indeksler `page_names`
--
ALTER TABLE `page_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_names_page_name_unique` (`page_name`);

--
-- Tablo için indeksler `panel_images`
--
ALTER TABLE `panel_images`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `panel_keywords`
--
ALTER TABLE `panel_keywords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `panel_keywords_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Tablo için indeksler `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Tablo için indeksler `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Tablo için indeksler `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plans_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `plan_sections`
--
ALTER TABLE `plan_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolios_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `portfolio_categories`
--
ALTER TABLE `portfolio_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `portfolio_categories_category_name_unique` (`category_name`),
  ADD KEY `portfolio_categories_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `portfolio_contents`
--
ALTER TABLE `portfolio_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_contents_portfolio_id_foreign` (`portfolio_id`);

--
-- Tablo için indeksler `portfolio_details`
--
ALTER TABLE `portfolio_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_details_portfolio_id_foreign` (`portfolio_id`);

--
-- Tablo için indeksler `portfolio_detail_sections`
--
ALTER TABLE `portfolio_detail_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_detail_sections_portfolio_id_foreign` (`portfolio_id`);

--
-- Tablo için indeksler `portfolio_images`
--
ALTER TABLE `portfolio_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_images_portfolio_id_foreign` (`portfolio_id`);

--
-- Tablo için indeksler `portfolio_sections`
--
ALTER TABLE `portfolio_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `preloaders`
--
ALTER TABLE `preloaders`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Tablo için indeksler `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Tablo için indeksler `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seos_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_categories_category_name_unique` (`category_name`),
  ADD KEY `service_categories_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `service_contents`
--
ALTER TABLE `service_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_contents_service_id_foreign` (`service_id`);

--
-- Tablo için indeksler `service_items`
--
ALTER TABLE `service_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_items_service_id_foreign` (`service_id`);

--
-- Tablo için indeksler `service_processes`
--
ALTER TABLE `service_processes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_processes_service_id_foreign` (`service_id`);

--
-- Tablo için indeksler `service_sections`
--
ALTER TABLE `service_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Tablo için indeksler `side_button_widgets`
--
ALTER TABLE `side_button_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `site_infos`
--
ALTER TABLE `site_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_infos_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `submenus`
--
ALTER TABLE `submenus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submenus_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `subscribe_sections`
--
ALTER TABLE `subscribe_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribe_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `tawk_tos`
--
ALTER TABLE `tawk_tos`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `team_categories`
--
ALTER TABLE `team_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_categories_category_name_unique` (`category_name`),
  ADD KEY `team_categories_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `team_sections`
--
ALTER TABLE `team_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `testimonial_sections`
--
ALTER TABLE `testimonial_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonial_sections_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Tablo için indeksler `work_processes`
--
ALTER TABLE `work_processes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_processes_language_id_foreign` (`language_id`);

--
-- Tablo için indeksler `work_process_sections`
--
ALTER TABLE `work_process_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_process_sections_language_id_foreign` (`language_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `about_sections`
--
ALTER TABLE `about_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `about_section_counters`
--
ALTER TABLE `about_section_counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `about_section_features`
--
ALTER TABLE `about_section_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `banner_clients`
--
ALTER TABLE `banner_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `banner_client_sections`
--
ALTER TABLE `banner_client_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `blog_details`
--
ALTER TABLE `blog_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `blog_images`
--
ALTER TABLE `blog_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `blog_sections`
--
ALTER TABLE `blog_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `bottom_button_widgets`
--
ALTER TABLE `bottom_button_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `breadcrumb_images`
--
ALTER TABLE `breadcrumb_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `buy_nows`
--
ALTER TABLE `buy_nows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `buy_now_sections`
--
ALTER TABLE `buy_now_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `call_to_actions`
--
ALTER TABLE `call_to_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `careers`
--
ALTER TABLE `careers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `career_categories`
--
ALTER TABLE `career_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `career_contents`
--
ALTER TABLE `career_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `career_sections`
--
ALTER TABLE `career_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `color_options`
--
ALTER TABLE `color_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `contact_infos`
--
ALTER TABLE `contact_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `draft_views`
--
ALTER TABLE `draft_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `external_urls`
--
ALTER TABLE `external_urls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `faq_sections`
--
ALTER TABLE `faq_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `favicons`
--
ALTER TABLE `favicons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `feature_sections`
--
ALTER TABLE `feature_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `fixed_page_settings`
--
ALTER TABLE `fixed_page_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `fonts`
--
ALTER TABLE `fonts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `footers`
--
ALTER TABLE `footers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `footer_categories`
--
ALTER TABLE `footer_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `footer_images`
--
ALTER TABLE `footer_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `frontend_keywords`
--
ALTER TABLE `frontend_keywords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Tablo için AUTO_INCREMENT değeri `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `gallery_image_sections`
--
ALTER TABLE `gallery_image_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `google_analytics`
--
ALTER TABLE `google_analytics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `header_images`
--
ALTER TABLE `header_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `maps`
--
ALTER TABLE `maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- Tablo için AUTO_INCREMENT değeri `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `page_builders`
--
ALTER TABLE `page_builders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `page_names`
--
ALTER TABLE `page_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `panel_images`
--
ALTER TABLE `panel_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `panel_keywords`
--
ALTER TABLE `panel_keywords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- Tablo için AUTO_INCREMENT değeri `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `plan_sections`
--
ALTER TABLE `plan_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `portfolio_categories`
--
ALTER TABLE `portfolio_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `portfolio_contents`
--
ALTER TABLE `portfolio_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `portfolio_details`
--
ALTER TABLE `portfolio_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `portfolio_detail_sections`
--
ALTER TABLE `portfolio_detail_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `portfolio_images`
--
ALTER TABLE `portfolio_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `portfolio_sections`
--
ALTER TABLE `portfolio_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `preloaders`
--
ALTER TABLE `preloaders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `service_contents`
--
ALTER TABLE `service_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `service_items`
--
ALTER TABLE `service_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `service_processes`
--
ALTER TABLE `service_processes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `service_sections`
--
ALTER TABLE `service_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `side_button_widgets`
--
ALTER TABLE `side_button_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `site_infos`
--
ALTER TABLE `site_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `socials`
--
ALTER TABLE `socials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `submenus`
--
ALTER TABLE `submenus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `subscribe_sections`
--
ALTER TABLE `subscribe_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `tawk_tos`
--
ALTER TABLE `tawk_tos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `team_categories`
--
ALTER TABLE `team_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `team_sections`
--
ALTER TABLE `team_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `testimonial_sections`
--
ALTER TABLE `testimonial_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `work_processes`
--
ALTER TABLE `work_processes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `work_process_sections`
--
ALTER TABLE `work_process_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `about_sections`
--
ALTER TABLE `about_sections`
  ADD CONSTRAINT `about_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `about_section_counters`
--
ALTER TABLE `about_section_counters`
  ADD CONSTRAINT `about_section_counters_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `about_section_features`
--
ALTER TABLE `about_section_features`
  ADD CONSTRAINT `about_section_features_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `banner_client_sections`
--
ALTER TABLE `banner_client_sections`
  ADD CONSTRAINT `banner_client_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `blog_details`
--
ALTER TABLE `blog_details`
  ADD CONSTRAINT `blog_details_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `blog_images`
--
ALTER TABLE `blog_images`
  ADD CONSTRAINT `blog_images_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `blog_sections`
--
ALTER TABLE `blog_sections`
  ADD CONSTRAINT `blog_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `bottom_button_widgets`
--
ALTER TABLE `bottom_button_widgets`
  ADD CONSTRAINT `bottom_button_widgets_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `buy_nows`
--
ALTER TABLE `buy_nows`
  ADD CONSTRAINT `buy_nows_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `buy_now_sections`
--
ALTER TABLE `buy_now_sections`
  ADD CONSTRAINT `buy_now_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `call_to_actions`
--
ALTER TABLE `call_to_actions`
  ADD CONSTRAINT `call_to_actions_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `careers`
--
ALTER TABLE `careers`
  ADD CONSTRAINT `careers_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `career_categories`
--
ALTER TABLE `career_categories`
  ADD CONSTRAINT `career_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `career_contents`
--
ALTER TABLE `career_contents`
  ADD CONSTRAINT `career_contents_career_id_foreign` FOREIGN KEY (`career_id`) REFERENCES `careers` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `career_sections`
--
ALTER TABLE `career_sections`
  ADD CONSTRAINT `career_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `contact_infos`
--
ALTER TABLE `contact_infos`
  ADD CONSTRAINT `contact_infos_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `external_urls`
--
ALTER TABLE `external_urls`
  ADD CONSTRAINT `external_urls_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `faq_sections`
--
ALTER TABLE `faq_sections`
  ADD CONSTRAINT `faq_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `features`
--
ALTER TABLE `features`
  ADD CONSTRAINT `features_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `feature_sections`
--
ALTER TABLE `feature_sections`
  ADD CONSTRAINT `feature_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `footers`
--
ALTER TABLE `footers`
  ADD CONSTRAINT `footers_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `footer_categories`
--
ALTER TABLE `footer_categories`
  ADD CONSTRAINT `footer_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `frontend_keywords`
--
ALTER TABLE `frontend_keywords`
  ADD CONSTRAINT `frontend_keywords_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD CONSTRAINT `gallery_images_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `gallery_image_sections`
--
ALTER TABLE `gallery_image_sections`
  ADD CONSTRAINT `gallery_image_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `maps`
--
ALTER TABLE `maps`
  ADD CONSTRAINT `maps_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `panel_keywords`
--
ALTER TABLE `panel_keywords`
  ADD CONSTRAINT `panel_keywords_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `plans`
--
ALTER TABLE `plans`
  ADD CONSTRAINT `plans_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `plan_sections`
--
ALTER TABLE `plan_sections`
  ADD CONSTRAINT `plan_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `portfolio_categories`
--
ALTER TABLE `portfolio_categories`
  ADD CONSTRAINT `portfolio_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `portfolio_contents`
--
ALTER TABLE `portfolio_contents`
  ADD CONSTRAINT `portfolio_contents_portfolio_id_foreign` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `portfolio_details`
--
ALTER TABLE `portfolio_details`
  ADD CONSTRAINT `portfolio_details_portfolio_id_foreign` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `portfolio_detail_sections`
--
ALTER TABLE `portfolio_detail_sections`
  ADD CONSTRAINT `portfolio_detail_sections_portfolio_id_foreign` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `portfolio_images`
--
ALTER TABLE `portfolio_images`
  ADD CONSTRAINT `portfolio_images_portfolio_id_foreign` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `portfolio_sections`
--
ALTER TABLE `portfolio_sections`
  ADD CONSTRAINT `portfolio_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `seos`
--
ALTER TABLE `seos`
  ADD CONSTRAINT `seos_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `service_categories`
--
ALTER TABLE `service_categories`
  ADD CONSTRAINT `service_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `service_contents`
--
ALTER TABLE `service_contents`
  ADD CONSTRAINT `service_contents_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `service_items`
--
ALTER TABLE `service_items`
  ADD CONSTRAINT `service_items_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `service_processes`
--
ALTER TABLE `service_processes`
  ADD CONSTRAINT `service_processes_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `service_sections`
--
ALTER TABLE `service_sections`
  ADD CONSTRAINT `service_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `site_infos`
--
ALTER TABLE `site_infos`
  ADD CONSTRAINT `site_infos_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `submenus`
--
ALTER TABLE `submenus`
  ADD CONSTRAINT `submenus_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `subscribe_sections`
--
ALTER TABLE `subscribe_sections`
  ADD CONSTRAINT `subscribe_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `team_categories`
--
ALTER TABLE `team_categories`
  ADD CONSTRAINT `team_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `team_sections`
--
ALTER TABLE `team_sections`
  ADD CONSTRAINT `team_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `testimonial_sections`
--
ALTER TABLE `testimonial_sections`
  ADD CONSTRAINT `testimonial_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `work_processes`
--
ALTER TABLE `work_processes`
  ADD CONSTRAINT `work_processes_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `work_process_sections`
--
ALTER TABLE `work_process_sections`
  ADD CONSTRAINT `work_process_sections_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
