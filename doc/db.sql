-- --------------------------------------------------------
-- Host:                         localhost
-- Versi server:                 5.7.24 - MySQL Community Server (GPL)
-- OS Server:                    Win64
-- HeidiSQL Versi:               10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Membuang struktur basisdata untuk db_node
CREATE DATABASE IF NOT EXISTS `db_node` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_node`;

-- membuang struktur untuk table db_node.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float(11,2) NOT NULL,
  `inventory_qty` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel db_node.products: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `sku`, `name`, `price`, `inventory_qty`, `createdAt`, `updatedAt`) VALUES
	(1, '120P90', 'Google Home', 49.99, 10, '2021-08-05 22:00:00', '2021-08-05 22:00:00'),
	(2, '43N23P', 'Macbook Pro', 5399.99, 5, '2021-08-05 22:00:00', '2021-08-05 22:00:00'),
	(3, 'A304SD', 'Alexa Speaker', 109.50, 10, '2021-08-05 22:00:00', '2021-08-05 22:00:00'),
	(4, '234234', 'Raspberry Pi B', 30.00, 2, '2021-08-05 22:00:00', '2021-08-05 22:00:00');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- membuang struktur untuk table db_node.promo_products
CREATE TABLE IF NOT EXISTS `promo_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sku` varchar(255) NOT NULL DEFAULT '',
  `min_order` int(11) NOT NULL,
  `promo_type` enum('gift_item','buy_get','percentage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promo_type_value` text,
  `prize_amount` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel db_node.promo_products: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `promo_products` DISABLE KEYS */;
INSERT INTO `promo_products` (`id`, `name`, `sku`, `min_order`, `promo_type`, `promo_type_value`, `prize_amount`, `createdAt`, `updatedAt`) VALUES
	(1, 'Beli MacBook Pro dapat Raspberry Pi B', '43N23P', 1, 'gift_item', '234234', NULL, '2021-08-05 23:29:47', '2021-08-05 23:29:48'),
	(2, 'Beli 3 Google Homes cuman bayar 2', '120P90', 3, 'buy_get', '120P90', 1, '2021-08-05 23:30:44', '2021-08-05 23:30:44'),
	(3, 'Beli 3 Alexa Speakers diskon 10%', 'A304SD', 3, 'percentage', '10', NULL, '2021-08-05 23:31:31', '2021-08-05 23:31:31');
/*!40000 ALTER TABLE `promo_products` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
