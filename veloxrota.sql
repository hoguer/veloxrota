-- MySQL dump 10.13  Distrib 5.1.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: veloxrota
-- ------------------------------------------------------
-- Server version	5.1.37-1ubuntu5.1

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
-- Table structure for table `benefactor`
--

DROP TABLE IF EXISTS `benefactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benefactor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `donation` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefactor`
--

LOCK TABLES `benefactor` WRITE;
/*!40000 ALTER TABLE `benefactor` DISABLE KEYS */;
INSERT INTO `benefactor` VALUES (1,2010,'Augustine','Michael',162),(2,2010,'Augustine','Margaret',241),(3,2010,'Cloud','Jeremy',100),(4,2010,'Sampath','Anand',25),(5,2010,'Heisler','Abigail',80),(6,2010,'Deveau','Joe',140),(7,2010,'Hock','Corey',50),(8,2010,'Mills','Sarah',50),(9,2010,'Whewell','Eric',75),(10,2010,'Yokabaskas','Mary',35),(11,2010,'Burrill','Brian',25),(12,2010,'Iarossi','Peter',25),(13,2010,'Inc.','Wingu',100),(14,2010,'Blanco','Greg',50),(15,2010,'Sullivan','Tom',25),(16,2010,'O\'Connell','Rich',25);
/*!40000 ALTER TABLE `benefactor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benefactor_donation`
--

DROP TABLE IF EXISTS `benefactor_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benefactor_donation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `benefactor` int(11) NOT NULL,
  `team_member` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefactor_donation`
--

LOCK TABLES `benefactor_donation` WRITE;
/*!40000 ALTER TABLE `benefactor_donation` DISABLE KEYS */;
INSERT INTO `benefactor_donation` VALUES (1,2010,1,NULL,'2010-03-23 18:49:43',162),(2,2010,2,NULL,'2010-03-23 18:49:55',241),(3,2010,3,NULL,'2010-03-23 18:50:01',100),(4,2010,4,NULL,'2010-03-28 22:36:49',25),(5,2010,5,NULL,'2010-03-28 22:37:42',80),(6,2010,6,NULL,'2010-03-30 13:23:04',140),(7,2010,7,1,'2010-03-31 15:26:09',50),(8,2010,8,1,'2010-03-31 15:26:15',50);
/*!40000 ALTER TABLE `benefactor_donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_fundraising`
--

DROP TABLE IF EXISTS `team_fundraising`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_fundraising` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goal` float DEFAULT NULL,
  `raised` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_fundraising`
--

LOCK TABLES `team_fundraising` WRITE;
/*!40000 ALTER TABLE `team_fundraising` DISABLE KEYS */;
INSERT INTO `team_fundraising` VALUES (1,100000,36177.6);
/*!40000 ALTER TABLE `team_fundraising` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_member`
--

DROP TABLE IF EXISTS `team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `role` varchar(63) NOT NULL DEFAULT 'Rider',
  `link` varchar(255) DEFAULT NULL,
  `amount_raised` float DEFAULT '0',
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_member`
--

LOCK TABLES `team_member` WRITE;
/*!40000 ALTER TABLE `team_member` DISABLE KEYS */;
INSERT INTO `team_member` VALUES (1,2010,'Michael Augustine','Captain','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1876577&amp;pg=personal&amp;fr_id=12402',0,0),(2,2010,'Margaret Augustine','Photographer','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1895260&amp;pg=personal&amp;fr_id=12402',0,1),(3,2010,'Tanya Augustine','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1897552&amp;pg=personal&amp;fr_id=12402',0,2),(4,2010,'Barry Barkow','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1802745&amp;pg=personal&amp;fr_id=12402',0,3),(5,2010,'Robert Beaudoin','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6956150&amp;pg=personal&amp;fr_id=12402',0,4),(6,2010,'Marco Becerra','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6708720&amp;pg=personal&amp;fr_id=12402',0,5),(7,2010,'Tyler Bennett','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1897153&amp;pg=personal&amp;fr_id=12402',0,6),(8,2010,'Greg Blanco','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1932129&amp;pg=personal&amp;fr_id=12402',0,8),(9,2010,'Michael Bowden','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=3760983&amp;pg=personal&amp;fr_id=12402',0,9),(10,2010,'Cynthia Brown','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1876935&amp;pg=personal&amp;fr_id=12402',0,10),(11,2010,'Richard Buractaon','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7709123&amp;pg=personal&amp;fr_id=12402',0,11),(12,2010,'Brian Burrill','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1877572&amp;pg=personal&amp;fr_id=12402',0,14),(13,2010,'Audrey Caswell','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7618958&amp;pg=personal&amp;fr_id=12402',0,15),(14,2010,'John Caswell','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7618956&amp;pg=personal&amp;fr_id=12402',0,16),(15,2010,'Danielle Cerny','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6181178&amp;pg=personal&amp;fr_id=12402',0,17),(16,2010,'Robin Clark','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1803408&amp;pg=personal&amp;fr_id=12402',0,19),(17,2010,'Jeremy Cloud','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=4592777&amp;pg=personal&amp;fr_id=12402',0,20),(18,2010,'Kenneth Cole','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=2275791&amp;pg=personal&amp;fr_id=12402',0,21),(19,2010,'Katie D\'Amato','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=2227846&amp;pg=personal&amp;fr_id=12402',0,24),(20,2010,'Amy DeDeo','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=3131170&amp;pg=personal&amp;fr_id=12402',0,26),(21,2010,'Scot DeDeo','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=3131137&amp;pg=personal&amp;fr_id=12402',0,27),(22,2010,'Joe Deveau','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1932094&amp;pg=personal&amp;fr_id=12402',0,28),(23,2010,'Meighan Dingle','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1894320&amp;pg=personal&amp;fr_id=12402',0,30),(24,2010,'Courtney Dinsmore','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=5937962&amp;pg=personal&amp;fr_id=12402',0,31),(25,2010,'Andrew Domke','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7753373&amp;pg=personal&amp;fr_id=12402',0,32),(26,2010,'Barry Dorn','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6043774&amp;pg=personal&amp;fr_id=12402',0,33),(27,2010,'Cheryl Egan','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6864256&amp;pg=personal&amp;fr_id=12402',0,34),(28,2010,'Thomas Egan','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7643492&amp;pg=personal&amp;fr_id=12402',0,35),(29,2010,'Stephanie Golas','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=4444601&amp;pg=personal&amp;fr_id=12402',0,42),(30,2010,'Rebecca Hall','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6009777&amp;pg=personal&amp;fr_id=12402',0,44),(31,2010,'Lesley Hayes','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7661184&amp;pg=personal&amp;fr_id=12402',0,46),(32,2010,'Abigail Heisler','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=3241569&amp;pg=personal&amp;fr_id=12402',0,47),(33,2010,'Corey Hock','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=4472411&amp;pg=personal&amp;fr_id=12402',0,48),(34,2010,'Nick Holland','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7625325&amp;pg=personal&amp;fr_id=12402',0,49),(35,2010,'Lily Hoo','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7749227&amp;pg=personal&amp;fr_id=12402',0,50),(36,2010,'Elizabeth Houghton','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7660585&amp;pg=personal&amp;fr_id=12402',0,51),(37,2010,'Adam Hughes','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6887544&amp;pg=personal&amp;fr_id=12402',0,52),(38,2010,'Peter Iarossi','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6110248&amp;pg=personal&amp;fr_id=12402',0,53),(39,2010,'John Kelleher','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=3808704&amp;pg=personal&amp;fr_id=12402',0,55),(40,2010,'Kevin Kelleher','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1896809&amp;pg=personal&amp;fr_id=12402',0,56),(41,2010,'Ron Kelleher','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=3634492&amp;pg=personal&amp;fr_id=12402',0,57),(42,2010,'Ira Kemp','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=3134293&amp;pg=personal&amp;fr_id=12402',0,59),(43,2010,'Steve Konicki','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6956081&amp;pg=personal&amp;fr_id=12402',0,60),(44,2010,'Jessica Korecki','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1902409&amp;pg=personal&amp;fr_id=12402',0,61),(45,2010,'Michelle Lagares','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1580593&amp;pg=personal&amp;fr_id=12402',0,62),(46,2010,'Michael Leahy','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1880524&amp;pg=personal&amp;fr_id=12402',0,64),(47,2010,'Matthew Lenzi','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6060640&amp;pg=personal&amp;fr_id=12402',0,66),(48,2010,'Bobby Mac','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7677105&amp;pg=personal&amp;fr_id=12402',0,67),(49,2010,'Keith Magnus','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7063493&amp;pg=personal&amp;fr_id=12402',0,69),(50,2010,'David Martin','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7643718&amp;pg=personal&amp;fr_id=12402',0,70),(51,2010,'Diego Martins','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7749249&amp;pg=personal&amp;fr_id=12402',0,71),(52,2010,'Natalie Matushevskaya','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6017687&amp;pg=personal&amp;fr_id=12402',0,72),(53,2010,'Mina McCarron','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=3154540&amp;pg=personal&amp;fr_id=12402',0,73),(54,2010,'Shaun McCarron','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7626274&amp;pg=personal&amp;fr_id=12402',0,74),(55,2010,'Melissa McEvoy','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7714440&amp;pg=personal&amp;fr_id=12402',0,75),(56,2010,'Orly Menzin','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=4768994&amp;pg=personal&amp;fr_id=12402',0,76),(57,2010,'Sarah Mills','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=4472282&amp;pg=personal&amp;fr_id=12402',0,80),(58,2010,'Katie Petrillo','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6009986&amp;pg=personal&amp;fr_id=12402',0,84),(59,2010,'Amy Raber','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6742932&amp;pg=personal&amp;fr_id=12402',0,86),(60,2010,'Jana Rayfield','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1839720&amp;pg=personal&amp;fr_id=12402',0,87),(61,2010,'Gail Reilly','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=4580614&amp;pg=personal&amp;fr_id=12402',0,88),(62,2010,'Jessica Rossman','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7684362&amp;pg=personal&amp;fr_id=12402',0,91),(63,2010,'Ingrid Ruz','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6244564&amp;pg=personal&amp;fr_id=12402',0,92),(64,2010,'Elizabeth Ryland','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=4104669&amp;pg=personal&amp;fr_id=12402',0,93),(65,2010,'Scott Sabino','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=3125033&amp;pg=personal&amp;fr_id=12402',0,94),(66,2010,'Anand Sampath','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6068330&amp;pg=personal&amp;fr_id=12402',0,95),(67,2010,'Greg Smith','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6278999&amp;pg=personal&amp;fr_id=12402',0,99),(68,2010,'Tamara Smith','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7739988&amp;pg=personal&amp;fr_id=12402',0,100),(69,2010,'David Stark','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7697066&amp;pg=personal&amp;fr_id=12402',0,101),(70,2010,'Gregory Stratis','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1897236&amp;pg=personal&amp;fr_id=12402',0,102),(71,2010,'Lucinda Stratton','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=5408608&amp;pg=personal&amp;fr_id=12402',0,103),(72,2010,'Erin Sunderland','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1897646&amp;pg=personal&amp;fr_id=12402',0,104),(73,2010,'Jen Sunderland','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1846923&amp;pg=personal&amp;fr_id=12402',0,105),(74,2010,'Bryan Surozenski','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1885301&amp;pg=personal&amp;fr_id=12402',0,106),(75,2010,'Adam Thorpe','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7627073&amp;pg=personal&amp;fr_id=12402',0,107),(76,2010,'Jennifer Thorpe','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6111120&amp;pg=personal&amp;fr_id=12402',0,108),(77,2010,'Bridgette Treado','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7357164&amp;pg=personal&amp;fr_id=12402',0,110),(78,2010,'Alla Vigdorchik','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7648943&amp;pg=personal&amp;fr_id=12402',0,112),(79,2010,'Robert Vines','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1909874&amp;pg=personal&amp;fr_id=12402',0,113),(80,2010,'Jason Webber','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=4312981&amp;pg=personal&amp;fr_id=12402',0,115),(81,2010,'David West','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=5481531&amp;pg=personal&amp;fr_id=12402',0,116),(82,2010,'Eric Whewell','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6083973&amp;pg=personal&amp;fr_id=12402',0,117),(83,2010,'Mary Yokabaskas','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=5140151&amp;pg=personal&amp;fr_id=12402',0,120),(84,2010,'Ann Mariea Freyne','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7770927&amp;pg=personal&amp;fr_id=12402',0,38),(85,2010,'Derek Ricarte','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6984401&amp;pg=personal&amp;fr_id=12402',0,89),(86,2010,'Philip Miller','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=5501654&amp;pg=personal&amp;fr_id=12402',0,79),(87,2010,'Jessica Harrop','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7776571&amp;pg=personal&amp;fr_id=12402',0,45),(88,2010,'Messeret GrenSai','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7780614&amp;pg=personal&amp;fr_id=12402',0,43),(121,2010,'KT Burggraaf','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7698494&amp;pg=personal&amp;fr_id=12402',0,13),(120,2010,'Zachary Traina','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=8311765&amp;pg=personal&amp;fr_id=12402',0,109),(91,2010,'Heidy Ventura','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7780512&amp;pg=personal&amp;fr_id=12402',0,111),(92,2010,'Michael Daly','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7694428&amp;pg=personal&amp;fr_id=12402',0,25),(93,2010,'Jared Chase','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=2772441&amp;pg=personal&amp;fr_id=12402',0,18),(94,2010,'Adam Cooper','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7800331&amp;pg=personal&amp;fr_id=12402',0,22),(95,2010,'Scott Gaudet','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6111786&amp;pg=personal&amp;fr_id=12402',0,40),(96,2010,'Eric Mercado','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7809211&amp;pg=personal&amp;fr_id=12402',0,77),(97,2010,'Luis Berrios','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7828107&amp;pg=personal&amp;fr_id=12402',0,7),(98,2010,'Brian DiGregorio','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7834009&amp;pg=personal&amp;fr_id=12402',0,29),(99,2010,'Kerri Sirois','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6284901&amp;pg=personal&amp;fr_id=12402',0,98),(100,2010,'Richard LeBoeuf','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=1876917&amp;pg=personal&amp;fr_id=12402',0,65),(101,2010,'Stacy Nimmo','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7840366&amp;pg=personal&amp;fr_id=12402',0,82),(102,2010,'Jennifer MacVittie','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=3593950&amp;pg=personal&amp;fr_id=12402',0,68),(103,2010,'Nicole Whitten','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=5150781&amp;pg=personal&amp;fr_id=12402',0,118),(104,2010,'Tim Miley','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7895074&amp;pg=personal&amp;fr_id=12402',0,78),(105,2010,'Grace Saporito','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7907025&amp;pg=personal&amp;fr_id=12402',0,96),(106,2010,'Jeffrey Paulhus','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=2739887&amp;pg=personal&amp;fr_id=12402',0,83),(107,2010,'Catherine Poirier','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=4716720&amp;pg=personal&amp;fr_id=12402',0,85),(108,2010,'Robert Jacobson','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=2001920&amp;pg=personal&amp;fr_id=12402',0,54),(109,2010,'Kate Kelly','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7953281&amp;pg=personal&amp;fr_id=12402',0,58),(110,2010,'jill walsh','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=8006474&amp;pg=personal&amp;fr_id=12402',0,114),(111,2010,'Derek Fahrer','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6139197&amp;pg=personal&amp;fr_id=12402',0,37),(112,2010,'Jana Richtrova','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=8080719&amp;pg=personal&amp;fr_id=12402',0,90),(113,2010,'Azita Ghodssi','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=8089286&amp;pg=personal&amp;fr_id=12402',0,41),(114,2010,'Diana Gargano','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=4950248&amp;pg=personal&amp;fr_id=12402',0,39),(115,2010,'Kiley Evans','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=8113963&amp;pg=personal&amp;fr_id=12402',0,36),(116,2010,'Jayne Savage','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=8176971&amp;pg=personal&amp;fr_id=12402',0,97),(117,2010,'michael costa','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=8215959&amp;pg=personal&amp;fr_id=12402',0,23),(118,2010,'Dom Lamas','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=8219709&amp;pg=personal&amp;fr_id=12402',0,63),(119,2010,'Leonard Wood','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=6156096&amp;pg=personal&amp;fr_id=12402',0,119),(122,2010,'David Burggraaf','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=7698484&amp;pg=personal&amp;fr_id=12402',0,12),(123,2010,'Mark Mullins','Rider','http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?px=8362563&amp;pg=personal&amp;fr_id=12402',0,81);
/*!40000 ALTER TABLE `team_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-05-24 23:03:26
