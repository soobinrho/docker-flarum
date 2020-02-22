-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: communitydb
-- Generation Time: Feb 22, 2020 at 03:50 AM
-- Server version: 5.7.29-32
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flarum`
--

-- --------------------------------------------------------

--
-- Table structure for table `flarum_access_tokens`
--

CREATE TABLE `flarum_access_tokens` (
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_activity_at` datetime NOT NULL,
  `lifetime_seconds` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_api_keys`
--

CREATE TABLE `flarum_api_keys` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `allowed_ips` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_activity_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_discussions`
--

CREATE TABLE `flarum_discussions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `participant_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `post_number_index` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `first_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_user_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_number` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_discussion_tag`
--

CREATE TABLE `flarum_discussion_tag` (
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_discussion_user`
--

CREATE TABLE `flarum_discussion_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `last_read_at` datetime DEFAULT NULL,
  `last_read_post_number` int(10) UNSIGNED DEFAULT NULL,
  `subscription` enum('follow','ignore') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_email_tokens`
--

CREATE TABLE `flarum_email_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_flags`
--

CREATE TABLE `flarum_flags` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_groups`
--

CREATE TABLE `flarum_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_singular` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_plural` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flarum_groups`
--

INSERT INTO `flarum_groups` (`id`, `name_singular`, `name_plural`, `color`, `icon`) VALUES
(1, 'Admin', 'Admins', '#B72A2A', 'fas fa-wrench'),
(2, 'Guest', 'Guests', NULL, NULL),
(3, 'Member', 'Members', NULL, NULL),
(4, 'Mod', 'Mods', '#80349E', 'fas fa-bolt');

-- --------------------------------------------------------

--
-- Table structure for table `flarum_group_permission`
--

CREATE TABLE `flarum_group_permission` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `permission` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flarum_group_permission`
--

INSERT INTO `flarum_group_permission` (`group_id`, `permission`) VALUES
(2, 'viewDiscussions'),
(3, 'discussion.flagPosts'),
(3, 'discussion.likePosts'),
(3, 'discussion.reply'),
(3, 'discussion.replyWithoutApproval'),
(3, 'discussion.startWithoutApproval'),
(3, 'startDiscussion'),
(3, 'viewUserList'),
(4, 'discussion.approvePosts'),
(4, 'discussion.editPosts'),
(4, 'discussion.hide'),
(4, 'discussion.hidePosts'),
(4, 'discussion.lock'),
(4, 'discussion.rename'),
(4, 'discussion.sticky'),
(4, 'discussion.tag'),
(4, 'discussion.viewFlags'),
(4, 'discussion.viewIpsPosts'),
(4, 'user.suspend'),
(4, 'user.viewLastSeenAt');

-- --------------------------------------------------------

--
-- Table structure for table `flarum_group_user`
--

CREATE TABLE `flarum_group_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flarum_group_user`
--

