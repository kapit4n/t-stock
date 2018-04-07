-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: t_stock
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `name` text,
  `type` varchar(30) DEFAULT NULL,
  `parent` int(6) DEFAULT NULL,
  `negativo` varchar(30) DEFAULT NULL,
  `description` text,
  `child` tinyint(1) DEFAULT NULL,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'1.0','ACTIVO','ACTIVO',0,'NO','',0,0,0,'2016-07-18 17:19:25'),(2,'1.1','ACTIVO CORRIENTE','ACTIVO',1,'NO','',0,0,0,'2016-07-18 17:20:01'),(3,'1.2','ACTIVO NO CORRIENTE','ACTIVO',1,'NO','',0,0,0,'2016-07-18 17:22:30'),(4,'1.1.1','ACTIVO DISPONIBLE','ACTIVO',2,'NO','',0,0,0,'2016-07-18 17:23:17'),(5,'1.1.2','ACTIVO EXIGIBLE','ACTIVO',2,'NO','',0,0,0,'2016-07-18 17:24:06'),(6,'1.1.1.1','CAJA MONEDA NACIONAL','ACTIVO',4,'NO','',0,0,0,'2016-07-18 17:25:19'),(7,'1.1.1.2','BANCO MONEDA NACIONAL','ACTIVO',4,'NO','',0,0,0,'2016-07-18 17:25:45'),(8,'1.1.1.1.1','Caja Moneda Nacional','ACTIVO',6,'NO','',1,0,0,'2016-07-18 17:26:28'),(9,'1.1.1.2.1','Banco Economico M/N','ACTIVO',7,'NO','',1,0,0,'2016-07-18 17:27:09'),(10,'1.1.2.1','IMPUESTOS POR RECUPERAR','ACTIVO',5,'NO','',0,0,0,'2016-07-18 17:28:52'),(11,'1.1.2.1.1','IVA Credito Fiscal','ACTIVO',10,'NO','',1,0,0,'2016-07-18 17:29:40'),(12,'1.2.1','ACTIVO FIJO','ACTIVO',3,'NO','',0,0,0,'2016-07-18 17:31:02'),(13,'1.2.1.1','MUEBLES Y ENSERES','ACTIVO',12,'NO','',0,0,0,'2016-07-18 17:31:53'),(14,'1.2.1.1.1','Muebles y Enseres','ACTIVO',13,'NO','',1,0,0,'2016-07-18 17:32:47'),(15,'1.2.1.1.2','Depreciacion Acum. Muebles Y Enseres','ACTIVO',13,'SI','',1,0,0,'2016-07-18 17:33:32'),(16,'1.2.1.2','EQUIPO DE COMPUTACION','ACTIVO',12,'NO','',0,0,0,'2016-07-18 17:34:32'),(17,'1.2.1.2.1','Equipo de Computacion','ACTIVO',16,'NO','',1,0,0,'2016-07-18 17:35:33'),(18,'1.2.1.2.2','Depreciacion Acumulada Equipo de Computacion','ACTIVO',16,'SI','',1,0,0,'2016-07-18 17:36:27'),(19,'1.2.1.3','EQUIPO E INSTALACION','ACTIVO',12,'NO','',0,0,0,'2016-07-18 17:37:41'),(20,'1.2.1.3.1','Equipo e Instalacion','ACTIVO',19,'NO','',1,0,0,'2016-07-18 17:38:49'),(21,'1.2.1.3.2','Depreciacion Acumulada Equipo e Instalacion','ACTIVO',19,'SI','',1,0,0,'2016-07-18 17:39:28'),(22,'3.0','PATRIMONIO','PATRIMONIO',0,'NO','',0,0,0,'2016-07-18 17:41:44'),(23,'3.1','PATRIMONIO','PATRIMONIO',22,'NO','',0,0,0,'2016-07-18 17:43:35'),(24,'3.2','PERDIDA DE LA GESTION','PATRIMONIO',22,'NO','',0,0,0,'2016-07-18 17:44:35'),(25,'3.1.1','Capital','PATRIMONIO',23,'NO','',1,0,0,'2016-07-18 17:45:56'),(26,'3.1.2','Ajuste de Capital','PATRIMONIO',23,'NO','',1,0,0,'2016-07-18 17:46:46'),(27,'3.1.3','Resultados Acumulados','PATRIMONIO',23,'NO','',1,0,0,'2016-07-18 17:47:19'),(28,'3.2.1','Perdida de la Gestion','PATRIMONIO',24,'NO','',1,0,0,'2016-07-18 17:47:57'),(29,'2.0','PASIVO','PASIVO',0,'NO','',1,0,0,'2016-07-18 17:49:22'),(30,'4.0','INCOMES','INCOME',0,'NO','',0,0,0,'2016-07-18 17:59:18'),(31,'4.1','INCOMES OPERATIVOS','INCOME',30,'NO','',0,0,0,'2016-07-18 18:04:49'),(32,'4.1.1','INCOMES POR VENTAS','INCOME',31,'NO','',1,0,0,'2016-07-18 18:07:29'),(33,'4.1.1.1','Income por Aportes de Socios','INCOME',33,'NO','',0,0,0,'2016-07-18 18:08:18'),(34,'4.2','OTROS INCOMES','INCOME',30,'NO','',0,0,0,'2016-07-18 18:08:50'),(35,'4.2.1','INCOMES NO OPERATIVOS','INCOME',34,'NO','',0,0,0,'2016-07-18 18:10:23'),(36,'4.2.1.1','Diferencia de Redondeos','INCOME',35,'NO','',1,0,0,'2016-07-18 18:10:52'),(37,'4.2.1.2','Incomes Reexpresados','INCOME',33,'NO','',1,0,0,'2016-07-18 18:11:42'),(38,'4.0','GASTOS','OUTCOME',0,'NO','',0,0,0,'2016-07-18 18:15:48'),(39,'4.1','GASTOS DE OPERATION','OUTCOME',38,'NO','',0,0,0,'2016-07-18 18:16:12'),(40,'4.1.1','COMBUSTIBLE Y LUBRICANTES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 18:16:57'),(41,'4.1.1.1','Combustibles','OUTCOME',40,'NO','',1,0,0,'2016-07-18 18:17:23'),(42,'4.1.2','CORREOS Y COURIER','OUTCOME',39,'NO','',0,0,0,'2016-07-18 18:17:54'),(43,'4.1.2.1','Correos y Courier','OUTCOME',42,'NO','',1,0,0,'2016-07-18 18:18:16'),(44,'4.1.3','DEPRECIACIONES DEL ACTIVO FIJO','OUTCOME',39,'NO','',0,0,0,'2016-07-18 18:19:09'),(45,'4.1.3.1','Depreciacion Equipo de Computacion','OUTCOME',44,'NO','',1,0,0,'2016-07-18 18:20:02'),(46,'4.1.3.2','Depreciacion Equipo de Instalacion','OUTCOME',44,'NO','',1,0,0,'2016-07-18 18:20:35'),(47,'4.1.3.3','Depreciacion Muebles y Enseres','OUTCOME',44,'NO','',1,0,0,'2016-07-18 18:21:02'),(48,'4.1.4','GASTOS GENERALES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 18:23:39'),(49,'4.1.4.1','Gastos de Representacion','OUTCOME',48,'NO','',1,0,0,'2016-07-18 18:24:07'),(50,'4.1.4.2','Gastos Generales','OUTCOME',48,'NO','',1,0,0,'2016-07-18 18:24:32'),(51,'4.1.4.3','Refrigerios al Personal','OUTCOME',48,'NO','',1,0,0,'2016-07-18 18:25:03'),(52,'4.1.5','SERVICIOS PROFECIONALES Y COMERCIALES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 18:26:05'),(53,'4.1.5.1','Imprenta y Papelera','OUTCOME',52,'NO','',1,0,0,'2016-07-18 18:26:35'),(54,'4.1.5.2','Propaganda y Publicidad','OUTCOME',52,'NO','',1,0,0,'2016-07-18 18:27:09'),(55,'4.1.6','MANTENIMIENTO Y REPARACIONES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 18:28:34'),(56,'4.1.6.1','Accesorios y Repuestos','OUTCOME',55,'NO','',1,0,0,'2016-07-18 18:29:26'),(57,'4.1.6.2','Mantenimiento Vehiculo','OUTCOME',55,'NO','',1,0,0,'2016-07-18 18:29:46'),(58,'4.1.7','MATERIALES DE ESCRITORIO Y OTROS MATERIALES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 18:30:30'),(59,'4.1.7.1','Materiales de Escritorio y Oficina','OUTCOME',58,'NO','',1,0,0,'2016-07-18 18:31:01'),(60,'4.1.7.2','Material Electrico','OUTCOME',58,'NO','',1,0,0,'2016-07-18 18:31:40'),(61,'4.1.8','PASAJES Y TRANSPORTES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 18:32:16'),(62,'4.1.8.1','Pasajes','OUTCOME',61,'NO','',1,0,0,'2016-07-18 18:32:34'),(63,'4.1.9','SERVICIOS BASICOS','OUTCOME',39,'NO','',0,0,0,'2016-07-18 18:33:26'),(64,'4.1.9.1','Servicios Telefonicos','OUTCOME',63,'NO','',1,0,0,'2016-07-18 18:33:54'),(65,'4.1.10','TRAMITES LEGALES','OUTCOME',39,'NO','',0,0,0,'2016-07-18 18:34:23'),(66,'4.1.10.1','Gastos legales y de tramites','OUTCOME',65,'NO','',1,0,0,'2016-07-18 18:34:46'),(67,'4.2','OTROS OUTCOMES','OUTCOME',38,'NO','',0,0,0,'2016-07-18 18:35:28'),(68,'4.2.1','Diferencia de Redondeos','OUTCOME',67,'NO','',1,0,0,'2016-07-18 18:35:57'),(69,'4.2.2','AITB','OUTCOME',67,'NO','',1,0,0,'2016-07-18 18:36:14'),(70,'4.2.3','Outcomes Reexpresados','OUTCOME',67,'NO','',1,0,0,'2016-07-18 18:36:39');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancos` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `currentMoney` varchar(30) DEFAULT NULL,
  `typeMoney` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `name` varchar(80) NOT NULL,
  `description` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('GADGETS','Description OF GADGETS'),('MILK','Description of MILK'),('RAWMATERIAL','RAW MATERIAL'),('TRUNK','TRUNK');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (10001,'APL'),(10002,'ADEPLEC'),(10004,'ACRHOBOL'),(10005,'APLI'),(10006,'ALVA'),(10007,'AMLECO');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `carnet` int(11) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `account` varchar(30) DEFAULT NULL,
  `companyName` text,
  `status` varchar(30) DEFAULT NULL,
  `totalDebt` double DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Daniel Campos',22333,22333,'Address','2225','Company Name 1','status',0,'2016-06-18 03:53:08');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discountDetail`
