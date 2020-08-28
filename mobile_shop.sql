-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 21, 2020 at 09:42 PM
-- Server version: 5.7.24
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `basket`
--

CREATE TABLE `basket` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `basket`
--

INSERT INTO `basket` (`id`, `userId`) VALUES
(2, 22);

-- --------------------------------------------------------

--
-- Table structure for table `basket_product`
--

CREATE TABLE `basket_product` (
  `id` int(11) NOT NULL,
  `basketId` int(11) NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `basket_product`
--

INSERT INTO `basket_product` (`id`, `basketId`, `productId`) VALUES
(24, 2, 5),
(25, 2, 5),
(26, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `orderDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`id`, `userId`, `productId`, `orderDate`) VALUES
(18, 22, 4, '2020-07-21 20:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `image` varchar(512) DEFAULT NULL,
  `shortdesc` varchar(60) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `soldInd` varchar(2) NOT NULL,
  `basketInd` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`, `image`, `shortdesc`, `createDate`, `soldInd`, `basketInd`) VALUES
(4, 'Samsung Galaxy A90', '830.00', 'Samsung Galaxy A90 predstavljen je krajem 2019. godine. Radi se o najprestižnijem modelu Samsungove A serije, koji donosi i podršku za 5G internet. Ovo je model visoke klase sa ekranom od 6.7”, Full HD+ rezolucije slike, izrađenim u Super AMOLED tehnologiji. Pokreće ga izuzetno moćni Octa core procesor, sastavljen od 1x 2.8 GHz, 3x 2.4 GHz i 4x 1.7 GHz Kryo 485 jezgri. U ovoj varijanti, uparen je sa 6 GB RAM memorije i 128 GB interne memorije (postoji i verzija sa 8 GB RAM memorije). Skladišna memorija može se i dodatno proširiti putem microSD kartica kapaciteta do 512 GB. Od kamera, korisnicima su na raspolaganju čak 3 straga. Glavna stražnja kamera je rezolucije 48 Mp, a tu su i širokokutna od 8 Mp, te pomoćni senzor od 5 Mp, koji služi za mjerenje dubinske oštrine. Ljubiteljima selfija namijenjena je jedna kamera, ali izuzetno visoke rezolucije od 32 Mp. Maksimalna rezolucija videa stražnje kamere je 4K sa 30fps, a prednje Full HD. Od interesantnih opcija, A90 može se pohvaliti senzorom otiska prsta (smještenim ispod ekrana), brzim punjenjem baterije od 25W, kao i podrškom za Samsung DeX. Za ugodno iskustvo korištenja zadužen je operativni sistem Android v9.0 Pie ili noviji.', 'https://www.univerzalno.com/wp-content/uploads/2020/02/galaxya90-1.jpg', '5G 128GB (6GB RAM)', '2017-07-20', '1', '0'),
(5, 'Samsung Galaxy S10 Lite', '970.00', 'Samsung Galaxy S10 Lite predstavljen je u februaru 2020. godine, a radi se o telefonu raskošnih dimenzija, većem i od S10 Plus. S10 Lite donosi ekran od 6,7” Full HD+ rezolucije slike, izrađen u Super AMOLED tehnologiji. Pokreće ga Octa core procesor, sastavljen od 1x 2.8 GHz, 3x 2.4 GHz i 4x 1.7 GHz Kryo 485 jezgri. Uparen je sa 8 GB RAM memorije i 128 GB interne memorije (postoji i verzija sa 6 GB RAMa), a tu je i dodatni slot za proširenje memorije microSD karticama kapaciteta do 1 TB. U S10 Lite Samsung je ugradio 3 kamere straga, a glavni senzor je rezolucije 48 Mp, opremljen PDAF tehnologijom i Super Steady stabilizacijom. Pored njega, tu se nalaze i širokokutna kamera od 12 Mp, te još jedna od 5 Mp, koja služi za macro fotografiju. Maksimalna rezolucija videa je 4K sa 30 fps. Prednja selfi kamera stiže uz senzor od 32 Mp i može snimati video Full HD rezolucije. Kako je i za očekivati, S10 Lite stiže uz senzor otiska prsta (smješten ispod ekrana), te brzo punjenje baterije od 45W. Iz tvornice se isporučuje uz predinstaliran operativni sistem Android v10.', 'https://www.univerzalno.com/wp-content/uploads/2020/02/s10lit7.jpg', '128GB (8GB RAM)', '2017-07-20', '0', '0'),
(11, 'Iphone 7', '900.00', 'novi', 'https://www.univerzalno.com/wp-content/uploads/2019/06/apple_iphone_7_128gb_sve_boje3.jpg', 'balaba', '2020-07-07', '0', '0'),
(12, 'Samsung Galaxy S10 Lite', '970.00', 'Samsung Galaxy S10 Lite predstavljen je u februaru 2020. godine, a radi se o telefonu raskošnih dimenzija, većem i od S10 Plus. S10 Lite donosi ekran od 6,7” Full HD+ rezolucije slike, izrađen u Super AMOLED tehnologiji. Pokreće ga Octa core procesor, sastavljen od 1x 2.8 GHz, 3x 2.4 GHz i 4x 1.7 GHz Kryo 485 jezgri. Uparen je sa 8 GB RAM memorije i 128 GB interne memorije (postoji i verzija sa 6 GB RAMa), a tu je i dodatni slot za proširenje memorije microSD karticama kapaciteta do 1 TB. U S10 Lite Samsung je ugradio 3 kamere straga, a glavni senzor je rezolucije 48 Mp, opremljen PDAF tehnologijom i Super Steady stabilizacijom. Pored njega, tu se nalaze i širokokutna kamera od 12 Mp, te još jedna od 5 Mp, koja služi za macro fotografiju. Maksimalna rezolucija videa je 4K sa 30 fps. Prednja selfi kamera stiže uz senzor od 32 Mp i može snimati video Full HD rezolucije. Kako je i za očekivati, S10 Lite stiže uz senzor otiska prsta (smješten ispod ekrana), te brzo punjenje baterije od 45W. Iz tvornice se isporučuje uz predinstaliran operativni sistem Android v10.', 'https://www.univerzalno.com/wp-content/uploads/2020/02/s10lit7.jpg', '128GB (8GB RAM)', '2017-07-20', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `lastname` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` varchar(45) NOT NULL,
  `address` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `username`, `password`, `role`, `address`) VALUES
(22, 'alca', 'alca', 'alca@gmail.com', 'alca', '123', 'Admin', 'velesici');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_basket_user_id` (`userId`);

--
-- Indexes for table `basket_product`
--
ALTER TABLE `basket_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_basket_product_basket_id` (`basketId`),
  ADD KEY `fk_basket_product_product_id` (`productId`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_user_id_idx` (`userId`),
  ADD KEY `fk_order_product_id_idx` (`productId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `basket`
--
ALTER TABLE `basket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `basket_product`
--
ALTER TABLE `basket_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `fk_basket_user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);

--
-- Constraints for table `basket_product`
--
ALTER TABLE `basket_product`
  ADD CONSTRAINT `fk_basket_product_basket_id` FOREIGN KEY (`basketId`) REFERENCES `basket` (`id`),
  ADD CONSTRAINT `fk_basket_product_product_id` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `fk_order_product_id` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_order_user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
