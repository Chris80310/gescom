-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.6.12-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- SE du serveur:                debian-linux-gnu
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour Village_Green
CREATE DATABASE IF NOT EXISTS `Village_Green` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `Village_Green`;

-- Listage de la structure de table Village_Green. Adresse_s_
CREATE TABLE IF NOT EXISTS `Adresse_s_` (
  `Id_Adresse` varchar(50) NOT NULL,
  `client_adresse_livr` varchar(100) NOT NULL,
  `client_adresse_fact` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table Village_Green.Adresse_s_ : ~0 rows (environ)

-- Listage de la structure de table Village_Green. Catégorie
CREATE TABLE IF NOT EXISTS `Catégorie` (
  `Id_Catégorie` varchar(50) NOT NULL,
  `photo_cat` varchar(50) DEFAULT NULL,
  `libelle_cat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Catégorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table Village_Green.Catégorie : ~0 rows (environ)

-- Listage de la structure de table Village_Green. Client
CREATE TABLE IF NOT EXISTS `Client` (
  `Id_Client` varchar(50) NOT NULL,
  `Nom_entreprise` varchar(50) DEFAULT NULL,
  `client_nom` varchar(50) NOT NULL,
  `client_prenom` varchar(50) NOT NULL,
  `coef` decimal(2,2) NOT NULL,
  `Id_Adresse` varchar(50) NOT NULL,
  `Id_Commande` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Client`),
  KEY `Id_Adresse` (`Id_Adresse`),
  KEY `Id_Commande` (`Id_Commande`),
  CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`Id_Adresse`) REFERENCES `Adresse_s_` (`Id_Adresse`),
  CONSTRAINT `Client_ibfk_2` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table Village_Green.Client : ~0 rows (environ)

