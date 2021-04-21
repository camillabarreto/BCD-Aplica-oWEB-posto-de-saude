-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: ampto.sj.ifsc.edu.br    Database: pp02camilla
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Agenda`
--

DROP TABLE IF EXISTS `Agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Agenda` (
  `idPosto` int NOT NULL,
  `idVacina` int NOT NULL,
  `idFabricante` int NOT NULL,
  `data` date NOT NULL,
  `idSituação` int NOT NULL,
  `CPF` varchar(45) NOT NULL,
  PRIMARY KEY (`idPosto`,`idVacina`,`idFabricante`,`idSituação`,`CPF`),
  KEY `fk_Aplicacao_Posto1_idx` (`idPosto`),
  KEY `fk_Aplicacao_Vacina1_idx` (`idVacina`,`idFabricante`),
  KEY `fk_Agenda_Situação1_idx` (`idSituação`),
  KEY `fk_Agenda_Pessoa1_idx` (`CPF`),
  CONSTRAINT `fk_Agenda_Pessoa1` FOREIGN KEY (`CPF`) REFERENCES `Pessoa` (`CPF`),
  CONSTRAINT `fk_Agenda_Situação1` FOREIGN KEY (`idSituação`) REFERENCES `Situação` (`idSituação`),
  CONSTRAINT `fk_Aplicacao_Posto1` FOREIGN KEY (`idPosto`) REFERENCES `Posto` (`idPosto`),
  CONSTRAINT `fk_Aplicacao_Vacina1` FOREIGN KEY (`idVacina`, `idFabricante`) REFERENCES `Vacina` (`idVacina`, `idFabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Agenda`
--

LOCK TABLES `Agenda` WRITE;
/*!40000 ALTER TABLE `Agenda` DISABLE KEYS */;
INSERT INTO `Agenda` VALUES (1,3,1,'2021-04-20',1,'99988899988'),(1,4,2,'2021-04-20',1,'11122233344'),(1,5,1,'2021-04-20',1,'00000000022'),(2,3,1,'1996-02-08',1,'11122233344');
/*!40000 ALTER TABLE `Agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calendario`
--

DROP TABLE IF EXISTS `Calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Calendario` (
  `idCalendario` int NOT NULL,
  `ano` date NOT NULL,
  PRIMARY KEY (`idCalendario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calendario`
--

LOCK TABLES `Calendario` WRITE;
/*!40000 ALTER TABLE `Calendario` DISABLE KEYS */;
INSERT INTO `Calendario` VALUES (1,'2020-01-01'),(2,'2021-01-01');
/*!40000 ALTER TABLE `Calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calendario_has_Vacina`
--

DROP TABLE IF EXISTS `Calendario_has_Vacina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Calendario_has_Vacina` (
  `idCalendario` int NOT NULL,
  `idVacina` int NOT NULL,
  `idFabricante` int NOT NULL,
  `meses` int NOT NULL,
  PRIMARY KEY (`idCalendario`,`idVacina`,`idFabricante`),
  KEY `fk_Calendario_has_Vacina_Vacina1_idx` (`idVacina`,`idFabricante`),
  KEY `fk_Calendario_has_Vacina_Calendario1_idx` (`idCalendario`),
  CONSTRAINT `fk_Calendario_has_Vacina_Calendario1` FOREIGN KEY (`idCalendario`) REFERENCES `Calendario` (`idCalendario`),
  CONSTRAINT `fk_Calendario_has_Vacina_Vacina1` FOREIGN KEY (`idVacina`, `idFabricante`) REFERENCES `Vacina` (`idVacina`, `idFabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calendario_has_Vacina`
--

LOCK TABLES `Calendario_has_Vacina` WRITE;
/*!40000 ALTER TABLE `Calendario_has_Vacina` DISABLE KEYS */;
INSERT INTO `Calendario_has_Vacina` VALUES (1,1,3,2),(1,2,1,2),(1,3,1,0),(2,3,1,0),(2,4,2,6),(2,5,1,2);
/*!40000 ALTER TABLE `Calendario_has_Vacina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compra`
--

DROP TABLE IF EXISTS `Compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Compra` (
  `idCompra` int NOT NULL,
  `lote` varchar(45) NOT NULL,
  `dataFabricacao` date NOT NULL,
  `dataValidade` date NOT NULL,
  `dosesPorFrasco` int NOT NULL,
  `unidades` int NOT NULL,
  `dosesDescartadas` int NOT NULL,
  `idVacina` int NOT NULL,
  `idFabricante` int NOT NULL,
  PRIMARY KEY (`idCompra`,`idVacina`,`idFabricante`),
  KEY `fk_Compra_Vacina1_idx` (`idVacina`,`idFabricante`),
  CONSTRAINT `fk_Compra_Vacina1` FOREIGN KEY (`idVacina`, `idFabricante`) REFERENCES `Vacina` (`idVacina`, `idFabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compra`
--

LOCK TABLES `Compra` WRITE;
/*!40000 ALTER TABLE `Compra` DISABLE KEYS */;
INSERT INTO `Compra` VALUES (1,'111','2021-01-01','2021-12-12',1,100,1,1,3),(2,'222','2021-02-02','2022-12-12',2,200,2,2,1),(3,'333','2021-03-03','2023-12-13',3,30,3,3,1),(4,'444','2021-04-04','2024-04-04',4,40,0,4,2),(5,'555','2021-05-05','2025-05-05',5,50,5,5,1);
/*!40000 ALTER TABLE `Compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doenca`
--

DROP TABLE IF EXISTS `Doenca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Doenca` (
  `idDoenca` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idDoenca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doenca`
