-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aspirantes
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

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
-- Table structure for table `acceso`
--

DROP TABLE IF EXISTS `acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acceso` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `usuario_id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`clave`,`usuario_id_usuario`),
  KEY `fk_acceso_usuario1_idx` (`usuario_id_usuario`),
  CONSTRAINT `fk_acceso_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_latvian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspirante`
--

DROP TABLE IF EXISTS `aspirante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspirante` (
  `CURP` varchar(18) CHARACTER SET utf8 NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `paterno` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `materno` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `preficha` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `ficha` varchar(7) CHARACTER SET utf8 DEFAULT NULL,
  `fecha-pre` datetime DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`CURP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_latvian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspirante`
--

LOCK TABLES `aspirante` WRITE;
/*!40000 ALTER TABLE `aspirante` DISABLE KEYS */;
INSERT INTO `aspirante` VALUES ('CURP01','Oscar','Cabrera','Godínez','91710000','ITL1001','2017-01-04 11:26:00','2017-02-04 11:26:00','oscar.cabrera@itleon.edu.mx'),('CURP02','Oscar2','Cabrera2','Godínez2','91710001','ITL1002','2017-01-04 11:26:00','2017-02-04 11:26:00','oscar.cabrera@itleon.edu.mx'),('CURP03','Oscar3','Cabrera3','Godínez3','91710002','ITL1003','2017-01-04 11:26:00','2017-02-04 11:26:00','oscar.cabrera@itleon.edu.mx');
/*!40000 ALTER TABLE `aspirante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspirante_grupo`
--

DROP TABLE IF EXISTS `aspirante_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspirante_grupo` (
  `grupo_clave` varchar(8) CHARACTER SET utf8 NOT NULL,
  `aspirante_CURP` varchar(18) CHARACTER SET utf8 NOT NULL,
  `registro` datetime DEFAULT NULL,
  PRIMARY KEY (`grupo_clave`,`aspirante_CURP`),
  KEY `fk_aspirante_has_grupo_grupo1_idx` (`grupo_clave`),
  KEY `fk_aspirante_has_grupo_aspirante_idx` (`aspirante_CURP`),
  CONSTRAINT `fk_aspirante_has_grupo_aspirante` FOREIGN KEY (`aspirante_CURP`) REFERENCES `aspirante` (`CURP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aspirante_has_grupo_grupo1` FOREIGN KEY (`grupo_clave`) REFERENCES `grupo` (`clave`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_latvian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspirante_grupo`
--

LOCK TABLES `aspirante_grupo` WRITE;
/*!40000 ALTER TABLE `aspirante_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspirante_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `clave` varchar(8) CHARACTER SET utf8 NOT NULL,
  `fecha_aplicacion` datetime DEFAULT NULL,
  `aula` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `cupo` int(11) DEFAULT NULL,
  `estatus` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`clave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_latvian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES ('20170101','2017-01-04 14:02:00','C1',110,'A'),('20170102','2017-01-04 23:02:00','C3',146,'A'),('20170103','2017-01-04 11:00:00','C3',150,'A'),('20170104','2017-01-05 11:00:00','C1',150,'A'),('20170105','2017-01-05 13:00:00','C1',150,'A'),('20170106','2017-02-07 13:00:00','C2',140,'A'),('20170107','2017-02-15 14:00:00','C2',150,'A'),('20170108','2017-02-17 09:00:00','c4',150,'A'),('20180101','2017-02-15 12:00:00','d',150,'A');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencia`
--

DROP TABLE IF EXISTS `referencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referencia` (
  `referenciasistema` varchar(20) CHARACTER SET utf8 NOT NULL,
  `fecha_generada` datetime DEFAULT NULL,
  `fecha_vigencia` date DEFAULT NULL,
  `monto` varchar(10) COLLATE utf8_latvian_ci DEFAULT NULL,
  `referenciabanco` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `tipo_pago` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `CURP` varchar(18) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`referenciasistema`,`CURP`),
  KEY `fk_referencia_aspirante1_idx` (`CURP`),
  CONSTRAINT `fk_referencia_aspirante1` FOREIGN KEY (`CURP`) REFERENCES `aspirante` (`CURP`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_latvian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencia`
--

LOCK TABLES `referencia` WRITE;
/*!40000 ALTER TABLE `referencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `tipo` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_latvian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'DDA','ITL293*asP01','A'),(2,'EDSI','ITL293*asP02','D');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-06 20:49:14
