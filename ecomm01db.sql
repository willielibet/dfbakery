-- MariaDB dump 10.19  Distrib 10.4.31-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ecomm01db
-- ------------------------------------------------------
-- Server version	10.4.31-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add gallery picture',7,'add_gallerypicture'),(26,'Can change gallery picture',7,'change_gallerypicture'),(27,'Can delete gallery picture',7,'delete_gallerypicture'),(28,'Can view gallery picture',7,'view_gallerypicture'),(29,'Can add picture description',8,'add_picturedescription'),(30,'Can change picture description',8,'change_picturedescription'),(31,'Can delete picture description',8,'delete_picturedescription'),(32,'Can view picture description',8,'view_picturedescription'),(33,'Can add price',9,'add_price'),(34,'Can change price',9,'change_price'),(35,'Can delete price',9,'delete_price'),(36,'Can view price',9,'view_price'),(37,'Can add cake',10,'add_cake'),(38,'Can change cake',10,'change_cake'),(39,'Can delete cake',10,'delete_cake'),(40,'Can view cake',10,'view_cake');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$R4uhs5ulkoX2rFtg6gpaSj$9VojjAjlc5YceB8BkW3KG5cp0Hc+Ots9MEvPfxAc+CM=','2023-12-08 03:49:58.188670',1,'djangouser','','','write2willie@gmail.com',1,1,'2023-12-05 01:58:04.290844');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descriptions_picturedescription`
--

DROP TABLE IF EXISTS `descriptions_picturedescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descriptions_picturedescription` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_id` (`price_id`),
  CONSTRAINT `descriptions_picture_price_id_87103409_fk_pricesapp` FOREIGN KEY (`price_id`) REFERENCES `pricesapp_price` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descriptions_picturedescription`
--

LOCK TABLES `descriptions_picturedescription` WRITE;
/*!40000 ALTER TABLE `descriptions_picturedescription` DISABLE KEYS */;
INSERT INTO `descriptions_picturedescription` VALUES (1,'Small Daisy Inserts','pictures/small_daisy_inserts_LR6jN86.png','Small Daisy Inserts\r\nThis is a type of cake of color green and white.\r\n\r\nGreen cake at $8.99.\r\nBuy it now!',NULL),(2,'Goldbelly Red Rose','pictures/goldbelly_red_rose_mp7ec6r.png','Goldbelly Red Rose\r\n\r\ngoldbelly red rose has beautiful colors!\r\n\r\nThis is a red cake at $4.99.',NULL),(3,'Pink Rose Chocolate','pictures/pink_rose_chocolate_255Pap2.png','Pink Rose Chocolate\r\n\r\npink_rose_chocolate is pretty good!\r\nColor is pink with dark chocolate.\r\nAt the right price of $12.99.',NULL),(4,'Floral Cake','pictures/floral_cake_juIcssr.png','Floral Cake\r\nFloral cakes are full of cake and flowers. Best of both worlds!\r\n\r\nColors yellow, blue, and white come together here.\r\nListed at $9,99 today.',NULL),(5,'Cake Size Test','pictures/cake_size_test.png','Cake Size test\r\nThis is to test.\r\n\r\nThis is a cake with colors white, red, blue, chocolate, purple and green.\r\nIt is listed at $9.99.',2),(6,'Brown Coat','pictures/test_coat_image.jpg','This brown coat is of a beautiful color.\r\n\r\nThis is our only brown coat.\r\nPrice is just $23.99.',7),(7,'Chocolate Cake','pictures/large_cake_image.jpeg','Kids love chocolate cake!\r\nThis is a cake of color chocolate.\r\nPrice is $9.99!',6),(8,'Wedding Cake','pictures/wedding_cake01.jpeg','This is a huge and beautiful wedding cake.\r\nThis is a white cake and the price tag is $12.99.',3);
/*!40000 ALTER TABLE `descriptions_picturedescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-12-05 02:00:54.489666','1','PictureDescription object (1)',1,'[{\"added\": {}}]',8,1),(2,'2023-12-05 02:01:00.583803','1','Small Daisy Inserts',1,'[{\"added\": {}}]',7,1),(3,'2023-12-05 02:01:37.107058','2','PictureDescription object (2)',1,'[{\"added\": {}}]',8,1),(4,'2023-12-05 02:01:38.591890','2','Goldbelly Red Rose',1,'[{\"added\": {}}]',7,1),(5,'2023-12-05 02:02:20.113449','3','PictureDescription object (3)',1,'[{\"added\": {}}]',8,1),(6,'2023-12-05 02:02:21.907717','3','Pink Rose Chocolate',1,'[{\"added\": {}}]',7,1),(7,'2023-12-05 02:03:03.192571','4','PictureDescription object (4)',1,'[{\"added\": {}}]',8,1),(8,'2023-12-05 02:03:04.312674','4','Floral Cake',1,'[{\"added\": {}}]',7,1),(9,'2023-12-05 20:07:21.021520','1','None',1,'[{\"added\": {}}]',9,1),(10,'2023-12-05 20:07:27.948237','4','Floral Cake',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',7,1),(11,'2023-12-05 20:08:09.691760','2','9.99',1,'[{\"added\": {}}]',9,1),(12,'2023-12-05 20:08:12.363089','4','Floral Cake',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',7,1),(13,'2023-12-05 20:14:45.512771','3','12.99',1,'[{\"added\": {}}]',9,1),(14,'2023-12-05 20:14:47.225710','3','Pink Rose Chocolate',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',7,1),(15,'2023-12-05 20:15:04.178938','4','4.99',1,'[{\"added\": {}}]',9,1),(16,'2023-12-05 20:15:09.066351','2','Goldbelly Red Rose',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',7,1),(17,'2023-12-05 20:15:13.482090','2','Goldbelly Red Rose',2,'[]',7,1),(18,'2023-12-05 20:15:22.586627','5','8.99',1,'[{\"added\": {}}]',9,1),(19,'2023-12-05 20:15:33.702312','1','Small Daisy Inserts',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',7,1),(20,'2023-12-05 23:30:40.362988','5','PictureDescription object (5)',1,'[{\"added\": {}}]',8,1),(21,'2023-12-05 23:31:22.971768','6','9.99',1,'[{\"added\": {}}]',9,1),(22,'2023-12-05 23:31:34.170342','5','Cake Size Test',1,'[{\"added\": {}}]',7,1),(23,'2023-12-06 04:07:56.012818','7','23.99',1,'[{\"added\": {}}]',9,1),(24,'2023-12-06 04:07:57.651899','6','PictureDescription object (6)',1,'[{\"added\": {}}]',8,1),(25,'2023-12-06 04:08:00.468789','6','Brown Coat',1,'[{\"added\": {}}]',7,1),(26,'2023-12-06 04:08:18.888959','8','23.99',1,'[{\"added\": {}}]',9,1),(27,'2023-12-06 04:08:20.910241','6','Brown Coat',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',7,1),(28,'2023-12-06 04:52:31.073018','7','PictureDescription object (7)',1,'[{\"added\": {}}]',8,1),(29,'2023-12-06 04:52:52.417538','9','9.99',1,'[{\"added\": {}}]',9,1),(30,'2023-12-06 04:52:54.204681','7','Chocolate Cake',1,'[{\"added\": {}}]',7,1),(31,'2023-12-06 05:43:10.760097','8','PictureDescription object (8)',1,'[{\"added\": {}}]',8,1),(32,'2023-12-06 05:43:24.432680','10','12.99',1,'[{\"added\": {}}]',9,1),(33,'2023-12-06 05:43:32.808944','8','Wedding Cake',1,'[{\"added\": {}}]',7,1),(34,'2023-12-06 06:13:44.388259','4','Floral Cake',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,1),(35,'2023-12-06 06:13:57.674023','4','PictureDescription object (4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(36,'2023-12-06 06:14:39.223596','4','PictureDescription object (4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(37,'2023-12-06 06:14:50.274689','4','PictureDescription object (4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(38,'2023-12-06 06:15:14.001685','4','PictureDescription object (4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(39,'2023-12-06 06:15:33.501208','4','Floral Cake',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,1),(40,'2023-12-06 06:15:45.772958','4','Floral Cake',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,1),(41,'2023-12-06 06:16:05.109874','4','Floral Cake',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,1),(42,'2023-12-07 19:19:26.378458','1','Small Daisy Inserts',1,'[{\"added\": {}}]',10,1),(43,'2023-12-07 20:56:58.956907','8','Wedding Cake',2,'[{\"changed\": {\"fields\": [\"Color\", \"Occasion\", \"Flavor\", \"Cake type\"]}}]',7,1),(44,'2023-12-07 20:57:29.713448','7','Chocolate Cake',2,'[{\"changed\": {\"fields\": [\"Color\", \"Occasion\", \"Flavor\", \"Cake type\"]}}]',7,1),(45,'2023-12-08 03:50:42.206943','8','PictureDescription object (8)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(46,'2023-12-08 03:51:06.527266','7','PictureDescription object (7)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(47,'2023-12-08 03:51:26.089615','6','PictureDescription object (6)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(48,'2023-12-08 03:52:32.829163','5','PictureDescription object (5)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(49,'2023-12-08 03:53:07.317389','4','PictureDescription object (4)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(50,'2023-12-08 03:54:04.571091','3','PictureDescription object (3)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(51,'2023-12-08 03:54:24.596465','2','PictureDescription object (2)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1),(52,'2023-12-08 03:54:49.701650','1','PictureDescription object (1)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'descriptions','picturedescription'),(10,'galleryapp','cake'),(7,'galleryapp','gallerypicture'),(9,'pricesapp','price'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-05 01:51:43.299362'),(2,'auth','0001_initial','2023-12-05 01:51:43.678485'),(3,'admin','0001_initial','2023-12-05 01:51:43.773098'),(4,'admin','0002_logentry_remove_auto_add','2023-12-05 01:51:43.782845'),(5,'admin','0003_logentry_add_action_flag_choices','2023-12-05 01:51:43.792896'),(6,'contenttypes','0002_remove_content_type_name','2023-12-05 01:51:43.838955'),(7,'auth','0002_alter_permission_name_max_length','2023-12-05 01:51:43.852060'),(8,'auth','0003_alter_user_email_max_length','2023-12-05 01:51:43.865598'),(9,'auth','0004_alter_user_username_opts','2023-12-05 01:51:43.874944'),(10,'auth','0005_alter_user_last_login_null','2023-12-05 01:51:43.910044'),(11,'auth','0006_require_contenttypes_0002','2023-12-05 01:51:43.917794'),(12,'auth','0007_alter_validators_add_error_messages','2023-12-05 01:51:43.927320'),(13,'auth','0008_alter_user_username_max_length','2023-12-05 01:51:43.940873'),(14,'auth','0009_alter_user_last_name_max_length','2023-12-05 01:51:43.956734'),(15,'auth','0010_alter_group_name_max_length','2023-12-05 01:51:43.971163'),(16,'auth','0011_update_proxy_permissions','2023-12-05 01:51:43.981095'),(17,'auth','0012_alter_user_first_name_max_length','2023-12-05 01:51:43.993915'),(18,'descriptions','0001_initial','2023-12-05 01:51:44.010739'),(19,'galleryapp','0001_initial','2023-12-05 01:51:44.024735'),(20,'galleryapp','0002_gallerypicture_delete_picture','2023-12-05 01:51:44.086258'),(21,'sessions','0001_initial','2023-12-05 01:51:44.111015'),(22,'pricesapp','0001_initial','2023-12-05 20:06:35.521477'),(23,'descriptions','0002_picturedescription_price','2023-12-05 20:06:35.570852'),(24,'galleryapp','0003_gallerypicture_price','2023-12-05 20:06:35.615051'),(25,'galleryapp','0004_cake','2023-12-07 18:47:00.749105'),(26,'galleryapp','0005_gallerypicture_cake_type_gallerypicture_color_and_more','2023-12-07 20:52:22.302904');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('f404crd4mu15l0ucsgpj46osq4kcrydl','.eJxVjDsOwjAQBe_iGlnexb9Q0ucMltde4wCypXwqxN0hUgpo38y8lwhxW2vYFp7DlMVFgDj9bhTTg9sO8j22W5ept3WeSO6KPOgix575eT3cv4Mal_qtI2mwXgOfjSqI1hcCsAMMRM6A0mhK1spZVoyIxngPbiiOVEJmk0i8P7IzNto:1rBRsE:FYDc_G_FzZrMNYkhSZwa3U_DveNf-M9moIU7Ou9nnLU','2023-12-22 03:49:58.196897'),('klda3k7mda5j136zpbk0h0duddwsynh5','.eJxVjDsOwjAQBe_iGlnexb9Q0ucMltde4wCypXwqxN0hUgpo38y8lwhxW2vYFp7DlMVFgDj9bhTTg9sO8j22W5ept3WeSO6KPOgix575eT3cv4Mal_qtI2mwXgOfjSqI1hcCsAMMRM6A0mhK1spZVoyIxngPbiiOVEJmk0i8P7IzNto:1rBHs7:VtIAznlonCDcTSKD5sPIKWOUSFt4fclUb4zLa8OjSiE','2023-12-21 17:09:11.914469'),('n4lc5f9el3lu22jgmat9iddd1jkp3zfh','.eJxVjDsOwjAQBe_iGlnexb9Q0ucMltde4wCypXwqxN0hUgpo38y8lwhxW2vYFp7DlMVFgDj9bhTTg9sO8j22W5ept3WeSO6KPOgix575eT3cv4Mal_qtI2mwXgOfjSqI1hcCsAMMRM6A0mhK1spZVoyIxngPbiiOVEJmk0i8P7IzNto:1rAeqb:cO8CM6X1vKRWu8aMZQvYxCnwiDf-7wePUo6f82XdNDo','2023-12-19 23:29:01.381363'),('t8kjf9l2g21rdkulimlcednf8v4n28gf','.eJxVjDsOwjAQBe_iGlnexb9Q0ucMltde4wCypXwqxN0hUgpo38y8lwhxW2vYFp7DlMVFgDj9bhTTg9sO8j22W5ept3WeSO6KPOgix575eT3cv4Mal_qtI2mwXgOfjSqI1hcCsAMMRM6A0mhK1spZVoyIxngPbiiOVEJmk0i8P7IzNto:1rAbh7:KJK6ScMekdBpVucfsymvATyrhT-6y7qu2E74_bwknGg','2023-12-19 20:07:01.521626'),('vihuwd3p9azgfd9ysbt2bavni60htav8','.eJxVjDsOwjAQBe_iGlnexb9Q0ucMltde4wCypXwqxN0hUgpo38y8lwhxW2vYFp7DlMVFgDj9bhTTg9sO8j22W5ept3WeSO6KPOgix575eT3cv4Mal_qtI2mwXgOfjSqI1hcCsAMMRM6A0mhK1spZVoyIxngPbiiOVEJmk0i8P7IzNto:1rAKiy:wudF5h9JnaC76KFcgFMGYbZTjR090GeU8wzPhyBtTws','2023-12-19 01:59:48.773456');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleryapp_cake`
--

DROP TABLE IF EXISTS `galleryapp_cake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleryapp_cake` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `color` varchar(50) NOT NULL,
  `event` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleryapp_cake`
--

LOCK TABLES `galleryapp_cake` WRITE;
/*!40000 ALTER TABLE `galleryapp_cake` DISABLE KEYS */;
INSERT INTO `galleryapp_cake` VALUES (1,'Small Daisy Inserts','green white','Saint Patrick\'s Day');
/*!40000 ALTER TABLE `galleryapp_cake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleryapp_gallerypicture`
--

DROP TABLE IF EXISTS `galleryapp_gallerypicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleryapp_gallerypicture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description_link_id` bigint(20) NOT NULL,
  `price_id` bigint(20) DEFAULT NULL,
  `cake_type` varchar(150) DEFAULT NULL,
  `color` varchar(75) DEFAULT NULL,
  `flavor` varchar(75) DEFAULT NULL,
  `occasion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `price_id` (`price_id`),
  KEY `galleryapp_gallerypi_description_link_id_d9e49480_fk_descripti` (`description_link_id`),
  CONSTRAINT `galleryapp_gallerypi_description_link_id_d9e49480_fk_descripti` FOREIGN KEY (`description_link_id`) REFERENCES `descriptions_picturedescription` (`id`),
  CONSTRAINT `galleryapp_gallerypi_price_id_bb0e1da2_fk_pricesapp` FOREIGN KEY (`price_id`) REFERENCES `pricesapp_price` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleryapp_gallerypicture`
--

LOCK TABLES `galleryapp_gallerypicture` WRITE;
/*!40000 ALTER TABLE `galleryapp_gallerypicture` DISABLE KEYS */;
INSERT INTO `galleryapp_gallerypicture` VALUES (1,'Small Daisy Inserts','small_daisy_inserts','pictures/small_daisy_inserts_TDQdu3v.png',1,5,NULL,NULL,NULL,NULL),(2,'Goldbelly Red Rose','goldbelly_red_rose','pictures/goldbelly_red_rose_mP3ImI1.png',2,4,NULL,NULL,NULL,NULL),(3,'Pink Rose Chocolate','pink_rose_chocolate','pictures/pink_rose_chocolate_AvF3iTN.png',3,3,NULL,NULL,NULL,NULL),(4,'Floral Cake','floral_cake','pictures/floral_cake_zv3XZ83.png',4,2,NULL,NULL,NULL,NULL),(5,'Cake Size Test','cake_size_test','pictures/cake_size_test_FqyniAs.png',5,6,NULL,NULL,NULL,NULL),(6,'Brown Coat','brown_coat','pictures/test_coat_image_StQKwMC.jpg',6,8,NULL,NULL,NULL,NULL),(7,'Chocolate Cake','chocolate_cake','pictures/large_cake_image_DlbB6f8.jpeg',7,9,'round','chocolate brown','chocolate','birthday'),(8,'Wedding Cake','wedding_cake','pictures/wedding_cake01_z2InnPe.jpeg',8,10,'big','white','mango','wedding');
/*!40000 ALTER TABLE `galleryapp_gallerypicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricesapp_price`
--

DROP TABLE IF EXISTS `pricesapp_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricesapp_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricesapp_price`
--

LOCK TABLES `pricesapp_price` WRITE;
/*!40000 ALTER TABLE `pricesapp_price` DISABLE KEYS */;
INSERT INTO `pricesapp_price` VALUES (1,NULL),(2,9.99),(3,12.99),(4,4.99),(5,8.99),(6,9.99),(7,23.99),(8,23.99),(9,9.99),(10,12.99);
/*!40000 ALTER TABLE `pricesapp_price` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 22:25:37
