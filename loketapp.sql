-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 19 Jul 2018 pada 06.42
-- Versi Server: 10.1.13-MariaDB
-- PHP Version: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loketapp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_07_14_060220_create_ms_locations_table', 1),
(5, '2018_07_14_060737_create_ms_ticket_types_table', 2),
(6, '2018_07_14_061915_create_ms_categories_table', 3),
(7, '2018_07_14_062641_create_ms_events_table', 4),
(8, '2018_07_14_065353_create_tr_event_tickets_table', 5),
(9, '2018_07_14_070823_create_ms_customers_table', 6),
(10, '2018_07_14_070925_create_tr_purchasing_tickets_table', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_categories`
--

CREATE TABLE `ms_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoryName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryCode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ms_categories`
--

INSERT INTO `ms_categories` (`id`, `categoryName`, `categoryCode`, `created_at`, `updated_at`) VALUES
(1, 'Concert', 'CRT', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_customers`
--

CREATE TABLE `ms_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ms_customers`
--

INSERT INTO `ms_customers` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad Mujadid', 'adid@gmail.com', '081081081', 'Jalan A. Yani', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_events`
--

CREATE TABLE `ms_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `eventName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventCode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventStartDate` datetime NOT NULL,
  `eventEndDate` datetime NOT NULL,
  `locationID` int(10) UNSIGNED NOT NULL,
  `categoryID` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ms_events`
--

INSERT INTO `ms_events` (`id`, `eventName`, `eventCode`, `eventStartDate`, `eventEndDate`, `locationID`, `categoryID`, `created_at`, `updated_at`) VALUES
(5, 'Galasesa 2018', 'GLS18', '2018-07-19 00:00:00', '2018-07-19 00:00:00', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_locations`
--

CREATE TABLE `ms_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `venue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ms_locations`
--

INSERT INTO `ms_locations` (`id`, `venue`, `address`, `city`, `province`, `country`, `created_at`, `updated_at`) VALUES
(1, 'Gor Ken Arok', 'Jalan Ki Ageng Gribig', 'Malang', 'Jawa Timur', 'Indonesia', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_ticket_types`
--

CREATE TABLE `ms_ticket_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticketTypeName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticketTypeCode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ms_ticket_types`
--

INSERT INTO `ms_ticket_types` (`id`, `ticketTypeName`, `ticketTypeCode`, `created_at`, `updated_at`) VALUES
(1, 'VIP', 'VIP', NULL, NULL),
(2, 'VVIP', 'VVIP', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_event_tickets`
--

CREATE TABLE `tr_event_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `eventID` int(10) UNSIGNED NOT NULL,
  `ticketTypeID` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tr_event_tickets`
--

INSERT INTO `tr_event_tickets` (`id`, `price`, `eventID`, `ticketTypeID`, `created_at`, `updated_at`) VALUES
(14, 150000, 5, 1, '2018-07-18 21:20:04', '2018-07-18 21:20:04'),
(15, 175000, 5, 2, '2018-07-18 21:20:05', '2018-07-18 21:20:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_purchasing_tickets`
--

CREATE TABLE `tr_purchasing_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `transCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventTicketID` int(10) UNSIGNED NOT NULL,
  `custID` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tr_purchasing_tickets`
--

INSERT INTO `tr_purchasing_tickets` (`id`, `transCode`, `eventTicketID`, `custID`, `quantity`, `created_at`, `updated_at`) VALUES
(36, 'GLS18.1.20180719', 14, 1, 5, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ms_categories`
--
ALTER TABLE `ms_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ms_categories_categorycode_unique` (`categoryCode`);

--
-- Indexes for table `ms_customers`
--
ALTER TABLE `ms_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `ms_events`
--
ALTER TABLE `ms_events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `eventCode` (`eventCode`),
  ADD KEY `ms_events_locationid_foreign` (`locationID`),
  ADD KEY `ms_events_categoryid_foreign` (`categoryID`);

--
-- Indexes for table `ms_locations`
--
ALTER TABLE `ms_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ms_ticket_types`
--
ALTER TABLE `ms_ticket_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ms_ticket_types_tickettypecode_unique` (`ticketTypeCode`);

--
-- Indexes for table `tr_event_tickets`
--
ALTER TABLE `tr_event_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tr_event_tickets_eventid_foreign` (`eventID`),
  ADD KEY `tr_event_tickets_tickettypeid_foreign` (`ticketTypeID`);

--
-- Indexes for table `tr_purchasing_tickets`
--
ALTER TABLE `tr_purchasing_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tr_purchasing_tickets_eventticketid_foreign` (`eventTicketID`),
  ADD KEY `tr_purchasing_tickets_custid_foreign` (`custID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ms_categories`
--
ALTER TABLE `ms_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ms_customers`
--
ALTER TABLE `ms_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ms_events`
--
ALTER TABLE `ms_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ms_locations`
--
ALTER TABLE `ms_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ms_ticket_types`
--
ALTER TABLE `ms_ticket_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tr_event_tickets`
--
ALTER TABLE `tr_event_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tr_purchasing_tickets`
--
ALTER TABLE `tr_purchasing_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ms_events`
--
ALTER TABLE `ms_events`
  ADD CONSTRAINT `ms_events_categoryid_foreign` FOREIGN KEY (`categoryID`) REFERENCES `ms_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ms_events_locationid_foreign` FOREIGN KEY (`locationID`) REFERENCES `ms_locations` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tr_event_tickets`
--
ALTER TABLE `tr_event_tickets`
  ADD CONSTRAINT `tr_event_tickets_eventid_foreign` FOREIGN KEY (`eventID`) REFERENCES `ms_events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tr_event_tickets_tickettypeid_foreign` FOREIGN KEY (`ticketTypeID`) REFERENCES `ms_ticket_types` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tr_purchasing_tickets`
--
ALTER TABLE `tr_purchasing_tickets`
  ADD CONSTRAINT `tr_purchasing_tickets_custid_foreign` FOREIGN KEY (`custID`) REFERENCES `ms_customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tr_purchasing_tickets_eventticketid_foreign` FOREIGN KEY (`eventTicketID`) REFERENCES `tr_event_tickets` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
