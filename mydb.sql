CREATE DATABASE  IF NOT EXISTS `gqmintel` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gqmintel`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 192.168.8.15    Database: gqmintel
-- ------------------------------------------------------
-- Server version	5.0.95

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset` (
  `asset_id` char(30) NOT NULL,
  `protocol_id` char(10) NOT NULL,
  `name` varchar(45) default NULL,
  `descr` varchar(200) default NULL,
  `ip_addr` char(15) default NULL,
  `contact` varchar(45) default NULL,
  `location` varchar(45) default NULL,
  `ctlg_id` char(20) default NULL,
  `srvr_app_id` smallint(6) default NULL,
  `asset_usg` varchar(50) default NULL,
  `imp_lvl` tinyint(4) default '3',
  `ownership` varchar(6) default 'own',
  `dc_ent` char(2) default 'dc',
  `active` char(1) default 'y' COMMENT 'asset is active or it has moved or decommissioned(if users choose these assets in dashboard and click on decommiosn the asset active set to n and these assets should not consider for any furtyer calculation)',
  `inactive_dttm` datetime default NULL COMMENT 'if assets are made inactive then capture date',
  `type_id` char(20) default NULL,
  PRIMARY KEY  (`asset_id`),
  KEY `fk49_idx` (`protocol_id`),
  KEY `fk100_idx` (`srvr_app_id`),
  KEY `fk92_idx` (`ctlg_id`),
  KEY `fk95_idx` (`srvr_app_id`),
  KEY `fk51_idx` (`imp_lvl`),
  KEY `fk84_idx` (`srvr_app_id`),
  KEY `fk197_idx` (`type_id`),
  CONSTRAINT `fk197` FOREIGN KEY (`type_id`) REFERENCES `comp_type` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk49` FOREIGN KEY (`protocol_id`) REFERENCES `protocol` (`protocol_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk51` FOREIGN KEY (`imp_lvl`) REFERENCES `asset_imp` (`imp_lvl`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk84` FOREIGN KEY (`srvr_app_id`) REFERENCES `srvr_app_type` (`srvr_app_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk92` FOREIGN KEY (`ctlg_id`) REFERENCES `dev_ctlg` (`ctlg_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES ('C-000c29ee7a6b','computer','GQ-DEV','hardware: x86 family 6 model 44 stepping 2 at/at compatible - software: windows version 5.2 (build 3790 multiprocessor free)','192.168.1.33','','',NULL,NULL,NULL,3,'own','dc','y',NULL,NULL),('C-00e01c3c16e4','computer','selenium','linux selenium 3.2.0-23-generic #36-ubuntu smp tue apr 10 20:39:51 utc 2012 x86_64','192.168.1.80','Root <root@localhost> (configure /etc/snmp/s','Unknown (edit /etc/snmp/snmpd.conf)',NULL,NULL,NULL,3,'own','dc','y',NULL,NULL),('C-1078d2cfb13c','computer','localhost.localdomain','linux localhost.localdomain 2.6.32-71.el6.x86_64 #1 smp fri may 20 03:51:51 bst 2011 x86_64','192.168.1.125','Root <root@localhost> (configure /etc/snmp/s','Unknown (edit /etc/snmp/snmpd.conf)',NULL,NULL,NULL,3,'own','dc','y',NULL,NULL),('C-2c41389ce9d5','computer','GQCHND1008.gquotient.com','hardware: x86 family 6 model 42 stepping 7 at/at compatible - software: windows version 6.1 (build 7601 multiprocessor free)','192.168.8.207','csdbnfba,dmsbndm,asdnfewerwerwergdfdsfgdfgfg','wfrerwerwqerwerffejknmwerhmweryweunmraeuiodm',NULL,NULL,NULL,3,'own','dc','y',NULL,NULL),('C-2c41389da7d6','computer','GQCHND1009.gquotient.com','hardware: intel64 family 6 model 42 stepping 7 at/at compatible - software: windows version 6.1 (build 7601 multiprocessor free)','192.168.8.206','','',NULL,NULL,NULL,3,'own','dc','y',NULL,NULL),('C-2c4138a2481f','computer','GQCHND1006.gquotient.com','hardware: intel64 family 6 model 42 stepping 7 at/at compatible - software: windows version 6.1 (build 7601 multiprocessor free)','192.168.8.208','','chennaichennaichennaichennaichennaichennaich',NULL,NULL,NULL,3,'own','dc','y',NULL,NULL),('C-3859f9e5d21a','computer','GQ-PC','hardware: x86 family 6 model 42 stepping 7 at/at compatible - software: windows version 6.1 (build 7601 multiprocessor free)','192.168.8.209','','',NULL,NULL,NULL,3,'own','dc','y',NULL,NULL),('C-8c89a539be66','computer','GQCHNSRV1014','linux gqchnsrv1014 2.6.18-194.el5pae #1 smp fri apr 2 15:37:44 edt 2010 i686','192.168.8.15','ganesh.s@gquotient.com','GQMAPS',NULL,NULL,NULL,3,'own','dc','y',NULL,NULL),('P-2c413881ed23','printer','NPI81ED23','hp ethernet multi-environment,sn:cnc9c8hd62,fn:p933l00,svcid:22032,pid:hp laserjet m1536dnf mfp','192.168.1.11','','',NULL,NULL,NULL,3,'own','dc','y',NULL,NULL),('S-0025b438b440','nsrg','GQCHNSW01','cisco ios software, c2960 software (c2960-lanbase-m), version 12.2(35)se5, release software (fc1)\r\ncopyright (c) 1986-2007 by cisco systems, inc.\r\ncompiled thu 19-jul-07 20:06 by nachen','192.168.1.253','','',NULL,NULL,NULL,3,'own','dc','y',NULL,NULL);
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_imp`
--

DROP TABLE IF EXISTS `asset_imp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_imp` (
  `imp_lvl` tinyint(4) NOT NULL,
  `descr` varchar(20) NOT NULL,
  PRIMARY KEY  (`imp_lvl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='to demonstrate the importance of assets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_imp`
--

LOCK TABLES `asset_imp` WRITE;
/*!40000 ALTER TABLE `asset_imp` DISABLE KEYS */;
INSERT INTO `asset_imp` VALUES (1,'Very Important'),(2,'Important'),(3,'Medium'),(4,'Expendable');
/*!40000 ALTER TABLE `asset_imp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_sw`
--

DROP TABLE IF EXISTS `bl_sw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_sw` (
  `sid` int(11) NOT NULL,
  `sw_name` varchar(30) NOT NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='this is domain table , datas need to collect from enterprise';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_sw`
--

LOCK TABLES `bl_sw` WRITE;
/*!40000 ALTER TABLE `bl_sw` DISABLE KEYS */;
INSERT INTO `bl_sw` VALUES (1,'microsoft');
/*!40000 ALTER TABLE `bl_sw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_conn_device`
--

DROP TABLE IF EXISTS `comp_conn_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comp_conn_device` (
  `run_id` bigint(20) NOT NULL,
  `asset_id` char(30) NOT NULL,
  `ip_addr` char(15) NOT NULL,
  `port` int(11) default NULL,
  KEY `fk19_idx` (`run_id`,`asset_id`),
  KEY `fk70_idx` (`asset_id`),
  KEY `fk71_idx` (`run_id`),
  KEY `fk71_idx1` (`run_id`),
  KEY `fk47_idx` (`run_id`),
  KEY `fk123_idx` (`run_id`),
  KEY `idx_2` (`run_id`,`asset_id`),
  CONSTRAINT `fk123` FOREIGN KEY (`run_id`) REFERENCES `meter_run` (`run_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk70` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_conn_device`
--

LOCK TABLES `comp_conn_device` WRITE;
/*!40000 ALTER TABLE `comp_conn_device` DISABLE KEYS */;
INSERT INTO `comp_conn_device` VALUES (39830,'C-2c41389ce9d5','192.168.8.15',8080),(39830,'C-2c41389ce9d5','192.168.8.15',3306),(39830,'C-2c41389ce9d5','192.168.8.19',3306),(39830,'C-2c41389ce9d5','192.168.1.11',8080),(39830,'C-2c41389ce9d5','192.168.1.22',0),(39830,'C-2c41389da7d6','192.168.1.11',8080),(39830,'C-2c41389da7d6','192.168.8.209',0),(39830,'C-2c41389da7d6','192.168.8.19',3306),(39830,'C-2c41389da7d6','192.168.8.15',3306),(39830,'C-2c41389da7d6','192.168.8.12',8080),(39830,'C-3859f9e5d21a','192.168.1.11',3911),(39830,'C-3859f9e5d21a','192.168.8.206',0),(39830,'C-8c89a539be66','192.168.8.206',0),(39830,'C-8c89a539be66','192.168.8.207',0);
/*!40000 ALTER TABLE `comp_conn_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_inst_sw`
--

DROP TABLE IF EXISTS `comp_inst_sw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comp_inst_sw` (
  `run_id` bigint(20) NOT NULL,
  `asset_id` char(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `inst_dttm` datetime NOT NULL,
  KEY `fk20_idx` (`run_id`,`asset_id`),
  KEY `fk101_idx` (`asset_id`),
  KEY `fk102_idx` (`run_id`),
  KEY `fk34_idx` (`run_id`),
  KEY `fk32_idx` (`run_id`),
  KEY `fk32_idx1` (`run_id`),
  KEY `idx_1` (`run_id`,`asset_id`),
  CONSTRAINT `fk101` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk32` FOREIGN KEY (`run_id`) REFERENCES `meter_run` (`run_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_inst_sw`
--

LOCK TABLES `comp_inst_sw` WRITE;
/*!40000 ALTER TABLE `comp_inst_sw` DISABLE KEYS */;
INSERT INTO `comp_inst_sw` VALUES (39830,'C-2c41389ce9d5','7-Zip 9.20','2012-02-11 12:12:30'),(39830,'C-2c41389ce9d5','Adobe AIR','2012-03-19 19:02:42'),(39830,'C-2c41389ce9d5','Adobe Flash Player 11 ActiveX','2013-10-09 13:35:54'),(39830,'C-2c41389ce9d5','Adobe Flash Player 11 Plugin','2013-10-10 15:32:26'),(39830,'C-2c41389ce9d5','Apache Tomcat 7.0 (remove only)','2013-02-20 12:54:34'),(39830,'C-2c41389ce9d5','CCleaner','2013-08-19 12:27:18'),(39830,'C-2c41389ce9d5','Connector ID','2012-09-06 12:43:50'),(39830,'C-2c41389ce9d5','CutePDF Writer 2.8','2012-02-11 12:26:56'),(39830,'C-2c41389ce9d5','Microsoft Office Enterprise 2007','2012-07-11 19:07:14'),(39830,'C-2c41389ce9d5','Express Zip','2013-07-17 11:33:16'),(39830,'C-2c41389ce9d5','Google Chrome','2013-10-18 15:51:28'),(39830,'C-2c41389ce9d5','Microsoft .NET Framework 4 Client Profile','2012-10-30 15:36:24'),(39830,'C-2c41389ce9d5','Microsoft .NET Framework 4 Extended','2013-01-18 11:09:56'),(39830,'C-2c41389ce9d5','Mozilla Firefox 24.0 (x86 en-US)','2013-10-09 14:31:44'),(39830,'C-2c41389ce9d5','Mozilla Maintenance Service','2013-10-09 14:31:48'),(39830,'C-2c41389ce9d5','Net-SNMP 5.6.1.1','2013-04-15 17:38:20'),(39830,'C-2c41389ce9d5','Notepad++','2012-02-11 12:11:44'),(39830,'C-2c41389ce9d5','Intel(R) Network Connections 16.5.2.0','2012-02-02 18:51:28'),(39830,'C-2c41389ce9d5','HP Softpaq SP52247','2012-02-02 18:50:56'),(39830,'C-2c41389ce9d5','VLC media player 1.1.11','2013-06-27 17:07:40'),(39830,'C-2c41389ce9d5','WinHTTrack Website Copier 3.44-1','2013-02-27 17:44:50'),(39830,'C-2c41389ce9d5','WordWeb','2012-03-29 12:32:58'),(39830,'C-2c41389ce9d5','32 Bit HP CIO Components Installer','2012-03-19 11:57:42'),(39830,'C-2c41389ce9d5','Microsoft .NET Framework 4 Extended','2013-02-18 16:53:14'),(39830,'C-2c41389ce9d5','Update for Microsoft .NET Framework 4 Extended (KB2468871)','2013-02-18 16:52:46'),(39830,'C-2c41389ce9d5','Security Update for Microsoft .NET Framework 4 Extended (KB24873','2013-02-18 16:52:46'),(39830,'C-2c41389ce9d5','Update for Microsoft .NET Framework 4 Extended (KB2533523)','2013-01-18 11:20:24'),(39830,'C-2c41389ce9d5','Update for Microsoft .NET Framework 4 Extended (KB2600217)','2013-01-18 11:20:24'),(39830,'C-2c41389ce9d5','Security Update for Microsoft .NET Framework 4 Extended (KB26563','2013-01-18 11:16:40'),(39830,'C-2c41389ce9d5','Microsoft Visual C++ 2010  x86 Redistributable - 10.0.30319','2012-11-22 10:34:30'),(39830,'C-2c41389ce9d5','Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.4148','2012-11-15 16:29:38'),(39830,'C-2c41389ce9d5','HPLJUT','2012-03-19 11:59:26'),(39830,'C-2c41389ce9d5','MySQL Workbench 5.2 CE','2012-10-30 16:26:40'),(39830,'C-2c41389ce9d5','Java(TM) 6 Update 20','2013-03-18 11:37:00'),(39830,'C-2c41389ce9d5','HP Update','2012-05-28 15:46:44'),(39830,'C-2c41389ce9d5','Java(TM) SE Development Kit 6 Update 13','2013-02-18 16:39:22'),(39830,'C-2c41389ce9d5','Apple Application Support','2013-08-19 12:24:36'),(39830,'C-2c41389ce9d5','Microsoft .NET Framework 4 Client Profile','2013-01-18 11:20:08'),(39830,'C-2c41389ce9d5','Update for Microsoft .NET Framework 4 Client Profile (KB2468871)','2013-01-18 11:19:54'),(39830,'C-2c41389ce9d5','Update for Microsoft .NET Framework 4 Client Profile (KB2533523)','2013-01-18 11:19:54'),(39830,'C-2c41389ce9d5','Update for Microsoft .NET Framework 4 Client Profile (KB2600217)','2013-01-18 11:19:54'),(39830,'C-2c41389ce9d5','Security Update for Microsoft .NET Framework 4 Client Profile (K','2013-01-18 11:19:54'),(39830,'C-2c41389ce9d5','Security Update for Microsoft .NET Framework 4 Client Profile (K','2013-01-18 11:16:06'),(39830,'C-2c41389ce9d5','Security Update for Microsoft .NET Framework 4 Client Profile (K','2012-11-22 10:34:56'),(39830,'C-2c41389ce9d5','hppLaserJetService','2012-03-19 11:58:22'),(39830,'C-2c41389ce9d5','FireArc Arcade','2012-03-19 19:43:16'),(39830,'C-2c41389ce9d5','Java Auto Updater','2013-03-18 11:37:52'),(39830,'C-2c41389ce9d5','53:6b:79:70:65:99:20:36:2e:37','2013-10-09 10:08:14'),(39830,'C-2c41389ce9d5','Google Talk Plugin','2013-06-10 09:36:44'),(39830,'C-2c41389ce9d5','Intel(R) Management Engine Components','2012-02-02 18:50:58'),(39830,'C-2c41389ce9d5','HP LaserJet Professional M1530 MFP Series','2012-03-19 11:57:22'),(39830,'C-2c41389ce9d5','Apple Software Update','2013-08-19 12:24:00'),(39830,'C-2c41389ce9d5','Balsamiq Mockups For Desktop','2013-03-27 16:53:02'),(39830,'C-2c41389ce9d5','Telerik Test Studio 2013.1','2013-09-26 17:18:00'),(39830,'C-2c41389ce9d5','hppSendFaxM1530','2012-03-19 11:58:54'),(39830,'C-2c41389ce9d5','Microsoft Silverlight','2012-07-11 19:02:24'),(39830,'C-2c41389ce9d5','MySQL Server 5.5','2013-02-20 15:04:26'),(39830,'C-2c41389ce9d5','Microsoft Office Access MUI (English) 2007','2012-07-11 19:09:32'),(39830,'C-2c41389ce9d5','Microsoft Office Excel MUI (English) 2007','2012-07-11 19:12:26'),(39830,'C-2c41389ce9d5','Microsoft Office PowerPoint MUI (English) 2007','2012-07-11 19:16:52'),(39830,'C-2c41389ce9d5','Microsoft Office Publisher MUI (English) 2007','2012-07-11 19:21:48'),(39830,'C-2c41389ce9d5','Microsoft Office Outlook MUI (English) 2007','2012-07-11 19:13:52'),(39830,'C-2c41389ce9d5','Microsoft Office Word MUI (English) 2007','2012-07-11 19:14:50'),(39830,'C-2c41389ce9d5','Microsoft Office Proof (English) 2007','2012-07-11 19:08:28'),(39830,'C-2c41389ce9d5','Microsoft Office Proof (French) 2007','2012-07-11 19:08:36'),(39830,'C-2c41389ce9d5','Microsoft Office Proof (Spanish) 2007','2012-07-11 19:08:32'),(39830,'C-2c41389ce9d5','Microsoft Office Proofing (English) 2007','2012-02-28 11:06:22'),(39830,'C-2c41389ce9d5','Microsoft Office Enterprise 2007','2012-09-28 10:41:54'),(39830,'C-2c41389ce9d5','Microsoft Office InfoPath MUI (English) 2007','2012-07-11 19:22:06'),(39830,'C-2c41389ce9d5','Microsoft Office Shared MUI (English) 2007','2012-07-11 19:15:30'),(39830,'C-2c41389ce9d5','Microsoft Office OneNote MUI (English) 2007','2012-07-11 19:23:42'),(39830,'C-2c41389ce9d5','Microsoft Office Groove MUI (English) 2007','2012-07-11 19:05:10'),(39830,'C-2c41389ce9d5','Microsoft Office Groove Setup Metadata MUI (English) 2007','2012-07-11 19:05:12'),(39830,'C-2c41389ce9d5','Microsoft Office Shared Setup Metadata MUI (English) 2007','2012-07-11 19:04:38'),(39830,'C-2c41389ce9d5','Microsoft Office Access Setup Metadata MUI (English) 2007','2012-07-11 19:05:12'),(39830,'C-2c41389ce9d5','hppTLBXFXM1530','2012-03-19 11:58:30'),(39830,'C-2c41389ce9d5','Google Earth','2013-07-31 16:01:32'),(39830,'C-2c41389ce9d5','Java DB 10.4.1.3','2013-02-18 16:41:48'),(39830,'C-2c41389ce9d5','Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.17','2013-10-16 12:53:16'),(39830,'C-2c41389ce9d5','Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.6161','2012-11-22 10:35:44'),(39830,'C-2c41389ce9d5','hppM1530LaserJetService','2012-03-19 11:58:12'),(39830,'C-2c41389ce9d5','hpzTLBXFX','2012-03-19 11:58:38'),(39830,'C-2c41389ce9d5','32 Bit HP CIO Components Installer','2012-05-28 15:47:12'),(39830,'C-2c41389ce9d5','Google Update Helper','2013-10-08 15:47:04'),(39830,'C-2c41389ce9d5','Adobe Reader X (10.1.8)','2013-09-11 10:57:10'),(39830,'C-2c41389ce9d5','Aternity Agent','2012-12-19 14:53:56'),(39830,'C-2c41389ce9d5','Hex Color Finder','2012-02-29 16:01:38'),(39830,'C-2c41389ce9d5','HPLaserJetHelp_LearnCenter','2012-03-19 11:58:04'),(39830,'C-2c41389ce9d5','HP LJ M1530 MFP Series HP Scan','2012-03-19 11:58:40'),(39830,'C-2c41389ce9d5','hppFaxUtilityM1530','2012-03-19 11:59:22'),(39830,'C-2c41389ce9d5','I.R.I.S. OCR','2012-03-19 11:58:48'),(39830,'C-2c41389ce9d5','Microsoft Primary Interoperability Assemblies 2005','2013-09-26 17:00:46'),(39830,'C-2c41389ce9d5','smartEN-PlugEnergyMonitor','2013-02-12 12:09:00'),(39830,'C-2c41389ce9d5','Trend Micro Client/Server Security Agent','2012-02-10 13:41:48'),(39830,'C-2c41389ce9d5','Intel(R) Processor Graphics','2012-02-02 18:52:00'),(39830,'C-2c41389ce9d5','Realtek High Definition Audio Driver','2012-02-02 18:50:46'),(39830,'C-2c41389ce9d5','Intel(R) Control Center','2012-02-02 18:51:06'),(39830,'C-2c41389ce9d5','MySQL Tools for 5.0','2013-02-26 15:22:40'),(39830,'C-2c41389ce9d5','hppFaxDrvM1530','2012-03-19 11:59:08'),(39830,'C-2c4138a2481f','Apache Tomcat 6.0 Tomcat6 (remove only)','2013-09-13 17:05:52'),(39830,'C-2c4138a2481f','Microsoft .NET Framework 4 Client Profile','2012-12-14 11:33:46'),(39830,'C-2c4138a2481f','Microsoft .NET Framework 4 Extended','2013-09-10 10:44:54'),(39830,'C-2c4138a2481f','PDF Creator','2012-09-07 11:36:38'),(39830,'C-2c4138a2481f','Intel(R) Network Connections 16.5.2.0','2012-06-19 14:50:22'),(39830,'C-2c4138a2481f','VERDE VDI User Tools 64-bit','2012-11-28 18:01:14'),(39830,'C-2c4138a2481f','Windows Live Family Safety','2012-08-22 15:38:18'),(39830,'C-2c4138a2481f','Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.6161','2013-09-05 14:32:48'),(39830,'C-2c4138a2481f','Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.17','2012-07-26 16:34:08'),(39830,'C-2c4138a2481f','Microsoft Silverlight','2013-10-09 14:16:06'),(39830,'C-2c4138a2481f','Microsoft .NET Framework 4 Extended','2013-10-09 14:12:48'),(39830,'C-2c4138a2481f','Microsoft Office Office 64-bit Components 2007','2013-09-04 15:14:24'),(39830,'C-2c4138a2481f','Microsoft Office Shared 64-bit MUI (English) 2007','2012-07-03 16:40:18'),(39830,'C-2c4138a2481f','Microsoft Office Shared 64-bit Setup Metadata MUI (English) 2007','2012-07-03 16:40:24'),(39830,'C-2c4138a2481f','Microsoft Application Error Reporting','2012-08-22 15:34:48'),(39830,'C-2c4138a2481f','64 Bit HP CIO Components Installer','2013-07-16 11:23:42'),(39830,'C-2c4138a2481f','Microsoft .NET Framework 4 Client Profile','2013-10-09 14:11:16'),(39830,'C-2c41389da7d6','Apache Tomcat 6.0 Tomcat6 (remove only)','2013-09-13 16:13:44'),(39830,'C-2c41389da7d6','Microsoft .NET Framework 4 Client Profile','2012-06-20 14:11:04'),(39830,'C-2c41389da7d6','Microsoft .NET Framework 4 Extended','2012-07-17 10:32:00'),(39830,'C-2c41389da7d6','Intel(R) Network Connections Drivers','2012-02-02 18:57:12'),(39830,'C-2c41389da7d6','WinRAR 4.11 (64-bit)','2012-05-25 00:22:58'),(39830,'C-2c41389da7d6','Reliance Netconnect+','2012-11-16 09:36:30'),(39830,'C-2c41389da7d6','VERDE VDI User Tools 64-bit','2013-05-21 15:20:48'),(39830,'C-2c41389da7d6','VERDE VDI User Tools 64-bit','2013-04-24 16:18:08'),(39830,'C-2c41389da7d6','Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.6161','2012-10-04 20:41:14'),(39830,'C-2c41389da7d6','Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.17','2012-08-30 16:03:18'),(39830,'C-2c41389da7d6','Microsoft Silverlight','2013-07-19 14:38:00'),(39830,'C-2c41389da7d6','Microsoft .NET Framework 4 Extended','2013-07-19 15:40:40'),(39830,'C-2c41389da7d6','Microsoft Office Office 64-bit Components 2007','2013-07-19 15:28:56'),(39830,'C-2c41389da7d6','Microsoft Office Shared 64-bit MUI (English) 2007','2012-06-20 13:17:06'),(39830,'C-2c41389da7d6','Microsoft Office Shared 64-bit Setup Metadata MUI (English) 2007','2012-06-20 13:17:14'),(39830,'C-2c41389da7d6','64 Bit HP CIO Components Installer','2013-03-15 18:43:00'),(39830,'C-2c41389da7d6','NXPowerLite','2012-05-24 23:54:46'),(39830,'C-2c41389da7d6','Trend Micro Client/Server Security Agent','2012-02-10 13:46:56'),(39830,'C-2c41389da7d6','Microsoft .NET Framework 4 Client Profile','2013-07-19 15:37:42'),(39830,'C-3859f9e5d21a','7-Zip 9.20','2013-06-09 20:03:50'),(39830,'C-3859f9e5d21a','Adobe Flash Player 11 ActiveX','2013-10-09 11:27:38'),(39830,'C-3859f9e5d21a','Adobe Flash Player 11 Plugin','2013-10-09 12:34:16'),(39830,'C-3859f9e5d21a','Adobe Shockwave Player 12.0','2013-09-24 20:01:16'),(39830,'C-3859f9e5d21a','Apache Tomcat 6.0 Tomcat6 (remove only)','2013-10-18 19:32:56'),(39830,'C-3859f9e5d21a','AVG 2013','2013-10-23 10:03:02'),(39830,'C-3859f9e5d21a','AVG Security Toolbar','2013-10-02 15:08:52'),(39830,'C-3859f9e5d21a','CCleaner','2013-06-06 20:20:06'),(39830,'C-3859f9e5d21a','Conexant HD Audio','2013-06-12 11:02:22'),(39830,'C-3859f9e5d21a','DivX Setup','2013-09-30 11:12:30'),(39830,'C-3859f9e5d21a','Microsoft Office Enterprise 2007','2013-04-02 12:25:06'),(39830,'C-3859f9e5d21a','Fiddler','2013-09-16 10:48:22'),(39830,'C-3859f9e5d21a','Fiddler Syntax-Highlighting Addons','2013-09-16 11:40:50'),(39830,'C-3859f9e5d21a','Foxit Reader','2013-02-08 22:28:50'),(39830,'C-3859f9e5d21a','Lenovo System Interface Driver','2013-06-12 11:36:22'),(39830,'C-3859f9e5d21a','Malwarebytes Anti-Malware version 1.75.0.1300','2013-06-10 21:16:22'),(39830,'C-3859f9e5d21a','Microsoft .NET Framework 4 Client Profile','2013-02-11 10:35:14'),(39830,'C-3859f9e5d21a','Mozilla Firefox 24.0 (x86 en-US)','2013-10-03 16:26:56'),(39830,'C-3859f9e5d21a','Mozilla Maintenance Service','2013-10-03 16:27:00'),(39830,'C-3859f9e5d21a','Net-SNMP 5.4.2.1','2013-10-01 10:59:30'),(39830,'C-3859f9e5d21a','Notepad++','2013-01-31 14:33:20'),(39830,'C-3859f9e5d21a','On Screen Display','2013-06-12 11:36:20'),(39830,'C-3859f9e5d21a','OptimizerPro','2013-07-24 16:39:28'),(39830,'C-3859f9e5d21a','Oracle - Java Duke Screensaver','2013-03-03 18:23:12'),(39830,'C-3859f9e5d21a','PC Image Editor','2013-08-26 17:42:20'),(39830,'C-3859f9e5d21a','Lenovo Power Management Driver','2013-01-30 11:03:34'),(39830,'C-3859f9e5d21a','pycron 0.5.9.0','2013-05-08 14:34:58'),(39830,'C-3859f9e5d21a','Reliance Netconnect+','2013-09-04 12:57:04'),(39830,'C-3859f9e5d21a','TeamViewer 8','2013-06-12 19:44:46'),(39830,'C-3859f9e5d21a','b5:54:6f:72:72:65:6e:74','2013-10-24 22:39:26'),(39830,'C-3859f9e5d21a','VLC media player 0.9.4','2013-02-09 14:17:22'),(39830,'C-3859f9e5d21a','WinRAR archiver','2013-02-22 22:20:44'),(39830,'C-3859f9e5d21a','WordWeb','2013-02-08 22:30:28'),(39830,'C-3859f9e5d21a','Yahoo! Messenger','2013-05-17 20:20:10'),(39830,'C-3859f9e5d21a','Reliance Netconnect+','2013-02-25 21:35:24'),(39830,'C-3859f9e5d21a','32 Bit HP CIO Components Installer','2013-09-27 12:58:32'),(39830,'C-3859f9e5d21a','Microsoft Office Communicator Web Access Installer','2013-07-23 17:05:46'),(39830,'C-3859f9e5d21a','Java(TM) 6 Update 24','2013-06-13 17:31:28'),(39830,'C-3859f9e5d21a','Araxis Merge 2001 Standard','2013-06-13 21:43:12'),(39830,'C-3859f9e5d21a','Java(TM) SE Development Kit 6 Update 13','2013-03-20 10:56:42'),(39830,'C-3859f9e5d21a','Microsoft .NET Framework 4 Client Profile','2013-06-10 21:49:54'),(39830,'C-3859f9e5d21a','Update for Microsoft .NET Framework 4 Client Profile (KB2468871)','2013-06-10 21:49:32'),(39830,'C-3859f9e5d21a','Update for Microsoft .NET Framework 4 Client Profile (KB2533523)','2013-06-10 21:49:32'),(39830,'C-3859f9e5d21a','Update for Microsoft .NET Framework 4 Client Profile (KB2600217)','2013-06-10 21:49:32'),(39830,'C-3859f9e5d21a','Security Update for Microsoft .NET Framework 4 Client Profile (K','2013-06-10 21:49:32'),(39830,'C-3859f9e5d21a','Security Update for Microsoft .NET Framework 4 Client Profile (K','2013-06-10 21:49:34'),(39830,'C-3859f9e5d21a','MySQL Workbench 5.2 CE','2013-06-10 21:55:42'),(39830,'C-3859f9e5d21a','Java Auto Updater','2013-06-13 17:31:58'),(39830,'C-3859f9e5d21a','53:6b:79:70:65:99:20:36:2e:37','2013-09-16 22:15:46'),(39830,'C-3859f9e5d21a','Cisco LEAP Module','2013-01-30 09:47:50'),(39830,'C-3859f9e5d21a','swMSM','2013-09-24 20:01:06'),(39830,'C-3859f9e5d21a','AVG 2013','2013-10-23 10:03:30'),(39830,'C-3859f9e5d21a','AVG 2013','2013-09-02 09:52:32'),(39830,'C-3859f9e5d21a','Cisco EAP-FAST Module','2013-01-30 09:47:58'),(39830,'C-3859f9e5d21a','VERDE VDI User Tools','2013-03-15 16:32:50'),(39830,'C-3859f9e5d21a','Microsoft Visual C++ 2005 Redistributable','2013-05-17 20:18:34'),(39830,'C-3859f9e5d21a','VERDE VDI User Tools (GPL)','2013-06-12 13:52:08'),(39830,'C-3859f9e5d21a','MySQL Server 5.5','2013-02-10 11:03:06'),(39830,'C-3859f9e5d21a','Microsoft Office Access MUI (English) 2007','2013-04-02 12:22:40'),(39830,'C-3859f9e5d21a','Microsoft Office Excel MUI (English) 2007','2013-04-02 12:21:14'),(39830,'C-3859f9e5d21a','Microsoft Office PowerPoint MUI (English) 2007','2013-04-02 12:21:32'),(39830,'C-3859f9e5d21a','Microsoft Office Publisher MUI (English) 2007','2013-04-02 12:22:20'),(39830,'C-3859f9e5d21a','Microsoft Office Outlook MUI (English) 2007','2013-04-02 12:21:22'),(39830,'C-3859f9e5d21a','Microsoft Office Word MUI (English) 2007','2013-04-02 12:22:30'),(39830,'C-3859f9e5d21a','Microsoft Office Proof (English) 2007','2013-04-02 12:22:10'),(39830,'C-3859f9e5d21a','Microsoft Office Proof (French) 2007','2013-04-02 12:22:04'),(39830,'C-3859f9e5d21a','Microsoft Office Proof (Spanish) 2007','2013-04-02 12:21:58'),(39830,'C-3859f9e5d21a','Microsoft Office Proofing (English) 2007','2013-04-02 12:22:14'),(39830,'C-3859f9e5d21a','Microsoft Office Enterprise 2007','2013-04-02 12:25:46'),(39830,'C-3859f9e5d21a','Microsoft Office InfoPath MUI (English) 2007','2013-04-02 12:21:50'),(39830,'C-3859f9e5d21a','Microsoft Office Shared MUI (English) 2007','2013-04-02 12:20:58'),(39830,'C-3859f9e5d21a','Microsoft Office OneNote MUI (English) 2007','2013-04-02 12:22:50'),(39830,'C-3859f9e5d21a','Microsoft Office Groove MUI (English) 2007','2013-04-02 12:21:38'),(39830,'C-3859f9e5d21a','Microsoft Office Groove Setup Metadata MUI (English) 2007','2013-04-02 12:21:42'),(39830,'C-3859f9e5d21a','Microsoft Office Shared Setup Metadata MUI (English) 2007','2013-04-02 12:21:06'),(39830,'C-3859f9e5d21a','Microsoft Office Access Setup Metadata MUI (English) 2007','2013-04-02 12:22:44'),(39830,'C-3859f9e5d21a','saofe ssave','2013-07-24 16:27:40'),(39830,'C-3859f9e5d21a','VC80CRTRedist - 8.0.50727.6195','2013-06-23 14:45:34'),(39830,'C-3859f9e5d21a','Java DB 10.4.1.3','2013-03-20 10:58:16'),(39830,'C-3859f9e5d21a','ThinkPad Wireless LAN Adapter Software','2013-01-30 09:48:00'),(39830,'C-3859f9e5d21a','Oracle VM VirtualBox 4.1.0','2013-10-29 12:18:46'),(39830,'C-3859f9e5d21a','Lenovo Patch Utility','2013-06-12 11:36:28'),(39830,'C-3859f9e5d21a','WinZip 17.0','2013-07-21 08:59:48'),(39830,'C-3859f9e5d21a','VERDE VDI User Tools (GPL)','2013-03-15 16:31:34'),(39830,'C-3859f9e5d21a','VERDE VDI User Tools','2013-06-12 13:51:26'),(39830,'C-3859f9e5d21a','smartEN-PlugEnergyMonitor','2013-03-14 11:32:54'),(39830,'C-3859f9e5d21a','Cisco PEAP Module','2013-01-30 09:47:54'),(39830,'C-3859f9e5d21a','Microsoft Visual C++ 2010  x86 Redistributable - 10.0.40219','2013-06-17 23:12:58'),(39830,'C-3859f9e5d21a','Intel(R) Processor Graphics','2013-01-30 10:48:34'),(39830,'C-3859f9e5d21a','MySQL Tools for 5.0','2013-01-31 14:37:50'),(39830,'C-8c89a539be66','mysql-5.0.95-5.el5_9','2013-08-07 11:38:57'),(39830,'C-8c89a539be66','mysql-server-5.0.95-5.el5_9','2013-08-07 11:40:53'),(39830,'C-1078d2cfb13c','verde-spice-6.5-3','2012-03-15 19:25:01'),(39830,'C-1078d2cfb13c','mysql-5.1.47-4.el6','2012-03-29 13:30:30'),(39830,'C-1078d2cfb13c','mysql-server-5.1.47-4.el6','2012-03-29 13:33:10'),(39830,'C-000c29ee7a6b','Active Directory Application Mode Service Pack 1','2012-09-18 15:06:44'),(39830,'C-000c29ee7a6b','Active Directory Application Mode Service Pack 1 MUI Pack','2012-09-18 15:20:10'),(39830,'C-000c29ee7a6b','MagicDisc 2.7.106','2012-08-23 11:56:02'),(39830,'C-000c29ee7a6b','Mozilla Firefox 14.0.1 (x86 en-US)','2012-09-27 12:19:06'),(39830,'C-000c29ee7a6b','Mozilla Maintenance Service','2012-09-27 12:19:08'),(39830,'C-000c29ee7a6b','Windows Server 2003 Service Pack 2','2012-09-22 16:10:16'),(39830,'C-000c29ee7a6b','Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.4148','2013-09-10 17:05:14'),(39830,'C-000c29ee7a6b','Java(TM) 7 Update 3','2012-09-22 16:22:00'),(39830,'C-000c29ee7a6b','VERDE VDI User Tools (GPL)','2012-09-22 20:46:24'),(39830,'C-000c29ee7a6b','Java Auto Updater','2012-09-22 16:27:58'),(39830,'C-000c29ee7a6b','VMware Tools','2013-09-10 17:08:26'),(39830,'C-000c29ee7a6b','VERDE VDI User Tools','2012-09-22 12:44:12');
/*!40000 ALTER TABLE `comp_inst_sw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_proc`
--

DROP TABLE IF EXISTS `comp_proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comp_proc` (
  `run_id` bigint(20) NOT NULL,
  `asset_id` char(30) NOT NULL,
  `proc_name` varchar(45) NOT NULL,
  `cpu_share_cs` int(11) NOT NULL,
  `mem_share_kb` int(11) NOT NULL,
  KEY `fk22_idx` (`run_id`,`asset_id`),
  KEY `fk103_idx` (`asset_id`),
  KEY `fk104_idx` (`run_id`),
  KEY `fk74_idx` (`run_id`),
  KEY `fk52_idx` (`run_id`),
  KEY `fk52_idx1` (`run_id`),
  KEY `idx_3` (`run_id`,`asset_id`),
  CONSTRAINT `fk103` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk52` FOREIGN KEY (`run_id`) REFERENCES `meter_run` (`run_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_proc`
--

LOCK TABLES `comp_proc` WRITE;
/*!40000 ALTER TABLE `comp_proc` DISABLE KEYS */;
INSERT INTO `comp_proc` VALUES (39830,'C-2c41389ce9d5','System Idle Process',382534,24),(39830,'C-2c41389ce9d5','System',5873,2332),(39830,'C-2c41389ce9d5','smss.exe',1,812),(39830,'C-2c41389ce9d5','snmp.exe',45,5372),(39830,'C-2c41389ce9d5','svchost.exe',0,2612),(39830,'C-2c41389ce9d5','csrss.exe',39,4196),(39830,'C-2c41389ce9d5','IPROSetMonitor.exe',1,2996),(39830,'C-2c41389ce9d5','wininit.exe',12,3144),(39830,'C-2c41389ce9d5','csrss.exe',305,53852),(39830,'C-2c41389ce9d5','services.exe',131,6240),(39830,'C-2c41389ce9d5','winlogon.exe',23,3968),(39830,'C-2c41389ce9d5','lsass.exe',198,8604),(39830,'C-2c41389ce9d5','mysqld.exe',12,11380),(39830,'C-2c41389ce9d5','lsm.exe',7,2796),(39830,'C-2c41389ce9d5','svchost.exe',185,6168),(39830,'C-2c41389ce9d5','svchost.exe',32,6172),(39830,'C-2c41389ce9d5','svchost.exe',87,13956),(39830,'C-2c41389ce9d5','hpwuschd2.exe',1,2484),(39830,'C-2c41389ce9d5','svchost.exe',1140,73360),(39830,'C-2c41389ce9d5','svchost.exe',3747,37724),(39830,'C-2c41389ce9d5','ntrtscan.exe',1060,16228),(39830,'C-2c41389ce9d5','svchost.exe',24,10436),(39830,'C-2c41389ce9d5','tntgrd.exe',293,12032),(39830,'C-2c41389ce9d5','hppfaxprintersrv.exe',10,4640),(39830,'C-2c41389ce9d5','tntuidsvc.exe',20,3072),(39830,'C-2c41389ce9d5','svchost.exe',163,19556),(39830,'C-2c41389ce9d5','svchost.exe',3,2632),(39830,'C-2c41389ce9d5','spoolsv.exe',29,9480),(39830,'C-2c41389ce9d5','svchost.exe',123,7840),(39830,'C-2c41389ce9d5','pccntmon.exe',15,4400),(39830,'C-2c41389ce9d5','igfxtray.exe',1,3896),(39830,'C-2c41389ce9d5','chrome.exe',238,74868),(39830,'C-2c41389ce9d5','hkcmd.exe',4,3792),(39830,'C-2c41389ce9d5','taskeng.exe',4,3780),(39830,'C-2c41389ce9d5','armsvc.exe',0,2736),(39830,'C-2c41389ce9d5','offSyncService.exe',0,3204),(39830,'C-2c41389ce9d5','HPLaserJetService.exe',84,6048),(39830,'C-2c41389ce9d5','svchost.exe',4,4764),(39830,'C-2c41389ce9d5','tntupdsvc.exe',3,5444),(39830,'C-2c41389ce9d5','TMBMSRV.exe',471,18960),(39830,'C-2c41389ce9d5','cntaosmgr.exe',0,3016),(39830,'C-2c41389ce9d5','tmlisten.exe',825,9152),(39830,'C-2c41389ce9d5','WmiPrvSE.exe',255,12560),(39830,'C-2c41389ce9d5','WmiPrvSE.exe',408,19316),(39830,'C-2c41389ce9d5','conhost.exe',0,2028),(39830,'C-2c41389ce9d5','SearchFilterHost.exe',4,4576),(39830,'C-2c41389ce9d5','A180WD.exe',1,8992),(39830,'C-2c41389ce9d5','audiodg.exe',10,16328),(39830,'C-2c41389ce9d5','SearchIndexer.exe',305,18140),(39830,'C-2c41389ce9d5','chrome.exe',931,95172),(39830,'C-2c41389ce9d5','SearchProtocolHost.exe',4,6420),(39830,'C-2c41389ce9d5','RtHDVCpl.exe',10,6084),(39830,'C-2c41389ce9d5','svchost.exe',1,3760),(39830,'C-2c41389ce9d5','OUTLOOK.EXE',703,62440),(39830,'C-2c41389ce9d5','Telerik.TestStudio.Feedback.Listener.exe',26,1980),(39830,'C-2c41389ce9d5','java.exe',165,32124),(39830,'C-2c41389ce9d5','notepad.exe',10,5424),(39830,'C-2c41389ce9d5','svchost.exe',1149,35536),(39830,'C-2c41389ce9d5','A180AG.exe',110,25228),(39830,'C-2c41389ce9d5','jusched.exe',4,6268),(39830,'C-2c41389ce9d5','igfxpers.exe',6,5624),(39830,'C-2c41389ce9d5','cmd.exe',3,2748),(39830,'C-2c41389ce9d5','dwm.exe',1099,50724),(39830,'C-2c41389ce9d5','taskhost.exe',9,6532),(39830,'C-2c41389ce9d5','HPTLBXFX.exe',121,23192),(39830,'C-2c41389ce9d5','taskeng.exe',1,4340),(39830,'C-2c41389ce9d5','explorer.exe',1074,51796),(39830,'C-2c41389ce9d5','GrooveMonitor.exe',3,6956),(39830,'C-2c41389ce9d5','StikyNot.exe',4,7036),(39830,'C-2c41389ce9d5','googletalk.exe',21,14068),(39830,'C-2c41389ce9d5','GoogleCrashHandler.exe',1,536),(39830,'C-2c41389ce9d5','svchost.exe',10,5020),(39830,'C-2c41389ce9d5','notepad.exe',7,5320),(39830,'C-2c41389ce9d5','Skype.exe',1840,164768),(39830,'C-2c41389ce9d5','PrivacyIconClient.exe',79,14804),(39830,'C-2c41389ce9d5','chrome.exe',226,48188),(39830,'C-2c41389ce9d5','UNS.exe',166,11044),(39830,'C-2c41389ce9d5','wuauclt.exe',3,5216),(39830,'C-2c41389ce9d5','conhost.exe',3,4512),(39830,'C-2c41389ce9d5','MySQLWorkbench.exe',907,100700),(39830,'C-2c41389ce9d5','LMS.exe',54,4664),(39830,'C-2c41389ce9d5','chrome.exe',386,59388),(39830,'C-2c41389ce9d5','tmproxy.exe',88,14984),(39830,'C-2c41389ce9d5','notepad.exe',65,4888),(39830,'C-2c41389ce9d5','putty.exe',23,7052),(39830,'C-2c41389ce9d5','A180CM.exe',37,19616),(39830,'C-2c4138a2481f','System Idle Process',371843,24),(39830,'C-2c4138a2481f','System',10492,18968),(39830,'C-2c4138a2481f','smss.exe',7,936),(39830,'C-2c4138a2481f','svchost.exe',6,10260),(39830,'C-2c4138a2481f','csrss.exe',46,4608),(39830,'C-2c4138a2481f','wininit.exe',6,9200),(39830,'C-2c4138a2481f','csrss.exe',104,22596),(39830,'C-2c4138a2481f','services.exe',101,10276),(39830,'C-2c4138a2481f','winlogon.exe',17,6156),(39830,'C-2c4138a2481f','lsass.exe',165,11444),(39830,'C-2c4138a2481f','lsm.exe',1,3744),(39830,'C-2c4138a2481f','svchost.exe',112,7976),(39830,'C-2c4138a2481f','svchost.exe',26,7800),(39830,'C-2c4138a2481f','A180CM.exe',49,20736),(39830,'C-2c4138a2481f','svchost.exe',42,18276),(39830,'C-2c4138a2481f','svchost.exe',1096,122252),(39830,'C-2c4138a2481f','svchost.exe',20,14912),(39830,'C-2c4138a2481f','svchost.exe',1179,43616),(39830,'C-2c4138a2481f','vbrusbservicews.exe',4,4824),(39830,'C-2c4138a2481f','A180WD.exe',0,4876),(39830,'C-2c4138a2481f','chrome.exe',196,47428),(39830,'C-2c4138a2481f','svchost.exe',198,31604),(39830,'C-2c4138a2481f','spoolsv.exe',10,12116),(39830,'C-2c4138a2481f','svchost.exe',49,10536),(39830,'C-2c4138a2481f','armsvc.exe',0,3592),(39830,'C-2c4138a2481f','IPROSetMonitor.exe',1,3964),(39830,'C-2c4138a2481f','svchost.exe',0,3904),(39830,'C-2c4138a2481f','taskhost.exe',3,7580),(39830,'C-2c4138a2481f','Ntrtscan.exe',1223,4824),(39830,'C-2c4138a2481f','dwm.exe',2127,53124),(39830,'C-2c4138a2481f','svchost.exe',0,3744),(39830,'C-2c4138a2481f','svchost.exe',0,2440),(39830,'C-2c4138a2481f','SeaPort.exe',12,6684),(39830,'C-2c4138a2481f','svchost.exe',4,6252),(39830,'C-2c4138a2481f','snmp.exe',51,7084),(39830,'C-2c4138a2481f','svchost.exe',0,5440),(39830,'C-2c4138a2481f','TeamViewer_Service.exe',15,9124),(39830,'C-2c4138a2481f','explorer.exe',176,37152),(39830,'C-2c4138a2481f','4zbarsvc.exe',1,2824),(39830,'C-2c4138a2481f','chrome.exe',500,73832),(39830,'C-2c4138a2481f','TmListen.exe',322,8304),(39830,'C-2c4138a2481f','SearchIndexer.exe',734,73892),(39830,'C-2c4138a2481f','igfxtray.exe',0,5908),(39830,'C-2c4138a2481f','hkcmd.exe',3,6024),(39830,'C-2c4138a2481f','igfxpers.exe',0,6616),(39830,'C-2c4138a2481f','StikyNot.exe',14,11548),(39830,'C-2c4138a2481f','Tomcat6w.exe',0,4576),(39830,'C-2c4138a2481f','A180AG.exe',104,27708),(39830,'C-2c4138a2481f','PccNtMon.exe',15,4780),(39830,'C-2c4138a2481f','svchost.exe',0,5520),(39830,'C-2c4138a2481f','svchost.exe',803,37124),(39830,'C-2c4138a2481f','chrome.exe',2544,75496),(39830,'C-2c4138a2481f','TmProxy.exe',106,22888),(39830,'C-2c4138a2481f','Skype.exe',1478,165468),(39830,'C-2c4138a2481f','mobsync.exe',1,10712),(39830,'C-2c4138a2481f','CNTAoSMgr.exe',0,4220),(39830,'C-2c4138a2481f','conhost.exe',1,3112),(39830,'C-2c4138a2481f','chrome.exe',1386,126928),(39830,'C-2c4138a2481f','chrome.exe',2425,56168),(39830,'C-2c4138a2481f','chrome.exe',1297,130536),(39830,'C-2c4138a2481f','TMBMSRV.exe',17,10040),(39830,'C-2c4138a2481f','taskeng.exe',1,6892),(39830,'C-2c4138a2481f','chrome.exe',307,58320),(39830,'C-00e01c3c16e4','init',96,1824),(39830,'C-00e01c3c16e4','kthreadd',25,0),(39830,'C-00e01c3c16e4','ksoftirqd/0',11857,0),(39830,'C-00e01c3c16e4','migration/0',0,0),(39830,'C-00e01c3c16e4','watchdog/0',995,0),(39830,'C-00e01c3c16e4','migration/1',0,0),(39830,'C-00e01c3c16e4','ksoftirqd/1',8999,0),(39830,'C-00e01c3c16e4','watchdog/1',924,0),(39830,'C-00e01c3c16e4','migration/2',0,0),(39830,'C-00e01c3c16e4','ksoftirqd/2',2254,0),(39830,'C-00e01c3c16e4','watchdog/2',870,0),(39830,'C-00e01c3c16e4','migration/3',0,0),(39830,'C-00e01c3c16e4','ksoftirqd/3',2794,0),(39830,'C-00e01c3c16e4','watchdog/3',863,0),(39830,'C-00e01c3c16e4','cpuset',0,0),(39830,'C-00e01c3c16e4','khelper',0,0),(39830,'C-00e01c3c16e4','kdevtmpfs',0,0),(39830,'C-00e01c3c16e4','netns',0,0),(39830,'C-00e01c3c16e4','sync_supers',704,0),(39830,'C-00e01c3c16e4','bdi-default',17,0),(39830,'C-00e01c3c16e4','kintegrityd',0,0),(39830,'C-00e01c3c16e4','kblockd',0,0),(39830,'C-00e01c3c16e4','ata_sff',0,0),(39830,'C-00e01c3c16e4','khubd',0,0),(39830,'C-00e01c3c16e4','md',0,0),(39830,'C-00e01c3c16e4','khungtaskd',122,0),(39830,'C-00e01c3c16e4','kswapd0',910,0),(39830,'C-00e01c3c16e4','ksmd',0,0),(39830,'C-00e01c3c16e4','khugepaged',0,0),(39830,'C-00e01c3c16e4','fsnotify_mark',0,0),(39830,'C-00e01c3c16e4','ecryptfs-kthrea',0,0),(39830,'C-00e01c3c16e4','crypto',0,0),(39830,'C-00e01c3c16e4','kthrotld',0,0),(39830,'C-00e01c3c16e4','scsi_eh_0',0,0),(39830,'C-00e01c3c16e4','scsi_eh_1',0,0),(39830,'C-00e01c3c16e4','scsi_eh_2',0,0),(39830,'C-00e01c3c16e4','scsi_eh_3',0,0),(39830,'C-00e01c3c16e4','kworker/u:3',0,0),(39830,'C-00e01c3c16e4','kworker/u:4',5730,0),(39830,'C-00e01c3c16e4','devfreq_wq',0,0),(39830,'C-00e01c3c16e4','jbd2/sda2-8',13118,0),(39830,'C-00e01c3c16e4','ext4-dio-unwrit',0,0),(39830,'C-00e01c3c16e4','upstart-udev-br',5,556),(39830,'C-00e01c3c16e4','udevd',3,696),(39830,'C-00e01c3c16e4','kworker/0:0',1474,0),(39830,'C-00e01c3c16e4','udevd',0,512),(39830,'C-00e01c3c16e4','udevd',0,400),(39830,'C-00e01c3c16e4','irq/42-mei',0,0),(39830,'C-00e01c3c16e4','kpsmoused',0,0),(39830,'C-00e01c3c16e4','hd-audio0',0,0),(39830,'C-00e01c3c16e4','upstart-socket-',0,392),(39830,'C-00e01c3c16e4','rsyslogd',14032,968),(39830,'C-00e01c3c16e4','dbus-daemon',7,860),(39830,'C-00e01c3c16e4','kdmflush',0,0),(39830,'C-00e01c3c16e4','kcryptd_io',0,0),(39830,'C-00e01c3c16e4','kcryptd',0,0),(39830,'C-00e01c3c16e4','sshd',0,916),(39830,'C-00e01c3c16e4','getty',0,504),(39830,'C-00e01c3c16e4','named',70,4716),(39830,'C-00e01c3c16e4','dovecot',0,568),(39830,'C-00e01c3c16e4','whoopsie',17643,406832),(39830,'C-00e01c3c16e4','acpid',0,428),(39830,'C-00e01c3c16e4','atd',1,136),(39830,'C-00e01c3c16e4','cron',299,564),(39830,'C-00e01c3c16e4','irqbalance',38313,524),(39830,'C-00e01c3c16e4','anvil',0,428),(39830,'C-00e01c3c16e4','log',0,452),(39830,'C-00e01c3c16e4','config',0,492),(39830,'C-00e01c3c16e4','snmpd',396368,2996),(39830,'C-00e01c3c16e4','console-kit-dae',9,2028),(39830,'C-00e01c3c16e4','polkitd',5,1536),(39830,'C-00e01c3c16e4','kvm-irqfd-clean',0,0),(39830,'C-00e01c3c16e4','flush-8:0',5421,0),(39830,'C-00e01c3c16e4','win4prod',0,644),(39830,'C-00e01c3c16e4','win4prod',93458,1980),(39830,'C-00e01c3c16e4','verdecmd',168970,3852),(39830,'C-00e01c3c16e4','verdempcd',15644,1628),(39830,'C-00e01c3c16e4','vbsmartd',28509,2056),(39830,'C-00e01c3c16e4','vbcacheio',39465,1704),(39830,'C-00e01c3c16e4','dhcpd',77,1120),(39830,'C-00e01c3c16e4','java',536951,987336),(39830,'C-00e01c3c16e4','verde-dbmond',31853,872),(39830,'C-00e01c3c16e4','java',166296,82416),(39830,'C-00e01c3c16e4','kworker/0:1',1102,0),(39830,'C-00e01c3c16e4','kworker/1:2',280,0),(39830,'C-00e01c3c16e4','kworker/2:1',243,0),(39830,'C-00e01c3c16e4','kworker/1:0',1395,0),(39830,'C-00e01c3c16e4','kworker/3:0',0,0),(39830,'C-00e01c3c16e4','kworker/3:1',1,0),(39830,'C-00e01c3c16e4','kworker/3:2',3084,0),(39830,'C-00e01c3c16e4','kworker/2:0',1267,0),(39830,'C-2c41389da7d6','System Idle Process',2234715,24),(39830,'C-2c41389da7d6','System',24404,936),(39830,'C-2c41389da7d6','smss.exe',21,976),(39830,'C-2c41389da7d6','csrss.exe',59,4276),(39830,'C-2c41389da7d6','wininit.exe',10,4404),(39830,'C-2c41389da7d6','csrss.exe',992,57372),(39830,'C-2c41389da7d6','firefox.exe',66472,312608),(39830,'C-2c41389da7d6','svchost.exe',15,10736),(39830,'C-2c41389da7d6','services.exe',113,8680),(39830,'C-2c41389da7d6','winlogon.exe',17,6044),(39830,'C-2c41389da7d6','lsass.exe',332,12312),(39830,'C-2c41389da7d6','lsm.exe',1,3940),(39830,'C-2c41389da7d6','svchost.exe',277,8544),(39830,'C-2c41389da7d6','svchost.exe',40,8160),(39830,'C-2c41389da7d6','svchost.exe',151,18916),(39830,'C-2c41389da7d6','svchost.exe',2912,124628),(39830,'C-2c41389da7d6','svchost.exe',2171,46068),(39830,'C-2c41389da7d6','vbrusbservicews.exe',6,5548),(39830,'C-2c41389da7d6','svchost.exe',265,33948),(39830,'C-2c41389da7d6','spoolsv.exe',35,14672),(39830,'C-2c41389da7d6','svchost.exe',49,11052),(39830,'C-2c41389da7d6','armsvc.exe',0,3644),(39830,'C-2c41389da7d6','offSyncService.exe',6,4208),(39830,'C-2c41389da7d6','HPLaserJetService.exe',209,6824),(39830,'C-2c41389da7d6','39barsvc.exe',0,2968),(39830,'C-2c41389da7d6','mysqld.exe',9,20896),(39830,'C-2c41389da7d6','svchost.exe',1,3348),(39830,'C-2c41389da7d6','chrome.exe',627,139884),(39830,'C-2c41389da7d6','ntrtscan.exe',1564,5736),(39830,'C-2c41389da7d6','tmlisten.exe',407,9152),(39830,'C-2c41389da7d6','svchost.exe',0,3316),(39830,'C-2c41389da7d6','c2c_service.exe',29,5652),(39830,'C-2c41389da7d6','snmp.exe',227,6676),(39830,'C-2c41389da7d6','svchost.exe',0,7156),(39830,'C-2c41389da7d6','MonServiceUDisk.exe',1,3912),(39830,'C-2c41389da7d6','LMS.exe',310,5468),(39830,'C-2c41389da7d6','cntaosmgr.exe',0,4008),(39830,'C-2c41389da7d6','UNS.exe',850,13324),(39830,'C-2c41389da7d6','chrome.exe',1152,83448),(39830,'C-2c41389da7d6','audiodg.exe',246,21592),(39830,'C-2c41389da7d6','svchost.exe',3,5060),(39830,'C-2c41389da7d6','svchost.exe',1179,41284),(39830,'C-2c41389da7d6','svchost.exe',28,18560),(39830,'C-2c41389da7d6','OptProReminder.exe',4,8792),(39830,'C-2c41389da7d6','EXCEL.EXE',88,28316),(39830,'C-2c41389da7d6','conhost.exe',0,2384),(39830,'C-2c41389da7d6','TMBMSRV.exe',15,9008),(39830,'C-2c41389da7d6','AppIntegrator64.exe',1,4924),(39830,'C-2c41389da7d6','Skype.exe',3644,166344),(39830,'C-2c41389da7d6','tmproxy.exe',196,18692),(39830,'C-2c41389da7d6','taskeng.exe',18,4968),(39830,'C-2c41389da7d6','OptProSmartScan.exe',0,6104),(39830,'C-2c41389da7d6','SearchIndexer.exe',2266,86328),(39830,'C-2c41389da7d6','WmiPrvSE.exe',7,8420),(39830,'C-2c41389da7d6','taskhost.exe',29,9172),(39830,'C-2c41389da7d6','pccntmon.exe',14,4860),(39830,'C-2c41389da7d6','jusched.exe',3,7792),(39830,'C-2c41389da7d6','hpwuschd2.exe',1,3640),(39830,'C-2c41389da7d6','dwm.exe',11665,62500),(39830,'C-2c41389da7d6','HPTLBXFX.exe',152,28008),(39830,'C-2c41389da7d6','39brmon.exe',0,3800),(39830,'C-2c41389da7d6','explorer.exe',1057,53352),(39830,'C-2c41389da7d6','RAVCpl64.exe',7,10124),(39830,'C-2c41389da7d6','igfxtray.exe',1,5984),(39830,'C-2c41389da7d6','hkcmd.exe',1,5736),(39830,'C-2c41389da7d6','notepad.exe',7,7720),(39830,'C-2c41389da7d6','igfxpers.exe',3,8352),(39830,'C-2c41389da7d6','SearchProtocolHost.exe',817,7088),(39830,'C-2c41389da7d6','chrome.exe',5971,137468),(39830,'C-2c41389da7d6','chrome.exe',341,39716),(39830,'C-2c41389da7d6','chrome.exe',132,31952),(39830,'C-2c41389da7d6','FlashPlayerPlugin_11_9_900_117.exe',10,10408),(39830,'C-2c41389da7d6','chrome.exe',226,43268),(39830,'C-2c41389da7d6','PrivacyIconClient.exe',195,21120),(39830,'C-2c41389da7d6','eclipse.exe',15144,447456),(39830,'C-2c41389da7d6','wuauclt.exe',1,6556),(39830,'C-2c41389da7d6','chrome.exe',491,37556),(39830,'C-2c41389da7d6','FlashPlayerPlugin_11_9_900_117.exe',109,19768),(39830,'C-2c41389da7d6','chrome.exe',3432,85844),(39830,'C-2c41389da7d6','MySQLWorkbench.exe',1744,120940),(39830,'C-2c41389da7d6','notepad.exe',49,7748),(39830,'C-2c41389da7d6','plugin-container.exe',87,16028),(39830,'C-3859f9e5d21a','System Idle Process',2105642,24),(39830,'C-3859f9e5d21a','System',6046,3264),(39830,'C-3859f9e5d21a','smss.exe',6,800),(39830,'C-3859f9e5d21a','svchost.exe',257,9572),(39830,'C-3859f9e5d21a','avgrsx.exe',1989,39288),(39830,'C-3859f9e5d21a','avgcsrvx.exe',1190,77020),(39830,'C-3859f9e5d21a','csrss.exe',65,3464),(39830,'C-3859f9e5d21a','wininit.exe',9,3736),(39830,'C-3859f9e5d21a','csrss.exe',673,44964),(39830,'C-3859f9e5d21a','services.exe',485,7828),(39830,'C-3859f9e5d21a','lsass.exe',390,8840),(39830,'C-3859f9e5d21a','avgidsagent.exe',1588,10804),(39830,'C-3859f9e5d21a','lsm.exe',14,4172),(39830,'C-3859f9e5d21a','svchost.exe',1235,6900),(39830,'C-3859f9e5d21a','ibmpmsvc.exe',3,2956),(39830,'C-3859f9e5d21a','svchost.exe',129,7112),(39830,'C-3859f9e5d21a','svchost.exe',405,16488),(39830,'C-3859f9e5d21a','svchost.exe',3461,63492),(39830,'C-3859f9e5d21a','svchost.exe',407,14668),(39830,'C-3859f9e5d21a','avgwdsvc.exe',950,20164),(39830,'C-3859f9e5d21a','svchost.exe',625,26408),(39830,'C-3859f9e5d21a','notepad++.exe',104,16516),(39830,'C-3859f9e5d21a','avgcsrvx.exe',15,19348),(39830,'C-3859f9e5d21a','CxAudMsg32.exe',3,3616),(39830,'C-3859f9e5d21a','WUDFHost.exe',4,4488),(39830,'C-3859f9e5d21a','vbrusbservicews.exe',4,4044),(39830,'C-3859f9e5d21a','winlogon.exe',28,5144),(39830,'C-3859f9e5d21a','ZipSendService.exe',1,3752),(39830,'C-3859f9e5d21a','svchost.exe',1046,14972),(39830,'C-3859f9e5d21a','HWDeviceService.exe',528,4492),(39830,'C-3859f9e5d21a','TPONSCR.exe',24,5180),(39830,'C-3859f9e5d21a','spoolsv.exe',42,12720),(39830,'C-3859f9e5d21a','mysqld.exe',18,19728),(39830,'C-3859f9e5d21a','svchost.exe',0,2724),(39830,'C-3859f9e5d21a','dwm.exe',2344,42548),(39830,'C-3859f9e5d21a','svchost.exe',1,2636),(39830,'C-3859f9e5d21a','pycron.exe',28,5860),(39830,'C-3859f9e5d21a','ouc.exe',6,3992),(39830,'C-3859f9e5d21a','svchost.exe',0,2012),(39830,'C-3859f9e5d21a','tpnumlkd.exe',24,5436),(39830,'C-3859f9e5d21a','SASrv.exe',1,2944),(39830,'C-3859f9e5d21a','snmp.exe',2226,6300),(39830,'C-3859f9e5d21a','snmptrap.exe',1,3032),(39830,'C-3859f9e5d21a','svchost.exe',1,4016),(39830,'C-3859f9e5d21a','TeamViewer_Service.exe',15,10340),(39830,'C-3859f9e5d21a','unsecapp.exe',3,3404),(39830,'C-3859f9e5d21a','explorer.exe',2962,45096),(39830,'C-3859f9e5d21a','TPHKSVC.exe',9,4996),(39830,'C-3859f9e5d21a','MonServiceUDisk.exe',4,3548),(39830,'C-3859f9e5d21a','ToolbarUpdater.exe',6,5620),(39830,'C-3859f9e5d21a','mkrmsg.exe',6,4372),(39830,'C-3859f9e5d21a','loggingserver.exe',23,3268),(39830,'C-3859f9e5d21a','conhost.exe',1,2384),(39830,'C-3859f9e5d21a','tphkload.exe',14,6708),(39830,'C-3859f9e5d21a','rundll32.exe',3,3492),(39830,'C-3859f9e5d21a','micmute.exe',7,5456),(39830,'C-3859f9e5d21a','shtctky.exe',6,5204),(39830,'C-3859f9e5d21a','svchost.exe',1,3740),(39830,'C-3859f9e5d21a','svchost.exe',20,4276),(39830,'C-3859f9e5d21a','WmiPrvSE.exe',29,5276),(39830,'C-3859f9e5d21a','SearchFilterHost.exe',6,4004),(39830,'C-3859f9e5d21a','rundll32.exe',3,4952),(39830,'C-3859f9e5d21a','taskhost.exe',48,10780),(39830,'C-3859f9e5d21a','DCSHelper.exe',1,5256),(39830,'C-3859f9e5d21a','avgnsx.exe',308,11268),(39830,'C-3859f9e5d21a','avgemcx.exe',93,9700),(39830,'C-3859f9e5d21a','hkcmd.exe',4,4336),(39830,'C-3859f9e5d21a','igfxpers.exe',4,4948),(39830,'C-3859f9e5d21a','GrooveMonitor.exe',15,7764),(39830,'C-3859f9e5d21a','fmapp.exe',9,2332),(39830,'C-3859f9e5d21a','jusched.exe',4,6752),(39830,'C-3859f9e5d21a','vprot.exe',2903,22288),(39830,'C-3859f9e5d21a','avgui.exe',553,35832),(39830,'C-3859f9e5d21a','DivXUpdate.exe',561,13452),(39830,'C-3859f9e5d21a','Skype.exe',17536,104500),(39830,'C-3859f9e5d21a','svchost.exe',68,4368),(39830,'C-3859f9e5d21a','googletalk.exe',121,24124),(39830,'C-3859f9e5d21a','SearchProtocolHost.exe',173,5004),(39830,'C-3859f9e5d21a','wweb32.exe',88,4664),(39830,'C-3859f9e5d21a','SearchIndexer.exe',1299,39228),(39830,'C-3859f9e5d21a','Ymsgr_tray.exe',6,5768),(39830,'C-3859f9e5d21a','eclipse.exe',16584,326896),(39830,'C-3859f9e5d21a','wmpnetwk.exe',56,3008),(39830,'C-3859f9e5d21a','OUTLOOK.EXE',2876,145756),(39830,'C-8c89a539be66','init',59,632),(39830,'C-8c89a539be66','migration/0',1,0),(39830,'C-8c89a539be66','ksoftirqd/0',0,0),(39830,'C-8c89a539be66','watchdog/0',0,0),(39830,'C-8c89a539be66','migration/1',1,0),(39830,'C-8c89a539be66','ksoftirqd/1',89,0),(39830,'C-8c89a539be66','watchdog/1',0,0),(39830,'C-8c89a539be66','migration/2',1,0),(39830,'C-8c89a539be66','ksoftirqd/2',0,0),(39830,'C-8c89a539be66','watchdog/2',0,0),(39830,'C-8c89a539be66','migration/3',1,0),(39830,'C-8c89a539be66','ksoftirqd/3',0,0),(39830,'C-8c89a539be66','watchdog/3',0,0),(39830,'C-8c89a539be66','events/0',0,0),(39830,'C-8c89a539be66','events/1',0,0),(39830,'C-8c89a539be66','events/2',0,0),(39830,'C-8c89a539be66','events/3',0,0),(39830,'C-8c89a539be66','khelper',0,0),(39830,'C-8c89a539be66','kthread',0,0),(39830,'C-8c89a539be66','kblockd/0',0,0),(39830,'C-8c89a539be66','kblockd/1',0,0),(39830,'C-8c89a539be66','kblockd/2',6,0),(39830,'C-8c89a539be66','kblockd/3',0,0),(39830,'C-8c89a539be66','kacpid',0,0),(39830,'C-8c89a539be66','cqueue/0',0,0),(39830,'C-8c89a539be66','cqueue/1',0,0),(39830,'C-8c89a539be66','cqueue/2',0,0),(39830,'C-8c89a539be66','cqueue/3',0,0),(39830,'C-8c89a539be66','khubd',0,0),(39830,'C-8c89a539be66','kseriod',0,0),(39830,'C-8c89a539be66','khungtaskd',0,0),(39830,'C-8c89a539be66','pdflush',0,0),(39830,'C-8c89a539be66','pdflush',4,0),(39830,'C-8c89a539be66','kswapd0',0,0),(39830,'C-8c89a539be66','aio/0',0,0),(39830,'C-8c89a539be66','aio/1',0,0),(39830,'C-8c89a539be66','aio/2',0,0),(39830,'C-8c89a539be66','aio/3',0,0),(39830,'C-8c89a539be66','kpsmoused',0,0),(39830,'C-8c89a539be66','ata/0',0,0),(39830,'C-8c89a539be66','ata/1',0,0),(39830,'C-8c89a539be66','ata/2',0,0),(39830,'C-8c89a539be66','ata/3',0,0),(39830,'C-8c89a539be66','ata_aux',0,0),(39830,'C-8c89a539be66','scsi_eh_0',0,0),(39830,'C-8c89a539be66','scsi_eh_1',1087,0),(39830,'C-8c89a539be66','scsi_eh_2',0,0),(39830,'C-8c89a539be66','scsi_eh_3',0,0),(39830,'C-8c89a539be66','scsi_eh_4',0,0),(39830,'C-8c89a539be66','usb-storage',513,0),(39830,'C-8c89a539be66','kstriped',0,0),(39830,'C-8c89a539be66','kjournald',211,0),(39830,'C-8c89a539be66','kauditd',4,0),(39830,'C-8c89a539be66','udevd',3,928),(39830,'C-8c89a539be66','kmpathd/0',0,0),(39830,'C-8c89a539be66','kmpathd/1',0,0),(39830,'C-8c89a539be66','kmpathd/2',0,0),(39830,'C-8c89a539be66','kmpathd/3',0,0),(39830,'C-8c89a539be66','kmpath_handlerd',0,0),(39830,'C-8c89a539be66','kjournald',0,0),(39830,'C-8c89a539be66','dhclient',0,716),(39830,'C-8c89a539be66','auditd',136,768),(39830,'C-8c89a539be66','audispd',6,732),(39830,'C-8c89a539be66','vs-helper',2267,3680),(39830,'C-8c89a539be66','syslogd',251,696),(39830,'C-8c89a539be66','klogd',0,404),(39830,'C-8c89a539be66','vs-pushuser',0,152),(39830,'C-8c89a539be66','kondemand/0',0,0),(39830,'C-8c89a539be66','kondemand/1',0,0),(39830,'C-8c89a539be66','kondemand/2',0,0),(39830,'C-8c89a539be66','kondemand/3',0,0),(39830,'C-8c89a539be66','irqbalance',0,368),(39830,'C-8c89a539be66','portmap',0,552),(39830,'C-8c89a539be66','rpciod/0',0,0),(39830,'C-8c89a539be66','rpciod/1',0,0),(39830,'C-8c89a539be66','rpciod/2',0,0),(39830,'C-8c89a539be66','rpciod/3',0,0),(39830,'C-8c89a539be66','rpc.statd',0,832),(39830,'C-8c89a539be66','rpc.idmapd',0,644),(39830,'C-8c89a539be66','dbus-daemon',132,940),(39830,'C-8c89a539be66','pcscd',6,1292),(39830,'C-8c89a539be66','acpid',0,528),(39830,'C-8c89a539be66','hald',73,3744),(39830,'C-8c89a539be66','hald-runner',0,988),(39830,'C-8c89a539be66','hald-addon-acpi',0,808),(39830,'C-8c89a539be66','hald-addon-stor',1124,644),(39830,'C-8c89a539be66','hald-addon-stor',283,644),(39830,'C-8c89a539be66','hidd',0,460),(39830,'C-8c89a539be66','automount',0,1368),(39830,'C-8c89a539be66','snmpd',6333,8020),(39830,'C-8c89a539be66','sshd',27,1068),(39830,'C-8c89a539be66','mysqld_safe',0,1216),(39830,'C-8c89a539be66','mysqld',9911,36000),(39830,'C-8c89a539be66','gpm',0,372),(39830,'C-8c89a539be66','httpd',126,40244),(39830,'C-8c89a539be66','crond',12,1108),(39830,'C-8c89a539be66','xfs',0,1480),(39830,'C-8c89a539be66','atd',0,432),(39830,'C-8c89a539be66','avahi-daemon',23,1308),(39830,'C-8c89a539be66','avahi-daemon',0,316),(39830,'C-8c89a539be66','smartd',0,512),(39830,'C-8c89a539be66','mingetty',0,448),(39830,'C-8c89a539be66','mingetty',0,424),(39830,'C-8c89a539be66','mingetty',0,428),(39830,'C-8c89a539be66','yum-updatesd',580,11512),(39830,'C-8c89a539be66','gam_server',0,1132),(39830,'C-8c89a539be66','java',8553,184416),(39830,'C-8c89a539be66','httpd',0,38256),(39830,'C-8c89a539be66','httpd',0,37500),(39830,'C-8c89a539be66','httpd',0,37356),(39830,'C-8c89a539be66','httpd',0,38240),(39830,'C-1078d2cfb13c','init',19481,1372),(39830,'C-1078d2cfb13c','kthreadd',14,0),(39830,'C-1078d2cfb13c','migration/0',69,0),(39830,'C-1078d2cfb13c','ksoftirqd/0',0,0),(39830,'C-1078d2cfb13c','watchdog/0',0,0),(39830,'C-1078d2cfb13c','migration/1',68,0),(39830,'C-1078d2cfb13c','ksoftirqd/1',16,0),(39830,'C-1078d2cfb13c','watchdog/1',0,0),(39830,'C-1078d2cfb13c','migration/2',117,0),(39830,'C-1078d2cfb13c','ksoftirqd/2',7,0),(39830,'C-1078d2cfb13c','watchdog/2',0,0),(39830,'C-1078d2cfb13c','migration/3',98,0),(39830,'C-1078d2cfb13c','ksoftirqd/3',55,0),(39830,'C-1078d2cfb13c','watchdog/3',0,0),(39830,'C-1078d2cfb13c','events/0',46,0),(39830,'C-1078d2cfb13c','events/1',6228,0),(39830,'C-1078d2cfb13c','events/2',162206,0),(39830,'C-1078d2cfb13c','events/3',4587,0),(39830,'C-1078d2cfb13c','cpuset',0,0),(39830,'C-1078d2cfb13c','khelper',0,0),(39830,'C-1078d2cfb13c','netns',0,0),(39830,'C-1078d2cfb13c','async/mgr',0,0),(39830,'C-1078d2cfb13c','pm',0,0),(39830,'C-1078d2cfb13c','sync_supers',22,0),(39830,'C-1078d2cfb13c','bdi-default',406,0),(39830,'C-1078d2cfb13c','kintegrityd/0',0,0),(39830,'C-1078d2cfb13c','kintegrityd/1',0,0),(39830,'C-1078d2cfb13c','kintegrityd/2',0,0),(39830,'C-1078d2cfb13c','kintegrityd/3',0,0),(39830,'C-1078d2cfb13c','kblockd/0',301,0),(39830,'C-1078d2cfb13c','kblockd/1',1625,0),(39830,'C-1078d2cfb13c','kblockd/2',650,0),(39830,'C-1078d2cfb13c','kblockd/3',402,0),(39830,'C-1078d2cfb13c','kacpid',0,0),(39830,'C-1078d2cfb13c','kacpi_notify',0,0),(39830,'C-1078d2cfb13c','kacpi_hotplug',0,0),(39830,'C-1078d2cfb13c','ata/0',8151,0),(39830,'C-1078d2cfb13c','ata/1',7124,0),(39830,'C-1078d2cfb13c','ata/2',14,0),(39830,'C-1078d2cfb13c','ata/3',26,0),(39830,'C-1078d2cfb13c','ata_aux',0,0),(39830,'C-1078d2cfb13c','ksuspend_usbd',0,0),(39830,'C-1078d2cfb13c','khubd',0,0),(39830,'C-1078d2cfb13c','kseriod',0,0),(39830,'C-1078d2cfb13c','khungtaskd',15,0),(39830,'C-1078d2cfb13c','kswapd0',2167,0),(39830,'C-1078d2cfb13c','ksmd',0,0),(39830,'C-1078d2cfb13c','khugepaged',2564,0),(39830,'C-1078d2cfb13c','aio/0',0,0),(39830,'C-1078d2cfb13c','aio/1',0,0),(39830,'C-1078d2cfb13c','aio/2',0,0),(39830,'C-1078d2cfb13c','aio/3',0,0),(39830,'C-1078d2cfb13c','crypto/0',0,0),(39830,'C-1078d2cfb13c','crypto/1',0,0),(39830,'C-1078d2cfb13c','crypto/2',0,0),(39830,'C-1078d2cfb13c','crypto/3',0,0),(39830,'C-1078d2cfb13c','kpsmoused',0,0),(39830,'C-1078d2cfb13c','usbhid_resumer',0,0),(39830,'C-1078d2cfb13c','kstriped',0,0),(39830,'C-1078d2cfb13c','i915',82,0),(39830,'C-1078d2cfb13c','kslowd000',1,0),(39830,'C-1078d2cfb13c','kslowd001',0,0),(39830,'C-1078d2cfb13c','scsi_eh_0',0,0),(39830,'C-1078d2cfb13c','scsi_eh_1',33363,0),(39830,'C-1078d2cfb13c','scsi_eh_2',0,0),(39830,'C-1078d2cfb13c','scsi_eh_3',0,0),(39830,'C-1078d2cfb13c','jbd2/sda6-8',6747,0),(39830,'C-1078d2cfb13c','ext4-dio-unwrit',0,0),(39830,'C-1078d2cfb13c','kauditd',170,0),(39830,'C-1078d2cfb13c','flush-8:0',2103,0),(39830,'C-1078d2cfb13c','udevd',7,1308),(39830,'C-1078d2cfb13c','hd-audio0',0,0),(39830,'C-1078d2cfb13c','jbd2/sda1-8',0,0),(39830,'C-1078d2cfb13c','jbd2/sda3-8',126,0),(39830,'C-1078d2cfb13c','jbd2/sda2-8',6346,0),(39830,'C-1078d2cfb13c','jbd2/sdb5-8',256,0),(39830,'C-1078d2cfb13c','rsyslogd',2113,3580),(39830,'C-1078d2cfb13c','kondemand/0',135,0),(39830,'C-1078d2cfb13c','kondemand/1',4438,0),(39830,'C-1078d2cfb13c','kondemand/2',9959,0),(39830,'C-1078d2cfb13c','kondemand/3',397,0),(39830,'C-1078d2cfb13c','irqbalance',39213,444),(39830,'C-1078d2cfb13c','rpcbind',203,824),(39830,'C-1078d2cfb13c','rpc.statd',3,1096),(39830,'C-1078d2cfb13c','mdadm',829,252),(39830,'C-1078d2cfb13c','rpciod/0',0,0),(39830,'C-1078d2cfb13c','rpciod/1',0,0),(39830,'C-1078d2cfb13c','rpciod/2',0,0),(39830,'C-1078d2cfb13c','rpciod/3',0,0),(39830,'C-1078d2cfb13c','rpc.idmapd',0,460),(39830,'C-1078d2cfb13c','dbus-daemon',3258,2072),(39830,'C-1078d2cfb13c','avahi-daemon',485,1616),(39830,'C-1078d2cfb13c','avahi-daemon',0,368),(39830,'C-1078d2cfb13c','cupsd',1305,3264),(39830,'C-1078d2cfb13c','acpid',0,612),(39830,'C-1078d2cfb13c','hald',1097,2504),(39830,'C-1078d2cfb13c','hald-runner',0,1148),(39830,'C-1078d2cfb13c','hald-addon-inpu',1,1064),(39830,'C-1078d2cfb13c','hald-addon-acpi',0,1020),(39830,'C-1078d2cfb13c','pcscd',3,1448),(39830,'C-1078d2cfb13c','snmpd',1712436,6636),(39830,'C-1078d2cfb13c','sshd',5688,1348),(39830,'C-1078d2cfb13c','xinetd',1,852),(39830,'C-1078d2cfb13c','master',5183,2748),(39830,'C-1078d2cfb13c','qmgr',4640,2900),(39830,'C-1078d2cfb13c','abrtd',2482,5272),(39830,'C-1078d2cfb13c','httpd',4332,9992),(39830,'C-1078d2cfb13c','crond',6257,1372),(39830,'C-1078d2cfb13c','smbd',1937,3296),(39830,'C-1078d2cfb13c','smbd',0,1716),(39830,'C-1078d2cfb13c','atd',67,344),(39830,'C-1078d2cfb13c','nagios',109090,3144),(39830,'C-1078d2cfb13c','gdm-binary',382,1956),(39830,'C-1078d2cfb13c','mingetty',0,532),(39830,'C-1078d2cfb13c','mingetty',0,536),(39830,'C-1078d2cfb13c','udevd',0,2580),(39830,'C-1078d2cfb13c','gdm-simple-slav',3,3096),(39830,'C-1078d2cfb13c','Xorg',29747,23436),(39830,'C-1078d2cfb13c','console-kit-dae',844,3232),(39830,'C-1078d2cfb13c','dbus-launch',0,652),(39830,'C-1078d2cfb13c','devkit-power-da',414,2320),(39830,'C-1078d2cfb13c','polkitd',585,4328),(39830,'C-1078d2cfb13c','rtkit-daemon',2123,1180),(39830,'C-1078d2cfb13c','gdm-session-wor',8,3136),(39830,'C-1078d2cfb13c','auditd',1330,916),(39830,'C-1078d2cfb13c','udevd',1,1852),(39830,'C-1078d2cfb13c','vsftpd',3,756),(39830,'C-1078d2cfb13c','pickup',3,2820),(39830,'C-1078d2cfb13c','httpd',5,6068),(39830,'C-1078d2cfb13c','httpd',5,6072),(39830,'C-1078d2cfb13c','httpd',5,6112),(39830,'C-1078d2cfb13c','httpd',3,6112),(39830,'C-1078d2cfb13c','gnome-keyring-d',3,3104),(39830,'C-1078d2cfb13c','gnome-session',238,6240),(39830,'C-1078d2cfb13c','dbus-launch',0,648),(39830,'C-1078d2cfb13c','dbus-daemon',347,1588),(39830,'C-1078d2cfb13c','gconfd-2',1769,5492),(39830,'C-1078d2cfb13c','gnome-settings-',26718,23688),(39830,'C-1078d2cfb13c','seahorse-daemon',136,7456),(39830,'C-1078d2cfb13c','gvfsd',1,1976),(39830,'C-1078d2cfb13c','metacity',658,10368),(39830,'C-1078d2cfb13c','pulseaudio',10,4024),(39830,'C-1078d2cfb13c','gnome-panel',8275,11868),(39830,'C-1078d2cfb13c','nautilus',83,16912),(39830,'C-1078d2cfb13c','bonobo-activati',3,3144),(39830,'C-1078d2cfb13c','gconf-helper',0,2408),(39830,'C-1078d2cfb13c','wnck-applet',40,11004),(39830,'C-1078d2cfb13c','trashapplet',3,8620),(39830,'C-1078d2cfb13c','gvfs-gdu-volume',864,3072),(39830,'C-1078d2cfb13c','bluetooth-apple',170,7788),(39830,'C-1078d2cfb13c','gvfsd-trash',0,2740),(39830,'C-1078d2cfb13c','polkit-gnome-au',0,5264),(39830,'C-1078d2cfb13c','gnome-volume-co',4,10340),(39830,'C-1078d2cfb13c','gdu-notificatio',564,6540),(39830,'C-1078d2cfb13c','gnome-power-man',2972,9224),(39830,'C-1078d2cfb13c','gpk-update-icon',846,10372),(39830,'C-1078d2cfb13c','udisks-daemon',17325,2812),(39830,'C-1078d2cfb13c','restorecond',5,4632),(39830,'C-1078d2cfb13c','udisks-daemon',32233,604),(39830,'C-1078d2cfb13c','gvfs-afc-volume',5492,1900),(39830,'C-1078d2cfb13c','gnome-screensav',9165,5796),(39830,'C-1078d2cfb13c','gvfs-gphoto2-vo',0,1996),(39830,'C-1078d2cfb13c','gnote',7,11808),(39830,'C-1078d2cfb13c','clock-applet',4883,11712),(39830,'C-1078d2cfb13c','notification-ar',32,7184),(39830,'C-1078d2cfb13c','gdm-user-switch',7,10268),(39830,'C-1078d2cfb13c','gvfsd-burn',0,2036),(39830,'C-1078d2cfb13c','gnome-terminal',21,11804),(39830,'C-1078d2cfb13c','gnome-pty-helpe',0,672),(39830,'C-1078d2cfb13c','bash',0,1772),(39830,'C-1078d2cfb13c','ssh',1,3500),(39830,'C-1078d2cfb13c','run-mozilla.sh',1,1308),(39830,'C-1078d2cfb13c','firefox',36172,90208),(39830,'C-000c29ee7a6b','System Idle Process',719856587,28),(39830,'C-000c29ee7a6b','System',20628,252),(39830,'C-000c29ee7a6b','mmc.exe',51,2028),(39830,'C-000c29ee7a6b','snmp.exe',30215,5108),(39830,'C-000c29ee7a6b','smss.exe',3,464),(39830,'C-000c29ee7a6b','csrss.exe',148,3300),(39830,'C-000c29ee7a6b','winlogon.exe',5817,18028),(39830,'C-000c29ee7a6b','VMwareTray.exe',42,7344),(39830,'C-000c29ee7a6b','services.exe',33254,101692),(39830,'C-000c29ee7a6b','lsass.exe',180726,35708),(39830,'C-000c29ee7a6b','vmacthlp.exe',1,2384),(39830,'C-000c29ee7a6b','svchost.exe',6,2988),(39830,'C-000c29ee7a6b','explorer.exe',621,3012),(39830,'C-000c29ee7a6b','svchost.exe',604,3848),(39830,'C-000c29ee7a6b','jusched.exe',15,348),(39830,'C-000c29ee7a6b','vbrusbservicews.exe',53,2716),(39830,'C-000c29ee7a6b','svchost.exe',759,5660),(39830,'C-000c29ee7a6b','svchost.exe',78,4872),(39830,'C-000c29ee7a6b','svchost.exe',112807,18204),(39830,'C-000c29ee7a6b','snmptrap.exe',4,1916),(39830,'C-000c29ee7a6b','spoolsv.exe',46,5752),(39830,'C-000c29ee7a6b','msdtc.exe',26,4156),(39830,'C-000c29ee7a6b','certsrv.exe',268,9656),(39830,'C-000c29ee7a6b','dfssvc.exe',426,5396),(39830,'C-000c29ee7a6b','svchost.exe',1,1956),(39830,'C-000c29ee7a6b','ismserv.exe',4,3440),(39830,'C-000c29ee7a6b','jqs.exe',54892,1416),(39830,'C-000c29ee7a6b','ntfrs.exe',271,972),(39830,'C-000c29ee7a6b','svchost.exe',20,1996),(39830,'C-000c29ee7a6b','vmtoolsd.exe',775,77912),(39830,'C-000c29ee7a6b','logon.scr',1,1548),(39830,'C-000c29ee7a6b','vmtoolsd.exe',970,7172),(39830,'C-000c29ee7a6b','svchost.exe',21,4520),(39830,'C-000c29ee7a6b','dllhost.exe',115,7016),(39830,'C-000c29ee7a6b','wmiprvse.exe',9,4876),(39830,'C-000c29ee7a6b','MagicDisc.exe',7,148),(39830,'C-000c29ee7a6b','csrss.exe',346,3160),(39830,'C-000c29ee7a6b','svchost.exe',6,6192),(39830,'C-000c29ee7a6b','winlogon.exe',1335,2872),(39830,'C-000c29ee7a6b','inetinfo.exe',40,10324),(39830,'C-000c29ee7a6b','rdpclip.exe',3,772);
/*!40000 ALTER TABLE `comp_proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_snpsht`
--

DROP TABLE IF EXISTS `comp_snpsht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comp_snpsht` (
  `run_id` bigint(20) NOT NULL,
  `asset_id` char(30) NOT NULL,
  `ip_addr` char(15) default NULL,
  `os_id` char(20) default NULL,
  `tot_mem` bigint(20) default NULL,
  `used_mem` bigint(20) default NULL,
  `tot_v_mem` bigint(20) default NULL,
  `used_v_mem` bigint(20) default NULL,
  `tot_disk_space` bigint(20) default NULL,
  `used_disk_space` bigint(20) default NULL,
  `cpu_load` smallint(6) NOT NULL,
  `up_time` bigint(20) default NULL,
  `num_lgd_in_usrs` smallint(6) default NULL,
  `num_procs` smallint(6) default NULL,
  `ntwrk_bytes_in` bigint(20) default NULL,
  `ntwrk_bytes_out` bigint(20) default NULL,
  `clock_speed` double default NULL,
  `extras` varchar(200) default NULL,
  PRIMARY KEY  (`run_id`,`asset_id`),
  KEY `fk18_idx` (`run_id`),
  KEY `fk15_idx` (`run_id`,`asset_id`),
  KEY `fk94_idx` (`asset_id`),
  KEY `fk17_idx` (`os_id`),
  KEY `fk62_idx` (`asset_id`),
  KEY `fk63_idx` (`run_id`),
  KEY `fk43_idx` (`run_id`),
  KEY `fk71_idx` (`run_id`),
  KEY `fk71_idx1` (`run_id`),
  CONSTRAINT `fk62` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk71` FOREIGN KEY (`run_id`) REFERENCES `meter_run` (`run_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk94` FOREIGN KEY (`os_id`) REFERENCES `os_type` (`os_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_snpsht`
--

LOCK TABLES `comp_snpsht` WRITE;
/*!40000 ALTER TABLE `comp_snpsht` DISABLE KEYS */;
INSERT INTO `comp_snpsht` VALUES (39830,'C-000c29ee7a6b','192.168.1.33','windows',4294115328,572194816,6261964800,353370112,168092753920,8193646592,0,2992888,2,41,1016275287,801555235,0,NULL),(39830,'C-00e01c3c16e4','192.168.1.80','linux',3938299904,3219152896,999288832,181092352,499570987008,79165792256,1,3603621,0,96,1754359752,1485175085,0,NULL),(39830,'C-1078d2cfb13c','192.168.1.125','linux',8045408256,7759581184,4718583808,0,470542442496,354560753664,1,3603407,2,199,3251707104,549847248,0,NULL),(39830,'C-2c41389ce9d5','192.168.8.207','windows',3399483392,1668153344,6797197312,2137063424,506798071808,39726632960,3,1005,3,86,27047949,1738501,0,NULL),(39830,'C-2c41389da7d6','192.168.8.206','windows',4177526784,2999844864,8353218560,3686727680,508220923904,43839987712,0,5998,3,82,24762443,6298063,0,NULL),(39830,'C-2c4138a2481f','192.168.8.208','windows',3399483392,1768161280,6797066240,2068250624,506797940736,76196958208,6,990,2,63,8421515,1266912,0,NULL),(39830,'C-3859f9e5d21a','192.168.8.209','windows',3130195968,1630666752,6258688000,1853882368,504790503424,146190135296,2,5471,2,84,168039,84347,0,NULL),(39830,'C-8c89a539be66','192.168.8.15','linux',4088987648,1241141248,2146787328,0,484508346368,36837321728,1,263895,0,118,115739916,97464658,0,NULL);
/*!40000 ALTER TABLE `comp_snpsht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_type`
--

DROP TABLE IF EXISTS `comp_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comp_type` (
  `type_id` char(20) NOT NULL,
  `descr` varchar(30) NOT NULL,
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Laptop, PC, thin client';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_type`
--

LOCK TABLES `comp_type` WRITE;
/*!40000 ALTER TABLE `comp_type` DISABLE KEYS */;
INSERT INTO `comp_type` VALUES ('desktop','Desktop'),('laptop','Laptop'),('server','Server'),('tablet','Tablet'),('thinclnt','Thin Client');
/*!40000 ALTER TABLE `comp_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_ctlg`
--

DROP TABLE IF EXISTS `dev_ctlg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dev_ctlg` (
  `ctlg_id` char(20) NOT NULL,
  `protocol_id` char(10) NOT NULL,
  `type_id` char(20) default NULL,
  `descr` varchar(40) NOT NULL,
  `idle_threshold` smallint(6) NOT NULL,
  `load_threshold` smallint(6) NOT NULL,
  `idle_watt` double NOT NULL,
  `load_watt` double NOT NULL,
  `en_per_min_load` double default NULL COMMENT 'energy consumption per minute - related only for switch and printer..( it is static value calculated by running the switch and with wysine data)',
  `en_per_min_idle` double default NULL COMMENT 'related only to printer',
  `servr_cost` double default NULL COMMENT 'linked to recommendation( using this server may have high cost like that)',
  `no_of_core` int(11) default NULL,
  `cpu` double default NULL,
  `ram` int(11) default NULL,
  `disk_gb` int(11) default NULL,
  `monthly_rent` int(11) default NULL,
  PRIMARY KEY  (`ctlg_id`),
  KEY `fk109_idx` (`protocol_id`),
  KEY `fk210_idx` (`type_id`),
  KEY `fk211_idx` (`protocol_id`),
  CONSTRAINT `fk210` FOREIGN KEY (`type_id`) REFERENCES `comp_type` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk211` FOREIGN KEY (`protocol_id`) REFERENCES `protocol` (`protocol_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='name of server in dc..ibm,hp and need to add default server ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_ctlg`
--

LOCK TABLES `dev_ctlg` WRITE;
/*!40000 ALTER TABLE `dev_ctlg` DISABLE KEYS */;
INSERT INTO `dev_ctlg` VALUES ('cisco_switch_c290','nsrg',NULL,'Cisco switch C2960-LANBASE-M, Version 12',10,87,107,60,0.00043,NULL,100000,NULL,NULL,NULL,NULL,NULL),('default_desktop','computer','desktop','Default Desktop',10,87,107,60,NULL,NULL,200000,NULL,NULL,NULL,NULL,10000),('default_laptop','computer',NULL,'Default Laptop',10,87,107,60,NULL,NULL,1000000,NULL,NULL,NULL,NULL,50000),('default_nsrg','nsrg',NULL,'Default Networking Device',10,87,107,60,0.00043,NULL,500000,NULL,NULL,NULL,NULL,20000),('default_printer','printer',NULL,'Default Printer',10,87,107,60,0.0043,0.000111,50000,NULL,NULL,NULL,NULL,4000),('default_server','computer','server','Default Server',10,87,107,60,0.0043,NULL,8000,NULL,NULL,NULL,NULL,NULL),('default_tablet','computer',NULL,'Default Tablet Computer',10,87,107,60,NULL,NULL,8000,NULL,NULL,NULL,NULL,NULL),('default_thinclient','computer','thinclnt','Default Thinclient Computer',10,87,107,60,NULL,NULL,8000,NULL,NULL,NULL,NULL,NULL),('dell_4_2-27_15_50','computer','server','dell power edge 4 core@2.27ghz 15gb ram ',10,87,107,60,NULL,NULL,45000,NULL,NULL,NULL,NULL,12000),('hp_m1536dnf','printer',NULL,'HP LaserJet M1536dnf',10,87,107,60,0.0043,0.000111,70000,NULL,NULL,NULL,NULL,35000),('ibm_4_2.13_19_50','computer','server','ibm server 4 core@2.13ghz 19gb ram 50 gb',10,77,80,70,NULL,NULL,8000,NULL,NULL,NULL,NULL,5000),('ibm_6_2.40_35_2048','computer','server','ibm server 6 core@2.40ghz 35gb ram 2tb h',10,70,110,80,NULL,NULL,60000,NULL,NULL,NULL,NULL,4000);
/*!40000 ALTER TABLE `dev_ctlg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meter_run`
--

DROP TABLE IF EXISTS `meter_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meter_run` (
  `run_id` bigint(20) NOT NULL auto_increment,
  `meter_id` char(10) NOT NULL,
  `rec_dttm` datetime NOT NULL,
  `asset_scnd` smallint(6) NOT NULL default '0',
  `asset_disc` smallint(6) NOT NULL default '0',
  `run_time_ms` bigint(20) NOT NULL,
  PRIMARY KEY  (`run_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39831 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meter_run`
--

LOCK TABLES `meter_run` WRITE;
/*!40000 ALTER TABLE `meter_run` DISABLE KEYS */;
INSERT INTO `meter_run` VALUES (39830,'intel1','2013-11-04 11:27:23',13,10,27216);
/*!40000 ALTER TABLE `meter_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsrg_conn_device`
--

DROP TABLE IF EXISTS `nsrg_conn_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsrg_conn_device` (
  `run_id` bigint(20) NOT NULL,
  `asset_id` char(30) NOT NULL,
  `ip_addr` char(15) NOT NULL,
  KEY `fk13_idx` (`run_id`,`asset_id`),
  KEY `fk105_idx` (`run_id`),
  KEY `fk106_idx` (`asset_id`),
  KEY `fk63_idx` (`run_id`),
  KEY `fk71_idx` (`run_id`),
  KEY `fk56 _idx` (`run_id`),
  KEY `idx_4` (`run_id`,`asset_id`),
  CONSTRAINT `fk106` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk56 ` FOREIGN KEY (`run_id`) REFERENCES `meter_run` (`run_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsrg_conn_device`
--

LOCK TABLES `nsrg_conn_device` WRITE;
/*!40000 ALTER TABLE `nsrg_conn_device` DISABLE KEYS */;
INSERT INTO `nsrg_conn_device` VALUES (39830,'S-0025b438b440','192.168.1.35'),(39830,'S-0025b438b440','192.168.1.33'),(39830,'S-0025b438b440','192.168.1.254');
/*!40000 ALTER TABLE `nsrg_conn_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsrg_snpsht`
--

DROP TABLE IF EXISTS `nsrg_snpsht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsrg_snpsht` (
  `run_id` bigint(20) NOT NULL,
  `asset_id` char(30) NOT NULL,
  `ip_addr` char(15) default NULL,
  `up_time` bigint(20) default NULL,
  `num_ports` smallint(6) default NULL,
  `num_ports_up` smallint(6) default NULL,
  `ntwrk_bytes_in` bigint(20) default NULL,
  `ntwrk_bytes_out` bigint(20) default NULL,
  `extras` varchar(200) default NULL,
  PRIMARY KEY  (`run_id`,`asset_id`),
  KEY `fk11_idx` (`run_id`),
  KEY `fk12_idx` (`asset_id`),
  KEY `fk31_idx` (`run_id`,`asset_id`),
  KEY `fk107_idx` (`asset_id`),
  KEY `fk108_idx` (`run_id`),
  KEY `fk42_idx` (`run_id`),
  KEY `fk58_idx` (`run_id`),
  KEY `fk58_idx1` (`run_id`),
  CONSTRAINT `fk107` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk58` FOREIGN KEY (`run_id`) REFERENCES `meter_run` (`run_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsrg_snpsht`
--

LOCK TABLES `nsrg_snpsht` WRITE;
/*!40000 ALTER TABLE `nsrg_snpsht` DISABLE KEYS */;
INSERT INTO `nsrg_snpsht` VALUES (39830,'S-0025b438b440','192.168.1.253',1441854,57,28,11546251079,12808310259,NULL);
/*!40000 ALTER TABLE `nsrg_snpsht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_type`
--

DROP TABLE IF EXISTS `os_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `os_type` (
  `os_id` char(20) NOT NULL,
  `descr` varchar(30) NOT NULL,
  PRIMARY KEY  (`os_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_type`
--

LOCK TABLES `os_type` WRITE;
/*!40000 ALTER TABLE `os_type` DISABLE KEYS */;
INSERT INTO `os_type` VALUES ('linux','Linux'),('mac','Apple MacIntosh'),('unix','Unix'),('windows','Windows');
/*!40000 ALTER TABLE `os_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power`
--

DROP TABLE IF EXISTS `power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power` (
  `sid` bigint(20) NOT NULL,
  `meter_id` char(10) NOT NULL,
  `rec_dttm` datetime NOT NULL,
  `voltage` double default NULL,
  `amp` double default NULL,
  `energy` double NOT NULL,
  PRIMARY KEY  (`sid`),
  KEY `fk88_idx` (`meter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power`
--

LOCK TABLES `power` WRITE;
/*!40000 ALTER TABLE `power` DISABLE KEYS */;
INSERT INTO `power` VALUES (1,'apsmeter','2013-06-03 00:00:00',1,1,500),(2,'apsmeter','2013-08-03 00:00:00',2,2,3000),(3,'apsmeter','2013-08-07 00:00:00',3,3,4000),(4,'apsmeter','2013-08-02 00:00:00',4,4,1000);
/*!40000 ALTER TABLE `power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prntr_conn_device`
--

DROP TABLE IF EXISTS `prntr_conn_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prntr_conn_device` (
  `run_id` bigint(20) NOT NULL,
  `asset_id` char(30) NOT NULL,
  `ip_addr` char(15) NOT NULL,
  KEY `fk16_idx` (`run_id`,`asset_id`),
  KEY `fk40_idx` (`run_id`,`asset_id`),
  KEY `fk111_idx` (`asset_id`),
  KEY `fk112_idx` (`run_id`),
  KEY `fk54_idx` (`run_id`),
  KEY `fk49_idx` (`run_id`),
  KEY `fk64 _idx` (`run_id`),
  KEY `idx_5` (`run_id`,`asset_id`),
  CONSTRAINT `fk111` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk64 ` FOREIGN KEY (`run_id`) REFERENCES `meter_run` (`run_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prntr_conn_device`
--

LOCK TABLES `prntr_conn_device` WRITE;
/*!40000 ALTER TABLE `prntr_conn_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `prntr_conn_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prntr_snpsht`
--

DROP TABLE IF EXISTS `prntr_snpsht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prntr_snpsht` (
  `run_id` bigint(20) NOT NULL,
  `asset_id` char(30) NOT NULL,
  `ip_addr` char(15) default NULL,
  `tot_mem` bigint(20) default NULL,
  `tot_disk_space` bigint(20) default NULL,
  `used_mem` bigint(20) default NULL,
  `used_disk_space` bigint(20) default NULL,
  `up_time` bigint(20) default NULL,
  `toner_status` varchar(10) default 'toner_low' COMMENT 'toner high and toner low are the values( >33 and  < 33), default : low',
  `out_of_papr_ind` char(1) default NULL,
  `prnts_tkn_cnt` smallint(6) default NULL,
  `prntr_status` tinyint(4) default NULL COMMENT 'printer status like printing, idle, error and warmup',
  `aux_status` tinyint(4) default NULL COMMENT 'error message like paper jam',
  `mfg_mdl` varchar(30) default NULL,
  `clr_prntr` char(1) default NULL,
  `extras` varchar(200) default NULL,
  PRIMARY KEY  (`run_id`,`asset_id`),
  KEY `fk14_idx` (`asset_id`),
  KEY `fk15_idx` (`run_id`),
  KEY `fk109_idx` (`asset_id`),
  KEY `fk110_idx` (`run_id`),
  KEY `fk68_idx` (`run_id`),
  KEY `fk73_idx` (`run_id`),
  KEY `fk73_idx1` (`run_id`),
  CONSTRAINT `fk109` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk73` FOREIGN KEY (`run_id`) REFERENCES `meter_run` (`run_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prntr_snpsht`
--

LOCK TABLES `prntr_snpsht` WRITE;
/*!40000 ALTER TABLE `prntr_snpsht` DISABLE KEYS */;
INSERT INTO `prntr_snpsht` VALUES (39830,'P-2c413881ed23','192.168.1.11',134217728,0,43119753,0,5156,'Low','n',0,3,0,'HP LaserJet M1536dnf MFP','N',NULL);
/*!40000 ALTER TABLE `prntr_snpsht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protocol`
--

DROP TABLE IF EXISTS `protocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protocol` (
  `protocol_id` char(10) NOT NULL,
  `descr` varchar(30) NOT NULL,
  PRIMARY KEY  (`protocol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protocol`
--

LOCK TABLES `protocol` WRITE;
/*!40000 ALTER TABLE `protocol` DISABLE KEYS */;
INSERT INTO `protocol` VALUES ('computer','computer meter '),('it','it meter'),('nsrg','network,switch,router,gatekeep'),('printer','printer meter '),('pw','power');
/*!40000 ALTER TABLE `protocol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `srvr_app_type`
--

DROP TABLE IF EXISTS `srvr_app_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `srvr_app_type` (
  `srvr_app_id` smallint(6) NOT NULL,
  `descr` varchar(60) NOT NULL,
  PRIMARY KEY  (`srvr_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='dev, production, dr server..ftp,dev';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `srvr_app_type`
--

LOCK TABLES `srvr_app_type` WRITE;
/*!40000 ALTER TABLE `srvr_app_type` DISABLE KEYS */;
INSERT INTO `srvr_app_type` VALUES (1,'Production Server'),(2,'Clone or Disaster recovery server'),(3,'Integration server'),(4,'Development Server'),(5,'Developer Machine');
/*!40000 ALTER TABLE `srvr_app_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_snpsht`
--

DROP TABLE IF EXISTS `storage_snpsht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_snpsht` (
  `run_id` bigint(20) NOT NULL,
  `asset_id` char(30) NOT NULL,
  `up_time` bigint(20) default NULL,
  `tot_disk_space` bigint(20) default NULL,
  `used_disk_space` bigint(20) default NULL,
  `num_of_cntrlr` smallint(6) default NULL,
  `num_of_disks` smallint(6) default NULL,
  `iops` bigint(20) default NULL,
  `cnctr_protocol` varchar(25) character set latin2 default NULL,
  `extras` varchar(200) character set latin2 default NULL,
  PRIMARY KEY  (`run_id`,`asset_id`),
  KEY `fk788_idx` (`run_id`),
  KEY `fk189_idx` (`asset_id`),
  KEY `fk190_idx` (`run_id`),
  KEY `fk190 _idx` (`run_id`),
  CONSTRAINT `fk189` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk190 ` FOREIGN KEY (`run_id`) REFERENCES `meter_run` (`run_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_snpsht`
--

LOCK TABLES `storage_snpsht` WRITE;
/*!40000 ALTER TABLE `storage_snpsht` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_snpsht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_profile`
--

DROP TABLE IF EXISTS `sys_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_profile` (
  `keyy` varchar(40) NOT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY  (`keyy`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_profile`
--

LOCK TABLES `sys_profile` WRITE;
/*!40000 ALTER TABLE `sys_profile` DISABLE KEYS */;
INSERT INTO `sys_profile` VALUES ('COMPUTE_DURATION','100'),('DC_LOCATION','MAA'),('PRIMARY_PWR_SRC',''),('PWR_SCREEN_MTR',''),('SOCKET_LISTENER_PORT',''),('TOT_DC_AIRCON_TONNEAGE','');
/*!40000 ALTER TABLE `sys_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gqmintel'
--
/*!50003 DROP PROCEDURE IF EXISTS `calc_it_kwh` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`gqmaps`@`%`*/ /*!50003 PROCEDURE `calc_it_kwh`(_area char(5)
		,_protocol char(10),_starttime datetime,_endtime datetime,inout _itkwh double)
begin

	DECLARE done INT DEFAULT 0;

	declare row_protocol char (10);
	declare row_asset_id char(30);

	declare total_kwh double;
	declare component_kwh double;

	declare kwh double;
	declare f int;

	declare asset_cur cursor for select asset_id , protocol_id from asset ;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	begin

		open asset_cur;

		set total_kwh = 0;
		
		rec_loop: loop

			fetch asset_cur into row_asset_id,row_protocol;

			if done = 1 then
				leave rec_loop;
			end if;

			if _protocol = 'nsrg' or _protocol = 'all' then
				if row_protocol = 'nsrg' then
					call calc_nsrg_kwh(row_asset_id,_starttime,_endtime,component_kwh);
					set total_kwh = total_kwh + component_kwh;
				end if;
			end if;

			if _protocol = 'printer' or _protocol = 'all' then
				if row_protocol = 'printer' then
					call calc_printer_kwh(row_asset_id, _starttime, _endtime, component_kwh);
					set total_kwh = total_kwh + component_kwh;
				end if;
			end if;

			if _protocol = 'computer' or _protocol = 'all' then
				if row_protocol = 'computer' then
					call calc_server_proc_kwh(row_asset_id, _starttime, _endtime, component_kwh);
					set total_kwh = total_kwh + component_kwh;
				end if;
			end if;

			if _protocol = 'storage' or _protocol = 'all' then
				if row_protocol = 'storage' then
					call calc_storage_kwh(row_asset_id, _starttime, _endtime, component_kwh);
					set total_kwh = total_kwh + component_kwh;
				end if;
			end if;


		end loop rec_loop;
	
		CLOSE asset_cur;				
		
	set _itkwh = total_kwh;
		 -- select _itkwh;
	end;
 -- call calc_it_kwh('d','all','2013-05-21 10:10:04','2013-08-29 10:10:04',@it);
		
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calc_nsrg_kwh` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`gqmaps`@`%`*/ /*!50003 PROCEDURE `calc_nsrg_kwh`(in_asset_id char(30) 
	,in_rec_frm datetime
	,in_rec_to datetime, inout out_kwh double)
begin

	declare kwh double;
	declare time_durtn_hrs double;
	
	set 
			time_durtn_hrs =  TIMESTAMPDIFF(hour,in_rec_frm,in_rec_to);

	set out_kwh =  (select en_per_min_load from gqmaps.dev_ctlg where ctlg_id = (
				select ctlg_id from gqmaps.asset where asset_id = in_asset_id )) * time_durtn_hrs;
if out_kwh is null then 
	set out_kwh =0;
end if;
-- select out_kwh,time_durtn_hrs;
-- call calc_nsrg_kwh('S-0025b438b440','2011-03-14 13:11:06','2013-08-14 14:15:06',@it);
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calc_printer_kwh` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`gqmaps`@`%`*/ /*!50003 PROCEDURE `calc_printer_kwh`(in_asset_id char(30) ,in_rec_frm datetime ,in_rec_to datetime,inout out_kwh double)
begin

	declare kwh double;
	declare time_durtn_hrs double;
	
	declare tot_count integer;
	declare load_count integer;

	declare en_load,en_idle double;

		select 	en_per_min_load , en_per_min_idle 
		from 	dev_ctlg
		where	ctlg_id = ( select ctlg_id from gqmaps.asset where asset_id = in_asset_id ) 
		into en_load , en_idle;


		set tot_count = ( select count(*) from prntr_snpsht a, meter_run b	where a.asset_id = in_asset_id 
							and b.run_id = a.run_id
							and b.rec_dttm between in_rec_frm and in_rec_to ); 

			set 
			time_durtn_hrs =  TIMESTAMPDIFF(hour,in_rec_frm,in_rec_to);
		set load_count =( select count(*) from	prntr_snpsht a, meter_run b	where a.asset_id = in_asset_id 
							and b.run_id = a.run_id
							and b.rec_dttm between in_rec_frm and in_rec_to and a.prntr_status = 4);


		set out_kwh = ( (en_load * (time_durtn_hrs*( load_count/tot_count) ) ) +

				  ( en_idle  * (time_durtn_hrs * ( (tot_count - load_count) / tot_count) ) ) );
		
	if out_kwh is null then 
	set out_kwh =0;
		end if;
		-- select 'printer' , out_kwh;

--  call calc_printer_kwh('P-101f74489436','2011-06-06 13:16:01','2013-08-06 13:24:01',@it);

				
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calc_pue` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`gqmaps`@`%`*/ /*!50003 PROCEDURE `calc_pue`(_protocol char(10), out pue double)
begin
	declare from_date datetime;
	declare to_date datetime;
	declare itkwh double;
	declare non_it_kwh double;
	declare pue double;

		set from_date = SUBDATE(now(), (SELECT value FROM sys_profile WHERE	keyy = 'COMPUTE_DURATION')) ;
		set to_date =now();

		set non_it_kwh = (select energy from power 
						  where rec_dttm =
								(select max(rec_dttm) from power where rec_dttm between from_date and to_date))
								 -
						 (select energy from power
						  where rec_dttm =
								(select min(rec_dttm) from power where rec_dttm between from_date and to_date));
		
		if non_it_kwh is null 
		then
			set non_it_kwh =0;
		end if;

		call calc_it_kwh('d',_protocol,from_date,to_date, itkwh);

		set pue = non_it_kwh/itkwh;

		-- select pue;
		-- call calc_pue('all',@it)
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calc_server_proc_kwh` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`gqmaps`@`%`*/ /*!50003 PROCEDURE `calc_server_proc_kwh`(in_asset_id char(30) ,
										in_rec_frm datetime, in_rec_to datetime, inout out_kwh double)
begin
			
		declare srvr_kwh double;
      	declare cpuload double;
		declare time_durtn_hrs double;
		declare catalog_id char(20);

		set out_kwh = 0;
		-- SET @enabled = TRUE;
		-- step 1 : figure out the cpu load average
		set cpuload = ( select 
						avg(a.cpu_load) 
						from 
							gqmaps.comp_snpsht a, gqmaps.meter_run b
						where 
							a.asset_id = in_asset_id 
						and b.run_id = a.run_id
						and b.rec_dttm between in_rec_frm and in_rec_to ); 

		if cpuload is not null then
			-- step 2 : calculate the run hours
			set 
			time_durtn_hrs =  TIMESTAMPDIFF(hour,in_rec_frm,in_rec_to);
			-- (select (time_to_sec(in_rec_to)-  time_to_sec(in_rec_frm) ) / 3600 );
		
			-- step 3 : calc the % variance & run watts to do the kwh math
			set catalog_id = (select ctlg_id from asset where asset_id=in_asset_id);
			if catalog_id is null 
			then
				set catalog_id = 'default_server';
			end if;

			set
			out_kwh = ( select 	( (run_watts * time_durtn_hrs) / 1000 )  +  
							( (( run_watts * time_durtn_hrs ) / 1000) *
							( variance / 100 ) )  
					from 
						(select idle_threshold , load_threshold , idle_watt , load_watt,
						case
							when cpuload <= idle_threshold then idle_watt
							when cpuload >= load_threshold then load_watt
							else ( ( (load_watt-idle_watt)*(cpuload/100) )+ idle_watt ) 
						end
							as run_watts ,
					case
							when cpuload > idle_threshold and cpuload <= 25 then 33
							when cpuload > 25 and cpuload <= 50 then 17
							when cpuload > 50 and cpuload < load_threshold then 9
							else 0
					end 
							as variance 
					from
							dev_ctlg where ctlg_id =catalog_id ) temp);
		else
			set out_kwh =0;
		end if;
		-- select in_asset_id,time_durtn_hrs,cpuload,out_kwh;
		-- call calc_server_proc_kwh('C-2c4138a2481f','2011-03-14 13:11:06','2013-08-14 14:15:06',@it);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calc_storage_kwh` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`gqmaps`@`%`*/ /*!50003 PROCEDURE `calc_storage_kwh`(in_asset_id char(30) 
	,in_rec_frm datetime
	,in_rec_to datetime, inout out_kwh double)
begin

	declare kwh double;
	set out_kwh =5;
	
	

	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-07 14:33:45
