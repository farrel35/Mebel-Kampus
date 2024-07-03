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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_carts: ~0 rows (approximately)
DELETE FROM `tbl_carts`;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_categorys: ~1 rows (approximately)
DELETE FROM `tbl_categorys`;
INSERT INTO `tbl_categorys` (`id_category`, `category_name`, `categorys`, `image`, `created_at`) VALUES
	(1, 'Meja', 'M001', '/image/1719978409156.png', '2024-07-03 03:46:49');

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

-- Dumping structure for table mebel_kampus.tbl_image_products
DROP TABLE IF EXISTS `tbl_image_products`;
CREATE TABLE IF NOT EXISTS `tbl_image_products` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_image_products: ~3 rows (approximately)
DELETE FROM `tbl_image_products`;
INSERT INTO `tbl_image_products` (`id_image`, `id_product`, `keterangan`, `image`) VALUES
	(1, 1, 'Foto 1', '/image/1719979090725.png'),
	(2, 1, 'Foto 2', '/image/1719979098753.png'),
	(3, 1, 'Foto 3', '/image/1719979104423.png');

-- Dumping structure for table mebel_kampus.tbl_order_products
DROP TABLE IF EXISTS `tbl_order_products`;
CREATE TABLE IF NOT EXISTS `tbl_order_products` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment` varchar(255) NOT NULL,
  `delivery` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) GENERATED ALWAYS AS (`quantity` * `price`) STORED,
  PRIMARY KEY (`id_order`),
  KEY `id_user` (`id_user`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `tbl_order_products_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_users` (`id_user`),
  CONSTRAINT `tbl_order_products_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `tbl_products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_order_products: ~0 rows (approximately)
DELETE FROM `tbl_order_products`;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_products: ~1 rows (approximately)
DELETE FROM `tbl_products`;
INSERT INTO `tbl_products` (`id_product`, `product_name`, `description`, `price`, `stock`, `image`, `id_category`, `created_at`) VALUES
	(1, 'LISABO', 'Beautiful in its simplicity with a warm, natural wooden look. The innovative construction is very sturdy and with just a few clicks, the table is assembled and ready for use.\r\n\r\nMaterials\r\nTop panel: Ash veneer, Birch veneer, Solid birch, Birch plywood, Particleboard, Tinted clear acrylic lacquer, Fibreboard\r\nLeg base: Solid birch, Tinted clear acrylic lacquer', 3999999.00, 3, '/image/1719978711433.png', 1, '2024-07-03 03:51:51');

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

-- Dumping structure for table mebel_kampus.tbl_transaction_historys
DROP TABLE IF EXISTS `tbl_transaction_historys`;
CREATE TABLE IF NOT EXISTS `tbl_transaction_historys` (
  `id_history` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id_history`),
  KEY `id_user` (`id_user`),
  KEY `id_order` (`id_order`),
  CONSTRAINT `tbl_transaction_historys_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_users` (`id_user`),
  CONSTRAINT `tbl_transaction_historys_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `tbl_order_products` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_transaction_historys: ~0 rows (approximately)
DELETE FROM `tbl_transaction_historys`;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mebel_kampus.tbl_users: ~1 rows (approximately)
DELETE FROM `tbl_users`;
INSERT INTO `tbl_users` (`id_user`, `username`, `email`, `password`, `image`, `no_hp`, `alamat`, `role`, `created_at`) VALUES
	(1, 'Farrel Ardian', 'farrel@gmail.com', '$2b$10$UxI5hegpVQjj0x1l5JCvQefNOlQsTyQZcc3ojuQ5Grnzujz5hD3H2', '', '', '', 'admin', '2024-07-03 03:43:22');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
