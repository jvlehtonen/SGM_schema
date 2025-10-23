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

DROP TABLE IF EXISTS `aminoacids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aminoacids` (
  `three` char(3) NOT NULL,
  `one` char(1) NOT NULL,
  `description` varchar(29) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL COMMENT 'molecular weight',
  `hydropathy` decimal(4,1) DEFAULT NULL COMMENT 'scale based on Kyte & Doolittle',
  PRIMARY KEY (`three`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `aminoacids` WRITE;
/*!40000 ALTER TABLE `aminoacids` DISABLE KEYS */;
INSERT INTO `aminoacids` VALUES
  ('ala', 'A', 'alanine',        71.0788,  1.8),
  ('arg', 'R', 'arginine',      156.1875, -4.5),
  ('asn', 'N', 'asparagine',    114.1038, -3.5),
  ('asp', 'D', 'aspartic acid', 115.0886, -3.5),
  ('asx', 'B', 'asparagine or aspartic acid', NULL, NULL),
  ('cys', 'C', 'cysteine',      103.1388,  2.5),
  ('gln', 'Q', 'glutamine',     128.1307, -3.5),
  ('glu', 'E', 'glutamic acid', 129.1155, -3.5),
  ('glx', 'Z', 'glutamine or glutamic acid', NULL, NULL),
  ('gly', 'G', 'glycine',        57.0519, -0.4),
  ('his', 'H', 'histidine',     137.1411, -3.2),
  ('ile', 'I', 'isoleucine',    113.1594,  4.5),
  ('leu', 'L', 'leucine',       113.1594,  3.8),
  ('lys', 'K', 'lysine',        128.1741, -3.9),
  ('met', 'M', 'methionine',    131.1926,  1.9),
  ('phe', 'F', 'phenylalanine', 147.1766,  2.8),
  ('pro', 'P', 'proline',        97.1167, -1.6),
  ('ser', 'S', 'serine',         87.0782, -0.8),
  ('thr', 'T', 'threonine',     101.1051, -0.7),
  ('trp', 'W', 'tryptophan',    186.2132, -0.9),
  ('tyr', 'Y', 'tyrosine',      163.1760, -1.3),
  ('val', 'V', 'valine',         99.1326,  4.2);
/*!40000 ALTER TABLE `aminoacids` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `predictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predictions` (
  `method`      varchar(15)  NOT NULL,
  `threshold`   decimal(7,4) NOT NULL,
  `description` varchar(20)  NOT NULL,
  `reduced`     varchar(10)  NOT NULL COMMENT 'Simplified description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `cdna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdna` (
  `cdna_change` varchar(21) NOT NULL,
  `basenum` int(4) NOT NULL,
  `GRCh38Location` int(8) DEFAULT NULL,
  `HGVSp` varchar(13) NOT NULL,
  `clinvar_uid` int(10) DEFAULT NULL,
  `gnomad_id` varchar(14) DEFAULT NULL,
  `variant` varchar(6) DEFAULT NULL,
  `resnum` smallint(5) unsigned DEFAULT NULL,
  `revel_score` decimal(4,3) DEFAULT NULL,
  PRIMARY KEY (`cdna_change`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `clinvar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinvar` (
  `uid` int(10) NOT NULL,
  `title` varchar(80) NOT NULL,
  `cdna_change` varchar(21) DEFAULT NULL,
  `protein_change` varchar(20),
  `germline_desc` varchar(50),
  `review_status` varchar(60),
  `scv_count` tinyint(3),
  `basenum` int(4) DEFAULT NULL,
  `HGVSp` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `clinvar_germline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinvar_germline` (
  `cv_description` varchar(50) NOT NULL,
  `cv_rank`   tinyint(3)  NOT NULL,
  `cv_status` varchar(24) NOT NULL,
  `reduced`   varchar(10) NOT NULL COMMENT 'Simplified description',
  PRIMARY KEY (`cv_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `clinvar_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinvar_review` (
  `status` varchar(60) NOT NULL,
  `stars` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `gnomAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gnomAD` (
  `id` varchar(14) NOT NULL,
  `HGVSc` varchar(9) NOT NULL,
  `HGVSp` varchar(12) NOT NULL,
  `allele_count` int(10) unsigned NOT NULL,
  `allele_freq` decimal(23,22) unsigned NOT NULL,
  `basenum` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `syngap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syngap` (
  `variant` varchar(6) NOT NULL,
  `deltaMW` decimal(10,4),
  `deltaHydropathy` decimal(4,1),
  `polyPhen2_HumDiv_pph2_prob` decimal(5,3),
  `polyPhen2_HumVar_pph2_prob` decimal(5,3),
  `SIFT_animal_Predict` decimal(4,2) DEFAULT NULL,
  `SIFT_animal_Conservation` decimal(4,2) DEFAULT NULL,
  `SIFT_animal_Sequences` smallint(5) unsigned DEFAULT NULL,
  `PAM250` tinyint(4),
  `PAM120` tinyint(4),
  `ESM1b_Q96PV0_LLRscore` decimal(6,3),
  `FATHMM_Diseasespecific_Nervous_System_Score` decimal(4,2) DEFAULT NULL,
  `AlphaMissense_Pathogenicity` decimal(5,4) DEFAULT NULL,
  `domainID` tinyint(3) unsigned NOT NULL,
  `structure` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0=none, 1=structure, 2=MD-structure',
  `doi` varchar(32) DEFAULT NULL COMMENT 'Link to article',
  `provean_score` decimal(4,2) DEFAULT NULL,
  `consensus` varchar(20) DEFAULT NULL COMMENT 'precomputed from other methods',
  PRIMARY KEY (`variant`),
  KEY `domainID` (`domainID`),
  CONSTRAINT `fk_domain` FOREIGN KEY (`domainID`) REFERENCES `syngap_domain` (`domainID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `syngap_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syngap_domain` (
  `domainID` tinyint(3) unsigned NOT NULL,
  `domain` varchar(20) NOT NULL,
  `first`  smallint(5) unsigned DEFAULT NULL,
  `last`   smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`domainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `syngap_structural`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syngap_structural` (
  `variant` varchar(6) NOT NULL,
  `foldx_ddG` decimal(4,2) DEFAULT NULL,
  `foldx_stddev` decimal(3,1) DEFAULT NULL,
  `rosetta_ddG` decimal(4,2) DEFAULT NULL,
  `premPS_ddG` decimal(4,2) DEFAULT NULL,
  `foldetta_ddG` decimal(4,2) AS (ROUND((foldx_ddG+rosetta_ddG)/2, 2)) VIRTUAL,
  PRIMARY KEY (`variant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `mobidb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobidb` (
  `resnum`      smallint(5) unsigned DEFAULT NULL,
  `af_disorder` decimal(4,3) DEFAULT NULL,
  `af_plddt`    decimal(4,3) DEFAULT NULL,
  `mobidb_lite_disorder` decimal(4,3) DEFAULT NULL,
  PRIMARY KEY (`resnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `syngap_verdict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syngap_verdict` (
  `verdictID` tinyint(3) unsigned NOT NULL,
  `verdict` varchar(30) NOT NULL,
  PRIMARY KEY (`verdictID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `syngap_sa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syngap_sa` (
  `variant` varchar(6) NOT NULL,
  `Bfactor_backbone_delta` decimal(3,1) NOT NULL,
  `Bfactor_backbone_stddev` decimal(3,1) NOT NULL,
  `Bfactor_sidechain_delta` decimal(3,1) NOT NULL,
  `Bfactor_sidechain_stddev` decimal(3,1) NOT NULL,
  `sasa_average` decimal(5,1) NOT NULL,
  `sasa_delta` decimal(4,1) NOT NULL,
  `SA_Secondary` tinyint(1) NOT NULL,
  `SA_Tertiary` tinyint(1) NOT NULL,
  `SA_Buried` tinyint(1) NOT NULL,
  `SA_GAP_Ras_interface` tinyint(1) NOT NULL,
  `SA_Membrane_interface` tinyint(1) NOT NULL,
  `SA_Benign` tinyint(1) NOT NULL,
  `Alert` tinyint(1) NOT NULL,
  `description` text DEFAULT NULL,
  `verdictID` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`variant`),
  KEY `verdictID` (`verdictID`),
  CONSTRAINT `fk_verdict` FOREIGN KEY (`verdictID`) REFERENCES `syngap_verdict` (`verdictID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `ai_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ai_summary` (
  `cdna_change` varchar(21) NOT NULL,
  `summary` text DEFAULT NULL,
  PRIMARY KEY (`cdna_change`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