--

LOCK TABLES `Doenca` WRITE;
/*!40000 ALTER TABLE `Doenca` DISABLE KEYS */;
INSERT INTO `Doenca` VALUES (1,'Hepatite B'),(2,'Poliomielite'),(3,'Pneumonias'),(4,'Tétano');
/*!40000 ALTER TABLE `Doenca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doenca_has_Vacina`
--

DROP TABLE IF EXISTS `Doenca_has_Vacina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Doenca_has_Vacina` (
  `idDoenca` int NOT NULL,
  `idVacina` int NOT NULL,
  `idFabricante` int NOT NULL,
  PRIMARY KEY (`idDoenca`,`idVacina`,`idFabricante`),
  KEY `fk_Doenca_has_Vacina_Vacina1_idx` (`idVacina`,`idFabricante`),
  KEY `fk_Doenca_has_Vacina_Doenca1_idx` (`idDoenca`),
  CONSTRAINT `fk_Doenca_has_Vacina_Doenca1` FOREIGN KEY (`idDoenca`) REFERENCES `Doenca` (`idDoenca`),
  CONSTRAINT `fk_Doenca_has_Vacina_Vacina1` FOREIGN KEY (`idVacina`, `idFabricante`) REFERENCES `Vacina` (`idVacina`, `idFabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doenca_has_Vacina`
--

LOCK TABLES `Doenca_has_Vacina` WRITE;
/*!40000 ALTER TABLE `Doenca_has_Vacina` DISABLE KEYS */;
INSERT INTO `Doenca_has_Vacina` VALUES (1,2,1),(1,3,1),(2,1,3),(2,4,2),(3,5,1),(4,2,1);
/*!40000 ALTER TABLE `Doenca_has_Vacina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fabricante`
--

DROP TABLE IF EXISTS `Fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fabricante` (
  `idFabricante` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idFabricante`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fabricante`
--

LOCK TABLES `Fabricante` WRITE;
/*!40000 ALTER TABLE `Fabricante` DISABLE KEYS */;
INSERT INTO `Fabricante` VALUES (1,'Fab A'),(2,'SABIN'),(3,'SALK');
/*!40000 ALTER TABLE `Fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pessoa`
--

DROP TABLE IF EXISTS `Pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pessoa` (
  `CPF` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `dataNasc` date NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa`
--

LOCK TABLES `Pessoa` WRITE;
/*!40000 ALTER TABLE `Pessoa` DISABLE KEYS */;
INSERT INTO `Pessoa` VALUES ('00000000022','Larissa Lobo','2016-06-06','4866663333','São José'),('11122233344','Camilla Barreto','1996-02-08','4833335555','São José'),('44455566677','Erick Michalak','2011-03-31','4822226666','Biguaçu'),('99988899988','Gabriela Barreto','2000-01-02','77778888','Palhoça');
/*!40000 ALTER TABLE `Pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posto`
--

DROP TABLE IF EXISTS `Posto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Posto` (
  `idPosto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  PRIMARY KEY (`idPosto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posto`
--

LOCK TABLES `Posto` WRITE;
/*!40000 ALTER TABLE `Posto` DISABLE KEYS */;
INSERT INTO `Posto` VALUES (1,'UPA','Biguaçu'),(2,'UBS - Kobrasol','São José'),(3,'UBS - Forquilhinhas','São José');
/*!40000 ALTER TABLE `Posto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Situação`
--

DROP TABLE IF EXISTS `Situação`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Situação` (
  `idSituação` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idSituação`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Situação`
--

LOCK TABLES `Situação` WRITE;
/*!40000 ALTER TABLE `Situação` DISABLE KEYS */;
INSERT INTO `Situação` VALUES (1,'aplicado'),(2,'nao-aplicado');
/*!40000 ALTER TABLE `Situação` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vacina`
--

DROP TABLE IF EXISTS `Vacina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vacina` (
  `idVacina` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `doses` int NOT NULL,
  `intervalo` int NOT NULL,
  `idFabricante` int NOT NULL,
  PRIMARY KEY (`idVacina`,`idFabricante`),
  KEY `fk_Vacina_Fabricante_idx` (`idFabricante`),
  CONSTRAINT `fk_Vacina_Fabricante` FOREIGN KEY (`idFabricante`) REFERENCES `Fabricante` (`idFabricante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vacina`
--

LOCK TABLES `Vacina` WRITE;
/*!40000 ALTER TABLE `Vacina` DISABLE KEYS */;
INSERT INTO `Vacina` VALUES (1,'VIP',2,2,3),(2,'Pentavalente',3,2,1),(3,'Contra hepatite B',1,0,1),(4,'VOP',1,0,2),(5,'Pneumo 10',2,2,1);
/*!40000 ALTER TABLE `Vacina` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20 22:50:51
