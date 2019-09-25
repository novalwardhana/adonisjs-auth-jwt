-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 25 Sep 2019 pada 08.40
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adonisjs_simple_crud`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '1503250034279_user', 1, '2019-09-24 07:43:23'),
(2, '1503250034280_token', 1, '2019-09-24 07:43:24'),
(3, '1569310757490_mahasiswas_schema', 1, '2019-09-24 07:43:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswas`
--

CREATE TABLE `mahasiswas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(80) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `prodi` varchar(80) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `tahun_masuk` int(4) DEFAULT NULL,
  `tahun_lulus` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswas`
--

INSERT INTO `mahasiswas` (`id`, `nama`, `nim`, `prodi`, `alamat`, `tahun_masuk`, `tahun_lulus`, `created_at`, `updated_at`) VALUES
(1, 'Novalita', '11305141030', 'Ilmu Komputer', 'Bantul', 2011, NULL, NULL, NULL),
(2, 'Novan Arif Kardianto', '12305141041', 'Pendidikan Luar Sekolah', 'Nglipar Gunung Gambar', 2012, NULL, '2019-09-24 15:03:20', '2019-09-24 15:16:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `token`, `type`, `is_revoked`, `created_at`, `updated_at`) VALUES
(1, 1, '5070bac5-9d84-48ce-a60a-14e401b180c3', 'jwt_refresh_token', 0, '2019-09-25 13:13:44', '2019-09-25 13:13:44'),
(2, 1, '8810b690-4b3f-41f5-9428-f88a51e5d273', 'jwt_refresh_token', 0, '2019-09-25 13:14:02', '2019-09-25 13:14:02'),
(3, 1, '4d67ea6c-7050-4ed4-8ab6-33549320b743', 'jwt_refresh_token', 0, '2019-09-25 13:14:03', '2019-09-25 13:14:03'),
(4, 1, '25550d35-6a22-47ca-bbaf-75c03cb9bda6', 'jwt_refresh_token', 0, '2019-09-25 13:16:20', '2019-09-25 13:16:20'),
(5, 1, '6cf00946-cb72-4903-8c8b-7b6a1b5efe10', 'jwt_refresh_token', 0, '2019-09-25 13:16:29', '2019-09-25 13:16:29'),
(6, 1, '0108b0da-97fc-493d-8c5a-0375b4a43314', 'jwt_refresh_token', 0, '2019-09-25 13:16:59', '2019-09-25 13:16:59'),
(7, 1, '5f485c17-c929-48b2-8953-4b86dd301aa0', 'jwt_refresh_token', 0, '2019-09-25 13:17:17', '2019-09-25 13:17:17'),
(8, 1, '4bc1b0ea-e191-437a-8a36-f2470c323c20', 'jwt_refresh_token', 0, '2019-09-25 13:17:37', '2019-09-25 13:17:37'),
(9, 1, 'c2ae12c3-efb2-44dd-8e31-7819f97d14c0', 'jwt_refresh_token', 0, '2019-09-25 13:17:55', '2019-09-25 13:17:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'novalita', 'novalita.k.wardhana@gmail.com', '$2a$10$jot7EnOw3qrlAM1fYIGje.1u9Al.b9eclaNCAzg8hWdbiFk6ppzh.', '2019-09-25 11:23:43', '2019-09-25 11:23:43');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mahasiswas_nim_unique` (`nim`);

--
-- Indeks untuk tabel `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`),
  ADD KEY `tokens_user_id_foreign` (`user_id`),
  ADD KEY `tokens_token_index` (`token`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `mahasiswas`
--
ALTER TABLE `mahasiswas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
