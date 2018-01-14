-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wikipedia
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

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
-- Current Database: `wikipedia`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `wikipedia` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `wikipedia`;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `ar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_namespace` int(11) NOT NULL DEFAULT '0',
  `ar_title` varbinary(255) NOT NULL DEFAULT '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` varbinary(767) NOT NULL DEFAULT '',
  `ar_comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ar_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ar_user_text` varbinary(255) NOT NULL,
  `ar_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) unsigned DEFAULT NULL,
  `ar_text_id` int(10) unsigned DEFAULT NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ar_len` int(10) unsigned DEFAULT NULL,
  `ar_page_id` int(10) unsigned DEFAULT NULL,
  `ar_parent_id` int(10) unsigned DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT '',
  `ar_content_model` varbinary(32) DEFAULT NULL,
  `ar_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`ar_id`),
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`),
  KEY `ar_revid` (`ar_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_passwords`
--

DROP TABLE IF EXISTS `bot_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bot_passwords` (
  `bp_user` int(10) unsigned NOT NULL,
  `bp_app_id` varbinary(32) NOT NULL,
  `bp_password` tinyblob NOT NULL,
  `bp_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `bp_restrictions` blob NOT NULL,
  `bp_grants` blob NOT NULL,
  PRIMARY KEY (`bp_user`,`bp_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_passwords`
--

LOCK TABLES `bot_passwords` WRITE;
/*!40000 ALTER TABLE `bot_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `bot_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT '0',
  `cat_subcats` int(11) NOT NULL DEFAULT '0',
  `cat_files` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorylinks`
--

DROP TABLE IF EXISTS `categorylinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorylinks` (
  `cl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `cl_to` varbinary(255) NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_sortkey_prefix` varbinary(255) NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page',
  PRIMARY KEY (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  KEY `cl_collation_ext` (`cl_collation`,`cl_to`,`cl_type`,`cl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorylinks`
--

LOCK TABLES `categorylinks` WRITE;
/*!40000 ALTER TABLE `categorylinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorylinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_tag`
--

DROP TABLE IF EXISTS `change_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_tag` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ct_rc_id` int(11) DEFAULT NULL,
  `ct_log_id` int(10) unsigned DEFAULT NULL,
  `ct_rev_id` int(10) unsigned DEFAULT NULL,
  `ct_tag` varbinary(255) NOT NULL,
  `ct_params` blob,
  PRIMARY KEY (`ct_id`),
  UNIQUE KEY `change_tag_rc_tag` (`ct_rc_id`,`ct_tag`),
  UNIQUE KEY `change_tag_log_tag` (`ct_log_id`,`ct_tag`),
  UNIQUE KEY `change_tag_rev_tag` (`ct_rev_id`,`ct_tag`),
  KEY `change_tag_tag_id` (`ct_tag`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_tag`
--

LOCK TABLES `change_tag` WRITE;
/*!40000 ALTER TABLE `change_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_hash` int(11) NOT NULL,
  `comment_text` blob NOT NULL,
  `comment_data` blob,
  PRIMARY KEY (`comment_id`),
  KEY `comment_hash` (`comment_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externallinks`
--

DROP TABLE IF EXISTS `externallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externallinks` (
  `el_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `el_from` int(10) unsigned NOT NULL DEFAULT '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  `el_index_60` varbinary(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`el_id`),
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60)),
  KEY `el_index_60` (`el_index_60`,`el_id`),
  KEY `el_from_index_60` (`el_from`,`el_index_60`,`el_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externallinks`
--

LOCK TABLES `externallinks` WRITE;
/*!40000 ALTER TABLE `externallinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `externallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filearchive`
--

DROP TABLE IF EXISTS `filearchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filearchive` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_name` varbinary(255) NOT NULL DEFAULT '',
  `fa_archive_name` varbinary(255) DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` varbinary(767) DEFAULT '',
  `fa_deleted_reason_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fa_size` int(10) unsigned DEFAULT '0',
  `fa_width` int(11) DEFAULT '0',
  `fa_height` int(11) DEFAULT '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) DEFAULT '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT 'unknown',
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description` varbinary(767) DEFAULT '',
  `fa_description_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fa_user` int(10) unsigned DEFAULT '0',
  `fa_user_text` varbinary(255) DEFAULT NULL,
  `fa_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fa_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`),
  KEY `fa_sha1` (`fa_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filearchive`
--

LOCK TABLES `filearchive` WRITE;
/*!40000 ALTER TABLE `filearchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `filearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `img_name` varbinary(255) NOT NULL DEFAULT '',
  `img_size` int(10) unsigned NOT NULL DEFAULT '0',
  `img_width` int(11) NOT NULL DEFAULT '0',
  `img_height` int(11) NOT NULL DEFAULT '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_description` varbinary(767) NOT NULL DEFAULT '',
  `img_user` int(10) unsigned NOT NULL DEFAULT '0',
  `img_user_text` varbinary(255) NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `img_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_name`),
  KEY `img_user_timestamp` (`img_user`,`img_timestamp`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`(10)),
  KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_comment_temp`
--

DROP TABLE IF EXISTS `image_comment_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_comment_temp` (
  `imgcomment_name` varbinary(255) NOT NULL,
  `imgcomment_description_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`imgcomment_name`,`imgcomment_description_id`),
  UNIQUE KEY `imgcomment_name` (`imgcomment_name`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_comment_temp`
--

LOCK TABLES `image_comment_temp` WRITE;
/*!40000 ALTER TABLE `image_comment_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_comment_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagelinks`
--

DROP TABLE IF EXISTS `imagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagelinks` (
  `il_from` int(10) unsigned NOT NULL DEFAULT '0',
  `il_from_namespace` int(11) NOT NULL DEFAULT '0',
  `il_to` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`il_from`,`il_to`),
  KEY `il_to` (`il_to`,`il_from`),
  KEY `il_backlinks_namespace` (`il_from_namespace`,`il_to`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagelinks`
--

LOCK TABLES `imagelinks` WRITE;
/*!40000 ALTER TABLE `imagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interwiki`
--

DROP TABLE IF EXISTS `interwiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_api` blob NOT NULL,
  `iw_wikiid` varbinary(64) NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `iw_prefix` (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interwiki`
--

LOCK TABLES `interwiki` WRITE;
/*!40000 ALTER TABLE `interwiki` DISABLE KEYS */;
INSERT INTO `interwiki` VALUES ('acronym','http://www.acronymfinder.com/~/search/af.aspx?string=exact&Acronym=$1','','',0,0),('advogato','http://www.advogato.org/$1','','',0,0),('arxiv','http://www.arxiv.org/abs/$1','','',0,0),('c2find','http://c2.com/cgi/wiki?FindPage&value=$1','','',0,0),('cache','http://www.google.com/search?q=cache:$1','','',0,0),('commons','https://commons.wikimedia.org/wiki/$1','https://commons.wikimedia.org/w/api.php','',0,0),('dictionary','http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=$1','','',0,0),('doi','http://dx.doi.org/$1','','',0,0),('drumcorpswiki','http://www.drumcorpswiki.com/$1','http://drumcorpswiki.com/api.php','',0,0),('dwjwiki','http://www.suberic.net/cgi-bin/dwj/wiki.cgi?$1','','',0,0),('elibre','http://enciclopedia.us.es/index.php/$1','http://enciclopedia.us.es/api.php','',0,0),('emacswiki','http://www.emacswiki.org/cgi-bin/wiki.pl?$1','','',0,0),('foldoc','http://foldoc.org/?$1','','',0,0),('foxwiki','http://fox.wikis.com/wc.dll?Wiki~$1','','',0,0),('freebsdman','http://www.FreeBSD.org/cgi/man.cgi?apropos=1&query=$1','','',0,0),('gentoo-wiki','http://gentoo-wiki.com/$1','','',0,0),('google','http://www.google.com/search?q=$1','','',0,0),('googlegroups','http://groups.google.com/groups?q=$1','','',0,0),('hammondwiki','http://www.dairiki.org/HammondWiki/$1','','',0,0),('hrwiki','http://www.hrwiki.org/wiki/$1','http://www.hrwiki.org/w/api.php','',0,0),('imdb','http://www.imdb.com/find?q=$1&tt=on','','',0,0),('kmwiki','http://kmwiki.wikispaces.com/$1','','',0,0),('linuxwiki','http://linuxwiki.de/$1','','',0,0),('lojban','http://mw.lojban.org/papri/$1','','',0,0),('lqwiki','http://wiki.linuxquestions.org/wiki/$1','','',0,0),('meatball','http://www.usemod.com/cgi-bin/mb.pl?$1','','',0,0),('mediawikiwiki','https://www.mediawiki.org/wiki/$1','https://www.mediawiki.org/w/api.php','',0,0),('memoryalpha','http://en.memory-alpha.org/wiki/$1','http://en.memory-alpha.org/api.php','',0,0),('metawiki','http://sunir.org/apps/meta.pl?$1','','',0,0),('metawikimedia','https://meta.wikimedia.org/wiki/$1','https://meta.wikimedia.org/w/api.php','',0,0),('mozillawiki','http://wiki.mozilla.org/$1','https://wiki.mozilla.org/api.php','',0,0),('mw','https://www.mediawiki.org/wiki/$1','https://www.mediawiki.org/w/api.php','',0,0),('oeis','http://oeis.org/$1','','',0,0),('openwiki','http://openwiki.com/ow.asp?$1','','',0,0),('pmid','https://www.ncbi.nlm.nih.gov/pubmed/$1?dopt=Abstract','','',0,0),('pythoninfo','http://wiki.python.org/moin/$1','','',0,0),('rfc','https://tools.ietf.org/html/rfc$1','','',0,0),('s23wiki','http://s23.org/wiki/$1','http://s23.org/w/api.php','',0,0),('seattlewireless','http://seattlewireless.net/$1','','',0,0),('senseislibrary','http://senseis.xmp.net/?$1','','',0,0),('shoutwiki','http://www.shoutwiki.com/wiki/$1','http://www.shoutwiki.com/w/api.php','',0,0),('squeak','http://wiki.squeak.org/squeak/$1','','',0,0),('theopedia','http://www.theopedia.com/$1','','',0,0),('tmbw','http://www.tmbw.net/wiki/$1','http://tmbw.net/wiki/api.php','',0,0),('tmnet','http://www.technomanifestos.net/?$1','','',0,0),('twiki','http://twiki.org/cgi-bin/view/$1','','',0,0),('uncyclopedia','http://en.uncyclopedia.co/wiki/$1','http://en.uncyclopedia.co/w/api.php','',0,0),('unreal','http://wiki.beyondunreal.com/$1','http://wiki.beyondunreal.com/w/api.php','',0,0),('usemod','http://www.usemod.com/cgi-bin/wiki.pl?$1','','',0,0),('wiki','http://c2.com/cgi/wiki?$1','','',0,0),('wikia','http://www.wikia.com/wiki/$1','','',0,0),('wikibooks','https://en.wikibooks.org/wiki/$1','https://en.wikibooks.org/w/api.php','',0,0),('wikidata','https://www.wikidata.org/wiki/$1','https://www.wikidata.org/w/api.php','',0,0),('wikif1','http://www.wikif1.org/$1','','',0,0),('wikihow','http://www.wikihow.com/$1','http://www.wikihow.com/api.php','',0,0),('wikimedia','https://wikimediafoundation.org/wiki/$1','https://wikimediafoundation.org/w/api.php','',0,0),('wikinews','https://en.wikinews.org/wiki/$1','https://en.wikinews.org/w/api.php','',0,0),('wikinfo','http://wikinfo.co/English/index.php/$1','','',0,0),('wikipedia','https://en.wikipedia.org/wiki/$1','https://en.wikipedia.org/w/api.php','',0,0),('wikiquote','https://en.wikiquote.org/wiki/$1','https://en.wikiquote.org/w/api.php','',0,0),('wikisource','https://wikisource.org/wiki/$1','https://wikisource.org/w/api.php','',0,0),('wikispecies','https://species.wikimedia.org/wiki/$1','https://species.wikimedia.org/w/api.php','',0,0),('wikiversity','https://en.wikiversity.org/wiki/$1','https://en.wikiversity.org/w/api.php','',0,0),('wikivoyage','https://en.wikivoyage.org/wiki/$1','https://en.wikivoyage.org/w/api.php','',0,0),('wikt','https://en.wiktionary.org/wiki/$1','https://en.wiktionary.org/w/api.php','',0,0),('wiktionary','https://en.wiktionary.org/wiki/$1','https://en.wiktionary.org/w/api.php','',0,0);
/*!40000 ALTER TABLE `interwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_changes`
--

DROP TABLE IF EXISTS `ip_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_changes` (
  `ipc_rev_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ipc_rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipc_hex` varbinary(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`ipc_rev_id`),
  KEY `ipc_rev_timestamp` (`ipc_rev_timestamp`),
  KEY `ipc_hex_time` (`ipc_hex`,`ipc_rev_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_changes`
--

LOCK TABLES `ip_changes` WRITE;
/*!40000 ALTER TABLE `ip_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipblocks`
--

DROP TABLE IF EXISTS `ipblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipblocks` (
  `ipb_id` int(11) NOT NULL AUTO_INCREMENT,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by_text` varbinary(255) NOT NULL DEFAULT '',
  `ipb_reason` varbinary(767) NOT NULL DEFAULT '',
  `ipb_reason_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ipb_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_expiry` varbinary(14) NOT NULL DEFAULT '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_parent_block_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`),
  KEY `ipb_parent_block_id` (`ipb_parent_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipblocks`
--

LOCK TABLES `ipblocks` WRITE;
/*!40000 ALTER TABLE `ipblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iwlinks`
--

DROP TABLE IF EXISTS `iwlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iwlinks` (
  `iwl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `iwl_prefix` varbinary(20) NOT NULL DEFAULT '',
  `iwl_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`iwl_from`,`iwl_prefix`,`iwl_title`),
  KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iwlinks`
--

LOCK TABLES `iwlinks` WRITE;
/*!40000 ALTER TABLE `iwlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `iwlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_timestamp` varbinary(14) DEFAULT NULL,
  `job_params` blob NOT NULL,
  `job_random` int(10) unsigned NOT NULL DEFAULT '0',
  `job_attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` varbinary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`job_id`),
  KEY `job_sha1` (`job_sha1`),
  KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`,`job_params`(128)),
  KEY `job_timestamp` (`job_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l10n_cache`
--

DROP TABLE IF EXISTS `l10n_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l10n_cache` (
  `lc_lang` varbinary(32) NOT NULL,
  `lc_key` varbinary(255) NOT NULL,
  `lc_value` mediumblob NOT NULL,
  PRIMARY KEY (`lc_lang`,`lc_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l10n_cache`
--

LOCK TABLES `l10n_cache` WRITE;
/*!40000 ALTER TABLE `l10n_cache` DISABLE KEYS */;
INSERT INTO `l10n_cache` VALUES ('en','specialPageAliases','a:130:{s:12:\"CiteThisPage\";a:2:{i:0;s:12:\"CiteThisPage\";i:1;s:4:\"Cite\";}s:7:\"Captcha\";a:1:{i:0;s:7:\"Captcha\";}s:7:\"Gadgets\";a:1:{i:0;s:7:\"Gadgets\";}s:11:\"GadgetUsage\";a:1:{i:0;s:11:\"GadgetUsage\";}s:9:\"Interwiki\";a:1:{i:0;s:9:\"Interwiki\";}s:4:\"Nuke\";a:1:{i:0;s:4:\"Nuke\";}s:10:\"Renameuser\";a:1:{i:0;s:10:\"RenameUser\";}s:11:\"Activeusers\";a:1:{i:0;s:11:\"ActiveUsers\";}s:11:\"Allmessages\";a:1:{i:0;s:11:\"AllMessages\";}s:12:\"AllMyUploads\";a:2:{i:0;s:12:\"AllMyUploads\";i:1;s:10:\"AllMyFiles\";}s:8:\"Allpages\";a:1:{i:0;s:8:\"AllPages\";}s:7:\"ApiHelp\";a:1:{i:0;s:7:\"ApiHelp\";}s:10:\"ApiSandbox\";a:1:{i:0;s:10:\"ApiSandbox\";}s:12:\"Ancientpages\";a:1:{i:0;s:12:\"AncientPages\";}s:13:\"AutoblockList\";a:2:{i:0;s:13:\"AutoblockList\";i:1;s:14:\"ListAutoblocks\";}s:8:\"Badtitle\";a:1:{i:0;s:8:\"Badtitle\";}s:9:\"Blankpage\";a:1:{i:0;s:9:\"BlankPage\";}s:5:\"Block\";a:3:{i:0;s:5:\"Block\";i:1;s:7:\"BlockIP\";i:2;s:9:\"BlockUser\";}s:11:\"Booksources\";a:1:{i:0;s:11:\"BookSources\";}s:12:\"BotPasswords\";a:1:{i:0;s:12:\"BotPasswords\";}s:15:\"BrokenRedirects\";a:1:{i:0;s:15:\"BrokenRedirects\";}s:10:\"Categories\";a:1:{i:0;s:10:\"Categories\";}s:18:\"ChangeContentModel\";a:1:{i:0;s:18:\"ChangeContentModel\";}s:17:\"ChangeCredentials\";a:1:{i:0;s:17:\"ChangeCredentials\";}s:11:\"ChangeEmail\";a:1:{i:0;s:11:\"ChangeEmail\";}s:14:\"ChangePassword\";a:3:{i:0;s:14:\"ChangePassword\";i:1;s:9:\"ResetPass\";i:2;s:13:\"ResetPassword\";}s:12:\"ComparePages\";a:1:{i:0;s:12:\"ComparePages\";}s:12:\"Confirmemail\";a:1:{i:0;s:12:\"ConfirmEmail\";}s:13:\"Contributions\";a:2:{i:0;s:13:\"Contributions\";i:1;s:8:\"Contribs\";}s:13:\"CreateAccount\";a:1:{i:0;s:13:\"CreateAccount\";}s:12:\"Deadendpages\";a:1:{i:0;s:12:\"DeadendPages\";}s:20:\"DeletedContributions\";a:1:{i:0;s:20:\"DeletedContributions\";}s:4:\"Diff\";a:1:{i:0;s:4:\"Diff\";}s:15:\"DoubleRedirects\";a:1:{i:0;s:15:\"DoubleRedirects\";}s:8:\"EditTags\";a:1:{i:0;s:8:\"EditTags\";}s:13:\"EditWatchlist\";a:1:{i:0;s:13:\"EditWatchlist\";}s:9:\"Emailuser\";a:2:{i:0;s:9:\"EmailUser\";i:1;s:5:\"Email\";}s:15:\"ExpandTemplates\";a:1:{i:0;s:15:\"ExpandTemplates\";}s:6:\"Export\";a:1:{i:0;s:6:\"Export\";}s:15:\"Fewestrevisions\";a:1:{i:0;s:15:\"FewestRevisions\";}s:19:\"FileDuplicateSearch\";a:1:{i:0;s:19:\"FileDuplicateSearch\";}s:8:\"Filepath\";a:1:{i:0;s:8:\"FilePath\";}s:13:\"GoToInterwiki\";a:1:{i:0;s:13:\"GoToInterwiki\";}s:6:\"Import\";a:1:{i:0;s:6:\"Import\";}s:15:\"Invalidateemail\";a:1:{i:0;s:15:\"InvalidateEmail\";}s:14:\"JavaScriptTest\";a:1:{i:0;s:14:\"JavaScriptTest\";}s:9:\"BlockList\";a:3:{i:0;s:9:\"BlockList\";i:1;s:10:\"ListBlocks\";i:2;s:11:\"IPBlockList\";}s:10:\"LinkSearch\";a:1:{i:0;s:10:\"LinkSearch\";}s:12:\"LinkAccounts\";a:1:{i:0;s:12:\"LinkAccounts\";}s:10:\"Listadmins\";a:1:{i:0;s:10:\"ListAdmins\";}s:8:\"Listbots\";a:1:{i:0;s:8:\"ListBots\";}s:9:\"Listfiles\";a:3:{i:0;s:9:\"ListFiles\";i:1;s:8:\"FileList\";i:2;s:9:\"ImageList\";}s:15:\"Listgrouprights\";a:2:{i:0;s:15:\"ListGroupRights\";i:1;s:15:\"UserGroupRights\";}s:10:\"Listgrants\";a:1:{i:0;s:10:\"ListGrants\";}s:13:\"Listredirects\";a:1:{i:0;s:13:\"ListRedirects\";}s:19:\"ListDuplicatedFiles\";a:2:{i:0;s:19:\"ListDuplicatedFiles\";i:1;s:18:\"ListFileDuplicates\";}s:9:\"Listusers\";a:2:{i:0;s:9:\"ListUsers\";i:1;s:8:\"UserList\";}s:6:\"Lockdb\";a:1:{i:0;s:6:\"LockDB\";}s:3:\"Log\";a:2:{i:0;s:3:\"Log\";i:1;s:4:\"Logs\";}s:11:\"Lonelypages\";a:2:{i:0;s:11:\"LonelyPages\";i:1;s:13:\"OrphanedPages\";}s:9:\"Longpages\";a:1:{i:0;s:9:\"LongPages\";}s:15:\"MediaStatistics\";a:1:{i:0;s:15:\"MediaStatistics\";}s:12:\"MergeHistory\";a:1:{i:0;s:12:\"MergeHistory\";}s:10:\"MIMEsearch\";a:1:{i:0;s:10:\"MIMESearch\";}s:14:\"Mostcategories\";a:1:{i:0;s:14:\"MostCategories\";}s:10:\"Mostimages\";a:3:{i:0;s:15:\"MostLinkedFiles\";i:1;s:9:\"MostFiles\";i:2;s:10:\"MostImages\";}s:14:\"Mostinterwikis\";a:1:{i:0;s:14:\"MostInterwikis\";}s:10:\"Mostlinked\";a:2:{i:0;s:15:\"MostLinkedPages\";i:1;s:10:\"MostLinked\";}s:20:\"Mostlinkedcategories\";a:2:{i:0;s:20:\"MostLinkedCategories\";i:1;s:18:\"MostUsedCategories\";}s:19:\"Mostlinkedtemplates\";a:3:{i:0;s:20:\"MostTranscludedPages\";i:1;s:19:\"MostLinkedTemplates\";i:2;s:17:\"MostUsedTemplates\";}s:13:\"Mostrevisions\";a:1:{i:0;s:13:\"MostRevisions\";}s:8:\"Movepage\";a:1:{i:0;s:8:\"MovePage\";}s:15:\"Mycontributions\";a:1:{i:0;s:15:\"MyContributions\";}s:10:\"MyLanguage\";a:1:{i:0;s:10:\"MyLanguage\";}s:6:\"Mypage\";a:1:{i:0;s:6:\"MyPage\";}s:6:\"Mytalk\";a:1:{i:0;s:6:\"MyTalk\";}s:9:\"Myuploads\";a:2:{i:0;s:9:\"MyUploads\";i:1;s:7:\"MyFiles\";}s:9:\"Newimages\";a:2:{i:0;s:8:\"NewFiles\";i:1;s:9:\"NewImages\";}s:8:\"Newpages\";a:1:{i:0;s:8:\"NewPages\";}s:13:\"PagesWithProp\";a:4:{i:0;s:13:\"PagesWithProp\";i:1;s:13:\"Pageswithprop\";i:2;s:11:\"PagesByProp\";i:3;s:11:\"Pagesbyprop\";}s:8:\"PageData\";a:1:{i:0;s:8:\"Pagedata\";}s:12:\"PageLanguage\";a:1:{i:0;s:12:\"PageLanguage\";}s:13:\"PasswordReset\";a:1:{i:0;s:13:\"PasswordReset\";}s:13:\"PermanentLink\";a:2:{i:0;s:13:\"PermanentLink\";i:1;s:9:\"PermaLink\";}s:11:\"Preferences\";a:1:{i:0;s:11:\"Preferences\";}s:11:\"Prefixindex\";a:1:{i:0;s:11:\"PrefixIndex\";}s:14:\"Protectedpages\";a:1:{i:0;s:14:\"ProtectedPages\";}s:15:\"Protectedtitles\";a:1:{i:0;s:15:\"ProtectedTitles\";}s:10:\"Randompage\";a:2:{i:0;s:6:\"Random\";i:1;s:10:\"RandomPage\";}s:16:\"RandomInCategory\";a:1:{i:0;s:16:\"RandomInCategory\";}s:14:\"Randomredirect\";a:1:{i:0;s:14:\"RandomRedirect\";}s:14:\"Randomrootpage\";a:1:{i:0;s:14:\"RandomRootpage\";}s:13:\"Recentchanges\";a:1:{i:0;s:13:\"RecentChanges\";}s:19:\"Recentchangeslinked\";a:2:{i:0;s:19:\"RecentChangesLinked\";i:1;s:14:\"RelatedChanges\";}s:8:\"Redirect\";a:1:{i:0;s:8:\"Redirect\";}s:17:\"RemoveCredentials\";a:1:{i:0;s:17:\"RemoveCredentials\";}s:11:\"ResetTokens\";a:1:{i:0;s:11:\"ResetTokens\";}s:14:\"Revisiondelete\";a:1:{i:0;s:14:\"RevisionDelete\";}s:7:\"RunJobs\";a:1:{i:0;s:7:\"RunJobs\";}s:6:\"Search\";a:1:{i:0;s:6:\"Search\";}s:10:\"Shortpages\";a:1:{i:0;s:10:\"ShortPages\";}s:12:\"Specialpages\";a:1:{i:0;s:12:\"SpecialPages\";}s:10:\"Statistics\";a:1:{i:0;s:10:\"Statistics\";}s:4:\"Tags\";a:1:{i:0;s:4:\"Tags\";}s:18:\"TrackingCategories\";a:1:{i:0;s:18:\"TrackingCategories\";}s:7:\"Unblock\";a:1:{i:0;s:7:\"Unblock\";}s:23:\"Uncategorizedcategories\";a:1:{i:0;s:23:\"UncategorizedCategories\";}s:19:\"Uncategorizedimages\";a:2:{i:0;s:18:\"UncategorizedFiles\";i:1;s:19:\"UncategorizedImages\";}s:18:\"Uncategorizedpages\";a:1:{i:0;s:18:\"UncategorizedPages\";}s:22:\"Uncategorizedtemplates\";a:1:{i:0;s:22:\"UncategorizedTemplates\";}s:8:\"Undelete\";a:1:{i:0;s:8:\"Undelete\";}s:14:\"UnlinkAccounts\";a:1:{i:0;s:14:\"UnlinkAccounts\";}s:8:\"Unlockdb\";a:1:{i:0;s:8:\"UnlockDB\";}s:16:\"Unusedcategories\";a:1:{i:0;s:16:\"UnusedCategories\";}s:12:\"Unusedimages\";a:2:{i:0;s:11:\"UnusedFiles\";i:1;s:12:\"UnusedImages\";}s:15:\"Unusedtemplates\";a:1:{i:0;s:15:\"UnusedTemplates\";}s:14:\"Unwatchedpages\";a:1:{i:0;s:14:\"UnwatchedPages\";}s:6:\"Upload\";a:1:{i:0;s:6:\"Upload\";}s:11:\"UploadStash\";a:1:{i:0;s:11:\"UploadStash\";}s:9:\"Userlogin\";a:2:{i:0;s:9:\"UserLogin\";i:1;s:5:\"Login\";}s:10:\"Userlogout\";a:2:{i:0;s:10:\"UserLogout\";i:1;s:6:\"Logout\";}s:10:\"Userrights\";a:3:{i:0;s:10:\"UserRights\";i:1;s:9:\"MakeSysop\";i:2;s:7:\"MakeBot\";}s:7:\"Version\";a:1:{i:0;s:7:\"Version\";}s:16:\"Wantedcategories\";a:1:{i:0;s:16:\"WantedCategories\";}s:11:\"Wantedfiles\";a:1:{i:0;s:11:\"WantedFiles\";}s:11:\"Wantedpages\";a:2:{i:0;s:11:\"WantedPages\";i:1;s:11:\"BrokenLinks\";}s:15:\"Wantedtemplates\";a:1:{i:0;s:15:\"WantedTemplates\";}s:9:\"Watchlist\";a:1:{i:0;s:9:\"Watchlist\";}s:13:\"Whatlinkshere\";a:1:{i:0;s:13:\"WhatLinksHere\";}s:16:\"Withoutinterwiki\";a:1:{i:0;s:16:\"WithoutInterwiki\";}}');
/*!40000 ALTER TABLE `l10n_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langlinks`
--

DROP TABLE IF EXISTS `langlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langlinks` (
  `ll_from` int(10) unsigned NOT NULL DEFAULT '0',
  `ll_lang` varbinary(20) NOT NULL DEFAULT '',
  `ll_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langlinks`
--

LOCK TABLES `langlinks` WRITE;
/*!40000 ALTER TABLE `langlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `langlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_search`
--

DROP TABLE IF EXISTS `log_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varbinary(255) NOT NULL,
  `ls_log_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ls_field`,`ls_value`,`ls_log_id`),
  KEY `ls_log_id` (`ls_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_search`
--

LOCK TABLES `log_search` WRITE;
/*!40000 ALTER TABLE `log_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varbinary(32) NOT NULL DEFAULT '',
  `log_action` varbinary(32) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_user` int(10) unsigned NOT NULL DEFAULT '0',
  `log_user_text` varbinary(255) NOT NULL DEFAULT '',
  `log_namespace` int(11) NOT NULL DEFAULT '0',
  `log_title` varbinary(255) NOT NULL DEFAULT '',
  `log_page` int(10) unsigned DEFAULT NULL,
  `log_comment` varbinary(767) NOT NULL DEFAULT '',
  `log_comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`),
  KEY `log_user_type_time` (`log_user`,`log_type`,`log_timestamp`),
  KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  KEY `type_action` (`log_type`,`log_action`,`log_timestamp`),
  KEY `log_user_text_type_time` (`log_user_text`,`log_type`,`log_timestamp`),
  KEY `log_user_text_time` (`log_user_text`,`log_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_deps`
--

DROP TABLE IF EXISTS `module_deps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL,
  PRIMARY KEY (`md_module`,`md_skin`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_deps`
--

LOCK TABLES `module_deps` WRITE;
/*!40000 ALTER TABLE `module_deps` DISABLE KEYS */;
INSERT INTO `module_deps` VALUES ('mediawiki.legacy.shared','vector|en','[\"resources/src/mediawiki.legacy/images/ajax-loader.gif\",\"resources/src/mediawiki.legacy/images/spinner.gif\"]'),('mediawiki.skinning.interface','vector|en','[\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.svg\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.svg\"]'),('skins.vector.styles','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.animation.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.mixins.rotation.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"skins/Vector/components/common.less\",\"skins/Vector/components/externalLinks.less\",\"skins/Vector/components/footer.less\",\"skins/Vector/components/navigation.less\",\"skins/Vector/components/personalMenu.less\",\"skins/Vector/components/search.less\",\"skins/Vector/components/tabs.less\",\"skins/Vector/components/watchstar.less\",\"skins/Vector/images/arrow-down-focus-icon.png\",\"skins/Vector/images/arrow-down-focus-icon.svg\",\"skins/Vector/images/arrow-down-icon.png\",\"skins/Vector/images/arrow-down-icon.svg\",\"skins/Vector/images/bullet-icon.png\",\"skins/Vector/images/bullet-icon.svg\",\"skins/Vector/images/external-link-ltr-icon.png\",\"skins/Vector/images/external-link-ltr-icon.svg\",\"skins/Vector/images/page-fade.png\",\"skins/Vector/images/portal-break.png\",\"skins/Vector/images/search-fade.png\",\"skins/Vector/images/search-ltr.png\",\"skins/Vector/images/search-ltr.svg\",\"skins/Vector/images/tab-break.png\",\"skins/Vector/images/tab-current-fade.png\",\"skins/Vector/images/tab-normal-fade.png\",\"skins/Vector/images/unwatch-icon-hl.png\",\"skins/Vector/images/unwatch-icon-hl.svg\",\"skins/Vector/images/unwatch-icon.png\",\"skins/Vector/images/unwatch-icon.svg\",\"skins/Vector/images/user-icon.png\",\"skins/Vector/images/user-icon.svg\",\"skins/Vector/images/watch-icon-hl.png\",\"skins/Vector/images/watch-icon-hl.svg\",\"skins/Vector/images/watch-icon-loading.png\",\"skins/Vector/images/watch-icon-loading.svg\",\"skins/Vector/images/watch-icon.png\",\"skins/Vector/images/watch-icon.svg\",\"skins/Vector/screen-hd.less\",\"skins/Vector/screen.less\",\"skins/Vector/variables.less\"]');
/*!40000 ALTER TABLE `module_deps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectcache`
--

DROP TABLE IF EXISTS `objectcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob,
  `exptime` datetime DEFAULT NULL,
  PRIMARY KEY (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectcache`
--

LOCK TABLES `objectcache` WRITE;
/*!40000 ALTER TABLE `objectcache` DISABLE KEYS */;
INSERT INTO `objectcache` VALUES ('global:LESS:/var/www/html/skins/Vector/screen-hd.less:511711247b38d5ed3ee96dee4d3bf89a','��ێ�0��}��L�5�{?�L�B:(1�w�ݍqcvoz���ϩ����e	sP�i��ިO4c�����YUbi�n�Ŋ��;e��.�6z������E]WJu�kra�՘�8Ʈ�\0֒�ŰM2�d{Y��me鼮�~D�o�[K���px`ѷ�z���Y�KM���eFBg�a)�M�؀�{��/:�O�`�ߋ�]��W$\n�By$ƏX&q��i��ص���X�G��	�PH��!y!(�����+���7Ț��Z����PO��R�Iy�\07�wJ� ƽ�(��,�ijL�Y�E��졌��','2018-01-15 03:57:05'),('global:LESS:/var/www/html/skins/Vector/screen.less:511711247b38d5ed3ee96dee4d3bf89a','�ks۸�s�+Pg:�SQ�$K��6sw�$�i.�$�u:әDBj���e�\'���x�	����R�a�\0v���>\0��hv\'��@��r6�G����7d\"%2H���6�����ً#��oH����K\"�\"�B���YD<IXHh���x@�hCxLR~�̼Lx[dD�,�VK;~�x����!\0X�lI~���b�b1`�Dp݇�8�ےKC⒱��U�����&��~%Yʃk�	B��D\\.T��<��F���+d$��#bA�l���XK��>`bd%d�����t.�b�,����o&D�Ѧ�I��%~��|�x|�8��\'ɖ4#+z\r�%4�Ezm`��Cx�Q$�Ё���^��+\\���x��\"��E�9&��H*�rɁ�Ez��_��r\"�W�H5�8�9(�l�\0�p�e�$\"���\0�\'�9	(�N}3�?����F����͗/����G��?��O�~���Ǐ��O_>���/_�q�j��}������\r(:�� Q\nP.5�#g^�%�3,1^,�)�µ����C~aK_�b�����@ަt����w���#�����fd��zy�]���paT�%C\r��$!����$4�w���+mfD�Xz �|�@ps\Z\\_�\"�C/�Hg��b����\Z`�6�����q��~BS)x�`\n��z�V�`�}2T?�$�)0�|F�,E�����LN\\�\0�~i�R�Z&��v�\0s��]��\n�=�\'NnA#�gt\ZN�/�FO�P�li(~e�Sr�{iM��\\>�����A+O+S&|E�ة�lhg����-��0J���pXʇ]��x�ߒ|�Ҍ��y�<����_1	̢\"˼B~��R|<�0�v8�쭋\n,�h�#H \r��]��$��>EÜ�D�T���<3ЫL����2F�MG�s�x4��ڞ��Pr�d׎����k�nW���^����v�+�j�-w&��T3l�j�����_��W�<��/f�\r��j�CMق��}\n:�b!�k~���v�#�v*@3X��v0��|A��X	�)�z>↥�a=#7\\r��u��C��\0B�iw�!ۓ��I���鸰ob��f#�̶B�\r�gڜ����ږ �\r]�}Ey\"�IQ�+e87�����[ �{\"j�����A�>��F�*Ȃ��NZ�gMA��D�($5p<^��e����: ���A]���\n�!s��#���]\'��\Z�U���Q��V,h�����<��M��6��E�!ʁ�C��$e�e�uK]}��\0����[�����A�ѿ%`~���ރ$\"�Ԧ���}�m0��S���H3��|�E���w�\r� 2& <@GL�\n�B~�WO?�uU����<2B&��Sz�&v@��e�Ay3d�l5#���it�\\5ȳy\Z��d�����is�����;���]��r��%�|Ta�2�K��O� ���9������tj�e�8�1�Q@0�ܪ �CF��7�װ�)�L\'v+a�Ԓ>��L�]��X>C�&b\Z�!��دu�	����L�O��F�SM�߯l(?륭l	����A�h:_����?���-�_��*5�*�D�ڧK|t_���W������X�َ�sD�%$WB�}�����v0,Ydct��z�F��)([���amYmO�<3�Ʉj��&f�߃@*q�;�m!���y���J=��o�f`T��JJ\0=��8��G3篿��!��/J@~c 4E�t���@;�r\n-�yA*��LF�����\'6�@��y��e��\\���8��z\ZI���Z!��FU��U~��kMS�\"<�L�W��i��j��\n��F�	�\0\\;�ѐ�1ă�+d0�\Z�%��c0%(�W@5��I���acE�%46����ǂ�!.��F�/w{+Ean�Jaue�\r[	�i9\n��m�j3W���#����H��AƋQ�np��8��������nbj�V2��5F��nCuGB���<Y\\�9h��W���$�*��R�*��a���J\"��\\�6�D���1<��пY����\'��n4Y\0�h��x��k!�]�&��0��>���؝�?bnp�|>)�\"�/?�\r�N�1�֓&:a���g��j����l�[�;m�^5p�B�4;��p��Z����w�\\����YMۓ��3(�陽/0[)2^o����:�;�#���|�[y1�\Z��y�V��	���5�\0a�����[p����3�-D��\n͇�|���Y�j�<л�-!�aiݰ��i�ll���{;po%.\0�?8�r�����C��F�a�z��82@Q��y�����l�Q&���%�3�֤�:��H��eg�R�X�;X�k4�	A.=,g\"�F0k[T��y�=!�5�Т(�%�\r*cn��������K�)6���a��W,e��`���о�E�����	\n�1^_�}PeEY\0���E�����������s�kVgh�vE��f3�p��F�\0�c;�L��y�I)�C)3�v�U.&�T��={���_a볕E\n�� �DE�*�K�R@	��l-1\'EÞ�4��#Xs��t��ʀ�*@�RBu��?�~�\r�:gQ��Q�o��+�W�\r�R��M�ӆ�G4a5gh�<3����^�XKSu����F(�X��:3���srֆ=PJ��\0>��E6��3�P�m�Z���E��Y�Wi�6GM�fS��rު(a�SV0U��@����ʱ\n�����)��	kh;�Է]a���c�bi�O��[��\0�33�^�WvY�Qg�s�|��\'0�-��`�h��a�U�0U�=:_�/��5:3���\0w��Zl�᤻luo(?���J���y$p\':s�F.���YcU�]�\'ѯ�e=�P�(����\"ڝ��i��1�r����23�)�>��j���f{�g�p=�~��?�t�U׵Us�Mϫ��m�H{q�� M9�3���hjw5��W�N����6�W�|`\'�U�~�E�0�`��W�C�#M\0���A����Sj��j�5;�E-�kz-ϲ����D�MI�dM�k��\"m�k�js��W�۹�q/@��4��B����b�D�(��>s*�\r^a����p�ߪ\\aU\0�f�J3>5�+H��������%�T��rw^��[�BE�e۱M��!���FT��	� 6(��Խn=��!�M|��$����G����p�hįb�vb�\"����NkC�`�/���X����&\0h\0Q��5���3[��Z���hVa#�*�Vb�;������z�S���R�x�o�$<���gd�4eoŭc�ͣ�ѭNB�x�r|��qq����4.Ρۃ&ژb��8�F��i����&2:�K�}��ܮc�>�.���Ow���f�SN:��Mߎ@��z�@�Q�߷��m�l����j��:��W+���H֞)��r��-hhU��~���p�6�T�fIp��x³:���<���3���ٕ���	Umk�-���V��h�a����������s��L���=֩wu��&��M@�\\���MO=�>�U��<�1��+u[k�CV)7��L��Q�>�9.^U�Q�8�a0|��\r�IquɚrB�]�RRE�u���p��\0�D_4j�n��x��bU\\�s`�1��n��Ζ�c�c���!uI��r��R��_��e���]�*sj�T���ޓ��	8��ou��K���;�r�̠\'d����|lͬ8���ʍC1��^O^��k�j�����@W<)�\'I\nQ��?�<�)��rt���+�3L.t0Y?nV�K&|�Q���<v���˨ڽ1���������t\ZOU�-�έ3^פ�	��S8=�f\\��|����s���\n&я�O\\�@0o���<{FG�ðɀ��ޜJV���>Kp�:�u����r��^`91wV&�%��d�H(�-s�a�r�Q5[Z$M}kށv*��B�����f@OG����M���Z0g׳xO�̀�ܲ�Ӏ%�\n �\n���� ��@���1~?��z)j5g�u��X��d��C�;ə�UP&m�=|o������cI���#���\\�E��!|Ӄ>MP�Z�#�\\��R�{�\Z�%Q���u/������{_�	�K�O����Lݘ���l,̕7��Rp�zA�:���\Z_|E�\\]O)�\"ʉ��gT�H</�d<��Xy�bm�\0_Ĩ��q�fv�B�S}׊g��%�.�X�%�t��\\����ۋ�^��hb���x�A���[d�o��S%����e-�h�%T���\\�z�x�n�]U\0g4\'�6ζ�;��k�=����z�9=�fGc�ԣ�?��]=iY�=�K=32�?�fo�z�Ü��\"f��kW3u���i7����[��e��VLͩ{.Q]��ƅ9�_�;ڷ\'�$B�N}�����.��W�˛q�rfGݳq}[�S�l���ͪ%b�hƏ��{�N��Bp@)\\�9�\Z��{��\\ �������]x�%sߠ�E��\0Vy��H�����Z�?�Y;���f��~n�h[>�ܯ�2`7Ȯ��5��IU�.�:�#��\Z���Z��r��n׷���\n���6|#�[��uuo\Z��5\r�6\Z��B]�����V���\"[:�K?n�USJs}�Zr܊-^��>��vИV*�.�	\'ҍ��h�A%�{ �xA?�����)�>d�=�c��1^>x�l�GI��a��H������x�#&�_���|v�g><��nhz�^�ϰ$y���g��~g:�Їa0��0�|�u�\r��Y��0h�7A4!�4��\"ipV�EGU���q�d\\n%�̃��3y�_�W>����{��ⷀ��5F���%�\n\00��}݂:�bALb��)S����}�U�b�%�>�w�JrɌ��,��M[�;l!tj������\\�\"kY��em;��(��ɾ���\0����g�K*���#�O��p|9]\\N�Sz>���`>�p0Z�a�','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-css:7:02c3bb73736ab6cc0e99a3a66e35d321','�Z_��(�*��ښ��ē���I��U�W���y�6�Y�a�����86�N�L�K�%�!	! �������[|�,S)4zɵj��)�j&���oV���@vQ\\3M�g�F��j�(Y .U�\'�7	@��g��~f@�OSSř(�F�Tft����9�Y��*ۄ��I�Fd�<����c��Z��(�$��X]qr=0p\0�eZB����V��Ou�����c�3�Fk)��5\rs��-��0�������^##����},c��$�f������\\���6�*�j�H�����^�>ivLU��\nʫ��uSUR�:�l�^f4������\r��}i~���#���ꊈ8��3_�C.k}���4�,=\"�/��m�jɉ���gv�D�Υ:/��<!j�p��z$�uݦ�u\0�\n�ڂ�S��M�\n�a�ρ�{N\Z�B�σK��1\'gƯ��f������#��k\"�%�<ˑ��ħ�V�j0XyI��\\눴w����P5#/$�F�9we�S�����T�eϜt�����z*n��i����\'����ˊh%9��5N�����8&�g�1�����K�K�T��co����\'�z��dzÚ͌58I(o��#F���yfY�i纸,�u�4�}�K.a��R@\\�H\0�^��iya������d� �G�.�s��ʸa��T�LN���6��I���>�=y��~H�6��(T+�5E\rR����	H+�2&N��!��2!��K��\'L���YF�`�Ӂ����h?����7{z>���L�&ZHH,�Ȇ<\'�A�xm�#o\n�*6�ߤIЁk�6��sș�٤�Yۃ�AWS=`��F�xGQ��L���^��b	���{���\"��	D�����0�MY�3k)�m0ۥ�Ӷ)�[�ϫ�5�F����ҋI&�R���	i&�1$�1�]d�(q!J��E(O�5���7k��k���Fg8�����\r�%� �[��@ě�C��G�����|i̿�!���\\S\01���抋�����,a����q�|�D!iZ���wM���\n,��.gQ(�����k	Y٪�FiMyn��\Z�(`��I�w�^�C �B�jo����s]	�Z/t���6f�C�A��b�-7��Q�mbv���>�z�}��<�sM67�s�sE!���}��*\\~�fMN�+����[���9�m���斷�6g�!>�n}΁~�T5=�>�`��l4�X�k�fZ�x��ؚ�w5�o�T�=��r�\n3v����j&��@��s�}b��T���pLjҔ�~��\r@u��W��:\r	p�7Ki�Eϖm���{�g�{a�zC;z�3��C�\rgv����?��<\Z������%GU��`�� !ܩ�6��0����ҋe�\"H�O�Ǚ�B薎��@��C��n��9�,_g��7��oS��)ϒ9}�:ϲ��g\"���-)ϟr��S0���֤&KB�v�%|�m��	��X�/,��a����æ��+����q+�`�`�e?��0	�Η�*Wz2ذ�>l�x�q���RtC���ЩϖD�>��\\Hl�(��F�����C�~tS��W�Kñg�D1���yyJ�m�O�\0\r_L��P��So�t�u�f\Z�\'�����Ӯ�y\\\"?�W��5��;�ʏ���n�΂��h�e*�e���ִ=�S��)+��Sx��K2�?-�>�/�]�f?r���Q��WEk�(�V_k�~=C1M�sz\"������z8����?���?sU�(S���2r�|	E+J��K�5�v�h�(\'�H;jY���Τ>�N�L���JQTka�Z���y���9��q���9C)X�a���U�e1��O%P�GJ�*|���T�|�D�%\Z���uEA�P�\"���TQ�Fm\ZS0D��&�಺�`Sn1������� 7l�C�Q���`m1�������0�8��\"�@(��E�Q;D�������-�v��#�Q7�ͨD3*ьJ4�ͨD�.��K����D�v+i�����zDԀ��B(\n�(����\\��\\��䤞�ar��GLޠ\\��\"j��=�5�\\0��\\0�#]|(��,��%��Dv���.�m�C�Q��\ZP��+d�\n�B6���k�K�t��.5ҥF�h���F(\Z�h��ܭ��5r�F���P���)�-ž%ї����I�4�D��89	\'^��\\E��\n���[�9�9����>wUTՌ���v�������`�-K���t�q��b�-樀a��]2�B9�&\Z�M��f�Ğz�r	\'§�=����ؕL0,�{�2�������\'��C���������x�?���y�9��N�&t�#o��X�����g�6�ܙ�;&�����v�AӅ��c_�]��m�q�@�Vx0��K��9ᐴ����4M뺿xX!���F dX���7����� co��2m���A^]�Gmcka>�5�#�e��诅��.z��f�����u�w6ޢu���T�E�;���<��]훨��9W��w��5Mp�w�w���R�Cq��й����/~�hҜ��yP�$�䍦�7{��zx~~�P;O`-l5a�O@���./4)��i8�Sf��pȀ^rVR������b!����]^���kTg�`�X����]�M^X�\rt��J�0��P��uQ�T��Ipu��v�?','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-css:7:13d1b02022618f2882241f315bd6019f','+�26�R��-��HML���K�M�K��/�N�,.�I�����K�U�\0','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-css:7:24eebb4ea47c8d2b26bcd1c818c0ef5f','���\n� D�ĵRC�1_sSoT��JJ��{�(͢��̜3Y��I����:H�xjq-�sts)�W��qBw��\'wi6��P0��w�^\"x��]��秇D��U4�(�<��3�a3\n�	�p��)�~q�O#H�@�#4�','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-css:7:25ee38db4cb517940ba317c606acbd08','�<S�H�E�)j�Œ��^v�݁y����l}UW�4���d���_��ޒ1����*��5��������}Y�u���$��K7>�H_ōG��B�~9!�x����Ԋ�^�3�q�`O��kM=��[A��$��G�td�7�(�o�~�߸\Z~9a��JG�YQzM-3��Z\ZӿA������\"b\'^��$z��.��O\\D�q�0rHԗfw\\��ý�tGw�+�#&��d��R\0I8���&��M�N��		��<yY�ͯ�^0����/ �v~�\'!�a��goJ�_;�tJ��ꂒ�\'I8틂��p�	�2n}�\n�o�k��lC��b���h5!O]Q,��n�\'��(�K�Kn���2���׋��=���K.�%�뇋��{#��*8�m%a/����)#�fQ�����r�0�(�Fķ�\Z��K+�X:^<���P�#?�o!��4�{��>�e���Hf�\rp�lYn� z��Zs-��%���X9�� \Zk�(-3�k�S[�e���DA)���`���6�*����5k�`،B�ii���U���k{��6м�Z`\r+�eU�xI�r���}�,W5v�[�Lg��I%>IrVB��sɽO��~F�PnJ���\Z��<����X�է�n|;~w[ن2�P�����6�mȲ$��͑�q61���o�/T�Pv7�-h08h�Xa�$�~��X,��\"�\0�ʢ(b?�\\���`Z��1Z��^�.l/�}��wX$��}�	�%�R���>&7dEUٰṛ�����/���@%�̂1�1�z�r��l!~��[�wt~1ٽ��M��gg����Ō������i����n���vbb�����uuһ^D���>�����vrpp~4t�>���;[��?::�v��֮����|~:7��3W ߍo� �^S�Q��������=`]��O�H��@���YD(/�,��R���Ƚ�H��ĳɲ\"iጟ������\Z�\n1O� �(\"�؇���$���.��09�i29ͭ�be]���j������\n[\r��R:��Č2eh�����3�F��5Cj%�V���`�\\���>���䠗���Ԃ0}�(\\�	�Y��\"����	bE�8�-D��$Q�(<wJϛ��ʓy�6�Ɇ,�?=��P��\\l9��w�W���;�w���}����=B���gh>����X\Z\"��$8�S�/�OS6y&�{��f<S��j�; �M{e�4�.-�ձ�8�����1�\\>J2�Q���h,��#��A�DN�9V��m�V������\Z5�>eX�bx喔�4��IY����R��$�T`:�����̓\0�ZCI�*$zPs��ʋ���=P�m�2�!,Qg�m��Up/�_]e4�&=S�Ua�e��ci���T��\rj���#��\"�R��49�	��CeMJ�V\"#��M��1�$TY�\n��$H�R��a��u\r���k�c	��F%�P.�=�}M|�b]0U��!�������i�=4�tJ/Hj�Ѕ!�\0ЅDMyOg㡲���@�R�f\n^54�GS=:���e��!��S�Jtt�d5E<O2�3�)����j��Gzhr֥��%m�cx�?U�X�����	����>���7o:m�\n&�+�>5Ӂ��C����\'˖�\'�;KO�A�c޴�{2ӧ�#�p\Zp�����x|���9`v><�m�-���+Pqu�v��s��r�h�)�^0�\'�|��l�=躠sLg>9g$�*�M4�eiBon\nPX���J�@JK	;��F44�Dh��C� �ӄ9L�u�Ʋ��;B���ɕߢu���)�:��v����]��?���b���h��+WN@����e�s������r���gL���|��#�fn8�Pw�������Z���e����Ѕ���>�sЦ�\0�9��M͆��w\rN��N�|9?6(^Zҥ�i�~��?�=�<��\\�\Z��g�_�.)}��Pq�\r8��э�4@L�]�z��\'軡=���<Ai�_�n���D���b��Lc�rF9�B�ݽ�/��O���������j���I:a�q�Fu����\\��y���-(xs?�_׸�|�M쾽�s�H�5VY��a�mLt����,��?� !�,\'j~�S&��(�؀�v�k�i�5����|��n�UL���L���y�çd����(�1\'QxC��2��2S=U��S����jmj���nr�K>�u�֜H%R�@*U��_�M��Tɵ����M�}9��;���k�p�sԳxKq�+�ၩ�W��t��T1�~J�<Uj��䔺�N��evy<��`�a����n���	w����-��F\nz����c���]+��>Q���ow�b��]p?�������K��݉�*�/�{���u�Ob��QD�:����V�>�-�J�)�:U�bF���\\����B�����s.��K��plF�v�5g}��	l�C��i�9un1;�|��ݾI���cQ���lb������֧Ӈ�H��s�n��qg�����/���p��k靬u\'�n��M��#�!�\'#{,u�v?=��.�������\'j��_\\�}T�_^<���_X&�m��7.��8is�6g�8���^	y��\'����ȧG�	q2��RUC5Z��ć4T���uJW����R�qg7[�G��v�t� �?��>���ۍ��N�n��3\'ˆ���=1�V��u�a��	U�m}M ���VG}�4�t{��\\�\n\0�^�Y�_���K��e��S-����Oo����y�[�݃�c��{�K����R�\r!�S��w2ޠ!4&��9�wy��}I��D���f��8m],��h�%��@)�gA��˩�Dm���O\\ǃ\r[˟%WaX�-�p�|UeM\'�*B��S]�饬��k��٠�6�L\"����iEQ���p�~G�]���-��\ZҪ��2�	���ʩ���<�}�Z�&~J���l~������R�y;3��z`s~�&��N�A�4L�\'�4�ǔ��pO�Յ&��1\'L�h��%�d#]�lU�nKȭl�#)�`y���ØQ0O��\'�����\\4Yo���&Si-�խ����H����	�5�w��4o/�lr>	]V���z/��)��ܮ����2tйc�Vp��q��>���Zs?)5�#Sm=zUM��w��?����|���E�}K�O��i�v+�Y�l+���בig�bE�	���c��\'T��㲽_��5�r�{3~%X�l�����L�ܻ�5%1�04�t�p���P����}V�Vt�xs@YtEY{�c��hO��JW<�`����H����-~,�Ğ���f�3ڎ�ۢ)d\r����R-(b���|�i���iD��a���M�_�_�\r�=۵��Qժ�\n�i�J-6��=1\n�H���b�!��Ƅ�٩(T����-�uݬֈ�\\7Zi��VRk#�ܢ[E�u@wR\Z٣!l�,�����POPMJ�{�T�ԋ������O\"⦘ ���q./�3��[�1)�ZP���$*���|�����\r�6��:b����$��=��U�����3G���j`3�6c�xVQ���70,Q�љ��T���Td箢���Y��q:��e�ؐhϗ5�D\Z��UN<g��5�/_�?׵�H���̢NK���틟��[���ʏʙ?w��;�����HVſ�,Y���XI��J�4;t{���*�?�&��d�U\\Ҳ�	~Hou7X3+�6�L��p{d�T��,u$���9��U��\0��Sa�\n�tQ�Ɯ�lp�cxR���>�\Z��gN��[<H��<���̅���7��1hx��0��C�T}c���e�ғ��J����N��֭7�c�K��G<��f\r�����;NjQ�/��z�-U�u��H���v�B_��)�s�d���.Ӳ�v���Q�{�3��|<�餽m������B��Rx�Z��\'�m`�q_	���YM+�R�����}��W�FoS�Q�xn�>�L��ԟ(-.K�G������)F%��YW}?���^���	���W��p�w�J�4QZ^?r����(�j@x��Kv^���a���d�$�Pd!,�(E�?�=B?�.N�y�T)^#}!\'�.G��FX5����E�+��Џ�ؐ��X(�\Z�kBM��S�p���떪�{���#n�\ri���lr���\"�x�ًi���֧���H�^=�s�>��]Ig��w0{/�ʗ���r.9���5����$�X�ڐ���|� �;k�t?��Uo�h���I�]�)<���)-xL?�k�S�g7�Њ#Q4j�DԻ�n�o���+�ւi�Ǯo�/�\'1(�|���\rC��7�U���)��Q}+Z�՜U����r\0WY�i��Ĭ$�E�2TJ�����*ϕWl��T;oʦ2��-�R��jȁ6J�WzrQ7QG�E��|q+!�cA�/r`$\n�^�M���>_�e����U8�Yu�n\Z0���|`gv��Նq=<L�\Z�k�S����^\'��*U0\r�R�|��eZ2�UA�TNz/I������ГuNLE��e�:�2�3���A�L�2��\r4�\r�8�	2$�^�nP���ڳ	��\nMD��\"���P\r��\n�_����hD��]V|�ː�G|S}?����&�d����Z��Z�/��','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-css:7:3cd6b4def1b3cb2091649ade824a13c6','�Wm��6�+��*w\'�ȾD�Q���~퇪Wl���]c¦��ޱM�[v�Z����g�A���}�����@i&L�0α�L��0�q)Xq��rfh���d�9�_m�VLCsäX�#�N�1+F��x1A0��G\r�\Z�()���Xa�%��چ�6\r.i��%okIt!��:R�	w6���H�s���؅�k �_�a�U���(x�.,���KuѬ��=s�Ùl�%kr�YM�=�2c����	Jv�������4d�\\z[�R�V�+�\"���F�$I�\Z�	��\n�D���孑�;V+�\rf�1☾@�s ă�ƴY?y�1 �K���qⵘ��f�-ŭ�`/�&\r5�\nL��V�N�[b�5R�uF��G�>�l��T���`�i�vR�(�����0��i�F�=�����ן�_����Oqn�1Wƨm#���:j{\re���:��CX=��SX=��q#=P�hL��B�,ق��Bj�����&;�:HR�!\ZU��!~H�V\rzL;Fd���2,X�j׎����T�l?s�D���\r(�T�I�3�0;��]�R�\Z��Ai?��$�����	n*JǾ���Õ�a�P�2iWYLjL>7w�?�V�e���\rM��fdQ����h���p\Z������Ś���������j�\n������LD�Iro*�!��q�aƜ����$7z���؄���LpqV�{����94��g�Dcŏ�o~����c|K�Y��W�t�5Xk~��a;��B\"�)�3�k�����3r�����փ�4�\\E	���6�um+��0��c�5X[�v^=�;.rt�s��H+	;�^����L�F������Ѣ%G���ڛ4��ls	��}�c6�\"]H%���~/ߩ�ϫ��][���fړn0\r̰���y�<���F\0f��C����]���A�s|��6�m4\0�,���C���a�����{Ƅ\0ww&@����Ƅ�\rz�9��̄x�D]���x<��,&���Z3\\�R/Cej��6�+��R��Y.��[(��`�}��v�	!��6H��YS�	6x���%u@��@����+����o�s0済���_��K\0$�S��=!w�|~S��LwH/�d]��K��U�m$Nܨ\'��6�ߖ�<�U�w&��ۭ\n>����	qچۻn�$���`�v�W:�p�v�^�\'U�V�Q�e~Z�����\0�y_z�������*��x��k���3.���>���L�x��O���(�G�\r>zsǻ�G~%�_!��','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-css:7:49f41e6329d9d1dd9c8b964966e6da01','��A\n�0E�R��)�!=�\'�\r�L�IZ���ZQP����0��j�*+I}�)tu�AP�����}NI\r4!�U��n¼�%�d1�ծ��6�5B��Xo�\np�<��|��1ĬU�̏���͹�k�#��dD㴇KB�-����4��u��*�9z�Fq��ypAFm�a}f=�e{','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-css:7:53a6e138b39d516ca1f494a9a1b44236','�<�r�8���k�H�>��}k�G�8>c;�zU[	J�)RKR�d��}\0�e�ٙ�V��D\\�F���n4��dI���/�� ׷�ĉ\nW�t��(L��@=I�q^g�����qJr�;�aO�Om���<�v�=�e/�ÄOP�{����v�Fq4]މ�(��t�y&s��S;N\"�%�UUB�~K[���R2��~��ԏ�^���E���1���EqO�.�$\n|�{c��YY�A�s�M�0��y\ZM{<4)�rc��?Za�´=O^�����g���8�C�k��CA6<}�\'(��C�����I.(9&�(M�IOd\rSP�E����-wks�m8>],�����I�k����]�$�5�2S�Z�|���u�D�����q��G6&�*�G�D�޽���\01���]߱�(NVP�N{��j��˾D�4��E�O86F���������EOZ�����i`/{~H��ȹ�?D�R�������W��6�c$6�q����@���ZZՙE%1Do��lb0\Z�(-��i-y��N�;QP���՗/�\"�\r�� ��cM��)6�(p[\Z>h5qި�&��x��@j\0։y���4�B�SK��֭R׿�d�.Ϣ8\rPZpy���PH��������3�����,���ک�#�nr?z���kKl)���2N\0�߶dYD��P�Dx\"q���ބ_����o�;�`p�2Lp�q�N{��|>�\0R�+������*�%�C6��p��)VH/Y�;�.�R�Y�E1S��A��[�\"��l:��-@TH��v�0䙆#�[���z��b.~<E;�wry5޿\Z��+�������홇3vË������|��sf*7�����������͙z;����s�G��������d�|�&�_�v��`xrt8�.q���������|2ls�o���M��0�^GEq��\'��,\0��}�ZF�H�<�����1\"�s�jk����$J}�*��M�)Lh�A)7�!���3��%���HKX),,*<͖��7�Ӥɭ+^�fS\Z���JD_��n�g����#���\Z�1P�O���љ��zM���)���	��3Xů�\"NX�.FS��Q�Ėm�\0�W9��\"i�v�9���vt�no�����a��;��\"��kH�-Y�;|�z��a�rv�{|4��������}��.�9��nw��l�7�@��$]��ŕ�!�P�7uY���iJ$�ŉc{����g�6R��\0\"޵W�,��rRW���,�1f�UHEI�5X�(��Ns�}4ߍ($N�$�����6ha|9ɸV��\\�& �#�k�8\0^�G,��v:f��A�pS��$X\nL�@tMwxPk 	��AB��E�4^,���^�d�A�`ш�5I#I6ȯ�w\0�kh�&�D�tR�>)\r��\rZW�L�6e�-�H�H+��KQ���X$Ӏʺ��5DƨJxG����X\"���� ,]��!e��&����)d�:�X0�=����ʫ���Pl�Fu�x!��kE�v�u�Ћ��2taJ2�t�QWޓ�x��y�&�D(��V^�(tC%)�̣�+YPu��&�\Z�P�L���e�I�w6�B?���\0	xL]λT2�d�\n����+�zC���\"��|!Z�b4����O����a����9,�%��3^5��|�d��l��6F[��&5t\Z1�P�	�i�\0ނ��a���Ԛ��~��c��b�>w\n�������B-/�\'�2��Y�*���&��x@�Ec2\r�%%HuLn�����$d�~ޟ\0��dZ�yai�g��p?��H����nl�zd4�N�yc�v�d����ӾQ�T���_�T�����zLr?\\au��������׹݋N���ru�(O�_\'{��On�G�޿GH�>��=!z�+m?��0\Z�~��e�]tr�XqY���mP*�m*\rЙ#�Ti��h�A�qJ�+��Aqf133����Dz�8oE�Ż%��ߌ�\')�Z���+~\n�$@�K�\"�|�����ș%�h�b)�ۀl���D���Bq�l`F���#���tٓ6\0�\'�w������w�{5�{�$��lŸȉb��\0^���\\��Y���-(v� M^׸�|�M쾻�s�@�\Z���ܔ̷*�Y��3�.�M#?LQ��(�3����ۊ�W[�M��==�Ջ(tK�by��g�e5�΋\\;�ɲƓ�F\\����ʤ.��tS��֏�m�Qe3�Tu��oC\nxP�s}��.b�E�����e�T�����\'�`ya����S�N����[�=���ϰ�\Z�j1��fE&���Sef�*3�E��3v.枱��1�2G;��w��/�/(�;8�Qv�����݋S�\n�<;��=S������~�.\\�&ѻ���ΰ¯��Ӆ�?<������ ���N�I�!?��}G�P�\\u��C���t�ҍS5!���L͂�� ��>����s*��J��ptB7-���a/#3{m���\r�-v��?�oRw�2����DTp�i>�����b���Þ{�u�����ܛ�{�{Ȟa�]y��Vz\'��q��=�Rt���x���Iݯ����w����|0�=���\"�Wק��ף�Od������8���+3�F�<�����ኹZ���,���Κ|r��\"7�7mM35�J�HC��8�;�da�_������|��;Ga�it�]|�m�L�p�@[��f9q�l���\'�J���N<�@��Rym��0����V�|�3���\" ���K\\�oE��90h^n��f�u]�~>���.��\n��c�s�x�ƿ�UX!�6�\'gr�O�\\Z[��f��u��	��U�bZ�XlSx��H<����($�+��cd���$0���\'�mb����ْ�d���\"wJ7p��WU�l�����iM�e��d��\\����`���P%/ ��ќw�yX��]C�����v��j4k�&ʜ.�\"X�\Z��^���C-|°��1���&��&�`h,79�!?o?Ƭz�=��~�gm��n����{��c���pO�ՅNN�T#��V�#��Dt��u!�-���m\r�<x���N\0cƂy�>ۀ~O$GK�_����~+v�G���\"k�(�����ϝ=rm��1va�TKI�A;�r�K�<�0�0\"�4\\[�6�&�΂���3�ݪrڷ�>�]�ٳ eZ��v`�mF���4;_�㗇I��Aߪ���>��gu�ͦf�ͦ�s8޽����M���@8Ź�	%��l�w��\rZoƴ��mQ���{ܡ���pqCC+/�&š�X��GKߊ.\Zm�	��)k�~L��@�)�y麂Gn�?1���A�ql~���g���b3ڎ��b%d�(�}A��<��ž�A5�l�4\";Z�/좃��D�zUְܫ=��U�za`yf��վ`K���aF�,N�.*&8�\"�\"=Ye���L\'sd�z^���\Z�\0�F+�>�Jjm�-�U�[����F���-iR�������Y�XK�T�2ʨ�!�������0�4�rƹ\n���$ʺ�[�ix� Ւ��k\n����SUd�ǩ�*��m�*�a�1l2�+�`*.P5��$^dӠ�y�5xZ7�I3\n���*�40�7T`tV��p��+���٪(��n�*��8]|Ͳ~lȳ�K�\Z@$\rU�G��Y�\r�+��u�,Ҳ?Q{��R@��m�����Q\rY�Q9���s��w0�ʚ�W�%�Wvcc�ɫ�I�COu�V��7��&c�㒖}N\"�rv�5�ocά1��v��O5���PW�0���J7BuzL� �!����Cχ\rq�~��}V�gV+��sk�\'�g~W��\0�n�|�[���ox��(��{WЌ������J�\Z�z�Jߋ���о�Gd������;����#����B9_\Z�|�Az.ò\\I7���N�U\'-��Q��F:����X�@��X<V���;ف�6��x:Yo�m����X�U��J���\rf�W¨7V��Q�c�Y�SϺ�ꯕ�k_J�`c3���������||��c���շ!c�}.�Q����+=���i\Z]и�:H��Z���\r �u]�ˇ���Y�k�8*�\Z�.N�.��W巉��C\ZqQD<�{�A1O��߰#�<1��E:�X{S�/yU��[Ш^��M_��h	�ޥBp��_�j�8�Z�~l\\�T�ϣ��AJG4Rh@�*w������\'�w�n�/		RZ�|:�����̓9�Ԗ���F�������{�\\��}0�óK�==D�	Ҥd`�dK�6��7:�g�t?��uw=�����y�p\n��l{�<N?�k��c�g7�ɊCQ4k���;vA7旡bqA�F0m�lhQ,�\'1`�d� �(�׼��rZUΐA�>{�Y	�ՌU����ȭ��+ �{�^��T��2n.�%\ns�z���j��M���:~o��gX9���:Q�q%�D��#��$�hиP�/n-D\\�\Z&F������ts���_��\'�on��eE�ܿ�g,?;t�\0���,�j[�	&Wm�\r&�H_��o�6�&�cM�L�Z�|��1��ך`�\Z\'���{MP�cKPe�3K1|��D��q��Y`I���2M0�Mle��y�\n2$5U��Т��l���AQTA�6`��ڱ	p4A4�K�1\"x4���!+�eʸG|������v��2�7�k-�W��r�%�Ľ-�`֦��U�]��a���\\E�~����Ə���|��-�.g�FE���UUL�6��l��K�?','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-css:7:5aaa5ba9c926ed1a8e1db3041b5b8a8e','+�2��R��-�-������OϯNJL�N/�/�K���MLO�*-���/J-�/-JN-�O,.N-)�i�+�K�OI�H�ЬU�\0','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-css:7:5c7a7879b457640c0d82a3589e759dae','�W뎣6~w�jvW���D�Q���U�2�w��\Z&E�{�m�dfvU���͹�|߁?��C\"�6\\�%����&Jjr��<â�nY����=�\'���F�mXa���},�3����xa�����	[��-���Dk��چ��5\r9��\n%�Z�J�hW*e��� k���*�*����(��G�c�5��o����(c�:>�3/؉�φ+����H�Z��7� �f��j�s�N�unU;��܃�p��\ZP��w�:\Z�J�weYf�2x��iVs���&�ry���R��A?�Z+c����N���@$��I\Z��=�ݭT,�ǔ���\\{\Z�����M�[2rw�\n\0��I��g�v�[b��J�u�L�G|�>�!b���*�J�	�}��:eh�F������3D�gn�~p8��r���ݟ���2��Z����j��⎹�ùt��QuUQ�UOQu�q�pd�s��Iq�-�sV*���������Fi�bq���)�+\"��u����Qɏ�\0w��[�X�\n����l8��V�C�!�4;1`\"�%���	�P(���hf�-���E�xBB��W���2���YW9�j4p77{ SV)T���\r�iu�\0`V5Z\r��g�b{�7���\0�wG�r\"~�\Zn\nf+�O�W8���ã\rd�v����o���JV��HD�5�ėc?�7U�R��g��ZU@g�b�S<�S������(��.	!��|�/�Ġ��\0�`. �[v��W\"q��X�M�Ƃ�v���s:N�\'V���P���n�x]݉oM���>�m�0���݆e�O�_g�`Čk�`���5L\0\r��V���l���Ѥ[����Ye�p��\'����Ao�\n����Qċ��<�#�}_�	路P����a%���;ҁ\\=�1���Őp�p�~��\n\'cΞ�Z�\Z`P\r���s�p���V�cl����@�NGmC(o|�Y�gf�}\nT8\Z8�U\Z�����lf+ 2�2T�v��B+�vݱ,�o��y���\0�0�r��F?����t���5��K��q5�n��X!�]�0<-6�6~ѯh�r�tؿ^���T৊^{Bo<������*>�^�i�6U��jw�N�69��ir\00O�ˤ6a�@V�w3|F����:�yN^��0� ������5�X6������gU�7�q.T�i���e,&���ൢ\"_֕3\\r�S��a4�{?��[���WoE��U��\'|*i?�Gw~{3b�(���Ň�?','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-css:7:84dd5df6a06f038384cb8adb54070f3b','�X[��\r�+���i��N�I�,��Kw�>}�m9V#_*)����%e;�/���b�t^���H��HQ����ꇟ��ӄKƂҢ&��o�Nh\\\n�XY�EY�c\\�R�O�n����|�H�lC�G}���	���z�㋐�^��PT���I�hR�b\"�ݻ@\'�bWړSB^]$g啊	�2�șA��\nδ^N��g��e��g����0F�4X���8R]�޴W���VO�]Q�^A��)=KD\\�GZ��9��$���q��ɻ��B3�n�G�mv�CS����1�Xl��<`�����5�/7�e�*�p[�J��7A�0��m7,?���\"t��(�b�m�٩s�$�6��3�N�\n��G9��!��ۓ�^fNĉ���4��&�V���6�l�ʂU����u�9sLa\'���]�\"\'�.��Oyy3��Ǌ$	+N�*+P��N�J����+P[�z\"�Ȓ%g���Z�d4����&�MJ��0,���<fs���&��%0).��FT�����{���n�lr�U}��#`i�@$*c�O6^s&A�z��V�\r�/D�!��v���޽�����g��x��l��mg3�=�9Q�ԍ�E�^quT9��/��8M���%�����L�J��9JV��./HlmJI��{��E)+��wߗ�����L�p�#ݧ����a��\Z�nNAv����{y�՛��nЯ�u���eP{l��4�*�(q:Ea�(O$U�\\�O�Ѿ�E��w����{1P�%V�?>�EE���-��>�3}����P)�Y�i�8������:0�ǄɊ��0�e|>�y��xC��sO��#\03:3�`v��81Ń�Ԯ�ԶԶ�͗���2,���ǫ�)��ƑP�������lF��I����@Ѝ�l���#A}X�;x�\0��0ܵս_Y��ݺ�\'j{�%��1�]�+ _3j��Qr�_0��JҰ�30[*�a0 Gh�a䴿3�l(bc�K�������a�g���}X����/�e\\(���\\��G<�%8׫0��\"3-��\r��<��SR�Q��r~����Ȩ`�X�{bY�6�;|��ߴ�Nw36W��*A��B�ǫG�B\'�1Rd���H墦�×��\r\nQ���@X(y�Y5ZfU]c�C�@C<��A�`r�p܏=�2p��LF��uKW�Y1P�px�� �xz^Q�}\'��p���2*msO��&S9�Y��l�$���\Ze��I� ]��F{��Z����,}�uB�Q����\"��<�2��\nЏ��<����YS�6��[�������ׂJ8b*�R�k}㽱3s�B	�\\k^���c�*LK�*Nئ���e.�F�},�lXY�ᾉF|J�\"�^������r�z�|����Y�;	1����{�_���mH��?~��H��	�P�\\��ϛ�<�a �i���L�*\\�o��s�8�8�}h�P7J�2z�s������,/@���6C[�걧��&T�,� �t.H�H�7���fQ�iGFb*��NR�N�M�\n=����:��.�<�9����;d�|\0�zQ�nF�l\0��`�@�>��vs�:w��z0�>������^ڮ�\"�P���X��Q�0�\'r9\'N	xIm��Mƅ�������Ӭ�q������qK�o���$�Bw�\0�\Z�s�1�ޓ�qt<��\"~3��p\rurH��7��ߡ~\0|z�m�_\ru�7�n�X�\Z��r�4�M-؈�M�k�F�fғ���)��#jӼR�6��B�}t������2���k/��C�5� �F�\r�4��Ig�\\hiG�G�vwK�od�O�\Z�zi� ��}x�T�G�tL_��iJ�=\Z�S��B�%:�^t4e�5�	��,a��U	�i\n�	��/\\��?O�Eޭ��p�۔	��JIb�������_xcn���%\Z���?���\0���O�v{��j��ԕZ��2��o�{�i�M2���Ku�\rAb��\Z(��#/Q�ex|�h�;0�k����g+<��*����wB�����t�','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-css:7:a1e49daf660753cc4e8f611541655d21','�R�n� ���{����!�I�y��4�����]���n��`�X>���F��k\Z�	�]�����E��Hg���`�� �u�K�:�ԣ�mʥ�\Z|*^\Z\r�૕tJk4Mj?+ߠl�6ϱ;Ge�A����R� KU=5�vF�ʒ�⪮kYu>��Y4�=D]d�+����2q�t�18R[a����|y��!IB�l�(��G�BG1����>1���|��`���*�bTa�\"l������u�e��S�����߷!�KU���rS�Yr�����Vw+u/G�&B1/����#�q��\r/�����5���%Ӛ��l˄����ΏY׿\Z��oX�.O���^J�	�%���7','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-css:7:abb16fde1a6b35769acda76c203d87fe','�Xͳ���WT�ʵ3�`?*��le+�d��R9Fk�B~~�Q���`������=�[�Vw�������s��6��*;aq)��ee�¸����ΧI��|��H�lK�G}$��$K�K>5�E��^��PL�^x�K�AP��4V��\r��g�Y�¤E���/��$P̤�Z����#��|����lSI#���ƨ���V.N�.�`��f��]��ʮl���h��Q�E�6lx�}�\n����\'��Q���q	^+p�U�j=����v�Y�t��ǼS��~��6&aS�_�f[�\0p�s3�������Z�ľJZ�d�l�%<?5�c2pC���16�T9O��L6�L^�:��n�1���w�̜�/�ٰ��-�<+�X���vV�[���z׽��0����NyQʜ���� �5��LV�M^�lUV��g���J�9�g�v�\rD��K��[�f^�������j��I�]��O���R$�l.ߠ��I��@�M��<�	�v�k:��ڳ�f�lr�Us;���ށ������E4�נQ�	f�����*�x��n=�P��_XZ�fƳ�yBC6��uyD��؜��ޏ�\"ߠ�?vTy��#_2�	����K+ɬ�L���u���y����Ji��[��EYW4f�w?�ə���\\���#=�ǔ�a��Q��\0OI~��\rD��B��U��ěE�I�M28�\\3HA��P\0*t�h���`3$����f�����]t%#\\�;BA��ك��5��C#F�E=E�`\'V$�mR��h��_�)��f��Z,f\0i�\\y�2��Q\" Lx]	�D��ϡ��W�<�h\r�љ���T(1òo����˸�d���\"�\'��U��:.�2kH��8��n�ꃛ�t�G�T[��\0��T`�& r�AY8؇�G��E ;=�Q]38�ء؝��69$�%����7$��g���Zn�Q�����Y0�1��J�0!��i(MN�{g�X�ƌ6u�<�k��Q\\	�	�z֙�ކ���\":ƅ\\��b�\rM�0��ܠ�Ђ�̨$�`?8[\\��Pm2�i&�h�L��ܷ��Ș�5\'pg]�.�{�m6����[[(�u��˥��O:�^D���Ih�.�~��2?EB��@�B����8�`W�&�H�5u���Q4�dJƱ!x]�d�c�*/�j5:�Ke:9͒�����\"a��M\n/\np�<�ć8N�>�����f���~�]{�f*����12��i�P+;���1��cuѹl葱ɚ�aj*�:tT��\r�<�@�$jA��Hh3-S�TW�L�l���b>�I_��}�[|B�ti�\"�ǵd5Ԇ���Z��%�^��;�Nv�ּ��7Ҏ�0F��8�e�>��O�L2��J��\r������p+E#>$T�@/]�/�?���ZmXm�6X���y��x�_�\nh��6$��_?�$֊	�\Z�\\�����V�� ��V�8�)U���zu�[�����-ԍ�^8���|EF�{��=����λz�ie�����	�M�႔���f��l���4�`\"��*�%E�����x���a?���s�����9z��փw`Y/�ѝ�D�\r�>�D2�9�/;���2[�D�O7jg���O!�ե�B]3�bՕ����O���xOh�\"��f�ɥky�v�\n����9gb��:��\\�4���۷p���m��y\0w\r��)��w���X�f2~?��t\rwzL��7���p?F������1�n�x�*��&s�Hw}.�/S�=��&]��ҳ=\'�m|OE,C��l�W��fBix�F�FL�!(/1tҼ8��+�񬅯�\0õRe�y��u z�O:��Fw�ԴЁ�i��f>u7��f�gx3t�0笮5�1{���)�]74�����A)�<�h����>�����T%�\"*�����ps�==AgME����s�ݦ\\���&�u�|M��f�Yx�n�6��K4E��/���#���\rvwØ��`��\']f����\\A�Fw�>�[���~b��Zș�S_�\n���\"�~�','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-css:7:cab18a1f5fb611456d3b94888e2ae78b','�Zے�(��Tlt�������݉�_ط�~@�c�\"T.�C��	�B\"����R&�!/�$P���y�����3���TQ*n��2O��T�9��1ESͤ����Js��&��,e:F��i�(�!.e�C�N\00&�n�͎��U��ӭ,��\',c{zNh֜�:����J�\"��T��<_���b�\\ccUrr�3X��ezj�����|������3���ZK0�h(�3N?������?>��40v�.���$�������,�o`%-}K�ʨ�\'�8��[��\'�i�*pOAy��Y�e)����64�R;\08�z���/��oq��i���8��3L�[�n^�+�{�	g��|~��sVIN4�--�y�٤s�γ\'-%O��=]����|[�RN�ڃvEӵ�\nʎ�ޯV囝nA�sRs�R�,�osrf��?K!����=�g�+\"�9�q�#���%{�޽s�/�ZE�v7AA_���D9�l�2�)Dmf��UZ��e�zZX]��<�j|^=??g�Q���</�V�s��ZҤ�k1�X��^\"y�\r���M�^�V�$7{����?ݜ�A��|L�Fg��$����xE���yfY�i��e,��y��I�x����v�k/��M�4�0]�z���,H�Q������4!�6�>��`���sIt� �߇�#�1��O)�&�X��%�y���܏L@)I�1q�/s��8fbz������2-w2��?�t�lr�8��6Q,�Ֆ�m�3Fؼ\n	�e�Y��d٫/�p�-b��]�|�t��>g\nlIƳ[�\\��X��1�Q����j�V���C���������)�Ҡ�Jjæ(H����6�M�e�qۘ�-ӗ��2�I�e�S�|ك^J��,>3!��zC�7�Da�hp!J�U\'��-��ԝ����c�����~5�|E6�7H?���x\0��f�!k�6h�\n�1i�ύ�gd1q�j�	2W@L��^Y�ƙ����_N�MO�w�t1���rKc��B��j�	O��,LIfggEyn-qmL����(��;K+�A���%~k�����^�3�g̾��kb[�UF���ކe��)������MlR��?Ρ0��L3��^\Z�臉JX�����N�~M����t��j����f�vb�sY�c�\'eE��G8d����)f�Z�����Z��]\r{�+cJ���_R�Sa�o��4_L��1P�I�RNL��j�)>u����y��N��3]�>�-�f��A�Ųm�b�~��6k6t��>�W�lҞ�Ln��&�;nT�����%E���7�|��nG�����9қ�v9�t�n��5��8χ8]�$S8Y�̖���>T��8�s�%S��e�ey[&����	��s�}�a��#ٲӤF��.]���l�pk;>C�Åe�د��Ѩ�a���+�7/F���������hj!ɨt\"�-J�����0�73@CZ�	����?�ٚ�h�f�{9��e�S�(~\"���v�ُf�1\niO��3�HL�mnZ��|�v�����Ez(2�s팉�����9*�Xw�E0���+u\Z�`ȏ��ڮM����X�v�����fه�fY��[[������S��m���v�C�\"��%�i�Ow2���U�J�\nr��J�_�M���bN�$�~���W\'>�����|����RB�dJ�?F�/�hI��Qi�z�.w�x���rb\n����~nڬ%�N!p&fB�-}W(:�r{�:���gMN�n��M��b	[�8~��(�/���|*)0%)|�X�T�|�$Oh�3G�B�Q�By���OJ�SD!�\n�iL�7|�6��+��v�\Z�Ln1���\n�`��\r����!j������[L�09@a$�q0BE �PB>��fkDm�E�Q���kDm�E�Q�	YtB��E\'d�	YtB�>�p�P�O(�\'n��ֈ� j���z�PBQE!�P��P��P��� ���[L�0�A�T�F�Q[D�5�\\0��\\0�#]|(��,��%�D~���.���A�Q;D�(��%�r��\\\"���ҥB�TH�\n�R!]4B�E#�P4FA��(�\Z�[�pO�{(�\Zɻ��D_\"�f=\'IӐs!�,��$`�)��Ns�H8W�p�~8�w��-����V%U#btc��[�S8x����,5\'&�����a�\"�]����Y�wu��+�Hi04y��H=�\\Bő�1r�`�z�\"���嚷��g���p1��Ҋ��	�ԁ`���\\����=�L�M�3u��g���O@��|�n�O�����U{�����~�g��6�\\{�t3����s7ҶƸ�\'�x2��됫9Ԑ������4M���b�Y!���@Ȱz��o����\0�@�^�F�yZ+>�-�����m���|��(G��ց�^��wZ��B��2 X���^�M�pW�|0���C���}�2���3��\\Ξ��\\K��������\\�1�s)5U���[F��8w7ɽB$�$�5=��뵷��K���\0���M3̛�w���&\'�\'\Z�՘2F#�������]���.:��q����`���s�=�.>V�a���@��7�����f\Z_uV5U]Ϊ:�5T��v�?','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-css:7:e701ecbc02be25687d960328b21965a9','+�26�R��-��HML���K�M�K��/�N�,.�I�����K�U�\0','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-js:7:08fc0b00aba8b459081b0f67b963ce93','+�2��R*J-)-�S/.J.N-Q��S�K-W��MLO�дV�\0','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-js:7:0b6dfe870c6b1cd6016f1deeaec8450b','=��\n�0�_%Dp�5� B����g �+�m�tY,�=)��p���k�UF�쩨�4� AuȑP��wN�P_�!(���uHiT��Z!��N��hx��Ⱥ0�E�E�؎�?bg�ͳ�in;����h53�Ј,䣄1; �����-�.KX�b�\"cn��x��$/�$;�','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:12a8657e020800645c0d692544669a3c','�k��F���\n�fk�C�GlvRv\\Iݥ|���[��H�F����=V�������*wv�����w��]�z��=[o�$\"���z��5M�y��ϒ��vQ.��`q���V�է<8#�2\rq�<\'����HN�,㜒u�	�*S[��Z�m�OVA�a���h�l���<�М�{�:&�\n�4��[C	���;fU�B=�Q���k�������2I�*Lh����d�+-o0���x�n��\"^������\'Iڐ��q���Y�����߂8�/�42\r��Ӝe¦a�� 	òs��n��$(\n�[�\raA�L �T�,?L�<�}tκ���G�\0��\r��\"M�{\ZY������9}OY�2�.\0\\�E� \\��\n>$&~��Bd��-&1	��9]�A}�7ƞD[K��2;�钭\0�cU-�,V��zy����IA\'\Z(mﺇ��!AƠ�m\\��\ZVGj5��i�\"O{�ywq!,O�3�[ܴ���ִ�|�\Z�o��,Xo�۳X�Kp�Ò��Ơ��\ZDC��[�\Z,͏�*_9\"T��5eN�������V�L�4��́�S��⢟���8�|�����\Z�HMq��M]!�$���up�k�-�����*1i���i.\0]������q�U��lW��=��v���\Zƍ��y/�i����}��/(S��q�]r8K���W��IS�엘�Q&��d��T��\\�����&�h����\r\n�WT\'jޓ�%�\0˞G62�@�*�8EJ�o����H�~ȃ�}��GD���ho1�w��!�Wlc��jYP�۸��g��EqC�	��E؆|��(\r���4z�gkhq�Z!���	�yN�Ϟ��Y�m��T	Rq��v�<���B}�T�X�1zB8~ŲM�f[���PQ@k.�֔�a~��r�<c,[�FP�� [�� p����V�ܷ�*p#�1�fP(�\0+&�B� �B�Fsm��Źn�C��}��~)�e��F�vKk%�p��<=)�&+b܋4��.�Mh1�2ș��<��F��*b������/X2�˹uc�BLgm�|��tmԗ�\\ϔP; A^��FMŞ)� \r±��j\"����)9i��쭜\"5\0�M�~����ѦK�V����e���oW^���������`^�:�i���h�9O����	��z�)dWi�n�/?��F�2L�,1��(�j�A���w����)+�t�l�v]m����1�6~ު��\"0��ܤӲ9Y��s���Dk�i̳��8�l�%�_U�p_��8[�\"��S�o0��H�[�F���\r�Q��e���wK	=P��ŗ�V�k�l��^�7\n!r�(�}\r�rE��2N3��o�Ėt���ZmL���ʂ��z.��T�B�h�G�V��j�\"�qp�Jx,Ryɹ�Vq�<�\nX���I� x�E\0�Sm6`23SI`$I+�3���21���(��̌+��d�)\'�M�f��馄h�v��X��7$Hy�*�\\F��Oj����\\��|v���S�k�\\��Sk8$�z��@�ث�\'�y�%`p\0�?:���`�\'e��Eiaz]�\'`\\\\���Eq�(hk-�4��W���S~\\ 8�ݪT��5M�Q8� dY��?ST�s\r�l�85��mN�NKne�6��\n`��9#5ܙ��J��3e^_��@]���:$�\'`x���,�R0�Uw��u�>�o�8�,Ǻ��n����S���mP�s���C�8e��\'��}>����bkF������Lǂr���w�j��݉H?�}���	\'u-kUr�\0�\'�T�\0�i�(S�ER�{8���xq��b/e*84�5 ������z�ܗ@;L4,����!��^�x\\S�^�5Ԑ  �8����B���֥�X[�\n����њӇ������,⼐��R����|�*#�Uh������y}c5�����0v����C��K���ȹ�\'��ˇ9w%��(˫���}����\Z�r�� ]���y��B���|������hTe�8�ad��{�A�/s:^`�;�P�3�P��1O�9.p���d��5�cBp�V��d�T����J�.���oL��|4�<�Oh}�J\'��[w�y@��퓱~���s����𺯒�1�?p=<�ˡ+�.���v�5�1p��B@���Ue{�(bk;�\"1���Y�G�.�RV=Ǒ��P�}$���_�L�i�sG�[X�L��6<(:���xl��\r~�,�A��r���]G�I��~�ʁ�����b-<��P�t��4����W�e�WS(���[~����R�Vs���D�WB0n��p\\���~��c�����\"��W�$s��U�Qu�o�,cݙ#��p������h���?�U��N��>%MKS]x�+:�bB)#���vt�Ék��7�_��b�?�S5��\n�5��	�����|�r�I/��h�V��6;�HB�3=C��M�\Z�}L���\'L	��6�7��ni,w�c�:QQk��w�.RGToK�	U\0=�)ï\"�u���m���R�<D�k]獢j���Ty�Tl�-�D�ҡ������X��i��v�ެ�UՎ�Q�s)k\Z�\'��b���+7-��J�N��q<�){��0q���ᰢW_Z�J�nY��~p��Z���ӿ(L�Q�~p\'D��J�8�]��\n�4{x�v����{|\nY���b/�0~���Ч������YX��㕶)Ѿ��m#��>�x����*:��_����)\nN�_u��ꨫ0_xwt�&�wE�e��s�JYeP�z��0�ρ��-���Ǖ^��P�H!x�o�2e���Q�ǀ��./;|�!4��~K\"�.P�l�_?s�ӗ��[2{J�� /o�_����z���G��ڋ�\n��H�hTӽ��Qǂs͓2���K�f�Z�7K��n��/���D_/o�$�TO��h*�� Q5���k\Z�����HuIʙ{}r��Y���`�g�h�;W��y�a���:��O�o������S�����^y	����\Z�-N��ls7q���ު\Z[�<�o�����&�$���X,<(�x�d1~b���q4A�A�p*�S$|z���db�bZ��h_=����`�T~�4�C��\\��/��c�Ӈ��`�viԦ�mN�̚S��Lp~��?��t�;ͦ|M=N�$�q�M��y!��elժ��ßg��W���V�&LTH�&��&�/��=���d�|\\�MMv�P7f\0&|$����h�����99ji�~ΰ:�U�([�	�,�vg7�(μ�\0','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:16eefadbf8a3388194c985633a55a8bf','�Y�W�8��_h@6VL��6nJ[:��v�-t��IRV�J�֯�2)���^=�ʣ;�g��uu��{u%��:;>9���ģ��I@C\Z1m/��Of�W�̙�����������8�����r�>�~����0���sP���؟�e�|o6y��	��!��5�脸�{��nk��p����me,�]�����u�`j�d���\\Ф�>������)ey\Z�$˧�Wo�0�#�6S�ĥ��������ѐ�=�ӆ�$>ouI|� J�E��CО]\"�^�Q��%	��\"Fӈ�5]\'��̝jr�%ESO�����X��ScGb�,���<h\r�0\Z����;x�?2�t����X��#�@�?�9��&����\ri�0���Z��fn������b�y��I0�M�x֊�u��q��OQJ�x�P�u�V���8f-d����3�;d��Hʻ8�`����Q��NQk��:�*�	�8jV8��QY�[Sm/�&���������?��7�)$sm���q�]����לf7h���U�v|�i�&��i�M�(��&�9�iM�Nӛ�7����w�vԠ=��hc�X�4@U���	���\'$%a&��|�\"7��p��h�cE�����\Z�[�*��2��Q��Yk��V3�պ9G�L?�����5�D��u�]����y铔�_�6z�X����9*�W`\"wڦT�!f�9�#U�E��qS?a�n��4��r�,V�#� C��6ɫ9{I��\n[kh^��wzMش�z��!��j�÷E��-W�	\"6\Z�A���Kv�l���V��,U�^,��1�uaI(WnꎊU*����hU�|��$����tSv+�d�h\Z���` 3�&�5,1�777UH�~gr�dNu�\0���[2�E7��lJ)[,��3ܨ�\\�׼�~\'AN�h|\rJ+)u�F�N.�\'\Z�<��dt88�`W����r$E!G|>\06h+8tRj����@%,� ���0���%ܪ9M�X���գkǏp��Jɐ����$%���6��@��c�u�B!���H\"��1�\r�fq0?��ui�}��8��H�8\"m���Єۅ�vp�I:�yqf���O�p�cB�ik蜼��C`��7���ɽP)�]H��υ�bK\n~B�\\/,5\n�)��nwգ<pJ.Ȍ��<\0��7�+U�ACZ@\0y�5mHi���~�A�7�\n6�$AO�6�5H��6���iFShJi?�7�2\r�0a���>�S�)��8�%��\\�ّ��R��/ϳ�D/Ϗ�(�)�=���k��)�}OYT9�=�(��Bl�AIFU�J�?W5�Xvm`�[�g��3��V��D���R[�-wK�_��U�������A�L2��bQᠦ��\rF0ց�oV܌�T|O�qJ5�w�+��(5E���G���]��B3�l��� ���>��_;��+�v:v��_�v�^����7��\r!}�~OD?����Ш��&���΋�\'���!:4��Α��|���b��\rC3� {�h��#\r�Q�d���0񪜬THLi}�6M�0݆ӥ�\n�͐�{ڪC:d�̏�~vu�pz�y)���H&A�^æ�Ub}�_���˻�����������[�]ey+��zu+��j�^\n=N��/<�ߓA�s<Zzǣ�p��zN�ȮL:���)�=-��q:���EO<�{�/��W/��M!��J��_��,��ȕԕZ�!�\r�f�\0L/1=�1�?�_\"���<��,�eViV!�,xX����.:�Hg<���)���o��?�⳥��/d���8nnʋ�b{f\n�X�n���8b��#p�D?+������e��v�h�M5��*�~gn,�M܋E�w�ʷSc��o�����h�R8dR��bį	�P�[����k*F�`��\Z��G��3�]3uy}��-{�}��Q&����]>��jPn���cW�	�H��%��k�Jl]��\'{�R�+we�S��=�����B�%�\0<p�J��z���X�i���G��7�C�ro9��8�A�����_o?�/m�Kp8��?~,hxNr��{�څ:�X�\'�e��K�e�H�����\nMq��!S�~��T�^sb�z\\~rk��y~���r�^}$�#��s1_ܥ��C��\n|`Qi8��8<gv����:����IR?$)TK�>�W���hdñL�.�R���?��a�;�ڡ�K��?�g�ک�DS�}��}qM�E&�\0��ˢؔ*�m�w�`�Q�)ZlJ[.t�/?��ī������_D-����[����b~�$m�������\0�K���','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:17eecf21fde46a48f3b116a686af8f8b','�T�k�0~�_���H�\'��\r�le�ч����C�f����Ir����d�?ҸЀ�}��}��N���� ��H²u\np��D�쑑\\��2S۰����<�Lp4�~� ���9��e\"�S�%j!Y�Mp�D�����)E��\rd���s>�K��gP\\>3���|�f��x/A���\'6\Zxd$U�xe$�pCy$�[P�ȹ���Z��򘷂͍y��/��[t��Pn�Z3\nR�v�3S_+�oj�]�����\\���i\n��I}Ǹ�8o�a<�pS+�\n���w�W$N���z�ᷳ�|�~�{��������>�������%�*r�r֏!Z�j�x��0Q)ͻn�p� Gөqx��óvPӞP�%�h4-�����v�:��ു���@67aGM��l�ܐ�.��,1M�4��� s��(��O�q�y����+3��ﲊk��B+m�(���21�!~�:�X���	g�Ug�M��\Z��.�߸<��� s\rX� K\'����dO�9<�ݮ1�����ߤ�תK�4�K��n+Ո�.־���oZ8��+�AJ0D���.&���Ѹ�c�J�pY��+��mvYnDVi\r��-�->��7��������ƈ���','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:1ca981a83debbd8522c4d88ca73f01ac','��kwG�(�~� �=0J(���3\r��eKV���-y��a/�(�%�\0�D�	�o?�̌�*���{W[D�;#####�Q�N���?y�K�������ڗ���x�]��W����.YW�~�Z�竤_^�W��b�z>YO�<ϓ�ٻ�Z� �[�.��UeJ�wQw՝�����l5�>u��H{n`7�tp�ʧw����fV���\\Η�����������m].�j�S�&P�\\]��VM��vY���پvzI�m1���p��Mu���Lj=�嬘$N쭮�*�å�l6����x�?^.��~�r��H������|5� 8v�������y�C�]�Ei����xE���R�����@����(���t\\UO���nK)����2�Y]M�W�ꇛ����X�>R���[m�s�6x���R��鞏��6Jy���R������0����\"`�w�O�m6h��e�XaF�|Y�W�7�3�	�\0���]��\\_�Iw�X�ɋ�r:is���/���P��,��� ���N?�\n�\'_t�vO���6w�S�0�e�n�;AUDt.ܽ��Z��z��6[���_������7�^��~u<�l��ώ.��u����6?���:<ʖ�qu��tq5Ώ����?G)�8_�����Ȧ�jU,��V�g\0���q_�Q��k��߽�\rSz�l�5N�ǅ�����w���_-�㏞&�~	�7p\"`�����5�����tzOM������\0ӆ�?�<�QOSG�n�7���{�,�u���bCc:��byYP\']3�v�q�>��s,ؗ����_�Np�gЭ��t����̕�����=UiPn\"m�x��\Z�4+]5m��Ǚ4�1�^	�\r���k\0�i��;//i�V��E��V�Z)~kc!�9��9<�B�o�H�K�����坲�.a�!�w��w��y~�j�{�CB�w�Qo8�^f��sv���1A����d��t��U%}�O���`�C����`���/��f���jy;m��y]Ѷ�Χ�Y��\0������fs����Dv��S�M�b���@Z���l>���T�3��^J�_v:�m�́e3d�e��D�K��p���QB�<@�C��<<�o/\0����c�D��``遐����3S���(eRC����dKNH�����r�.h��V3Z���ޏ�q9cdiS�ͦm�+�����?��)�=�*�D��9��\n��t\0�\0d�6��@x[(.2\"���h������R�N�f��U�,��P_ڿ�r|SO���ӖӤ��xu�]b�u;M�L^L��E���%�iI�fe���{�Y�<�߸��e���Dإ��|a�8���>P6&Έ֔�;C&}��w�\"��{R>	[-�	���.3�T�{@V�,��Ĵ�!�.D�v����b�\0M�����$������Z���Tū�|��FR�� DC�t�g/���8�t�#`�(��!op��F���������r�}y�$�{\"��-��)sI��0Clqj�j)���L|��N�V̈b\\�&������b�q\'x��U1(#f��Т�\0\n�[)�$�yF�;JKy�}����s���j��z��覃��a5�N�,?�h�I_�1γeܩnXǧf	p���ɞ]5,jZc�`���sO�2?F4\"�m��7Hz\'G�39#�O����p`\0�?5hӻ3�_�Gb�WLh�t��}r;~�-����\rn\rts!�$I��\03�.�B���\rGW��te8ZI�l�t�A=\"#X�I�h\nah\'����\':�!|��Ց���!�V�m�\Z��h�Č��=�J�Ozr��V�����o��Ϭ*�NL<����5*Q�\0]�A�C\\��!��(��1b�� J��]+\ZÜ�[�4�5�U,�������1\\�6j@��U��]�u〛k����@xD��D���@��N�;1Ү�YMɏ/,�́\r61��uAE�d��X�,��-��K��\r����q*q�).χR��w�Alv��.��ȅ	���ƻ.\'����[�.f^�@������a٥�=��p~1J�\\�bև�<�����_�R��{��bǹ�r;6;{��i@y��W\Z����W\'�����MM�ȡp�]\r:���Ȱ����y������L�L=��M\r��|�>�O�ԑ:�gw�U��0BA[-������k�3�O|�>���\n�}��}��O�%�-ᚘI�%tQ\\��}`s�������	�X���y�d��r��]Ϳ��x1N�l�yivc~�l^���g�Jz�yR�h\0H�F�����\"I�1\r��x���q:.IY�V����m��?O�R�U�՛������3��S.32X�%ʜ��f{e����V��Ŭ�\'^{����$���kX��y�z�Mw�׳�z���r�|X\\(�z)��lb~���%�����Z��//?���W��;��z\r\0N�����&�tN������Q(.�\"TL��X\Z�M��r\r��c�n��a�@Y �$?���ͼ)C �l�C(���K#b�Έ�Ò�/���ح<��D�ܾۦ��9cI{��/X�=_�����xU~(�8<��Y$T�TP�7-�1 q��9&�O�0b6P}�W�)��<<�وԤ�����b�a܁����|3^���0�V���x9�V�	��fRV�)T�*\'�b�)+8S7S��n��{+�b\0�m``=�7�n}�ͻ�$��P�jl\"\\�NOo����NO�����ӋQ����(a͒��w\n��n����h3����*��Gi\'��+�bg��0���a��w�\'�����$)4�>�����y\Zg\rz��}�����G����ig�&�s�l�.�M���)LqQ���+�� OOې��?��t����v\n�� ˃���\nw��?��)4[�����Aێ���!.�P�K8����a�ꠠߨ�g�$����}m>ɢo�uV��ī��>��7B��ƫ�\r:(�m=G̲��Faz���O�+�3���-	@�A�h��>�f��♐�%�_&����bԃ\nɋo�z�&*k�T��W�\nF�6�\'#*��۷?EE-jA��|���jeܜ�}�m<�^��]S6(y��VW��!~���s|���/�ܕ}/G�h�|2�v�^����ɓtVۆP]J�P������E�A��4���\0�ϴ�(&��Tgo�2���$��6�\0��̎�C*��I:�)7\r�=ȇ���?��l��C��#?��3a����������2[�%���/W�J�����/w����i��tȉ��7G��?�Ԗ�ş�C��\0���\r��(	�A��ʳ)��\r���xP��h\Z�����btw���6��`�&�ti̴J����5㔉����ˇ�Uyy�\'ǷIG\nߞ�����p1�?�M�����0���@d_��������|R�1�#���]%�??9�߾�����[Ƿ_�z�)/���jy^U2�#\0��\'�����h���\0p�|&�����_��p�I�5��mWٸ�1�8/QCY�������c\'aM�՗^Xx~�O�8^���t �\\���\n��:^�=߷O�\n�v�Lu=��Ǔ��9��]zg\\z�R���yQ��u<��pgF;�8�	?�Z�v��|��u\"���&��ϊ�~cWw�����`�d3�F=��\\�I����#�����b\"{w��r�6��lWN�~;2�m����-P���ϐ6 6�w4\nz�/�w`E+.+����r�9�\Z�]�N^��FJ\n�tZ����ʱ�<	��B�\r*������ȷ������S�tMߐ�Y9�c4�\\�׋\n���և�B�si\n��Gw~3+�����r-��?�e�\\S.�:�/�l4u�ц ���2_�NN�J?,<���c<�`\"��$�,�ۉW����k����2:0��\\#YI�-Bnq[����7��uN�\'�4hv䟹����D��돯\'�ki�6s�ۘ68��K�k� �ښSQ���&B�)\rc`$�{�/x��\'�=r2X��RKL��ਾ��v|����0 �5��;�1�A�0\"l�^ұ=�C��?@WaV�:�KG�[5n��[�P��������.`[��]8�W1�Y�L��D�ohD�u�{�����$\\VWa���W�7��r����\0���RܑlNg}�Ж����:�f�w���<�e�y*_`�\\�w�����OIZD�v�p��mW\0z�`�����+��*�-F���R�A՟��#VD�Lo�]t�*��mI\naZ�+8�l�:��1��L#�\'�E�/L�	ah�*l�\Z�r^���j���<Y7���쳓$m>�̩ȷ�t{_|�W/I=�LH�WB<,Ĵ~�2�ω�R�oE�e[\\H5������2`m�G;-�w���f����{+����\rp�����<��BP,WT�WL�q�T��t:�O����.��K\r��v�ZS�bw�g�nI��H�Տu\"Lh��Uv�)��;JV���Cr�o��Fˁ��=|���5ʥE۩�(�cy&=ح��Y�5���\"�/��5G&��g���[�����5�!���А~�փ��;aݰO���|�����,_�H�\rƃ�&D8M��IH@l�_��GW-v�WTh0�m9rE��\"���݋��5�x��i�O��z���C�F�Rn$26���\Z,Cpg�ܐGr���uD)\0+�7�zR�w���l\"Ӳ��Vܿ/��%��e�\\��<8o4�Պ�~�����|�+�4���?Ϋ?�SYM$w��ڒM�6q)<���;��oM<C��Fnc�I;��r ��5z=s���E�fPs�~�D�`�����\0?$��Gz��i��r�����r#�\ZT�Z{�{P�~�?v��?=�i:4ly=��K��r��WT�Uе��ѷ#(8�H%� �}s!sS0I^?�v��P�\0n�dV������r,2��qcZp\'�k]�o�t��ڛ)pژMßzC�:��ї�G���\no�����c�����¢������1pV�U7t��@�P�}3^�\\8��\0տ-�U1�~w^;a�TJ�2�����V+�����a��N��Vq��ȼ�)�ї��s�e�I�\"@zxq�ڜ�W@�f�:��,����[�8oB���O2Jrv����=H���u��jj[��z�T=��@z�߮t\n��aO�1vd��\"a�i.�26a/��X��g�wz)b.\\~���<����kt��~1��ϭ�I֗��&��xŠ�P$�	t,5b��xf�7���������i�0��ր�P<��Br[T��3\"̬�����\0DrZe-�����I��%�`��X^H\\B��u�W�9ԭ#�E�%����(+*�eV\0�M����BZ����h3B�4�	\'5�U�IE�j ſU�H��*|��b�GD+�x��~g�L��U�K����ڠ��zT��7v��#��52�L��i�^,��C�����sD��W(�q�LQK�K�7���B���N��5�~%���p�}�t���$�?v4~�t�g,؊�Q�����j<��o�����ϡ�^򌭚�U	ӟq\"����	��:�&ð�_��ȱ\0p\'�%�IP�gT���>G��ST����t���Р�4�e�\n��TN�;� ��G(y_[=����_�v�2�<���|�\'�g���!�8u,<�ݾ�J��j��X�1�Ȣ[�/֫��C�\0i¿��{�%��e\"����Q�@��I�_I�s/Q+�j��S�%j^�bF�pm9zڰ�Z,Kz\nAlv��w�>8�9-�P���c;ol�IֻE�(j#�>���dkɟ��#D@\nU���,囮��pS��/W߅�����?w��wת��t��Y\0P�x�����\Z8�;{��g��8����}g\r#����2��1���K�׷�����[[p&���lC�v�d�vp��9S*3K�����6�Mp���aNb>�K�,���c	Dʯ(Z?3�M��I�x��;�A�B��\"����7�A�����x�\\QH�#�j�N�#T�P��3�d��v��a��\"�q��2K�=��<�uDثkR{Ej���|�s:�g�����Eߨ��-�Ǳk����Y�|��i�;1ݵN6���nN���2(^�9�6u�v@�h��gEXFc�&g��>��\"�F�~W�g����1��x`����\'���Dh���x_�]�Iv�о�pf��K���ؠ0�G�0��x����3b�ƴ\'q�ܙ����,�\'=�@�������.2o~\Z?�殗��=�;u��g���n\\���*gq.<^�����%@�j\'0ǆ%2.��j{iN��� b�6���Z�`�K!W )Q�L|o�\\�Z{��M5���j���t�K&6�r>�T��gI��g\'x�R�h`�E����]D�+�)~��FSK�s�B��V�۠P±C�f����6/Z>�;@����_���b�Y�\"��Ey���~�݉o���6�Uvۡ���6sA�kl�� D��6p�ؕU+���F�ؑ_\0o`=D��z=���h��+�ޞ7�@@?֙�\0\r��\rF��M\r�bd�O\rOwH�\0�4��V����C���X�BW �R�\n�\0���;T�\\[���j�ґ��(q�Oe���lY��/Q�j��x\\T����t؟�����p�y��������c�g �W���q?<��,V�-]F�wgP�)oVx�j�T�P��ӾK�Bm��\r�=>FF��e���.��kZ���ߊ]��p��ߍ�z�r���I��R�>�s�d������ǔ�Eb����I�u��N\'���i���1-��uwsz�y\'V�H�@�B�ݳ�HھƘ2}o��]���z��>�j�3�sRԦ9|���p4��_�!�������h>��������8�������#���S�	Y��u�&�wYL�׻K�\'=R���ٯ���6�Ӵ����,>��u%\0\n����B�-j⿢\'%�Byʁ��Ó��^��mI�m���l�ח�׿��KҚ\Z2���L(�s���~X�\n���3�DC5�zxb���\0�h�_�_���`�j񝥾R�UBt�y��?\nM���I�{���{A˩DA�I�	����>�)5�����?GiC�~�k}߀- zj������9�z�����@��j��90�>�Z���s�z�t,㔆�t�b4�s�a�)��!�E����{�a�c_���f���v�&n�j��e��(=�A똏=I���mW9.ь�_ ��.tϒ�c�%�O-^�X��(���݀;T�&�̋Q\"!L�b���6%�w��!���\\�@��[�Ok��5��*_G\\	��8/\\p�ikk����n[kډl���L#\\��٭�)c�=C�N�?AB.�yk��>ϋ:L�&�i~b��3����\Z}��(s3��L�;�Ũ@�K��i�	?��ij�F�Bx�~C�<h9��5.�Mٿ@6�*o�v<O�c�<P���IP��Zy�ʇ��$�q�p�\r�=IG*���92*LƦ��&�qf�9qC�$����p�\"\"f7W�ӱd΃܍2~T��b�Z%���9��w3^Nl�ᗔ�M$���X7��36�v�@��d\Z��r\r\Z���A*����+�^O�i\0 �KmkvL�?�!�HC4�V�%9\0�y�0�� 1�k�����hx�r���$2[W<��\0F�jpV�g���*+���j\0�5�%}{_���/$n��+w�jH�\"^��J���Z���X����w)�Z�\"\\y��幙{COR(�x)�j)�d�\\���\'�vp>���L���8��s��Xsg�Bؕ�����V:���D�xD���]�J;�i�]Y�x��m���[�]�(X�N����D�0�����Zt�6&hћQ���)�ץ6�|(34�\n���o@d��E$�����[Lr�����CYW2\r� ����\0���ƙ����7�D�-�8̑@8����R0$�M��c����8����1)25݌���\r�l��T*o�C���ԪX�%\\3\"�f\\ր��X1��\n(��_�q�4�$��\\p.f*�>!#�*���e=K7�6G�I����k�QNn%}�q��醻fV��ܽb�v\'d�I�PmЧ-�ݦ;.+*e>&�z���mU.c��*�횬���\"9&d�C�ɃY��r�]���I%�ڏ\0u�͡٭g\nyi�+�;�̆#\\cT���fX��A���L\0~�;i]zF0B�I�]E�~T*|��F�z�Б�ấY��\ZݫT{j�L�ƃ��ˮ�X�L����w긷c��Z��B�[�f��^���	4��\'2������b���\'��b�%#�R@���(j���?9��;\rP��-�֟�\"�w��CCi�6��\00��u��q��<LW,�B�����jE7L��`$������,�[�Z֐}�$1!��+�W8���Y\'J@r~���Vk�Ƚ�]<\0��y�3\0VI@�#,M��.�O��s���>\r��+r뷩%�Qsp [\0%K�ꘛ�s����#|��^��\"��,q�}��Ht���F�;	�=�8g[�e����]��T�*-�ڢ��*����6���,#�5w��Z�Sq���$���z�]�;��������#���*���K:�G#8��.�?a��`׏*�����v�s�F����k�5�l�=����|�(��dl�-��Wj�,��?��2r��@p��b����!��q,y&@γ�Բ6���a�ԃ�W���Z3�iV��gG\"8yv�z���7q�ZsލŹ�{׶�d� ��菌��_0���[��\"V揀<���{^�S�y�?=�N���ƺ�݊U���(����-��K��r<)������-��\0��.�Uu3_N�wy=��ĭ�yj{���}c�]����Wkd��}m~-Jks�o�x��U}L5cJYs�G�[z�\r���P�;�w�\Z�Q8�fӏⷍ/Fⲍ�U��;���Ku��^�џ?]ȼ���3G�\"�YI��8�k�l���I�(\rG}ߥ\0C��M̓7��P�g��V�Q13�#�t���@܃���͆rէ#n��cK�	_�I�m:VW�Q��EV����I�j��+B1c�����~���v�D��/c1��\r���7o�@�$�\nƍL�_$J�8C�kg��i�%ēK9�<n�[�^�VC?nC�}�롻k�<v��ø�\Z������.�c�\\\\�-�U[ė��ո�KRh+�y�q�*��$�oS�������g���9�хϬz_.l\Zr����c�p�)����L�>U�\r�ZX�\"��.��\n�?|x�<qN�kX(c��潧v��l�/,��uЏ�0zq�O\'/�}t+nXp셽����I)�j�P�Ƅ_$�h�F�NՍ�<�&���:��C��Q3�X�jR��]6�b�g��j�cQ�-x\n�E���=���J�UtR-]hԐqE���U`�O��鄰�w/e}-w{9*x���Ƥ����D��]��*�� :�l�J��a�u����UȻ���⏨�����8VJQ5wWȆ�k)r���֌ڽ�9p��\nu�<��\r��jX����ڇp��g���h������5śh\\��6�۴\nv֞�H�����(���5C�Uqlϝ���7�l1��%��\0B��5����k���y��ڧ�K��õ��v0��N}l�V��\"r��`U\\/�2���C�T+��,�۲Z��u}t�J=bl6;��f�<I�[W%�㩧C�\'Y��3Ϣ��&��y@N�i2n����qi���ڹ,�@ݱ��W�5��l����@����g�2���������<�)|��FvF�fj�j�}_�M���X��Ly_b>oI��P�\'��~�A�{e�nfG0�����}���ь�FJs⋌�>|�|g�=z�2��KOF����A\0�,|O��}���c<���O��!T���4��5�mXoH10c+	��Ymfi�\'�34�,j4%�d>&b�B׶;��oW�z��_���@p� �McQ)~�pߘ�	L�\'Q��봪��wL��e��U��+W<�.��>^�ᬋJ��\"J�?6(�j��Pg���^4�����t�#*��9��J\"�pPh�>�`h���A�ǡ�R|=	�N�i��f��^�Πt@�Ǟ�\0УFFDU\0\Z����`.�..U��j��#q)u#[�6��Ru\rs�.�]�锵��P�qB�tB��p��~]h����Nɴ���PD :�ç#�^�����%�6�}%\'ֺ��g�Į��PH�e�.M3�}SYlu���R�n8�R�9���K�&\05ӷ��pE�VΠ�n������7��L�Su��>�6�Z�E���XJrrxf�8R�v�a�߹~��|\r]�Uar��l��\"ׯ2�H?_��߯5z��nB�V�\r�7��i����\"��峓��q<ݓ�w6��fs�=I�����XG5[�x�J�7	.d�+͂�~	��0*�$7J��4�̘��;��|�Ӓ\\ 0\0~���3�,h�l�Q�_(ZJ�S������^BiHC\r���\"�6��޸N�J�vx��|��������˾v�j�b�\\s��\n5��]g��k�z~�1\'Zhۻ�f�T�-�\r�B#K�U~�5̱>\r�40_6�.*}������*\n�:JQy�f�l��ص�x�������qN+��Y�����w��ȝ\0��?���P��F��\"rcY��qDxW�s��0	�5��ЛGåCz��o������m��v�h��p�+���ȶi��X4�i�hpO���	�����,8�F�\r���B�Q�������!_\'�x�\r����a��ˮq熠��l�@9����R��JfUxIL�	���<��NL��U\'u|�뗉�c���E\Z���/�A؎��r�ʤoy\r���!&� EY�9��HT{6F�׏�ߥ��a��M9?~��\'��V�\'�0��(�038����3X���B��H3�(&�g��<D���z� �t�fC�\'�:��^�?!Zy�.��>I����h�i���o�)UL�t��[}R��-$;\r�ۈrt���68�P}����u��[�4v�!��H!U���rӑX�\Z֍;�79k�G��/;}�=+\'m����O���\'q��ݺ{^;1RX�*��O	����89�̶!ӫ���Zmn�	�5���d���^���M9����!�8Ԟ��S�G���<\Z��wP�t3��(��$K����	+.M#��JZzh�	Wg�a����o�\n���.���Kl�`�����A��7/2y?\Z��젾�ܟ��?�0�h��w��7tIJ$]�M*�����a�KF�Ip�R�f)y�5�\Z����\"�%b�h��y�råǹ\',��=T���.�vQN=-�Wp���\"ʶ��jn���?R�?�Ў5-\0��#ͷZ<x�J�|�<w(7�7��g�P�ؚ��Xl&.�©��n֟峚��,�ޜ�	]0���A,-��\rs�6�+��f��~��������N���˼}�˳�p|����ӣ����ۧǧ������b�$�ߧG���A��=y����)7YVoؼ����ޟN���l��#?/�����C���xJ4�l����\n����~)t	l�o+D��ۺ��s<~4E�z�X���mԣ{��\0�~�a\'r�q�&P���M�xj��������\"1������H����o]F�PwT�kg�h0�y#j�I�s�qHX ȗʡC ���6�F_��q��e�L\Z�Y��$�i<4��&�+��c�\0�~Xp�k�3�@�..w�~k�e&�Xㇽ�Ҫ^P��A��F�E\"	���{�߾\'�c�@*�(z\r^��3[�@�\Zl������G����м���hЌg%���A��G�i�����nS�hLB15�R\n8q��\n�>\0jo�\r�c\'|o�v7wp`�7�a�#��h����:�\Z��#m���W\\/���4���z�~6<�9����<��|�d����wR8��rV���>�H͕\0��\"�]�\rpa��|����\r�a��H���<3�+\'�TZ���<7ET�����!�A���W���;��$�����nFN�����;��Î[�g�8W����������byY0�H\n�B�=���+Q��=��=6���K�YP�N�8��ln�9_��2*�۠0u6�3����⿴9͔��]I��j���\"���z��8�8Mk����d�q�a�!ӹw���;���(��Q|w�zan��(�a�O��ʯ�Xs�q-�Hq۳X:\'o�Q��~��x��W���pi�|<����$\r��Y|=~_|�\\�}>x�PERc�i\r�{J!�&�!�;`U����$�:���o>��s�]���1@���;�y��\nd�����;�!A+h6�p�_�+\n\n-�E��~W:`��f�\\r�n[,����Γ�\Zn��������鼂�]?��Z����*��b�2ÈrW�h�N/���s�UBL�D�ݸv��>�m�����/�\0��6�]V{��3!��L^�ѷ�-�L�}�\'B�;�ɒgy/�mfY����3DRD���\0�F�`{}��BZ-�a�3\\[V�`���d���I�����np��҆Lz��?(JxJ�5SLr���H!�񤁗��yClAW;F� h�Y����4����!>���1���,�x�Eߺ�ͻnI�����+��0Pa�E��&�g����ي��U��W����?�wd�$�\rq����h\"Gs�cu3_Ѭ�Q�e�xJ��׆�����L7w� �������c*����*���yp�M�>�ޮ>?\rb�w2l�!�tm�p�~@V��1�fs�M��_d�4~�Aj�ק�zx�Ic(Lʋ%�\ro�R_ye���TD���xEU��C+�\rS����.���R1¹c2D��J�3O����qW��3]!�\n/�濓LZ�ě+�,Z~4\"�}W��߈�e���S���YF}�`<U7��㯿������o�7w�Bz�d���G.�n��|u����Լ}4�%��v�.\r��\'��;J�f/)��8\'*�Q�-\r�\"�=���R������]LǗ��3ď�Aq�?�q4��g0\'#�w�ʝ�_�A�LzN���6���7ұ/��ˏ蕵�d�9:�ɦeE��`倩ƉQYvxxB�s��r���l6\n�9\\���p�\r �#����X�8 \0�(�2j��h�c\n?�a����R�=4TI��D&��`u��j�h��|���{U�c2��el��M�NP�<�9�Y:Æ%\nRT�,�G��7Q�$$O�X\'7A�D�u�}�/0F���[w%A{�6������>	=2��	\0�0P@��)�7]��%)Dâq෹��g��8�}|���UF,�۩sZ(J�\r����>�V��(,x���#Q�\0���#���Cig9��0�=��}��34�J!�\'4d��,7+,\'��n=ݐ��U<j���A48>m�Rd0=�e���n���x����T�����;�ൈX�����k�4�E����M4ty�9$�^/��\n�T�7��;�\\a�?�\Zǎ1mi>��g;E�,��nEv�V��\"*&ۡӦ��2�`v@�n�)��-;Gև�kr������1x�ႊ�^Q�c��/CT���E��P�i>�����fs���X]�\'}����FD�M����XίK|@���|�̴���m���q���س	t�ȎVWŬ��hN^H�r�8[6�J��\0H]�0�7��6�������!r��b�1���x���� �?���MI���O�ޗ�t�\r�#4��nj\n��{��3mr�p�hW�7�I����k�`�_��Ψ��QF}��S:\n�7㏕-0�3��m�(�s[&��I#���ޱq�Ō�y�\"GO��+�*zPV����YqC��I�8⏹2�� ߫o�vH��_�P�|�&�t2\Z��O(���ʂ�1%+)Flڥ��)�]�D�0Fw7�.�!.5�&�nmM���:	�`T+�k�`�C��L�O��j�Θ!�,��_����z\nW08#���\'�[���LE/���\nE�Jue�	fd��)�n�2#���D����	���k�Z$���XH�.��LǦ=�q+.cqK>��ծ6�/�rp�!�Pz%a��^��N:�	\0k҆��r�B*\05�$|K\\����S��!��mz	�s��7Θ��1(]\"�_%=q�2�SV�_W4u��\\���R�{����ɭ\'�>�5�^\0d���k��W�c6��/���\06׺�����Ea���I*\r<R[��<�����y�EW���8Lt���|��Q���v�C�k&Ro���E*�i:\'�s�o��w@�\0P\0 >ch��u�3��a�i\Z&vY�H���;��6,^��b���.��U[\Za���?��tR;�bDRzE6|��BY}/\Zb9�{��@�Q�:�Ծ���܇�ͷ��S[V�\r�C\Z�#��%g�|4��w9���$dhMt�@?p�(N�\"�{������T�7tm��GW�ԅ�XZP!�S��ܗ\\��C̛)�(����r�v劙y܁D���cqm������P\Z3-ǣQ���5��\Z��ٻ�bV�O[dh���eu��*�q ^�eb�H�/��MS\0`7��z\"�B�,���W͍_����e*�W�89KJw P�@q��ã��Ȯ��ʫI:�f���7�_��γ��R0�G%C��x&�O�뱃?��=<t�%�4�؞1���p�L꘱�V�����@�-�0����e�F@w�?86ϣL��=2���f��>�\0��cA��|�3j��%��FO�dfFq#Y0�p��%b��|��/6�|��y=øx��������S�}o�!�7�n~��uJ,�gG�{�e�K��鐣X�0T�c`��{3^��*!��8ŕ7~w�=��f;�F��F�a�:�V�/���hd2>D-i�tv����t\\��$��Kn�$�̡�o���6�љ�R�7��JEFH�2���q�ُ��H�QV?a���IF\r�}\\�z��ӴH�U��Pifpxh{��ncP����㫅�u�m�Z��А�_x�^8-�!��2�Jv��bAi�樥�µ��s\Zq,�����:Ŭ������x��Ǔb�d�r��h�8��Aa;�����kH|Cg2��`��z\n�7\'w<�������oΗsT�j@_;\Zea}P���w��^�\nV?>�+D�M���ϯ�$�A����l9�	�%Zm��l=}���V���qz�����S�;׾>��W�},vǣ�*qX��\Z�<�а�&`���ӃO_@��\r=j�#��8���̛�T�����f~1��Pq�Aӝ=X�A1I�ݲ$A��$��D\'6c�9w��D�E�I��\Zw0	t*3s��b\Z\r4���cn��k\"�p�z9^��=�ã�����+r[K��fs��Ɂ�d��\Z�]��56X���\"�u9�t�[�������d7�x�b�.rJڎ���2�X莘$?{i��J���kh0�̄T��Ÿ삎Q�����\Z���Ey�^����7z��:z��&�g3�>x�\0�`?�fI?e6F-���O@�g��U\Z�K��!~c/��){W],u�����Հ	]�\'DtD��?i� \\�Q�a-Z����谟\nԉd5�B�\n@�Ɓ�� �)���k�%ٿ�[�hΪ֠�-J	!���JW,�Ҍ:P���\0����7�;/	F�X�{H�!�nY@���ED��\0���Pl=#�L�B��6)��p�0����]�����xfrSC>�FL�kK��o����|����0���&��b:%�M�H�v/��:vE���gȥ��w���e��bE0�u�?Wp�җg$dc�;��yr�ݜ���{���%��:\Z~u��]z\ZhN-2�@�M�r����M6���|qm\n�	���<����I\\�fK�ߎhP��������3�Ă�)��W.x8nT��FC��a�j�D�`G	=L:���1��h�~�J�s�z���^��reJ\r��H���D��	*bc}��!��[R\r�C�T�L�q�f��\Z���F�-�i��j8QS����Ė�5��L����c��ï���0�m�`5��^L�]�1��2}�6Pᒠ���ѯ�Jv�U/y���e����\\	�]Kg�%)��K�Q*��9��ك0e�\no���#�Tu�*[��J���c�X�=��������\"�v3��g��o��Rw��<	����nF�2��I����j�=��Խ,FS�c�#!d\r|�����cj*{����{i��Fs�u�*��B4�v�a�?�~!����G\ZU�F&�i�l�\"�8wE��?&�I�I�D��Yy}��*-��Q��&d��X�����FV3��zB捊��,�9�u��yf��e�~�}݆�ajd�[�-����:��ͮ���j����P�Z���N�>�Hi��)����ף�Ixo���\0��&^�ew�)�[ϸV�$>�cH U߾��Ӡyv�2�w�jq�Wޣ�{���e�����ۨ�S�����9�-ᖼc��4��ǳƳmhF�d�ÿ�:�\"���\Z�\r|�yj���\Zyn�h��i�E��,mLX�qn�B��ITA(�����Hqv�g�/�Cʻ\"��Ll��� ��h/�&آ���W��J��i�mD���o5*u���WS&���2�]/�sr�|�/�\rz�85aݢ2�@�%��F����\Zѵ�l���A��`��SJ�\"�z����%vG2�x\'3\n\\/Z-��K���O�N�%������\r<]}C8����l}�-���\0/��\'��Mz:��ǰ�fD�I��s�zy^�m򼪾��x������v�N�f��\ni�I�I��$)9<��ѓ��$Kʄ�����=8&o���	5d�����j~\r?�-.VɈJ��_�ɤ��R���ˢ����d�l����\ZmU���_��BF��L%Js-��${�i*8I`[4_R�h\"\r�+:�G]d݌ѨŶ!;J+Z���|J�(��o��x��D,��L8�\'�RI��a�v+zs4$U@O�{�7�C0��VV,<��[W�o�p�$�$N�G8����L\0SIt6\r+`�_�o_��]����|�D�.zΩ���q%<�ޅ�x�6���+F#J6�.W�x��~Py\0��1�M��_`�3�$l��b����^����������Ԏ�\rv�$f�ľ#�PQ�K�����b�azi��O(����I��6��L�O�̘��s��m6\'�����������$*|Q9=���RE;4b��N�`\Z�#Z�#/-w��1�g\'C��s���<�+~\Z�OF�p�� �s�>1	OG�N�I�w\0��[�>�BOr�m�uD���)t]dϔ/�$a���m(�\n�o\n4���\r��9�|����P��t��1 �o851nt�=�O>\"I���.>�F~X]8s��K�f[��=!�s\\$^��Tn�R3.G��g;�$g�敐Bd4�=7�\\�O���_�o�+<��)\Z��Jst�������X�5k�(\"�,J$��\'Jgw̬Y-���o9v<T�PT�S���>G�l��Qɡ\Z.�~6}�>*�3ŝ�d��B����0��#ځ�FIX�=�5\'9�E:5�|(��9/ێ�Q��=pd��.Z�h�A�Z��;��w*\\�&��Cf�E�r)&����5�#�0wgF[pU���^(F9��ͶS�9a��40��]F�p�����S�9�%-��#��~�F��%��,	5��6r.a�7x�}n�Q�����^�(t�ڂ��Igu�,+m����4�n�a�)ί�)gk��xA�y���$K��������>�#���k�b<�J�w���\'�\0���O]�3��`�\\�}�\Z�ePa�TY\Z���(t�E\\��j)ŗ���*Ĵ7<��?��]�\0\r\'7	\0�O����:��/��O�\n�+���M]��Ip4��5�\\�/Wnn�����������鉻���+߆>(��%���\r�Y]����\".7O�Q�݌/�THh��S����\Z�2��H���L�g�)�[�ϲ�P@e�08Q��F��ޜ\\���`u�\ZYI&\'�F:9���M:?z�i�ipz����gk`^-Ǘ.�ʻY�@B鬼�͗\Z���v��\03D�L/�ٻ�B�t��܎r\\�ǔx�ʅ��R��P������)�ѹ�ekLg�#�zS��9�#\0��*��TY|^3D���g��;?`��F�p�a��i������/L�9d2�R@���C����ML���)�x���콀\'�# �؛v�p����H�@�T�-N��Ɲ��X����Z$ޭ\r�\rA\"*�������J����\Z�.�C`o)&���.���ɬx.?w��t�+\\��\n%n���Kx籬L��?�ެ��Gb�\'�4��o������\"�ÇMi\'���By�x�O��ս��h���y��wE��=�Q���}WHB��os��<d	q>;�{�\Z��Ws9\nA!�i�O\rf�T܇�v^L��α�9�\"�@�i��홮�ڷ�%��7~~��N\\�9u��k�M��^���jل���.�c��I8?�~���|]�\\!}o���[(�_o&�\0��|�nΧ��{�������3��;z������v�Mzd�w!�.QD��DE�CM;�����������(&�a��w���-�tQ���n��Y�q2+4\\�2X\n�,/_q̪H_GUY��W�|H��ql�$�x�bC(�^һ��7)��0E4侽��%�ߡIz.7=��FA%���ǩ�V�d��->��aO�y/��vz!����#�;�w7_�ä�WS�F�w��;���4羊��������%�K1��ٴ͗.��e�Ȯ\'.\Z���#���\Z���ׇ��{��c�.�Fi0[��æ�9뇳w�g���^�G�oI�\n�]��(���\nTO+:;_*�Ҙ�I�^\Z�&Z8����������on�G%����q����Ԉ|Z���u����ݞ����3v�Fi��7:�k�@����K�qwZ�9�`����my���1Y����//`�0�	�� �A�$|�Q3C����b�����]z���W�`�i��W\r�f����Hs��@��:�=z�ȁ;��X`]\rƈ��Ǟa��\0H\"S]t�=;�\ZH�.*f\\��{�x(GJ�웡��.N{��a�?^��{n�m|�ҞR�ОE]���7vf��T�,�Am��\0�<��JH�5��63{��@�\0l�._c:\n4��[�$��;p�k���FI��dH��]x#ݓ�H���a�H�k�V�.�-���a@`������}vC�Ӝ��>P=�s��m���t�c;>�]Y�s��\0�X�%B;��=A�es�N�D�2��i\\�\'N�@+��z��B+��D�i!��%�̧L)dQ�~���@�(b��Qb�H#D,�\0(�ZVa�������&��\Z}�t��t���:\njS���g��1��-��X<��B�w$k�l���u�j\"��96�`���D\r�(I�X��p�K�X=@n�\\cv��	0�Bi����\r������eD�đ���#�T�&��A�&�|�M���r2����@S�֤9\"��_L�ɮ�66���SԴ�ɴ���Ƒ�F�Ƅ[����T�������<$�kC�/�۠k;e�(�_�tV@Kzw�P��s\Z�7��\Z�퀨�-\'ѱ����p��c�{�EP���`��|:����`z�]�3P@��V	\r_p��W�����jH���]�l� ���6j��1��Suom�c)*ln���Vt|I�\'oVs�:m�=tE{Ef�ީ�*mD���i	O͢�^__����+��|������)�P�;&OW�W_�u_����n7�Q�܎��;g(�5�U���\r�Oo5�ƶ���#8���_��Y	�3pl�t��żZ)�yRiSk���fT��C�^()�\'V?��*�J��<�|�U�\n���,z�I�:v�lp�L��eJ��%\0�ڞ���R&{�\'��W���y~�Q[8.��zP8=���i��\'�z\0��߻�/+1�T��C���G�h\0���$�	��	;��c��J����t�Ng��ql�( ���2l13�\"#�m��j��_/L]WHw�d\\��c(��uT�M�\Z���b�j,ģz�|�AA��1���q4����.�h#�a�/0�F�8.`}ݻb��\Z��N\0�>����:�\n/������#q:t�אP�=��z�*�Fn	��L@�����3�Y�+�m�$l�FX!c?�8�p��s�� ��!cdש�Jy���e����_���UCv1?_W�;�5\0HXËR�Rmq�A��*�<�l��J�P�r�l���zy_��}ce�>���z��A��:�dW��j\Z��/�QFCe\Z��Ԁ�7�w�Ȗ�%c��\n���z�h��Z{�E�\n�����\\Cb�G�������ׯ$y]�\"��˳\Z�%�H�ɓ�m�8�z���M->�iM�%�����{fO6�o�/��s໗�]1	���2�[�(\'��pY?2��5�D�p5lH\r�ﱄ]�<?8��Ξ}���0�ݦ�o�������dx֤�S�ɐ��� �-41���R!F����ʹ�t9�Ny]�Y���_\ZMr�0f�I&m�$�`��8��L�ɞ-���<k��DD%ߔ�k�f���q�8�	r\'�yd!�(�.���6a�v��cx5��Q�g��q4]Gh M�|̈�tH���\'�������0�����x��������L�5ϑVM;q��\'o�k|/���r*�&�j\\N�-׏W�*]C��ދ���?ȞWr?��\r���m�L�������=�?�·\Z��4-��������ة���*��\'��d���(f��?��3��\\��p�7We����c��Ŭ�F���\nNcE��ܽ˄Cc)�����ab�?n��j:k�x�altc\Z:\'�hX�僿���4J~꒿��_���p��iP��b�\0D�4�X\Z$R�e/��pP/��~N��B��	�������C�hqd��\\䏣�\0�`�(�X;(����>�ehD�5���-��q8��\"�<�q�V.�ٴ����U�F>-�(%S\'`�ç.\"QR�ŭYUĴ�U�)�[�\\���f�$�YU�Z1�[�gſ�5��o�r�l�bi��R;5���LS�5�;����QPr(�e%�yᠾ����t\Z���E��|%��}���>��.>/��y9�J]i��<���x�/5>�C��դm*[�մ�a��\r�\ZL��\Z������e~��=8@����N7��lޫ妼���n3-g�7x�n�_��ݖ/O��/���ӣ�G�e���_�R��ӳ����5m�a�GPHt8�#�qZ=A��_��&�ߪ��M�����n\\Q�_P�wz��>I��148zC� �?;@��዗_���t�9<L7�0:���P�3���z<+����7_�$vgS�Pi����^�WR{�k��&�e[V���d咰*��x��Ōş<w��t\Z�9�3/몾��;�Q�q�͝�]�)��E�k�����v�Q;4J�s��kom���N��/拏��:)��\nͧ|�F���\0����z��5e�)�&���j�P6�r5��VP��y����k�?���\'W�kB�IU�!S�b�7�lM\n\"�F�����z��\ZI��\Z5R}w��]�������@���(\n�X�j�V��x9�Q4��};4�s�5�����[R�	-@̾�A���ݽ��*�~�JT+%P|��t�$[ot��i���HcV���FD������wH���L�ވ�k:W�*����윏5\0�p$�f�!#��̘`��O0ڂ�͑�хo��5����	�vsyμ�;�K��wj\"����\'���8S5g`#�f�PI	�H�H;�jF��FS\\M/�Ԋ�$7��^�]��ǡ796)�x�4��m�2a����:A�p�\r	\r͸�����`J��iQ�����dod$K�J�n8T�����8�t���#�o���T��(��1M�%⟛-d�9�ֻŔ�!rV�\"U�+�kS|�QSU7��(��Zj�\n�wF����\'H��pj�\'���\r�t,�9��J߇��v�V~5�%,�햬�F��<ek\nY���˥��\"�66��P���ԁW|i5���wd��#��i�a����3y�ֶt��x�Ͽ/��K�I�&�F�N�ͽ��ʉ�!�F$|��4f����^��Z����1;9�u8\n����\\��H�F�,����xU�t�7G\Z�������/5�����f��z����mA����#K�}v����gO�\'�M,�0;��f��[���Pp)����F]j�)�>�U�i�w��q|Y<��T�\Z��Z��kT�,e�NR����}�y��\Z<ҀӾ�����<g���8�i!$\\�G�ᄃ3�%6�u;\"�{�	�L�~�r2��ͣ��?0\"4Q-��q���N����XwOc\\�;,@�F�V�@$�wJð7q�7�{�����?ާ�g�Ta��S+`e��Ah�Cԗ\".��sB�R��koz�2����R��dv�������M���+�� �T��C�����jl��^��	�(&VȮi�?�69^AC�z���~��\"5_�z�a��!EY�l;mr�B�!��%5��Ydm�]�O<����r��7�c�C�o�O�^8rr��*�5�����:����e�8�\'���fga�\\}M��9�_ tb�����e��(�i8쎈F0�X�\n+�S�w�7�ٔ���`؃n�\02�D��9>�!�F���Fj��)�{�9���1�� ���/~��{AN��P^O��A�^������h�/G���2?4)�^�l�����q�E.b<����׃A#�y�sa`�2\Z V�n��NL\"(����FMjth\"r\Z��o�1#�L�\0��= ��c�BOu\r5%�^���cE�$�N,ޮ\"�@��O#%�P��FQ�M����H)ώw��ݜa�^z��Z�G�F���^�Po罄%z6a��L2K�z	yM��nBt7Q@�H{��}�fG��~���g�C���}��BĞs�-&��#�L\'b�|��a	��U^Rb�q�-�X4遛D=ԁ�4�\Z��(��)�,ks��)�u�c��	�\ZP���W8�u$���l>[�Fn��+����6e��N�Be�QA��V7\r�<�p��/#��l�Ow�`=D��\r�ܨ\0��b~\rw�b��yp�9Z2��\\cpe(�HV%>�\'����~X���yU�k(t\"x{X����;�/\'��R�I\'Y̫�t�H}��P�#�y��\"��x����r�dq�_�\'+�~C��|�;���M9B�������d !�${�\Z���y~�9\n��P�	��m1�Qf�_p��j@�����Љ��Dq�w4\rt���v�x:<]�&0��7���jP�f�e�Ĳ��y��\0\r�;���/w�E\0��$ �gġ��PF@Ț��5�%k�L��z�����#�[�{K�3�Oj?Q �n��C�Ӆ�ɠ��	5W�>�ȝ>��}vv�G��I�wa��`��_AHB�?�Op��?��x\'��8��\Z����{m|Vͧ�˶��/\"w($�	fw�r���4��^7b$ydSMȅײ�>e`!VK��#�kDh�P��)OE�K�H��TiS|�Jg�����c|�?�\"�0�}�Z5�$��C����ػ$!YS��M��6- �$l�\'.{k�_����W�;���ڳ��x!����ыZ�TH�D4�6R��SǾ�N�����t��Ţ\\�2j��ޘ��MS�nQ�n[��ē��N��B/����R�0��kr�7���jF�N��N�]Ɠ��|�v��͹乭9D5�mkz.�����`)�7�H8���>�7�Z������n�T|��j~����2 xo��7���R�#Sه�*��i	W���;o�=q����~L�.ǳ\n����nJ�a�,��H��$�\0��;����c�Gw�[�ș��8{_b��������d��\0!��8�%�*�Uu2_�$I��Cȕ.�oכn`ȴ-Ǜ�Z9��S�j�3�h��uL���e3��me�~�#��3�@=X�hJ�|j|�c�Q��\Z����e�&Hm6��.7�|�|(8���\'V��r|�2jM��A�0��|7^]��l�.:�?lk{��q�vښ�1#(.DOn�~{�鑛v�˿�rg�r����t�=�e��� 9��C��Mف�IO9������K�$�D���	p[�F}	7��)K��m��az��ߧS����B�ˈI�aF6��m��VV%y�}j� \ZjCs���NB��D�2�\Zg��Q�Ai�\0��Q�����\0ߋJ&���\ZR�;@�U�@d)�f\"�W\"�*R�;%�^G����\r���i\\8��t�j)�٭1|m 8��,\'yb�yE�,a����r:���t��t>��c�9q���7��6n�cр� e�=��Zp ��9�ip�G<��:f/���J۵O������\r�a:P�B���񬼦g��,������&\\����	\'L�ۿ,�7���ղ���ow<��x����mJ��?Wp��������kT����uBv�z��t.p�qM��;��\Z4E���E�����k	|QO���&�١|��� ey\\Z�}�3,*n��y2�������(<Ax�kϨ��rT��}�]�V9�y���T��$܆�sq�d4�����ቓnG��hiH2GM&3��ć�w\n\"4����I�9~5U��:��s���ܼ\Z\"J�C6�|�W�H�Qq�|@C���\\I9�*�����L�:�PK����I�%�0���n�6��V	т�\'���=����\n�] ��J.��dmyXN�ϐ�aY�o�aG|T4�HM;�Y+�N�\03X����Խ��R,�P�@IlCR�>tU�x��Y&K�]�=�RP�VIk�t]�bt>&��0:R�}��>8�l���ɂ�X_����1�y�C�	�ĒL�ޑ�(%tw#��{�OC��	!���2j� H��\n��xA�?�(7���\r��5\0�����)��KF�w���� ��ߦ�G�\\�Ԩ��X)�I9�-��zy��Gݍ>�����eеc\0�=W��g���k����.xd=�������n���\"�}D=z��%��np���m�v��x+\\�.�D��G�;_�w�m��@(�?v�P�d*݆�\"\Z����rAb\0�5�u;��;�\r$���jj\ZȆ��	�cD�o��%ߠ�I�Rʨon��~)\r�@�����z��x�u���>�Q:�-�q{�G���!�i���uG����5���Z-�\Z�U1(���Y\'�M!o�e��I��3��5�-�+_9\Z5nX��Ł��C\'�i�rm�_oi���X���	?�[�[���5�,քeȊq��J����~?�x��_�]/�nN����]�C(�B{F�Î.2�T�\Z���.+�d����*���ǱE�i����/���p��#l���M��]�a\n�ل���N������I/�,a��Aj���M���昵�g�XU3j�M�����yh���Y�xЯ�C�q�`�ɚ��� 7�rj)�>4�2�~�Ɔ�h�qv�\\\"�r|�RO��µu����O�tǧԦT���ڂ�$o��5�~�:	l=���L靿=I)\Z�Υ2=�m��hG��e���;�U+�R�L�e�[UJ��n w8`�R�1\\�$\\e�e�1�c�h��VcC8k��i#����/I�������HU�\r�{Ιf��ʌ����-���WH��I&&_Z윲]H�ba�(�oqvXn\\|V4Æfv|\0a�g\Zុ*$����[�/���[ ��9�\\��rxT	�l1�~@Y�;�\rY]8$[��� �אy���Cz�9�W��������i߸�K�z�����w\Zm�~�-hhMv���y(g�֗��U���e?���n0<�#���eK ���o膒\0��	�T���5J�I��e}L�7M��j���޲�V��W*q}����d7涵G�)���F?6�D�!@�j�J���+��g�������6�lUư���н����,\r�:f�nٗG9;��\'�����}HOw�Z��WQ���������\'���0l�}&Y>�O�ũC%F���\"I&�M/aA�T�+\"k�+:\\AYf���Pf��yE\"N�.v\0Ċyʼ��Ky��V�Gi�MǛ\n%O�Q\Z������\Z-����\Z�r�c:���y*�e7�\r����@��}�!�)�=ߘ4V)�trQ.n̲�-�D�V�z�՗�rF\rb�	\'i\n���*�|�*��=�=��]�I���	m��	�h��t�D]�5ѽ�\'9��af=�=ƣ�㾀I������!E?N���v�g�Rz\'\r�G�m����z���f���$bGrX�� S�43Y�X8\Z�F�N��Wq_WS��c�Xd%���ÔeT��(�81\0\'$�j��X1@�����>x8I0�� B�_CaԬW��=�m���E��*����b��r��ݺ��{�VJA�U�b��>�hPG��+��\Z-\'�ч��6Ð��;?�}�o�h�}�0q���JlAa��֚�����(��-�%kS�^���պԒRa���h�v��+���X=��iKm[{Ā��Ԋ�ϡ�!��l6��CV��72��uX��[S�\0��,LP���`�5���WW�\r��&Z/��k��6�;���M�X��uX�:k�aT<h�}�.�\n���wT�����\'}Ki�ƫ &¸��C� .���5�V�\Zw�Ů*�C.�%ꅋ\"�T���wQ������Lw�m#B�1�\\�yc�w,ס��#y�,�_���1R�ޱg�$��v��FH�k�Jt�>�aq����,C�ٯ�c�H�¿I$I��w?���y3:��E\0�0��)V<��e1�H���|f]p�\'�4C��Y�u%�x$<<��C5�k-��\"=��t~��}�eq}�����9SU�n��\0�\"I\'�����f\'#\r�)%D��⦈C	w���^,WeQ�4؊������Y(�����b��rɗ�f�5\"���pi��;�4Ï�w�a��I�V�~�������&������!2�MQw�ፃ�;>M���uX�1鴹�z��6?G�C,n^�G\\��*zE[��\\#l1��Q[����<4�8���)��$?;i��1��� +�h�c�:ɎGvX�O�釢��(�L�\'w�O�K�2y��+�������ҥ3*AJ�f� ¼Sz�/[�7�!叮���B�����ñ^#�*��b<K��p��������r�:$1j!<�kO��\r	�\\=�2�U�c\n#��P>@4��r���#�v��\rv�=4ƴ�����w��߹�N�wq|<�?�3iw�\">S	�_�	_)R�~CO�_;��[��>�#B�&J�CHd�=a���C{�va�r&����w+)�\r6`��Y���?����m7��	b�����V3�~��c��˗�3�lb,�V����9nT�S懣\\L���#x��݋q9�k`�;��<NM�V�|\r�Q8�3C�����Z�^�\"mSG\\��^;\\�����Nş���I������)0-�eò�b}��j^w�@��Q�H�F�LF�d�ir�+˧�r�}ў�I�>y9��m��+�8ꈘr��������]\"�|Wřݕ�]�(�Cہ5�<5�\rc����z�:ם�%�\0�~72�\rL�f��i�h���%�ޕ��;�xN�{*��~�5N�J��;ݭ�� .f�V�Pa��P�M�c�z��k�߹��,ײ[C�`��/.H��x�\\���?��>���,\\qyx�1w8�*j<���=�\r�V�\n\'N��DG5�M�)��)(��o�{>��(��о���%u�J)�\r��2��Kw�M\n��K��F��)X�|� ��u1�o�3WsENO��cy��?r�$�s�\Z�1�WȠ���o�o�W3��\\��֡c⋈Ym.�z1(����c16q�P!�����^6���$R�W!&�7^\"�C6��l6\r�|/��T]%r��!�L`�8�\\07IN������|�SK|�1��:v�i���Y�m�q,J�ZN���j�\0?U�aRh��b��4b�*-�n��I������#+iڄ�}��.�����څ��\r#���S�<��փ[���ܲ(�P�τ&�BN`�_�&����]W��k����ʯ�C�{��o:��@�4!w�5�j�~?��(��d�:�yN]�#�Y������H��~C/CLe�r�޲��0�o�:nEN�2���b�}��bp\\:4n����RB\\���C����&�zb<z�x`;��Ya�\Z|JF��g0���1M;*8��Ř�s\n��;p���@A���=G���B��(z�݃;1��މ~Lǻ�~��G엀*�kHNl\r]o��\\B[yG��e8����YV�+Ͽ�\'�~���ᬝ��g��xϳ�=�%��\'z��*=���]|?V���0��Y�ېw��^h*FR��4G@�f�׼�ysYniK�?�W&�\Z�i��Is����b�Np�r�*AH��p\\�C97][��J5Q�~]K5������r�_��q��y�X�ɸ��D���=ZU6a�\"����#;� ��Jw��D~H9���xI�M�j��\'_�%#��*�9���d�+�]�c��؅V?�{����.V��S��t�<>��;P�������Z3�݉0�\'l��Ǉ��Q��73�݊U\0�R �����Bl�V���Cot|T.��]�X$h�8^�Y����%�@�kG=���p�# �x�� ����K�\r�q\rq��/��|�5��i7OVI0��xR�}O�I>��hHk)a�TXh<�\r�^�Q޽\0m����+$f>�4H��a��b2I*� $�;���>�y\Z���sh4[Bk}�2��S��D�t�\0�����Ӛ�9�j\Z�be��8\n��~r�\r�Ox��]Q\n��jZP�T9���1��$3�\"�c聢L�+�y�����b����K(��y�ˤ<�tg����6eèy8v����*�#xب���N�!�#�@����r��ώ82�Z=�[��v�V@}��LL�;�pq���r����P�\ZtS����Y�l��Bh�;���l�O!^pIT��X�\"�L�Y�\rcp��\r�)�w�J��A;\r*G�rAR\\E�|�3��K!-w�{Q��̫cehU,��vy�&���������st�6_\".�KZ�{��ak?.�7�J\"8�VR�l����sjV��v U��OP{�ߙ����j����A�1b����|�2���h����!l���F��p���3\n�	,�{_a����p�\"����D��<P����j�Mw��[��l�8\\����?\\qZ�3;�I?8,�m�wt�|���,��!+����K�&����en�p܌�ȏR��)�Jq�2��.�|֏�/o���^o�9��1���0�\"��=���)_΀�eq��t��\'�b]�]A��9\'��W��O�U����/��l�a)��;\Zo픷�5q2��y񭖸���v�$�-�?*�~Yw��]?a㐿�{Ƅ6�[{h\r�)\04�����Gt�9���¿�N�w�|�(�WPe~Y��\\�ɯuU|7^����c�jT���}3)9��(�_t�s���\r�YQ�X����+�%Χ��\nYm���b&�J#�B/�Je�p�ݼ��È���D;Y�ȇ���Ø���)F\n��|�6�PӍ/�n�qd���#�1���3{���#N�\r��Kս�}��Sгx����Fr�.s��\n�F��ZC�#Syh-�%$93�`nP\'��Kч��\\�aX�N\r3���C닯Ok�X�_k.c�㾹��MS9j�L@n\'wI(�v��7\rB��/9�|���2k�,p�:&\\�����\'��A-�H(���L�$��GA�ۍ��Oh��V�E��dL�����8�d�}f��\n������>��}���ܾB;�t\\�_�Cr&#5�d$�=(_F(o&\\C�2By�\0\'?i<�@�!h�B!�����#z%>�SDf;־���}�*侪nT�`�㊧�P�TȱP��jf�%�b������1��8f�Bv:�16!�k�.��Z�����5���ˉ���и)\\]o�J��g�뛄=� �j�L���0D���D��8�O�\\�hji S3G�<Ԉ.)\"/I���՝S����e��\0�x���/�~�f~b��:V?KJ\rw�)�a�R(Ʀ��y�!�w��n�{ޖ�f�<pٴb?O�5pL�����i|>��\Z����U�^(RJ�\r�:��쏵]v^Y\'�5�l�J�N���i)n2���?��v>e�1����jfj)�e�����\nPZ�nF-��4������j6�����\\��Q��ȃ��C:\"|u\'=�]wf�X� ����p/�艾\Zc�T&)����}��C�QWd�_�D�!º�[p��X������%AU�8f4ԁ�0}�\"ʉ����	Y_�OZ(���I\0W�������ͨ�4y�o��f��XJ�jH�$QF��$s��\\@��P+�>�W��x��i�P\n���Qa��\0��o���+�髚�V�Ƚ�\n.�ظ��nS�/�Y)x�j�p�\0���(���6��k����87r�?!���f�{9\n�\"(m�G�,����&YI@<F;�B��k6�5�L~$��y��*N�\\JY9����\"E��6�.�J�1���Y�3���s$��]ϳ0�����п���l\nW�ώ\"z�_�4���//���������#�N,��n�Ä��zu����g���܃r�H��\\4�8���xu�+�٨b���Er��~���Q��/{��|�c#g�l�Z�Q_5�r���KQ��]t�:�,���\\�)�h�G���7k�r`҄�P�\n��IZ{��Wܮ\\l�<��=k���.[��}�4g]#^�<좇��\0�:��L���ߡ�d�P�O��h�ʪ<@սuH�E))�{�-O<�H4x���-���$q��ݗ�j\rl���/���n�a6�� vH�	�ݤ	p�m�����7\r(O��&�=Y����@����:�YٲC*3��h7m(�M�>�$w��p,��b�(F�D9�v.)Y�w`�xQ���l�5mhH�sl��IGJ����W��\nV\\�q\Z�p��젶/|Վ(R�Ǽ0�\0��z��\0��tB�e,O;�\Z�6ą�{<���l S�$p�<�͆��H��ȮP�M�\0���/��K2cx�f��ԡ��|~2� �)4��@R���\Z�oBM���n�}âH�f�E�ַn�,E�<w��Ղ�!��ڭ���j�s�bE1�qQt���v���s�ʩ�%�}�K�f����C��u^:�<L`�#��]U7�8Ew��T�6T0i��72�\ZL������ZS�p��dAi�Xi�(p6�1�Y�sZQ�����{�+�k��ny���Qt4��c�\r�\";�ځ�fʊ�6`���i|�1s�\'�.8@7˥�]�׸j��O�����_VI��_cGq����Ǆ�u�z#��1V�7�d��������Z���,����>=W�OΦ����U�7ۧ_��E�%�BGN�����$mZ�� �s��!��Z�]�����Gj\Z�.P�@�$z�R�ư��c�ΰu�v�����Ċ&�,	W�B���p���8���\n���b�|C?�W!�x�H���Ԧ\n������AV���D9�˶����I�\n��K�j�� ��^�6�s�G��$ I\"�kr���ocD��dA1ȕ�F�<�h8�\\��FG����l��lޱZ�)zF��j�dX�)��;HF�:ѕo�j��<s��n��emm�-vH_iU�����ځÝ�>t~.xp���0���in�/��n��~:?gSQ��o�f���\"�Ԡ��o����NGnߐ�?��6ܦ��k�`�3�����.�m���;���y!c{��w?b/K8ʹ�W�����D!A�r�P|No;@H����\0�6�9$Qn����vL��	5�,����x�T���v�z��r�s��I&�3f��˳���=\\�N��#����o_��p:;�̖L.�v����9M��6����@��js�\'��I=R�ۻG��e1K�J�Er�.�\0���҈%p��\Zs�^���6�ʰugP<\r�6`H����-n6\n�(B�����8\\`\'&\'��D�Z��ݍ��Cm*,�U1���v�\Z�M�2��d���0s�а�\r���j\ZM�L[��[ت�?cۂz��2�p�M����,��ai�Dj���D	m	-�S��P�Q^���B��O�_̯��q0�~�t\Z�^��:ī1F�w���\\��q9C�q\Z��؊\n���@��	�6g�̠�e7-j6�P5���\"ah%i�k�!p�f�Ƞ;էV)͠H��=H����ad����jV�T_5˿Whʠ&���\0��y!���+�>�og�n)噫���甄�	�Y4�L�h�}oL���6��NrX���,��X.צ(bA�2kz��q.�k����ԎG�p����\\�tKy�J2����F��.OgI�5���*IR/G~z����c<����U~���<�ƳU�م��=�F�����	d]�	\Zu�}2H{�����I{��2z��5��|��[���SQ8?�tWk�������v�\0.t��A��)\'(r��Xf��F���囷��~��K���=���<�*}������t�gl��(Q��ɓD�}5;��/wھ�a�؂�ۛ+�D_��B�v�U?,ߺ��9��z��|�d#p���ҥ	߈0����	�(,�����I\0���@�#���\ZZ	�iw��4��D�!�6�z����e<�;	��]���\'��:���!�c�[%\Z�����:q�n��^|V���\\9\\��������Ʀ����;�{Xc�V��\"g@څ�����\n�pƞҼ��w�@g��{Z���s�,�Q��\\����~^/۾�:������A H�����kf�uH�0��|ڏ�d��>�lƃJ��,���^d�ۺ�%~����qԆ���6�ak��<R;���w��o�_���9/r���Xd��J���nB�7�jӪ�&�-�����YQc������mS��<�^�>�\0��Gٹ6��S0�V(\\$��2�����M��v?\0�YU��d�C/��\"\ng$�?_*��(���}�����B�i�Y y=��H��P8���\Z|�P����+�幅�����t<�93��s*��|�\Z�\rؕ�J�Y��#B��,��*��ԭB�U������N�$7�\n�\0��-g�s����-���?K��I����õ�(�xS\'6�!6�)g�|m6A\rjs/(A�R`���a��\'c�0I��/*��ᱠuY�Y�LH�\Z�=��94\"�z��g��C�FD�㗣N�a�t\\Al�H�Y���,���]�ş87`^�NO�����tuʯ�b:�F8#�!�;��&g0f 0��@��♳[Zr,K�s��v��`\"��Ň\\���\r����hA�\r�������D�%�]����i��7��<19$��L��O�^���gW�02|yF$�3,\n��>��3U����sy7Iy�Բ\\M�#w�o�e4~X6GζҠkw9& R����� f8DP���;K89���H1�� 3��Ú��~.K�,���r~\r@���~!�4|Wh��tBۺ�1Frj�u�!y{��t\\���Oʋ�����՘܍[6�w�^N{�e��^��HϷx!��B>T\\%�̥��t~�(�~����s�!�=�\'�\\[r#G��777��FĲ�I��\n���~���?���n�oO��L{,C^��)��Z#)�3�n�;��z��;�s������\"%ލ?���e���=_{(������ӳ#�>���_�r�YH��r������Df�Io�K��i�����d� h�I���,Iߧ9#��[IzX���E�\0[�72r�����}원2��T��E�a��\r�i���\n\r%�mD�����[ﾫ�7�4�uo-sU�Z\0\0\'���| 9�J��(��1ϼnD!��%\'�����\\�矾u��,c%+�f��-9���X���3�	2��_hâ6;�۟d�ma�@��.��{�(�|�-�c�����Z~�Վ�:�<8I�$�\"׌+�h٢��3臛�˨�i=��΋���\Z��	:��0��<��.G&�3�y-�\r�(���3��&�chE����wh���\r�������\0s{$��U�y�h��I懧\nO�D�@v,ވC_1�Re8Yc������J�QE�Al��c~V �u����t\Z¤j�;X�\r\Z\'���?�%jv�a���br�а�M^�[N<D���@A�M\"�1,�I�\\����/�a�Piң�o�z�Л��SB�r|_���?�nndh�d:����G�/Lɰ1����v���ؓQ]<y�t�zKT��\0����L�޸�]j��*�^�68�LR����P0\"���x�?^l�O�L������U�j�S\'9:��z�$���bu5��wf�^����lc�wy���5}��7I�oǈs���|Gqʝ��ؑYv%Y�N�G��g?�1�;��!p:�^�P.�\Z\0�1�@Aì�ݩ)�/�q����5�Nʃ�@N�PKɿ������ʞ�\\,#B5[Pߦ0��5�w���s�c�O\"W�=�������x��\\Bg?z�D��$�l�y�p>�*2��w����W����ua���߮��t�LS�sHZh;���wK��,8���Y�ED_���V�KI��\Z�H\\���Whu�v�����,��f���P�ɯy�i��N��v��i����p�f$m;ѥ�yc�����V�B�?ͧp��낪[^�}�F ��̡�_E7��n\'�/������`oWS��o����{ ����*ɚkǻ�c ~���nO�M��A��,�����[n���8\"��Ü�`gN�&��i�d�IG�ϝ���[~�=>IP���8�D���W�m�z��2�r�hsV@�����O6��{�zVNeMJC2(G9�(�rSRҏ9T0l��D}n�N~��E�*���b�1<����~R����0#���I�\"!�B�l�_򓈖�w��VD��I6P�J�<Lh�HFC�1�9>?f��z�lp�kU��z$R-!U���̋,gY�Ͼ��*����q�`���p$��/�}h�������c���x�q\\�*�Jӻ�\n�3���y�����s�y�x�\r���&�5���4�=�C/7h���2\'r�TC&������N\'�����c@�x���1���Mꎿ�`j���d��{��ˈ����X���CH�#����-�(�aN��U��\0˵\\�p7x��h=<rL����O��TvEF�)�����,����0���ĥW�S��K|��.ppp����4�4s�	�Ʌ��`��fs`onv�,&�E�0]�Dф�-S0�oӨ�v�g�?�tbQc���\Z*�M1v�C�֊`��x�wn���V{1T`���3��v���<���~�б��6�9�� k�(�q3�h�th��ނ�O���apyI￷��&<�P��2�PjKW�Z�i��j�����)�����6j�-�iS���{���,Y�=6���B\0Ő?��M}�NlTW�KT�Fk�]�@�6�5�[�+l�W=,�0��t�L���,(��n37V�Kͥ����Z|O�{��B�4�pT������Bw�u�޸�y�GĄmݚ�o���WS�E.�i`�z�!}��U�������fH!���|��L�B떴[��>N��@���Q|ׁ�.6��\n�寉M�:ۥ��./Y�L���a!�!���F�ysf�N�]9���	��8�׳ �%��>>�1�k�B<+���<��/3ZF�<L�Dy@����K����8�N��X�	��u��\rԦ�w/hpD��A\rF=�j=���Qo�x>������c���t�\ZI>A\'���!\n��g(�5����*֓9�S)a�����\nʪ<��6s\rev�z &�p��{9Y]��\nN�kQ^^�$����\0��\08�+N��:��n��6B\nk.�»����w��u�Zȝ�m�V[~n�f�`v*�;�x2\'O�~?��fT���sZ<��7�<�/�U<���]�\r��`(`~%�h>i����t�6f��n�oܣ,�o�9H����iF�ل�=p/8�J�;�{��2�D�9�>����a��d_�]���r���ޮ4a1����r�z�A���\"	o\Z���7Fa�e�\"\rc����j���w���)�VY��6���R��������wg�=�y\"u\"!�p��j��k�U�*��D�l��?K!��8�@f��x\"?�~ĿIJ\"��bN�0��f�w���,��wYrXHL��M��pW1�}�i%9Y\\������PV/\ZP���0�m��PF}8M�Z�\Z:�_��4(\n9�fpwV��ˏ=[fۻ#]��Q�n�3�l�)@�,�.,��iiy=]!LX�ȡ�]��1\\w`D�z</\'���/��Y2Gjo_�~Ť����OI0��xӡ��Jʭ6�fCo����u�dv���Ֆ��x���g��L{��.��(t��%�[�E}��~e��z�IO:�;Kq~�X�����d����Y{�Æ7X0�d�T�HyK�1*$\\ћ�ܴ�SNw\nf�;a�=u��Ø�fMD�6�hݫb��s��mc�U3Dݭ��\0������7&���9��dSy\'��=Ō���=:��\ZM&H\r�E��~HVڕ\Z���ƬĜJ9�	_ݐr�<���,�����\n�q�|/��>y\'�S��ĩA�a��\Z�������� om>K7����Q�f���D�fMŅ�;]p�}�w� dz0�$���Q�>x����I���܉�8(�~\\XsKN��Xni��Y��%ڮΜ�\Z� e��)�����R6��җ����a���I/P\'L��o��V�1ItZ�����FAsl��P��B^�eb��_!�� Jh�sb�b;g��G�����.��w��R�,�ЗW{�y����u\0���v�ު��>c\r�Qt�P\"�5a�$�7�jn��b�[��vȪ�,�ވ�(���\'���h�oJ�C�u�;O<x���^�m��Q 4Vܭu}��vÚ�5�ϴ��I���\Z�b��#,)\ry��b^� ��������Wgr\\����ꩬ�`�b������O��䱜	%^#����^Y�~�\n���?@^`h��\'ϐ�<v�쇋�JU��E��nű@�\Z95\Zz}��}Q,Xb�I�ԫ���Ȇ̐6B\'���\\\n�� 2&�qUd4�IƠ��R��&+\0��Mr��Ou��1��r�\'EX)n�5\Z�k�\Z�U��-  O7_bX�i�v|�j�t&����^����\\ѭ@������\nIW���r|I%�lw��]zd�-�P~D~z4?��T��p],/�6p,�s(�3Rx���!��W��oU=_����C).�4���h������<�j�X%^s\r�/C:�.�[�Ѓ��\Z�����#Ϊ�r�֢��̒�����K���������<�/B�#	����\rw3i]8���Up�\rG�v�x��I��u�v�&l;%��^��r�E�O4g����K�\0���\rb�=l6Cձ�]Js�ɘ����w>�t����,z�/���n��~�WB�by�|d췅�ǧ���hz>�Rn	A?��\"[/���9��i=kꖞ��y�u��G��;��t�<��@?#��΍������p�L���b�_�y�v��_�ے,.5����<W!?��=�h\"�K9I�- eԫ&�����Lm��8 �牺\\_}�]��,�))3��t#̥}�C��9�l����o?�z�)�&tG\r���U��\Z0n����-;�i�1t|g�Ҳ^��3v��a_d��:��iG<C��)Յ��e9�t���\\�}��_�Q�E��U���c�fb��ނ�	�ɗ9ųq���w�,e2���Ł���`Bns]M�J;<��\r�v���A�i?��o	\\�P��\'/�4�jP����z �j!Fiƶ��{�Uk �3r���/�+hﾗ[�]G �B{���&�WE�\'\0�|��e���R3~���IN�`���\0�;�\"�r.qq���s�@�7�&�N^wzݗ\"?�U�NX/��q��|�7�c��2(g�e� ��f���G\nH����U�GcĚ-Fx�]	��\Z��$L�ҏ�ʛ�G\0����E�����\ZZ$xv?�u���I�bҔɒ8�.:ɞ��s`.(Ո�2[ʷ��Oئ�I׺:�\0��x�v��cQ�X�-��\r�ږ��C�l��t�2װ���[dX̠�~8���jG��ٱ7���w�R���Mrw�`1ڹ<�a��+���D��^�u���h��p[3�8���Ǔ��D�jAB6�2�ȃ�0��t��@f����C�K����.��~�BG�H����kK��ϾP@�\\,��0dPa\0�\rqF#r����j7���Nk�� O��4}/\"�JBl���@�<=b�%�1��ć�:��GCHCs�Ǔ�_����ҊP���U�e�׆�����3���w�F����g���VL�������W�v��m������3������&��^rC��.;\0�����Pν�DW�U_�X�0Iz���LӦ �7��%{�>�U�i���8P�W�rF�{�u��v�^���+��\n,��ť3��1��@#L��w\0�{W<�Ё�ܳ+���usl<C���������*Äy)L;�a�;&(&�2��0������ ��򰏥ad��$S��nP�&�IZ0�4}p��E��5u~	�V���A���yLqi���3Z��%ԣ��=	\r�+�,��F_���I;���Z��[��j옺j_������hl���t����%O�$:��Cs�<�I��{_ͧ��P��L\"2�?� )a�}\\�:��2m���w[�����@n����Ңy�z��úV$�!fX��Z��_O��~�v��d� <[ �qw�_�[���+��3M�̏��|v1-�M�4v��g.��qq���Y��g}u�j��KK��:�h���A\\�u���v��{��B�`~:|�\n�Q�}f�X-���|���\'tNB����si���ʥ_�4s���������R�<ȻK�06[�8tU���%�xf7Uy�E��{r�XI?f���K�1�����](bD����g�L5���҆��x\"�A�Ó����-=4��y���aN��Pq/��A�v���������oz��8����O�����?}�2	������3vv7��_L�@������_�a_.��>�Bч�vW��B?�+~%�D�~2�bO�Q�W\0���g�4/����X�i\\є_�U�9����3J*�\'�~�%���5<�пB���C��я\Z�Ryh�;�5e��եD9��p�t5�\n��sJ1^t��2v���������\r�}�7�(����I��|L|F�Ci?Q�\\�>�1pdޑ�Y|z�tEJ::����M�L3�ɺA�&��;>��@>_X7��t�T�\\}�%����r�DNMh\n�X�+�4/Z̾������濘��Uc~M�=�iV(��c�����P|�z����}��K����y\nܒ�hqJ���dE�)I�M\"Ԩ�*��������j�I������t2�t%|f�\\}��/Ͻ�$`�+�\r��-1F�_���[ ��}Z=�ތ:�#m�{��gOF�<��6f�i�d�\'�����#�\n�ο�i}�c\"m,/O� �_�pV��<��++K�͒���ZX���h�����S]��>�Qv���TC��J�$�\Z��o�$�q�`����N?XtQ�Үآ$Fd�do��/����y\\~\'*?�grLϔ����Z0�3_t��$�H ��dD��?e���H�,��p����j����m=Ǩv�5���/�V2�~\Z��}=�VI����l�&$?X���C?���G+���G�U���\"2m��b�P�G��)>�3���E<���\\�6�; \'���d�U?&�}�OWWž0\0�nڭ�/��>�cI\\0w��b�;�&�A����6�z\'�Z�)�/��w�);q���!�Ղ������q�;>������3��iϑ��@QrT��������Yf����D��k���]]���	�;�)փܟ��b�W�����Q�����.יd=+a�;/?���f&AR�*��$} ��(Ad��~�>��j����=�ں��{�����G��Nx�����(�Xm�<������J;��8�r�./�Y8Թ�>��8*�|�3g�&!�l������/m�2~O��N��be\"mVs�mً����\'*���ږ.��[��M��qU�2+��-ɩ������}t���M�=�����+�F���Kq4����\Z^�Q�.\n����B��!���.Ӫ�������|��Xq�9�Y`�o{#��N�����B+V�_֜�{����`�n�v�Ō�� ��I��vlz�\r�������2#0�8��Py�N�nS\\u��Ȗ\'���������$�Yo�������j���e�-�	�:j=G�hŔ���wVh&;}s3&�pT�8Z݌���нI�kT��X%^U�#��O�D�����匦?��K�}V6�u�!��W?W*&�K�X�Y����.��\0g���e��\0)T�s�4Ό�xPT�f�Ӊ���5\0�Y@�Y¶��|Dtt\nKӉ8���t�ЏTeK���Z\'�\'E����=֛�!s����/��P�b~G�>�E�k�E�����ob+?nxyJ\Zv�s`��_�����\r�ր���.>V{����BF{|��!uJ.A�qu�J��M���$t�T�՝P�D㱕�L��a�DbG2�Z�yf�V�2��\\w+Ƅ�� ~/�K\n��;�$���c7(�=�X��v:����\'Mb�*����(f?���,}���r��\rY�m��Ψ�8��\r�t.\'�8���Q�i4�M:�!s�z7Afy>�~�\'5��3��P�|�\0����$��9\'�cn�Q%h\"����qv�a��.�ߪ��r;�]\"ΨM�WO�lN�0Bn����|��_-�츪\\�f�6��+�qw]1i5�F��ߢ�g��%O� ���e���d�,;_��a�E�n5�����Q?.F�/�]w1_��2��y����jY�	>��6.�;:�o8�;�`�@�:��[�s�:E65�� Im]ԊYɵ�,�\n�U���Q�l���\Z*l?^L:!Kaq�+�o��W�W��W�!o�{�\n�F�&��;(�nX��8ٙ���m)77Hl�p�]�B����E����ѣDc��c��Қ �,�\ZL��$#ܘ�{\ns���M��C7��xz�������*#\Z_�,��G�??�XI�PL���!(L?\r�G��\r\\�W��ƴ�$�ώS����s�\ZcGv�J\n�;.�\Z�<�1�FA����8��-ĺ;\r�s�hv���_�v���L\r��\"�I���	!Th΢W��\'���	��D���;��]���95��X�Tj�r�Wk��й}�]�whm���k<��S��ѵ6����Ű��x��Ʉ�M?�<��	1EQ��Z��w��Y�l6�r�N��5¾�U�%���iHy��l�QJ�n����vn���5s��Ÿ�Um;���������p0�x�?o����G�	�X <p���Y��}���ۀ|\"��Ml���qX�y�%�_��ȍ�U��=�|�\Z_�\\�7����\'�oԓ�%A��(5`x���N1qU��c�fc�&T���\n=��K��Rg��w�N+2~#�5�Í8��~gp�L�!\Z�,\r<>i���ΰc�k�hۋ���\'K�m�_��;�D��l�*/>�����r)�3q���Y#w�r���C�����xߍ�ZܥԄb*�#��ыYe,��	\Z�}0D�,ˬ���P���_c����}��N?�{:�!���F�@���Мa��OpZ�ɩ��:e�,�ٖ_����S��a�yȩ���aLR�TM���:	{pT�L���n =�o�\r�:�Q�nLV����o�A: ��_&V\ne:��\"4�_�������2m6�	�G���','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:1cfd456e209e134436f2d887ada9068f','e��\n�@F_%��]X�&s	z���m����AD|��\"�`nf��ϥ�c�Չ�dX���A���((0���B�e��S�BLxt��h��k\0�sm@\\�\"������\rQp�s�b�#9�޼��\n�i�ձ��V��Z���h�S	�l~���wЫs�?�?���#]�	ϖ�/','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:1e16fa54540285c011fa7e36cc612c9b','���\n�0�_%$8��M��+��ǜmζ�D�wO������|�w||8�ȴR�4G\'�i4\Z���\'��iw��Տ�6�(�΂�5ۊ�:#�ᓔCalN\Zy���\n�~��k.�\n����49�ª��`(C�`�$� ð��R�YJ�̴���ϓ�{֗��e��#?��=������y6g���','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:2ecae92d8874525f5b1096ad004395af','��Mj�0��bL1�-�Ш���tm�P�q\"#K�h��\n߽v;�n����=ތ�<䏛��ƩP��h�K,�N�\"�@[\"�/w���?B���֤�e��{���4Bֻ&����:�Z�	��:�Y}-x<+Lt�(RE2��wbl�t��C��\\��q �z�ㄗ3W�JX�CU����	 \nh�I ��h�rV�D��J��I�˼jT�] �\\��g��v��o��p��.�O��y��p��/','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:33e6aa440812bae299001bf287b8e591','͒�j�0E%1&ր�u���m6�Bw�5Yv�HR���JZ;�஻�9w�:�,��a�\'*^���n%֨,�����Z��V%��������QZ9���Q$N�/&�xpBcZ7���!�ŴR���ןSŸ�����j\\)\'%���	>�J���\n�|O�\"��ȯ�P�h�6����nZ��һ��ȐXe��\\�\rߌ#��a��Z\n�p6ЬGip�|\n��L��h�V��YϮ�$�C?�;UA�QU0�V�\n��L��xU=��|\0�#�','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:35acd99fce1ea947ba8512dc393e7efd','�<i��6���+lm��ިe���~YǱ3޵cO���n�,H�$���ܞ߾��(J��d&i�\n���\\�9r�QM�Փ��Hx�x�s�\\_4�ž�����$�<���ײ�&�a����������/��c��E�o��c�|}<�8�������z։�ͣ��	����ND���-�ӧb[�y&9p}��%��O=b�?��/�/��~����/�_\\^�ˤ�+�@�����\\�����|w�����*	����ɓ�>��A�c@��x�B���O�>y���	&W:�\n��P��7~S�=}�lU��!)�a�g40��`b�K���h��]\Z:p�^�;Z\n���|rQa����k�}��}�n\'_�+����6�(�?���NI�\Zw��\\�}\0����iN�nl�Ú��Y\r\\�{Oȯ��epF�ɏ���,����h�������x<����O����\"Ƣ���)�b����nO��oa\'%{���K�MC�������6.}N�O�{<��2h�>�N�z�%e��\\�9Ȅ�\"�>�x~����O)�_-ˋ������g?��-g�����EY�������uL�0�>II���~+c\Z��K)�}��oEU�{�}���\\�uzyL������VBЋ?\n�����F�9���{\\\\^���2>ɹa��)�\Z-F�eߤ����>(\'�/~��˨����#��v�����X7OJ�MI){�.c�_�\ZC��L�0�d�o4@�.�B`aR.�<��w�j�Z8�8�\n5�ڛ�	<}q���Ќb/g3hvaX����i��y��z�C����J�����.v�>VH&�./���\0S��t��*@������l���H@qM:IqU��I��(6�b�K�Nݯ��eB�\\�T�%XM��S�tFg A�(H~�\n�Y��\0�CP	�����?sR`^������gds�8Mi��=�В��Rپ	�}R��C��GRI˼d��~��Y��>pQ,w���Jd�`�r����bU �J��@DQR��%s��\"cM��{8�2����ԎL�my�t\\ѹrS�����5��+�RbL�-�Z ?S�͍4�R�\'J��M1���cV�\\�4��.E}�6�>7��\"|�2�\"�.�ܓ�R��!��uf`�������s��L�1Ӭ���D\'�K��A6�9�JR%.I�b�	\\\n�+:\n#�G�������Ni���kF�@h\"ѭ�s�S�)X�9�I]�����Bp%Ɯ����4(���V���vE�rm�@�%U4��+9t(�1[��SFc�U�����$�`��̷��N\0e��NmC�\\��\'�B��UV�@�O�x#;�;w��:�e�J��$J�~�r�1Kmd-�����\\��tfm\n��U`����Mf����h��/3�:���\"R�VŹ���HQ��=j]S��M���^���Mۺ�d��g�{��/�Q��X.\r�3[!b�DJ��1�z�JS�c�ۛ,\r��H\Z��80t��VY�$��D����O\\iS`0�����?��nh��j�s�,�^���҉��r�1�=X`9}��R�\"\0DWbS\"�l�{��J=���(08CR�-�{�����}8�,R�T�X,]�3���u���>D���p[��@�{�t�E���l���y\n��JB��[C���ý���B)A��J���b�f[-�I��HK\"�k��ڜ��6p�]}R�\\{�\0��J�ZV�� �O�R�\r���U�!A�o�)6q����\n��<5�\r�0`�P�U�\0�	���(+Kf���ä���(���9_e�l*	C�qٙ�ܮ�]�\0H�r坭�`����Y�������!A�R�(��e&�\"�M��.{�0;R(�Dj�}V���:p��P�j���e��\0�.jP:��0�>�����+��*��UB��`��I���P(y�v�v�0��ŵ��#8��P뜱���}�l=���T��2LI�s����4&��\"�8\Z�?��7kX����s��CL�\n�k�U�1/��3·v��1�*�;�1=��ċ��<�l���bMA�\n\nc<?e�Ô�j k#��V!�l<����ŸZ���m �=;\n.�*����\0Vqj�}n������L\Z���V�6�s`U!ʴ��M\"7w~j�mڏbQ���ֲं�����s`8B�E�E�����9H���u�V�6O2��{�E�1+���HfX�R��>�z�ű��\0��*Rq�_O���9�2�a�+tص���CB���]��N���<R!	.3v�_Z��p<��\Zs��9!��t��p�ހO�Q�Ru�[��4\r+{�Ώř��b��t��T�H�;q��D�9�$n�K����<�!1���t5�Y���YD��������h)-�;�Vfh�a���&5\\#�)G�ٕ/�!u@�2�P[2.nn�X��QZLy�>��v�P3����j̞�6˳0�� 3�6W�3/���M[�U+�ЉE7j���MNV$U��J��z\0;�MB\'�(�����K���LА�����Y�8�6��@��\\�g+b�Ώ$��x�P�1�sfI��E\"s��#����p���I�Z������l�-k�\\��2FӐϭa!�`��7:�V�� ^;�ZZ��>�#J����X�P@=l����=6���\n��p�MW�8��������+�ee�1,\n;2��u��ׁ�nn�|�khԦ*��������<C49c/�R�xȆeا�1���B]g���	�ۧaf,�T�޲J	3���[ �Si����QF\'�%\r�����0B�=F�;F3ӱǦ=Z��U�gH$Je�����l�2�y�U�q�F��k��]����xfH��p��4��NIf�+�r�ڗN�J��^�)��\0Up8s���e�UW��H�h.��8��`=u��VQXy�jl�t��#� �&��[˓f�A �	�m��(E�&�a`���H�N�W��dl�p�No-�4ƫ���D���0�m6�{�q�6HeP���8�7D�rO�����.���\Z���ZB��yz��Jk,}��F�m�&���-og�5<u@˨�l���J�\'���\Z�k�v��&���=Čܜ��B�F5���m0/�zo%��L������%[ʪ ��ԏ�S\r,����Yξ�y?����#��0�:@��n�s�n�h�A}�����E�h�)�n�����=��k����g��T�S�J���4�� >\r���g�ӫ�����i�q�+91o�������t\'~�)�[���ʳNߗj�r6��:���n�R�XY\r�\n���dR�A�8�ўY{󓇎�������1VuXb�Hf��ӳH�,Iٗ���lnO�.M\"��D%�h�Z�#|�l8h��&,��P\0aeq��Uve�wֆ�.C��u6\\���*8�m��y�=�	��$e�\0��Yf@�|���\'X� �D�ɜ-]�	���T\n����4k�6�Q��Y�>WEtY�I��e���f�FH������]�v�q�M\nĤ���`���\Z\Z�=VW\r{E�(~����{��M����s<u��[��5�\r�1��ى��x�Z�I�b��os0{f��&�k��F?T5�u��љ������A�od�n�Z�c�!����2�:��]O4�R���Ҳ}_E��qb[x?�\'>y�@��Xv6ӹ�t��arz�]6	��,��aQ���䱼W�2�Y�xhX;������5bAYG�k2��n�f����S�k*o���Rl٘��CE�0�m%�|Q���#{��qr��Wu�M��d�|�q���I�)p���BQ�ʏ�[Sݣj��r����i�Fԅ��|XGh�2�&MX�ʩ�E�\"�T8:D�Q��޲F-�d滞��Xi�7\'� }��3�G}�����htМ��F��6.T|����ֹ��0{�[�\\���Ң@j�H���v>\n�3�:�WBaQo�r��\"k`)��������äՎe��J��-�(ڎ��z;����9=o�{�(��쨠�@Wy@�#f#�7byn��\\�E|lʶ((��9�3�ٗ���4wf����ΐM{|T�?��@bn:�H�����lH���Q��O�w��$0(V���J\Z�U�<�3{�\Zqtϖ\r��8�N�����T��@�Դ6Xm�9�Q{�����i9�l�+v����*�xu��5���&�Y��x�o{e��6�y�sPr#?r�/���v�����u��*��|��C���b+?�*R�lh\Z(�{@�.���n���յ��a[bXK���y=d[�/���h37D6�ry\0��J�ٮ8��D#YW�=u���Vhm��S%+̅.h-��#Ì��ק��\r6�*�<}o.ie<���&Mqi�qfS_��ikL@N�Rܠ���c�Y��`�V�[���\n����rn�����c�ܛ37cV�Y�\nY���ܻ�h�)��Z/�X�ZLyG�L��#�ӥv��?fÈ�E{�0ګ�qﾮyf\r��W����ȞK���eW�o+n\ZTr\ZՐ䪣v�q�]����_��|�E~/[n:7m\Z�(Q�s��(�\r���ӨT5X��ރX�dZ�L�c���v0u��i�#�����M�E�>�3��|�(p	��\rM�~V�^ϣ��F,I�\\�1�zR$��]�dMR�T/c�߅��͇�gUs�d���+� �z���G6rgA���}�2�=���%��9�4��*�5�e\n\n��HJ�6�I%�M!��:G�=V�xUŨ�3X�D�Y����P?[������^���Դ�t�p�4\\C��@q1=�Ώ��ntNZߊk�4�]���6������m�Tߎ��\"��=)�ͅx>�f�y�ޕx��Ms��$�̑h]�`ݥ�����s���z����st\'�v�4�½𲱭���ʾg\n���G�h��?���GGF��A�=?����V�R���8��O�go:s�Yb���=�-��5���פ�	�w�:�a��\"$d�(��I+ђkyj�::�?i(՝�(\'^Z����X�~E��d��f3=�ʙ�Xr�sb��_+��hc7uDr�w\\�2�&-�YRq	����ҵ�P*�Yz�?/\\u�Ξ��K	����?(�L�ӧ�]/FHi�kEK�c����Lku��)�e{��qk�l���������>Z�Т�s���Û+dYE�?Tެ\r���BE����������(�cTg�Y�����U�����/��F��^�Y0��\"�	yz��OZ���$57�$��� ̲�:~���A��k��9��̛Cpf㇡��[�pL�k-*.\Z[��7�e^v2\'�`K�Aٖ��8����i�f��!K������3��5m9�0��q/x�y0��/���X�a�������x����,gƿ;R�{��e}?��\0��	3��ᰩg\"��C�su7��3#�W���[�A��$�q���r6��|~Ot�����NL�gg�o���\r�C�u����{��y�;|���/�\"c��/2\"�m��\"���/�_�NJ\".���������e���㑾k�x���#@�M��~X�E�h��?x�Q��ٗ��#�\n����vq����>��˗r�&!\"*zm��	߿Ǣ�/�zP����2NZ�O4j�,�䤖owyޟ@n����K*_��Yf�O�@�����?�����15�i ��}�&+��U1�%ԗw�4ǩ���ܥ�? կ����@���]�Q��m��8�]�q��-�}�:�;���`~)@�\n&el���z\0���j1��x����h�)k\r\0=2w������^��1�q�\'y_\\ޯ��� F����P�6u=~b��\n�u./ǽ�����\r�9\n�����2���#���	?�����$�����o�+SB61�����\0��!?�T��I�?t�i5������3�rь���\r-�P2U��i��v�ZB$����-�4}��vG���I2��ܗ���S�j�9��ȴ9ѯ�I��u�= s��Pބ��>tY��4��n�j#t���2�25;��)-`s�5?�^��៺ق�:�/��[��Տ�GW?4���>V-f��`��^ c���C03R?KX S?�@Rw����[\0$E���������z��扎=\ZL�N��Z��~�gKY��,j�[}�ik_?��x��������/?纹>h���\r�r,+��^���K�Qnv����8귟uf��a�\rmB֦_�-g�$�6�m1�{��B�ܙ\0M���	�!-�5���eA?���\r��־,�����&ms٘5yC2��n��.^����[�%o0��zM�7mr���M�P��wR�/:�S�mx�7��_�+�E�\n��F& �;ಒ)���H�Se�������臧�..�s|{{5yn\\�/����W�{����?�_�����me3�\n����oSy$�J���x.�FǴ7?��::��z�Z�0W5�ŗ�_�n@C��O{��wZV8�Q�Qȯ�{}�߻����!q3��.\"{�#�f\\[���b�������_}\ZI-���ʠ�7��m)	e���[r�K�Vt�<3V޶yЭ\"�2/��ܴ��4R�F�˶]=�4C�����/��/����?� �,�O�~���ٓ�=9�-�_<9�i�͓v��up*�U�!R�/��_-�8��ų����]������l�]��g�����ܿ~���R��5؈�<���I�lM��	�_�W�Ox��t{��*��x�Z���Y�a�`�֣v>@����7uM^8!���u�%�8\r���!ww�Xܵ��~>�G����:��\n[����k3r�:^��5�,�~��]_<�a�g���G;���KАs���4z��','2018-01-15 03:57:05'),('global:resourceloader:filter:minify-js:7:37b43ded56b7645d089aaa1df0a8567b','m�OK�0ſ���I /�^�x� �C�N�Y7v:a-��ݴ�݋��o�������ps\n�2��	x������؈&\r@O�}�1��n�?0/K}|K@�&8\'$�.4�j�ۈ��RM����yμH�����g��oC�m����;�q0yDNvu*q^>��J,�0o\n�03c�):\n)B®�A|��p���lՄ�*����n��A��x�|�J�-A#�!8��Y U=�\\����v�V��','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:3db4a7830296216961b7a5fafb1811cc','�X�n�F}�W(��%a����(��m��@�hy(�@�#q���.e;�����)KnQ��%r�sfvf�⇟��~1]��,��>]֐Ig*��L��e������?~�SoYf��y�̼���<����Γ���u\Zw�����7��I�J�_}�2����0	��x�y�%W|��{��uxG�$���MFב�}ͣ5<>\n�7t\ry)�����8g,*�ep݊�6%/�?aB.I��g>�K�g��f}f?�eT2)��9�K�L��d+��[���D=v�\rDq�D��g�z�C5he1�(E� 1R�HF�Q���r��)e	�̩�ո��VDI�N)�v��N�)�����v�΃�c���(�p�+�d�.g~~��bB���4�4�R��c;��5�ց]���W%s����@r�g2��yY�m(܉I��r�q����(]�h[7f&�K��B�(CI	U܋:��MZ\Z�G,.Y$կw���a�z:v��#*���3e�>v;�B�4kc�WA�W~q�<��ը���8\0���Հ�\Z�d�<��\0�EǬ;��qUM��ʢ���мh�f����N��£�F8�Kl�i��<ѽ�:���a:ʂp�Ԋ��w�\"��ҩ�\"��N�d��fz�7ߴ�4��h<\n���V�r˜+3.-)k��|7yE�<m�)Y�HH�:���C�B�)����\Z�H�;�3�N���\'�]R���;���+M�D����gy�؁U���Vq��\n�)<쁫\ZP[k�B�Ɉc������h]x5S��1�D:��aSr��1�O+�kC��ɰ�3y`=�c!R�B�xxLcߧĽ~����g�`)ɂ`�S̈w�������� ���<��|���fh�S��)�cy-��I�e!�i��Ҝ�9��� �&T���$�3���Uhv���]�f&+>����\n�nr��Љ�5���ER\"ĵ5���������0�hjhWe��N9���{>y6�8X*�1��\r�俣<�n��j�8yb����W�Q:�\n;B��疇���)]�Q�r��p+�q[�&}�84Tzj���W�_�oN���܃�[��_��[lÈ��\'v�#x���K��2r�B�jilv]�V.�&|�鴩/��U��1OR�Tg��Z�fI�,�����{ę\"8ˢ\r]��S��J�ϣ)�L;`��N�`=�oh��zZ�����0旌\"����Zx��&����P���;�\n�@v�� ���/���Y�Sa��W,�/���\Z/�u���Ϻ�h���K+݀���;��ʂ\Z�xm49n���XSc��R@���}V��Ql}������T��`�t��x��8��\\�\'tc/h~��$�%p���������b��\'��k[�rN�f3\Z�|�<x�h�<������KMHqcJi���+;T��K58�*�s��4�S�Z���R���=�K��\\[�<���>d�6��V|\n���J~@u8?!D�u�c2�#�]W�5��H�\'օ|�=璁���\rQǌ.Y�P��Wd��c��%�>&L�;��I�+F?��Z[T��n�|���=�:Ь����8�;;��/z���Ȱ3~E�WU��}���l�?&r�kL��x��p˸�����M�2��K�}����^�G�w�.��\\�֋c�3�w�*�i�','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:7517b06649ace59c60aeb0990703ceb9','���j�0�_Ŗ�	�\rdLCa��������\ZMӚ&�R��k�N����p���οv�|y^��7�ZH���Fc�Ƒx��h����ﲺ�,U�6Z���l�5�U�\nor�jC��jfq�EV��k�=�Jh�@a��K5�?;k,6gUj��,	�+U�Cy���cU�[*JO�|�І6ox��Q$�P�q��SFbw�SvS@p�~���M����=<Q(�vh�ͪ��&\nk�T��4J>Phlݐ��L(,�.Fp�Q>ܝ�Ra>���|���Bi���','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:77b02c838b9248c3c6b31c7e021ed083','+�240�R�-���OLI-���-�I�M�+�P*-��J2���2�M3�t�J�AB\Z*:Y���E�:E����E�:��)�9���@Ð����hD�jZ�jZ+Y\0','2018-01-15 03:57:04'),('global:resourceloader:filter:minify-js:7:82c1ab7dfd82c519b30a7427675500d7','�Tmo�0�ί(U��jp;$@��\Z��\0E@%������z$vf;�S�����,�4�/��>�ܝ�������0ۑT��Y�B ��m�l�f�گY�޼���y=ׅ�\r����0Tp[pa&�\"\\��I����8TT�<��H>��y�!d��V���Ԁ�;�9	�n(���B<�Q���I\nbc��O&��k����GQ4�e,��\0Z�\0\"\\P�\Z����l�����R�`b�et�r��0�ƴR`\n%.��\\���+��>��	p����	����f�3�6̥u΄�f<IR��9ũ@-�NK���.����W�����/���\"o�0È�#��y�.m��m�	�\'�|q�6��0�Dƅ�H+`�|���@kG�i�dDAGd@�\"j<~x�����ڞ�2k��8�:y6��\0��@F����Dr��i�z���9S�$O��<e1��[a[ZA�a�X��˺�qM�����x�|�t�xn���5�rb@��E�8�5;#?��s�a��&����4zzy�5`�1.���O��Ʉ?i�{�v���Z>����Z�</ݤ{Pߍ�b�܉4.�C��eE�3��le_���{�f�͖k���e��ji4BN��=�u@�� ,��.X�sg��9�+�s\\��1�+9�h�Z��M� ���ñ��?','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:9783163d7bb65c97d278b16df8bb4429','�Y_o�6ϧP�Ԕ.�6��`A�-�^[��k��ip`$�f,�Z������o�$Jv��C�%��Ù��o�CFξ���/���&)-X��u]�5�Tx�f���	��_//���7/g�r�E�Ǐ�lY�7�S��Eі,چ�z�G�\'��ӶT�5�e��iC�L�FζT3��\'�F�h�T�ȣ����>϶mS���V�2A�n��*$`\Z�b��L�j���?]]^^�U���fN�>��撁�}��ִ�[���V�X\Z;���l��sc�O(���`2@�b9���		��W��Vn�֔��\rr\n�ur��yx���}���4��E�Y6����]��|�nXN�vسB��M.�ɩ�\"�Ц\n�G�1Ԓg�傜zQ�e�	+�\0��P�Y�+�-�\rSmS��to�#)�;_�\r��`��=:�<a4_�3	�Һe�`*�z��K�D�@�B��>;O�gs�4���aR�O,4\"+\"��p���m��(�k/��y�MؐD[;���n�(	φ�D�,�0�X�+Vt\"���F5�Z�c:ⴁ����p.�x3;�yw����}�N�T�F��}<��I��쥡����|�3G�Zr�X����e�I��ݧ{�{��\nR3;����`q��~�-=�Bx��$Zb�pǀ�^��4��E��ȼ�F���h�ɏ?���6Y^�\r&�B��6|���B#\ZHw�3)?�E��Q\Z���A��P�1A�,X��r%\\�\n�O��4˩�ۍ&�G��B�(�἞�dG���ov|-�{VJv�O~{�������B�/̲9��f�7�?�D{F�n�ѱ�:��!\r�<�8���A����M��O���hK_I��A6z)�����_=\\�s}����LA���\'��_Y�^+9�H�kCK,Q�A2d6&�\r�Il��YM&>o.*ؤ��K� ��:�:�f�D[�ܬb��Ɂb�J\Z8vh�jt �g�	)��:j�O4��f:����EYlƺM�yz���I�2)r �ܠ\"��9f����D�\\�*�����	hi*l_�}L�r^�4g�ߒw��|��� ��%�W�A2B��&uI�ћ̡�S�(пQT�2f�9�M��%!X�]^H�J�$�¢�p�옌Y7�]GR��z�г��|叟���/����dC&���v�vĪ-K���\"ǭ��C��l]+����X���聦FJ�K����no?K�7�mDbk���@*��K@�h�-\Z���DS<㿅�xU�MEf|�ӑ�t�	�\r����s��x�[F�7��o��t_�A����Z��eJ�V.�Q\nZn��V	�v�w��{��t�Z���o� k�8ڏ�Co�`\n���?\r�/M.L&v�$=��K�%�����D_a����g�\ZlÆ�ү\\-�m�?Nu���6��ȡڟ����>Ǘ�A2{Il��2�R���\"2��Cɜ��x�1wȱ�	�p�QQ��*��v<�l��		�>�\n��5\Z�r����(C�{�Y��x`X�Z��`>G��ҁ�]N��\Zy�/���>�q��#(A�Q͢��i��u�tF��h�\r�[������;G{O#]e}�\0n7�2~lD[�E�۠�;�2����v}����uZd>�d�ݡ�����S����*|����Ps����y`�]\n��nIB���:�f�Yd�����*�D���vg�����\r�4����h�!��\\��������/����#l}O_W��6`������� �:4�&1\0��.�����`���n���G@|�k��ǲn<�M�����|M�Ws�ov5�}\\b�zڼd��^+��2�g�94�|�@%r@�#���E���\'Z�b:�%�¥\0H��_t\ZEpT.X�+�~����C�VBLK��#��z<��ZUZ�2ű%W���@�4���,!J����5|��L�ρ�be+�~���T7ˡo*��l\Z�ѝ0`S�U9>=~���L����?���և���DOy~������IE�����i3�ޫPsg����l�u2�M*�P�xM�k�i�e`Ӊ�m\ZQ-�=��dk6�H�w���slh�����#>�G8Ј{��O�\0��ƫo�r;m�0�ױA�	��~�+n�`Գ��','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:9e0bfbd7c2099f207a50cf01bde070f9','+�2��R�-���OLI-���-�I�M�+�P*�,Iu00)2��0P�QRҴV�\0','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:b1f5cc1eefb3edb93ea51b5647662afc','u�ێ�0�����8(�z���n��*�9aB�5vb�҈��5\'��\r��9�L>&뢊�b�WH�/7���V��epPV��~o߲/�\Z��i��Q�/?[g��f�\\��\n@u�]*.3Ua+38q	�7A\"Uae��U@{���z<�ʙ�¦u��喎x$�tvM=@�ݱT�ь.s|dB��\r����A�0���Iy�+M\n�H���\"s��:�fBO�nJ	`r��s��@g�dv��3��W�f�+�h`:3C͙�ؕr-!�[	��3����L�%u�α$^��餦zf�/v�=jsuB�4������Lݙc��YT�O�\'������°S��_D3�Z�N��ph�K7�ID	+����%�1�\"�kG�tM�o��.�n Hz�t�qn�J��u�_�X�G�ݒF��ڏ�u3�G��K�Lz��K������́?���{�s-C�G�8FW���١5(j��Y��','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:b2e780dde2b4a77e1e806aa88ed1b814','�V]o�6}�P��fU��fX�r�\n�i[�\r���恖�l&�GI*v`���ꃊKN�D^�{�!������K;�\"g1Ȁ���2��w�J���\"P�wx���@����r�����2�4�3�����\"}	�J.�O����^H���LZ�6�f0��c�p��/\\��_$$|G���ұ�\0JV��y�[<+J�[\Zv�I`�u�k��4H��K]2_KL�[\nD���k\r�8�[��:\\�p>;\n	y➕l6�\"��%�Rf��C�N� %ځ*}��\\G�\n2���S@���S ��%/@2��j����vf63��.�ȏ�o̊���&>���\0B��C/�I.�*C�\"2�i)$/*�\r�x(U�&-�p#�Ú[��\'�w-S��Aض�>����b����T�q�Z�O�<I�H��K��B��I�Jq�gU/�r E�ϖgS[Ӫ���=b����������[;%�a��~R�>�Tqs�!^��	ͲV\n=8Y�ɽB����l�g��>�\Z���7]hl�>tg�˓�\Z� �-��Q|��Y������]��d9n�^p���%o�������G�,b��:υ��_�U��h���kW�ve�����A�`R+�^�aW�l��g�h�\n�ڍͼ�\r���.~�R�v�6��[8�4��77+ɢ{�\nI�\\��Y/l\n�X����v��)+ܦ\\\\݌蕬\0�U��%bjj$�a��m�\ZҤ�G�b�|�M�9�b���3e�����(5���X�n�v|矎v��<�s��������L�/�����@3p�v7�*��Lܩ��~���ׯ6����7� *�n�\'�M�<���	kB�Zo�C�����7?ޢ��>]��[��M�O�D��tͺ6��	�,��N���E����*\0�=�77��*���F�����h�7^�^$;v�ͷ�\'�O�Wy�K���V�����hx�������b�����Cm�=�lӪ�Ҿq��o�\Z�-���','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:b690434688edad1718b2f7e0c6ac8f74','�X�o�6����U�RB).�/�ԮO�@�nI��(��.I����;>$K��9ņ\rH`��;����;��ѣG?D^�!EM3&/�+Y�|�d�~ɉdT���f�dR�t��VW��x8o�T�����o\r_�`�\Z..�)X��I���s&��Vs�C4�5ǟ�0��+	����z#qEKX�)L5��1Y2�y-J���� #�S#,B��U�D��od���������*��V���q����֞�*�?~���T+c5��\'�U_�,2�Z�S���i�}�!|j�u��@�k�խb�����qA{E�6�Y��?3y�\n��ZH<���l	���G��q�=����7պQ( 9R�A�f�-ט���u#����3�(�-� �u�����\r/\0?�+�V���^P@@�0�.���2�ϑ�����O�u����̅1��E-�\'>�D(�{���\"T)@غ��0��2��]�\'(x�<AP��V-\'J2�i��d�g0uWդկ�)��t��~9ut������K�?tq��{������g���k8����[G���A\0��v�����$���&K��饏n(�}��/tʅRQ����=Q�=qd��	��uJM�1�c��\0�\\e>:׸��������K>ڮ���\Z�L�	�OsńC�d�f&5�N��g1\0N���B��2�L�P�ߦP�)L��O�B�c��LR�j�Vز�1�H�kMt�+�겪7rueضŏ�q�nt��怒`�7�U_�4�d����\0v	��ؓ�O�o�qntFk��]܋\'��9ֆ4�H���a\r��#���l��m���I����bWt�Ml\'A�O�[��/�����0�\r����1��+�[��P��d������-,AϬ�*�(��Y���R�\0vX�����-��2x{n\"˺��g�ݺ%7�l�HV �.ٗEME��Vx҂��.��%��ؾ(+ѰQ^�5K�8���ͳ�-�\nSF�rp����@7k@��`IW��@�8h�$9�K��\Z����tƯLTQ�p�`옔sJ��k�;=�JQ^�j	Q�o�f��YM\"W���c�kF/{e�[���Yi��ာ����i\'�w��Q�>D�(Lڜ��޺B}s����Êþ�39�6��A�]��6v\'�X��Gx����q�<SЦ��T�lNUu�LR�_��\'�}]��\"�隃��4iJ�ܴ��� B��-��\0��JY���c5����=�d�{	���E-��U���b/�1v����fr4�����c�&�Í�p�va:�h�Bb���h�i{�����rU��m�Dg�5����F�2Q��>�5$�V���P�M磍	ѻ�\\s$�1���´�Z\\���L���^ϠmG�\n�.f���=��&���w�ag�߀�A�;�޻v%j`�{�|���xP	�=���նdZ#v�ѭdf�gN��2Vy3=�%^_�`����c<;I�ƒhN��$xvUЙ#�E��$c&�\Z��C��=24J|��X�Kw�Xv�q�o��&B���IP_@�V\0�Π�\Z���\0W]}�}�7x�x��W����/:?��J�(�{1�C��*#՞�b���u��6��ZD����c�I����\nZ�n,ʥ`�6Bw)Yu �#��c��<�n6m�ڙ�</�MdK@֡�rXgE�ג�xv��f����Z�i�w���F֋��!��;��\r�l��������<��e�y�^�','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:c0a8f181ca7ee0e3708f0a72235d49ea','�X�r�6}�W��@D0-%�\\D3��IZO�Kk73�ӁIȂDHZR$�{$x�i��b��✳��r<|������|a��L�|l���8�~O�\\�^������{*�8\r����8$�ߔ��{�%#s��k�2��*;�c��ԛ0{��5���3�rEH�Uk�v\Z�l�C��\ZX�����&BZ[����`�Lc&����6��F��&c!��~R�$�a�\0X[���1��L�wL�[��/#��Fi8�\"Ddi�%\"�+b{��\"&)\"��� t�Y�C�˯�_��8�bΠs���ϛ۳����+�>�؂ј�%��[I�d�\\ �a��b���9���0ɩ|Ɯ���������	������1�����\nU�l��[f�u�.Y{4�av}��y�\\��@__2%��y(��+�0���2\0�z�}}�����7+��B�3��Z�F��DC_\n�R�M:U62�x�8֩��l��я��{�1��8�0om|���,\0;�Qv������OO�.<,��H�6�A;����7�ĕ��7�`�I%��<.	�J�Y�ޫL�ѡ$���x�c�}]т��x�\n���l@�&�<�cT\rx�dq\"T����mQ�hUL�R�2��S-�ڢ4�ś�����0U���PĪ�4΂�����fw�^�+*P��%�.�_,R�rF���[@bp�o�����>�X����|��7�d��cF�|��Q�%�C[[]\r��֖��Y�Ȝ&�$�;��W=}(�@�/�����٢�;����d�^��S�C\n(�!��ɖ�3R��\Z�����~�]J�D|&?��1���	|�2�\"�  X���.�V}d���qlay|L���k���\n���kc.6(�2f�p���/]2�?�W�V��_s+��L��ێ�3*v�^�N�=/|�i_�A�ٶ]�nW[}x��WK�K��\Z�y9�����;���B\"f�ع��#u=��|\\ef�[�`W�\0� f���RP���n�xL+\"٤����b�@��cjţs����6�����\\>�:C���g���?A�o�T���9tV�Ck�����a�{��1f��t��ʹ�\\T��.6��9�gx�\'��P�M��[{mOVx�v�1Tt��M�n6�,O۰|��aa�۟��9��^�^�db��RC>��~Y�x�Ĥ19l|m�I�\n��s\Z�\ZaK�%*HWa��oAO�>�j�$���<ЀLIęǾne0�9D�Y\Z�>4y|P^�M��?�i�3��ab���� ��F�L�v��@w�_A�㱁�8§H5C��k��h�y�IV������i@����|��@�n���ߌ���ba?P�k�=�P@�<�W��a�AP�$2���QY6�\"����ua���2E�}5��l�$����م:Qj�d�Q�4�V��6`���gu@-��X����f���a[�(�OZ 0�-�!S��B;m[lMU� &�IhHM]|�ט��\Z���h`�IFg���y\Z�ó0%�J�}�A4\rnm�QO9��i3yJ�殆�|ӈhgOsIHA�t򶑂P%���⋭�o','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:ca566959d11770e34a5e9e05829e5a30','���k�0���Ac�� ���a��6kb��KE��}��U��KN�����p���z�&�V��2���@�d�*udQ���y��FX�I髜���S������+����k��\"����;���i%�#ms��������c5�*�)؄�>���Y�=�<q�\\��X�%|[K\\�F[Y��S끠�r� ^�Ϡ�FK��\Z�Pv�p�vc*r�>̀̃�d)�q_�n$�Qjg���&�H�K��o+��G���Lyf����/,��Y��|>/���a��0[6��W8�➋X�','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:d41d8cd98f00b204e9800998ecf8427e','+�2�RR�\0','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:e01926a28165c4b2e6c0d00f1a121d43','eP�N�0�E�\ZL<�א�=y0*�B�R(Ū�wi�{1�t:ӝ��Ow�����[!�1m��$�Aw���6{��2>��)��\'��2�^ہ�����;w0-�An�\\z�+9KL�S�j�V�A�5�I�G�{r����(	z�60o��:��������\'�ց�� �m�ř���]�R+�Ѽ��C[lKa�e3�\')�nL(����R����^���v�*��	U�Q딨!y�(��Q�z\Z�����N�\r�&R�Ͷ�!q�/(>���\'�','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:e7e4cd789e7ca3d56ff52099b8d2cf8e','�=�z�ƕ���W�\0�-%M�\0�U�v�ލ�4v���a��䈂4\0ZV)>Ͼ�������N��nL`.gΜ9sns0���~��/=�Ţ���v��$�y�Z�����K���6|���h¼\\��i��m�|7��f��ʦl�6b���W�FT�]X��B$O�*��\ZQi�T����4���[\'\'��{k�.�;/�F���\\Tu2�q���b+�-VH���w����<������x�峧_�Y|UV~����#h4�E�j��l<v�v������E0�O��O��O�O��6���o	�[\\���r)�4~�{\Z�\Z>~��<�4%S���wA|{��*%\0�pH�so��Ͷ*F��\'�WY!��d\nvzQ�۬X��x����Uw�M�����I\r�v�x�+�J��Dy��[a:M�}������3`��l&�1Y�|/�&\0L6�0���_����4��P�\Zg�]ɚ$I��FנR�\\Г��Ʈ\'���>O���ٴ���7�(+F�p`�D�FAX4����L�Y����0���2�\0Y���z��i�ڮE�Ԓ-��i�#v��/Wi^�[��i�u��M�F�)�����Jg	=ǰ�\'K���\"m�όfz��	汾�,��*[��z?����@���r�A``�(�Z������\"�\nW��z��Jr<�X%�m�Ը�ey�&��KU�<�5f!���묰�ld		��=k8�f�2jhS��,�0>�9�[�V��?RӁ��,��_\ro�6��c�P�ۂ%ҲKC�08C��=L6�;2,�{��ncg���޼�p�>�hA�Ԕ{���\r���n�	�T�.7�g��<|l�s�Q�YK\"���A�}�\'�Q�/E]�+#�6i��E���6L}�6�׈�`�PJ\'��_�S���X�W_Ng�*��5�^>�B�Ѳ��EYzX�\0��HN��&��Q:�S����0\rf(AA��-tQ\'��-&�i�\\b���9��;�l�k.�YF�i�{f8\Z��`2��A�������0��f�OD�H7�Ls������d�{رUL��)%�����DM\r��@3���T�F�,r�|ija���B���c���{���GNw�a�7������+���R��5/K.��[�c��q��-n�2�h��P�B���۴*Ypz*����k	òM�\0�r����\rB\rD\'��,74�����IſpL��;����c�s1)��u��U�o�q��E[r�>�k���t�¶��_�eR�[�i�e�D��ߣ$��	�{ �xcY7���z���o�C�K�� �WA�9�����n�kp�(�L(<G����n����街�S���\r���\r\\m�Tw�^\Zj���r�V�<��y(\n���ͱRI�:��};!7��[�r��rŊw�,F��z�� �_p-�q`���v�w谸���ڼ��1\0�~��6B�v��e�Z�mzˍ����A�R��#���f8*�fp�[��ۦΖ9��\n�݅��؇Ey�o�����ߙe��,�n)rm���5쾓J��?����i9�Bc�5x<@4�f�Xx���Q4>Մ��م�l+Tl���11:��w;��{���f�M���2mR �����Qe�M�l-^5�z�1r��+�\0�|�\\e��\r<=���^T�\\�1X8.Y-D�������!R;��N�I�]Y3��	�mB-S?Ŋn��\"�wW�S\0z�<�)�x��uh���DA��`b:N%�z���P��V�V?u�Z�Nn$�dr�6�R�eWEM	~��_��L*�.�	jx>3�̒Б{�(8��hK�5��!<��<��(�\\���>��U�� L\0��\Z�H��ff��?q4e��N��ms��߾�}��m\nB=^��2 �\"�i�e���m�Tb�Lu�mX��jA���@|/�%�� @2��J�/�M�h:�ʈexSΩ`�VoD��u����\n^=ϼ��l\Z�J��z�2�*�I���\0���HM��EP a������\0a�,D�	\0��^�7�r��N4�\'Z|CD{v���Us����d��Ԑ�=�����}��ђ�a�w\0R\"w�{�LҦ��z`a�\r.�����E\n�?l�2h+�|H=_�+2�����\\�p�!т&�<��o�\0Y��yħ�Y��[�_Kh�V��\0���	�£�����J�@~mP����N�	�-񫿺��q`�ab#Zc�����z.�K�|���S�Ԁ�ă*���U�Kÿ63�Ü۝XA�:`��Ggƶ��h�Uܐ�eN����^��q�z�֛�j<�Ř�*�Q��8�~*���;Pi�Zmy�&��J���f&:�$�]��倉��m��O|�k�Y[��:�\nC���z�V�_@�\"��r��EmNT@��2��̔�Pa%1�\\>��c�8O������Nnʬ��#��$\0�s���\Z\n�Vp��\rJ\0�{0�\Z�@`D״B��������:�r�l!�\Z�9:�5J����00��R[���v��_+h�2��R��ߠ���;2��p�3x\n=Vq�,[���e����:�[c�Uu�e2�$�c=��io���e�ۂ3�\"�uB����b�s4�|.gU 7�7��7�Po������L�Ġ���7-4������������YӠ����\rZI7g�E��\r��B�\0�)��*�����V=rz{�Ɂ�p.#-/ՒJB�cҖ���}����i�����rs������N?G\"�#��6X�a�3%�=�q��ն7���F�!��(a�s����0�\"|���\0��XS��-�����\Z��3����.�wbn��@���M�!Ud������A�+�c����,�]���g��0�G�I ����4*���Oq�N���wv��j#��I;u6I1``���ǽ�1�z�0��\\&?��`�O��c�D�WR��#NV�x�\'`:��Q��P=�](UC�l3�y��Ȇ�\'l�nl�V�+��h�J-\n��B�\0ʖ=��OZ��Ȫ�6\'Wl%�E\0�7@M��F\'��ǣ�ϼ�HCÌ��hhW*��l�6��.%]-�P|Ao.��e}��д�L��fπ�p�h��RI�W�v>/�\"o�]a��>#l�艳����Hd�Ф��Ɵ�@�J+\r	���09`�_-�l��u�Ж��$�I���m�GPN�װ}#����We]?+�x�s|���\ZC�{{�)��׌!%�	�;y��Z�]ĭ�3�t5܃Ֆ�!��3\0���PeI,p���F 3Y�]jM��6��m�\"��6r@�8�=���1��kϺ�ή@������pt��G�NO���y�Y�Jx�v�p\\+��7Y��_�e���=2\Z�F\0�7^�h�\'T\0OI4Έ�����Xe�ИJ�)4����x�o���9�Dnc�-�g��|���1�1��{��z��j[0+�6��; x��0?�F�v*\Z�xf0B�tt\'��,ʉ�F��(�\"���8��n��;������a�����ĚTI+��\"���a<\'�O�^��YW�ry��8�ҟa\'��bZ�Xy��0�\'P�3�T�o쭮���=b��\0�{d_p$E9H��/�t���\\\n���/��v\r@.�O�#D;��DQ�5�h0��u2���%�|� �zʍ6Ȟ��J\Z���\r�:w������\'�M���6ܴ���\nv>��!�����GR��Ӓ����d��:x\\uz�����qѷ��_u�����r����/�]�Z�2F9\"�5^m�C�IZ�Rzo<��;w��\\+�3&\n�М��|��/��P��Y	jǎM�ZmH%�H>��3�5�\Z�rT\0���E�/@��0`{ϵb��5�(?��\r�)�d��g8�[� �E;O�J���I4 B�2\"�gh)�!;���F��b�o=�mR����	�hp㔪l_\0뜩t��X���o#tv�cL��4�o;�!i������m�]���2�<dbN�g����c\'��s|�n��@N�ٮ�a\'VN��ptXG˭�\"�\"�6M��S9M�X��	Yd��_T�\'n�\0���}�I3�c����������w���*�����w���AEv8����NU$�fh6�e��a>t]��g�~id,����T��R�A���s\\:��~������j������r��(�%�z2\'s���k���%k�Z�l�^����\r8���&�%� �V�M��Hg���\"~{/F���DǺǔ�g�\'�S�\'���{�&㲔>��2\\l�\nJ�Jke@�9�ҍ8:�V����[���\ZH�N҄�&f=�=�-W����1>�|Yٺ\'��3RĲ/��\")7`�{{�3=Z��Z[��w��%P<�5�_>���Pd�Y��Q\"\r��|�;$w��MofIA,lE��hX�5����J-�&Ϛ:<Z�����0�<��\"2��?��V���+Ү�SN���X�r�ay��u�lh&j?��+��߁���%y�4��(���r˹%/\"���p{X�0`�jWݮ~���ق�\n��b����B/��.ɒ07����?;?G�ɯ>Θ�r��3��ޒ�Ʈ�&���*�ļJ}\rh�:��\\v	l.�ʂ}��I�����<�J���8�@��n�rLM@��4)@ P�̖��)���ɛ^��w)����ѱx�%�*%Ѭ&�=9pPO��)%I��i/�a���!�=v�r���;{,Qb��Ǌ���a�e�����U���w�%�&X�Bf\0z�y�T\\V��k*�����h�;\r)>m��h�\n�\\F����%�X�?�l,e���ܿc�f�9f��o���:=����n_<g�D�|`U��`9 ��.2������C2�9,�6r׮����|�X������!������XP�%[o86K�uu��s:Q���1�:-��*�Ǝ\'`��	�A��]e��,��ˁn\'��f���N�\Z=_\0�������cO�S���?���(E�0�ON��W��pI<q�}ʸ�����ݨKtj�\nB��U�ɭj��e̋�鉢e\'s�\"+O*D��9�ېC�^ufiS��F��oA|�}���e~+=�^�S���Y`%��2\'gA�L�3R՘QUnku�2z�xp\0�\'\"۫��O;s\"+��Oo�5���%�Gn��;T�&������+i����<�4�u&R�����\ZL��z&�kq\Z�`w�P�G=���S��E�����Ot&\0K���H����ã��R�:!����8����=mMFъ3P:���L\Z�&��-;a*c�eK;r���a��&�ɻlmTi�A۾)9T�S�:��C�\'���l9K�L`��aԢ��l�uY�ne�X?-L��J��;\Zt����������}��S�u��Y�C�؅ar��\"�a��G r��r��7��[�mw����Β��1�9HL���`�cb2~��׊Q�:��؇��9�J��~:c~�$�ڏ����Z�A\nuR�n��Ԥ��\ny�g\Zٺ��Y��D0�7��8�ԍ\n�lynGA��Jh���@%i�)r�C���&���(�T����u��=[�j���-�_P6�Ǎ0��5u��͸j�w�A�uFv/	��ߓ��n�O���j-���L�T��dC���\ré��:)xh���^��t7;�[$hJ��&�8Æ��xK�����ZG،�N�e!d!�K�tԿ��?~me(r���l�����*AN��V��M���2ǭ}Hn��I=���v�w����J8DUy�M9��(��L���zO��̥�@?l�g��\"6mi��BڇYNR2�;:�e�}�7��i6�e\\�����1�.�N�P\'<�����d�|\"	:>Q����ܜ���Iߥ2G���{{����H��ԑ�Y�k���8~�;��*�|���p��֔��押�BaB�;ޘ(�\"���l3��8Vk����:6�����fd����bG�����]���Ri����^m�~z���/k�6�R&���i�?QD�=��2��-��yc�6�p>����`8*�Q42Gz(������6�8fth=��(�ݺo�?��x�?�\nO�*)��S�ab2l�a@��\n#0�E}vA�I��$L���\"_��N��/���(������t�Y�l�ى��њ-�\rL�oJ�U����a�g\0y�Hq���&�g+,h/�\'ն�A��Ư�u�-t�.yHQp\'8b��������z������D�翁���l5�:����:��C�`��U�!���/\r��W�}�]����4��u�pgA���>�i(���{�T�+PI��$�\"�`��W�<�%�.�i�����pH�~�(�k�����Z�M���r�����%6~\rKrU���n#�T\ZE�.[�Е|����`�ܜ��`^����\nS���j���]�=�ђ�$�cJ��`�u,^�L���H������aX~z��wxa>�4��)#��}���۝:2@�7I?��97�GD��Hg�Z�<�A\n:��\0�e�[��v�D	�4_W��4�`(L�W15��$C����GĞo�(��R�d/�v��N����x���M}uw�����A��t}E]-�?hpo0�����l�J������J�r�q���B>QV����X�S{p�8��92�{Xe:\Z0s�FS���O\nsJ۔���O�B�^��p\"m*&�iD-�����z����S>��D��(���~��/�6N|z�߻�\'kVcY4|D��xaH\n%@ܞ����/~�{�\"�\"onjh�o��vH<��:���<L:��!n���^���-{��2�;>�]9(ҜC�p�h�d�ټ3?es[9�C��\'��}���=\"�\r���3i��4��e��*23�棗�#FsO�B�%\"׸�ќ;���1�Z���$�g��D�������M���_���\r��\'������?�@��R|��li�.��S�b88��ԠDTc�	����YjiX!�˻��)��IO¨�������6q�n��y<��a֍�C���O��F�w����\Z��fH�\Z?u�����E�9���ϿF�L��m٨�G�8ׅ�M�J���t��=�gv��uk��9���n�=x��t�p�S�=��,t&�7,�x?XC�(q�;*E7�@��((��9£Z�����z��*Ro���\\�F�`-��\0�dl��B=N�\ZI�z�%��ų|W�:�\n@w<��`�$NR�U*�3\0��{Ok\r\n��yqd�A�\"#����Э�9�_oxeoD/�WPO�u���n�&��@W���\r\Z�pRuՀ�Q6d���oD3��O���?���c&m\rZ﹪�#W���E����#�|�&]��J 6���gO^?A�v\0ˏ�m~a\nB�Uz��9q�9uS�̀�v�X�D��h(�\Z�Ѯ$��܌W�v�>�͖ �)jr]�o:z%�{rQ���[a�d�&N\n\"���Kz�C��z���\Zr�Sc̎Y?�;?�WN�M�j�u͚ksqw���}��|��W�v���wr�\'!�${�!��\'��v��\0�Yľ���5����h�m���R�I!M+*�N���G�w܋~a|�y�*�ť�\\���#��^E���&eE���.�����\nF�?��5\Z_݊G{��$���z���y�R���C�Y��\rwS^��sҽ����T�~��X�y���b��}����W��G�ٲ�8p���&͵(���v6�?�~�~�����غ��o)�mn�֞��N`M��;�����;N@�O�{_���{^,=ZI�7���Uy��DB��p�v�Z�P���yK�~��r+w^���m}�|1dg�(���|ojn�3�S��tUE�������|�̖�Kt|AW�� �΍�����/SU�\"�P�3_=;�A�G�wl��кfӮ���[������\"k�w���M&�C�R��U�U�#�����]�u��rtu��W�)uߥ��#2nK��������̪o����oׅ|��|�c���<�Gl;\\Ԇ�𣁡��q#��l9C��H�Y�/�tZ��Q[��������\0','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:eb27ade1efa95964cd9ee391be59c37a','�SMO�0�+(D�-��^�U�Ep�@�P�`�I���v�F���IJ��J>�3o�{3���ퟛef:����2�6�̀T�S�b\r���e���?���YY�VD�,���s�/=|��Ci�l5�#9ALW��\"{�jR��R8Q���K���8=~r��#�Pb\\k�������*X��$3�b�.�JUd^�4�]�\'Oc�mPvG����3����o��xFt$t������Y\n�);\Z���u�P\Z����1Y97�l��M�Xgb�~w���ҺH�ua��@��_e���D�C���xz#�$�.�PC�E���<«s:��>e����S��\n&x���a�X�0�:S��W\\@�G����\\n��WP��-K���:.\Z��W|h*�qj\0��ɸ�%Z��O�#T��q$�~�7w��x��','2018-01-15 03:57:06'),('global:resourceloader:filter:minify-js:7:ebca10a9c3bfb2306a904b0f2bcba22b','mTێ�0}�/�xX��*�Ku_�$�L�I2ė�KC�����M)Rde�\\<sf�a��m�w��ځB�@f�h��;��\n;H:�/����Ql�de$g��m~|K��?y���������)ۅ����UHi�Y4@:�]������ �؉�.�\0u���P�huq,2*����a�ua���ΪVKMr<[,�:��Jg]�ΐu���@�{\rJ��+���	zd��>C���W�_�:+\nց��@}��9/�ܚ�_����F��h�l�����A�&��i��H�w����,w�ɩБ9}�q(p�t�8�[�Kҷ�-�d��p\Z�ƪ��R\r�i��l_���6��َ|��PtSI�K6���L\n��tD_�ܠ�K��&C{�7���v#��f�A�e2j��C�gY�xt���U�9{f���8x���JE8L%��J�G�l��gB��2�9CL��%z�Zz,�	�܄����Y�4�\\��I��=���:�%x�ܺ�śkXS����������+�f����$I��v�\r�]~���Ƹ=��� VD/���畚��S��1O��T��dP:�����~����\rw_��o+0��<Ayh��}�5�,�*�� #\')�X!�f\\���1���߀�WH�j$�;q\\!G�q��0����Ј��������_','2018-01-15 03:57:06'),('wikipedia:messages:en','�;\n�0�\'x��y�R�&66��T�R��{�n���T�c��y�K�З��2��IN�b�ES�j���V�\r��hQqu�2>�y{]�΁��\\BH�,��','2038-01-19 03:14:07'),('wikipedia:pcache:idhash:1-0!canonical','�W�n�F�o>ņE��,��m���;�U��`M����]����\Z�}�>Ig�K��aq#���3���7�.B?�K�+�_:+�v;�\n�C7�a���������|J��*�靈Vf�Z��\Z��@�\\����Ŝ~���L�\"w�	�4IX�5h�[Π��ց�H4�F�r\0�Y.hB4b ����݉֙\n���l����8ْ������8M³�)ゎY��%Y4Z��[@��\"�A��H�\r�M��R�S(.�\r\Z%J���l��u�\0�̨�eb�h�p�\\��}�#�\Z,|��s�bwh�=���p��BA+���w�(�>��\n�]����p�XΠH�����4�QQ�	$r��Enr�U�� ��sR���+�Y���\";z��[����8gɾ+�H&���/�-�m�$)�IJ��!u��-*�,D��P�+��T�\'�I9�?�9~�ɩPI�d9S��#of�0��ar�XC?��dzG˚�h\n����ђDFHP��i��Ah�8���q����r�r\r��d��\ZMXL4<aH��y���:ۻ^�����|��N��sAS�c�5B2��b��孱������<�T�X9W��$�K��KȻ�O��P�DȘ��}tھg~�W�L0���˽��R����\"�F%\\S�OD���]; ws͔s��h���E\n�m�w���41Ft�2=�ܵ��s��18�2R�2���<�ZC�\"�a�2��L�T�D~��]���N[��9`R�3��2���\'--a���0�J?�Nf�����q=!�ln�!\'��HB�l��~�{Q!���Ƞͦ�W�0g�x����w�0��cZ����{��i腏�@��\0B\Z˜�e������y]����:a���k�~�AwKn���^�<����5�.�O�b�v�x®���E�/[�c����vp_�鄯��}������z~FY�;�+L㐩�Ԣ��!aM����-�ʦ��l6Z�1�<�6���:�C#�.��z}�s��\Z��\\~�\r1�7N�a�:��P��=�q��ef���Q�3]�u�dz�TC�\'U��3͗+�܉����L���*�U?�q�S?|�����Q¦,��ag�����$m���>[��H�Xn�|�4�E��g�g��Tc#�5��U��bǗ�T�����&2_�Xh�ߪNq+�\r�F�3��΄f(p�ˌ���P���������\n\nt<�x��Z�;�Ɏ1ꇂ�%���<���=��@$o�_m�`�e�2�Ѽ��\\|�fq������YN3���!�����=�L�Tӧ��x:�]��L��.0\\�{��c��uH�}n3�s�5�͠����a6�����!�Y�\0���<����r˨Blj/V�U�ު~����K��إw���\Z�ˉ14�T�B�м��r\Z+�Yr\Zځ��tW�E�Z����ֽos��>�1,{#��Z�(i����\Z��{��<�XA��T��PѦ�ͷ_>sC���Cj�2\\��}��D�t]Q�d�����6�\r��x�q�容6�Ia&k�6Xt�6����m��m�����MCޒ�:᩟���`Z�r�i!X�Pr;��f>?��g�+9m��\Z�F�v��!4)����ƶ��x_��p�\0���4��xe�}%��t���\\��M�����:�-�3��>�^<4�H�~����.r[�G�e���Y��&e������.&��v{ckhC?�{��s�����~�A�f��','2018-01-15 03:57:04'),('wikipedia:pcache:idoptions:1','E��\n�0��e��ִ��Q<x*�zm����(}w�x���i�m]w��0xB�I!%h8�������uLl5������4�Y�$��GM&%^�����pb���P�Ұ��U��W.����!�Ԇ��;�g�/�>s��','2018-01-15 03:57:04');
/*!40000 ALTER TABLE `objectcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldimage`
--

DROP TABLE IF EXISTS `oldimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldimage` (
  `oi_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_archive_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_size` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_width` int(11) NOT NULL DEFAULT '0',
  `oi_height` int(11) NOT NULL DEFAULT '0',
  `oi_bits` int(11) NOT NULL DEFAULT '0',
  `oi_description` varbinary(767) NOT NULL DEFAULT '',
  `oi_description_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `oi_user` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_user_text` varbinary(255) NOT NULL,
  `oi_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `oi_sha1` varbinary(32) NOT NULL DEFAULT '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldimage`
--

LOCK TABLES `oldimage` WRITE;
/*!40000 ALTER TABLE `oldimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_is_redirect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_is_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL,
  `page_counter` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`),
  KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,0,'Main_Page','',0,1,0.360019977529,'20180114035612',NULL,1,735,'wikitext',NULL,0);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_props`
--

DROP TABLE IF EXISTS `page_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL,
  UNIQUE KEY `pp_page_propname` (`pp_page`,`pp_propname`),
  UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_props`
--

LOCK TABLES `page_props` WRITE;
/*!40000 ALTER TABLE `page_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_restrictions`
--

DROP TABLE IF EXISTS `page_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_restrictions` (
  `pr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(10) unsigned DEFAULT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_restrictions`
--

LOCK TABLES `page_restrictions` WRITE;
/*!40000 ALTER TABLE `page_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagelinks`
--

DROP TABLE IF EXISTS `pagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagelinks` (
  `pl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `pl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  KEY `pl_backlinks_namespace` (`pl_from_namespace`,`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagelinks`
--

LOCK TABLES `pagelinks` WRITE;
/*!40000 ALTER TABLE `pagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_titles`
--

DROP TABLE IF EXISTS `protected_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` varbinary(767) DEFAULT '',
  `pt_reason_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL DEFAULT '',
  `pt_create_perm` varbinary(60) NOT NULL,
  UNIQUE KEY `pt_namespace_title` (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protected_titles`
--

LOCK TABLES `protected_titles` WRITE;
/*!40000 ALTER TABLE `protected_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `protected_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache`
--

DROP TABLE IF EXISTS `querycache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qc_namespace` int(11) NOT NULL DEFAULT '0',
  `qc_title` varbinary(255) NOT NULL DEFAULT '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache`
--

LOCK TABLES `querycache` WRITE;
/*!40000 ALTER TABLE `querycache` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache_info`
--

DROP TABLE IF EXISTS `querycache_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  PRIMARY KEY (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache_info`
--

LOCK TABLES `querycache_info` WRITE;
/*!40000 ALTER TABLE `querycache_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycachetwo`
--

DROP TABLE IF EXISTS `querycachetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qcc_namespace` int(11) NOT NULL DEFAULT '0',
  `qcc_title` varbinary(255) NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT '0',
  `qcc_titletwo` varbinary(255) NOT NULL DEFAULT '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycachetwo`
--

LOCK TABLES `querycachetwo` WRITE;
/*!40000 ALTER TABLE `querycachetwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycachetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recentchanges`
--

DROP TABLE IF EXISTS `recentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recentchanges` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rc_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `rc_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_user_text` varbinary(255) NOT NULL,
  `rc_namespace` int(11) NOT NULL DEFAULT '0',
  `rc_title` varbinary(255) NOT NULL DEFAULT '',
  `rc_comment` varbinary(767) NOT NULL DEFAULT '',
  `rc_comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rc_minor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_bot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_cur_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_this_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_last_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_source` varbinary(16) NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_logid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob,
  PRIMARY KEY (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`),
  KEY `rc_name_type_patrolled_timestamp` (`rc_namespace`,`rc_type`,`rc_patrolled`,`rc_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recentchanges`
--

LOCK TABLES `recentchanges` WRITE;
/*!40000 ALTER TABLE `recentchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `recentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `rd_from` int(10) unsigned NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varbinary(255) NOT NULL DEFAULT '',
  `rd_interwiki` varbinary(32) DEFAULT NULL,
  `rd_fragment` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect`
--

LOCK TABLES `redirect` WRITE;
/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `rev_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` varbinary(767) NOT NULL DEFAULT '',
  `rev_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rev_user_text` varbinary(255) NOT NULL DEFAULT '',
  `rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_len` int(10) unsigned DEFAULT NULL,
  `rev_parent_id` int(10) unsigned DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT '',
  `rev_content_model` varbinary(32) DEFAULT NULL,
  `rev_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`rev_id`),
  KEY `rev_page_id` (`rev_page`,`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`),
  KEY `page_user_timestamp` (`rev_page`,`rev_user`,`rev_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=1024 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,1,'',0,'MediaWiki default','20180114035612',0,0,735,0,'a5wehuldd0go2uniagwvx66n6c80irq',NULL,NULL);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision_comment_temp`
--

DROP TABLE IF EXISTS `revision_comment_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision_comment_temp` (
  `revcomment_rev` int(10) unsigned NOT NULL,
  `revcomment_comment_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`revcomment_rev`,`revcomment_comment_id`),
  UNIQUE KEY `revcomment_rev` (`revcomment_rev`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision_comment_temp`
--

LOCK TABLES `revision_comment_temp` WRITE;
/*!40000 ALTER TABLE `revision_comment_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `revision_comment_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_identifiers`
--

DROP TABLE IF EXISTS `site_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_identifiers` (
  `si_site` int(10) unsigned NOT NULL,
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL,
  UNIQUE KEY `site_ids_type` (`si_type`,`si_key`),
  KEY `site_ids_site` (`si_site`),
  KEY `site_ids_key` (`si_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_identifiers`
--

LOCK TABLES `site_identifiers` WRITE;
/*!40000 ALTER TABLE `site_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_stats`
--

DROP TABLE IF EXISTS `site_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_edits` bigint(20) unsigned DEFAULT '0',
  `ss_good_articles` bigint(20) unsigned DEFAULT '0',
  `ss_total_pages` bigint(20) DEFAULT '-1',
  `ss_users` bigint(20) DEFAULT '-1',
  `ss_active_users` bigint(20) DEFAULT '-1',
  `ss_images` int(11) DEFAULT '0',
  PRIMARY KEY (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_stats`
--

LOCK TABLES `site_stats` WRITE;
/*!40000 ALTER TABLE `site_stats` DISABLE KEYS */;
INSERT INTO `site_stats` VALUES (1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `site_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `site_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_global_key` varbinary(32) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(32) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varbinary(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL,
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `sites_global_key` (`site_global_key`),
  KEY `sites_type` (`site_type`),
  KEY `sites_group` (`site_group`),
  KEY `sites_source` (`site_source`),
  KEY `sites_language` (`site_language`),
  KEY `sites_protocol` (`site_protocol`),
  KEY `sites_domain` (`site_domain`),
  KEY `sites_forward` (`site_forward`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_summary`
--

DROP TABLE IF EXISTS `tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_summary` (
  `ts_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts_rc_id` int(11) DEFAULT NULL,
  `ts_log_id` int(10) unsigned DEFAULT NULL,
  `ts_rev_id` int(10) unsigned DEFAULT NULL,
  `ts_tags` blob NOT NULL,
  PRIMARY KEY (`ts_id`),
  UNIQUE KEY `tag_summary_rc_id` (`ts_rc_id`),
  UNIQUE KEY `tag_summary_log_id` (`ts_log_id`),
  UNIQUE KEY `tag_summary_rev_id` (`ts_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_summary`
--

LOCK TABLES `tag_summary` WRITE;
/*!40000 ALTER TABLE `tag_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatelinks`
--

DROP TABLE IF EXISTS `templatelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatelinks` (
  `tl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `tl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tl_from`,`tl_namespace`,`tl_title`),
  KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`),
  KEY `tl_backlinks_namespace` (`tl_from_namespace`,`tl_namespace`,`tl_title`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatelinks`
--

LOCK TABLES `templatelinks` WRITE;
/*!40000 ALTER TABLE `templatelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `old_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY (`old_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=10240 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'<strong>MediaWiki has been installed.</strong>\n\nConsult the [https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]','utf-8');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcache`
--

DROP TABLE IF EXISTS `transcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` blob,
  `tc_time` binary(14) NOT NULL,
  PRIMARY KEY (`tc_url`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcache`
--

LOCK TABLES `transcache` WRITE;
/*!40000 ALTER TABLE `transcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `updatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updatelog` (
  `ul_key` varbinary(255) NOT NULL,
  `ul_value` blob,
  PRIMARY KEY (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updatelog`
--

LOCK TABLES `updatelog` WRITE;
/*!40000 ALTER TABLE `updatelog` DISABLE KEYS */;
INSERT INTO `updatelog` VALUES ('PingBack','eed913d85a8bfef0eed93865a192d906'),('Pingback-1.30.0',NULL),('filearchive-fa_major_mime-patch-fa_major_mime-chemical.sql',NULL),('image-img_major_mime-patch-img_major_mime-chemical.sql',NULL),('oldimage-oi_major_mime-patch-oi_major_mime-chemical.sql',NULL),('user_former_groups-ufg_group-patch-ufg_group-length-increase-255.sql',NULL),('user_groups-ug_group-patch-ug_group-length-increase-255.sql',NULL),('user_properties-up_property-patch-up_property.sql',NULL);
/*!40000 ALTER TABLE `updatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadstash`
--

DROP TABLE IF EXISTS `uploadstash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadstash` (
  `us_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `us_user` int(10) unsigned NOT NULL,
  `us_key` varbinary(255) NOT NULL,
  `us_orig_path` varbinary(255) NOT NULL,
  `us_path` varbinary(255) NOT NULL,
  `us_source_type` varbinary(50) DEFAULT NULL,
  `us_timestamp` varbinary(14) NOT NULL,
  `us_status` varbinary(50) NOT NULL,
  `us_chunk_inx` int(10) unsigned DEFAULT NULL,
  `us_props` blob,
  `us_size` int(10) unsigned NOT NULL,
  `us_sha1` varbinary(31) NOT NULL,
  `us_mime` varbinary(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `us_image_width` int(10) unsigned DEFAULT NULL,
  `us_image_height` int(10) unsigned DEFAULT NULL,
  `us_image_bits` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_key` (`us_key`),
  KEY `us_user` (`us_user`),
  KEY `us_timestamp` (`us_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadstash`
--

LOCK TABLES `uploadstash` WRITE;
/*!40000 ALTER TABLE `uploadstash` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploadstash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varbinary(255) NOT NULL DEFAULT '',
  `user_real_name` varbinary(255) NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinyblob NOT NULL,
  `user_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(11) DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`),
  KEY `user_email` (`user_email`(50))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','',':pbkdf2:sha512:30000:64:EQuM3OWqTPTgl1vKZd/4kg==:H/6gkJdD77yjwIRDQu0tRt07C0i6KfQCRtRS95ipCZyZR5dlf3lBNZ5Kz09bHB52I7FQgtPgKw+LN8SoCIHoAw==','',NULL,'','20180114035619','24bdb78371fbd3fce854b46f7eafff44',NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,'20180114035612',0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_former_groups`
--

DROP TABLE IF EXISTS `user_former_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_former_groups` (
  `ufg_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ufg_group` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ufg_user`,`ufg_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_former_groups`
--

LOCK TABLES `user_former_groups` WRITE;
/*!40000 ALTER TABLE `user_former_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_former_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `ug_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ug_group` varbinary(255) NOT NULL DEFAULT '',
  `ug_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`),
  KEY `ug_expiry` (`ug_expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'bureaucrat',NULL),(1,'sysop',NULL);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_newtalk`
--

DROP TABLE IF EXISTS `user_newtalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_newtalk` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` varbinary(14) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_newtalk`
--

LOCK TABLES `user_newtalk` WRITE;
/*!40000 ALTER TABLE `user_newtalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_newtalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_properties`
--

DROP TABLE IF EXISTS `user_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_properties` (
  `up_user` int(10) unsigned NOT NULL,
  `up_property` varbinary(255) NOT NULL,
  `up_value` blob,
  PRIMARY KEY (`up_user`,`up_property`),
  KEY `user_properties_property` (`up_property`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_properties`
--

LOCK TABLES `user_properties` WRITE;
/*!40000 ALTER TABLE `user_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valid_tag`
--

DROP TABLE IF EXISTS `valid_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valid_tag` (
  `vt_tag` varbinary(255) NOT NULL,
  PRIMARY KEY (`vt_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valid_tag`
--

LOCK TABLES `valid_tag` WRITE;
/*!40000 ALTER TABLE `valid_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `valid_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlist` (
  `wl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT '0',
  `wl_title` varbinary(255) NOT NULL DEFAULT '',
  `wl_notificationtimestamp` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`wl_id`),
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`),
  KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-14 10:00:08