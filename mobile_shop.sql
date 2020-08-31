-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 31, 2020 at 09:53 AM
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
(2, 22),
(3, 23);

-- --------------------------------------------------------

--
-- Table structure for table `basket_product`
--

CREATE TABLE `basket_product` (
  `id` int(11) NOT NULL,
  `basketId` int(11) NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(21, 22, 11, '2020-07-22 12:02:51'),
(22, 22, 5, '2020-07-22 12:02:53'),
(23, 22, 4, '2020-07-22 12:02:55'),
(24, 23, 17, '2020-07-22 13:21:45');

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
(4, 'Samsung Galaxy A90', '830.00', 'Samsung Galaxy A90 predstavljen je krajem 2019. godine. Radi se o najprestižnijem modelu Samsungove A serije, koji donosi i podršku za 5G internet. Ovo je model visoke klase sa ekranom od 6.7”, Full HD+ rezolucije slike, izrađenim u Super AMOLED tehnologiji. Pokreće ga izuzetno moćni Octa core procesor, sastavljen od 1x 2.8 GHz, 3x 2.4 GHz i 4x 1.7 GHz Kryo 485 jezgri. U ovoj varijanti, uparen je sa 6 GB RAM memorije i 128 GB interne memorije (postoji i verzija sa 8 GB RAM memorije). Skladišna memorija može se i dodatno proširiti putem microSD kartica kapaciteta do 512 GB. Od kamera, korisnicima su na raspolaganju čak 3 straga. Glavna stražnja kamera je rezolucije 48 Mp, a tu su i širokokutna od 8 Mp, te pomoćni senzor od 5 Mp, koji služi za mjerenje dubinske oštrine. Ljubiteljima selfija namijenjena je jedna kamera, ali izuzetno visoke rezolucije od 32 Mp. Maksimalna rezolucija videa stražnje kamere je 4K sa 30fps, a prednje Full HD. Od interesantnih opcija, A90 može se pohvaliti senzorom otiska prsta (smještenim ispod ekrana), brzim punjenjem baterije od 25W, kao i podrškom za Samsung DeX. Za ugodno iskustvo korištenja zadužen je operativni sistem Android v9.0 Pie ili noviji.', 'https://www.univerzalno.com/wp-content/uploads/2020/02/galaxya90-1.jpg', '5G 128GB (6GB RAM)', '2017-07-20', '0', '0'),
(5, 'Samsung Galaxy S10 Lite', '970.00', 'Samsung Galaxy S10 Lite predstavljen je u februaru 2020. godine, a radi se o telefonu raskošnih dimenzija, većem i od S10 Plus. S10 Lite donosi ekran od 6,7” Full HD+ rezolucije slike, izrađen u Super AMOLED tehnologiji. Pokreće ga Octa core procesor, sastavljen od 1x 2.8 GHz, 3x 2.4 GHz i 4x 1.7 GHz Kryo 485 jezgri. Uparen je sa 8 GB RAM memorije i 128 GB interne memorije (postoji i verzija sa 6 GB RAMa), a tu je i dodatni slot za proširenje memorije microSD karticama kapaciteta do 1 TB. U S10 Lite Samsung je ugradio 3 kamere straga, a glavni senzor je rezolucije 48 Mp, opremljen PDAF tehnologijom i Super Steady stabilizacijom. Pored njega, tu se nalaze i širokokutna kamera od 12 Mp, te još jedna od 5 Mp, koja služi za macro fotografiju. Maksimalna rezolucija videa je 4K sa 30 fps. Prednja selfi kamera stiže uz senzor od 32 Mp i može snimati video Full HD rezolucije. Kako je i za očekivati, S10 Lite stiže uz senzor otiska prsta (smješten ispod ekrana), te brzo punjenje baterije od 45W. Iz tvornice se isporučuje uz predinstaliran operativni sistem Android v10.', 'https://www.univerzalno.com/wp-content/uploads/2020/02/s10lit7.jpg', '128GB (8GB RAM)', '2017-07-20', '0', '0'),
(11, 'Samsung Galaxy A71 ', '700.00', 'Proizvođač\r\nSamsung\r\n\r\nModel\r\nGalaxy A71\r\n\r\nEkran\r\n1080 x 2400 px, 6,7\", Super AMOLED\r\n\r\nProcesor\r\n1,8 GHz, 2,2 GHz, Octa Core\r\n\r\nRAM\r\n8 GB\r\n\r\nInterna Memorija\r\n128 GB\r\n\r\nSlot Za Eksternu Memoriju\r\nmicroSD do 512GB\r\n\r\nStražnja Kamera\r\n64 Mp, 12 Mp, 5 Mp\r\n\r\nPrednja Kamera\r\n32 Mp\r\n\r\nBaterija\r\n4500 mAh\r\n\r\nDodatne Opcije\r\nBrzo punjenje baterije 25W, FM Radio, Senzor otiska prsta\r\n\r\nOperativni Sistem\r\nAndroid\r\n\r\nGARANCIJA\r\n1 godina', 'https://www.univerzalno.com/wp-content/uploads/2020/01/samsunga51-1-300x300.jpg', '128GB (8GB RAM)', '2020-07-07', '0', '0'),
(14, 'Samsung Galaxy A71 ', '700.00', 'Proizvođač\r\nSamsung\r\n\r\nModel\r\nGalaxy A71\r\n\r\nEkran\r\n1080 x 2400 px, 6,7\", Super AMOLED\r\n\r\nProcesor\r\n1,8 GHz, 2,2 GHz, Octa Core\r\n\r\nRAM\r\n8 GB\r\n\r\nInterna Memorija\r\n128 GB\r\n\r\nSlot Za Eksternu Memoriju\r\nmicroSD do 512GB\r\n\r\nStražnja Kamera\r\n64 Mp, 12 Mp, 5 Mp\r\n\r\nPrednja Kamera\r\n32 Mp\r\n\r\nBaterija\r\n4500 mAh\r\n\r\nDodatne Opcije\r\nBrzo punjenje baterije 25W, FM Radio, Senzor otiska prsta\r\n\r\nOperativni Sistem\r\nAndroid\r\n\r\nGARANCIJA\r\n1 godina', 'https://www.univerzalno.com/wp-content/uploads/2020/02/samsunga71-1.jpg', '128GB (8GB RAM)', '2020-07-22', '0', '0'),
(15, 'Huawei Y6p', '335.00', 'Huawei Y6p predstavljen je u maju 2020. godine. U elegantno dizajnirano kućište smjestio se ekran od 6,3” HD+ rezolucije slike, izrađen u IPS tehnologiji. Pokreće ga Octa core procesor sastavljen od 4x 2.0 GHz Cortex-A53 i 4x 1.5 GHz Cortex-A53 jezgri. U ovoj verziji, uparen je sa 3 GB RAM memorije i 64 GB interne memorije, koju korisnik može i dodatno proširiti putem microSD kartica kapaciteta do 512 GB. Y6p straga donosi 3 kamere, glavnu rezolucije 13 Mp, širokokutnu od 5 Mp te još jedan senzor od 2 Mp, koji služi za dubinsko mjerenje oštrine. Maksimalna rezolucija videa je Full HD, a isto se odnosi i na prednju tzv. selfi kameru, rezolucije 8 Mp. Od interesantnih opcija, ovaj model posjeduje senzor otiska prsta (smješten straga), a tu su i punjenje baterije od 10W, kao i mogućnost da se ovaj mobitel koristi kao eksterna baterija za punjenje drugih uređaja. Iz tvornice se isporučuje uz operativni sistem Android 10 (bez podrške za Google Play Services).\r\n', 'https://www.univerzalno.com/wp-content/uploads/2020/06/huaweiy6p-1.jpg', ' 64GB (3GB RAM)', '2020-07-22', '0', '0'),
(16, 'Huawei P40 lite', '425.00', 'Proizvođač\r\nHuawei\r\n\r\nModel\r\nHuawei P40 lite\r\n\r\nEkran\r\n1080 x 2310 px, 6,4\", IPS LCD\r\n\r\nProcesor\r\n1,8 GHz, 2,2 GHz, Octa Core\r\n\r\nRAM\r\n6 GB\r\n\r\nInterna Memorija\r\n128 GB\r\n\r\nSlot Za Eksternu Memoriju\r\nNano memory do 256 GB\r\n\r\nStražnja Kamera\r\n48 Mp, 2 Mp, 8 Mp\r\n\r\nPrednja Kamera\r\n16 Mp\r\n\r\nDodatne Opcije\r\nBrzo punjenje baterije 40W, Senzor otiska prsta\r\n\r\nBaterija\r\n4200 mAh\r\n\r\nOperativni Sistem\r\nAndroid\r\n\r\nGARANCIJA\r\n1 godina', 'https://www.univerzalno.com/wp-content/uploads/2020/05/p40lite-1.jpg', '128GB (6GB RAM)', '2020-07-22', '0', '0'),
(17, 'Huawei P40 Pro', '1750.00', 'Proizvođač\r\nHuawei\r\n\r\nModel\r\nHuawei P40 Pro\r\n\r\nEkran\r\n1200 x 2640 px, OLED, 6,5\"\r\n\r\nProcesor\r\n2,8 GHz, 1,9 GHz, 2,3 GHz, Octa Core\r\n\r\nRAM\r\n8 GB\r\n\r\nInterna Memorija\r\n256 GB\r\n\r\nSlot Za Eksternu Memoriju\r\nNano memory do 256 GB\r\n\r\nStražnja Kamera\r\n50 Mp, TOF 3D senzor, 12 Mp, 40 Mp\r\n\r\nPrednja Kamera\r\n32 Mp\r\n\r\nBaterija\r\n4200 mAh\r\n\r\nDodatne Opcije\r\nBrzo punjenje baterije 40W, Face ID, Qi wireless punjenje, Senzor otiska prsta\r\n\r\nOperativni Sistem\r\nAndroid\r\n\r\nGARANCIJA\r\n1 godina', 'https://www.univerzalno.com/wp-content/uploads/2020/05/huaweip40pro-1.jpg', '256GB (8GB RAM)', '2020-07-22', '1', '1'),
(18, 'Huawei P40', '1280.00', 'Proizvođač\r\nHuawei\r\n\r\nModel\r\nHuawei P40\r\n\r\nEkran\r\nOLED, 1080 x 2340 px, 6,1\"\r\n\r\nProcesor\r\n2,8 GHz, 1,9 GHz, 2,3 GHz, Octa Core\r\n\r\nRAM\r\n8 GB\r\n\r\nInterna Memorija\r\n128 GB\r\n\r\nSlot Za Eksternu Memoriju\r\nNano memory do 256 GB\r\n\r\nStražnja Kamera\r\n50 Mp, 16 Mp, 8 Mp\r\n\r\nPrednja Kamera\r\n32 Mp\r\n\r\nDodatne Opcije\r\nBrzo punjenje baterije 22W, Face ID, Senzor otiska prsta\r\n\r\nBaterija\r\n3800 mAh\r\n\r\nOperativni Sistem\r\nAndroid\r\n\r\nGARANCIJA\r\n1 godina', 'https://www.univerzalno.com/wp-content/uploads/2020/05/huaweip40-1.jpg', '128GB (8GB RAM)', '2020-07-22', '0', '0'),
(19, 'Nokia 6.2 ', '395.00', 'Nokia 6.2 predstavljena je krajem 2019. godine. Okvir kućišta izrađen je od plastike, a sprijeda i straga se nalazi staklo. Ekran od 6.3” izrađen je u IPS tehnologiji i prikazuje sliku u Full HD+ rezoluciji. Pokreće ga Octa core processor, sastavljen od 4x 1.8 GHz Kryo 260 Gold i 4x 1.6 GHz Kryo 260 Silver jezgri. U ovoj varijanti, radi u paru sa 4GB RAM memorije i 64GB interne memorije, a tu je i dodatni slot za proširenje memorije microSD karticama kapaciteta do 512 GB. Od kamera, korisniku su na raspolaganju 3 straga, glavna od 16 Mp, širokokutna od 8 Mp te još jedna kamera od 5 Mp, koja služi za dubinsko mjerenje oštrine. Ljubiteljima selfija na raspolaganju je samo jedna kamera od 8 Mp. Maksimalna rezolucija stražnje kamere je 4K, a prednje Full HD. Spomenimo da Nokia 6.2 posjeduje i senzor otiska prsta, smješten straga. Ipak, možda najveći adut ovog modela je što pripada seriji Android One telefona, što mu osigurava nove operativne sisteme minimalno 2 godine od predstavljanja, kao i sigurnosnu podršku u trajanju od 3 godine. Iz tvornice stiže uz operativni sistem Android v9.0 Pie ili noviji.', 'https://www.univerzalno.com/wp-content/uploads/2020/06/nokia62-1.jpg', '64GB (4GB RAM)', '2020-07-22', '0', '0'),
(20, 'Nokia 3310 ', '95.00', 'U februaru 2017. godine, Nokia je predstavila potpuno novu verziju modela 3310. Pod sloganom “The icon is back” – “Ikona se vratila”, stiže nam nasljednik modela koji je veoma popularan na društvenim mrežama i predstavlja se kao jedan od najizdržljivijih mobitela u svoje vrijeme. Nokia je odlučila iskoristiti tu slavu, a pored izgleda, novi model je preuzeo i neke elemente dizajna, ali je svakako mnogo bolje prilagođen za 2017 godinu. 3310 donosi 2.4” ekran, a od dodatnih opcija, tu su kamera od 2 Mp, FM radio, te MP3 player. Interna memorija je samo 16 MB, ali tu je i slot za proširenje microSD karticama kapaciteta do 32 GB. Jedna od prednosti ovoga modela trebala bi biti i izuzetno izdržljiva baterija, koja može izdržati do 1 mjesec u standby modu.', 'https://www.univerzalno.com/wp-content/uploads/2019/06/nokia_3310_dual_sim1.jpg', '(2017)', '2020-07-22', '0', '0'),
(21, 'Nokia 7.1 ', '395.00', 'Nokia 7.1 predstavljena je u oktobru 2018. godine. Radi se o modelu srednje klase, izuzetno zanimljivih specifikacija te primamljive cijene. Interesantno dizajnirano kućište donosi alumnijumski okvir, a sprijeda i straga se nalazi staklo. Ekran od 5.84” Full HD+ rezolucije zaštićen je Gorilla Glass 3 staklom, a “razvučen” je gotovo do samih ivica okvira. Pokreće ga Octa Core procesor, radnog takta 1.8 GHz, baziran na moćnim Kryo 260 jezgrama. U ovoj varijanti, uparen je sa 4 GB RAM memorije, te 64 GB interne memorije. Korisnicima je na raspolaganju i microSD slot za dodatno proširenje memorije karticama kapaciteta do 400 GB (kod Dual SIM varijanti, ovaj slot koristi mjesto za drugu SIM karticu). Za ljubitelje fotografije, Nokia je spremila dva senzora straga, glavnu kameru od 12 Mp sa PDAF fokusiranjem, te pomoćnu od 5 Mp, koja služi za dubinsko mjerenje oštrine. Maksimalna rezolucija videa je 4K sa 30 fps, a kada se snima u Full HD rezoluciji na raspolaganju je i softverski stabilizator slike. Kod prednje, tzv. selfie kamere, maksimalna rezolucija videa je Full HD koju “hvata” senzor od 8 Mp. Svim ljubiteljima izvornog Android operativnog sistema svidjet će se što Nokia 7.1 spada u Android One seriju telefona, a iz tvornice stiže uz predinstaliran operativni sistem Android v8.1 Oreo ili noviji. Za siguran pristup podacima na uređaju pobrinut će se i senzor otiska prsta, smješten straga.', 'https://www.univerzalno.com/wp-content/uploads/2019/02/nokia_71_32_gb7-1.jpg', '64GB', '2020-07-22', '0', '0'),
(22, 'Nokia 5.1 Plus', '265.00', 'Nokia 5.1 Plus stigla je na tržište u julu 2018. godine. Radi se o interesantnom telefonu srednje klase sa 5.86” ekranom HD+ rezolucije slike. Pokreće ga Octa core procesor sastavljen od dva Quad corea radnih taktova 1.8 GHz (Cortex A73 i A53 jezgre). U ovoj varijanti, uparen je sa 3 GB RAM memorije i 32 GB interne memorije, a korisnicima je na raspolaganju i slot za dodatno proširenje microSD karticama kapaciteta do 400 GB. Ljubiteljima fotografije na raspolaganju je dvostruka stražnja kamera, glavni senzor je 13 Mp da PDAFom, a u radu mu pomaže druga kamera od 5 Mp, koja služi za dubinsko mjerenje oštrine. Ako vam je selfie prioritet, tu je kamera od 8 Mp. Nokia 5.1 Plus iz tvornice stiže uz operativni sistem Android 8.1 Oreo ili noviji. Ovaj model spada u Android One seriju telefona, koje krasi izvorni Android operativni sistem, a uz to je osigurana i podrška u vidu novih verzija sistema i sigurnosnih zakrpa za naredne 3 godine. Za siguran pristup podacima brine se senzor otiska prsta, smješten straga.', 'https://www.univerzalno.com/wp-content/uploads/2019/05/nokia_51_plus_32gb1.jpg', '32GB', '2020-07-22', '0', '0'),
(25, 'Sony Xperia XA Ultra', '330.00', 'Sony Xperia XA Ultra je smartphone visoke klase sa raskošnim ekranom od 6”, predstavljen u maju 2016. godine. Ekran isporučuje sliku u Full HD rezoluciji, a tu je i Octa Core procesor, sastavljen od dva Quad Corea radnog takta 2.0 i 1.0 GHz (oba bazirana na modernim Cortex A53 jezgrama). U radu mu pomaže i 3 GB RAM memorije, dok interna memorija iznosi 16 GB, ali je moguće i dodatno proširiti putem microSD kartica kapaciteta do 256 GB. Ljubitelji fotografije će biti izuzetno zadovoljni ovim modelom, jer glavna kamera ima rezoluciju od 21.5 Mp, a sekundarna 16 Mp, te sto je posebno zanimljivo, “selfie” kamera ima i optički stabilizator slike. XA Ultra iz tvornice stiže uz operativni sistem Android v6.0 Marshmallow, a u budućnosti je planirana nadogradnja na v7.0 Nougat.', 'https://www.univerzalno.com/wp-content/uploads/2019/06/sony_xperia_xa_ultra2.jpg', 'Nema Opisa', '2020-07-22', '0', '0'),
(26, 'Apple iPhone 11 Pro MAX', '2100.00', 'Proizvođač\r\nApple\r\n\r\nModel\r\niPhone 11 Pro\r\n\r\nEkran\r\n1242 x 2688 px, OLED, 6,5\"\r\n\r\nProcesor\r\n1,8 GHz, 2,6 GHz, Hexa Core\r\n\r\nRAM\r\n4 GB\r\n\r\nInterna Memorija\r\n64 GB\r\n\r\nSlot Za Eksternu Memoriju\r\nNEMA\r\n\r\nStražnja Kamera\r\n12 Mp\r\n\r\nPrednja Kamera\r\n12 Mp\r\n\r\nDodatne Opcije\r\nBrzo punjenje baterije 18W, Face ID, Qi wireless punjenje\r\n\r\nBaterija\r\n3969 mAh\r\n\r\nOperativni Sistem\r\niOS\r\n\r\nGARANCIJA\r\n1 godina', 'https://www.univerzalno.com/wp-content/uploads/2019/10/iPhone11ProMAX1.jpg', '64GB', '2020-07-22', '0', '0'),
(27, 'Apple iPhone SE2', '890.00', 'Apple iPhone SE2 predstavljen je u aprilu 2020. godine. Ovo je druga generacija SE modela, poznat je još i pod imenom SE 2020. Vizuelno ovaj model je identičan iPhoneu 8 od kojeg je preuzeo kućište. Sa kućištem je došao i ekran od 4.7”, izrađen u IPS tehnologiji, HD+ rezolucije slike. Pokreće ga Hexa-core (6 jezgri) chip iz modela iPhone 11 Pro, Apple A13 Bionic, sastavljen od 2x 2.6 GHz Lightning i 4x 1.8 GHz Thunder jezgri. Radi u paru sa 3 GB RAM memorije i u zavisnosti od varijante sa 64, 128 ili 256 GB interne memorije. Ovaj model NEMA dodatni slot za proširenje memorije karticama. iPhone SE dolazi uz dvije kamere, po jednu smještenu sa svake strane uređaja. Stražnja kamera je rezolucije 12 Mp, opremljena optičkim stabilizatorom slike te PDAF tehnologijom. Uz moćno procesiranje i brojne modove, kamera može žabilježiti impresivne fotografije, kao i video 4K rezolucije sa 60 fps. Prednja selfi kamera donosi senzor od 7 Mp, te snima video u Full HD rezoluciji sa 30 fps. Ova kamera se koristi i za detekciju lica, a od interesantnih opcija, ovaj model posjduje i senzor otiska prsta (smješten sprijeda), kao i brzo punjenje baterije od 18W. iPhone SE iz tvornice stiže uz operativni sistem iOS 13 ili noviji.', 'https://www.univerzalno.com/wp-content/uploads/2020/06/ipse-2.jpg', '64GB', '2020-07-22', '0', '0'),
(28, 'Apple iPhone 7', '730.00', 'iPhone 7 je baziran na novoj generaciji A10 Fusion procesora koji donosi značajna poboljšanja u odnosu na procesore ugrađene u prethodne modele, dok su dijagonale ekrana ostale iste kao i u protekle dvije generacije. Tu su i nove kamere u odnosu na iPhone 6 i 6 Plus, novi iPhone ima kvalitetniju kameru rezolucije 12MP s optičkim zumom i optičkom stabilizacijom slike. Poboljšana je i bljeskalicu koja omogućuje snimanje kvalitetnijih fotografija u uvjetima slabijeg osvjetljenja. Početni model ima 32GB memorije, a maksimalna količina memorije iznosi 256GB. Dolazi u pet boja: ružičasto-zlatna, zlatna i srebrna ostaju, ali svemirski sivu zamijenit će tamno crna te jet black crna, model sa sjajnim finišem. Ovaj posljednji dolazi u ograničenoj količini. Jedna od najvećih novosti jest izbacivanje uobičajenog priključka za slušalice, a apple kao alternativu korisnicima nudi i nove AirPods bežične slušalice. Novost je i to da je ovo prvi iPhone koji je vodootporan te ima IPX7 certifikat, što znači da može izdržati trideset minuta potopljen jedan metar ispod vode.', 'https://www.univerzalno.com/wp-content/uploads/2019/06/apple_iphone_7_128gb_sve_boje3.jpg', '128GB', '2020-07-22', '0', '0'),
(29, 'Apple iPhone 7 Plus', '940.00', 'Apple iPhone 7 Plus predstavljen je u septembru 2016. godine. Radi se o velikom bratu iPhonea 7, koji je zadržao osnovni oblik i dimenzije iPhonea 6s Plus. Stiže uz 5,5” Retina display Full HD rezolucije, a tu je i 3D Touch tehnologija. Pokreće ga novi A10 Fusion četverojezgreni procesor, radnog takta 2,23 GHz, uparen sa 3 GB RAM memorije. Interna memorija je 32, 128 ili 256 GB u zavisnosti od verzije. Zaljubljenici u fotografiju trebali bi biti jako zadovoljni ovim modelom, jer 7 Plus dolazi uz dvostruku stražnju kameru od 12 Mp. Jedna kamera ima 28 mm širokokutni objektiv te otvor blende f1.8 (kao na standardnom iPhoneu 7), a druga kamera je 56 mm sa otvorom blende f2.8. Zbog ovoga iPhone 7 Plus ima i optički zoom od 2X, te do 10x kombinovano sa digitalnim. Osim za zoomiranje, druga kamera pomaže i za postizanje boljeg zamućenja pozadine npr. kod slikanja portreta, zbog čega se dobijaju fotografije nalik onima urađenim na profesionalnim aparatima. 7 Plus posjeduje i optički stabilizator slike, koji će pomoći kod slikanja u uslovima slabijeg osvjetljenja, a posebno kod snimanja video klipova, koje je moguće maksimalno u 4K rezoluciji sa 30fps. Prednja kamera je rezolucije 7 Mp, te može snimati Full HD video. Apple jako hvali i zvuk novoga modela, koji je 2x glasniji od 6s, te uz to ima stereo zvučnike. Novi model je i vodootporan po IP67 standardu, ali u slučaju oštećenja od vode, garancija se ne priznaje. Baterija je također poboljšana uz kapacitet od 2900 mAh, a operativni sistem je iOS 10.', 'https://www.univerzalno.com/wp-content/uploads/2019/06/iphone_7_32gb_sve_boje_13129101432.jpg', '128GB ', '2020-07-22', '0', '0'),
(30, 'Google Pixel 4 XL', '1370.00', 'Google Pixel 4 je kako se i iz imena može zaključiti, četvrta generacija Pixel modela. Stigao je na tržište krajem 2019. godine, a radi se o vrlo atraktivnom modelu, čak i vizuelno. Dolazi u dvije veličine, kao Pixel 4 ili Pixel 4 XL, a razlikuju se jedino u veličini ekrana i baterije. Veći model Pixel 4 XL donosi ekran od 6.3” izrađen u P-OLED tehnologiji, rezolucije slike 1440 x 3040 piksela, sa osvježavanjem od 90 Hz. Zaštićen je Gorilla Glass 5 staklom, a pokreće ga moćni Snapdragon 855 procesor. Octa core sastavljen od 1×2.8 GHz, 3×2.4 GHz i 4×1.7 GHz Kryo 485 jezgri. Radi u paru sa 6 GB RAM memorije i u zavisnosti od verzije sa 64 ili 128 GB interne memorije. Ovaj model ne posjeduje dodatni slot za proširenje memorije karticama. Od kamera, Google je u Pixel 4 upakovao dvije straga i jednu sprijeda. Stražnje kamere su rezolucije 12 Mp (standardna) i 16 Mp telefoto (2x optički zoom). Obje kamere posjeduju i optički stabilizator slike, a mogu snimati video u maksimalno 4K rezoluciji sa 30 fps. Prednja selfi kamera donosi senzor od 8 Mp, a u radu joj pomaže i TOF 3D senzor, koji mjeri dubinsku oštrinu slike. Maksimalna rezolucija videa ove kamere je Full HD sa 30 fps, a za odlične rezultate kamera brine se vrhunski podešen algoritam za procesiranje. Od interesantnih opcija, Pixel 4 XL može se pohvaliti Face ID detekcijom lica (ne posjeduje senzor otiska prsta), brzim punjenjem baterije od 18W, kao i QI wireless punjenjem. Ipak, glavna “poslastica” svakog Pixel modela je izvorni Android operativni sistem, kao i da će ovaj model prvi na tržištu dobijati nove verzije operativnog sistema i to minimalno 3 godine od datuma predstavljanja uređaja.', 'https://www.univerzalno.com/wp-content/uploads/2020/05/pixel4-2.jpg', '64GB', '2020-07-22', '0', '0');

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
(22, 'alca', 'alca', 'alca@gmail.com', 'mule', '1234', 'Admin', 'velesici'),
(23, 'Belmin', 'Hadžihasanović', 'belko@gmail.com', 'belko', '123', 'USER', 'camila sijarica');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `basket_product`
--
ALTER TABLE `basket_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
