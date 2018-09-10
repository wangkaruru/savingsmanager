-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 17, 2018 at 10:45 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loan`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'zDi3W7SMOveuaAaw60aGXjyot3izVIuW', 1, '2017-08-07 08:51:00', '2017-08-07 08:51:00', '2017-08-07 08:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `asset_type_id` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `replacement_value` decimal(10,2) DEFAULT NULL,
  `serial_number` text COLLATE utf8_unicode_ci,
  `bought_from` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_types`
--

CREATE TABLE `asset_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `type` enum('current','fixed','intangible','investment','other') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_valuations`
--

CREATE TABLE `asset_valuations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE `audit_trail` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `audit_trail`
--

INSERT INTO `audit_trail` (`id`, `user_id`, `user`, `module`, `notes`, `created_at`, `updated_at`, `branch_id`) VALUES
(1, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-12 04:32:27', '2017-11-12 04:32:27', NULL),
(2, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-12 05:20:36', '2017-11-12 05:20:36', NULL),
(3, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-12 06:58:38', '2017-11-12 06:58:38', NULL),
(4, 1, 'Admin Admin', NULL, 'Logged in to system', '2018-02-10 15:56:41', '2018-02-10 15:56:41', NULL),
(5, 1, 'Admin Admin', NULL, 'Logged out of system', '2018-02-10 16:04:05', '2018-02-10 16:04:05', 1),
(6, 1, 'Admin Admin', NULL, 'Logged in to system', '2018-04-18 12:58:06', '2018-04-18 12:58:06', NULL),
(7, 1, 'Admin Admin', NULL, 'Logged out of system', '2018-04-18 13:40:23', '2018-04-18 13:40:23', 1),
(8, 1, 'Admin Admin', NULL, 'Logged in to system', '2018-06-16 13:02:44', '2018-06-16 13:02:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('Male','Female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `loan_officers` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` enum('online','admin') COLLATE utf8_unicode_ci DEFAULT 'admin',
  `active` tinyint(4) DEFAULT '1',
  `blacklisted` tinyint(4) DEFAULT '0',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `borrower_groups`
--

CREATE TABLE `borrower_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_borrowers` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `borrower_groups`
--

INSERT INTO `borrower_groups` (`id`, `name`, `assigned_borrowers`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'Ff', NULL, 'fd', '2017-09-02 14:04:50', '2017-09-02 14:04:50');

-- --------------------------------------------------------

--
-- Table structure for table `borrower_group_members`
--

CREATE TABLE `borrower_group_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `borrower_group_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `borrower_group_members`
--

