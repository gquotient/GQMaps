CREATE TABLE `busn_line` (
  `bl_cd` char(5) NOT NULL,
  `descr` varchar(45) NOT NULL,
  PRIMARY KEY  (`bl_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='enterprise platform(IT,Bank..) ';




INSERT INTO `busn_line` VALUES ('bank','Bank'),('fi','Financial Institutions'),('fmcg','Fast Moving Consumer Goods'),('hotel','Hotel'),('hs','Hospitality'),('it-hw','IT Hardware'),('it-sw','IT Software'),('mfg','Manufacturing'),('other','Other');


