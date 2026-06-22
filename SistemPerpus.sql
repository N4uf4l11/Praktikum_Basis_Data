-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Sistem_Perpus
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `anggota`
--

DROP TABLE IF EXISTS `anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anggota` (
  `ID_Anggota` varchar(20) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `No_HP` varchar(9) NOT NULL,
  PRIMARY KEY (`ID_Anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggota`
--

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
INSERT INTO `anggota` VALUES ('A001','Andi','081111111'),('A002','Sinta','082222222'),('A003','Dimas','081111111'),('A004','Lina','084444444'),('A005','Fajar','085555555');
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buku`
--

DROP TABLE IF EXISTS `buku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buku` (
  `Id_Buku` varchar(20) NOT NULL,
  `Judul_Buku` varchar(100) NOT NULL,
  `Id_Penerbit` varchar(20) NOT NULL,
  `ID_Penulis` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Buku`),
  KEY `buku_ibfk_1` (`Id_Penerbit`),
  KEY `fk_ID_Penulis` (`ID_Penulis`),
  CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`Id_Penerbit`) REFERENCES `penerbit` (`Id_Penerbit`),
  CONSTRAINT `fk_ID_Penulis` FOREIGN KEY (`ID_Penulis`) REFERENCES `penulis` (`ID_Penulis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buku`
--

LOCK TABLES `buku` WRITE;
/*!40000 ALTER TABLE `buku` DISABLE KEYS */;
INSERT INTO `buku` VALUES ('B001','Basis Data','PB01','K001'),('B002','Algoritma','PB01','K002'),('B003','Pemrograman Web','PB02','K003'),('B004','Jaringan Komputer','PB04','K004'),('B005','Keamanan Siber','PB04','K005'),('B006','Sistem Operasi','PB05','K006'),('B007','Kecerdasan Buatan','PB03','K007'),('B008','Machine Learning','PB03','K008');
/*!40000 ALTER TABLE `buku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_peminjaman`
--

DROP TABLE IF EXISTS `detail_peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_peminjaman` (
  `Id_Detail` varchar(20) NOT NULL,
  `Id_Pinjam` varchar(20) DEFAULT NULL,
  `Id_Buku` varchar(20) DEFAULT NULL,
  `Jumlah` int(11) NOT NULL,
  PRIMARY KEY (`Id_Detail`),
  KEY `detail_peminjaman_ibfk_2` (`Id_Buku`),
  KEY `detail_peminjaman_ibfk_1` (`Id_Pinjam`),
  CONSTRAINT `detail_peminjaman_ibfk_1` FOREIGN KEY (`Id_Pinjam`) REFERENCES `peminjaman` (`Id_Pinjam`),
  CONSTRAINT `detail_peminjaman_ibfk_2` FOREIGN KEY (`Id_Buku`) REFERENCES `buku` (`Id_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_peminjaman`
--

LOCK TABLES `detail_peminjaman` WRITE;
/*!40000 ALTER TABLE `detail_peminjaman` DISABLE KEYS */;
INSERT INTO `detail_peminjaman` VALUES ('D001','P001','B001',1),('D002','P001','B002',1),('D003','P002','B003',1),('D004','P003','B004',1),('D005','P003','B005',1),('D006','P004','B006',1),('D007','P005','B007',1),('D008','P005','B008',1);
/*!40000 ALTER TABLE `detail_peminjaman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peminjaman`
--

DROP TABLE IF EXISTS `peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peminjaman` (
  `Id_Pinjam` varchar(20) NOT NULL,
  `Id_Anggota` varchar(20) DEFAULT NULL,
  `Id_Petugas` varchar(20) DEFAULT NULL,
  `Tanggal_Pinjam` date NOT NULL,
  `Tempo_Pengembalian` date NOT NULL,
  PRIMARY KEY (`Id_Pinjam`),
  KEY `peminjaman_ibfk_1` (`Id_Anggota`),
  KEY `peminjaman_ibfk_2` (`Id_Petugas`),
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`Id_Anggota`) REFERENCES `anggota` (`ID_Anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`Id_Petugas`) REFERENCES `petugas` (`Id_Petugas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peminjaman`
--

LOCK TABLES `peminjaman` WRITE;
/*!40000 ALTER TABLE `peminjaman` DISABLE KEYS */;
INSERT INTO `peminjaman` VALUES ('P001','A001','PT01','2026-05-01','2026-05-08'),('P002','A002','PT02','2026-05-02','2026-05-09'),('P003','A003','PT01','2026-05-03','2026-05-10'),('P004','A004','PT02','2026-05-04','2026-05-11'),('P005','A005','PT01','2026-05-05','2026-05-12');
/*!40000 ALTER TABLE `peminjaman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerbit`
--

DROP TABLE IF EXISTS `penerbit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerbit` (
  `Id_Penerbit` varchar(20) NOT NULL,
  `Nama_Penerbit` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Penerbit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerbit`
--

LOCK TABLES `penerbit` WRITE;
/*!40000 ALTER TABLE `penerbit` DISABLE KEYS */;
INSERT INTO `penerbit` VALUES ('PB01','Erlangga'),('PB02','Informatika'),('PB03','Deep Tech'),('PB04','Andi'),('PB05','Gramedia');
/*!40000 ALTER TABLE `penerbit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengembalian`
--

DROP TABLE IF EXISTS `pengembalian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengembalian` (
  `ID_Pengembalian` varchar(20) NOT NULL,
  `ID_Pinjam` varchar(20) NOT NULL,
  `Tanggal_Kembali` date DEFAULT NULL,
  `Total_Denda` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Pengembalian`),
  KEY `fk_id_pinjam` (`ID_Pinjam`),
  CONSTRAINT `fk_id_pinjam` FOREIGN KEY (`ID_Pinjam`) REFERENCES `peminjaman` (`Id_Pinjam`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengembalian`
--

LOCK TABLES `pengembalian` WRITE;
/*!40000 ALTER TABLE `pengembalian` DISABLE KEYS */;
INSERT INTO `pengembalian` VALUES ('Q001','P001','2026-05-08',NULL),('Q002','P002','2026-05-09',NULL),('Q003','P003','2026-05-10',NULL),('Q004','P004','2026-05-13',10000),('Q005','P005','2026-05-14',15000);
/*!40000 ALTER TABLE `pengembalian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penulis`
--

DROP TABLE IF EXISTS `penulis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penulis` (
  `ID_Penulis` varchar(20) NOT NULL,
  `Nama_Penulis` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Penulis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penulis`
--

LOCK TABLES `penulis` WRITE;
/*!40000 ALTER TABLE `penulis` DISABLE KEYS */;
INSERT INTO `penulis` VALUES ('K001','Rosa A.S.'),('K002','Abdul Kadir'),('K003','Jubilee Enterprise'),('K004','Wahana Komputer'),('K005','Onno Purbo'),('K006','Silberschatz'),('K007','Ian Goodfellow'),('K008','Supriyono');
/*!40000 ALTER TABLE `penulis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petugas`
--

DROP TABLE IF EXISTS `petugas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petugas` (
  `Id_Petugas` varchar(20) NOT NULL,
  `Nama_Petugas` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Petugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petugas`
--

LOCK TABLES `petugas` WRITE;
/*!40000 ALTER TABLE `petugas` DISABLE KEYS */;
INSERT INTO `petugas` VALUES ('PT01','Budi'),('PT02','Rina');
/*!40000 ALTER TABLE `petugas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-10 20:32:17