INSERT INTO `borrower_group_members` (`id`, `borrower_group_id`, `borrower_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '2017-09-02 14:44:30', '2017-09-02 14:44:30');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_users` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `default_branch` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `assigned_users`, `notes`, `default_branch`) VALUES
(1, 'Default', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `branch_users`
--

CREATE TABLE `branch_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `branch_users`
--

INSERT INTO `branch_users` (`id`, `branch_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2017-10-13 14:35:47', '2017-10-13 14:35:47');

-- --------------------------------------------------------

--
-- Table structure for table `capital`
--

CREATE TABLE `capital` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `bank_account_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collateral`
--

CREATE TABLE `collateral` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `collateral_type_id` int(10) UNSIGNED DEFAULT NULL,
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('returned_to_borrower','repossessed','repossession_initiated','sold','lost','collateral_with_borrower','deposited_into_branch') COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `photo` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `serial_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collateral_types`
--

CREATE TABLE `collateral_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `sortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `sortname`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'AS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua And Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas The'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CD', 'Congo The Democratic Republic Of The'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)'),
(54, 'HR', 'Croatia (Hrvatska)'),
(55, 'CU', 'Cuba'),
(56, 'CY', 'Cyprus'),
(57, 'CZ', 'Czech Republic'),
(58, 'DK', 'Denmark'),
(59, 'DJ', 'Djibouti'),
(60, 'DM', 'Dominica'),
(61, 'DO', 'Dominican Republic'),
(62, 'TP', 'East Timor'),
(63, 'EC', 'Ecuador'),
(64, 'EG', 'Egypt'),
(65, 'SV', 'El Salvador'),
(66, 'GQ', 'Equatorial Guinea'),
(67, 'ER', 'Eritrea'),
(68, 'EE', 'Estonia'),
(69, 'ET', 'Ethiopia'),
(70, 'XA', 'External Territories of Australia'),
(71, 'FK', 'Falkland Islands'),
(72, 'FO', 'Faroe Islands'),
(73, 'FJ', 'Fiji Islands'),
(74, 'FI', 'Finland'),
(75, 'FR', 'France'),
(76, 'GF', 'French Guiana'),
(77, 'PF', 'French Polynesia'),
(78, 'TF', 'French Southern Territories'),
(79, 'GA', 'Gabon'),
(80, 'GM', 'Gambia The'),
(81, 'GE', 'Georgia'),
(82, 'DE', 'Germany'),
(83, 'GH', 'Ghana'),
(84, 'GI', 'Gibraltar'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'XU', 'Guernsey and Alderney'),
(92, 'GN', 'Guinea'),
(93, 'GW', 'Guinea-Bissau'),
(94, 'GY', 'Guyana'),
(95, 'HT', 'Haiti'),
(96, 'HM', 'Heard and McDonald Islands'),
(97, 'HN', 'Honduras'),
(98, 'HK', 'Hong Kong S.A.R.'),
(99, 'HU', 'Hungary'),
(100, 'IS', 'Iceland'),
(101, 'IN', 'India'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'JM', 'Jamaica'),
(109, 'JP', 'Japan'),
(110, 'XJ', 'Jersey'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea North'),
(116, 'KR', 'Korea South'),
(117, 'KW', 'Kuwait'),
(118, 'KG', 'Kyrgyzstan'),
(119, 'LA', 'Laos'),
(120, 'LV', 'Latvia'),
(121, 'LB', 'Lebanon'),
(122, 'LS', 'Lesotho'),
(123, 'LR', 'Liberia'),
(124, 'LY', 'Libya'),
(125, 'LI', 'Liechtenstein'),
(126, 'LT', 'Lithuania'),
(127, 'LU', 'Luxembourg'),
(128, 'MO', 'Macau S.A.R.'),
(129, 'MK', 'Macedonia'),
(130, 'MG', 'Madagascar'),
(131, 'MW', 'Malawi'),
(132, 'MY', 'Malaysia'),
(133, 'MV', 'Maldives'),
(134, 'ML', 'Mali'),
(135, 'MT', 'Malta'),
(136, 'XM', 'Man (Isle of)'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'YT', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia'),
(144, 'MD', 'Moldova'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'MS', 'Montserrat'),
(148, 'MA', 'Morocco'),
(149, 'MZ', 'Mozambique'),
(150, 'MM', 'Myanmar'),
(151, 'NA', 'Namibia'),
(152, 'NR', 'Nauru'),
(153, 'NP', 'Nepal'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NL', 'Netherlands The'),
(156, 'NC', 'New Caledonia'),
(157, 'NZ', 'New Zealand'),
(158, 'NI', 'Nicaragua'),
(159, 'NE', 'Niger'),
(160, 'NG', 'Nigeria'),
(161, 'NU', 'Niue'),
(162, 'NF', 'Norfolk Island'),
(163, 'MP', 'Northern Mariana Islands'),
(164, 'NO', 'Norway'),
(165, 'OM', 'Oman'),
(166, 'PK', 'Pakistan'),
(167, 'PW', 'Palau'),
(168, 'PS', 'Palestinian Territory Occupied'),
(169, 'PA', 'Panama'),
(170, 'PG', 'Papua new Guinea'),
(171, 'PY', 'Paraguay'),
(172, 'PE', 'Peru'),
(173, 'PH', 'Philippines'),
(174, 'PN', 'Pitcairn Island'),
(175, 'PL', 'Poland'),
(176, 'PT', 'Portugal'),
(177, 'PR', 'Puerto Rico'),
(178, 'QA', 'Qatar'),
(179, 'RE', 'Reunion'),
(180, 'RO', 'Romania'),
(181, 'RU', 'Russia'),
(182, 'RW', 'Rwanda'),
(183, 'SH', 'Saint Helena'),
(184, 'KN', 'Saint Kitts And Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'PM', 'Saint Pierre and Miquelon'),
(187, 'VC', 'Saint Vincent And The Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'XG', 'Smaller Territories of the UK'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia'),
(204, 'SS', 'South Sudan'),
(205, 'ES', 'Spain'),
(206, 'LK', 'Sri Lanka'),
(207, 'SD', 'Sudan'),
(208, 'SR', 'Suriname'),
(209, 'SJ', 'Svalbard And Jan Mayen Islands'),
(210, 'SZ', 'Swaziland'),
(211, 'SE', 'Sweden'),
(212, 'CH', 'Switzerland'),
(213, 'SY', 'Syria'),
(214, 'TW', 'Taiwan'),
(215, 'TJ', 'Tajikistan'),
(216, 'TZ', 'Tanzania'),
(217, 'TH', 'Thailand'),
(218, 'TG', 'Togo'),
(219, 'TK', 'Tokelau'),
(220, 'TO', 'Tonga'),
(221, 'TT', 'Trinidad And Tobago'),
(222, 'TN', 'Tunisia'),
(223, 'TR', 'Turkey'),
(224, 'TM', 'Turkmenistan'),
(225, 'TC', 'Turks And Caicos Islands'),
(226, 'TV', 'Tuvalu'),
(227, 'UG', 'Uganda'),
(228, 'UA', 'Ukraine'),
(229, 'AE', 'United Arab Emirates'),
(230, 'GB', 'United Kingdom'),
(231, 'US', 'United States'),
(232, 'UM', 'United States Minor Outlying Islands'),
(233, 'UY', 'Uruguay'),
(234, 'UZ', 'Uzbekistan'),
(235, 'VU', 'Vanuatu'),
(236, 'VA', 'Vatican City State (Holy See)'),
(237, 'VE', 'Venezuela'),
(238, 'VN', 'Vietnam'),
(239, 'VG', 'Virgin Islands (British)'),
(240, 'VI', 'Virgin Islands (US)'),
(241, 'WF', 'Wallis And Futuna Islands'),
(242, 'EH', 'Western Sahara'),
(243, 'YE', 'Yemen'),
(244, 'YU', 'Yugoslavia'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` enum('number','textfield','date','decimal','textarea') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'textfield',
  `required` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_meta`
--

CREATE TABLE `custom_fields_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `recipients` int(10) UNSIGNED NOT NULL,
  `send_to` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_type_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recurring` tinyint(4) NOT NULL DEFAULT '0',
  `recur_frequency` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '31',
  `recur_start_date` date DEFAULT NULL,
  `recur_end_date` date DEFAULT NULL,
  `recur_next_date` date DEFAULT NULL,
  `recur_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'month',
  `notes` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_types`
--

CREATE TABLE `expense_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guarantor`
--

CREATE TABLE `guarantor` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `loan_application_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `guarantor_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `saving_amount` decimal(10,2) DEFAULT NULL,
  `accepted_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','accepted','declined') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `saving_status` enum('pending','hold','restored') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `saving_restored` tinyint(4) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) NOT NULL,
  `loan_product_id` int(11) NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `maturity_date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interest_start_date` date DEFAULT NULL,
  `first_payment_date` date DEFAULT NULL,
  `loan_disbursed_by_id` int(11) DEFAULT NULL,
  `principal` decimal(10,4) DEFAULT NULL,
  `interest_method` enum('flat_rate','declining_balance_equal_installments','declining_balance_equal_principal','interest_only','compound_interest') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'flat_rate',
  `interest_rate` decimal(10,4) DEFAULT NULL,
  `interest_period` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'day',
  `override_interest` tinyint(4) NOT NULL DEFAULT '0',
  `override_interest_amount` decimal(10,4) DEFAULT '0.0000',
  `loan_duration` int(11) DEFAULT NULL,
  `loan_duration_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'year',
  `repayment_cycle` enum('daily','weekly','monthly','bi_monthly','quarterly','semi_annually','annually') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'monthly',
  `decimal_places` enum('round_off_to_two_decimal','round_off_to_integer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'round_off_to_two_decimal',
  `repayment_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_fees_schedule` enum('dont_include','distribute_fees_evenly','charge_fees_on_released_date','charge_fees_on_first_payment','charge_fees_on_last_payment') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'distribute_fees_evenly',
  `grace_on_interest_charged` int(11) DEFAULT NULL,
  `loan_status_id` int(11) DEFAULT NULL,
  `files` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `loan_status` enum('open','fully_paid','defaulted','restructured','processing') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `balance` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `override` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','approved','disbursed','declined','withdrawn','written_off','closed','pending_reschedule','rescheduled') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `applied_amount` decimal(10,2) DEFAULT NULL,
  `approved_amount` decimal(10,2) DEFAULT NULL,
  `approved_notes` text COLLATE utf8_unicode_ci,
  `disbursed_notes` text COLLATE utf8_unicode_ci,
  `withdrawn_notes` text COLLATE utf8_unicode_ci,
  `closed_notes` text COLLATE utf8_unicode_ci,
  `rescheduled_notes` text COLLATE utf8_unicode_ci,
  `declined_notes` text COLLATE utf8_unicode_ci,
  `written_off_notes` text COLLATE utf8_unicode_ci,
  `approved_date` date DEFAULT NULL,
  `disbursed_date` date DEFAULT NULL,
  `withdrawn_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `rescheduled_date` date DEFAULT NULL,
  `declined_date` date DEFAULT NULL,
  `written_off_date` date DEFAULT NULL,
  `approved_by_id` int(11) DEFAULT NULL,
  `disbursed_by_id` int(11) DEFAULT NULL,
  `withdrawn_by_id` int(11) DEFAULT NULL,
  `declined_by_id` int(11) DEFAULT NULL,
  `written_off_by_id` int(11) DEFAULT NULL,
  `rescheduled_by_id` int(11) DEFAULT NULL,
  `closed_by_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `processing_fee` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_applications`
--

CREATE TABLE `loan_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `loan_product_id` int(11) NOT NULL,
  `amount` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `status` enum('approved','pending','declined') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_comments`
--

CREATE TABLE `loan_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `loan_id` int(10) UNSIGNED NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_disbursed_by`
--

CREATE TABLE `loan_disbursed_by` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_disbursed_by`
--

INSERT INTO `loan_disbursed_by` (`id`, `name`) VALUES
(1, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `loan_fees`
--

CREATE TABLE `loan_fees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_fee_type` enum('fixed','percentage') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_fees_meta`
--

CREATE TABLE `loan_fees_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `loan_fees_id` int(11) DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `loan_fees_schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_products`
--

CREATE TABLE `loan_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_disbursed_by_id` text COLLATE utf8_unicode_ci,
  `minimum_principal` decimal(10,4) DEFAULT NULL,
  `default_principal` decimal(10,4) DEFAULT NULL,
  `maximum_principal` decimal(10,4) DEFAULT NULL,
  `interest_method` enum('flat_rate','declining_balance_equal_installments','declining_balance_equal_principal','interest_only','compound_interest') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'flat_rate',
  `interest_rate` decimal(10,4) DEFAULT NULL,
  `interest_period` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'year',
  `minimum_interest_rate` decimal(10,4) DEFAULT NULL,
  `default_interest_rate` decimal(10,4) DEFAULT NULL,
  `maximum_interest_rate` decimal(10,4) DEFAULT NULL,
  `override_interest` tinyint(4) NOT NULL DEFAULT '0',
  `override_interest_amount` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `default_loan_duration` int(11) DEFAULT NULL,
  `default_loan_duration_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'year',
  `repayment_cycle` enum('daily','weekly','monthly','bi_monthly','quarterly','semi_annually','annually') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'monthly',
  `decimal_places` enum('round_off_to_two_decimal','round_off_to_integer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'round_off_to_two_decimal',
  `repayment_order` text COLLATE utf8_unicode_ci,
  `loan_fees_schedule` enum('dont_include','distribute_fees_evenly','charge_fees_on_released_date','charge_fees_on_first_payment','charge_fees_on_last_payment') COLLATE utf8_unicode_ci DEFAULT 'distribute_fees_evenly',
  `branch_access` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grace_on_interest_charged` int(11) DEFAULT NULL,
  `advanced_enabled` tinyint(4) DEFAULT '0',
  `enable_late_repayment_penalty` tinyint(4) DEFAULT '0',
  `enable_after_maturity_date_penalty` tinyint(4) DEFAULT '0',
  `after_maturity_date_penalty_type` enum('percentage','fixed') COLLATE utf8_unicode_ci DEFAULT 'percentage',
  `late_repayment_penalty_type` enum('percentage','fixed') COLLATE utf8_unicode_ci DEFAULT 'percentage',
  `late_repayment_penalty_calculate` enum('overdue_principal','overdue_principal_interest','overdue_principal_interest_fees','total_overdue') COLLATE utf8_unicode_ci DEFAULT 'overdue_principal',
  `after_maturity_date_penalty_calculate` enum('overdue_principal','overdue_principal_interest','overdue_principal_interest_fees','total_overdue') COLLATE utf8_unicode_ci DEFAULT 'overdue_principal',
  `late_repayment_penalty_amount` decimal(10,4) DEFAULT NULL,
  `after_maturity_date_penalty_amount` decimal(10,4) DEFAULT NULL,
  `late_repayment_penalty_grace_period` int(11) DEFAULT NULL,
  `after_maturity_date_penalty_grace_period` int(11) DEFAULT NULL,
  `late_repayment_penalty_recurring` int(11) DEFAULT NULL,
  `after_maturity_date_penalty_recurring` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_repayments`
--

CREATE TABLE `loan_repayments` (
  `id` int(10) UNSIGNED NOT NULL,
  `loan_id` int(10) UNSIGNED NOT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `repayment_method_id` int(10) UNSIGNED NOT NULL,
  `collection_date` date DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_repayment_methods`
--

CREATE TABLE `loan_repayment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_repayment_methods`
--

INSERT INTO `loan_repayment_methods` (`id`, `name`) VALUES
(1, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `loan_schedules`
--

CREATE TABLE `loan_schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `loan_id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `due_date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `principal` decimal(10,4) DEFAULT NULL,
  `principal_balance` decimal(10,4) DEFAULT NULL,
  `interest` decimal(10,4) DEFAULT NULL,
  `fees` decimal(10,4) DEFAULT NULL,
  `penalty` decimal(10,4) DEFAULT NULL,
  `due` decimal(10,4) DEFAULT NULL,
  `system_generated` tinyint(4) NOT NULL DEFAULT '0',
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `missed` tinyint(4) NOT NULL DEFAULT '0',
  `missed_penalty_applied` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_status`
--

CREATE TABLE `loan_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  `attach_file` text COLLATE utf8_unicode_ci,
  `to_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `read` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_07_02_230147_migration_cartalyst_sentinel', 1),
('2016_07_23_173157_create_messages_table', 1),
('2016_07_23_173226_create_sms_table', 1),
('2016_07_23_173242_create_settings_table', 1),
('2016_11_05_062734_create_permissions_table', 1),
('2017_02_23_000640_create_borrowers_table', 1),
('2017_02_23_002300_create_custom_fields_table', 1),
('2017_02_23_003720_create_custom_fields_meta_table', 1),
('2017_03_05_131103_create_loans_table', 1),
('2017_03_05_132848_create_loans_products_table', 1),
('2017_03_05_145851_create_loan_disbursed_by_table', 1),
('2017_03_05_150107_create_loan_repayment_methods_table', 1),
('2017_03_05_151538_create_loan_status_table', 1),
('2017_03_08_182936_create_loan_schedules_table', 1),
('2017_03_19_080840_create_loan_repayments_table', 1),
('2017_04_02_142753_create_loan_comments_table', 1),
('2017_04_11_091435_create_payroll_templates_table', 1),
('2017_04_11_094729_create_payroll_template_meta_table', 1),
('2017_04_12_004631_create_payroll_table', 1),
('2017_04_12_004829_create_payroll_meta_table', 1),
('2017_04_14_083438_create_expenses_table', 1),
('2017_04_14_083535_create_expense_types_table', 1),
('2017_04_16_084016_create_other_income_table', 1),
('2017_04_16_084118_create_other_income_types_table', 1),
('2017_04_16_094025_create_collateral_types_table', 1),
('2017_04_16_094131_create_collateral_table', 1),
('2017_04_18_083800_create_emails_table', 1),
('2017_04_23_072100_create_loan_fees_table', 1),
('2017_04_23_073118_create_loan_fees_meta_table', 1),
('2017_05_04_103559_create_countries_table', 1),
('2017_07_17_123811_add_login_fields_to_borrowers_table', 1),
('2017_07_17_124138_add_month_year_to_borrowers_table', 1),
('2017_07_17_124357_add_fields_to_borrowers_table', 1),
('2017_07_17_130228_add_v1_1_settings_table', 1),
('2017_07_23_061641_create_loan_applications_table', 1),
('2017_07_23_064420_create_audit_trail_table', 1),
('2017_07_23_120222_add_payment_to_v1_1_settings_table', 1),
('2017_07_24_063824_create_savings_product_table', 1),
('2017_07_24_070639_create_savings_table', 1),
('2017_07_24_071756_create_savings_transactions_table', 1),
('2017_07_24_073802_create_savings_fees_table', 1),
('2017_07_27_071556_create_asset_types_table', 1),
('2017_07_27_071814_create_assets_table', 1),
('2017_07_27_074421_create_asset_valuations_table', 1),
('2017_07_27_174045_create_capital_table', 1),
('2017_08_01_064016_add_status_to_loans_table', 1),
('2017_08_01_081424_create_guarantor_table', 1),
('2017_08_07_083717_update_from_v1_0_to_1_1', 1),
('2017_08_23_205719_add_blacklist_to_borrowers_table', 2),
('2017_09_02_092303_create_borrower_groups', 3),
('2017_09_02_092551_create_branches', 3),
('2017_09_02_094025_add_branches_to_all_tables', 3),
('2017_09_02_154128_create_borrower_group_members_table', 3),
('2017_09_02_171328_update_from_v1_1_to_1_2', 4),
('2017_09_05_075257_add_v12_settings', 5),
('2017_09_05_082513_add_v12_permissions', 5),
('2017_09_20_093729_add_client_background_settings', 6),
('2017_09_20_094221_change_update_url', 6),
('2017_09_23_133042_create_provision_rates_table', 7),
('2017_09_23_133535_insert_data_to_provision_rates_table', 8),
('2017_09_24_091220_create_bank_accounts_table', 9),
('2017_09_24_091340_add_bank_accounts_to_capital_table', 9),
('2017_10_13_113742_create_branch_users_table', 10),
('2017_10_13_121839_add_application_fee_to_loans_table', 10),
('2017_10_13_161720_add_default_branch', 10),
('2017_10_13_161930_create_default_branch_and_assign_user', 11),
('2017_10_13_173431_add_branch_to_schedules', 12),
('2017_10_13_184930_set_default_branch_for_current_loans', 13),
('2017_10_14_062601_add_v_1_3_permissions', 14),
('2017_10_14_063504_update_v_1_3_update_url', 14),
('2017_10_14_074553_update_to_v_1_3', 14);

-- --------------------------------------------------------

--
-- Table structure for table `other_income`
--

CREATE TABLE `other_income` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `other_income_type_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `other_income_types`
--

CREATE TABLE `other_income_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(10) UNSIGNED NOT NULL,
  `payroll_template_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `employee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recurring` tinyint(4) NOT NULL DEFAULT '0',
  `recur_frequency` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '31',
  `recur_start_date` date DEFAULT NULL,
  `recur_end_date` date DEFAULT NULL,
  `recur_next_date` date DEFAULT NULL,
  `recur_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'month',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_meta`
--

CREATE TABLE `payroll_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `payroll_id` int(10) UNSIGNED NOT NULL,
  `payroll_template_meta_id` int(10) UNSIGNED DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` enum('top_left','top_right','bottom_left','bottom_right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'bottom_left'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_templates`
--

CREATE TABLE `payroll_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payroll_templates`
--

INSERT INTO `payroll_templates` (`id`, `name`, `notes`, `picture`) VALUES
(1, 'Default', 'Default Payroll Template', 'default_payroll_template');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_template_meta`
--

CREATE TABLE `payroll_template_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `payroll_template_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` enum('top_left','top_right','bottom_left','bottom_right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'bottom_left',
  `is_default` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payroll_template_meta`
--

INSERT INTO `payroll_template_meta` (`id`, `payroll_template_id`, `name`, `position`, `is_default`) VALUES
(1, 1, 'kimbo', 'top_left', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `parent_id`, `name`, `slug`, `description`) VALUES
(1, 0, 'Borrowers', 'borrowers', 'Access Borrowers Module'),
(2, 1, 'View borrowers', 'borrowers.view', 'View borrowers'),
(3, 1, 'Update borrowers', 'borrowers.update', 'Update Borrowers'),
(4, 1, 'Delete borrowers', 'borrowers.delete', 'Delete borrowers'),
(5, 1, 'Create borrowers', 'borrowers.create', 'Add new borrower'),
(6, 0, 'Loans', 'loans', 'Access Loans Module'),
(7, 6, 'Create Loans', 'loans.create', 'Create Loans'),
(9, 6, 'Update Loans', 'loans.update', 'Update Loans'),
(10, 6, 'Delete Loans', 'loans.delete', 'Delete Loans'),
(11, 6, 'View Loans', 'loans.view', 'View Loans'),
(12, 6, 'Loan Products', 'loans.products', 'Manage Loan Products'),
(13, 6, 'Loan Fees', 'loans.fees', 'Manage Loan Fees'),
(14, 6, 'Loan Schedule', 'loans.schedule', 'Manage loan schedule, including sending loan schedule emails'),
(15, 0, 'Repayments', 'repayments', 'View Repayments Module'),
(16, 15, 'View Repayments', 'repayments.view', 'View All repayments'),
(17, 15, 'Create Repayments', 'repayments.create', 'Add Repayments'),
(18, 15, 'Delete Repayments', 'repayments.delete', 'Delete Repayments'),
(19, 15, 'Update Repayments', 'repayments.update', 'Update Repayments'),
(20, 0, 'Payroll', 'payroll', 'Access Payroll Module'),
(21, 20, 'View Payroll', 'payroll.view', 'View Payroll'),
(22, 20, 'Update Payroll', 'payroll.update', 'Update Payroll'),
(23, 20, 'Delete Payroll', 'payroll.delete', 'Delete Payroll'),
(24, 20, 'Create Payroll', 'payroll.create', 'Create Payroll'),
(25, 0, 'Expenses', 'expenses', 'Access Expenses Module'),
(26, 25, 'View Expenses', 'expenses.view', 'View Expenses'),
(27, 25, 'Create Expenses', 'expenses.create', 'Create Expenses'),
(28, 25, 'Update Expenses', 'expenses.update', 'Update Expenses'),
(29, 25, 'Delete Expenses', 'expenses.delete', 'Delete Expenses'),
(30, 0, 'Other Income', 'other_income', 'Access Other Income Module'),
(31, 30, 'View Other Income', 'other_income.view', 'View Other income'),
(32, 30, 'Create Other Income', 'other_income.create', 'Create other income'),
(33, 30, 'Update Other Income', 'other_income.update', 'Update Other Incom'),
(34, 30, 'Delete Other Income', 'other_income.delete', 'Delete other income'),
(35, 0, 'Collateral', 'collateral', 'Access Collateral Module'),
(36, 35, 'View collateral', 'collateral.view', 'View Collateral'),
(37, 35, 'Update Collateral', 'collateral.update', 'Update Collateral'),
(38, 35, 'Create Collateral', 'collateral.create', 'Create Collateral'),
(39, 35, 'Delete Collateral', 'collateral.delete', 'Delete Collateral'),
(40, 0, 'Reports', 'reports', 'Access Reports Module'),
(41, 0, 'Communication', 'communication', 'Access Communication Module'),
(42, 41, 'Create Communication', 'communication.create', 'Send Emails & SMS'),
(43, 41, 'Delete Communication', 'communication.delete', 'Delete Communication'),
(44, 0, 'Custom Fields', 'custom_fields', 'Access Custom Fields Module'),
(45, 44, 'View Custom Fields', 'custom_fields.view', 'View Custom fields'),
(46, 44, 'Create Custom Fields', 'custom_fields.create', 'Create Custom Fields'),
(47, 44, 'Custom Fields', 'custom_fields.update', 'Update Custom Fields'),
(48, 44, 'Delete Custom Fields', 'custom_fields.delete', 'Delete Custom Fields'),
(49, 0, 'Users', 'users', 'Access Users Module'),
(50, 49, 'View Users', 'users.view', 'View Users '),
(51, 49, 'Create Users', 'users.create', 'Create users'),
(52, 49, 'Update Users', 'users.update', 'Update Users'),
(53, 49, 'Delete Users', 'users.delete', 'Delete Users'),
(54, 49, 'Manage Roles', 'users.roles', 'Manage user roles'),
(55, 0, 'Settings', 'settings', 'Manage Settings'),
(56, 0, 'Audit Trail', 'audit_trail', 'Access Audit Trail'),
(57, 0, 'Savings', 'savings', 'Access Savings Menu'),
(58, 57, 'Create Savings', 'savings.create', ''),
(59, 57, 'Update Savings', 'savings.update', ''),
(60, 57, 'Delete Savings', 'savings.delete', ''),
(61, 57, 'Create Savings Transaction', 'savings.transactions.create', ''),
(62, 57, 'Update Savings Transaction', 'savings.transactions.update', ''),
(63, 57, 'Delete Savings Transaction', 'savings.transactions.delete', ''),
(64, 57, 'View Savings', 'savings.view', ''),
(65, 57, 'View Savings Transaction', 'savings.transactions.view', ''),
(66, 57, 'Manage Savings Products', 'savings.products', 'Manage Savings Products'),
(67, 57, 'Manage Savings Fees', 'savings.fees', ''),
(68, 6, 'Approve Loans', 'loans.approve', 'Approve Loans'),
(69, 6, 'Disburse Loans', 'loans.disburse', 'Disburse Loans'),
(70, 1, 'Approve Borrowers', 'borrowers.approve', 'Approve Borrowers'),
(71, 6, 'Withdraw Loans', 'loans.withdraw', 'Withdraw Loans'),
(72, 6, 'Write Off Loans', 'loans.writeoff', 'Write off Loans'),
(73, 6, 'Reschedule Loans', 'loans.reschedule', 'Reschedule Loans'),
(74, 0, 'Dashboard', 'dashboard', 'Access Dashboard'),
(75, 74, 'Loans Released Monthly Graph', 'dashboard.loans_released_monthly_graph', 'Access Loans Released Monthly Graph'),
(76, 74, 'Loans Collected Monthly Graph', 'dashboard.loans_collected_monthly_graph', 'Access Loans Collected Monthly Graph'),
(77, 74, 'Registered Borrowers', 'dashboard.registered_borrowers', 'Access Registered Borrowers Statistics'),
(78, 74, 'Total Loans Released', 'dashboard.total_loans_released', 'Access Total Loans Released'),
(79, 74, 'Total Collections', 'dashboard.total_collections', 'Access Total Collections Statistics'),
(80, 74, 'Total Disbursed Loans', 'dashboard.loans_disbursed', 'Access Total Disbursed Loans Statistics'),
(81, 74, 'Total Loans Pending', 'dashboard.loans_pending', ''),
(82, 74, 'Loans Approved', 'dashboard.loans_approved', ''),
(83, 74, 'Loans Declined', 'dashboard.loans_declined', ''),
(84, 74, 'Loans Closed', 'dashboard.loans_closed', ''),
(85, 74, 'Loans Withdrawn', 'dashboard.loans_withdrawn', ''),
(86, 74, 'Loans Written Off', 'dashboard.loans_written_off', ''),
(87, 74, 'Loans Rescheduled', 'dashboard.loans_rescheduled', ''),
(88, 6, 'Create Guarantor', 'loans.guarantor.create', ''),
(89, 6, 'Update Guarantor', 'loans.guarantor.update', ''),
(90, 6, 'Delete Guarantor', 'loans.guarantor.delete', ''),
(91, 6, 'Guarantor Savings', 'loans.guarantor.savings', ''),
(92, 0, 'Capital', 'capital', 'Access Capital'),
(93, 92, 'View  Capital', 'capital.view', ''),
(94, 92, 'Create Capital', 'capital.create', ''),
(95, 92, 'Update Capital', 'capital.update', ''),
(96, 92, 'Delete Capital', 'capital.delete', ''),
(97, 0, 'Assets', 'assets', 'Access Assets Menu'),
(98, 97, 'Create Assets', 'assets.create', ''),
(99, 97, 'View Assets', 'assets.view', ''),
(100, 97, 'Update Assets', 'assets.update', ''),
(101, 97, 'Delete Assets', 'assets.delete', ''),
(102, 1, 'Blacklist Borrower', 'borrowers.blacklist', 'Blacklist borrower'),
(103, 1, 'Manage Borrower Groups', 'borrowers.groups', ''),
(104, 6, 'Use Loan Calculator', 'loans.loan_calculator', ''),
(105, 0, 'Branches', 'branches', 'Access Branches menu'),
(106, 105, 'View Branches', 'branches.view', ''),
(107, 105, 'Create Branches', 'branches.create', ''),
(108, 105, 'Update Branches', 'branches.update', ''),
(109, 105, 'Delete Branches', 'branches.delete', ''),
(110, 105, 'Assign Users', 'branches.assign', '');

-- --------------------------------------------------------

--
-- Table structure for table `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, 'z030eM4GjpO3Odsh7gg5SAKLyXIvmiww', '2018-06-16 13:02:44', '2018-06-16 13:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `provision_rates`
--

CREATE TABLE `provision_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `rate` double(10,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provision_rates`
--

INSERT INTO `provision_rates` (`id`, `name`, `days`, `rate`, `notes`) VALUES
(1, 'Current', 0, 0.00, NULL),
(2, 'Especially Mentioned', 31, 5.00, NULL),
(3, 'Substandard', 61, 10.00, NULL),
(4, 'Doubtful', 91, 50.00, NULL),
(5, 'Loss', 181, 100.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{\"borrowers\":true,\"borrowers.view\":true,\"borrowers.update\":true,\"borrowers.delete\":true,\"borrowers.create\":true,\"borrowers.approve\":true,\"borrowers.blacklist\":true,\"borrowers.groups\":true,\"loans\":true,\"loans.create\":true,\"loans.update\":true,\"loans.delete\":true,\"loans.view\":true,\"loans.products\":true,\"loans.fees\":true,\"loans.schedule\":true,\"loans.approve\":true,\"loans.disburse\":true,\"loans.withdraw\":true,\"loans.writeoff\":true,\"loans.reschedule\":true,\"loans.guarantor.create\":true,\"loans.guarantor.update\":true,\"loans.guarantor.delete\":true,\"loans.guarantor.savings\":true,\"loans.loan_calculator\":true,\"repayments\":true,\"repayments.view\":true,\"repayments.create\":true,\"repayments.delete\":true,\"repayments.update\":true,\"payroll\":true,\"payroll.view\":true,\"payroll.update\":true,\"payroll.delete\":true,\"payroll.create\":true,\"expenses\":true,\"expenses.view\":true,\"expenses.create\":true,\"expenses.update\":true,\"expenses.delete\":true,\"other_income\":true,\"other_income.view\":true,\"other_income.create\":true,\"other_income.update\":true,\"other_income.delete\":true,\"collateral\":true,\"collateral.view\":true,\"collateral.update\":true,\"collateral.create\":true,\"collateral.delete\":true,\"reports\":true,\"communication\":true,\"communication.create\":true,\"communication.delete\":true,\"custom_fields\":true,\"custom_fields.view\":true,\"custom_fields.create\":true,\"custom_fields.update\":true,\"custom_fields.delete\":true,\"users\":true,\"users.view\":true,\"users.create\":true,\"users.update\":true,\"users.delete\":true,\"users.roles\":true,\"settings\":true,\"audit_trail\":true,\"savings\":true,\"savings.create\":true,\"savings.update\":true,\"savings.delete\":true,\"savings.transactions.create\":true,\"savings.transactions.update\":true,\"savings.transactions.delete\":true,\"savings.view\":true,\"savings.transactions.view\":true,\"savings.products\":true,\"savings.fees\":true,\"dashboard\":true,\"dashboard.loans_released_monthly_graph\":true,\"dashboard.loans_collected_monthly_graph\":true,\"dashboard.registered_borrowers\":true,\"dashboard.total_loans_released\":true,\"dashboard.total_collections\":true,\"dashboard.loans_disbursed\":true,\"dashboard.loans_pending\":true,\"dashboard.loans_approved\":true,\"dashboard.loans_declined\":true,\"dashboard.loans_closed\":true,\"dashboard.loans_withdrawn\":true,\"dashboard.loans_written_off\":true,\"dashboard.loans_rescheduled\":true,\"capital\":true,\"capital.view\":true,\"capital.create\":true,\"capital.update\":true,\"capital.delete\":true,\"assets\":true,\"assets.create\":true,\"assets.view\":true,\"assets.update\":true,\"assets.delete\":true,\"branches\":true,\"branches.view\":true,\"branches.create\":true,\"branches.update\":true,\"branches.delete\":true,\"branches.assign\":true}', NULL, '2017-10-13 12:47:14');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-08-07 08:51:00', '2017-08-07 08:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `savings_product_id` int(10) UNSIGNED DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `savings_fees`
--

CREATE TABLE `savings_fees` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `savings_products` text COLLATE utf8_unicode_ci,
  `amount` decimal(10,2) DEFAULT '0.00',
  `fees_posting` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fees_adding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_fee_type` enum('full','pro_rata') COLLATE utf8_unicode_ci DEFAULT 'full',
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `savings_products`
--

CREATE TABLE `savings_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_overdraw` tinyint(4) NOT NULL DEFAULT '0',
  `interest_rate` decimal(10,2) DEFAULT NULL,
  `minimum_balance` int(11) DEFAULT '0',
  `interest_posting` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interest_adding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `savings_transactions`
--

CREATE TABLE `savings_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `savings_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `type` enum('deposit','withdrawal','bank_fees','interest','dividend','guarantee','guarantee_restored') COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_interest` tinyint(4) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'allow_self_registration', '0'),
(2, 'allow_client_login', '1'),
(3, 'welcome_note', 'Welcome to our company. You can login with your username and password'),
(4, 'allow_client_apply', '0'),
(5, 'enable_online_payment', '0'),
(6, 'paynow_key', ''),
(7, 'paynow_id', ''),
(8, 'paypal_enabled', '0'),
(9, 'paynow_enabled', '0'),
(10, 'client_registration_required_fields', ''),
(11, 'client_auto_activate_account', '0'),
(12, 'client_request_guarantor', '0'),
(13, 'auto_post_savings_interest', '0'),
(14, 'company_name', 'Loan'),
(15, 'company_address', 'http://www.webstudio.co.zw'),
(16, 'company_currency', 'ZAR'),
(17, 'company_website', 'http://www.webstudio.co.zw'),
(18, 'company_country', 'ZA'),
(19, 'system_version', '1.3'),
(20, 'sms_enabled', '1'),
(21, 'active_sms', 'clickatell'),
(22, 'portal_address', 'http://www.'),
(23, 'company_email', 'info@webstudio.co.zw'),
(24, 'currency_symbol', '$'),
(25, 'currency_position', 'left'),
(26, 'company_logo', 'logo.jpg'),
(27, 'twilio_sid', ''),
(28, 'twilio_token', ''),
(29, 'twilio_phone_number', ''),
(30, 'routesms_host', ''),
(31, 'routesms_username', ''),
(32, 'routesms_password', ''),
(33, 'routesms_port', ''),
(34, 'sms_sender', ''),
(35, 'clickatell_username', ''),
(36, 'clickatell_password', ''),
(37, 'clickatell_api_id', ''),
(38, 'paypal_email', ''),
(39, 'currency', 'USD'),
(40, 'password_reset_subject', 'Password reset instructions'),
(41, 'password_reset_template', 'Password reset instructions'),
(42, 'payment_received_sms_template', 'Dear {borrowerFirstName}, we have received your payment of ${paymentAmount} for loan {loanNumber}. New loan balance:${loanBalance}. Thank you'),
(43, 'payment_received_email_template', '<p>Dear {borrowerFirstName}, we have received your payment of ${paymentAmount} for loan {loanNumber}. New loan balance:${loanBalance}. Thank you</p>'),
(44, 'payment_received_email_subject', 'Payment Received'),
(45, 'payment_email_subject', 'Payment Receipt'),
(46, 'payment_email_template', '<p>Dear {borrowerFirstName}, find attached receipt of your payment of ${paymentAmount} for loan {loanNumber} on {paymentDate}. New loan balance:${loanBalance}. Thank you</p>'),
(47, 'borrower_statement_email_subject', 'Client Statement'),
(48, 'borrower_statement_email_template', '<p>Dear {borrowerFirstName}, find attached statement of your loans with us. Thank you</p>'),
(49, 'loan_statement_email_subject', 'Loan Statement'),
(50, 'loan_statement_email_template', '<p>Dear {borrowerFirstName}, find attached loan statement for loan {loanNumber}. Thank you</p>'),
(51, 'loan_schedule_email_subject', 'Loan Schedule'),
(52, 'loan_schedule_email_template', '<p>Dear {borrowerFirstName}, find attached loan schedule for loan {loanNumber}. Thank you</p>'),
(53, 'cron_last_run', '2017-08-12 03:45:42'),
(54, 'auto_apply_penalty', '1'),
(55, 'auto_payment_receipt_sms', '0'),
(56, 'auto_payment_receipt_email', '1'),
(57, 'auto_repayment_sms_reminder', '0'),
(58, 'auto_repayment_email_reminder', '1'),
(59, 'auto_repayment_days', '4'),
(60, 'auto_overdue_repayment_sms_reminder', '0'),
(61, 'auto_overdue_repayment_email_reminder', '1'),
(62, 'auto_overdue_repayment_days', '2'),
(63, 'auto_overdue_loan_sms_reminder', '0'),
(64, 'auto_overdue_loan_email_reminder', '1'),
(65, 'auto_overdue_loan_days', '2'),
(66, 'loan_overdue_email_subject', 'Loan Overdue'),
(67, 'loan_overdue_email_template', '<p>Dear {borrowerFirstName}, Your loan {loanNumber} is overdue. Please make your payment. Thank you</p>'),
(68, 'loan_overdue_sms_template', 'Dear {borrowerFirstName}, Your loan {loanNumber} is overdue. Please make your payment. Thank you'),
(69, 'loan_payment_reminder_subject', 'Upcoming Payment Reminder'),
(70, 'loan_payment_reminder_email_template', '<p>Dear {borrowerFirstName},You have an upcoming payment of {paymentAmount} due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you</p>'),
(71, 'loan_payment_reminder_sms_template', 'Dear {borrowerFirstName},You have an upcoming payment of {paymentAmount} due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you'),
(72, 'missed_payment_email_subject', 'Missed Payment'),
(73, 'missed_payment_email_template', '<p>Dear {borrowerFirstName},You missed payment of {paymentAmount} which was due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you</p>'),
(74, 'missed_payment_sms_template', 'Dear {borrowerFirstName},You missed  payment of {paymentAmount} which was due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you'),
(75, 'enable_cron', '1'),
(76, 'infobip_username', ''),
(77, 'infobip_password', ''),
(78, 'update_url', 'http://webstudio.co.zw/ulm/update'),
(79, 'client_login_background', '');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `recipients` int(10) UNSIGNED NOT NULL,
  `send_to` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `gateway` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `throttle`
--

INSERT INTO `throttle` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES
(1, NULL, 'global', NULL, '2017-11-12 05:19:51', '2017-11-12 05:19:51'),
(2, NULL, 'ip', '::1', '2017-11-12 05:19:51', '2017-11-12 05:19:51'),
(3, NULL, 'global', NULL, '2018-02-10 15:55:33', '2018-02-10 15:55:33'),
(4, NULL, 'ip', '127.0.0.1', '2018-02-10 15:55:33', '2018-02-10 15:55:33'),
(5, 1, 'user', NULL, '2018-02-10 15:55:33', '2018-02-10 15:55:33'),
(6, NULL, 'global', NULL, '2018-02-10 15:55:41', '2018-02-10 15:55:41'),
(7, NULL, 'ip', '127.0.0.1', '2018-02-10 15:55:41', '2018-02-10 15:55:41'),
(8, 1, 'user', NULL, '2018-02-10 15:55:41', '2018-02-10 15:55:41'),
(9, NULL, 'global', NULL, '2018-02-10 15:55:47', '2018-02-10 15:55:47'),
(10, NULL, 'ip', '127.0.0.1', '2018-02-10 15:55:47', '2018-02-10 15:55:47'),
(11, 1, 'user', NULL, '2018-02-10 15:55:47', '2018-02-10 15:55:47'),
(12, NULL, 'global', NULL, '2018-04-18 12:56:55', '2018-04-18 12:56:55'),
(13, NULL, 'ip', '127.0.0.1', '2018-04-18 12:56:55', '2018-04-18 12:56:55'),
(14, 1, 'user', NULL, '2018-04-18 12:56:55', '2018-04-18 12:56:55'),
(15, NULL, 'global', NULL, '2018-04-18 12:57:20', '2018-04-18 12:57:20'),
(16, NULL, 'ip', '127.0.0.1', '2018-04-18 12:57:20', '2018-04-18 12:57:20'),
(17, 1, 'user', NULL, '2018-04-18 12:57:20', '2018-04-18 12:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `permissions`, `last_login`, `first_name`, `last_name`, `address`, `phone`, `city`, `gender`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'admin@webstudio.co.zw', '$2y$10$Opa9twkep14MtwfyB4yWDur/Prv/h3kYiKmcvEH1CeHgx0jDR1lfO', NULL, '2018-06-16 13:02:44', 'Admin', 'Admin', NULL, NULL, NULL, NULL, NULL, '2017-08-07 08:51:00', '2018-06-16 13:02:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_types`
--
ALTER TABLE `asset_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_valuations`
--
ALTER TABLE `asset_valuations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrower_groups`
--
ALTER TABLE `borrower_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrower_group_members`
--
ALTER TABLE `borrower_group_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch_users`
--
ALTER TABLE `branch_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `capital`
--
ALTER TABLE `capital`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collateral`
--
ALTER TABLE `collateral`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collateral_types`
--
ALTER TABLE `collateral_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields_meta`
--
ALTER TABLE `custom_fields_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_types`
--
ALTER TABLE `expense_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guarantor`
--
ALTER TABLE `guarantor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_applications`
--
ALTER TABLE `loan_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_comments`
--
ALTER TABLE `loan_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_disbursed_by`
--
ALTER TABLE `loan_disbursed_by`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_fees`
--
ALTER TABLE `loan_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_fees_meta`
--
ALTER TABLE `loan_fees_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_products`
--
ALTER TABLE `loan_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_repayments`
--
ALTER TABLE `loan_repayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_repayment_methods`
--
ALTER TABLE `loan_repayment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_status`
--
ALTER TABLE `loan_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_income`
--
ALTER TABLE `other_income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_income_types`
--
ALTER TABLE `other_income_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_meta`
--
ALTER TABLE `payroll_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_templates`
--
ALTER TABLE `payroll_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_template_meta`
--
ALTER TABLE `payroll_template_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`);

--
-- Indexes for table `provision_rates`
--
ALTER TABLE `provision_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Indexes for table `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savings_fees`
--
ALTER TABLE `savings_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savings_products`
--
ALTER TABLE `savings_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savings_transactions`
--
ALTER TABLE `savings_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_setting_key_unique` (`setting_key`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_types`
--
ALTER TABLE `asset_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_valuations`
--
ALTER TABLE `asset_valuations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `borrower_groups`
--
ALTER TABLE `borrower_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `borrower_group_members`
--
ALTER TABLE `borrower_group_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `branch_users`
--
ALTER TABLE `branch_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `capital`
--
ALTER TABLE `capital`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collateral`
--
ALTER TABLE `collateral`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collateral_types`
--
ALTER TABLE `collateral_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_meta`
--
ALTER TABLE `custom_fields_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_types`
--
ALTER TABLE `expense_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guarantor`
--
ALTER TABLE `guarantor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_applications`
--
ALTER TABLE `loan_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_comments`
--
ALTER TABLE `loan_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_disbursed_by`
--
ALTER TABLE `loan_disbursed_by`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loan_fees`
--
ALTER TABLE `loan_fees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_fees_meta`
--
ALTER TABLE `loan_fees_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_products`
--
ALTER TABLE `loan_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_repayments`
--
ALTER TABLE `loan_repayments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_repayment_methods`
--
ALTER TABLE `loan_repayment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_status`
--
ALTER TABLE `loan_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `other_income`
--
ALTER TABLE `other_income`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `other_income_types`
--
ALTER TABLE `other_income_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_meta`
--
ALTER TABLE `payroll_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_templates`
--
ALTER TABLE `payroll_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_template_meta`
--
ALTER TABLE `payroll_template_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `provision_rates`
--
ALTER TABLE `provision_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `savings`
--
ALTER TABLE `savings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `savings_fees`
--
ALTER TABLE `savings_fees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `savings_products`
--
ALTER TABLE `savings_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `savings_transactions`
--
ALTER TABLE `savings_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
