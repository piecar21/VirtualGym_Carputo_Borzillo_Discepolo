CREATE DATABASE  IF NOT EXISTS `demo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `demo`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `corso`
--

DROP TABLE IF EXISTS `corso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `numero_posti_disponibili` int NOT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  `id_iscrizione` bigint NOT NULL,
  `id_corso` int DEFAULT NULL,
  `id_utente` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corso`
--

LOCK TABLES `corso` WRITE;
/*!40000 ALTER TABLE `corso` DISABLE KEYS */;
INSERT INTO `corso` VALUES (1,'si salta','zumba',5,'dicembre-gennaio',0,NULL,NULL),(2,'ti rilassaa','yoga',38,'gennaio-maggio',0,NULL,NULL),(3,'prendi a pugni','softbox',12,'ottobre-gennaio',0,NULL,NULL),(4,'area','aereobica',33,'aprile-luglio',0,NULL,NULL);
/*!40000 ALTER TABLE `corso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iscrizione`
--

DROP TABLE IF EXISTS `iscrizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iscrizione` (
  `id_iscrizione` int NOT NULL AUTO_INCREMENT,
  `id_utente` bigint NOT NULL,
  `id_corso` int DEFAULT NULL,
  PRIMARY KEY (`id_iscrizione`),
  KEY `id_utente` (`id_utente`),
  KEY `id_corso` (`id_corso`),
  CONSTRAINT `iscrizione_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id`),
  CONSTRAINT `iscrizione_ibfk_2` FOREIGN KEY (`id_corso`) REFERENCES `corso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscrizione`
--

LOCK TABLES `iscrizione` WRITE;
/*!40000 ALTER TABLE `iscrizione` DISABLE KEYS */;
INSERT INTO `iscrizione` VALUES (1,7,2),(2,5,4),(3,5,1),(4,1,3);
/*!40000 ALTER TABLE `iscrizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenotazione`
--

DROP TABLE IF EXISTS `prenotazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenotazione` (
  `id_prenotazione` int NOT NULL AUTO_INCREMENT,
  `nome_corso` varchar(255) DEFAULT NULL,
  `titolare_corso` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `id_utente` int NOT NULL,
  `num_posti_liberi` int NOT NULL,
  `num_posti_totali` int DEFAULT NULL,
  `ora` int NOT NULL,
  PRIMARY KEY (`id_prenotazione`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazione`
--

