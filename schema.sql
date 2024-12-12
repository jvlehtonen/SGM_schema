-- MariaDB dump 10.19  Distrib 10.5.22-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: syngap
-- ------------------------------------------------------
-- Server version	10.5.22-MariaDB

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
-- Temporary table structure for view `HGVSp_to_variant`
--

DROP TABLE IF EXISTS `HGVSp_to_variant`;
/*!50001 DROP VIEW IF EXISTS `HGVSp_to_variant`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `HGVSp_to_variant` AS SELECT
 1 AS `HGVSp`,
  1 AS `variant` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `aminoacids`
--

DROP TABLE IF EXISTS `aminoacids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aminoacids` (
  `three` char(3) NOT NULL,
  `one` char(1) NOT NULL,
  `description` varchar(29) DEFAULT NULL,
  PRIMARY KEY (`three`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cdna`
--

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

--
-- Temporary table structure for view `cdna_count`
--

DROP TABLE IF EXISTS `cdna_count`;
/*!50001 DROP VIEW IF EXISTS `cdna_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cdna_count` AS SELECT
 1 AS `variant`,
  1 AS `x` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clinvar`
--

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

--
-- Table structure for table `clinvar_germline`
--

DROP TABLE IF EXISTS `clinvar_germline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinvar_germline` (
  `cv_description` varchar(50) NOT NULL,
  `cv_rank` tinyint(3) NOT NULL,
  `cv_status` varchar(24) NOT NULL,
  PRIMARY KEY (`cv_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinvar_review`
--

DROP TABLE IF EXISTS `clinvar_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinvar_review` (
  `status` varchar(60) NOT NULL,
  `stars` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `for_HGVSp_to_variant`
--

DROP TABLE IF EXISTS `for_HGVSp_to_variant`;
/*!50001 DROP VIEW IF EXISTS `for_HGVSp_to_variant`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `for_HGVSp_to_variant` AS SELECT
 1 AS `HGVSp`,
  1 AS `src`,
  1 AS `dst`,
  1 AS `resnum` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `for_csv`
--

DROP TABLE IF EXISTS `for_csv`;
/*!50001 DROP VIEW IF EXISTS `for_csv`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `for_csv` AS SELECT
 1 AS `cdna`,
  1 AS `Variant`,
  1 AS `Domain`,
  1 AS `ClinVar ID`,
  1 AS `gnomAD ID`,
  1 AS `ESM1b (Q96PV0) LLRscore`,
  1 AS `AlphaMissense Pathogenicity`,
  1 AS `revel_score`,
  1 AS `FoldX ddG`,
  1 AS `Rosetta ddG`,
  1 AS `Foldetta ddG`,
  1 AS `premPS ddG`,
  1 AS `PROVEAN Score`,
  1 AS `polyPhen-2 HumDiv pph2_prob`,
  1 AS `polyPhen-2 HumDiv predict`,
  1 AS `polyPhen-2 HumVar pph2_prob`,
  1 AS `polyPhen-2 HumVar predict`,
  1 AS `FATHMM Nervous System Score`,
  1 AS `SIFT Prediction`,
  1 AS `SIFT Status`,
  1 AS `PAM250`,
  1 AS `PAM120`,
  1 AS `dHydropathy`,
  1 AS `dMW`,
  1 AS `average SASA`,
  1 AS `dSASA`,
  1 AS `d B-factor backbone`,
  1 AS `StdDev B-factor backbone`,
  1 AS `d B-factor sidechain`,
  1 AS `StdDev B-factor sidechain`,
  1 AS `SA Secondary`,
  1 AS `SA Tertiary bonds`,
  1 AS `SA Inside out`,
  1 AS `SA GAP-Ras interface`,
  1 AS `SA At membrane`,
  1 AS `SA No effect`,
  1 AS `SA MD Alert`,
  1 AS `SA Verdict`,
  1 AS `SA Description`,
  1 AS `DOI` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `for_datatable`
--

DROP TABLE IF EXISTS `for_datatable`;
/*!50001 DROP VIEW IF EXISTS `for_datatable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `for_datatable` AS SELECT
 1 AS `cdna`,
  1 AS `basenum`,
  1 AS `resnum`,
  1 AS `variant`,
  1 AS `domain`,
  1 AS `clinvar_uid`,
  1 AS `cv_rank`,
  1 AS `cv_review`,
  1 AS `cv_submissions`,
  1 AS `cv_status`,
  1 AS `gnomAD_id`,
  1 AS `allele_count`,
  1 AS `allele_freq`,
  1 AS `revel_score`,
  1 AS `revel_predict`,
  1 AS `deltaMW`,
  1 AS `deltaHydropathy`,
  1 AS `foldx_predict`,
  1 AS `foldx_avg_ddG`,
  1 AS `foldx_stddev`,
  1 AS `rosetta_predict`,
  1 AS `rosetta_ddG`,
  1 AS `foldetta_predict`,
  1 AS `foldetta_ddG`,
  1 AS `premPS_predict`,
  1 AS `premPS_ddG`,
  1 AS `sasa_average`,
  1 AS `sasa_delta`,
  1 AS `Bfactor_backbone_delta`,
  1 AS `Bfactor_backbone_stddev`,
  1 AS `Bfactor_sidechain_delta`,
  1 AS `Bfactor_sidechain_stddev`,
  1 AS `provean_score`,
  1 AS `provean_predict`,
  1 AS `polyPhen2_HumDiv_predict`,
  1 AS `polyPhen2_HumDiv_pph2_prob`,
  1 AS `polyPhen2_HumVar_predict`,
  1 AS `polyPhen2_HumVar_pph2_prob`,
  1 AS `SIFT_animal_Predict`,
  1 AS `SIFT_animal_Warnings`,
  1 AS `SIFT_animal_Conservation`,
  1 AS `SIFT_animal_Sequences`,
  1 AS `PAM250`,
  1 AS `PAM120`,
  1 AS `ESM1b_Q96PV0_LLRscore`,
  1 AS `ESM1b_Q96PV0_Prediction`,
  1 AS `FATHMM_Diseasespecific_Nervous_System_Score`,
  1 AS `AlphaMissense_Pathogenicity`,
  1 AS `AlphaMissense_Class`,
  1 AS `alphamissense_predict`,
  1 AS `SA_Secondary`,
  1 AS `SA_Tertiary`,
  1 AS `SA_Buried`,
  1 AS `SA_GAP_Ras_interface`,
  1 AS `SA_Membrane interface`,
  1 AS `SA_Benign`,
  1 AS `Alert`,
  1 AS `verdictID`,
  1 AS `verdict`,
  1 AS `description`,
  1 AS `structure`,
  1 AS `doi` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gnomAD`
--

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

--
-- Table structure for table `syngap`
--

DROP TABLE IF EXISTS `syngap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syngap` (
  `variant` varchar(6) NOT NULL,
  `deltaMW` decimal(10,4),
  `deltaHydropathy` decimal(4,1),
  `sasa_average` decimal(5,1) DEFAULT NULL,
  `sasa_delta` decimal(4,1) DEFAULT NULL,
  `Bfactor_backbone_delta` decimal(3,1) DEFAULT NULL,
  `Bfactor_backbone_stddev` decimal(3,1) DEFAULT NULL,
  `Bfactor_sidechain_delta` decimal(3,1) DEFAULT NULL,
  `Bfactor_sidechain_stddev` decimal(3,1) DEFAULT NULL,
  `polyPhen2_HumDiv_predict` varchar(20),
  `polyPhen2_HumDiv_pph2_prob` decimal(5,3),
  `polyPhen2_HumVar_predict` varchar(20),
  `polyPhen2_HumVar_pph2_prob` decimal(5,3),
  `SIFT_mammal_Predict` decimal(4,2) DEFAULT NULL,
  `SIFT_mammal_Conservation` decimal(4,2) DEFAULT NULL,
  `SIFT_mammal_Sequences` smallint(5) unsigned DEFAULT NULL,
  `SIFT_mammal_Warnings` varchar(10) DEFAULT NULL,
  `SIFT_animal_Predict` decimal(4,2) DEFAULT NULL,
  `SIFT_animal_Conservation` decimal(4,2) DEFAULT NULL,
  `SIFT_animal_Sequences` smallint(5) unsigned DEFAULT NULL,
  `SIFT_animal_Warnings` varchar(10) DEFAULT NULL,
  `PAM250` tinyint(4),
  `PAM120` tinyint(4),
  `ESM1b_Q96PV0_LLRscore` decimal(6,3),
  `ESM1b_Q96PV0_Prediction` varchar(20),
  `FATHMM_Diseasespecific_Nervous_System_Score` decimal(4,2) DEFAULT NULL,
  `FATHMM_Inherited_Disease_Prediction` varchar(10) DEFAULT NULL,
  `FATHMM_Inherited_Disease_Score` decimal(4,2) DEFAULT NULL,
  `AlphaMissense_Pathogenicity` decimal(4,3),
  `AlphaMissense_Class` varchar(20),
  `SA_Secondary` tinyint(1) DEFAULT NULL,
  `SA_Tertiary` tinyint(1) DEFAULT NULL,
  `SA_Buried` tinyint(1) DEFAULT NULL,
  `SA_GAP_Ras_interface` tinyint(1) DEFAULT NULL,
  `SA_Membrane_interface` tinyint(1) DEFAULT NULL,
  `SA_Benign` tinyint(1) DEFAULT NULL,
  `Alert` tinyint(1) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `clinvar_link` text DEFAULT NULL,
  `resnum` smallint(5) unsigned NOT NULL,
  `domainID` tinyint(3) unsigned NOT NULL,
  `verdictID` tinyint(3) unsigned DEFAULT NULL,
  `clinvar_uid` int(10) DEFAULT NULL,
  `gnomAD_uid` varchar(14) DEFAULT NULL,
  `structure` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0=none, 1=structure, 2=MD-structure',
  `doi` varchar(32) DEFAULT NULL COMMENT 'Link to article',
  `provean_score` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`variant`),
  KEY `domainID` (`domainID`),
  KEY `verdictID` (`verdictID`),
  KEY `clinvar_uid` (`clinvar_uid`),
  CONSTRAINT `fk_clinvar` FOREIGN KEY (`clinvar_uid`) REFERENCES `clinvar` (`uid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_domain` FOREIGN KEY (`domainID`) REFERENCES `syngap_domain` (`domainID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_verdict` FOREIGN KEY (`verdictID`) REFERENCES `syngap_verdict` (`verdictID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syngap_domain`
--

DROP TABLE IF EXISTS `syngap_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syngap_domain` (
  `domainID` tinyint(3) unsigned NOT NULL,
  `domain` varchar(20) NOT NULL,
  PRIMARY KEY (`domainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syngap_structural`
--

DROP TABLE IF EXISTS `syngap_structural`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syngap_structural` (
  `variant` varchar(6) NOT NULL,
  `foldx_ddG` decimal(4,2) DEFAULT NULL,
  `foldx_stddev` decimal(3,1) DEFAULT NULL,
  `rosetta_ddG` decimal(4,2) DEFAULT NULL,
  `foldetta_ddG` decimal(4,2) DEFAULT NULL,
  `premPS_ddG` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`variant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syngap_verdict`
--

DROP TABLE IF EXISTS `syngap_verdict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syngap_verdict` (
  `verdictID` tinyint(3) unsigned NOT NULL,
  `verdict` varchar(30) NOT NULL,
  PRIMARY KEY (`verdictID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `HGVSp_to_variant`
--

/*!50001 DROP VIEW IF EXISTS `HGVSp_to_variant`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jukkleh`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HGVSp_to_variant` AS select `for_HGVSp_to_variant`.`HGVSp` AS `HGVSp`,concat(`srcaa`.`one`,`for_HGVSp_to_variant`.`resnum`,`dstaa`.`one`) AS `variant` from ((`for_HGVSp_to_variant` join `aminoacids` `srcaa` on(`srcaa`.`three` = `for_HGVSp_to_variant`.`src`)) join `aminoacids` `dstaa` on(`dstaa`.`three` = `for_HGVSp_to_variant`.`dst`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cdna_count`
--

/*!50001 DROP VIEW IF EXISTS `cdna_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jukkleh`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cdna_count` AS select `cdna`.`variant` AS `variant`,count(`cdna`.`variant`) AS `x` from `cdna` group by `cdna`.`variant` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `for_HGVSp_to_variant`
--

/*!50001 DROP VIEW IF EXISTS `for_HGVSp_to_variant`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jukkleh`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `for_HGVSp_to_variant` AS select `cdna`.`HGVSp` AS `HGVSp`,substr(`cdna`.`HGVSp`,3,3) AS `src`,substr(`cdna`.`HGVSp`,octet_length(`cdna`.`HGVSp`) - 2) AS `dst`,substr(`cdna`.`HGVSp`,6,octet_length(`cdna`.`HGVSp`) - 8) AS `resnum` from `cdna` order by `cdna`.`basenum`,`cdna`.`HGVSp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `for_csv`
--

/*!50001 DROP VIEW IF EXISTS `for_csv`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jukkleh`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `for_csv` AS select `cdna`.`cdna_change` AS `cdna`,`cdna`.`variant` AS `Variant`,`syngap_domain`.`domain` AS `Domain`,`cdna`.`clinvar_uid` AS `ClinVar ID`,`cdna`.`gnomad_id` AS `gnomAD ID`,`syngap`.`ESM1b_Q96PV0_LLRscore` AS `ESM1b (Q96PV0) LLRscore`,`syngap`.`AlphaMissense_Pathogenicity` AS `AlphaMissense Pathogenicity`,`cdna`.`revel_score` AS `revel_score`,`syngap_structural`.`foldx_ddG` AS `FoldX ddG`,`syngap_structural`.`rosetta_ddG` AS `Rosetta ddG`,`syngap_structural`.`foldetta_ddG` AS `Foldetta ddG`,`syngap_structural`.`premPS_ddG` AS `premPS ddG`,`syngap`.`provean_score` AS `PROVEAN Score`,`syngap`.`polyPhen2_HumDiv_pph2_prob` AS `polyPhen-2 HumDiv pph2_prob`,`syngap`.`polyPhen2_HumDiv_predict` AS `polyPhen-2 HumDiv predict`,`syngap`.`polyPhen2_HumVar_pph2_prob` AS `polyPhen-2 HumVar pph2_prob`,`syngap`.`polyPhen2_HumVar_predict` AS `polyPhen-2 HumVar predict`,`syngap`.`FATHMM_Diseasespecific_Nervous_System_Score` AS `FATHMM Nervous System Score`,`syngap`.`SIFT_animal_Predict` AS `SIFT Prediction`,`syngap`.`SIFT_animal_Warnings` AS `SIFT Status`,`syngap`.`PAM250` AS `PAM250`,`syngap`.`PAM120` AS `PAM120`,`syngap`.`deltaHydropathy` AS `dHydropathy`,round(`syngap`.`deltaMW`,2) AS `dMW`,`syngap`.`sasa_average` AS `average SASA`,`syngap`.`sasa_delta` AS `dSASA`,`syngap`.`Bfactor_backbone_delta` AS `d B-factor backbone`,`syngap`.`Bfactor_backbone_stddev` AS `StdDev B-factor backbone`,`syngap`.`Bfactor_sidechain_delta` AS `d B-factor sidechain`,`syngap`.`Bfactor_sidechain_stddev` AS `StdDev B-factor sidechain`,`syngap`.`SA_Secondary` AS `SA Secondary`,`syngap`.`SA_Tertiary` AS `SA Tertiary bonds`,`syngap`.`SA_Buried` AS `SA Inside out`,`syngap`.`SA_GAP_Ras_interface` AS `SA GAP-Ras interface`,`syngap`.`SA_Membrane_interface` AS `SA At membrane`,`syngap`.`SA_Benign` AS `SA No effect`,`syngap`.`Alert` AS `SA MD Alert`,`syngap_verdict`.`verdict` AS `SA Verdict`,`syngap`.`description` AS `SA Description`,`syngap`.`doi` AS `DOI` from ((((`cdna` left join `syngap` on(`cdna`.`variant` = `syngap`.`variant`)) left join `syngap_domain` on(`syngap`.`domainID` = `syngap_domain`.`domainID`)) left join `syngap_verdict` on(`syngap`.`verdictID` = `syngap_verdict`.`verdictID`)) left join `syngap_structural` on(`syngap`.`variant` = `syngap_structural`.`variant`)) order by `cdna`.`basenum`,`cdna`.`variant` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `for_datatable`
--

/*!50001 DROP VIEW IF EXISTS `for_datatable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jukkleh`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `for_datatable` AS select `cdna`.`cdna_change` AS `cdna`,`cdna`.`basenum` AS `basenum`,`cdna`.`resnum` AS `resnum`,`cdna`.`variant` AS `variant`,`syngap_domain`.`domain` AS `domain`,`cdna`.`clinvar_uid` AS `clinvar_uid`,ifnull(`clinvar_germline`.`cv_rank`,99) AS `cv_rank`,`clinvar_review`.`stars` AS `cv_review`,`clinvar`.`scv_count` AS `cv_submissions`,`clinvar_germline`.`cv_status` AS `cv_status`,`cdna`.`gnomad_id` AS `gnomAD_id`,`gnomAD`.`allele_count` AS `allele_count`,`gnomAD`.`allele_freq` AS `allele_freq`,`cdna`.`revel_score` AS `revel_score`,`revel_prediction`(1000 * `cdna`.`revel_score`) AS `revel_predict`,round(`syngap`.`deltaMW`,2) AS `deltaMW`,`syngap`.`deltaHydropathy` AS `deltaHydropathy`,`foldx_prediction`(100 * `syngap_structural`.`foldx_ddG`) AS `foldx_predict`,`syngap_structural`.`foldx_ddG` AS `foldx_avg_ddG`,`syngap_structural`.`foldx_stddev` AS `foldx_stddev`,`rosetta_prediction`(100 * `syngap_structural`.`rosetta_ddG`) AS `rosetta_predict`,`syngap_structural`.`rosetta_ddG` AS `rosetta_ddG`,`foldetta_prediction`(100 * `syngap_structural`.`foldetta_ddG`) AS `foldetta_predict`,`syngap_structural`.`foldetta_ddG` AS `foldetta_ddG`,`premps_prediction`(100 * `syngap_structural`.`premPS_ddG`) AS `premPS_predict`,`syngap_structural`.`premPS_ddG` AS `premPS_ddG`,`syngap`.`sasa_average` AS `sasa_average`,`syngap`.`sasa_delta` AS `sasa_delta`,`syngap`.`Bfactor_backbone_delta` AS `Bfactor_backbone_delta`,`syngap`.`Bfactor_backbone_stddev` AS `Bfactor_backbone_stddev`,`syngap`.`Bfactor_sidechain_delta` AS `Bfactor_sidechain_delta`,`syngap`.`Bfactor_sidechain_stddev` AS `Bfactor_sidechain_stddev`,`syngap`.`provean_score` AS `provean_score`,`provean_prediction`(100 * `syngap`.`provean_score`) AS `provean_predict`,`syngap`.`polyPhen2_HumDiv_predict` AS `polyPhen2_HumDiv_predict`,`syngap`.`polyPhen2_HumDiv_pph2_prob` AS `polyPhen2_HumDiv_pph2_prob`,`syngap`.`polyPhen2_HumVar_predict` AS `polyPhen2_HumVar_predict`,`syngap`.`polyPhen2_HumVar_pph2_prob` AS `polyPhen2_HumVar_pph2_prob`,`syngap`.`SIFT_animal_Predict` AS `SIFT_animal_Predict`,`syngap`.`SIFT_animal_Warnings` AS `SIFT_animal_Warnings`,`syngap`.`SIFT_animal_Conservation` AS `SIFT_animal_Conservation`,`syngap`.`SIFT_animal_Sequences` AS `SIFT_animal_Sequences`,`syngap`.`PAM250` AS `PAM250`,`syngap`.`PAM120` AS `PAM120`,`syngap`.`ESM1b_Q96PV0_LLRscore` AS `ESM1b_Q96PV0_LLRscore`,`syngap`.`ESM1b_Q96PV0_Prediction` AS `ESM1b_Q96PV0_Prediction`,`syngap`.`FATHMM_Diseasespecific_Nervous_System_Score` AS `FATHMM_Diseasespecific_Nervous_System_Score`,`syngap`.`AlphaMissense_Pathogenicity` AS `AlphaMissense_Pathogenicity`,`syngap`.`AlphaMissense_Class` AS `AlphaMissense_Class`,`alphamissense_prediction`(1000 * `syngap`.`AlphaMissense_Pathogenicity`) AS `alphamissense_predict`,`syngap`.`SA_Secondary` AS `SA_Secondary`,`syngap`.`SA_Tertiary` AS `SA_Tertiary`,`syngap`.`SA_Buried` AS `SA_Buried`,`syngap`.`SA_GAP_Ras_interface` AS `SA_GAP_Ras_interface`,`syngap`.`SA_Membrane_interface` AS `SA_Membrane interface`,`syngap`.`SA_Benign` AS `SA_Benign`,`syngap`.`Alert` AS `Alert`,`syngap`.`verdictID` AS `verdictID`,`syngap_verdict`.`verdict` AS `verdict`,`syngap`.`description` AS `description`,`syngap`.`structure` AS `structure`,`syngap`.`doi` AS `doi` from ((((((((`cdna` left join `clinvar` on(`cdna`.`clinvar_uid` = `clinvar`.`uid`)) left join `clinvar_review` on(`clinvar`.`review_status` = `clinvar_review`.`status`)) left join `clinvar_germline` on(`clinvar`.`germline_desc` = `clinvar_germline`.`cv_description`)) left join `gnomAD` on(`cdna`.`gnomad_id` = `gnomAD`.`id`)) left join `syngap` on(`cdna`.`variant` = `syngap`.`variant`)) left join `syngap_domain` on(`syngap`.`domainID` = `syngap_domain`.`domainID`)) left join `syngap_verdict` on(`syngap`.`verdictID` = `syngap_verdict`.`verdictID`)) left join `syngap_structural` on(`syngap`.`variant` = `syngap_structural`.`variant`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-12 11:11:26