INSERT INTO `flarum_group_user` (`user_id`, `group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `flarum_login_providers`
--

CREATE TABLE `flarum_login_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_migrations`
--

CREATE TABLE `flarum_migrations` (
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flarum_migrations`
--

INSERT INTO `flarum_migrations` (`migration`, `extension`) VALUES
('2015_02_24_000000_create_access_tokens_table', NULL),
('2015_02_24_000000_create_api_keys_table', NULL),
('2015_02_24_000000_create_config_table', NULL),
('2015_02_24_000000_create_discussions_table', NULL),
('2015_02_24_000000_create_email_tokens_table', NULL),
('2015_02_24_000000_create_groups_table', NULL),
('2015_02_24_000000_create_notifications_table', NULL),
('2015_02_24_000000_create_password_tokens_table', NULL),
('2015_02_24_000000_create_permissions_table', NULL),
('2015_02_24_000000_create_posts_table', NULL),
('2015_02_24_000000_create_users_discussions_table', NULL),
('2015_02_24_000000_create_users_groups_table', NULL),
('2015_02_24_000000_create_users_table', NULL),
('2015_09_15_000000_create_auth_tokens_table', NULL),
('2015_09_20_224327_add_hide_to_discussions', NULL),
('2015_09_22_030432_rename_notification_read_time', NULL),
('2015_10_07_130531_rename_config_to_settings', NULL),
('2015_10_24_194000_add_ip_address_to_posts', NULL),
('2015_12_05_042721_change_access_tokens_columns', NULL),
('2015_12_17_194247_change_settings_value_column_to_text', NULL),
('2016_02_04_095452_add_slug_to_discussions', NULL),
('2017_04_07_114138_add_is_private_to_discussions', NULL),
('2017_04_07_114138_add_is_private_to_posts', NULL),
('2018_01_11_093900_change_access_tokens_columns', NULL),
('2018_01_11_094000_change_access_tokens_add_foreign_keys', NULL),
('2018_01_11_095000_change_api_keys_columns', NULL),
('2018_01_11_101800_rename_auth_tokens_to_registration_tokens', NULL),
('2018_01_11_102000_change_registration_tokens_rename_id_to_token', NULL),
('2018_01_11_102100_change_registration_tokens_created_at_to_datetime', NULL),
('2018_01_11_120604_change_posts_table_to_innodb', NULL),
('2018_01_11_155200_change_discussions_rename_columns', NULL),
('2018_01_11_155300_change_discussions_add_foreign_keys', NULL),
('2018_01_15_071700_rename_users_discussions_to_discussion_user', NULL),
('2018_01_15_071800_change_discussion_user_rename_columns', NULL),
('2018_01_15_071900_change_discussion_user_add_foreign_keys', NULL),
('2018_01_15_072600_change_email_tokens_rename_id_to_token', NULL),
('2018_01_15_072700_change_email_tokens_add_foreign_keys', NULL),
('2018_01_15_072800_change_email_tokens_created_at_to_datetime', NULL),
('2018_01_18_130400_rename_permissions_to_group_permission', NULL),
('2018_01_18_130500_change_group_permission_add_foreign_keys', NULL),
('2018_01_18_130600_rename_users_groups_to_group_user', NULL),
('2018_01_18_130700_change_group_user_add_foreign_keys', NULL),
('2018_01_18_133000_change_notifications_columns', NULL),
('2018_01_18_133100_change_notifications_add_foreign_keys', NULL),
('2018_01_18_134400_change_password_tokens_rename_id_to_token', NULL),
('2018_01_18_134500_change_password_tokens_add_foreign_keys', NULL),
('2018_01_18_134600_change_password_tokens_created_at_to_datetime', NULL),
('2018_01_18_135000_change_posts_rename_columns', NULL),
('2018_01_18_135100_change_posts_add_foreign_keys', NULL),
('2018_01_30_112238_add_fulltext_index_to_discussions_title', NULL),
('2018_01_30_220100_create_post_user_table', NULL),
('2018_01_30_222900_change_users_rename_columns', NULL),
('2018_07_21_000000_seed_default_groups', NULL),
('2018_07_21_000100_seed_default_group_permissions', NULL),
('2018_09_15_041340_add_users_indicies', NULL),
('2018_09_15_041828_add_discussions_indicies', NULL),
('2018_09_15_043337_add_notifications_indices', NULL),
('2018_09_15_043621_add_posts_indices', NULL),
('2018_09_22_004100_change_registration_tokens_columns', NULL),
('2018_09_22_004200_create_login_providers_table', NULL),
('2018_10_08_144700_add_shim_prefix_to_group_icons', NULL),
('2019_06_24_145100_change_posts_content_column_to_mediumtext', NULL),
('2019_10_12_195349_change_posts_add_discussion_foreign_key', NULL),
('2015_09_21_011527_add_is_approved_to_discussions', 'flarum-approval'),
('2015_09_21_011706_add_is_approved_to_posts', 'flarum-approval'),
('2017_07_22_000000_add_default_permissions', 'flarum-approval'),
('2018_09_29_060444_replace_emoji_shorcuts_with_unicode', 'flarum-emoji'),
('2015_09_02_000000_add_flags_read_time_to_users_table', 'flarum-flags'),
('2015_09_02_000000_create_flags_table', 'flarum-flags'),
('2017_07_22_000000_add_default_permissions', 'flarum-flags'),
('2018_06_27_101500_change_flags_rename_time_to_created_at', 'flarum-flags'),
('2018_06_27_101600_change_flags_add_foreign_keys', 'flarum-flags'),
('2018_06_27_105100_change_users_rename_flags_read_time_to_read_flags_at', 'flarum-flags'),
('2018_09_15_043621_add_flags_indices', 'flarum-flags'),
('2015_05_11_000000_create_posts_likes_table', 'flarum-likes'),
('2015_09_04_000000_add_default_like_permissions', 'flarum-likes'),
('2018_06_27_100600_rename_posts_likes_to_post_likes', 'flarum-likes'),
('2018_06_27_100700_change_post_likes_add_foreign_keys', 'flarum-likes'),
('2015_02_24_000000_add_locked_to_discussions', 'flarum-lock'),
('2017_07_22_000000_add_default_permissions', 'flarum-lock'),
('2018_09_15_043621_add_discussions_indices', 'flarum-lock'),
('2015_05_11_000000_create_mentions_posts_table', 'flarum-mentions'),
('2015_05_11_000000_create_mentions_users_table', 'flarum-mentions'),
('2018_06_27_102000_rename_mentions_posts_to_post_mentions_post', 'flarum-mentions'),
('2018_06_27_102100_rename_mentions_users_to_post_mentions_user', 'flarum-mentions'),
('2018_06_27_102200_change_post_mentions_post_rename_mentions_id_to_mentions_post_id', 'flarum-mentions'),
('2018_06_27_102300_change_post_mentions_post_add_foreign_keys', 'flarum-mentions'),
('2018_06_27_102400_change_post_mentions_user_rename_mentions_id_to_mentions_user_id', 'flarum-mentions'),
('2018_06_27_102500_change_post_mentions_user_add_foreign_keys', 'flarum-mentions'),
('2015_02_24_000000_add_sticky_to_discussions', 'flarum-sticky'),
('2017_07_22_000000_add_default_permissions', 'flarum-sticky'),
('2018_09_15_043621_add_discussions_indices', 'flarum-sticky'),
('2015_05_11_000000_add_subscription_to_users_discussions_table', 'flarum-subscriptions'),
('2015_05_11_000000_add_suspended_until_to_users_table', 'flarum-suspend'),
('2015_09_14_000000_rename_suspended_until_column', 'flarum-suspend'),
('2017_07_22_000000_add_default_permissions', 'flarum-suspend'),
('2018_06_27_111400_change_users_rename_suspend_until_to_suspended_until', 'flarum-suspend'),
('2015_02_24_000000_create_discussions_tags_table', 'flarum-tags'),
('2015_02_24_000000_create_tags_table', 'flarum-tags'),
('2015_02_24_000000_create_users_tags_table', 'flarum-tags'),
('2015_02_24_000000_set_default_settings', 'flarum-tags'),
('2015_10_19_061223_make_slug_unique', 'flarum-tags'),
('2017_07_22_000000_add_default_permissions', 'flarum-tags'),
('2018_06_27_085200_change_tags_columns', 'flarum-tags'),
('2018_06_27_085300_change_tags_add_foreign_keys', 'flarum-tags'),
('2018_06_27_090400_rename_users_tags_to_tag_user', 'flarum-tags'),
('2018_06_27_100100_change_tag_user_rename_read_time_to_marked_as_read_at', 'flarum-tags'),
('2018_06_27_100200_change_tag_user_add_foreign_keys', 'flarum-tags'),
('2018_06_27_103000_rename_discussions_tags_to_discussion_tag', 'flarum-tags'),
('2018_06_27_103100_add_discussion_tag_foreign_keys', 'flarum-tags'),
('2019_04_21_000000_add_icon_to_tags_table', 'flarum-tags');

-- --------------------------------------------------------

--
-- Table structure for table `flarum_notifications`
--

CREATE TABLE `flarum_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `from_user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(10) UNSIGNED DEFAULT NULL,
  `data` blob,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_password_tokens`
--

CREATE TABLE `flarum_password_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_posts`
--

CREATE TABLE `flarum_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `number` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci COMMENT ' ',
  `edited_at` datetime DEFAULT NULL,
  `edited_user_id` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_post_likes`
--

CREATE TABLE `flarum_post_likes` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_post_mentions_post`
--

CREATE TABLE `flarum_post_mentions_post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_post_mentions_user`
--

CREATE TABLE `flarum_post_mentions_user` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_post_user`
--

CREATE TABLE `flarum_post_user` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_registration_tokens`
--

CREATE TABLE `flarum_registration_tokens` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_attributes` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_settings`
--

CREATE TABLE `flarum_settings` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flarum_settings`
--

INSERT INTO `flarum_settings` (`key`, `value`) VALUES
('allow_post_editing', 'reply'),
('allow_renaming', '10'),
('allow_sign_up', '1'),
('custom_less', ''),
('default_locale', 'en'),
('default_route', '/all'),
('extensions_enabled', '[\"flarum-approval\",\"flarum-bbcode\",\"flarum-emoji\",\"flarum-lang-english\",\"flarum-flags\",\"flarum-likes\",\"flarum-lock\",\"flarum-markdown\",\"flarum-mentions\",\"flarum-statistics\",\"flarum-sticky\",\"flarum-subscriptions\",\"flarum-suspend\",\"flarum-tags\",\"bokt-redis\"]'),
('flarum-tags.max_primary_tags', '1'),
('flarum-tags.max_secondary_tags', '3'),
('flarum-tags.min_primary_tags', '1'),
('flarum-tags.min_secondary_tags', '0'),
('forum_description', ''),
('forum_title', 'Flarum Dev Docker'),
('mail_driver', 'log'),
('mail_from', 'noreply@localhost'),
('theme_colored_header', '0'),
('theme_dark_mode', '0'),
('theme_primary_color', '#4D698E'),
('theme_secondary_color', '#4D698E'),
('version', '0.1.0-beta.11.1'),
('welcome_message', 'This is beta software and you should not use it in production.'),
('welcome_title', 'Welcome to Flarum Dev Docker');

-- --------------------------------------------------------

--
-- Table structure for table `flarum_tags`
--

CREATE TABLE `flarum_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_mode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `default_sort` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_discussion_id` int(10) UNSIGNED DEFAULT NULL,
  `last_posted_user_id` int(10) UNSIGNED DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flarum_tags`
--

INSERT INTO `flarum_tags` (`id`, `name`, `slug`, `description`, `color`, `background_path`, `background_mode`, `position`, `parent_id`, `default_sort`, `is_restricted`, `is_hidden`, `discussion_count`, `last_posted_at`, `last_posted_discussion_id`, `last_posted_user_id`, `icon`) VALUES
(1, 'General', 'general', NULL, '#888', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flarum_tag_user`
--

CREATE TABLE `flarum_tag_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `marked_as_read_at` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flarum_users`
--

CREATE TABLE `flarum_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `avatar_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` blob,
  `joined_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `marked_all_as_read_at` datetime DEFAULT NULL,
  `read_notifications_at` datetime DEFAULT NULL,
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `read_flags_at` datetime DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flarum_users`
--

INSERT INTO `flarum_users` (`id`, `username`, `email`, `is_email_confirmed`, `password`, `bio`, `avatar_url`, `preferences`, `joined_at`, `last_seen_at`, `marked_all_as_read_at`, `read_notifications_at`, `discussion_count`, `comment_count`, `read_flags_at`, `suspended_until`) VALUES
(1, 'admin', 'admin@example.com', 1, '$2y$10$4EtFTSogliftqOuWgaADv.giCV93SY.k6PUZfPmg7QDwbTITkL/pi', NULL, NULL, NULL, '2020-02-22 03:27:01', '2020-02-22 03:46:53', NULL, NULL, 0, 0, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flarum_access_tokens`
--
ALTER TABLE `flarum_access_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `flarum_access_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `flarum_api_keys`
--
ALTER TABLE `flarum_api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flarum_api_keys_key_unique` (`key`),
  ADD KEY `flarum_api_keys_user_id_foreign` (`user_id`);

--
-- Indexes for table `flarum_discussions`
--
ALTER TABLE `flarum_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flarum_discussions_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `flarum_discussions_first_post_id_foreign` (`first_post_id`),
  ADD KEY `flarum_discussions_last_post_id_foreign` (`last_post_id`),
  ADD KEY `flarum_discussions_last_posted_at_index` (`last_posted_at`),
  ADD KEY `flarum_discussions_last_posted_user_id_index` (`last_posted_user_id`),
  ADD KEY `flarum_discussions_created_at_index` (`created_at`),
  ADD KEY `flarum_discussions_user_id_index` (`user_id`),
  ADD KEY `flarum_discussions_comment_count_index` (`comment_count`),
  ADD KEY `flarum_discussions_participant_count_index` (`participant_count`),
  ADD KEY `flarum_discussions_hidden_at_index` (`hidden_at`),
  ADD KEY `flarum_discussions_is_locked_index` (`is_locked`),
  ADD KEY `flarum_discussions_is_sticky_created_at_index` (`is_sticky`,`created_at`);
ALTER TABLE `flarum_discussions` ADD FULLTEXT KEY `title` (`title`);

--
-- Indexes for table `flarum_discussion_tag`
--
ALTER TABLE `flarum_discussion_tag`
  ADD PRIMARY KEY (`discussion_id`,`tag_id`),
  ADD KEY `flarum_discussion_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `flarum_discussion_user`
--
ALTER TABLE `flarum_discussion_user`
  ADD PRIMARY KEY (`user_id`,`discussion_id`),
  ADD KEY `flarum_discussion_user_discussion_id_foreign` (`discussion_id`);

--
-- Indexes for table `flarum_email_tokens`
--
ALTER TABLE `flarum_email_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `flarum_email_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `flarum_flags`
--
ALTER TABLE `flarum_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flarum_flags_post_id_foreign` (`post_id`),
  ADD KEY `flarum_flags_user_id_foreign` (`user_id`),
  ADD KEY `flarum_flags_created_at_index` (`created_at`);

--
-- Indexes for table `flarum_groups`
--
ALTER TABLE `flarum_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flarum_group_permission`
--
ALTER TABLE `flarum_group_permission`
  ADD PRIMARY KEY (`group_id`,`permission`);

--
-- Indexes for table `flarum_group_user`
--
ALTER TABLE `flarum_group_user`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `flarum_group_user_group_id_foreign` (`group_id`);

--
-- Indexes for table `flarum_login_providers`
--
ALTER TABLE `flarum_login_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flarum_login_providers_provider_identifier_unique` (`provider`,`identifier`),
  ADD KEY `flarum_login_providers_user_id_foreign` (`user_id`);

--
-- Indexes for table `flarum_notifications`
--
ALTER TABLE `flarum_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flarum_notifications_from_user_id_foreign` (`from_user_id`),
  ADD KEY `flarum_notifications_user_id_index` (`user_id`);

--
-- Indexes for table `flarum_password_tokens`
--
ALTER TABLE `flarum_password_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `flarum_password_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `flarum_posts`
--
ALTER TABLE `flarum_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flarum_posts_discussion_id_number_unique` (`discussion_id`,`number`),
  ADD KEY `flarum_posts_edited_user_id_foreign` (`edited_user_id`),
  ADD KEY `flarum_posts_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `flarum_posts_discussion_id_number_index` (`discussion_id`,`number`),
  ADD KEY `flarum_posts_discussion_id_created_at_index` (`discussion_id`,`created_at`),
  ADD KEY `flarum_posts_user_id_created_at_index` (`user_id`,`created_at`);
ALTER TABLE `flarum_posts` ADD FULLTEXT KEY `content` (`content`);

--
-- Indexes for table `flarum_post_likes`
--
ALTER TABLE `flarum_post_likes`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `flarum_post_likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `flarum_post_mentions_post`
--
ALTER TABLE `flarum_post_mentions_post`
  ADD PRIMARY KEY (`post_id`,`mentions_post_id`),
  ADD KEY `flarum_post_mentions_post_mentions_post_id_foreign` (`mentions_post_id`);

--
-- Indexes for table `flarum_post_mentions_user`
--
ALTER TABLE `flarum_post_mentions_user`
  ADD PRIMARY KEY (`post_id`,`mentions_user_id`),
  ADD KEY `flarum_post_mentions_user_mentions_user_id_foreign` (`mentions_user_id`);

--
-- Indexes for table `flarum_post_user`
--
ALTER TABLE `flarum_post_user`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `flarum_post_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `flarum_registration_tokens`
--
ALTER TABLE `flarum_registration_tokens`
  ADD PRIMARY KEY (`token`);

--
-- Indexes for table `flarum_settings`
--
ALTER TABLE `flarum_settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `flarum_tags`
--
ALTER TABLE `flarum_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flarum_tags_slug_unique` (`slug`),
  ADD KEY `flarum_tags_parent_id_foreign` (`parent_id`),
  ADD KEY `flarum_tags_last_posted_user_id_foreign` (`last_posted_user_id`),
  ADD KEY `flarum_tags_last_posted_discussion_id_foreign` (`last_posted_discussion_id`);

--
-- Indexes for table `flarum_tag_user`
--
ALTER TABLE `flarum_tag_user`
  ADD PRIMARY KEY (`user_id`,`tag_id`),
  ADD KEY `flarum_tag_user_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `flarum_users`
--
ALTER TABLE `flarum_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flarum_users_username_unique` (`username`),
  ADD UNIQUE KEY `flarum_users_email_unique` (`email`),
  ADD KEY `flarum_users_joined_at_index` (`joined_at`),
  ADD KEY `flarum_users_last_seen_at_index` (`last_seen_at`),
  ADD KEY `flarum_users_discussion_count_index` (`discussion_count`),
  ADD KEY `flarum_users_comment_count_index` (`comment_count`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flarum_api_keys`
--
ALTER TABLE `flarum_api_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flarum_discussions`
--
ALTER TABLE `flarum_discussions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flarum_flags`
--
ALTER TABLE `flarum_flags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flarum_groups`
--
ALTER TABLE `flarum_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `flarum_login_providers`
--
ALTER TABLE `flarum_login_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flarum_notifications`
--
ALTER TABLE `flarum_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flarum_posts`
--
ALTER TABLE `flarum_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flarum_tags`
--
ALTER TABLE `flarum_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flarum_users`
--
ALTER TABLE `flarum_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flarum_access_tokens`
--
ALTER TABLE `flarum_access_tokens`
  ADD CONSTRAINT `flarum_access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_api_keys`
--
ALTER TABLE `flarum_api_keys`
  ADD CONSTRAINT `flarum_api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_discussions`
--
ALTER TABLE `flarum_discussions`
  ADD CONSTRAINT `flarum_discussions_first_post_id_foreign` FOREIGN KEY (`first_post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flarum_discussions_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flarum_discussions_last_post_id_foreign` FOREIGN KEY (`last_post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flarum_discussions_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flarum_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `flarum_discussion_tag`
--
ALTER TABLE `flarum_discussion_tag`
  ADD CONSTRAINT `flarum_discussion_tag_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `flarum_discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flarum_discussion_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `flarum_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_discussion_user`
--
ALTER TABLE `flarum_discussion_user`
  ADD CONSTRAINT `flarum_discussion_user_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `flarum_discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flarum_discussion_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_email_tokens`
--
ALTER TABLE `flarum_email_tokens`
  ADD CONSTRAINT `flarum_email_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_flags`
--
ALTER TABLE `flarum_flags`
  ADD CONSTRAINT `flarum_flags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flarum_flags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_group_permission`
--
ALTER TABLE `flarum_group_permission`
  ADD CONSTRAINT `flarum_group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `flarum_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_group_user`
--
ALTER TABLE `flarum_group_user`
  ADD CONSTRAINT `flarum_group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `flarum_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flarum_group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_login_providers`
--
ALTER TABLE `flarum_login_providers`
  ADD CONSTRAINT `flarum_login_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_notifications`
--
ALTER TABLE `flarum_notifications`
  ADD CONSTRAINT `flarum_notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flarum_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_password_tokens`
--
ALTER TABLE `flarum_password_tokens`
  ADD CONSTRAINT `flarum_password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_posts`
--
ALTER TABLE `flarum_posts`
  ADD CONSTRAINT `flarum_posts_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `flarum_discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flarum_posts_edited_user_id_foreign` FOREIGN KEY (`edited_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flarum_posts_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flarum_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `flarum_post_likes`
--
ALTER TABLE `flarum_post_likes`
  ADD CONSTRAINT `flarum_post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flarum_post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_post_mentions_post`
--
ALTER TABLE `flarum_post_mentions_post`
  ADD CONSTRAINT `flarum_post_mentions_post_mentions_post_id_foreign` FOREIGN KEY (`mentions_post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flarum_post_mentions_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_post_mentions_user`
--
ALTER TABLE `flarum_post_mentions_user`
  ADD CONSTRAINT `flarum_post_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flarum_post_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_post_user`
--
ALTER TABLE `flarum_post_user`
  ADD CONSTRAINT `flarum_post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flarum_post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flarum_tags`
--
ALTER TABLE `flarum_tags`
  ADD CONSTRAINT `flarum_tags_last_posted_discussion_id_foreign` FOREIGN KEY (`last_posted_discussion_id`) REFERENCES `flarum_discussions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flarum_tags_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flarum_tags_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `flarum_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `flarum_tag_user`
--
ALTER TABLE `flarum_tag_user`
  ADD CONSTRAINT `flarum_tag_user_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `flarum_tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flarum_tag_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
