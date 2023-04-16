-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Apr 2023 pada 16.08
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pt_sejahtera`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bahan`
--

CREATE TABLE `tb_bahan` (
  `kode_bahan` varchar(15) NOT NULL,
  `nama_bahan` varchar(50) NOT NULL,
  `baik_digunakan` date NOT NULL,
  `takaran` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(15) NOT NULL,
  `nama_barang` text NOT NULL,
  `kategori` text NOT NULL,
  `kode_bahan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_gudang_bahan`
--

CREATE TABLE `tb_gudang_bahan` (
  `kode_gudang_bahan` varchar(15) NOT NULL,
  `kode_bahan` varchar(15) NOT NULL,
  `jumlah` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_gudang_barang`
--

CREATE TABLE `tb_gudang_barang` (
  `kode_gudang_barang` varchar(15) NOT NULL,
  `kode_barang` varchar(15) NOT NULL,
  `kode_produksi` varchar(15) NOT NULL,
  `jumlah` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_outlet`
--

CREATE TABLE `tb_outlet` (
  `kode_outlet` varchar(15) NOT NULL,
  `lokasi` varchar(40) NOT NULL,
  `jumlah_stock` varchar(20) NOT NULL,
  `batas_stock` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id_pegawai` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `nama_pegawai` text NOT NULL,
  `jabatan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengiriman`
--

CREATE TABLE `tb_pengiriman` (
  `kode_pengiriman` varchar(15) NOT NULL,
  `kode_barang` varchar(15) NOT NULL,
  `kode_outlet` varchar(15) NOT NULL,
  `biaya_pengiriman` varchar(15) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_peralatan`
--

CREATE TABLE `tb_peralatan` (
  `kode_alat` varchar(15) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `kondisi` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_produksi`
--

CREATE TABLE `tb_produksi` (
  `kode_produksi` varchar(15) NOT NULL,
  `kode_barang` varchar(15) NOT NULL,
  `kode_alat` varchar(15) NOT NULL,
  `id_pegawai` varchar(20) NOT NULL,
  `jumlah_produksi` varchar(20) NOT NULL,
  `biaya_produksi` varchar(20) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `tb_bahan`
--
ALTER TABLE `tb_bahan`
  ADD PRIMARY KEY (`kode_bahan`);

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `kode_bahan` (`kode_bahan`);

--
-- Indeks untuk tabel `tb_gudang_bahan`
--
ALTER TABLE `tb_gudang_bahan`
  ADD PRIMARY KEY (`kode_gudang_bahan`),
  ADD KEY `kode_bahan` (`kode_bahan`);

--
-- Indeks untuk tabel `tb_gudang_barang`
--
ALTER TABLE `tb_gudang_barang`
  ADD PRIMARY KEY (`kode_gudang_barang`),
  ADD KEY `kode_barang` (`kode_barang`,`kode_produksi`),
  ADD KEY `kode_produksi` (`kode_produksi`);

--
-- Indeks untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  ADD PRIMARY KEY (`kode_outlet`);

--
-- Indeks untuk tabel `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `username` (`username`);

--
-- Indeks untuk tabel `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD PRIMARY KEY (`kode_pengiriman`),
  ADD KEY `kode_barang` (`kode_barang`,`kode_outlet`),
  ADD KEY `kode_outlet` (`kode_outlet`);

--
-- Indeks untuk tabel `tb_peralatan`
--
ALTER TABLE `tb_peralatan`
  ADD PRIMARY KEY (`kode_alat`);

--
-- Indeks untuk tabel `tb_produksi`
--
ALTER TABLE `tb_produksi`
  ADD PRIMARY KEY (`kode_produksi`),
  ADD KEY `kode_barang` (`kode_barang`,`kode_alat`),
  ADD KEY `kode_alat` (`kode_alat`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`kode_bahan`) REFERENCES `tb_bahan` (`kode_bahan`);

--
-- Ketidakleluasaan untuk tabel `tb_gudang_bahan`
--
ALTER TABLE `tb_gudang_bahan`
  ADD CONSTRAINT `tb_gudang_bahan_ibfk_1` FOREIGN KEY (`kode_bahan`) REFERENCES `tb_bahan` (`kode_bahan`);

--
-- Ketidakleluasaan untuk tabel `tb_gudang_barang`
--
ALTER TABLE `tb_gudang_barang`
  ADD CONSTRAINT `tb_gudang_barang_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`),
  ADD CONSTRAINT `tb_gudang_barang_ibfk_2` FOREIGN KEY (`kode_produksi`) REFERENCES `tb_produksi` (`kode_produksi`);

--
-- Ketidakleluasaan untuk tabel `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD CONSTRAINT `tb_pegawai_ibfk_1` FOREIGN KEY (`username`) REFERENCES `tb_admin` (`username`);

--
-- Ketidakleluasaan untuk tabel `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD CONSTRAINT `tb_pengiriman_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`),
  ADD CONSTRAINT `tb_pengiriman_ibfk_2` FOREIGN KEY (`kode_outlet`) REFERENCES `tb_outlet` (`kode_outlet`);

--
-- Ketidakleluasaan untuk tabel `tb_produksi`
--
ALTER TABLE `tb_produksi`
  ADD CONSTRAINT `tb_produksi_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`),
  ADD CONSTRAINT `tb_produksi_ibfk_2` FOREIGN KEY (`kode_alat`) REFERENCES `tb_peralatan` (`kode_alat`),
  ADD CONSTRAINT `tb_produksi_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `tb_pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
