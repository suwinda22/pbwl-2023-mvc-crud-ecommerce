-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Bulan Mei 2023 pada 18.27
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbecommerce_si3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kat_id` tinyint(3) NOT NULL,
  `kat_nama` varchar(50) NOT NULL,
  `kat_keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`kat_id`, `kat_nama`, `kat_keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Brownies Kukus', 'Aneka macam brownies kukus.', '2023-05-29 15:31:41', NULL),
(2, 'Brownies Panggang', 'Aneka macam brownies panggang.', '2023-05-29 15:32:03', NULL),
(3, 'Brownies Kering', 'Aneka macam brownies kering.', '2023-05-29 15:32:24', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_keranjang`
--

CREATE TABLE `tb_keranjang` (
  `ker_id` int(11) NOT NULL,
  `ker_id_user` int(11) NOT NULL,
  `ker_id_produk` int(11) NOT NULL,
  `ker_harga` double DEFAULT NULL,
  `ker_jml` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_keranjang`
--

INSERT INTO `tb_keranjang` (`ker_id`, `ker_id_user`, `ker_id_produk`, `ker_harga`, `ker_jml`) VALUES
(1, 1, 1, 50000, 1),
(2, 2, 2, 55000, 2),
(3, 3, 3, 60000, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_order`
--

CREATE TABLE `tb_order` (
  `order_id` int(11) NOT NULL,
  `order_id_user` int(11) NOT NULL,
  `order_tgl` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_kode` varchar(50) NOT NULL,
  `order_ttl` double DEFAULT NULL,
  `order_kurir` varchar(100) DEFAULT NULL,
  `order_ongkir` int(11) DEFAULT 0,
  `order_byr_deadline` datetime DEFAULT NULL,
  `order_batal` tinyint(1) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_order`
--

INSERT INTO `tb_order` (`order_id`, `order_id_user`, `order_tgl`, `order_kode`, `order_ttl`, `order_kurir`, `order_ongkir`, `order_byr_deadline`, `order_batal`, `updated_at`) VALUES
(1, 1, '2023-05-29 15:42:45', '101', 23, 'JNT', 0, '2023-05-01 00:00:00', NULL, NULL),
(2, 2, '2023-05-29 15:43:27', '102', 25, 'Gosend', 15000, '2023-05-26 00:00:00', NULL, NULL),
(3, 3, '2023-05-29 15:44:04', '3', 26, 'GrabInstan', 10000, '2023-05-27 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_order_detail`
--

CREATE TABLE `tb_order_detail` (
  `detail_id_order` int(11) NOT NULL,
  `detail_id_produk` int(11) NOT NULL,
  `detail_harga` double DEFAULT NULL,
  `detail_jml` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_order_detail`
--

INSERT INTO `tb_order_detail` (`detail_id_order`, `detail_id_produk`, `detail_harga`, `detail_jml`) VALUES
(1, 1, 50000, 1),
(2, 2, 55000, 2),
(3, 3, 60000, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_produk`
--

CREATE TABLE `tb_produk` (
  `produk_id` int(11) NOT NULL,
  `produk_id_kat` tinyint(3) NOT NULL,
  `produk_id_user` int(11) NOT NULL,
  `produk_kode` varchar(50) NOT NULL,
  `produk_nama` varchar(256) NOT NULL,
  `produk_hrg` double DEFAULT 0,
  `produk_keterangan` text DEFAULT NULL,
  `produk_stock` int(11) DEFAULT 0,
  `produk_photo` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_produk`
--

INSERT INTO `tb_produk` (`produk_id`, `produk_id_kat`, `produk_id_user`, `produk_kode`, `produk_nama`, `produk_hrg`, `produk_keterangan`, `produk_stock`, `produk_photo`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '101', 'Brownies Kukus', 50000, 'Berbagai varian', 6, 'bronieskukus.jpg', '2023-05-29 15:37:25', NULL),
(2, 2, 2, '102', 'Brownies panggang', 55000, 'Berbagai Variian Rasa.', 3, 'browniespanggang.jpg', '2023-05-29 15:38:19', NULL),
(3, 3, 3, '103', 'Brownies Kering', 60000, 'Berbagai Variian Rasa.', 7, 'brownieskering.jpg', '2023-05-29 15:40:27', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_users`
--

CREATE TABLE `tb_users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_nama` varchar(100) DEFAULT NULL,
  `user_alamat` text DEFAULT NULL,
  `user_hp` varchar(25) DEFAULT NULL,
  `user_pos` varchar(5) DEFAULT NULL,
  `user_role` tinyint(2) DEFAULT NULL,
  `user_aktif` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_users`
--

INSERT INTO `tb_users` (`user_id`, `user_email`, `user_password`, `user_nama`, `user_alamat`, `user_hp`, `user_pos`, `user_role`, `user_aktif`, `created_at`, `updated_at`) VALUES
(1, 'suwinda0610@gmail.com', 'winda123', 'Suwinda Aulansari', 'Jalan Merdeka', '0812-2345-6789', '21155', 0, 1, '2023-05-29 15:33:42', NULL),
(2, 'fauziakhaira@gmail.com', 'fau123', 'Fauzia Khaira', 'Jalan Sutomo', '0897-9876-3456', '12345', 1, 1, '2023-05-29 15:35:05', NULL),
(3, 'ramdiee@gmail.com', 'ramdiee', 'Ramdii', 'Jalan Proklamasi', '0876-5687-3456', '24567', 1, 0, '2023-05-29 15:36:02', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kat_id`);

--
-- Indeks untuk tabel `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  ADD PRIMARY KEY (`ker_id`),
  ADD KEY `ker_id_user` (`ker_id_user`),
  ADD KEY `ker_id_produk` (`ker_id_produk`);

--
-- Indeks untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_kode` (`order_kode`),
  ADD KEY `order_id_user` (`order_id_user`);

--
-- Indeks untuk tabel `tb_order_detail`
--
ALTER TABLE `tb_order_detail`
  ADD KEY `detail_id_order` (`detail_id_order`),
  ADD KEY `detail_id_produk` (`detail_id_produk`);

--
-- Indeks untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`produk_id`),
  ADD UNIQUE KEY `produk_kode` (`produk_kode`),
  ADD KEY `produk_id_kat` (`produk_id_kat`),
  ADD KEY `produk_id_user` (`produk_id_user`);

--
-- Indeks untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `kat_id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  MODIFY `ker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `produk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_keranjang`
--
ALTER TABLE `tb_keranjang`
  ADD CONSTRAINT `tb_keranjang_ibfk_1` FOREIGN KEY (`ker_id_user`) REFERENCES `tb_users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_keranjang_ibfk_2` FOREIGN KEY (`ker_id_produk`) REFERENCES `tb_produk` (`produk_id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `tb_order_ibfk_1` FOREIGN KEY (`order_id_user`) REFERENCES `tb_users` (`user_id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_order_detail`
--
ALTER TABLE `tb_order_detail`
  ADD CONSTRAINT `tb_order_detail_ibfk_1` FOREIGN KEY (`detail_id_order`) REFERENCES `tb_order` (`order_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_order_detail_ibfk_2` FOREIGN KEY (`detail_id_produk`) REFERENCES `tb_produk` (`produk_id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD CONSTRAINT `tb_produk_ibfk_1` FOREIGN KEY (`produk_id_kat`) REFERENCES `tb_kategori` (`kat_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_produk_ibfk_2` FOREIGN KEY (`produk_id_user`) REFERENCES `tb_users` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
