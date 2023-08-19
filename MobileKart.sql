-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Aug 19, 2023 at 12:15 PM
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
-- Database: `flipkart`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user sign up', 7, 'add_usersignup'),
(26, 'Can change user sign up', 7, 'change_usersignup'),
(27, 'Can delete user sign up', 7, 'delete_usersignup'),
(28, 'Can view user sign up', 7, 'view_usersignup'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add sub category', 9, 'add_subcategory'),
(34, 'Can change sub category', 9, 'change_subcategory'),
(35, 'Can delete sub category', 9, 'delete_subcategory'),
(36, 'Can view sub category', 9, 'view_subcategory'),
(37, 'Can add taxes', 10, 'add_taxes'),
(38, 'Can change taxes', 10, 'change_taxes'),
(39, 'Can delete taxes', 10, 'delete_taxes'),
(40, 'Can view taxes', 10, 'view_taxes'),
(41, 'Can add shipping', 11, 'add_shipping'),
(42, 'Can change shipping', 11, 'change_shipping'),
(43, 'Can delete shipping', 11, 'delete_shipping'),
(44, 'Can view shipping', 11, 'view_shipping'),
(45, 'Can add vendor signup', 12, 'add_vendorsignup'),
(46, 'Can change vendor signup', 12, 'change_vendorsignup'),
(47, 'Can delete vendor signup', 12, 'delete_vendorsignup'),
(48, 'Can view vendor signup', 12, 'view_vendorsignup'),
(49, 'Can add add product', 13, 'add_addproduct'),
(50, 'Can change add product', 13, 'change_addproduct'),
(51, 'Can delete add product', 13, 'delete_addproduct'),
(52, 'Can view add product', 13, 'view_addproduct'),
(53, 'Can add cart', 14, 'add_cart'),
(54, 'Can change cart', 14, 'change_cart'),
(55, 'Can delete cart', 14, 'delete_cart'),
(56, 'Can view cart', 14, 'view_cart'),
(57, 'Can add cart', 15, 'add_cart'),
(58, 'Can change cart', 15, 'change_cart'),
(59, 'Can delete cart', 15, 'delete_cart'),
(60, 'Can view cart', 15, 'view_cart'),
(61, 'Can add address', 16, 'add_address'),
(62, 'Can change address', 16, 'change_address'),
(63, 'Can delete address', 16, 'delete_address'),
(64, 'Can view address', 16, 'view_address'),
(65, 'Can add place order', 17, 'add_placeorder'),
(66, 'Can change place order', 17, 'change_placeorder'),
(67, 'Can delete place order', 17, 'delete_placeorder'),
(68, 'Can view place order', 17, 'view_placeorder');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$D2tdV7S47Pmyer1PYVRZK4$hw95K0zglPraUtqeXyrJmWbaxdQ5wCw3YA6ALDr9y5A=', NULL, 1, 'pranavsinha', '', '', 'pravav@gmail.com', 1, 1, '2023-07-10 14:37:44.374293');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(16, 'userApi', 'address'),
(15, 'userApi', 'cart'),
(17, 'userApi', 'placeorder'),
(7, 'userApi', 'usersignup'),
(13, 'vendor', 'addproduct'),
(14, 'vendor', 'cart'),
(8, 'vendor', 'category'),
(11, 'vendor', 'shipping'),
(9, 'vendor', 'subcategory'),
(10, 'vendor', 'taxes'),
(12, 'vendor', 'vendorsignup');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-02 12:58:33.332326'),
(2, 'auth', '0001_initial', '2023-07-02 12:58:33.870380'),
(3, 'admin', '0001_initial', '2023-07-02 12:58:33.997163'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-02 12:58:34.007741'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-02 12:58:34.018494'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-02 12:58:34.074377'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-02 12:58:34.122234'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-02 12:58:34.138343'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-02 12:58:34.148679'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-02 12:58:34.202723'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-02 12:58:34.207723'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-02 12:58:34.226293'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-02 12:58:34.251243'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-02 12:58:34.281709'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-02 12:58:34.310900'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-02 12:58:34.330631'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-02 12:58:34.358115'),
(18, 'sessions', '0001_initial', '2023-07-02 12:58:34.397187'),
(19, 'userApi', '0001_initial', '2023-07-02 12:58:54.660264'),
(20, 'vendor', '0001_initial', '2023-07-06 10:48:37.468175'),
(21, 'vendor', '0002_subcategory', '2023-07-06 13:29:32.012748'),
(22, 'vendor', '0003_taxes', '2023-07-06 14:45:03.579586'),
(23, 'vendor', '0004_shipping', '2023-07-06 15:18:11.497054'),
(24, 'vendor', '0005_vendorsignup_addproduct', '2023-07-07 10:47:21.126418'),
(25, 'vendor', '0006_rename_shipping_addproduct_shippingstatus_and_more', '2023-07-08 13:46:42.184610'),
(26, 'vendor', '0007_cart', '2023-07-11 11:06:55.794594'),
(27, 'userApi', '0002_cart', '2023-07-11 11:19:53.357306'),
(28, 'vendor', '0008_delete_cart', '2023-07-11 11:19:53.379749'),
(29, 'userApi', '0003_rename_venid_cart_userid', '2023-07-11 11:21:31.231171'),
(30, 'userApi', '0004_cart_qty', '2023-07-11 11:49:44.173379'),
(31, 'userApi', '0005_alter_cart_productid', '2023-07-14 07:22:10.699461'),
(32, 'userApi', '0006_alter_cart_productid', '2023-07-14 07:22:10.718856'),
(33, 'userApi', '0007_alter_cart_productid', '2023-07-14 07:22:10.724369'),
(34, 'userApi', '0008_alter_cart_productid', '2023-07-14 07:22:10.740747'),
(35, 'userApi', '0009_address', '2023-07-14 07:59:38.350718'),
(36, 'userApi', '0010_address_recivername', '2023-07-14 08:44:23.510776'),
(37, 'vendor', '0009_addproduct_setfeatured', '2023-07-15 10:02:18.328493'),
(38, 'userApi', '0011_placeorder', '2023-07-15 10:02:18.467530'),
(39, 'vendor', '0010_alter_addproduct_setfeatured', '2023-07-15 10:05:02.433970'),
(40, 'vendor', '0011_addproduct_recyclebin', '2023-07-17 11:41:51.490399'),
(41, 'vendor', '0012_remove_addproduct_recyclebin', '2023-07-17 12:01:30.151634'),
(42, 'vendor', '0013_addproduct_recyclebin', '2023-07-17 12:02:00.288936'),
(43, 'userApi', '0012_remove_placeorder_productid_remove_placeorder_qty', '2023-07-17 18:31:19.091339'),
(44, 'userApi', '0013_cart_orderplacedstatus', '2023-07-18 08:09:34.535390');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userapi_address`
--

CREATE TABLE `userapi_address` (
  `id` bigint(20) NOT NULL,
  `fullAddress` varchar(30) NOT NULL,
  `landmark` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `date` datetime(6) NOT NULL,
  `userId_id` bigint(20) NOT NULL,
  `reciverName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapi_address`
--

INSERT INTO `userapi_address` (`id`, `fullAddress`, `landmark`, `city`, `state`, `date`, `userId_id`, `reciverName`) VALUES
(1, 'manju sadan near mantu yadav h', 'near Vmart', 'Jamalpur', 'Bihar', '0000-00-00 00:00:00.000000', 60, 'Pranav Sinha'),
(2, 'shiv colony munger ', 'near HDFC', 'Munger', 'Bihar', '2023-07-14 13:37:32.000000', 62, 'Pooja Sinha');

-- --------------------------------------------------------

--
-- Table structure for table `userapi_cart`
--

CREATE TABLE `userapi_cart` (
  `id` bigint(20) NOT NULL,
  `productId_id` bigint(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `userId_id` bigint(20) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `orderPlacedStatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapi_cart`
--

INSERT INTO `userapi_cart` (`id`, `productId_id`, `date`, `userId_id`, `qty`, `orderPlacedStatus`) VALUES
(27, 15, '2023-07-16 23:21:29.808053', 69, 5, 0),
(29, 17, '2023-07-16 23:21:40.801382', 69, 1, 0),
(55, 31, '2023-07-17 23:32:24.567250', 60, 4, 1),
(56, 12, '2023-07-18 13:57:48.849196', 62, 2, 0),
(57, 20, '2023-07-18 13:57:56.967249', 62, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userapi_placeorder`
--

CREATE TABLE `userapi_placeorder` (
  `id` bigint(20) NOT NULL,
  `productsArray` varchar(100) NOT NULL,
  `cartAmount` int(11) NOT NULL,
  `paymentId` int(11) DEFAULT NULL,
  `paymentMode` varchar(30) NOT NULL,
  `trackingNo` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `addressId_id` bigint(20) NOT NULL,
  `userId_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapi_placeorder`
--

INSERT INTO `userapi_placeorder` (`id`, `productsArray`, `cartAmount`, `paymentId`, `paymentMode`, `trackingNo`, `status`, `date`, `addressId_id`, `userId_id`) VALUES
(1, '[{\'cartId\': 54, \'qty\': 2}, {\'cartId\': 55, \'qty\': 4}]', 119416, 0, 'COD', 1394, 0, '2023-07-18 00:02:07.125831', 2, 60),
(4, '[{\'cartId\': 56, \'qty\': 2}, {\'cartId\': 57, \'qty\': 6}]', 250835, 0, 'COD', 9425, 0, '2023-07-18 14:07:16.172505', 2, 62);

-- --------------------------------------------------------

--
-- Table structure for table `userapi_usersignup`
--

CREATE TABLE `userapi_usersignup` (
  `id` bigint(20) NOT NULL,
  `u_fname` varchar(30) NOT NULL,
  `u_lname` varchar(30) NOT NULL,
  `u_email` varchar(50) NOT NULL,
  `u_password` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapi_usersignup`
--

INSERT INTO `userapi_usersignup` (`id`, `u_fname`, `u_lname`, `u_email`, `u_password`) VALUES
(60, 'Pranav ', 'Sinha', 'user@gmail.com', 'user'),
(61, 'ajay pratap', 'singh', 'ajay@gmail.com', 'ajay'),
(62, 'sdaf', 'dsaf', 'ravi@gmail.com', 'ravi'),
(65, 'ajay', 'singh', 'dsafsadfasdf@gmail.com', 'sdafasdfadsf'),
(67, 'ajay', 'singh', 'dsafsafasdf@gmail.com', 'adsfasdfas'),
(68, 'ajay', 'singh', 'sina@gmail.com', 'jhhjkjhhjk'),
(69, 'ajay', 'singh', 'saicomputer@gmail.com', 'sai'),
(70, 'ajay', 'singh', 'singhajaypratap606@gmail.com', 'sdfasda'),
(74, 'ajay', 'singh', 'sa764uter@gmail.com', 'dsfasd'),
(75, 'fakefirstname', 'fakelname', 'fakeemail@gmail.com', 'fakepassword');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_addproduct`
--

CREATE TABLE `vendor_addproduct` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `mrp` int(11) NOT NULL,
  `discountPercent` int(11) NOT NULL,
  `productType` varchar(200) NOT NULL,
  `Category` varchar(200) NOT NULL,
  `subCategory` varchar(200) NOT NULL,
  `taxStatus` varchar(200) NOT NULL,
  `shippingStatus` varchar(200) DEFAULT NULL,
  `totalUnits` int(11) NOT NULL,
  `stockStatus` varchar(200) NOT NULL,
  `trackQty` varchar(200) NOT NULL,
  `productDescription` longtext DEFAULT NULL,
  `image1` varchar(1000) DEFAULT NULL,
  `image2` varchar(1000) DEFAULT NULL,
  `image3` varchar(1000) DEFAULT NULL,
  `image4` varchar(1000) DEFAULT NULL,
  `image5` varchar(1000) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `venId_id` bigint(20) NOT NULL,
  `shippingAmount` int(11) DEFAULT NULL,
  `taxClass` varchar(200) DEFAULT NULL,
  `setFeatured` tinyint(1) NOT NULL,
  `recycleBin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_addproduct`
--

INSERT INTO `vendor_addproduct` (`id`, `name`, `mrp`, `discountPercent`, `productType`, `Category`, `subCategory`, `taxStatus`, `shippingStatus`, `totalUnits`, `stockStatus`, `trackQty`, `productDescription`, `image1`, `image2`, `image3`, `image4`, `image5`, `date`, `venId_id`, `shippingAmount`, `taxClass`, `setFeatured`, `recycleBin`) VALUES
(11, 'vivo X90 Pro (Legendary Black, 256 GB)  (12 GB RAM)', 84999, 7, 'simpleProduct', 'Mobiles', 'Vivo', 'taxable', 'flatShipping', 99, 'In-Stock', 'Yes-Track-it', '\r\nWith the superb Vivo T2x 5G, you can take advantage of great pictures and a flawless user experience. With the Vivo T2x 5G, you can experience exceptional performance owing to its 7 nm 5G CPU, the octa-core Dimensity 6020, with a top clock speed of 2.2 GHz. Additionally, the 50 MP main camera on this smartphone beautifully catches every detail you see. Additionally, Super Night Selfie employs noise cancellation technology in conjunction with an Aura Screen Light to produce a calming light that is effective in low light. The pioneering Extended RAM 3.0 technology also uses ROM to expand RAM with a maximum capacity of 8 GB. This enables smooth app switching and allows up to 27 active applications to run in the background.', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/1/m/r/x90-pro-v2219-vivo-original-imagzzrqg2zbjfas.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/p/x/i/x90-pro-v2219-vivo-original-imagzzrqchcgjgmp.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/5/o/f/-original-imagrewet8nvz6yn.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/f/v/h/-original-imagzjhwkubmddyf.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/b/8/x90-pro-v2219-vivo-original-imagzzrqh8xmjwhs.jpeg?q=70', '2023-07-08 19:27:08.418700', 2, 249, '12 % Mobile phones', 0, 1),
(12, 'vivo X90 (Breeze Blue, 256 GB)  (12 GB RAM)', 63999, 23, 'simpleProduct', 'Mobiles', 'Vivo', 'taxable', 'flatShipping', 99, 'In-Stock', 'Yes-Track-it', '\r\nWith the superb Vivo T2x 5G, you can take advantage of great pictures and a flawless user experience. With the Vivo T2x 5G, you can experience exceptional performance owing to its 7 nm 5G CPU, the octa-core Dimensity 6020, with a top clock speed of 2.2 GHz. Additionally, the 50 MP main camera on this smartphone beautifully catches every detail you see. Additionally, Super Night Selfie employs noise cancellation technology in conjunction with an Aura Screen Light to produce a calming light that is effective in low light. The pioneering Extended RAM 3.0 technology also uses ROM to expand RAM with a maximum capacity of 8 GB. This enables smooth app switching and allows up to 27 active applications to run in the background.', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/b/e/a/x90-v2218-vivo-original-imagzzrqmx6cpcps.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/q/a/u/x90-v2218-vivo-original-imagzzrq2rffw7z6.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/5/o/f/-original-imagrewet8nvz6yn.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/n/z/d/x90-v2218-vivo-original-imagzzrqenhspqgh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/v/x/p/x90-v2218-vivo-original-imagzzrqpxhhfpxh.jpeg?q=70', '2023-07-08 19:27:08.418700', 1, 249, '12 % Mobile phones', 1, 0),
(13, 'vivo X80 (Urban Blue, 128 GB)  (8 GB RAM)', 54999, 9, 'simpleProduct', 'Mobiles', 'Vivo', 'taxable', 'flatShipping', 99, 'In-Stock', 'Yes-Track-it', '\r\nExplore incredibility and enjoy a flawless performance with the impressive Vivo X80 smartphone that comes with a natural ability to blow your mind away. You can flawlessly capture the beauty in anything you find with an incredible camera equipped with the X80 which works in tandem with ZEISS allowing you to capture movie-like visuals wherever you are. Furthermore, powered by 4 nm MediaTek Dimensity 9000 and Vivo V1+ Chip, this smartphone enables you to appreciate its smooth operation and allows you to enjoy a top-notch user experience. Additionally, the Vivo X80 boasts a 4500 mAh monstrous battery with 80 W Flash Charge support. This way, you can continue whatever you are doing without worrying about the battery dying, boosting your performance and elevating your productivity.', 'https://rukminim2.flixcart.com/image/832/832/l3929ow0/mobile/k/g/q/-original-imageewzvy6d9cgb.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/l3929ow0/mobile/y/3/s/-original-imageewzcpwhfyc8.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/l3929ow0/mobile/u/m/l/-original-imageewzggwkyfhg.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/l3929ow0/mobile/x/u/k/-original-imageewzvmgz42dn.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/l3929ow0/mobile/e/p/k/-original-imageewz8bgxefhk.jpeg?q=70', '2023-07-08 19:27:08.418700', 1, 249, '12 % Mobile phones', 1, 1),
(14, 'SAMSUNG Galaxy F13 (Sunrise Copper, 64 GB)  (4 GB RAM)', 9499, 12, 'simpleProduct', 'Mobiles', 'Samsung', 'taxable', 'FreeShipping', 87, 'In-Stock', 'Yes-Track-it', '\nEnjoy seamless connectivity and an uninterrupted movie marathon with the impressive Samsung Galaxy F13 that is designed specifically to impress the entertainment fanatics. This smartphone features a terrific 16.62 cm (6.6) FHD+ LCD Display that can effortlessly blow your mind with its incredible performance. Furthermore, this phone boasts a 50 MP Triple Camera setup that allows you to capture awesomeness with a gentle tap. Moreover, the Samsung Galaxy F13 sports up to 8 GB of RAM and features an innovative RAM plus technology that taps into the phone’s internal storage to elevate its performance.', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/5/m/f/-original-imagfhu6nsnwvxkm.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/a/8/n/-original-imagfhu6wgm6byyq.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/j/v/m/-original-imagfhu6mxpwxda4.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/9/4/o/-original-imagfz7yvktcmbrf.jpeg?q=70', '2023-07-15 17:19:27.340686', 1, 0, '18 % GST', 1, 0),
(15, 'SAMSUNG Galaxy A23 5G (Light Blue, 128 GB)  (6 GB RAM)', 21999, 4, 'simpleProduct', 'Mobiles', 'Samsung', 'taxable', 'FreeShipping', 87, 'In-Stock', 'Yes-Track-it', 'Enjoy seamless connectivity and an uninterrupted movie marathon with the impressive Samsung Galaxy F13 that is designed specifically to impress the entertainment fanatics. This smartphone features a terrific 16.62 cm (6.6) FHD+ LCD Display that can effortlessly blow your mind with its incredible performance. Furthermore, this phone boasts a 50 MP Triple Camera setup that allows you to capture awesomeness with a gentle tap. Moreover, the Samsung Galaxy F13 sports up to 8 GB of RAM and features an innovative RAM plus technology that taps into the phone’s internal storage to elevate its performance.', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/e/d/r/-original-imagmym54wrhzgpn.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/s/q/u/-original-imagmym5qrzss4wz.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/b/a/2/-original-imagmym5myfw4dpu.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/9/4/3/-original-imagm2j9xg85bgab.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/o/5/v/-original-imagmffazpjwfnfk.jpeg?q=70', '2023-07-15 17:19:27.340686', 2, 0, '18 % GST', 1, 0),
(17, 'SAMSUNG Galaxy Z Fold3 5G (Phantom Black, 256 GB)  (12 GB RAM)', 171999, 21, 'simpleProduct', 'Mobiles', 'Samsung', 'taxable', 'FreeShipping', 87, 'In-Stock', 'Yes-Track-it', 'Enjoy seamless connectivity and an uninterrupted movie marathon with the impressive Samsung Galaxy F13 that is designed specifically to impress the entertainment fanatics. This smartphone features a terrific 16.62 cm (6.6) FHD+ LCD Display that can effortlessly blow your mind with its incredible performance. Furthermore, this phone boasts a 50 MP Triple Camera setup that allows you to capture awesomeness with a gentle tap. Moreover, the Samsung Galaxy F13 sports up to 8 GB of RAM and features an innovative RAM plus technology that taps into the phone’s internal storage to elevate its performance.', 'https://rukminim2.flixcart.com/image/832/832/ksnjp8w0/mobile/b/t/k/galaxy-z-fold3-5g-sm-f926bzkdinu-samsung-original-imag662a7zgxn2fv.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/ksnjp8w0/mobile/w/r/u/galaxy-z-fold3-5g-sm-f926bzkdinu-samsung-original-imag662a3mceyv4h.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/ksnjp8w0/mobile/g/u/r/galaxy-z-fold3-5g-sm-f926bzkdinu-samsung-original-imag662aygmrg2qg.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/ksnjp8w0/mobile/u/6/m/galaxy-z-fold3-5g-sm-f926bzkdinu-samsung-original-imag662azwhyh9bc.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/ksnjp8w0/mobile/a/o/t/galaxy-z-fold3-5g-sm-f926bzkdinu-samsung-original-imag662atayzhapc.jpeg?q=70', '2023-07-15 17:19:27.340686', 2, 0, '18 % GST', 1, 1),
(19, 'DVJ Multiport Mobile Charger  (Black)', 2499, 10, 'simpleProduct', 'Mobile Accessories', 'Charger', 'non_taxable', 'FreeShipping', 28, 'In-Stock', 'Yes-Track-it', '\nCharging cable is not included.**Power outputs for a single versus multiple devices vary as follows: Up to 65W when charging a single device under PD 3.0 and SFC(Super Fast Charging) 2.0 conditions with USB-C. Up to 25W when charging a single device under PD 3.0 and SFC(Super Fast Charging) conditions with USB-C. Up to 15W a single device under AFC(Adaptive Fast Charging) conditions with USB-A. This adapter can charge up to 3 devices simultaneously with 65W maximum total output power as with 35W, 25W, and 5W respectively. Actual charging speed may vary depending on the number of devices.***Super Fast Charging (SFC) is Samsung\'s fast charging method supported for Galaxy Notes (Note10 and higher), Galaxy S Series (S10 5G and higher), and other SFC capable devices such as iPhones (iPhone8 or higher), Adapative Fast Charging (AFC) is fast charing portocol for Samsung devices.****SFC 2.0(45W) is available on Galaxy S20 Ultra, Note10+ and higher. Other devices may be added in the future. *****USB PD 3.0(Power Delivery) is USB IF standard to charge quickly over USB-C. It is recommended to use USB standard cable.******PD 65W & SFC 45W requires 5A cable.\nSpecifications', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/3/i/8/65w-pd-triple-port-adapter-for-samsung-s22-s22-ultra-s23-ultra-s-original-imagn7v3r3gpkwgc.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/t/y/6/samsung-25-watt-type-c-to-c-charger-adapter-super-fast-roarx-original-imagpex7kg6hmuht.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/f/c/v/samsung-25-watt-type-c-to-c-charger-adapter-super-fast-roarx-original-imagpex7szbgqemf.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/c/r/r/samsung-25-watt-type-c-to-c-charger-adapter-super-fast-roarx-original-imagpex74srmnvxg.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/l/r/r/samsung-25-watt-type-c-to-c-charger-adapter-super-fast-roarx-original-imagpex7czmrvyhp.jpeg?q=70', '2023-07-15 23:11:30.767481', 1, 0, '', 1, 0),
(20, 'Bose QuietComfort Earbuds II with Active Noise Cancellation (ANC) Bluetooth Headset  (Black, True Wireless)', 21999, 5, 'simpleProduct', 'Earphones', 'Ear buds', 'non_taxable', 'FreeShipping', 45, 'In-Stock', 'Yes-Track-it', '\nBose QuietComfort Earbuds II are a sleek, versatile musical companion designed to fit you and everything you do. Engineered with pioneering CustomTune sound calibration technology, these wireless earbuds personalize the noise cancellation and sound performance to fit your ears, so you get the world�s best noise cancellation and deep, immersive sound with powerful bass whether you�re at home or on the go. To ensure all-day comfort and a secure fit, the earbuds come with the Bose Fit Kit that includes 3 different soft, silicone ear tips and 3 different stability bands to mix and match to find your best fit. With a compact, lightweight design, you will almost forget you�re wearing them. Easily control your music or adjust your preferred level of noise cancellation with the earbud�s simple touch controls. Phone calls sound crystal clear.', 'https://rukminim2.flixcart.com/image/832/832/xif0q/headphone/j/n/n/quietcomfort-earbuds-ii-bose-original-imaghgjqh6bryxe2.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/headphone/n/h/q/quietcomfort-earbuds-ii-bose-original-imaghgjqbup4zdzz.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/headphone/i/r/m/quietcomfort-earbuds-ii-bose-original-imaghgjqnypggh4w.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/headphone/4/g/w/quietcomfort-earbuds-ii-bose-original-imaghgjq9cbec8je.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/headphone/q/6/v/quietcomfort-earbuds-ii-bose-original-imaghgjqghqsbnry.jpeg?q=70', '2023-07-15 23:14:51.698835', 1, 0, '', 1, 0),
(21, 'APPLE iPhone 13 (Midnight, 128 GB) COPIED ', 57999, 17, 'simpleProduct', 'Mobiles', 'Apple', 'non_taxable', 'locationWise', 49, 'In-Stock', 'Yes-Track-it', 'General\r\nIn The Box\r\niPhone, USB-C to Lightning Cable, Documentation\r\nModel Number\r\nMHDC3HN/A\r\nModel Name\r\niPhone 11\r\nColor\r\nWhite\r\nBrowse Type\r\nSmartphones\r\nSIM Type\r\nDual Sim\r\nHybrid Sim Slot\r\nNo\r\nTouchscreen\r\nYes\r\nOTG Compatible\r\nNo\r\nAdditional Content\r\nWithout AirPods and Charger\r\nSAR Value\r\n1.6 W/kg (over 1 g) SAR Limit, Head: 1.09, Body: 1.18', 'https://rukminim2.flixcart.com/image/832/832/ktketu80/mobile/s/l/c/iphone-13-mlpf3hn-a-apple-original-imag6vzz5qvejz8z.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/ktketu80/mobile/f/o/s/iphone-13-mlpf3hn-a-apple-original-imag6vzzemfy9nse.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', '2023-07-17 19:08:21.751713', 1, 0, '', 0, 0),
(22, 'Bose QuietComfort Earbuds II with Active Noss) ', 21999, 5, 'simpleProduct', 'Earphones', 'Ear buds', 'non_taxable', 'FreeShipping', 45, 'In-Stock', 'Yes-Track-it', '\nBose QuietComfort Earbuds II are a sleek, versatile musical companion designed to fit you and everything you do. Engineered with pioneering CustomTune sound calibration technology, these wireless earbuds personalize the noise cancellation and sound performance to fit your ears, so you get the world�s best noise cancellation and deep, immersive sound with powerful bass whether you�re at home or on the go. To ensure all-day comfort and a secure fit, the earbuds come with the Bose Fit Kit that includes 3 different soft, silicone ear tips and 3 different stability bands to mix and match to find your best fit. With a compact, lightweight design, you will almost forget you�re wearing them. Easily control your music or adjust your preferred level of noise cancellation with the earbud�s simple touch controls. Phone calls sound crystal clear.', 'https://rukminim2.flixcart.com/image/832/832/xif0q/headphone/j/n/n/quietcomfort-earbuds-ii-bose-original-imaghgjqh6bryxe2.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/headphone/n/h/q/quietcomfort-earbuds-ii-bose-original-imaghgjqbup4zdzz.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/headphone/i/r/m/quietcomfort-earbuds-ii-bose-original-imaghgjqnypggh4w.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/headphone/4/g/w/quietcomfort-earbuds-ii-bose-original-imaghgjq9cbec8je.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/headphone/q/6/v/quietcomfort-earbuds-ii-bose-original-imaghgjqghqsbnry.jpeg?q=70', '2023-07-17 19:10:14.198952', 1, 0, '', 0, 0),
(24, 'APPLE iphone 6 pro', 78, 8, 'simpleProduct', 'Mobiles', 'Apple', 'non_taxable', 'locationWise', 49, 'In-Stock', 'Yes-Track-it', 'General\r\nIn The Box\r\niPhone, USB-C to Lightning Cable, Documentation\r\nModel Number\r\nMHDC3HN/A\r\nModel Name\r\niPhone 11\r\nColor\r\nWhite\r\nBrowse Type\r\nSmartphones\r\nSIM Type\r\nDual Sim\r\nHybrid Sim Slot\r\nNo\r\nTouchscreen\r\nYes\r\nOTG Compatible\r\nNo\r\nAdditional Content\r\nWithout AirPods and Charger\r\nSAR Value\r\n1.6 W/kg (over 1 g) SAR Limit, Head: 1.09, Body: 1.18', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1280px-Image_created_with_a_mobile_phone.png', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/q/i/-original-imaghxejh67memqn.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/z/m/l/-original-imaghxejxzzzkqr7.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/7/k/9/-original-imaghycfznsrx3ad.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', '2023-08-13 15:31:24.445249', 1, 0, '', 0, 1),
(31, 'SAMSUNG Galaxy A23 5G (Light Blue, 128888888888888RAM) COPIED ', 21999, 4, 'simpleProduct', 'Mobiles', 'Samsung', 'taxable', 'FreeShipping', 87, 'In-Stock', 'Yes-Track-it', 'Enjoy seamless connectivity and an uninterrupted movie marathon with the impressive Samsung Galaxy F13 that is designed specifically to impress the entertainment fanatics. This smartphone features a terrific 16.62 cm (6.6) FHD+ LCD Display that can effortlessly blow your mind with its incredible performance. Furthermore, this phone boasts a 50 MP Triple Camera setup that allows you to capture awesomeness with a gentle tap. Moreover, the Samsung Galaxy F13 sports up to 8 GB of RAM and features an innovative RAM plus technology that taps into the phone’s internal storage to elevate its performance.', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/e/d/r/-original-imagmym54wrhzgpn.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/s/q/u/-original-imagmym5qrzss4wz.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/b/a/2/-original-imagmym5myfw4dpu.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/9/4/3/-original-imagm2j9xg85bgab.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/o/5/v/-original-imagmffazpjwfnfk.jpeg?q=70', '2023-07-17 20:52:09.398868', 2, 0, '18 % GST', 1, 0),
(32, 'APPLE iPhone 14 (Blue, 128 GB)', 897, 1, 'variableProduct', 'Mobile Accessories', 'Charger', 'non_taxable', 'FreeShipping', 99, 'In-Stock', 'Yes-Track-it', 'dffdsadf', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/b/f/m/-original-imagna3ezkdusyrz.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kgiaykw0/mobile/3/x/e/apple-iphone-11-mhdc3hn-a-original-imafwqep7dypzxjf.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/n/b/z/-original-imaghxcpwuhbghgh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/i/e/k/-original-imagnshshh2gzgtn.jpeg?q=70', '2023-07-17 21:02:49.124051', 2, 0, '', 0, 1),
(33, 'SAMSUNG Galaxy  979', 9499, 12, 'simpleProduct', 'Mobiles', 'Samsung', 'taxable', 'FreeShipping', 87, 'In-Stock', 'Yes-Track-it', '\nEnjoy seamless connectivity and an uninterrupted movie marathon with the impressive Samsung Galaxy F13 that is designed specifically to impress the entertainment fanatics. This smartphone features a terrific 16.62 cm (6.6) FHD+ LCD Display that can effortlessly blow your mind with its incredible performance. Furthermore, this phone boasts a 50 MP Triple Camera setup that allows you to capture awesomeness with a gentle tap. Moreover, the Samsung Galaxy F13 sports up to 8 GB of RAM and features an innovative RAM plus technology that taps into the phone’s internal storage to elevate its performance.', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/5/m/f/-original-imagfhu6nsnwvxkm.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/a/8/n/-original-imagfhu6wgm6byyq.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/j/v/m/-original-imagfhu6mxpwxda4.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/9/4/o/-original-imagfz7yvktcmbrf.jpeg?q=70', '2023-08-13 15:34:11.128488', 1, 0, '18 % GST', 1, 0),
(34, 'SAMSUNG A91 ', 9499, 12, 'simpleProduct', 'Mobiles', 'Samsung', 'taxable', 'FreeShipping', 87, 'In-Stock', 'Yes-Track-it', '\nEnjoy seamless connectivity and an uninterrupted movie marathon with the impressive Samsung Galaxy F13 that is designed specifically to impress the entertainment fanatics. This smartphone features a terrific 16.62 cm (6.6) FHD+ LCD Display that can effortlessly blow your mind with its incredible performance. Furthermore, this phone boasts a 50 MP Triple Camera setup that allows you to capture awesomeness with a gentle tap. Moreover, the Samsung Galaxy F13 sports up to 8 GB of RAM and features an innovative RAM plus technology that taps into the phone’s internal storage to elevate its performance.', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/5/m/f/-original-imagfhu6nsnwvxkm.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/a/8/n/-original-imagfhu6wgm6byyq.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/j/v/m/-original-imagfhu6mxpwxda4.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/9/4/o/-original-imagfz7yvktcmbrf.jpeg?q=70', '2023-08-13 15:35:16.079125', 1, 0, '18 % GST', 1, 0),
(35, 'SAMSUNG A91  COPIED ', 9499, 12, 'simpleProduct', 'Mobiles', 'Samsung', 'taxable', 'FreeShipping', 87, 'In-Stock', 'Yes-Track-it', '\nEnjoy seamless connectivity and an uninterrupted movie marathon with the impressive Samsung Galaxy F13 that is designed specifically to impress the entertainment fanatics. This smartphone features a terrific 16.62 cm (6.6) FHD+ LCD Display that can effortlessly blow your mind with its incredible performance. Furthermore, this phone boasts a 50 MP Triple Camera setup that allows you to capture awesomeness with a gentle tap. Moreover, the Samsung Galaxy F13 sports up to 8 GB of RAM and features an innovative RAM plus technology that taps into the phone’s internal storage to elevate its performance.', 'https://m.media-amazon.com/images/I/71J8tz0UeJL._AC_UF894,1000_QL80_.jpg', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/5/m/f/-original-imagfhu6nsnwvxkm.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/a/8/n/-original-imagfhu6wgm6byyq.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/7/k/9/-original-imaghycfznsrx3ad.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/9/4/o/-original-imagfz7yvktcmbrf.jpeg?q=70', '2023-08-13 16:23:48.717800', 1, 0, '18 % GST', 1, 0),
(36, 'DVJ Multiport Mobile Charger  (Black) COPIED ', 2499, 10, 'simpleProduct', 'Mobile Accessories', 'Charger', 'non_taxable', 'FreeShipping', 28, 'In-Stock', 'Yes-Track-it', '\nCharging cable is not included.**Power outputs for a single versus multiple devices vary as follows: Up to 65W when charging a single device under PD 3.0 and SFC(Super Fast Charging) 2.0 conditions with USB-C. Up to 25W when charging a single device under PD 3.0 and SFC(Super Fast Charging) conditions with USB-C. Up to 15W a single device under AFC(Adaptive Fast Charging) conditions with USB-A. This adapter can charge up to 3 devices simultaneously with 65W maximum total output power as with 35W, 25W, and 5W respectively. Actual charging speed may vary depending on the number of devices.***Super Fast Charging (SFC) is Samsung\'s fast charging method supported for Galaxy Notes (Note10 and higher), Galaxy S Series (S10 5G and higher), and other SFC capable devices such as iPhones (iPhone8 or higher), Adapative Fast Charging (AFC) is fast charing portocol for Samsung devices.****SFC 2.0(45W) is available on Galaxy S20 Ultra, Note10+ and higher. Other devices may be added in the future. *****USB PD 3.0(Power Delivery) is USB IF standard to charge quickly over USB-C. It is recommended to use USB standard cable.******PD 65W & SFC 45W requires 5A cable.\nSpecifications', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/3/i/8/65w-pd-triple-port-adapter-for-samsung-s22-s22-ultra-s23-ultra-s-original-imagn7v3r3gpkwgc.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/t/y/6/samsung-25-watt-type-c-to-c-charger-adapter-super-fast-roarx-original-imagpex7kg6hmuht.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/f/c/v/samsung-25-watt-type-c-to-c-charger-adapter-super-fast-roarx-original-imagpex7szbgqemf.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/c/r/r/samsung-25-watt-type-c-to-c-charger-adapter-super-fast-roarx-original-imagpex74srmnvxg.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/l/r/r/samsung-25-watt-type-c-to-c-charger-adapter-super-fast-roarx-original-imagpex7czmrvyhp.jpeg?q=70', '2023-08-19 14:36:37.971740', 1, 0, '', 0, 0),
(37, 'DVJ Multiport Mobile Charger  (Black) COPIED  COPIED ', 2499, 10, 'simpleProduct', 'Mobile Accessories', 'Charger', 'non_taxable', 'FreeShipping', 28, 'In-Stock', 'Yes-Track-it', '\nCharging cable is not included.**Power outputs for a single versus multiple devices vary as follows: Up to 65W when charging a single device under PD 3.0 and SFC(Super Fast Charging) 2.0 conditions with USB-C. Up to 25W when charging a single device under PD 3.0 and SFC(Super Fast Charging) conditions with USB-C. Up to 15W a single device under AFC(Adaptive Fast Charging) conditions with USB-A. This adapter can charge up to 3 devices simultaneously with 65W maximum total output power as with 35W, 25W, and 5W respectively. Actual charging speed may vary depending on the number of devices.***Super Fast Charging (SFC) is Samsung\'s fast charging method supported for Galaxy Notes (Note10 and higher), Galaxy S Series (S10 5G and higher), and other SFC capable devices such as iPhones (iPhone8 or higher), Adapative Fast Charging (AFC) is fast charing portocol for Samsung devices.****SFC 2.0(45W) is available on Galaxy S20 Ultra, Note10+ and higher. Other devices may be added in the future. *****USB PD 3.0(Power Delivery) is USB IF standard to charge quickly over USB-C. It is recommended to use USB standard cable.******PD 65W & SFC 45W requires 5A cable.\nSpecifications', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/3/i/8/65w-pd-triple-port-adapter-for-samsung-s22-s22-ultra-s23-ultra-s-original-imagn7v3r3gpkwgc.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/t/y/6/samsung-25-watt-type-c-to-c-charger-adapter-super-fast-roarx-original-imagpex7kg6hmuht.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/f/c/v/samsung-25-watt-type-c-to-c-charger-adapter-super-fast-roarx-original-imagpex7szbgqemf.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/c/r/r/samsung-25-watt-type-c-to-c-charger-adapter-super-fast-roarx-original-imagpex74srmnvxg.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/battery-charger/l/r/r/samsung-25-watt-type-c-to-c-charger-adapter-super-fast-roarx-original-imagpex7czmrvyhp.jpeg?q=70', '2023-08-19 14:36:58.992322', 1, 0, '', 0, 0),
(38, 'APPLE iPdsafsdafdsaf', 32423, 23, 'simpleProduct', 'Mobiles', 'Apple', 'non_taxable', 'FreeShipping', 43, 'In-Stock', 'Yes-Track-it', 'Apple Inc. is an American multinational technology company headquartered in Cupertino, California. Apple is the world\'s largest technology company by revenue, with US$394.3 billion in 2022 revenue. As of March 2023, Apple is the world\'s biggest company by market capitalization. Wikipedia', 'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/3/5/l/-original-imaghx9qmgqsk9s4.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/m/c/m/-original-imagnshsvxjnxgrh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/u/d/l/-original-imagq4y2gyv5s5gy.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/i/e/k/-original-imagnshshh2gzgtn.jpeg?q=70', '2023-08-19 15:01:44.361656', 1, 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_category`
--

CREATE TABLE `vendor_category` (
  `id` bigint(20) NOT NULL,
  `cat_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_category`
--

INSERT INTO `vendor_category` (`id`, `cat_name`) VALUES
(1, 'Mobiles'),
(2, 'Mobile Accessories'),
(3, 'Earphones'),
(11, 'Electronics');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_shipping`
--

CREATE TABLE `vendor_shipping` (
  `id` bigint(20) NOT NULL,
  `shipping_state_name` varchar(200) DEFAULT NULL,
  `shipping_value` int(11) NOT NULL,
  `date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_shipping`
--

INSERT INTO `vendor_shipping` (`id`, `shipping_state_name`, `shipping_value`, `date`) VALUES
(1, 'Jammu Kashmir', 500, '2023-07-06 20:55:16.747248'),
(2, 'Rajasthan', 249, '2023-07-06 20:55:59.168528'),
(3, 'Bihar', 149, '2023-07-06 20:57:45.565925'),
(4, 'Tamil Nadu', 449, '2023-07-06 20:58:38.022098'),
(5, 'Flat', 149, '2023-07-06 20:59:08.144176'),
(6, 'west bengal', 149, '2023-07-09 13:25:51.903394');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_subcategory`
--

CREATE TABLE `vendor_subcategory` (
  `id` bigint(20) NOT NULL,
  `cat_name` varchar(200) DEFAULT NULL,
  `sub_cat_name` varchar(200) NOT NULL,
  `catId_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_subcategory`
--

INSERT INTO `vendor_subcategory` (`id`, `cat_name`, `sub_cat_name`, `catId_id`) VALUES
(1, 'Mobiles', 'Nokia', 1),
(2, 'Mobiles', 'Samsung', 1),
(3, 'Mobiles', 'Apple', 1),
(4, 'Mobiles', 'Redmi', 1),
(5, 'Mobile Accessories', 'Charger', 2),
(6, 'Mobile Accessories', 'Usb Cable', 2),
(7, 'Mobile Earphones', 'Earphone', 3),
(8, 'Mobile Earphones', 'Neck band', 3),
(9, 'Mobile Earphones', 'Ear buds', 3),
(10, 'Mobile Accessories', 'sdasda', 2),
(11, '1Electronics', 'Refrigerators', 1),
(12, '1Electronics', 'AXDASD', 1),
(13, '2fadsfsadf', 'dsfa', 1),
(14, '1Electronics', 'Washing Machine', 1),
(15, 'Mobiles', 'vivo', 1),
(16, 'Mobiles', 'Washing Machine', 1),
(17, 'Earphones', 'Washing Machine', 3);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_taxes`
--

CREATE TABLE `vendor_taxes` (
  `id` bigint(20) NOT NULL,
  `tax_name` varchar(200) DEFAULT NULL,
  `tax_value` int(11) NOT NULL,
  `date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_taxes`
--

INSERT INTO `vendor_taxes` (`id`, `tax_name`, `tax_value`, `date`) VALUES
(1, '18 % Electronics', 18, '2023-07-06 20:16:33.611105'),
(2, '28 % Luxury Products', 28, '2023-07-06 20:22:14.511124'),
(3, '12 % Mobile phones', 12, '2023-07-06 20:22:46.189430'),
(4, '5 % VAT', 5, '2023-07-09 13:25:25.903905'),
(5, '18 % GST', 18, '2023-07-11 15:31:42.405328');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_vendorsignup`
--

CREATE TABLE `vendor_vendorsignup` (
  `id` bigint(20) NOT NULL,
  `ven_name` varchar(200) NOT NULL,
  `ven_email` varchar(200) NOT NULL,
  `ven_pass` varchar(200) NOT NULL,
  `ven_isLogged` tinyint(1) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_vendorsignup`
--

INSERT INTO `vendor_vendorsignup` (`id`, `ven_name`, `ven_email`, `ven_pass`, `ven_isLogged`, `date`) VALUES
(1, 'Ajay Pratap Singh', 'vendor@gmail.com', 'vendor', NULL, '2023-07-08 14:08:31.796889'),
(2, 'Pranav Kumar Sinha', 'pranav@gmail.com', 'pranav', NULL, '2023-07-09 13:27:51.107171'),
(3, 'uday', 'uday@gmail.com', 'uday', NULL, '2023-07-09 14:31:52.619267'),
(4, 'Aps FinTechdsfa', 'akki420hrx@gmail.com', 'akki', NULL, '2023-07-16 14:22:32.423291'),
(5, 'Ajay Pratap ', 'udy@gmail.com', 'sdfsadfa', NULL, '2023-07-16 15:18:37.964886'),
(6, 'Ajay Pratap Singh', 'sinhakp83@gmail.com', 'sdafasdf', NULL, '2023-07-16 15:20:18.286707'),
(7, 'Ajay Pratap Singh', 'sinhap83@gmail.com', 'dfadsf', NULL, '2023-07-16 15:21:40.310946'),
(9, 'Ajit Kumar', 'saicuter@gmail.com', 'sdfsdafasd', NULL, '2023-07-16 15:23:38.696215'),
(10, 'Aps FinTechdsfa', 'sdfdsaf@gmail.com', 'sdfasdfa', NULL, '2023-07-16 15:24:47.909030'),
(11, 'Pranav Singh', 'sinhp8@gmail.com', 'dsfasdfas', NULL, '2023-07-16 15:25:04.152880'),
(12, 'Ajay Pratap Singh', 'sindsfsadfp83@gmail.com', 'dsfasdfas', NULL, '2023-07-16 22:16:41.815600'),
(15, 'fakefirstname', 'fakeemail@gmail.com', 'fakepassword', NULL, '2023-08-16 21:53:49.446681');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `userapi_address`
--
ALTER TABLE `userapi_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userApi_address_userId_id_c47f284f_fk_userApi_usersignup_id` (`userId_id`);

--
-- Indexes for table `userapi_cart`
--
ALTER TABLE `userapi_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userApi_cart_userId_id_f29b897e_fk_userApi_usersignup_id` (`userId_id`),
  ADD KEY `userApi_cart_productId_id_32361e5b` (`productId_id`);

--
-- Indexes for table `userapi_placeorder`
--
ALTER TABLE `userapi_placeorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userApi_placeorder_addressId_id_f0769b87_fk_userApi_address_id` (`addressId_id`),
  ADD KEY `userApi_placeorder_userId_id_30e04352_fk_userApi_usersignup_id` (`userId_id`);

--
-- Indexes for table `userapi_usersignup`
--
ALTER TABLE `userapi_usersignup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_addproduct`
--
ALTER TABLE `vendor_addproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_addproduct_venId_id_b7b95cdd_fk_vendor_vendorsignup_id` (`venId_id`);

--
-- Indexes for table `vendor_category`
--
ALTER TABLE `vendor_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_shipping`
--
ALTER TABLE `vendor_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_subcategory`
--
ALTER TABLE `vendor_subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_subcategory_catId_id_dbe6e098_fk_vendor_category_id` (`catId_id`);

--
-- Indexes for table `vendor_taxes`
--
ALTER TABLE `vendor_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_vendorsignup`
--
ALTER TABLE `vendor_vendorsignup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `userapi_address`
--
ALTER TABLE `userapi_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userapi_cart`
--
ALTER TABLE `userapi_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `userapi_placeorder`
--
ALTER TABLE `userapi_placeorder`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userapi_usersignup`
--
ALTER TABLE `userapi_usersignup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `vendor_addproduct`
--
ALTER TABLE `vendor_addproduct`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `vendor_category`
--
ALTER TABLE `vendor_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vendor_shipping`
--
ALTER TABLE `vendor_shipping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vendor_subcategory`
--
ALTER TABLE `vendor_subcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `vendor_taxes`
--
ALTER TABLE `vendor_taxes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendor_vendorsignup`
--
ALTER TABLE `vendor_vendorsignup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `userapi_address`
--
ALTER TABLE `userapi_address`
  ADD CONSTRAINT `userApi_address_userId_id_c47f284f_fk_userApi_usersignup_id` FOREIGN KEY (`userId_id`) REFERENCES `userapi_usersignup` (`id`);

--
-- Constraints for table `userapi_cart`
--
ALTER TABLE `userapi_cart`
  ADD CONSTRAINT `userApi_cart_productId_id_32361e5b_fk_vendor_addproduct_id` FOREIGN KEY (`productId_id`) REFERENCES `vendor_addproduct` (`id`),
  ADD CONSTRAINT `userApi_cart_userId_id_f29b897e_fk_userApi_usersignup_id` FOREIGN KEY (`userId_id`) REFERENCES `userapi_usersignup` (`id`);

--
-- Constraints for table `userapi_placeorder`
--
ALTER TABLE `userapi_placeorder`
  ADD CONSTRAINT `userApi_placeorder_addressId_id_f0769b87_fk_userApi_address_id` FOREIGN KEY (`addressId_id`) REFERENCES `userapi_address` (`id`),
  ADD CONSTRAINT `userApi_placeorder_userId_id_30e04352_fk_userApi_usersignup_id` FOREIGN KEY (`userId_id`) REFERENCES `userapi_usersignup` (`id`);

--
-- Constraints for table `vendor_addproduct`
--
ALTER TABLE `vendor_addproduct`
  ADD CONSTRAINT `vendor_addproduct_venId_id_b7b95cdd_fk_vendor_vendorsignup_id` FOREIGN KEY (`venId_id`) REFERENCES `vendor_vendorsignup` (`id`);

--
-- Constraints for table `vendor_subcategory`
--
ALTER TABLE `vendor_subcategory`
  ADD CONSTRAINT `vendor_subcategory_catId_id_dbe6e098_fk_vendor_category_id` FOREIGN KEY (`catId_id`) REFERENCES `vendor_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