--

DROP TABLE IF EXISTS `discountDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discountDetail` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `discountReport` int(11) DEFAULT NULL,
  `requestRow` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `customerName` text,
  `status` varchar(30) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discountDetail`
--

LOCK TABLES `discountDetail` WRITE;
/*!40000 ALTER TABLE `discountDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `discountDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discountReport`
--

DROP TABLE IF EXISTS `discountReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discountReport` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `startDate` varchar(30) DEFAULT NULL,
  `endDate` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discountReport`
--

LOCK TABLES `discountReport` WRITE;
/*!40000 ALTER TABLE `discountReport` DISABLE KEYS */;
/*!40000 ALTER TABLE `discountReport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logEntry`
--

DROP TABLE IF EXISTS `logEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logEntry` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(100) DEFAULT NULL,
  `tableName1` varchar(100) DEFAULT NULL,
  `userId` int(6) DEFAULT NULL,
  `userName` text,
  `description` text,
  `link` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logEntry`
--

LOCK TABLES `logEntry` WRITE;
/*!40000 ALTER TABLE `logEntry` DISABLE KEYS */;
INSERT INTO `logEntry` VALUES (1,'Actualizado','Product Cost',1,'admin','Product Cost (3.0) fue Actualizado por admin','','2018-03-21 05:29:52'),(2,'Actualizado','Product Cost',1,'admin','Product Cost (5.0) fue Actualizado por admin','','2018-03-21 05:30:02'),(3,'Created','Order',1,'admin','Order (Order 1) fue Created por admin','','2018-03-24 12:54:04'),(4,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product 2( 10)) fue Actualizado por admin','','2018-03-24 12:54:56'),(5,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product 4( 1)) fue Actualizado por admin','','2018-03-30 00:08:58'),(6,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product 3( 1)) fue Actualizado por admin','','2018-03-30 02:19:29'),(7,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product 4( 1)) fue Actualizado por admin','','2018-03-31 23:50:13'),(8,'Created','Product',1,'admin','Product (Product x1) fue Created por admin','','2018-04-01 19:35:12'),(9,'Created','Product',1,'admin','Product (Product x2) fue Created por admin','','2018-04-01 19:35:50'),(10,'Created','Product',1,'admin','Product (Product x3) fue Created por admin','','2018-04-01 19:43:15'),(11,'Created','Product',1,'admin','Product (Product x4) fue Created por admin','','2018-04-01 19:44:00'),(12,'Created','Product',1,'admin','Product (Product x5) fue Created por admin','','2018-04-01 19:44:54'),(13,'Created','Product',1,'admin','Product (Product x6) fue Created por admin','','2018-04-01 19:45:45'),(14,'Created','Product',1,'admin','Product (Product x7) fue Created por admin','','2018-04-01 19:46:15'),(15,'Actualizado','Product',1,'admin','Product (Leche pil) fue Actualizado por admin','','2018-04-01 19:46:36'),(16,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product x5( 1)) fue Actualizado por admin','','2018-04-01 19:47:06'),(17,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product x6( 1)) fue Actualizado por admin','','2018-04-01 19:47:10'),(18,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product x1( 1)) fue Actualizado por admin','','2018-04-01 19:47:13'),(19,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product x2( 1)) fue Actualizado por admin','','2018-04-01 20:04:38'),(20,'Actualizado','Detail of Report',1,'admin','Detail of Report (Leche pil( 1)) fue Actualizado por admin','','2018-04-01 20:04:50'),(21,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product x5( 1)) fue Actualizado por admin','','2018-04-01 20:05:23'),(22,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product 2( 1)) fue Actualizado por admin','','2018-04-01 20:05:29'),(23,'Created','Product',1,'admin','Product (Product x7) fue Created por admin','','2018-04-01 20:11:48'),(24,'Created','Product',1,'admin','Product (Product x8) fue Created por admin','','2018-04-01 20:13:21'),(25,'Created','Product',1,'admin','Product (Product x9) fue Created por admin','','2018-04-01 20:16:59'),(26,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product x4( 1)) fue Actualizado por admin','','2018-04-01 20:19:18'),(27,'Created','Product',1,'admin','Product (Product x11) fue Created por admin','','2018-04-01 20:24:25'),(28,'Created','Product',1,'admin','Product (Product x12) fue Created por admin','','2018-04-01 20:32:15'),(29,'Created','Product',1,'admin','Product (Product x13) fue Created por admin','','2018-04-01 20:35:29'),(30,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product x5( 10)) fue Actualizado por admin','','2018-04-01 20:58:08'),(31,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product x9( 1)) fue Actualizado por admin','','2018-04-06 00:40:37'),(32,'Actualizado','Detail of Report',1,'admin','Detail of Report (Product x12( 1)) fue Actualizado por admin','','2018-04-06 00:48:15');
/*!40000 ALTER TABLE `logEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure`
--

DROP TABLE IF EXISTS `measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `quantity` double DEFAULT NULL,
  `description` text,
  `measureId` int(11) DEFAULT NULL,
  `measureName` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (1,'250 ML',250,'250 ML',0,'Ninguno'),(2,'100 ML',100,'Description',0,'Ninguno'),(3,'10gr',10,'10 Gramos',0,'Ninguno'),(4,'80X2mm',2,'Description',0,'Ninguno'),(5,'250cc',250,'250cc',0,'Ninguno'),(6,'20ML',20,'Description',0,'Ninguno'),(7,'500ML',500,'500ML',0,'Ninguno'),(8,'1LITRO',1000,'Description',0,'Ninguno'),(9,'200GRS',200,'200GRS',0,'Ninguno'),(10,'10GRS',10,'10GRS',0,'Ninguno'),(11,'50SOB. X 10GRS.',50,'50SOB. X 10GRS.',0,'Ninguno'),(12,'100 X 1KG',100,'100 X 1KG',0,'Ninguno'),(13,'100 X 25KG',25,'100 X 25KG',0,'Ninguno'),(14,'VALDE X 18KG',1,'VALDE X 18KG',0,'Ninguno'),(15,'VALDE X 4KG',1,'VALDE X 4KG',0,'Ninguno'),(16,'Unidad',1,'Unidad',0,'Ninguno'),(17,'1 ML',1,'1 ML',0,'Ninguno'),(18,'1 GR',1,'1 GR',0,'Ninguno');
/*!40000 ALTER TABLE `measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play_evolutions`
--

DROP TABLE IF EXISTS `play_evolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `play_evolutions` (
  `id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `apply_script` mediumtext,
  `revert_script` mediumtext,
  `state` varchar(255) DEFAULT NULL,
  `last_problem` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play_evolutions`
--

LOCK TABLES `play_evolutions` WRITE;
/*!40000 ALTER TABLE `play_evolutions` DISABLE KEYS */;
INSERT INTO `play_evolutions` VALUES (1,'3bbaca7f17f12e7cbcc0cd8b648d45fa8a2b8c31','2018-03-21 04:57:28','create table company (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nname TEXT not null\n);\n\ncreate table category (\nname VARCHAR(80) NOT NULL PRIMARY KEY,\ndescription TEXT\n);\n\ncreate table measure (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nname TEXT,\nquantity double,\ndescription TEXT,\nmeasureId INT,\nmeasureName TEXT\n);\n\ncreate table account (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\ncode VARCHAR(30),\nname TEXT,\ntype VARCHAR(30),\nparent INT(6),\nnegativo VARCHAR(30),\ndescription TEXT,\nchild boolean,\ndebit double,\ncredit double,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table transaction (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\ndate VARCHAR(30),\ntype VARCHAR(30),\ndescription TEXT,\ncreatedBy INT,\ncreatedByName TEXT,\nautorizedBy INT,\nautorizedByName TEXT,\nreceivedBy INT,\nreceivedByName TEXT,\nupdatedBy INT(6),\nupdatedByName TEXT,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table setting (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nname TEXT,\npresident VARCHAR(50),\nlanguage VARCHAR(50),\ndescription TEXT\n);\n\ncreate table logEntry (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\naction VARCHAR(100),\ntableName1 VARCHAR(100),\nuserId INT(6),\nuserName TEXT,\ndescription TEXT,\nlink TEXT,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table transactionDetail (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\ntransaction INT,\naccount INT,\ndebit double,\ncredit double,\ntransactionDate VARCHAR(30),\naccountCode VARCHAR(30),\naccountName TEXT,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\ncreatedBy INT,\ncreatedByName TEXT\n);\n\ncreate table bancos (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nname TEXT not null,\ntipo VARCHAR(30) not null,\ncurrentMoney VARCHAR(30),\ntypeMoney VARCHAR(30)\n);\n\ncreate table product (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nname TEXT not null,\ncost double DEFAULT 0,\ntotalValue double DEFAULT 0,\npercent double DEFAULT 0,\nprice double DEFAULT 0,\ndescription TEXT,\nmeasureId INT DEFAULT 0,\nmeasureName TEXT,\ncurrentAmount INT,\nstockLimit INT,\nvendorId INT DEFAULT 0,\nvendorName TEXT,\nvendorCode VARCHAR(50) DEFAULT \'\',\ncategory VARCHAR(50) DEFAULT \'\',\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table customer (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nname TEXT not null,\ncarnet INT not null,\nphone INT,\naddress VARCHAR(100),\naccount VARCHAR(30),\ncompanyName TEXT,\nstatus VARCHAR(30),\ntotalDebt double,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table vendor (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nname TEXT not null,\nphone INT,\naddress VARCHAR(100),\ncontact VARCHAR(100),\naccount INT,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table vendorContract (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nvendorId VARCHAR(100) not null,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\nstartDate DATE,\ndueDate DATE\n);\n\ncreate table vendorContractItem (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\ncontractId INT not null,\nproductId INT not null,\nstartDate DATE,\ndueDate DATE,\ncost INT,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table reportes (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nmonto INT not null,\naccount INT not null,\ncliente INT not null,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table user (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nname TEXT not null,\ncarnet INT not null,\nphone INT,\naddress VARCHAR(30),\nSalary INT,\ntype VARCHAR(30),\nlogin VARCHAR(30),\npassword VARCHAR(30),\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table userRole (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nuserId INT,\nroleName TEXT,\nroleCode VARCHAR(50)\n);\n\ncreate table productVendor (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nproductId INT,\nvendorId INT,\ncost double  DEFAULT 0\n);\n\ncreate table roles (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nroleName TEXT,\nroleCode VARCHAR(50)\n);\n\ncreate table productRequest (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\ndate VARCHAR(30),\nemployee INT,\nemployeename TEXT,\nstorekeeper INT,\nstorekeeperName TEXT,\nuser INT,\nuserName TEXT,\nmodule INT,\nmoduleName TEXT,\ntotalPrice double,\npaid double,\ncredit double,\npaidDriver double,\ncreditDriver double,\nstatus VARCHAR(30),\ndetail VARCHAR(250),\ntype VARCHAR(30),\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\ncreatedBy INT,\ncreatedByName TEXT,\nacceptedBy INT,\nacceptedByName TEXT,\nacceptedAt Date\n);\n\ncreate table requestRow (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nrequestId INT,\nproductId INT,\nproductName TEXT,\ncustomerId INT,\ncustomerName TEXT,\nquantity INT,\nprice double,\ntotalPrice double,\npaid double,\ncredit double,\npaidDriver double,\ncreditDriver double,\nmeasureId INT,\nmeasureName TEXT,\nstatus VARCHAR(30),\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\ncreatedBy INT,\ncreatedByName TEXT\n);\n\ncreate table requestRowCustomer (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nrequestRowId INT,\nproductId INT,\nproductName TEXT,\ncustomerId INT,\ncustomerName TEXT,\nmeasureId INT,\nmeasureName TEXT,\nquantity INT,\nprice double,\ntotalPrice double,\npaid double,\ncredit double,\nstatus VARCHAR(30),\ntype VARCHAR(30),\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\ncreatedBy INT,\ncreatedByName TEXT,\npayType VARCHAR(20)\n);\n\ncreate table productInv (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nproductId INT,\nvendorId INT,\nmeasureId INT,\nproductName TEXT,\nvendorName TEXT,\nmeasureName TEXT,\namount INT,\namountLeft INT,\ncost_unit double  DEFAULT 0,\ntotal_cost double  DEFAULT 0,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table productTransform (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nproductId INT,\nvendorId INT,\nmeasureId INT,\nproductName TEXT,\nvendorName TEXT,\nmeasureName TEXT,\namount INT,\namountLeft INT,\ncost_unit double  DEFAULT 0,\ntotal_cost double  DEFAULT 0,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table productTransformDetail (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nproductTranformId INT,\nstatus text,\nmeasureId INT,\nproductName TEXT,\nvendorName TEXT,\nmeasureName TEXT,\namount INT,\namountLeft INT,\ncost_unit double  DEFAULT 0,\ntotal_cost double  DEFAULT 0,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table productTransformRaw (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nproductTransformId INT,\nproductId INT,\ntypeId INT,\nmeasureId INT,\nproductName TEXT,\nvendorName TEXT,\nmeasureName TEXT,\namount INT,\namountLeft INT,\ncost_unit double  DEFAULT 0,\ntotal_cost double  DEFAULT 0,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table discountReport (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\nstartDate VARCHAR(30),\nendDate VARCHAR(30),\nstatus VARCHAR(30),\ntotal double,\nuser_id INT,\ncreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP\n);\n\ncreate table discountDetail (\nid INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,\ndiscountReport INT,\nrequestRow INT,\ncustomerId INT,\ncustomerName TEXT,\nstatus VARCHAR(30),\ndiscount double\n);','drop table IF EXISTS bancos;\ndrop table IF EXISTS user;\ndrop table IF EXISTS company;\ndrop table IF EXISTS category;\ndrop table IF EXISTS account;\ndrop table IF EXISTS customer;\ndrop table IF EXISTS transaction;\ndrop table IF EXISTS transactionDetail;\ndrop table IF EXISTS vendor;\ndrop table IF EXISTS vendorContract;\ndrop table IF EXISTS vendorContractItem;\ndrop table IF EXISTS reportes;\ndrop table IF EXISTS product;\ndrop table IF EXISTS productInv;\ndrop table IF EXISTS productTransformDetail;\ndrop table IF EXISTS productTransform;\ndrop table IF EXISTS productTransformRaw;\ndrop table IF EXISTS discountReport;\ndrop table IF EXISTS discountDetail;\ndrop table IF EXISTS requestRow;\ndrop table IF EXISTS productRequest;\ndrop table IF EXISTS requestRowCustomer;\ndrop table IF EXISTS logEntry;\ndrop table IF EXISTS measure;\ndrop table IF EXISTS setting;\ndrop table IF EXISTS roles;\ndrop table IF EXISTS userRole;\ndrop table IF EXISTS productVendor;','applied','');
/*!40000 ALTER TABLE `play_evolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `cost` double DEFAULT '0',
  `totalValue` double DEFAULT '0',
  `percent` double DEFAULT '0',
  `price` double DEFAULT '0',
  `description` text,
  `measureId` int(11) DEFAULT '0',
  `measureName` text,
  `currentAmount` int(11) DEFAULT NULL,
  `stockLimit` int(11) DEFAULT NULL,
  `vendorId` int(11) DEFAULT '0',
  `vendorName` text,
  `vendorCode` varchar(50) DEFAULT '',
  `category` varchar(50) DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Product 1',10,0,0.1,11,'description',16,'Unidad',12,10,0,'DI','0','TRUNK','2018-03-21 04:58:34'),(2,'Product 2',10,0,0.1,11,'description',16,'Unidad',0,10,0,'DI','0','RAWMATERIAL','2018-03-21 04:58:34'),(3,'Product 3',10,0,0.1,11,'description',16,'Unidad',2,10,0,'DI','0','TRUNK','2018-03-21 04:58:34'),(4,'Product 4',10,0,0.1,11,'description',16,'Unidad',0,10,0,'DI','0','RAWMATERIAL','2018-03-21 04:58:34'),(5,'Product x1',30,0,1,60,'This is a product 1',12,'100 X 1KG',20,2,0,NULL,'','MILK','2018-04-01 19:35:12'),(6,'Product x2',78,0,8,702,'This is a new example',8,'1LITRO',29,10,0,NULL,'','MILK','2018-04-01 19:35:50'),(7,'Product x3',89,0,3,356,'hh',12,'100 X 1KG',50,5,0,NULL,'','MILK','2018-04-01 19:43:15'),(8,'Product x4',80,0,8,720,'uuu',12,'100 X 1KG',35,3,0,NULL,'','GADGET','2018-04-01 19:44:01'),(9,'Product x5',90,0,3,360,'hh',12,'100 X 1KG',200,20,0,NULL,'','GADGET','2018-04-01 19:44:54'),(10,'Product x6',69,0,4,345,'sss',8,'1LITRO',79,7,0,NULL,'','MILK','2018-04-01 19:45:45'),(11,'Leche pil',6,0,9,60,'',12,'100 X 1KG',10,3,0,NULL,'','MILK','2018-04-01 19:46:16'),(12,'Product x7',10,0,3,40,'',12,'100 X 1KG',40,5,0,NULL,'','MILK','2018-04-01 20:11:48'),(13,'Product x8',20,0,10,220,'Description',12,'100 X 1KG',100,10,0,NULL,'','MILK','2018-04-01 20:13:21'),(14,'Product x9',40,0,0.3,52,'',12,'100 X 1KG',30,5,0,NULL,'','MILK','2018-04-01 20:16:59'),(15,'Product x11',8,0,1,16,'Description of the products',12,'100 X 1KG',100,10,0,NULL,'','MILK','2018-04-01 20:24:25'),(16,'Product x12',20,0,0.4,28,'This is an gatget',16,'Unidad',200,20,0,NULL,'','MILK','2018-04-01 20:32:16'),(17,'Product x13',30,0,0.2,36,'This is the functionality',16,'Unidad',100,10,0,NULL,'','MILK','2018-04-01 20:35:29');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productInv`
--

DROP TABLE IF EXISTS `productInv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productInv` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `vendorId` int(11) DEFAULT NULL,
  `measureId` int(11) DEFAULT NULL,
  `productName` text,
  `vendorName` text,
  `measureName` text,
  `amount` int(11) DEFAULT NULL,
  `amountLeft` int(11) DEFAULT NULL,
  `cost_unit` double DEFAULT '0',
  `total_cost` double DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productInv`
--

LOCK TABLES `productInv` WRITE;
/*!40000 ALTER TABLE `productInv` DISABLE KEYS */;
INSERT INTO `productInv` VALUES (1,1,1,16,'Product 1','Proveedor 1','Unidad',12,12,0,0,'2018-03-24 13:18:19');
/*!40000 ALTER TABLE `productInv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productRequest`
--

DROP TABLE IF EXISTS `productRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productRequest` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(30) DEFAULT NULL,
  `employee` int(11) DEFAULT NULL,
  `employeename` text,
  `storekeeper` int(11) DEFAULT NULL,
  `storekeeperName` text,
  `user` int(11) DEFAULT NULL,
  `userName` text,
  `module` int(11) DEFAULT NULL,
  `moduleName` text,
  `totalPrice` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `paidDriver` double DEFAULT NULL,
  `creditDriver` double DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `detail` varchar(250) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `createdByName` text,
  `acceptedBy` int(11) DEFAULT NULL,
  `acceptedByName` text,
  `acceptedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productRequest`
--

LOCK TABLES `productRequest` WRITE;
/*!40000 ALTER TABLE `productRequest` DISABLE KEYS */;
INSERT INTO `productRequest` VALUES (1,'Order 1',4,'Employee 1',5,'Store',0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'borrador','Detalle','veterinaria','2018-03-24 12:54:05',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `productRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productTransform`
--

DROP TABLE IF EXISTS `productTransform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productTransform` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `vendorId` int(11) DEFAULT NULL,
  `measureId` int(11) DEFAULT NULL,
  `productName` text,
  `vendorName` text,
  `measureName` text,
  `amount` int(11) DEFAULT NULL,
  `amountLeft` int(11) DEFAULT NULL,
  `cost_unit` double DEFAULT '0',
  `total_cost` double DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productTransform`
--

LOCK TABLES `productTransform` WRITE;
/*!40000 ALTER TABLE `productTransform` DISABLE KEYS */;
/*!40000 ALTER TABLE `productTransform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productTransformDetail`
--

DROP TABLE IF EXISTS `productTransformDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productTransformDetail` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `productTranformId` int(11) DEFAULT NULL,
  `status` text,
  `measureId` int(11) DEFAULT NULL,
  `productName` text,
  `vendorName` text,
  `measureName` text,
  `amount` int(11) DEFAULT NULL,
  `amountLeft` int(11) DEFAULT NULL,
  `cost_unit` double DEFAULT '0',
  `total_cost` double DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productTransformDetail`
--

LOCK TABLES `productTransformDetail` WRITE;
/*!40000 ALTER TABLE `productTransformDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `productTransformDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productTransformRaw`
--

DROP TABLE IF EXISTS `productTransformRaw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productTransformRaw` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `productTransformId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `measureId` int(11) DEFAULT NULL,
  `productName` text,
  `vendorName` text,
  `measureName` text,
  `amount` int(11) DEFAULT NULL,
  `amountLeft` int(11) DEFAULT NULL,
  `cost_unit` double DEFAULT '0',
  `total_cost` double DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productTransformRaw`
--

LOCK TABLES `productTransformRaw` WRITE;
/*!40000 ALTER TABLE `productTransformRaw` DISABLE KEYS */;
/*!40000 ALTER TABLE `productTransformRaw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productVendor`
--

DROP TABLE IF EXISTS `productVendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productVendor` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `vendorId` int(11) DEFAULT NULL,
  `cost` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productVendor`
--

LOCK TABLES `productVendor` WRITE;
/*!40000 ALTER TABLE `productVendor` DISABLE KEYS */;
INSERT INTO `productVendor` VALUES (1,1,2,5);
/*!40000 ALTER TABLE `productVendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportes` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `monto` int(11) NOT NULL,
  `account` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestRow`
--

DROP TABLE IF EXISTS `requestRow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestRow` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `requestId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `productName` text,
  `customerId` int(11) DEFAULT NULL,
  `customerName` text,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `paidDriver` double DEFAULT NULL,
  `creditDriver` double DEFAULT NULL,
  `measureId` int(11) DEFAULT NULL,
  `measureName` text,
  `status` varchar(30) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `createdByName` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestRow`
--

LOCK TABLES `requestRow` WRITE;
/*!40000 ALTER TABLE `requestRow` DISABLE KEYS */;
INSERT INTO `requestRow` VALUES (5,1,9,'Product x5',NULL,NULL,10,360,3600,0,0,0,0,12,'12','status','2018-04-01 19:47:06',NULL,NULL),(7,1,5,'Product x1',NULL,NULL,1,60,60,0,0,0,0,12,'100 X 1KG','status','2018-04-01 19:47:13',NULL,NULL),(12,1,8,'Product x4',NULL,NULL,1,720,720,0,0,0,0,12,'100 X 1KG','status','2018-04-01 20:19:18',NULL,NULL),(13,1,14,'Product x9',NULL,NULL,1,52,52,0,0,0,0,12,'100 X 1KG','status','2018-04-06 00:40:37',NULL,NULL),(14,1,16,'Product x12',NULL,NULL,1,28,28,0,0,0,0,16,'Unidad','status','2018-04-06 00:48:16',NULL,NULL);
/*!40000 ALTER TABLE `requestRow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestRowCustomer`
--

DROP TABLE IF EXISTS `requestRowCustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestRowCustomer` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `requestRowId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `productName` text,
  `customerId` int(11) DEFAULT NULL,
  `customerName` text,
  `measureId` int(11) DEFAULT NULL,
  `measureName` text,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `createdByName` text,
  `payType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestRowCustomer`
--

LOCK TABLES `requestRowCustomer` WRITE;
/*!40000 ALTER TABLE `requestRowCustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `requestRowCustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `roleName` text,
  `roleCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Unit of Measure','measure'),(2,'Create Unidaded de MCreate edida','measureCreate'),(3,'List Unidades MList edida','measureList'),(4,'view Unit of Measure','measureShow'),(5,'Edit Unit of Measure','measureEdit'),(6,'Remove Unit of Measure','measureDelete'),(7,'Products','product'),(8,'Create Product','productCreate'),(9,'List Products','productList'),(10,'view Product','productShow'),(11,'Edit Product','productEdit'),(12,'Remove Product','productDelete'),(13,'Vendores','vendor'),(14,'Create Vendor','vendorCreate'),(15,'List Vendor','vendorList'),(16,'view Vendor','vendorShow'),(17,'Edit Vendor','vendorEdit'),(18,'Remove Vendor','vendorDelete'),(19,'Customer','customer'),(20,'Create Customer','customerCreate'),(21,'List Customer','customerList'),(22,'view Customer','customerShow'),(23,'Edit Customer','customerEdit'),(24,'Remove Customer','customerDelete'),(25,'Users','user'),(26,'Create Users','userCreate'),(27,'List Users','userList'),(28,'view Users','userShow'),(29,'Edit Users','userEdit'),(30,'Remove Users','userDelete'),(31,'Accounts','account'),(32,'Create Accounts','accountCreate'),(33,'List Accounts','accountList'),(34,'view Accounts','accountShow'),(35,'Edit Accounts','accountEdit'),(36,'Remove Accounts','accountDelete'),(37,'Transactions','transaction'),(38,'Create Transactions','transactionCreate'),(39,'List Transactions','transactionList'),(40,'view Transactions','transactionShow'),(41,'Edit Transactions','transactionEdit'),(42,'Remove Transactions','transactionDelete'),(43,'Detail of Transaction','transactionDetail'),(44,'Create Detail of Transaction','transactionDetailCreate'),(45,'List Detail of Transaction','transactionDetailList'),(46,'view Detail of Transaction','transactionDetailShow'),(47,'Edit Detail of Transaction','transactionDetailEdit'),(48,'Remove Detail of Transaction','transactionDetailDelete'),(49,'Orders','productRequest'),(50,'Create Orders','productRequestCreate'),(51,'List Orders','productRequestList'),(52,'view Orders','productRequestShow'),(53,'Edit Orders','productRequestEdit'),(54,'Remove Orders','productRequestDelete'),(55,'Enviar Orders','productRequestSend'),(56,'Aceptar Orders','productRequestAccept'),(57,'Finalizar Orders','productRequestFinish'),(58,'Detail of Order','requestRow'),(59,'Create Detail of Order','requestRowCreate'),(60,'List Detail of Order','requestRowList'),(61,'view Detail of Order','requestRowShow'),(62,'Edit Detail of Order','requestRowEdit'),(63,'Remove Detail of Order','requestRowDelete'),(64,'Asignacion de Product a Customer','requestRowCustomer'),(65,'Create Asignacion de Product a Customer','requestRowCustomerCreate'),(66,'List Asignacion de Product a Customer','requestRowCustomerList'),(67,'view Asignacion de Product a Customer','requestRowCustomerShow'),(68,'Edit Asignacion de Product a Customer','requestRowCustomerEdit'),(69,'Remove Asignacion de Product a Customer','requestRowCustomerDelete'),(70,'Report of Discounts','discountReport'),(71,'Create Report of Discounts','discountReportCreate'),(72,'List Report of Discounts','discountReportList'),(73,'view Report of Discounts','discountReportShow'),(74,'Edit Report of Discounts','discountReportEdit'),(75,'Remove Report of Discounts','discountReportDelete'),(76,'Finalizar Report of Discounts','discountReportFinalize'),(77,'Detail of Discount','discountDetail'),(78,'Create Detail of Discount','discountDetailCreate'),(79,'List Detail of Discount','discountDetailList'),(80,'view Detail of Discount','discountDetailShow'),(81,'Edit Detail of Discount','discountDetailEdit'),(82,'Remove Detail of Discount','discountDetailDelete'),(83,'Products al Inventario','productInv'),(84,'Create Products al Inventario','productInvCreate'),(85,'List Products al Inventario','productInvList'),(86,'view Products al Inventario','productInvShow'),(87,'Edit Products al Inventario','productInvEdit'),(88,'Remove Products al Inventario','productInvDelete'),(89,'Report','report'),(90,'view Balance sheet','balanceShow'),(91,'view Journal Book','diaryShow'),(92,'view Financial Status','financeShow'),(93,'view Libros del Mayor','mayorShow'),(94,'view Trial Balance','sumasSaldosShow'),(95,'Company Info','setting'),(96,'view Company Info','settingShow'),(97,'Edit Company Info','settingEdit');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `president` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'Dyamsoft Company','Luis Arce','es','Description');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `description` text,
  `createdBy` int(11) DEFAULT NULL,
  `createdByName` text,
  `autorizedBy` int(11) DEFAULT NULL,
  `autorizedByName` text,
  `receivedBy` int(11) DEFAULT NULL,
  `receivedByName` text,
  `updatedBy` int(6) DEFAULT NULL,
  `updatedByName` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionDetail`
--

DROP TABLE IF EXISTS `transactionDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactionDetail` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `transaction` int(11) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `transactionDate` varchar(30) DEFAULT NULL,
  `accountCode` varchar(30) DEFAULT NULL,
  `accountName` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `createdByName` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionDetail`
--

LOCK TABLES `transactionDetail` WRITE;
/*!40000 ALTER TABLE `transactionDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactionDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `carnet` int(11) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin',222,333,'address',3000,'Admin','admin','admin','2018-03-21 04:58:33'),(2,'admin2',7878,78798,'dir',78,'Admin','admin2','admin2','2018-03-21 04:58:33'),(3,'insumo',789789,789789,'address',7878,'Insumo','insumo','insumo','2018-03-21 04:58:33'),(4,'Employee 1',789789,789789,'address',890890,'Employee','employee','employee','2018-03-21 04:58:33'),(5,'Store',789789,789789,'Address',678678,'Store','alamcen','store','2018-03-21 04:58:33');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userRole`
--

DROP TABLE IF EXISTS `userRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userRole` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `roleName` text,
  `roleCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userRole`
--

LOCK TABLES `userRole` WRITE;
/*!40000 ALTER TABLE `userRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `userRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'Proveedor 1',23423233,'Address 1','Contact 1',1,'2018-03-21 04:58:34'),(2,'Proveedor 2',23423423,'Address 2','Contact 2',2,'2018-03-21 04:58:34');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorContract`
--

DROP TABLE IF EXISTS `vendorContract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendorContract` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `vendorId` varchar(100) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `startDate` date DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorContract`
--

LOCK TABLES `vendorContract` WRITE;
/*!40000 ALTER TABLE `vendorContract` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendorContract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorContractItem`
--

DROP TABLE IF EXISTS `vendorContractItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendorContractItem` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `contractId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `startDate` date DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorContractItem`
--

LOCK TABLES `vendorContractItem` WRITE;
/*!40000 ALTER TABLE `vendorContractItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendorContractItem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-05 21:23:11
