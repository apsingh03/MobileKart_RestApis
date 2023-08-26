-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2023 at 10:53 AM
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
-- Database: `mobilekart`
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
(25, 'Can add address', 7, 'add_address'),
(26, 'Can change address', 7, 'change_address'),
(27, 'Can delete address', 7, 'delete_address'),
(28, 'Can view address', 7, 'view_address'),
(29, 'Can add user sign up', 8, 'add_usersignup'),
(30, 'Can change user sign up', 8, 'change_usersignup'),
(31, 'Can delete user sign up', 8, 'delete_usersignup'),
(32, 'Can view user sign up', 8, 'view_usersignup'),
(33, 'Can add wish list', 9, 'add_wishlist'),
(34, 'Can change wish list', 9, 'change_wishlist'),
(35, 'Can delete wish list', 9, 'delete_wishlist'),
(36, 'Can view wish list', 9, 'view_wishlist'),
(37, 'Can add place order', 10, 'add_placeorder'),
(38, 'Can change place order', 10, 'change_placeorder'),
(39, 'Can delete place order', 10, 'delete_placeorder'),
(40, 'Can view place order', 10, 'view_placeorder'),
(41, 'Can add cart item', 11, 'add_cartitem'),
(42, 'Can change cart item', 11, 'change_cartitem'),
(43, 'Can delete cart item', 11, 'delete_cartitem'),
(44, 'Can view cart item', 11, 'view_cartitem'),
(45, 'Can add category', 12, 'add_category'),
(46, 'Can change category', 12, 'change_category'),
(47, 'Can delete category', 12, 'delete_category'),
(48, 'Can view category', 12, 'view_category'),
(49, 'Can add sub category', 13, 'add_subcategory'),
(50, 'Can change sub category', 13, 'change_subcategory'),
(51, 'Can delete sub category', 13, 'delete_subcategory'),
(52, 'Can view sub category', 13, 'view_subcategory'),
(53, 'Can add taxes', 14, 'add_taxes'),
(54, 'Can change taxes', 14, 'change_taxes'),
(55, 'Can delete taxes', 14, 'delete_taxes'),
(56, 'Can view taxes', 14, 'view_taxes'),
(57, 'Can add shipping', 15, 'add_shipping'),
(58, 'Can change shipping', 15, 'change_shipping'),
(59, 'Can delete shipping', 15, 'delete_shipping'),
(60, 'Can view shipping', 15, 'view_shipping'),
(61, 'Can add vendor signup', 16, 'add_vendorsignup'),
(62, 'Can change vendor signup', 16, 'change_vendorsignup'),
(63, 'Can delete vendor signup', 16, 'delete_vendorsignup'),
(64, 'Can view vendor signup', 16, 'view_vendorsignup'),
(65, 'Can add add product', 17, 'add_addproduct'),
(66, 'Can change add product', 17, 'change_addproduct'),
(67, 'Can delete add product', 17, 'delete_addproduct'),
(68, 'Can view add product', 17, 'view_addproduct');

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
(7, 'userApi', 'address'),
(11, 'userApi', 'cartitem'),
(10, 'userApi', 'placeorder'),
(8, 'userApi', 'usersignup'),
(9, 'userApi', 'wishlist'),
(17, 'vendor', 'addproduct'),
(12, 'vendor', 'category'),
(15, 'vendor', 'shipping'),
(13, 'vendor', 'subcategory'),
(14, 'vendor', 'taxes'),
(16, 'vendor', 'vendorsignup');

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
(1, 'contenttypes', '0001_initial', '2023-08-25 07:22:41.801046'),
(2, 'auth', '0001_initial', '2023-08-25 07:22:42.382791'),
(3, 'admin', '0001_initial', '2023-08-25 07:22:42.487566'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-08-25 07:22:42.495554'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-25 07:22:42.503549'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-08-25 07:22:42.568174'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-08-25 07:22:42.625021'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-08-25 07:22:42.649178'),
(9, 'auth', '0004_alter_user_username_opts', '2023-08-25 07:22:42.662396'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-08-25 07:22:42.716259'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-08-25 07:22:42.723794'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-08-25 07:22:42.741452'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-08-25 07:22:42.760907'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-08-25 07:22:42.793098'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-08-25 07:22:42.817292'),
(16, 'auth', '0011_update_proxy_permissions', '2023-08-25 07:22:42.833294'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-08-25 07:22:42.857693'),
(18, 'sessions', '0001_initial', '2023-08-25 07:22:42.898371'),
(19, 'vendor', '0001_initial', '2023-08-25 07:22:42.914877'),
(20, 'vendor', '0002_subcategory', '2023-08-25 07:22:42.980454'),
(21, 'vendor', '0003_taxes', '2023-08-25 07:22:42.996708'),
(22, 'vendor', '0004_shipping', '2023-08-25 07:22:43.019099'),
(23, 'vendor', '0005_vendorsignup_addproduct', '2023-08-25 07:22:43.110675'),
(24, 'vendor', '0006_rename_shipping_addproduct_shippingstatus_and_more', '2023-08-25 07:22:43.199193'),
(25, 'vendor', '0007_cart', '2023-08-25 07:22:43.271466'),
(26, 'vendor', '0008_delete_cart', '2023-08-25 07:22:43.287478'),
(27, 'vendor', '0009_addproduct_setfeatured', '2023-08-25 07:22:43.305627'),
(28, 'vendor', '0010_alter_addproduct_setfeatured', '2023-08-25 07:22:43.360876'),
(29, 'vendor', '0011_addproduct_recyclebin', '2023-08-25 07:22:43.377071'),
(30, 'vendor', '0012_remove_addproduct_recyclebin', '2023-08-25 07:22:43.401087'),
(31, 'vendor', '0013_addproduct_recyclebin', '2023-08-25 07:22:43.425705'),
(32, 'vendor', '0014_remove_addproduct_category_and_more', '2023-08-25 07:22:43.587826'),
(33, 'vendor', '0015_remove_subcategory_cat_name', '2023-08-25 07:22:43.617436'),
(34, 'vendor', '0016_alter_taxes_date', '2023-08-25 07:22:43.669174'),
(35, 'vendor', '0017_category_date_subcategory_date_alter_addproduct_date_and_more', '2023-08-25 07:22:43.857210'),
(36, 'userApi', '0001_initial', '2023-08-25 07:22:44.388366'),
(37, 'userApi', '0002_alter_placeorder_addressid', '2023-08-25 07:49:42.956382'),
(38, 'userApi', '0003_remove_placeorder_status_and_more', '2023-08-25 09:46:41.336444'),
(39, 'userApi', '0004_rename_orderplacedstatus_placeorder_status', '2023-08-25 09:54:05.080362');

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
  `reciverName` varchar(50) DEFAULT NULL,
  `fullAddress` longtext NOT NULL,
  `landmark` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `userId_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapi_address`
--

INSERT INTO `userapi_address` (`id`, `reciverName`, `fullAddress`, `landmark`, `city`, `state`, `date`, `userId_id`) VALUES
(1, 'Sikandra rao Hathras', 'Sarswati Sadan Baghel Nagar Railway Road Sikandra Rao', 'landmark', 'Sikandra rao Hathras', 'Uttar Pradesh', 'Aug 25 2023 13:05:13', 1),
(2, 'Xyz anme', 'Sarswati Sadan Baghel Nagar Railway Road Sikandra Rao', 'landmark', 'Sikandra rao Hathras', 'Uttar Pradesh', 'Aug 25 2023 14:35:21', 2);

-- --------------------------------------------------------

--
-- Table structure for table `userapi_cartitem`
--

CREATE TABLE `userapi_cartitem` (
  `id` bigint(20) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `orderPlacedStatus` tinyint(1) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `placeOrderId_id` bigint(20) DEFAULT NULL,
  `productId_id` bigint(20) NOT NULL,
  `userId_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapi_cartitem`
--

INSERT INTO `userapi_cartitem` (`id`, `qty`, `orderPlacedStatus`, `date`, `placeOrderId_id`, `productId_id`, `userId_id`) VALUES
(3, 8, 1, 'Aug 25 2023 13:51:47', 5, 7, 1),
(4, 1, 1, 'Aug 25 2023 13:52:16', 5, 3, 1),
(7, 3, 1, 'Aug 25 2023 14:44:36', 1, 1, 2),
(8, 2, 1, 'Aug 25 2023 14:44:46', 1, 2, 2),
(17, 4, 1, 'Aug 25 2023 21:32:16', 8, 12, 2),
(18, 2, 1, 'Aug 25 2023 21:32:21', 8, 5, 2),
(19, 2, 0, 'Aug 25 2023 22:46:59', 9, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userapi_placeorder`
--

CREATE TABLE `userapi_placeorder` (
  `id` bigint(20) NOT NULL,
  `cartAmount` int(11) DEFAULT NULL,
  `paymentId` int(11) DEFAULT NULL,
  `paymentMode` varchar(30) DEFAULT NULL,
  `trackingNo` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `addressId_id` bigint(20) DEFAULT NULL,
  `userId_id` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapi_placeorder`
--

INSERT INTO `userapi_placeorder` (`id`, `cartAmount`, `paymentId`, `paymentMode`, `trackingNo`, `date`, `addressId_id`, `userId_id`, `status`) VALUES
(1, 58034, 0, 'COD', 8796, 'Aug 25 2023 21:44:07', 2, 2, 1),
(5, 33317, 0, 'COD', 3598, 'Aug 25 2023 22:46:32', 1, 1, 1),
(8, 114308, 0, 'COD', 8124, 'Aug 25 2023 21:50:00', 2, 2, 1),
(9, NULL, NULL, NULL, NULL, 'Aug 25 2023 22:46:59', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userapi_usersignup`
--

CREATE TABLE `userapi_usersignup` (
  `id` bigint(20) NOT NULL,
  `u_fname` varchar(30) NOT NULL,
  `u_lname` varchar(30) NOT NULL,
  `u_email` varchar(50) NOT NULL,
  `u_password` longtext NOT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapi_usersignup`
--

INSERT INTO `userapi_usersignup` (`id`, `u_fname`, `u_lname`, `u_email`, `u_password`, `date`) VALUES
(1, 'ajay', 'singh', 'user@gmail.com', 'user', 'Aug 25 2023 13:02:36'),
(2, 'Uday Pratap Singh', 'fsdfa', 'asdf@gmail.com', 'asdf', '2023-07-14 13:37:32.000000');

-- --------------------------------------------------------

--
-- Table structure for table `userapi_wishlist`
--

CREATE TABLE `userapi_wishlist` (
  `id` bigint(20) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `productId_id` bigint(20) NOT NULL,
  `userId_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapi_wishlist`
--

INSERT INTO `userapi_wishlist` (`id`, `date`, `productId_id`, `userId_id`) VALUES
(3, 'Aug 25 2023 13:03:42', 7, 1),
(4, 'Aug 25 2023 14:21:03', 5, 2),
(5, 'Aug 25 2023 14:21:05', 7, 2);

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
  `date` varchar(50) DEFAULT NULL,
  `venId_id` bigint(20) NOT NULL,
  `shippingAmount` int(11) DEFAULT NULL,
  `taxClass` varchar(200) DEFAULT NULL,
  `setFeatured` tinyint(1) NOT NULL,
  `recycleBin` tinyint(1) NOT NULL,
  `CategoryId_id` bigint(20) NOT NULL,
  `subCategoryId_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_addproduct`
--

INSERT INTO `vendor_addproduct` (`id`, `name`, `mrp`, `discountPercent`, `productType`, `taxStatus`, `shippingStatus`, `totalUnits`, `stockStatus`, `trackQty`, `productDescription`, `image1`, `image2`, `image3`, `image4`, `image5`, `date`, `venId_id`, `shippingAmount`, `taxClass`, `setFeatured`, `recycleBin`, `CategoryId_id`, `subCategoryId_id`) VALUES
(1, 'SAMSUNG Galaxy F13 (Sunrise Copper, 64 GB)  (4 GB RAM)', 1000, 12, 'simpleProduct', '', 'flatShipping', 7, 'In-Stock', '', 'fsdaasdfsdafdsafasdfasd', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/q/a/u/x90-v2218-vivo-original-imagzzrq2rffw7z6.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', 'Aug 25 2023 12:58:30', 1, 32, '5 % VAT', 1, 0, 1, 1),
(2, 'SAMSUNG Galaxy F13 (Sunrise Copper, 64 GB)  (4 GB RAM) COPIED ', 2000, 12, 'simpleProduct', '', 'flatShipping', 13, 'In-Stock', '', 'fsdaasdfsdafdsafasdfasd', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/q/a/u/x90-v2218-vivo-original-imagzzrq2rffw7z6.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', '2023-08-25 12:58:36.542750', 1, 32, '5 % VAT', 0, 1, 1, 2),
(3, 'SAMSUNG Galaxy F13 (Sunrise Copper, 64 GB)  (4 GB RAM) COPIED ', 32223, 12, 'simpleProduct', '', 'flatShipping', 123, 'In-Stock', '', 'fsdaasdfsdafdsafasdfasd', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/q/a/u/x90-v2218-vivo-original-imagzzrq2rffw7z6.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', '2023-08-25 12:58:40.466248', 1, 32, '5 % VAT', 1, 0, 1, 3),
(4, 'SAMSUNG Galaxy F13 (Sunrise Copper, 64 GB)  (4 GB RAM) COPIED ', 32223, 12, 'simpleProduct', '', 'flatShipping', 123, 'In-Stock', '', 'fsdaasdfsdafdsafasdfasd', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/q/a/u/x90-v2218-vivo-original-imagzzrq2rffw7z6.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', '2023-08-25 12:58:43.032360', 1, 32, '5 % VAT', 1, 0, 1, 1),
(5, 'SAMSUNG------------------', 500, 12, 'simpleProduct', '', 'flatShipping', 6, 'In-Stock', '', 'fsdaasdfsdafdsafasdfasd', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/q/a/u/x90-v2218-vivo-original-imagzzrq2rffw7z6.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', 'Aug 25 2023 19:55:20', 1, 0, '5 % VAT', 1, 0, 1, 3),
(6, 'SAMSUNG Galaxy F13 (Sunrise Copper, 64 GB)  (4 GB RAM) COPIED ', 32223, 12, 'simpleProduct', '', 'flatShipping', 20, 'In-Stock', '', 'fsdaasdfsdafdsafasdfasd', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/q/a/u/x90-v2218-vivo-original-imagzzrq2rffw7z6.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', '2023-08-25 12:58:49.145871', 1, 32, '5 % VAT', 1, 0, 1, 3),
(7, 'SAMSUNG Galaxy F13 (Sunrise Copper, 64 GB)  (4 GB RAM) COPIED  COPIED ', 700, 12, 'simpleProduct', '', 'flatShipping', 26, 'In-Stock', '', 'fsdaasdfsdafdsafasdfasd', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/q/a/u/x90-v2218-vivo-original-imagzzrq2rffw7z6.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', 'Aug 25 2023 19:54:17', 1, 69, '5 % VAT', 1, 0, 1, 3),
(8, 'vivo V27 5G (Magic Blue, 128 GB)  (8 GB RAM)', 34234, 12, 'simpleProduct', '', 'flatShipping', 22, 'In-Stock', '', 'vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo vivo   vivo ', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/5/m/f/-original-imagfhu6nsnwvxkm.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/n/b/z/-original-imaghxcpwuhbghgh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/u/d/l/-original-imagq4y2gyv5s5gy.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/9/4/o/-original-imagfz7yvktcmbrf.jpeg?q=70', 'Aug 25 2023 20:02:05', 1, 34, '10 % Goods TAX', 0, 0, 1, 2),
(9, 'SAMSUNG Galaxy F13 (Sunrise Copper, 64 GB)  (4 GB RAM)', 423, 32, 'simpleProduct', '', 'locationWise', 43, 'In-Stock', '', 'efrqerqwerqwerqwrqwerwq', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/m/c/m/-original-imagnshsvxjnxgrh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/5/o/f/-original-imagrewet8nvz6yn.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/t/j/2/-original-imagnuphzahgzx3v.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', 'Aug 25 2023 20:15:47', 1, 0, '5 % VAT', 0, 0, 1, 3),
(10, 'SAMSUNG Galaxy F1@@@@@@@@@@@@@@@@@@@@@@@@@', 32223, 12, 'simpleProduct', '', 'flatShipping', 123, 'In-Stock', '', 'fsdaasdfsdafdsafasdfasd', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/q/a/u/x90-v2218-vivo-original-imagzzrq2rffw7z6.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', 'Aug 25 2023 20:33:16', 1, 0, '5 % VAT', 0, 0, 2, 4),
(11, 'SAMSUNG Galaxy------------------------', 32223, 12, 'simpleProduct', '', 'flatShipping', 123, 'In-Stock', '', 'fsdaasdfsdafdsafasdfasd', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/q/a/u/x90-v2218-vivo-original-imagzzrq2rffw7z6.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', 'Aug 25 2023 20:35:20', 1, 0, '5 % VAT', 0, 0, 2, 2),
(12, 'SAMSUNG Galaxy------------------------', 32223, 12, 'simpleProduct', '', 'flatShipping', 123, 'In-Stock', '', 'fsdaasdfsdafdsafasdfasd', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/q/a/u/x90-v2218-vivo-original-imagzzrq2rffw7z6.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', 'Aug 25 2023 20:38:45', 1, 0, '5 % VAT', 1, 0, 2, 5),
(13, 'hukam singh', 10, 1, 'simpleProduct', '', 'flatShipping', 50, 'In-Stock', '', 'fsdaasdfsdafdsafasdfasd', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/x/x/s/-original-imagfhu6dcpdnqkh.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/xif0q/mobile/q/a/u/x90-v2218-vivo-original-imagzzrq2rffw7z6.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/kmp7ngw0/mobile/0/s/p/iphone-11-mhdc3hn-a-apple-original-imagfj4ckzxqtvgx.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/q/z/v/iphone-11-128-u-mwm22hn-a-apple-0-original-imafkg25e5sew3kj.jpeg?q=70', 'https://rukminim2.flixcart.com/image/832/832/k2jbyq80pkrrdj/mobile-refurbished/h/9/p/iphone-11-128-a-mwm22hn-a-apple-0-original-imafkg252zr5egdk.jpeg?q=70', 'Aug 26 2023 11:55:40', 1, 0, '5 % VAT', 1, 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_category`
--

CREATE TABLE `vendor_category` (
  `id` bigint(20) NOT NULL,
  `cat_name` varchar(200) NOT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_category`
--

INSERT INTO `vendor_category` (`id`, `cat_name`, `date`) VALUES
(1, 'Mobiles', 'Aug 25 2023 12:54:55'),
(2, 'Electronics', 'Aug 25 2023 12:55:03');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_shipping`
--

CREATE TABLE `vendor_shipping` (
  `id` bigint(20) NOT NULL,
  `shipping_state_name` varchar(200) DEFAULT NULL,
  `shipping_value` int(11) NOT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_shipping`
--

INSERT INTO `vendor_shipping` (`id`, `shipping_state_name`, `shipping_value`, `date`) VALUES
(1, 'Jammu Kashmir', 23, 'Aug 25 2023 12:56:13'),
(2, 'west bengal', 543, 'Aug 25 2023 12:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_subcategory`
--

CREATE TABLE `vendor_subcategory` (
  `id` bigint(20) NOT NULL,
  `sub_cat_name` varchar(200) NOT NULL,
  `catId_id` bigint(20) NOT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_subcategory`
--

INSERT INTO `vendor_subcategory` (`id`, `sub_cat_name`, `catId_id`, `date`) VALUES
(1, 'Nokia', 1, 'Aug 25 2023 12:55:07'),
(2, 'vivo', 1, 'Aug 25 2023 12:55:12'),
(3, 'Samsung', 1, 'Aug 25 2023 12:55:29'),
(4, 'tV', 2, 'Aug 25 2023 12:55:37'),
(5, 'Refrigerator', 2, 'Aug 25 2023 12:55:44');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_taxes`
--

CREATE TABLE `vendor_taxes` (
  `id` bigint(20) NOT NULL,
  `tax_name` varchar(200) DEFAULT NULL,
  `tax_value` int(11) NOT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_taxes`
--

INSERT INTO `vendor_taxes` (`id`, `tax_name`, `tax_value`, `date`) VALUES
(1, '18 % GST', 18, 'Aug 25 2023 12:55:51'),
(2, '5 % VAT', 5, 'Aug 25 2023 12:55:56'),
(3, '10 % Goods TAX', 10, 'Aug 25 2023 12:56:07');

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
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_vendorsignup`
--

INSERT INTO `vendor_vendorsignup` (`id`, `ven_name`, `ven_email`, `ven_pass`, `ven_isLogged`, `date`) VALUES
(1, 'Ajay Pratap Singh', 'vendor@gmail.com', 'vendor', NULL, 'Aug 25 2023 12:54:23');

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
-- Indexes for table `userapi_cartitem`
--
ALTER TABLE `userapi_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userApi_cartitem_placeOrderId_id_1fae3f5c_fk_userApi_p` (`placeOrderId_id`),
  ADD KEY `userApi_cartitem_productId_id_b4b6b13c_fk_vendor_addproduct_id` (`productId_id`),
  ADD KEY `userApi_cartitem_userId_id_95160327_fk_userApi_usersignup_id` (`userId_id`);

--
-- Indexes for table `userapi_placeorder`
--
ALTER TABLE `userapi_placeorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userApi_placeorder_userId_id_30e04352_fk_userApi_usersignup_id` (`userId_id`),
  ADD KEY `userApi_placeorder_addressId_id_f0769b87_fk_userApi_address_id` (`addressId_id`);

--
-- Indexes for table `userapi_usersignup`
--
ALTER TABLE `userapi_usersignup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_email` (`u_email`);

--
-- Indexes for table `userapi_wishlist`
--
ALTER TABLE `userapi_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userApi_wishlist_productId_id_15548261_fk_vendor_addproduct_id` (`productId_id`),
  ADD KEY `userApi_wishlist_userId_id_6d69bcab_fk_userApi_usersignup_id` (`userId_id`);

--
-- Indexes for table `vendor_addproduct`
--
ALTER TABLE `vendor_addproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_addproduct_venId_id_b7b95cdd_fk_vendor_vendorsignup_id` (`venId_id`),
  ADD KEY `vendor_addproduct_CategoryId_id_9f6e5a82_fk_vendor_category_id` (`CategoryId_id`),
  ADD KEY `vendor_addproduct_subCategoryId_id_d93efa98_fk_vendor_su` (`subCategoryId_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_vendorsignup_ven_email_47d641ab_uniq` (`ven_email`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `userapi_address`
--
ALTER TABLE `userapi_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userapi_cartitem`
--
ALTER TABLE `userapi_cartitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `userapi_placeorder`
--
ALTER TABLE `userapi_placeorder`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `userapi_usersignup`
--
ALTER TABLE `userapi_usersignup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userapi_wishlist`
--
ALTER TABLE `userapi_wishlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendor_addproduct`
--
ALTER TABLE `vendor_addproduct`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vendor_category`
--
ALTER TABLE `vendor_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendor_shipping`
--
ALTER TABLE `vendor_shipping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendor_subcategory`
--
ALTER TABLE `vendor_subcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendor_taxes`
--
ALTER TABLE `vendor_taxes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendor_vendorsignup`
--
ALTER TABLE `vendor_vendorsignup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Constraints for table `userapi_cartitem`
--
ALTER TABLE `userapi_cartitem`
  ADD CONSTRAINT `userApi_cartitem_placeOrderId_id_1fae3f5c_fk_userApi_p` FOREIGN KEY (`placeOrderId_id`) REFERENCES `userapi_placeorder` (`id`),
  ADD CONSTRAINT `userApi_cartitem_productId_id_b4b6b13c_fk_vendor_addproduct_id` FOREIGN KEY (`productId_id`) REFERENCES `vendor_addproduct` (`id`),
  ADD CONSTRAINT `userApi_cartitem_userId_id_95160327_fk_userApi_usersignup_id` FOREIGN KEY (`userId_id`) REFERENCES `userapi_usersignup` (`id`);

--
-- Constraints for table `userapi_placeorder`
--
ALTER TABLE `userapi_placeorder`
  ADD CONSTRAINT `userApi_placeorder_addressId_id_f0769b87_fk_userApi_address_id` FOREIGN KEY (`addressId_id`) REFERENCES `userapi_address` (`id`),
  ADD CONSTRAINT `userApi_placeorder_userId_id_30e04352_fk_userApi_usersignup_id` FOREIGN KEY (`userId_id`) REFERENCES `userapi_usersignup` (`id`);

--
-- Constraints for table `userapi_wishlist`
--
ALTER TABLE `userapi_wishlist`
  ADD CONSTRAINT `userApi_wishlist_productId_id_15548261_fk_vendor_addproduct_id` FOREIGN KEY (`productId_id`) REFERENCES `vendor_addproduct` (`id`),
  ADD CONSTRAINT `userApi_wishlist_userId_id_6d69bcab_fk_userApi_usersignup_id` FOREIGN KEY (`userId_id`) REFERENCES `userapi_usersignup` (`id`);

--
-- Constraints for table `vendor_addproduct`
--
ALTER TABLE `vendor_addproduct`
  ADD CONSTRAINT `vendor_addproduct_CategoryId_id_9f6e5a82_fk_vendor_category_id` FOREIGN KEY (`CategoryId_id`) REFERENCES `vendor_category` (`id`),
  ADD CONSTRAINT `vendor_addproduct_subCategoryId_id_d93efa98_fk_vendor_su` FOREIGN KEY (`subCategoryId_id`) REFERENCES `vendor_subcategory` (`id`),
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
