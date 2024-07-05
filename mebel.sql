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


-- Dumping database structure for mebel_kampus
DROP DATABASE IF EXISTS `mebel_kampus`;
CREATE DATABASE IF NOT EXISTS `mebel_kampus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `mebel_kampus`;

-- Dumping structure for table mebel_kampus.tbl_carts
DROP TABLE IF EXISTS `tbl_carts`;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_carts: ~1 rows (approximately)
DELETE FROM `tbl_carts`;
INSERT INTO `tbl_carts` (`id_cart`, `id_user`, `id_product`, `quantity`, `added_at`) VALUES
	(19, 1, 4, 4, '2024-07-05 11:53:09'),
	(20, 2, 2, 1, '2024-07-05 15:16:58');

-- Dumping structure for table mebel_kampus.tbl_categorys
DROP TABLE IF EXISTS `tbl_categorys`;
CREATE TABLE IF NOT EXISTS `tbl_categorys` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `categorys` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `categorys` (`categorys`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_categorys: ~4 rows (approximately)
DELETE FROM `tbl_categorys`;
INSERT INTO `tbl_categorys` (`id_category`, `category_name`, `categorys`, `image`, `created_at`) VALUES
	(1, 'Meja', 'M001', '/image/1719978409156.png', '2024-07-03 03:46:49'),
	(2, 'Kursi', 'K001', '/image/1719982137033.png', '2024-07-03 04:48:57'),
	(3, 'Lemari', 'L001', '/image/1719982394024.jpg', '2024-07-03 04:53:14'),
	(4, 'Sofa', 'S001', '/image/1719985012707.png', '2024-07-03 05:36:52');

-- Dumping structure for table mebel_kampus.tbl_comment_products
DROP TABLE IF EXISTS `tbl_comment_products`;
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
DELETE FROM `tbl_comment_products`;

-- Dumping structure for table mebel_kampus.tbl_detail_transaction
DROP TABLE IF EXISTS `tbl_detail_transaction`;
CREATE TABLE IF NOT EXISTS `tbl_detail_transaction` (
  `id_detail` int(11) NOT NULL AUTO_INCREMENT,
  `no_order` varchar(50) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_detail_transaction: ~8 rows (approximately)
DELETE FROM `tbl_detail_transaction`;
INSERT INTO `tbl_detail_transaction` (`id_detail`, `no_order`, `id_product`, `quantity`) VALUES
	(63, 'MF-LLGXM8201', 1, 2),
	(64, 'MF-LLGXM8201', 2, 2),
	(65, 'MF-LLGXM8201', 3, 2),
	(66, 'MF-LLGXM8201', 4, 2),
	(67, 'MF-CRMJF5192', 2, 1),
	(69, 'MF-NYNIU6096', 1, 1),
	(70, 'MF-NYNIU6096', 2, 1),
	(71, 'MF-NYNIU6096', 3, 1);

-- Dumping structure for table mebel_kampus.tbl_image_products
DROP TABLE IF EXISTS `tbl_image_products`;
CREATE TABLE IF NOT EXISTS `tbl_image_products` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_image_products: ~14 rows (approximately)
DELETE FROM `tbl_image_products`;
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
	(14, 4, 'Foto 3', '/image/1719985089265.png');

-- Dumping structure for table mebel_kampus.tbl_products
DROP TABLE IF EXISTS `tbl_products`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_products: ~4 rows (approximately)
DELETE FROM `tbl_products`;
INSERT INTO `tbl_products` (`id_product`, `product_name`, `description`, `price`, `stock`, `image`, `id_category`, `created_at`) VALUES
	(1, 'LISABO', 'Beautiful in its simplicity with a warm, natural wooden look. The innovative construction is very sturdy and with just a few clicks, the table is assembled and ready for use.\r\n\r\nMaterials\r\nTop panel: Ash veneer, Birch veneer, Solid birch, Birch plywood, Particleboard, Tinted clear acrylic lacquer, Fibreboard\r\nLeg base: Solid birch, Tinted clear acrylic lacquer', 3999999.00, 5, '/image/1719978711433.png', 1, '2024-07-03 03:51:51'),
	(2, 'TOBIAS', 'A transparent chair that mirrors its surroundings. It picks up the colours of the room and appears to be floating. And because there’s flexibility in the seat, you may feel like you are floating too.\r\n\r\nMaterials\r\nLeg frame: Steel, Chrome-plated\r\nSeat shell: Polycarbonate plastic\r\nFoot: Polypropylene plastic\r\nNut: Zinc, Chrome-plated\r\nBumpers/ Washers: Synthetic rubber', 999999.00, 5, '/image/1719982189411.png', 2, '2024-07-03 04:49:49'),
	(3, 'SONGESAND', 'The classic design with panelled doors never goes out of style. Are you on your way? Use the full-length mirror so you can see your outfit from top to toe. Psst! Please attach to the wall.\r\n\r\nMaterials\r\nTop panel/ Side panel: Particleboard, Paper foil, Plastic edging\r\nBottom panel/ Partition/ Plinth back/ Support rail, back/ Shelf: Particleboard, Paper foil\r\nBack panel: Fibreboard\r\nDoor frame: Fibreboard, Paper foil, Plastic edging\r\nDoor panel/ Plinth front/ Support rail, front: Fibreboard, Paper foil\r\nMirror: Glass, Plastic foil, Plastic foil', 3999999.00, 5, '/image/1719982490071.png', 3, '2024-07-03 04:54:50'),
	(4, 'ESSEBODA', 'Maybe the softest sofa you’ll ever own! The ESSEBODA series spoils you with everything from the sofa\'s embracing feel, deep seats and high backrests to timeless design, fine details and many possibilities.\r\n\r\nMaterials\r\nFabric: 78% cotton, 22 % polyester (100% recycled)\r\nCord: 100% polyester\r\nClip: Polypropylene plastic\r\nSeat frame: Laminated veneer lumber, Plywood, Paperboard (100% recycled), Polyurethane foam 30 kg/cu.m., Particleboard\r\nBack frame: Plywood, Particleboard, Fibreboard, Paperboard (100% recycled), Polyurethane foam 30 kg/cu.m., Polyurethane foam 25 kg/cu.m., Laminated veneer lumber\r\nArmrest: Plywood, Particleboard, Fibreboard, Polyurethane foam 30 kg/cu.m., Laminated veneer lumber\r\nSeat cushion: Highly resilient polyurethane foam (cold foam) 35 kg/cu.m., Polyurethane foam 30 kg/cu.m., Felt liner, Polyester fibre balls\r\nPocket spring unit: Steel\r\nLegs for sofa\r\nSolid birch, Tinted clear lacquer', 5999999.00, 5, '/image/1719985054545.png', 4, '2024-07-03 05:37:34');

-- Dumping structure for table mebel_kampus.tbl_rating_products
DROP TABLE IF EXISTS `tbl_rating_products`;
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
DELETE FROM `tbl_rating_products`;

-- Dumping structure for table mebel_kampus.tbl_transaction
DROP TABLE IF EXISTS `tbl_transaction`;
CREATE TABLE IF NOT EXISTS `tbl_transaction` (
  `id_transaction` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `no_order` varchar(50) NOT NULL DEFAULT '',
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_transaction: ~3 rows (approximately)
DELETE FROM `tbl_transaction`;
INSERT INTO `tbl_transaction` (`id_transaction`, `id_user`, `no_order`, `order_date`, `nama_penerima`, `tlp_penerima`, `alamat_penerima`, `ongkir`, `grand_total`, `total_bayar`, `status_bayar`, `status_order`, `no_resi`, `image_bayar`, `atas_nama`, `nama_bank`, `no_rekening`) VALUES
	(16, 1, 'MF-LLGXM8201', '2024-07-05 14:58:36', 'Farrel Ardian', '089603450314', 'Jl sriti no 13', 100000, 29999992, 30099992, 1, 2, 'TESTRESI', '/image/1720191501499.jpg', 'Farrel', 'Mandiri', '139'),
	(17, 1, 'MF-CRMJF5192', '2024-07-05 12:56:46', 'Farrel Ardian', '089603450314', 'Jl sriti no 13', 100000, 999999, 1099999, 0, 0, '', '', '', '', ''),
	(18, 2, 'MF-NYNIU6096', '2024-07-04 13:27:28', 'Jalanin', '089603450314', 'Jl Pajajaran no 1', 100000, 8999997, 9099997, 0, 0, '', NULL, NULL, NULL, NULL);

-- Dumping structure for table mebel_kampus.tbl_users
DROP TABLE IF EXISTS `tbl_users`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_users: ~2 rows (approximately)
DELETE FROM `tbl_users`;
INSERT INTO `tbl_users` (`id_user`, `username`, `email`, `password`, `image`, `no_hp`, `alamat`, `role`, `created_at`) VALUES
	(1, 'Farrel Ardian', 'farrel@gmail.com', '$2a$10$GQmdKR3GNa3Yzhor11vyAeKkg.1TosYyWlte65eYrMxNt89TUsmNm', '/image/1719981071142.png', '089603450314', 'Jl sriti no 13', 'admin', '2024-07-03 03:43:22'),
	(2, 'Farrel Ardian', 'farrelardian123@gmail.com', '$2b$10$5Y5RpD5Ga9vgFGWXhG7IweFUWla7mrOCtSfQaH3lKP1zKYxcv4jfm', '', '', '', 'user', '2024-07-04 12:54:04');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
