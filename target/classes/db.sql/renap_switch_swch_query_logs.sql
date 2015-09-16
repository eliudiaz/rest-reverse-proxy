-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: renap_switch
-- ------------------------------------------------------
-- Server version	5.1.73-community

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
-- Table structure for table `swch_query_logs`
--

DROP TABLE IF EXISTS `swch_query_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swch_query_logs` (
  `id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `creado` datetime NOT NULL,
  `parametros_entrada` varchar(100) DEFAULT NULL,
  `salida` blob NOT NULL,
  `formato_salida` varchar(45) NOT NULL DEFAULT 'json',
  `usuario_id` varchar(100) NOT NULL,
  `entidad_id` int(11) NOT NULL,
  `query_time_total` int(11) NOT NULL COMMENT 'tiempo en milisegundos',
  `exito` int(11) NOT NULL DEFAULT '1',
  `error_codigo` int(11) DEFAULT NULL,
  `error_detalle` varchar(500) DEFAULT NULL,
  `error_nivel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_swch_consumos_swch_servicios1_idx` (`servicio_id`),
  KEY `fk_swch_backlog_swch_usuarios1_idx` (`usuario_id`,`entidad_id`),
  CONSTRAINT `fk_swch_consumos_swch_servicios1` FOREIGN KEY (`servicio_id`) REFERENCES `swch_servicios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_swch_backlog_swch_usuarios1` FOREIGN KEY (`usuario_id`, `entidad_id`) REFERENCES `swch_usuarios` (`usuario`, `entidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swch_query_logs`
--

LOCK TABLES `swch_query_logs` WRITE;
/*!40000 ALTER TABLE `swch_query_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `swch_query_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-15 23:25:52
