-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table mebel_kampus.tbl_carts
CREATE TABLE IF NOT EXISTS `tbl_carts` (
  `id_cart` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_cart`),
  KEY `id_user` (`id_user`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `tbl_carts_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_users` (`id_user`),
  CONSTRAINT `tbl_carts_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `tbl_products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_carts: ~0 rows (approximately)
INSERT INTO `tbl_carts` (`id_cart`, `id_user`, `id_product`, `quantity`, `added_at`) VALUES
	(14, 1, 3, 3, '2024-07-14 13:03:39'),
	(15, 1, 1, 1, '2024-07-14 13:33:12'),
	(16, 1, 6, 1, '2024-07-14 13:33:14');

-- Dumping structure for table mebel_kampus.tbl_categorys
CREATE TABLE IF NOT EXISTS `tbl_categorys` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `categorys` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `categorys` (`categorys`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_categorys: ~5 rows (approximately)
INSERT INTO `tbl_categorys` (`id_category`, `category_name`, `categorys`, `image`, `created_at`) VALUES
	(1, 'Meja', 'M001', '/image/1719978409156.png', '2024-07-03 03:46:49'),
	(2, 'Kursi', 'K001', '/image/1719982137033.png', '2024-07-03 04:48:57'),
	(3, 'Lemari', 'L001', '/image/1719982394024.jpg', '2024-07-03 04:53:14'),
	(4, 'Sofa', 'S001', '/image/1719985012707.png', '2024-07-03 05:36:52'),
	(5, 'Rak', 'R001', '/image/1720442813181.png', '2024-07-08 12:46:53');

-- Dumping structure for table mebel_kampus.tbl_comment_products
CREATE TABLE IF NOT EXISTS `tbl_comment_products` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_comment`),
  KEY `id_user` (`id_user`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `tbl_comment_products_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_users` (`id_user`),
  CONSTRAINT `tbl_comment_products_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `tbl_products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_comment_products: ~0 rows (approximately)

-- Dumping structure for table mebel_kampus.tbl_detail_transaction
CREATE TABLE IF NOT EXISTS `tbl_detail_transaction` (
  `id_detail` int(11) NOT NULL AUTO_INCREMENT,
  `no_order` varchar(50) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_detail_transaction: ~8 rows (approximately)
INSERT INTO `tbl_detail_transaction` (`id_detail`, `no_order`, `id_product`, `quantity`) VALUES
	(1, 'MF-MVBOU0085', 1, 1),
	(2, 'MF-MVBOU0085', 2, 1),
	(3, 'MF-MVBOU0085', 3, 1),
	(4, 'MF-MVBOU0085', 4, 5),
	(5, 'MF-UKZWN4186', 1, 1),
	(6, 'MF-UKZWN4186', 2, 4),
	(7, 'MF-SONLU9939', 1, 3),
	(8, 'MF-CTEPW4854', 3, 1);

-- Dumping structure for table mebel_kampus.tbl_image_products
CREATE TABLE IF NOT EXISTS `tbl_image_products` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_image_products: ~25 rows (approximately)
INSERT INTO `tbl_image_products` (`id_image`, `id_product`, `keterangan`, `image`) VALUES
	(1, 1, 'Foto 1', '/image/1719979090725.png'),
	(2, 1, 'Foto 2', '/image/1719979098753.png'),
	(3, 1, 'Foto 3', '/image/1719979104423.png'),
	(4, 2, 'Foto 1', '/image/1719982214010.png'),
	(5, 2, 'Foto 2', '/image/1719982220254.png'),
	(6, 2, 'Foto 3', '/image/1719982224822.png'),
	(7, 2, 'Foto 4', '/image/1719982229550.png'),
	(8, 3, 'Foto 1', '/image/1719982512560.png'),
	(9, 3, 'Foto 2', '/image/1719982518365.png'),
	(10, 3, 'Foto 3', '/image/1719982523108.png'),
	(11, 3, 'Foto 4', '/image/1719982530073.png'),
	(12, 4, 'Foto 1', '/image/1719985079454.png'),
	(13, 4, 'Foto 2', '/image/1719985085176.png'),
	(14, 4, 'Foto 3', '/image/1719985089265.png'),
	(15, 5, 'Foto 1', '/image/1720440851656.png'),
	(16, 5, 'Foto 2', '/image/1720440859279.png'),
	(17, 5, 'Foto 3', '/image/1720440866802.png'),
	(18, 6, 'Foto 1', '/image/1720442645366.png'),
	(19, 6, 'Foto 2', '/image/1720442650641.png'),
	(20, 6, 'Foto 3', '/image/1720442654950.png'),
	(21, 6, 'Foto 4', '/image/1720442660900.png'),
	(22, 7, 'Foto 1', '/image/1720443004948.png'),
	(23, 7, 'Foto 2', '/image/1720443018843.png'),
	(24, 7, 'Foto 3', '/image/1720443024642.png'),
	(25, 7, 'Foto 4', '/image/1720443029134.png'),
	(26, 1, 'Foto 4', '/image/1720789379061.png');

-- Dumping structure for table mebel_kampus.tbl_products
CREATE TABLE IF NOT EXISTS `tbl_products` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_product`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `tbl_products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `tbl_categorys` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_products: ~7 rows (approximately)
INSERT INTO `tbl_products` (`id_product`, `product_name`, `description`, `price`, `stock`, `image`, `id_category`, `created_at`) VALUES
	(1, 'MEJA MAKAN LISABO', '<p>Cantik dalam kesederhanaannya dengan tampilan kayu yang hangat dan alami. Konstruksi inovatif ini sangat kokoh dan hanya dengan beberapa klik saja, meja sudah terpasang dan siap digunakan.</p><p><br></p><p><strong>Bahan</strong></p><p><strong>﻿Panel atas:</strong>&nbsp;Veneer kayu ash, Veneer kayu birch, Kayu birch solid, Kayu lapis birch, Particleboard, Lacquer akrilik bening berwarna, Fibreboard</p><p><strong>Dasar kaki:</strong>&nbsp;Kayu birch solid, Lacquer akrilik bening berwarna</p>', 3999999.00, 4, '/image/1719978711433.png', 1, '2024-07-03 03:51:51'),
	(2, 'KURSI TRANSPARAN TOBIAS', '<p>Kursi transparan yang merefleksikan sekitarnya. Kursi tersebut meningkatkan warna ruangan dan terlihat seperti mengapung. Karena ada fleksibilitas pada dudukannya, Anda akan terasa seperti mengapung juga.</p><p><br></p><p><strong>Bahan</strong></p><p><strong>﻿Rangka kaki:</strong>&nbsp;Baja, Dilapisi krom</p><p><strong>Kerangka tempat duduk:</strong>&nbsp;Plastik polikarbonat</p><p><strong>Kaki:</strong>&nbsp;Plastik polipropilena</p><p><strong>Mur:</strong>&nbsp;Seng, Dilapisi krom</p><p><strong>Bumper/ Cincin penutup:</strong>&nbsp;Karet sintetis</p>', 999999.00, 5, '/image/1719982189411.png', 2, '2024-07-03 04:49:49'),
	(3, 'LEMARI BAJU SONGESAND', '<p>Desain klasik dengan pintu berpanel selalu mengikuti perkembangan zaman. Gunakan cermin tinggi sehingga Anda dapat melihat pakaian dari atas hingga bawah. Bisa dikaitkan ke dinding juga.</p><p><br></p><p><strong>Bahan</strong></p><p><strong>﻿Panel atas/ Panel samping:</strong>&nbsp;Particleboard, Kertas foil, Tepi plastik</p><p><strong>Panel bawah/ Partisi/ Lis bawah belakang/ Rel penyokong, belakang/ Papan rak:</strong>&nbsp;Particleboard, Kertas foil</p><p><strong>Panel belakang:</strong>&nbsp;Fibreboard</p><p><strong>Rangka pintu:</strong>&nbsp;Fibreboard, Kertas foil, Tepi plastik</p><p><strong>Panel pintu/ Lis bawah depan/ Rel penyokong, depan:</strong>&nbsp;Fibreboard, Kertas foil</p><p><strong>Cermin:</strong>&nbsp;Kaca, Foil plastik, Foil plastik</p>', 3999999.00, 1, '/image/1719982490071.png', 3, '2024-07-03 04:54:50'),
	(4, 'SOFA ESSEBODA', '<p>Mungkin ini sofa terempuk yang pernah Anda miliki! Seri ESSEBODA memanjakan Anda dengan segala hal mulai dari kenyamanan sofa, kursi yang dalam dan sandaran tinggi hingga desain klasik, detail halus, dan banyak kemungkinan.</p><p><br></p><p><strong>Bahan</strong></p><p><strong>Kain:</strong>&nbsp;78% katun, 22 % poliester (100% daur ulang)</p><p><strong>Tali:</strong>&nbsp;100% poliester</p><p><strong>Klip:</strong>&nbsp;Plastik polipropilena</p><p><strong>Rangka tempat duduk:</strong>&nbsp;Kayu veneer dilaminasi, Kayu lapis, Karton (100% didaur ulang), Busa poliuretana 30 kg/meter kubik, Particleboard</p><p><strong>Rangka belakang:</strong>&nbsp;Kayu lapis, Particleboard, Fibreboard, Karton (100% didaur ulang), Busa poliuretana 30 kg/meter kubik, Busa poliuretana 25 kg/meter kubik, Kayu veneer dilaminasi</p><p><strong>Sandaran tangan:</strong>&nbsp;Kayu lapis, Particleboard, Fibreboard, Busa poliuretana 30 kg/meter kubik, Kayu veneer dilaminasi</p><p><strong>Bantalan tempat duduk:</strong>&nbsp;Busa poliuretana elastis tinggi (busa dingin) 35 kg/meter kubik, Busa poliuretana 30 kg/meter kubik, Alas fern, Bola serat poliester</p><p><strong>Unit kantong pegas:</strong>&nbsp;Baja</p>', 5999999.00, 5, '/image/1719985054545.png', 4, '2024-07-03 05:37:34'),
	(5, 'KURSI TEODORES', '<p>Kursi nyaman yang kokoh, namun ringan dan dapat ditumpuk juga. Pertandingan yang mudah dengan berbagai meja dan gaya yang ingin membuat Anda senang, entah di ruang makan, di pintu masuk atau di samping tempat tidur Anda.</p><p><br></p><p><strong>Bahan</strong></p><p><strong>﻿Rangka kaki/ Rel silang/ Batang bulat:</strong>&nbsp;Baja, Dilapisi serbuk epoksi/poliester</p><p><strong>Tempat duduk/ Sandaran:</strong>&nbsp;Plastik polipropilena</p>', 450000.00, 5, '/image/1720440820999.png', 2, '2024-07-08 12:13:41'),
	(6, 'MEJA MAKAN GRÅSALA', '<p>Meja tahan lama untuk 4 orang dengan desain yang rapi namun kokoh, cocok untuk makan, bekerja, menghibur atau membuat kerajinan. Padukan dengan kursi GRÅSALA untuk menciptakan tampilan yang ramah dan serasi.</p><p><br></p><p><strong>Bahan</strong></p><p><strong>Daun meja</strong></p><p>Particleboard, Foil melamin, Tepi plastik, Tepi plastik, Foil melamin</p><p><strong>Rangka bawah untuk daun meja﻿</strong></p><p>Baja, Dilapisi serbuk epoksi/poliester</p>', 1299000.00, 5, '/image/1720442624994.png', 1, '2024-07-08 12:43:44'),
	(7, 'RAK TV KAYU KALLAX', '<p>Bangku TV yang sempurna dengan banyak ruang untuk peralatan dan aksesori. Jika Anda menginginkan penyimpanan tertutup, tempatkan kotak atau sisipan di kompartemen bawah. Bagian belakang yang terbuka memudahkan pengelolaan kabel!</p><p><br></p><p><strong>Bahan</strong></p><p>Particleboard, Fibreboard, Cat akrilik, Kertas foil, Pengisian kertas struktur sarang lebah (100% didaur ulang), Tepi plastik, Tepi plastik, Tepi plastik</p>', 1699000.00, 5, '/image/1720442984851.png', 5, '2024-07-08 12:49:44');

-- Dumping structure for table mebel_kampus.tbl_rating_products
CREATE TABLE IF NOT EXISTS `tbl_rating_products` (
  `id_rating` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_rating`),
  KEY `id_user` (`id_user`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `tbl_rating_products_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_users` (`id_user`),
  CONSTRAINT `tbl_rating_products_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `tbl_products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_rating_products: ~0 rows (approximately)

-- Dumping structure for table mebel_kampus.tbl_transaction
CREATE TABLE IF NOT EXISTS `tbl_transaction` (
  `id_transaction` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `no_order` varchar(50) NOT NULL DEFAULT '',
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `nama_penerima` varchar(50) NOT NULL DEFAULT '',
  `tlp_penerima` varchar(50) NOT NULL DEFAULT '',
  `alamat_penerima` varchar(50) NOT NULL DEFAULT '',
  `ongkir` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `status_bayar` int(11) NOT NULL,
  `status_order` int(11) NOT NULL,
  `no_resi` varchar(50) NOT NULL DEFAULT '',
  `image_bayar` varchar(50) DEFAULT NULL,
  `atas_nama` varchar(50) DEFAULT NULL,
  `nama_bank` varchar(50) DEFAULT NULL,
  `no_rekening` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_transaction`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_transaction: ~4 rows (approximately)
INSERT INTO `tbl_transaction` (`id_transaction`, `id_user`, `no_order`, `order_date`, `nama_penerima`, `tlp_penerima`, `alamat_penerima`, `ongkir`, `grand_total`, `total_bayar`, `status_bayar`, `status_order`, `no_resi`, `image_bayar`, `atas_nama`, `nama_bank`, `no_rekening`) VALUES
	(1, 1, 'MF-MVBOU0085', '2024-07-08 12:10:45', 'Farrel Ardian', '089603450314', 'Jl sriti no 13', 100000, 38999992, 39099992, 0, 0, 'TESTRESI', '/image/1720434791029.jpg', 'Farrel Ardian', 'Mandiri', '1390023268547'),
	(2, 1, 'MF-UKZWN4186', '2024-07-12 22:17:52', 'Farrel Ardian', '089603450314', 'Jl sriti no 13', 500000, 7999995, 8499995, 1, 1, '', '/image/1720822695251.jpg', 'Farrel Ardian', 'Mandiri', '130023268547'),
	(3, 3, 'MF-SONLU9939', '2024-07-12 13:05:11', 'Farrel Ardian', '089603450314', 'Jl sriti no 13', 500000, 11999997, 12499997, 1, 3, 'TESTRESI123', '/image/1720789218319.jpg', 'Farrel Ardian', 'Mandiri', '130023268547'),
	(4, 1, 'MF-CTEPW4854', '2024-07-12 22:18:51', 'Farrel Ardian', '089603450314', 'Jl sriti no 13', 500000, 3999999, 4499999, 1, 1, '', '/image/1720822731359.jpg', 'Farrel Ardian', 'Mandiri', '130023268547');

-- Dumping structure for table mebel_kampus.tbl_users
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `role` enum('admin','user','superAdmin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_users: ~2 rows (approximately)
INSERT INTO `tbl_users` (`id_user`, `username`, `email`, `password`, `image`, `no_hp`, `alamat`, `role`, `created_at`) VALUES
	(1, 'Farrel Ardian', 'farrel@gmail.com', '$2a$10$GQmdKR3GNa3Yzhor11vyAeKkg.1TosYyWlte65eYrMxNt89TUsmNm', '/image/1719981071142.png', '089603450314', 'Jl sriti no 13', 'admin', '2024-07-03 03:43:22'),
	(2, 'Farrel Ardian', 'farrelardian123@gmail.com', '$2b$10$5Y5RpD5Ga9vgFGWXhG7IweFUWla7mrOCtSfQaH3lKP1zKYxcv4jfm', '', '', '', 'admin', '2024-07-04 12:54:04'),
	(3, 'Farrel Ardian', 'farrel1@gmail.com', '$2a$10$j239oFQ.laEck5D6rdHAv.f9piJkxUFUHuzYuHjCdObBhLsXthikK', '/image/1720789046252.png', '089603450314', 'Jl sriti no 13', 'admin', '2024-07-12 12:56:47');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
