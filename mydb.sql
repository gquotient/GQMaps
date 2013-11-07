CREATE TABLE `busn_line` (
  `bl_cd` char(5) NOT NULL,
  `descr` varchar(45) NOT NULL,
  PRIMARY KEY  (`bl_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='enterprise platform(IT,Bank..) ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busn_line`
--

LOCK TABLES `busn_line` WRITE;
/*!40000 ALTER TABLE `busn_line` DISABLE KEYS */;
INSERT INTO `busn_line` VALUES ('bank','Bank'),('fi','Financial Institutions'),('fmcg','Fast Moving Consumer Goods'),('hotel','Hotel'),('hs','Hospitality'),('it-hw','IT Hardware'),('it-sw','IT Software'),('mfg','Manufacturing'),('other','Other');
/*!40000 ALTER TABLE `busn_line` ENABLE KEYS */;
UNLOCK TABLES;