-- Listage de la structure de table Village_Green. Commande
CREATE TABLE IF NOT EXISTS `Commande` (
  `Id_Commande` varchar(50) NOT NULL,
  `date_com` date NOT NULL,
  `total_com` decimal(7,2) NOT NULL,
  `Id_Panier` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Commande`),
  KEY `Id_Panier` (`Id_Panier`),
  CONSTRAINT `Commande_ibfk_1` FOREIGN KEY (`Id_Panier`) REFERENCES `Panier` (`Id_Panier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table Village_Green.Commande : ~0 rows (environ)

-- Listage de la structure de table Village_Green. Panier
CREATE TABLE IF NOT EXISTS `Panier` (
  `Id_Panier` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Panier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table Village_Green.Panier : ~0 rows (environ)


-- Listage de la structure de la base pour ex2
CREATE DATABASE IF NOT EXISTS `ex2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `ex2`;

-- Listage de la structure de table ex2. Article
CREATE TABLE IF NOT EXISTS `Article` (
  `no_article` varchar(50) NOT NULL,
  `designation_article` varchar(100) NOT NULL,
  `PU_article` decimal(7,2) NOT NULL,
  PRIMARY KEY (`no_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table ex2.Article : ~0 rows (environ)

-- Listage de la structure de table ex2. Client
CREATE TABLE IF NOT EXISTS `Client` (
  `no_Client` varchar(50) NOT NULL,
  `nom_client` varchar(50) NOT NULL,
  `prenom_client` varchar(50) NOT NULL,
  PRIMARY KEY (`no_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table ex2.Client : ~0 rows (environ)

-- Listage de la structure de table ex2. Commande
CREATE TABLE IF NOT EXISTS `Commande` (
  `no_commande` varchar(50) NOT NULL,
  `date_commande` date NOT NULL,
  `montant_commande` decimal(15,2) NOT NULL,
  `no_Client` varchar(50) NOT NULL,
  PRIMARY KEY (`no_commande`),
  KEY `no_Client` (`no_Client`),
  CONSTRAINT `Commande_ibfk_1` FOREIGN KEY (`no_Client`) REFERENCES `Client` (`no_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table ex2.Commande : ~0 rows (environ)

-- Listage de la structure de table ex2. se_compose_de
CREATE TABLE IF NOT EXISTS `se_compose_de` (
  `no_commande` varchar(50) NOT NULL,
  `no_article` varchar(50) NOT NULL,
  `Qte` decimal(5,2) NOT NULL,
  `taux_tva` decimal(4,2) NOT NULL,
  PRIMARY KEY (`no_commande`,`no_article`),
  KEY `no_article` (`no_article`),
  CONSTRAINT `se_compose_de_ibfk_1` FOREIGN KEY (`no_commande`) REFERENCES `Commande` (`no_commande`),
  CONSTRAINT `se_compose_de_ibfk_2` FOREIGN KEY (`no_article`) REFERENCES `Article` (`no_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table ex2.se_compose_de : ~0 rows (environ)


-- Listage de la structure de la base pour gescom
CREATE DATABASE IF NOT EXISTS `gescom` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `gescom`;

-- Listage de la structure de table gescom. Customers
CREATE TABLE IF NOT EXISTS `Customers` (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_lastname` varchar(50) NOT NULL,
  `cus_firstname` varchar(50) NOT NULL,
  `cus_adress` varchar(100) NOT NULL,
  `cus_zipcode` varchar(5) NOT NULL,
  `cus_city` varchar(50) NOT NULL,
  `cus_mail` varchar(50) DEFAULT NULL,
  `cus_phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table gescom.Customers : ~0 rows (environ)

-- Listage de la structure de table gescom. Details
CREATE TABLE IF NOT EXISTS `Details` (
  `pro_id` int(11) NOT NULL,
  `ord_id` int(11) NOT NULL,
  `det_id` int(11) NOT NULL AUTO_INCREMENT,
  `det_price` decimal(7,2) NOT NULL,
  `det_quantity` decimal(3,0) NOT NULL,
  PRIMARY KEY (`pro_id`,`ord_id`),
  UNIQUE KEY `det_id` (`det_id`),
  KEY `ord_id` (`ord_id`),
  CONSTRAINT `Details_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `Products` (`pro_id`),
  CONSTRAINT `Details_ibfk_2` FOREIGN KEY (`ord_id`) REFERENCES `Orders` (`ord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table gescom.Details : ~0 rows (environ)

-- Listage de la structure de table gescom. Orders
CREATE TABLE IF NOT EXISTS `Orders` (
  `ord_id` int(11) NOT NULL AUTO_INCREMENT,
  `ord_order_date` date NOT NULL,
  `ord_bill_date` date DEFAULT NULL,
  `ord_ship_date` date DEFAULT NULL,
  `ord_reception_date` date DEFAULT NULL,
  `ord_status` varchar(50) NOT NULL,
  `cus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `cus_id` (`cus_id`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `Customers` (`cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table gescom.Orders : ~0 rows (environ)

-- Listage de la structure de table gescom. Products
CREATE TABLE IF NOT EXISTS `Products` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_ref` varchar(50) NOT NULL,
  `pro_name` varchar(50) NOT NULL,
  `pro_desc` varchar(50) NOT NULL,
  `pro_price` decimal(7,2) NOT NULL,
  `pro_stock` decimal(5,0) DEFAULT NULL,
  `pro_color` varchar(50) DEFAULT NULL,
  `pro_picture` varchar(50) DEFAULT NULL,
  `pro_add_date` date NOT NULL,
  `pro_update_date` date NOT NULL,
  `pro_publish` varchar(50) NOT NULL,
  `sup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `sup_id` (`sup_id`),
  KEY `pro_ref` (`pro_ref`),
  CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`sup_id`) REFERENCES `Suppliers` (`sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table gescom.Products : ~0 rows (environ)

-- Listage de la structure de table gescom. Suppliers
CREATE TABLE IF NOT EXISTS `Suppliers` (
  `sup_id` int(11) NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(50) NOT NULL,
  `sup_city` varchar(50) NOT NULL,
  `sup_adress` varchar(100) NOT NULL,
  `sup_mail` varchar(50) DEFAULT NULL,
  `sup_phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table gescom.Suppliers : ~0 rows (environ)


-- Listage de la structure de la base pour hardware_shop
CREATE DATABASE IF NOT EXISTS `hardware_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `hardware_shop`;

-- Listage de la structure de table hardware_shop. Adresse
CREATE TABLE IF NOT EXISTS `Adresse` (
  `Id_Adresse` int(11) NOT NULL AUTO_INCREMENT,
  `cli_adr_livr` varchar(100) NOT NULL,
  `cli_adr_fact` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hardware_shop.Adresse : ~0 rows (environ)

-- Listage de la structure de table hardware_shop. Appartient
CREATE TABLE IF NOT EXISTS `Appartient` (
  `Ref_Produit` int(11) NOT NULL,
  `Id_Sous_catégorie` int(11) NOT NULL,
  PRIMARY KEY (`Ref_Produit`,`Id_Sous_catégorie`),
  KEY `Id_Sous_catégorie` (`Id_Sous_catégorie`),
  CONSTRAINT `Appartient_ibfk_1` FOREIGN KEY (`Ref_Produit`) REFERENCES `Produit` (`Ref_Produit`),
  CONSTRAINT `Appartient_ibfk_2` FOREIGN KEY (`Id_Sous_catégorie`) REFERENCES `Sous_catégorie` (`Id_Sous_catégorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hardware_shop.Appartient : ~0 rows (environ)

-- Listage de la structure de table hardware_shop. Catégorie
CREATE TABLE IF NOT EXISTS `Catégorie` (
  `Id_Catégorie` int(11) NOT NULL AUTO_INCREMENT,
  `photo_cat` varchar(50) DEFAULT NULL,
  `libelle_cat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Catégorie`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hardware_shop.Catégorie : ~8 rows (environ)
INSERT INTO `Catégorie` (`Id_Catégorie`, `photo_cat`, `libelle_cat`) VALUES
	(1, NULL, 'cartes graphiques'),
	(2, NULL, 'Processeurs'),
	(3, NULL, 'Cartes mères'),
	(5, NULL, 'Refroidissements processeur'),
	(6, NULL, 'Mémoire vive'),
	(7, NULL, 'Mémoire de stockage'),
	(8, NULL, 'Alimentations'),
	(9, NULL, 'Boitiers'),
	(10, NULL, 'Cablage'),
	(11, NULL, 'Ventillateurs boitier');

-- Listage de la structure de table hardware_shop. Client
CREATE TABLE IF NOT EXISTS `Client` (
  `Id_Client` int(11) NOT NULL AUTO_INCREMENT,
  `nom_entr` varchar(50) DEFAULT NULL,
  `cli_nom` varchar(50) NOT NULL,
  `cli_prenom` varchar(50) NOT NULL,
  `coef` decimal(2,2) NOT NULL,
  `Id_Adresse` int(11) NOT NULL,
  `Id_Commande` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Client`),
  KEY `Id_Adresse` (`Id_Adresse`),
  KEY `Id_Commande` (`Id_Commande`),
  CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`Id_Adresse`) REFERENCES `Adresse` (`Id_Adresse`),
  CONSTRAINT `Client_ibfk_2` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hardware_shop.Client : ~0 rows (environ)

-- Listage de la structure de table hardware_shop. Commande
CREATE TABLE IF NOT EXISTS `Commande` (
  `Id_Commande` int(11) NOT NULL AUTO_INCREMENT,
  `date_com` date NOT NULL,
  `total_com` decimal(7,2) NOT NULL,
  `Id_Panier` int(11) NOT NULL,
  PRIMARY KEY (`Id_Commande`),
  KEY `Id_Panier` (`Id_Panier`),
  CONSTRAINT `Commande_ibfk_1` FOREIGN KEY (`Id_Panier`) REFERENCES `Panier` (`Id_Panier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hardware_shop.Commande : ~0 rows (environ)

-- Listage de la structure de table hardware_shop. Distributeurs
CREATE TABLE IF NOT EXISTS `Distributeurs` (
  `Id_Distributeurs` int(11) NOT NULL AUTO_INCREMENT,
  `logo_distri` varchar(50) DEFAULT NULL,
  `nom_distri` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Distributeurs`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hardware_shop.Distributeurs : ~2 rows (environ)
INSERT INTO `Distributeurs` (`Id_Distributeurs`, `logo_distri`, `nom_distri`) VALUES
	(1, NULL, 'AMD'),
	(2, NULL, 'NVIDIA'),
	(3, NULL, 'INTEL');

-- Listage de la structure de table hardware_shop. Détail
CREATE TABLE IF NOT EXISTS `Détail` (
  `Ref_Produit` int(11) NOT NULL,
  `Qte_com` decimal(7,0) NOT NULL,
  `Id_Facturation` int(11) NOT NULL,
  `Id_Commande` int(11) NOT NULL,
  PRIMARY KEY (`Ref_Produit`),
  KEY `Id_Facturation` (`Id_Facturation`),
  KEY `Id_Commande` (`Id_Commande`),
  CONSTRAINT `Détail_ibfk_1` FOREIGN KEY (`Ref_Produit`) REFERENCES `Produit` (`Ref_Produit`),
  CONSTRAINT `Détail_ibfk_2` FOREIGN KEY (`Id_Facturation`) REFERENCES `Facturation` (`Id_Facturation`),
  CONSTRAINT `Détail_ibfk_3` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hardware_shop.Détail : ~0 rows (environ)

-- Listage de la structure de table hardware_shop. Facturation
CREATE TABLE IF NOT EXISTS `Facturation` (
  `Id_Facturation` int(11) NOT NULL AUTO_INCREMENT,
  `bon_livr` varchar(500) NOT NULL,
  `facture` varchar(500) NOT NULL,
  PRIMARY KEY (`Id_Facturation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hardware_shop.Facturation : ~0 rows (environ)

-- Listage de la structure de table hardware_shop. fourni
CREATE TABLE IF NOT EXISTS `fourni` (
  `Ref_Produit` int(11) NOT NULL,
  `Id_Distributeurs` int(11) NOT NULL,
  PRIMARY KEY (`Ref_Produit`,`Id_Distributeurs`),
  KEY `Id_Distributeurs` (`Id_Distributeurs`),
  CONSTRAINT `fourni_ibfk_1` FOREIGN KEY (`Ref_Produit`) REFERENCES `Produit` (`Ref_Produit`),
  CONSTRAINT `fourni_ibfk_2` FOREIGN KEY (`Id_Distributeurs`) REFERENCES `Distributeurs` (`Id_Distributeurs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hardware_shop.fourni : ~0 rows (environ)

-- Listage de la structure de table hardware_shop. Panier
CREATE TABLE IF NOT EXISTS `Panier` (
  `Id_Panier` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id_Panier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hardware_shop.Panier : ~0 rows (environ)

-- Listage de la structure de table hardware_shop. Produit
CREATE TABLE IF NOT EXISTS `Produit` (
  `Ref_Produit` int(11) NOT NULL AUTO_INCREMENT,
  `img_prod` varchar(50) DEFAULT NULL,
  `libelle_prod` varchar(50) NOT NULL,
  `prix_achat_fourn` decimal(10,2) NOT NULL,
  `prix_vente_ht` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Ref_Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hardware_shop.Produit : ~0 rows (environ)

-- Listage de la structure de table hardware_shop. Sous_catégorie
CREATE TABLE IF NOT EXISTS `Sous_catégorie` (
  `Id_Sous_catégorie` int(11) NOT NULL AUTO_INCREMENT,
  `photo_sous_cat` varchar(50) DEFAULT NULL,
  `libelle_sous_cat` varchar(50) DEFAULT NULL,
  `Id_Catégorie` int(11) NOT NULL,
  PRIMARY KEY (`Id_Sous_catégorie`),
  KEY `Id_Catégorie` (`Id_Catégorie`),
  CONSTRAINT `Sous_catégorie_ibfk_1` FOREIGN KEY (`Id_Catégorie`) REFERENCES `Catégorie` (`Id_Catégorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hardware_shop.Sous_catégorie : ~0 rows (environ)


-- Listage de la structure de la base pour hotel
CREATE DATABASE IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `hotel`;

-- Listage de la structure de table hotel. Chambre
CREATE TABLE IF NOT EXISTS `Chambre` (
  `cha_num` int(11) NOT NULL AUTO_INCREMENT,
  `cha_sta` varchar(50) NOT NULL,
  `cha_type` varchar(50) NOT NULL,
  `degre_confort` varchar(50) NOT NULL,
  `expo` varchar(50) NOT NULL,
  `hot_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`cha_num`),
  KEY `hot_num` (`hot_num`),
  CONSTRAINT `Chambre_ibfk_1` FOREIGN KEY (`hot_num`) REFERENCES `Hotel` (`hot_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hotel.Chambre : ~0 rows (environ)

-- Listage de la structure de table hotel. Client
CREATE TABLE IF NOT EXISTS `Client` (
  `cli_num` int(11) NOT NULL AUTO_INCREMENT,
  `cli_adr` varchar(100) NOT NULL,
  `cli_nom` varchar(50) NOT NULL,
  `cli_prenom` varchar(50) NOT NULL,
  PRIMARY KEY (`cli_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hotel.Client : ~0 rows (environ)

-- Listage de la structure de table hotel. Hotel
CREATE TABLE IF NOT EXISTS `Hotel` (
  `hot_num` int(11) NOT NULL AUTO_INCREMENT,
  `hot_capa` varchar(50) NOT NULL,
  `hot_cat` varchar(50) NOT NULL,
  `hot_nom` varchar(50) NOT NULL,
  `hot_adr` varchar(100) NOT NULL,
  `sta_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`hot_num`),
  KEY `sta_num` (`sta_num`),
  CONSTRAINT `Hotel_ibfk_1` FOREIGN KEY (`sta_num`) REFERENCES `Station` (`sta_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hotel.Hotel : ~0 rows (environ)

-- Listage de la structure de table hotel. Reservation
CREATE TABLE IF NOT EXISTS `Reservation` (
  `cha_num` int(11) NOT NULL,
  `cli_num` int(11) NOT NULL,
  `date_deb` date NOT NULL,
  `date_fin` date NOT NULL,
  `date_res` date NOT NULL,
  `montant_arrhes` varchar(50) NOT NULL,
  `prix_tot` decimal(6,2) NOT NULL,
  PRIMARY KEY (`cha_num`,`cli_num`),
  KEY `cli_num` (`cli_num`),
  CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`cha_num`) REFERENCES `Chambre` (`cha_num`),
  CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`cli_num`) REFERENCES `Client` (`cli_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hotel.Reservation : ~0 rows (environ)

-- Listage de la structure de table hotel. Station
CREATE TABLE IF NOT EXISTS `Station` (
  `sta_num` int(11) NOT NULL AUTO_INCREMENT,
  `sta_nom` varchar(50) NOT NULL,
  PRIMARY KEY (`sta_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table hotel.Station : ~0 rows (environ)


-- Listage de la structure de la base pour papyrus
CREATE DATABASE IF NOT EXISTS `papyrus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `papyrus`;

-- Listage de la structure de table papyrus. entcom
CREATE TABLE IF NOT EXISTS `entcom` (
  `numcom` int(11) NOT NULL AUTO_INCREMENT,
  `obscom` varchar(50) DEFAULT NULL,
  `datcom` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `numfou` int(11) DEFAULT NULL,
  PRIMARY KEY (`numcom`),
  KEY `numfou` (`numfou`),
  CONSTRAINT `entcom_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `fournis` (`numfou`)
) ENGINE=InnoDB AUTO_INCREMENT=70630 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table papyrus.entcom : ~10 rows (environ)
INSERT INTO `entcom` (`numcom`, `obscom`, `datcom`, `numfou`) VALUES
	(70010, '', '2018-04-23 13:59:51', 120),
	(70011, 'Commande urgente', '2020-05-21 15:32:43', 540),
	(70020, '', '2020-12-14 07:57:09', 9120),
	(70025, 'Commande urgente', '2021-04-13 14:17:45', 9150),
	(70210, 'Commande cadencée', '2021-06-05 08:40:05', 120),
	(70250, 'Commande cadencée', '2021-08-02 07:19:46', 8700),
	(70300, '', '2021-10-31 13:03:52', 9120),
	(70620, '', '2021-10-31 14:24:17', 540),
	(70625, '', '2022-02-19 12:07:33', 120),
	(70629, '', '2022-04-02 17:58:16', 9180);

-- Listage de la structure de table papyrus. fournis
CREATE TABLE IF NOT EXISTS `fournis` (
  `numfou` int(11) NOT NULL,
  `nomfou` varchar(25) NOT NULL,
  `ruefou` varchar(50) NOT NULL,
  `posfou` char(5) NOT NULL,
  `vilfou` varchar(30) NOT NULL,
  `confou` varchar(15) NOT NULL,
  `satisf` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`numfou`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`satisf` >= 0 and `satisf` <= 10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table papyrus.fournis : ~7 rows (environ)
INSERT INTO `fournis` (`numfou`, `nomfou`, `ruefou`, `posfou`, `vilfou`, `confou`, `satisf`) VALUES
	(120, 'GROBRIGAN', '20 rue du papier', '92200', 'Papercity', 'Georges', 8),
	(540, 'ECLIPSE', '53 rue laisse flotter les rubans', '78250', 'Bugbugville', 'Nestor', 7),
	(8700, 'MEDICIS', '120 rue des plantes', '75014', 'Paris', 'Lison', 0),
	(9120, 'DISCOBOL', '11 rue des sports', '85100', 'La Roche sur Yon', 'Hercule', 8),
	(9150, 'DEPANPAP', '26 avenue des locomotives', '59987', 'Coroncountry', 'Pollux', 5),
	(9180, 'HURRYTAPE', '68 boulevard des octets', '78440', 'Dumpville', 'Track', 0),
	(10127, 'FOURNITOU', '30 allée des chaumières', '78440', 'Dumpville', 'Bobby', 3);

-- Listage de la structure de table papyrus. ligcom
CREATE TABLE IF NOT EXISTS `ligcom` (
  `numlig` tinyint(4) NOT NULL,
  `numcom` int(11) NOT NULL,
  `codart` char(4) NOT NULL,
  `qtecde` int(11) NOT NULL,
  `priuni` decimal(5,0) NOT NULL,
  `qteliv` int(11) DEFAULT NULL,
  `derliv` date NOT NULL,
  PRIMARY KEY (`numcom`,`codart`),
  KEY `codart` (`codart`),
  CONSTRAINT `ligcom_ibfk_1` FOREIGN KEY (`numcom`) REFERENCES `entcom` (`numcom`),
  CONSTRAINT `ligcom_ibfk_2` FOREIGN KEY (`codart`) REFERENCES `produit` (`codart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table papyrus.ligcom : ~14 rows (environ)
INSERT INTO `ligcom` (`numlig`, `numcom`, `codart`, `qtecde`, `priuni`, `qteliv`, `derliv`) VALUES
	(4, 70010, 'D035', 200, 40, 250, '2018-08-20'),
	(1, 70010, 'I100', 3000, 470, 3000, '2018-04-15'),
	(2, 70010, 'I105', 2000, 485, 2000, '2018-07-05'),
	(3, 70010, 'I108', 1000, 680, 1000, '2018-08-20'),
	(5, 70010, 'P220', 6000, 3500, 6000, '2018-08-31'),
	(6, 70010, 'P240', 6000, 2000, 2000, '2018-08-31'),
	(1, 70011, 'I105', 1000, 600, 1000, '2020-05-26'),
	(2, 70011, 'P220', 10000, 3500, 10000, '2020-05-31'),
	(1, 70020, 'B001', 200, 140, 0, '2020-12-31'),
	(2, 70020, 'B002', 200, 140, 0, '2020-12-31'),
	(1, 70025, 'I100', 1000, 590, 1000, '2021-04-15'),
	(2, 70025, 'I105', 500, 590, 500, '2021-05-16'),
	(1, 70210, 'I100', 1000, 470, 1000, '2021-06-13'),
	(2, 70250, 'P220', 10000, 3350, 10000, '2021-09-08'),
	(1, 70250, 'P230', 15000, 4900, 12000, '2021-08-18'),
	(1, 70300, 'I100', 50, 790, 50, '2021-11-08'),
	(1, 70620, 'I105', 200, 600, 200, '2021-11-08'),
	(1, 70625, 'I100', 1000, 470, 1000, '2022-10-15'),
	(2, 70625, 'P220', 10000, 3500, 10000, '2022-03-03'),
	(1, 70629, 'B001', 200, 140, 0, '2022-04-21'),
	(2, 70629, 'B002', 200, 140, 0, '2022-04-21');

-- Listage de la structure de table papyrus. produit
CREATE TABLE IF NOT EXISTS `produit` (
  `codart` char(4) NOT NULL,
  `libart` varchar(30) NOT NULL,
  `stkale` int(11) NOT NULL,
  `stkphy` int(11) NOT NULL,
  `qteann` int(11) NOT NULL,
  `unimes` char(5) NOT NULL,
  PRIMARY KEY (`codart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table papyrus.produit : ~15 rows (environ)
INSERT INTO `produit` (`codart`, `libart`, `stkale`, `stkphy`, `qteann`, `unimes`) VALUES
	('B001', 'Bande magnétique 1200', 20, 87, 240, 'unite'),
	('B002', 'Bande magnétique 6250', 20, 12, 410, 'unite'),
	('D035', 'CD R slim 80 mm', 40, 42, 150, 'B010'),
	('D050', 'CD R-W 80mm', 50, 4, 0, 'B010'),
	('I100', 'Papier 1 ex continu', 100, 557, 3500, 'B1000'),
	('I105', 'Papier 2 ex continu', 75, 5, 2300, 'B1000'),
	('I108', 'Papier 3 ex continu', 200, 557, 3500, 'B500'),
	('I110', 'Papier 4 ex continu', 10, 12, 63, 'B400'),
	('P220', 'Pré-imprimé commande', 500, 2500, 24500, 'B500'),
	('P230', 'Pré-imprimé facture', 500, 250, 12500, 'B500'),
	('P240', 'Pré-imprimé bulletin paie', 500, 3000, 6250, 'B500'),
	('P250', 'Pré-imprimé bon livraison', 500, 2500, 24500, 'B500'),
	('P270', 'Pré-imprimé bon fabrication', 500, 2500, 24500, 'B500'),
	('R080', 'ruban Epson 850', 10, 2, 120, 'unite'),
	('R132', 'ruban impl 1200 lignes', 25, 200, 182, 'unite');

-- Listage de la structure de table papyrus. vente
CREATE TABLE IF NOT EXISTS `vente` (
  `codart` char(4) NOT NULL,
  `numfou` int(11) NOT NULL,
  `delliv` smallint(6) NOT NULL,
  `qte1` int(11) NOT NULL,
  `prix1` decimal(5,0) NOT NULL,
  `qte2` int(11) DEFAULT NULL,
  `prix2` decimal(5,0) DEFAULT NULL,
  `qte3` int(11) DEFAULT NULL,
  `prix3` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`codart`,`numfou`),
  KEY `numfou` (`numfou`),
  CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `fournis` (`numfou`),
  CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`codart`) REFERENCES `produit` (`codart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table papyrus.vente : ~12 rows (environ)
INSERT INTO `vente` (`codart`, `numfou`, `delliv`, `qte1`, `prix1`, `qte2`, `prix2`, `qte3`, `prix3`) VALUES
	('B001', 8700, 15, 0, 150, 50, 145, 100, 140),
	('B002', 8700, 15, 0, 210, 50, 200, 100, 185),
	('D035', 120, 0, 0, 40, 0, 0, 0, 0),
	('D035', 9120, 5, 0, 40, 100, 30, 0, 0),
	('I100', 120, 90, 0, 700, 50, 600, 120, 500),
	('I100', 540, 70, 0, 710, 60, 630, 100, 600),
	('I100', 9120, 60, 0, 800, 70, 600, 90, 500),
	('I100', 9150, 90, 0, 650, 90, 600, 200, 590),
	('I100', 9180, 30, 0, 720, 50, 670, 100, 490),
	('I105', 120, 90, 10, 705, 50, 630, 120, 500),
	('I105', 540, 70, 0, 810, 60, 645, 100, 600),
	('I105', 8700, 30, 0, 720, 50, 670, 100, 510),
	('I105', 9120, 60, 0, 920, 70, 800, 90, 700),
	('I105', 9150, 90, 0, 685, 90, 600, 200, 590),
	('I108', 120, 90, 5, 795, 30, 720, 100, 680),
	('I108', 9120, 60, 0, 920, 70, 820, 100, 780),
	('I110', 9120, 60, 0, 950, 70, 850, 90, 790),
	('I110', 9180, 90, 0, 900, 70, 870, 90, 835),
	('P220', 120, 15, 0, 3700, 100, 3500, 0, 0),
	('P220', 8700, 20, 50, 3500, 100, 3350, 0, 0),
	('P230', 120, 30, 0, 5200, 100, 5000, 0, 0),
	('P230', 8700, 60, 0, 5000, 50, 4900, 0, 0),
	('P240', 120, 15, 0, 2200, 100, 2000, 0, 0),
	('P250', 120, 30, 0, 1500, 100, 1400, 500, 1200),
	('P250', 9120, 30, 0, 1500, 100, 1400, 500, 1200),
	('R080', 9120, 10, 0, 120, 100, 100, 0, 0),
	('R132', 9120, 5, 0, 275, 0, 0, 0, 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
