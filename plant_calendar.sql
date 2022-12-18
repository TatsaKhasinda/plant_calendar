-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 18 Des 2022 pada 11.34
-- Versi server: 5.7.33
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plant_calendar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `plant_data`
--

CREATE TABLE `plant_data` (
  `id` int(11) NOT NULL,
  `plant_code` varchar(10) NOT NULL,
  `plant_name` varchar(30) NOT NULL,
  `pupuk_name` varchar(30) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `penyiraman` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `plant_data`
--

INSERT INTO `plant_data` (`id`, `plant_code`, `plant_name`, `pupuk_name`, `gambar`, `penyiraman`) VALUES
(1, 'cbi', 'Cabai', 'Urea', 'https://www.pngall.com/wp-content/uploads/8/Chilli-Pepper.png', 'Penyiraman cabai ini idealnya disiram pada pagi atau sore hari.'),
(2, 'mwr', 'Mawar Merah', 'Urea', 'https://i.pinimg.com/originals/e3/55/12/e355128539564e6b4c3ad9fe9a6e81b8.png', 'Menyiram bunga mawar dapat dilakukan pada pagi dan sore hari.\r\n'),
(3, 'wtl', 'Wortel', 'Pupuk Organik', 'https://png.pngtree.com/element_origin_min_pic/16/05/30/22574c51aecbcf9.jpg', 'Lakukan penyiraman setiap hari di sore hari.'),
(4, 'swi', 'Sawi', 'Pupuk NPK', 'https://imgx.sonora.id/crop/0x0:0x0/x/photo/2022/09/07/2-sawi-hijaujpeg-20220907032113.jpeg', 'iramlah pagi dan sore pada musim kemarau dan tidak perlu saat musim penghujan. Jangan membuat tanaman sawi tergenang air agar akarnya tidak membusuk.'),
(5, 'jgng', 'Jagung', 'Urea', 'https://cf.shopee.co.id/file/52605b13ed2da09ff1520288724dd1a4', 'Setiap hari satu kali tanaman jagung disiram selama satu minggu. Setelah istirahat, penyiraman kembali dilakukan setelah minggu ke-4. '),
(6, 'tmn', 'Timun', 'Urea', 'https://asset-a.grid.id/crop/0x0:0x0/945x630/photo/2021/06/04/cucumber-vegetable-isolated-whit-20210604125851.jpg', 'Penyiraman dilakukan rutin setiap hari sampai umur tanaman 2-3 minggu setelah pindah tanam, pada umur selanjutnya penyiraman dapat dilakukan 2-3 hari sekali.'),
(7, 'agrk', 'Anggrek', 'Pupuk Dekastar', 'https://res.cloudinary.com/ruparupa-com/image/upload/w_360,h_360,f_auto,q_auto/f_auto,q_auto:eco/v1610600691/Products/10138238_1.jpg', 'Siram seperlunya, anggrek harus disiram hanya ketika akan mulai kekeringan. '),
(8, 'tmt', 'Tomat', 'Pupuk NPK', 'https://media.beritagar.id/2018-09/62e5fd3abb4fca899faee891c45376245b182d46.jpg', 'Penyiraman dilakukan 2 kali sehari, yaitu pagi dan sore hari.'),
(9, 'brkl', 'Brokoli', 'Pupuk NPK', 'http://assets.kompasiana.com/items/album/2018/09/13/khasiat-dan-manfaat-menakjubkan-sayur-brokoli-untuk-kesehatan-tubuh-5b9a6c6112ae947f7e4d1443.jpg', 'Penyiraman dilakukan tiap hari sampai tanaman brokoli tumbuh normal (lilir), kemudian diulang sesuai kebutuhan.'),
(10, 'bcs', 'Buncis', 'Pupuk Organik', 'https://gosayur.com/wp-content/uploads/2020/05/buncis-1.jpg', 'Pastikan untuk menyiram buncis setiap dua kali sehari pada pagi dan sore hari dengan air secukupnya.'),
(11, 'kkng', 'Kangkung', 'Pupuk NPK', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//101/MTA-11990683/hypermart_daun-kangkung-ikat-150-gr_full01.jpg', 'Kangkung membutuhkan banyak air untuk tumbuh, sehingga harus rutin menyiraminya. Pada musim kering perlu melakukan penyiraman secara rutin setiap pagi dan sore hari.'),
(12, 'sld', 'Selada', 'Pupuk Organik', 'https://images.tokopedia.net/img/cache/700/product-1/2020/4/15/6888792/6888792_24cf58c1-b2a6-4c3b-a5a1-d8c3e41f8dac_450_450.jpg', 'Penyiraman dilakukan sesuai dengan cuaca yang ada. Jika tidak ada hujan lakukan 2 kali penyiraman dalam satu hari setiap pagi dan sore.');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `plant_data`
--
ALTER TABLE `plant_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `plant_data`
--
ALTER TABLE `plant_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