LOCK TABLES `prenotazione` WRITE;
/*!40000 ALTER TABLE `prenotazione` DISABLE KEYS */;
INSERT INTO `prenotazione` VALUES (1,'ZUMBA','ABDUL','2021-10-17',0,100,NULL,8),(2,'AEREOBICA','Ines','2022-09-21',0,100,NULL,14),(3,'YOGA','Laureant','2022-07-02',0,100,NULL,20),(4,'AEREOBICAAEREA','Diana','2022-07-08',0,100,NULL,17);
/*!40000 ALTER TABLE `prenotazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruolo`
--

DROP TABLE IF EXISTS `ruolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruolo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruolo`
--

LOCK TABLES `ruolo` WRITE;
/*!40000 ALTER TABLE `ruolo` DISABLE KEYS */;
INSERT INTO `ruolo` VALUES (1,'RUOLO_UTENTE'),(2,'RUOLO_UTENTE'),(3,'RUOLO_UTENTE'),(4,'RUOLO_UTENTE'),(5,'RUOLO_UTENTE'),(6,'RUOLO_UTENTE'),(7,'RUOLO_UTENTE'),(8,'RUOLO_UTENTE'),(9,'RUOLO_UTENTE');
/*!40000 ALTER TABLE `ruolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schede`
--

DROP TABLE IF EXISTS `schede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schede` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cognome` varchar(255) DEFAULT NULL,
  `gruppi_muscolari` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `obiettivo` varchar(255) DEFAULT NULL,
  `ripetizioni` int DEFAULT NULL,
  `serie` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schede`
--

LOCK TABLES `schede` WRITE;
/*!40000 ALTER TABLE `schede` DISABLE KEYS */;
/*!40000 ALTER TABLE `schede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_ruoli`
--

DROP TABLE IF EXISTS `trainer_ruoli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_ruoli` (
  `trainer_id` bigint NOT NULL,
  `ruolo_id` bigint NOT NULL,
  KEY `FKsusafscwk4pn3j1r6uxpcwoc2` (`ruolo_id`),
  KEY `FKra8y49k06k5i8xk0e7dkgrlpk` (`trainer_id`),
  CONSTRAINT `FKra8y49k06k5i8xk0e7dkgrlpk` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`),
  CONSTRAINT `FKsusafscwk4pn3j1r6uxpcwoc2` FOREIGN KEY (`ruolo_id`) REFERENCES `ruolo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_ruoli`
--

LOCK TABLES `trainer_ruoli` WRITE;
/*!40000 ALTER TABLE `trainer_ruoli` DISABLE KEYS */;
INSERT INTO `trainer_ruoli` VALUES (1,2),(2,3),(3,5);
/*!40000 ALTER TABLE `trainer_ruoli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cognome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKp760ma5h90yjnu0s0c94jawyb` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'pi','pi','pi','$2a$10$yYche9t2X0N9Ag87ktqqZOvUo0z9xM2xE2xm58c5iCuPf8ior53dK'),(2,'o','p','c','$2a$10$FAllJFa0kVrIjfQi0wHKauuUqihspsYNhPb8qNEVc19F4olvBUsgK'),(3,'po','po','po','$2a$10$7OJea0DCeKZn5h/KehY4R.I7lJjm8IHR1BZJg/tbT7BiFXtqE12Au');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utenti`
--

DROP TABLE IF EXISTS `utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utenti` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cognome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK9b90mk1nolf3ou90p42a93tjo` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti`
--

LOCK TABLES `utenti` WRITE;
/*!40000 ALTER TABLE `utenti` DISABLE KEYS */;
INSERT INTO `utenti` VALUES (1,'lu','lu','lu','$2a$10$E8AcimIp033U/A6drTzmzOVfwbWNHj9gElO9YUmu13.3L/0NwWcC6'),(2,'arriva','arriva','arriva','$2a$10$i0zBKrIxH9I4GY0Z4zV4I.QovqLOjGlVYzK2cRrM6M5nx9.ZLcd8y'),(3,'b','b','b','$2a$10$o/FLvl0Zff2gm28pNdHRSO1UMh94k0plS0y5PzFnhs8TPB/ZL240q'),(4,'z','z','z','$2a$10$cdK.G9eTWgky8MuuOtS54.nXV2b1gpm1WuQtVgWPfBzTZhByUgynq'),(5,'ciao','ciao','ciao','$2a$10$x3Xtm67HRliArEmhg/VQYOYyGFnpvPfKOH2v5o3P4K5hVqMnaRmIO'),(7,'a','a','a','$2a$10$3qCw9JIpHhalnpleIP6yLezaDHiGpz58uB4ZY0lLdIxMSEWPeEhi2');
/*!40000 ALTER TABLE `utenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utenti_ruoli`
--

DROP TABLE IF EXISTS `utenti_ruoli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utenti_ruoli` (
  `utente_id` bigint NOT NULL,
  `ruolo_id` bigint NOT NULL,
  KEY `FK891jpshicvig5j2wg9ackx1gw` (`ruolo_id`),
  KEY `FKefvaph0pdf0igg25tiisgjjry` (`utente_id`),
  CONSTRAINT `FK891jpshicvig5j2wg9ackx1gw` FOREIGN KEY (`ruolo_id`) REFERENCES `ruolo` (`id`),
  CONSTRAINT `FKefvaph0pdf0igg25tiisgjjry` FOREIGN KEY (`utente_id`) REFERENCES `utenti` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti_ruoli`
--

LOCK TABLES `utenti_ruoli` WRITE;
/*!40000 ALTER TABLE `utenti_ruoli` DISABLE KEYS */;
INSERT INTO `utenti_ruoli` VALUES (1,1),(2,4),(3,6),(4,7),(5,8),(7,9);
/*!40000 ALTER TABLE `utenti_ruoli` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 11:37:33
