-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	5.5.64-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 分类',7,'add_category'),(20,'Can change 分类',7,'change_category'),(21,'Can delete 分类',7,'delete_category'),(22,'Can add 文章',8,'add_post'),(23,'Can change 文章',8,'change_post'),(24,'Can delete 文章',8,'delete_post'),(25,'Can add 标签',9,'add_tag'),(26,'Can change 标签',9,'change_tag'),(27,'Can delete 标签',9,'delete_tag'),(28,'Can add 友链',10,'add_link'),(29,'Can change 友链',10,'change_link'),(30,'Can delete 友链',10,'delete_link'),(31,'Can add 侧边栏',11,'add_sidebar'),(32,'Can change 侧边栏',11,'change_sidebar'),(33,'Can delete 侧边栏',11,'delete_sidebar'),(34,'Can add 评论',12,'add_comment'),(35,'Can change 评论',12,'change_comment'),(36,'Can delete 评论',12,'delete_comment'),(37,'Can view log entry',1,'view_logentry'),(38,'Can view group',3,'view_group'),(39,'Can view permission',2,'view_permission'),(40,'Can view user',4,'view_user'),(41,'Can view 分类',7,'view_category'),(42,'Can view 文章',8,'view_post'),(43,'Can view 标签',9,'view_tag'),(44,'Can view 评论',12,'view_comment'),(45,'Can view 友链',10,'view_link'),(46,'Can view 侧边栏',11,'view_sidebar'),(47,'Can view content type',5,'view_contenttype'),(48,'Can view session',6,'view_session'),(49,'Can add Bookmark',13,'add_bookmark'),(50,'Can change Bookmark',13,'change_bookmark'),(51,'Can delete Bookmark',13,'delete_bookmark'),(52,'Can add User Setting',14,'add_usersettings'),(53,'Can change User Setting',14,'change_usersettings'),(54,'Can delete User Setting',14,'delete_usersettings'),(55,'Can add User Widget',15,'add_userwidget'),(56,'Can change User Widget',15,'change_userwidget'),(57,'Can delete User Widget',15,'delete_userwidget'),(58,'Can add log entry',16,'add_log'),(59,'Can change log entry',16,'change_log'),(60,'Can delete log entry',16,'delete_log'),(61,'Can view Bookmark',13,'view_bookmark'),(62,'Can view log entry',16,'view_log'),(63,'Can view User Setting',14,'view_usersettings'),(64,'Can view User Widget',15,'view_userwidget');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$OqViL6XVEbad$GOYtNL5zS7Siu8nIPeNQnM7KDxlKbb4SFHcELwhI9cU=','2019-12-27 05:50:53',1,'admin','','','admin@163.com',1,1,'2019-11-27 03:14:18'),(2,'pbkdf2_sha256$36000$uVRniD5tkA6V$54ls3eF9WykYcPoehE11ImQINZTZAJNyMU9oPAqxJr4=','2019-12-26 06:23:31',0,'wadayu','','','',1,1,'2019-11-28 07:03:00'),(3,'pbkdf2_sha256$36000$4XmVsDOStJUX$317AKA3MJqPL29R/XG7mr5N+o6IjWt0HMnUbz3TC3oo=','2019-12-26 08:27:09',0,'daoyun','','','',1,1,'2019-12-17 07:30:00');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (42,2,13),(43,2,14),(44,2,15),(4,2,19),(5,2,20),(6,2,21),(7,2,22),(8,2,23),(9,2,24),(10,2,25),(11,2,26),(12,2,27),(13,2,28),(14,2,29),(15,2,30),(46,2,31),(34,2,32),(35,2,33),(1,2,34),(2,2,35),(3,2,36),(36,2,41),(37,2,42),(38,2,43),(39,2,44),(40,2,45),(41,2,46),(45,2,47),(48,3,7),(50,3,13),(51,3,14),(52,3,15),(19,3,22),(20,3,23),(21,3,24),(53,3,34),(54,3,35),(55,3,36),(49,3,42),(56,3,44),(47,3,47);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `is_nav` tinyint(1) NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30036 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'战争',1,1,'2019-11-28 00:21:33'),(2,'科幻',1,1,'2019-11-28 02:44:31'),(3,'爱情',1,0,'2019-11-28 07:15:20'),(4,'恐怖',1,0,'2019-11-28 07:15:29'),(6,'抒情',0,0,'2019-11-30 08:55:25');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_time` datetime NOT NULL,
  `target_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_target_id_0bacbd88` (`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (29,'<p>梁山好汉 去梁山喝酒 吃老虎肉</p>\n','梁山',1,'2019-12-25 08:57:03',6);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-12-17 03:24:02','6','孔乙己评论添加成功',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,2),(2,'2019-12-17 03:32:20','6','孔乙己评论添加成功',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,2),(3,'2019-12-17 03:32:56','6','孔乙己评论添加成功',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',12,2),(4,'2019-12-17 03:33:39','4','孔乙己',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,2),(5,'2019-12-17 06:38:53','2','wadayu',2,'[{\"changed\": {\"fields\": [\"is_superuser\", \"last_login\"]}}]',4,1),(6,'2019-12-17 06:40:23','2','wadayu',2,'[{\"changed\": {\"fields\": [\"user_permissions\", \"last_login\"]}}]',4,1),(7,'2019-12-17 06:49:52','6','战争',3,'',9,2),(8,'2019-12-17 06:49:59','7','11',1,'[{\"added\": {}}]',9,2),(9,'2019-12-17 06:50:03','8','11',1,'[{\"added\": {}}]',9,2),(10,'2019-12-17 07:14:37','None','11',1,'[{\"added\": {}}]',9,2),(11,'2019-12-17 07:14:45','8','11',3,'',9,2),(12,'2019-12-17 07:14:45','7','11',3,'',9,2),(13,'2019-12-17 07:15:12','None','战争',1,'[{\"added\": {}}]',9,2),(14,'2019-12-17 07:30:54','3','daoyun',1,'[{\"added\": {}}]',4,1),(15,'2019-12-17 07:31:29','3','daoyun',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"user_permissions\"]}}]',4,1),(16,'2019-12-17 07:53:11','7','我的父亲评论添加成功',1,'[{\"added\": {}}]',12,1),(17,'2019-12-17 07:58:10','None','抒情',1,'[{\"added\": {}}]',7,1),(18,'2019-12-17 07:58:28','None','战争',1,'[{\"added\": {}}]',9,1),(19,'2019-12-19 06:51:42','6','孔乙己评论添加成功',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',12,1),(20,'2019-12-19 08:25:47','4','孔乙己',3,'',8,1),(21,'2019-12-19 08:26:23','5','人民的主义',3,'',8,1),(22,'2019-12-19 08:28:12','7','孔乙己',1,'[{\"added\": {}}]',8,1),(23,'2019-12-19 08:30:53','7','孔乙己',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(24,'2019-12-19 08:34:28','7','孔乙己',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(25,'2019-12-19 08:35:50','7','孔乙己',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(26,'2019-12-19 08:36:59','7','孔乙己',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(27,'2019-12-19 09:20:49','7','孔乙己',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(28,'2019-12-19 09:22:43','8','测试',1,'[{\"added\": {}}]',8,1),(29,'2019-12-19 09:25:22','8','测试',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(30,'2019-12-21 07:18:53','4','最近评论',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',11,1),(31,'2019-12-21 07:19:09','4','最近评论',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',11,1),(32,'2019-12-21 07:43:53','1','欢迎交流资源',2,'[{\"changed\": {\"fields\": [\"title\", \"content\"]}}]',11,1),(33,'2019-12-21 07:44:12','1','欢迎交流咨询',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',11,1),(34,'2019-12-21 07:44:16','1','欢迎交流咨询',2,'[]',11,1),(35,'2019-12-21 07:44:44','1','欢迎交流咨询',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',11,1),(36,'2019-12-21 07:46:05','1','欢迎交流咨询!',2,'[{\"changed\": {\"fields\": [\"title\", \"content\"]}}]',11,1),(37,'2019-12-21 07:47:16','1','欢迎交流咨询!',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',11,1),(38,'2019-12-21 07:47:34','1','欢迎交流咨询!',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',11,1),(39,'2019-12-21 07:48:00','1','欢迎交流咨询!',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',11,1),(40,'2019-12-21 08:07:46','7','11',1,'[{\"added\": {}}]',7,1),(41,'2019-12-21 08:07:49','8','22',1,'[{\"added\": {}}]',7,1),(42,'2019-12-21 08:07:55','9','33',1,'[{\"added\": {}}]',7,1),(43,'2019-12-21 08:08:01','10','44',1,'[{\"added\": {}}]',7,1),(44,'2019-12-21 08:08:05','11','55',1,'[{\"added\": {}}]',7,1),(45,'2019-12-21 08:08:08','12','66',1,'[{\"added\": {}}]',7,1),(46,'2019-12-21 08:16:23','13','77',1,'[{\"added\": {}}]',7,1),(47,'2019-12-21 08:16:26','14','88',1,'[{\"added\": {}}]',7,1),(48,'2019-12-21 08:16:30','15','99',1,'[{\"added\": {}}]',7,1),(49,'2019-12-21 08:16:33','16','00',1,'[{\"added\": {}}]',7,1),(50,'2019-12-21 08:16:47','17','111',1,'[{\"added\": {}}]',7,1),(51,'2019-12-21 08:17:05','18','222',1,'[{\"added\": {}}]',7,1),(52,'2019-12-21 08:17:08','19','333',1,'[{\"added\": {}}]',7,1),(53,'2019-12-21 08:17:11','20','444',1,'[{\"added\": {}}]',7,1),(54,'2019-12-21 08:17:51','21','555',1,'[{\"added\": {}}]',7,1),(55,'2019-12-21 08:17:53','22','666',1,'[{\"added\": {}}]',7,1),(56,'2019-12-21 08:17:57','23','777',1,'[{\"added\": {}}]',7,1),(57,'2019-12-21 08:18:55','23','777',3,'',7,1),(58,'2019-12-21 08:18:55','22','666',3,'',7,1),(59,'2019-12-21 08:19:42','24','666',1,'[{\"added\": {}}]',7,1),(60,'2019-12-21 08:19:45','25','777',1,'[{\"added\": {}}]',7,1),(61,'2019-12-21 08:19:48','26','888',1,'[{\"added\": {}}]',7,1),(62,'2019-12-21 08:22:38','26','888',3,'',7,1),(63,'2019-12-21 08:22:38','25','777',3,'',7,1),(64,'2019-12-21 08:22:38','24','666',3,'',7,1),(65,'2019-12-21 08:23:20','27','666',1,'[{\"added\": {}}]',7,1),(66,'2019-12-21 08:23:23','28','777',1,'[{\"added\": {}}]',7,1),(67,'2019-12-21 08:26:10','28','777',3,'',7,1),(68,'2019-12-21 08:26:10','27','666',3,'',7,1),(69,'2019-12-21 08:26:39','29','123',1,'[{\"added\": {}}]',7,1),(70,'2019-12-21 08:26:42','30','456',1,'[{\"added\": {}}]',7,1),(71,'2019-12-21 08:27:31','30','456',3,'',7,1),(72,'2019-12-21 08:27:31','29','123',3,'',7,1),(73,'2019-12-21 08:40:09','31','663',1,'[{\"added\": {}}]',7,1),(74,'2019-12-21 08:40:12','32','aeter',1,'[{\"added\": {}}]',7,1),(75,'2019-12-21 08:40:22','33','wer',1,'[{\"added\": {}}]',7,1),(76,'2019-12-21 08:40:25','34','qwer',1,'[{\"added\": {}}]',7,1),(77,'2019-12-21 09:23:37','34','qwer',3,'',7,1),(78,'2019-12-21 09:23:37','33','wer',3,'',7,1),(79,'2019-12-21 09:23:38','32','aeter',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'blog','category'),(8,'blog','post'),(9,'blog','tag'),(12,'comment','comment'),(10,'config','link'),(11,'config','sidebar'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(13,'xadmin','bookmark'),(16,'xadmin','log'),(14,'xadmin','usersettings'),(15,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-12-17 03:17:38'),(2,'auth','0001_initial','2019-12-17 03:17:38'),(3,'admin','0001_initial','2019-12-17 03:17:38'),(4,'admin','0002_logentry_remove_auto_add','2019-12-17 03:17:38'),(5,'contenttypes','0002_remove_content_type_name','2019-12-17 03:17:38'),(6,'auth','0002_alter_permission_name_max_length','2019-12-17 03:17:38'),(7,'auth','0003_alter_user_email_max_length','2019-12-17 03:17:38'),(8,'auth','0004_alter_user_username_opts','2019-12-17 03:17:38'),(9,'auth','0005_alter_user_last_login_null','2019-12-17 03:17:38'),(10,'auth','0006_require_contenttypes_0002','2019-12-17 03:17:38'),(11,'auth','0007_alter_validators_add_error_messages','2019-12-17 03:17:38'),(12,'auth','0008_alter_user_username_max_length','2019-12-17 03:17:38'),(13,'blog','0001_initial','2019-12-17 03:17:39'),(14,'blog','0002_auto_20191128_1119','2019-12-17 03:17:39'),(15,'blog','0003_auto_20191217_1116','2019-12-17 03:17:39'),(16,'comment','0001_initial','2019-12-17 03:17:39'),(17,'comment','0002_auto_20191217_1045','2019-12-17 03:17:39'),(18,'config','0001_initial','2019-12-17 03:17:39'),(19,'config','0002_auto_20191128_1119','2019-12-17 03:17:39'),(20,'sessions','0001_initial','2019-12-17 03:17:39'),(21,'blog','0004_auto_20191217_1445','2019-12-17 06:45:06'),(22,'blog','0005_remove_tag_owner','2019-12-17 06:49:07'),(23,'comment','0003_auto_20191218_0827','2019-12-18 00:27:35'),(24,'comment','0004_auto_20191218_1009','2019-12-18 02:09:39'),(25,'comment','0005_auto_20191218_1956','2019-12-18 12:09:55'),(26,'comment','0006_auto_20191218_2010','2019-12-18 12:10:25'),(27,'blog','0006_post_content_html','2019-12-19 08:24:02'),(28,'xadmin','0001_initial','2019-12-21 10:02:41'),(29,'xadmin','0002_log','2019-12-21 10:02:42'),(30,'xadmin','0003_auto_20160715_0100','2019-12-21 10:02:42'),(31,'blog','0007_auto_20191223_1123','2019-12-23 03:23:15');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ab6gz8awbbyc1myj39u1c0ha5z9ymsct','YzIzOWJlMWEzYzI3YzU0MDUwNGFhNzhjYzUxNWI4MzlhN2Y3YWJkMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YzYwYWFkZDZjMGJiY2I4YmFjOTY2ODAwZmI4ZjMyNjE2OTQzMGYwIiwiTElTVF9RVUVSWSI6W1siYmxvZyIsInBvc3QiXSwiIl19','2020-01-10 06:35:12'),('pvpgquc3qh6wq1lmdh3mza2ukrmhsv4z','YzIzOWJlMWEzYzI3YzU0MDUwNGFhNzhjYzUxNWI4MzlhN2Y3YWJkMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YzYwYWFkZDZjMGJiY2I4YmFjOTY2ODAwZmI4ZjMyNjE2OTQzMGYwIiwiTElTVF9RVUVSWSI6W1siYmxvZyIsInBvc3QiXSwiIl19','2020-01-07 00:57:02'),('wnbaihnv6e1xw9fi1wch5gj5vdbyicee','YzIzOWJlMWEzYzI3YzU0MDUwNGFhNzhjYzUxNWI4MzlhN2Y3YWJkMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YzYwYWFkZDZjMGJiY2I4YmFjOTY2ODAwZmI4ZjMyNjE2OTQzMGYwIiwiTElTVF9RVUVSWSI6W1siYmxvZyIsInBvc3QiXSwiIl19','2020-01-07 11:28:49');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `href` varchar(200) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `weight` int(10) unsigned NOT NULL,
  `created_time` datetime NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_owner_id_160ec096_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `link_owner_id_160ec096_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,'百度官网','https://www.baidu.com',1,1,'2019-12-16 11:39:09',2),(2,'致医官网','http://www.zhiyihealth.com',1,1,'2019-12-16 11:39:30',2),(3,'京东官网','https://www.jd.com',1,1,'2019-12-16 11:39:51',2);
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `desc` varchar(1024) NOT NULL,
  `content` longtext NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_time` datetime NOT NULL,
  `owner_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `pv` int(10) unsigned NOT NULL,
  `uv` int(10) unsigned NOT NULL,
  `content_html` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_owner_id_6edad26e_fk_auth_user_id` (`owner_id`),
  KEY `post_category_id_475713ab_fk_category_id` (`category_id`),
  CONSTRAINT `post_category_id_475713ab_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `post_owner_id_6edad26e_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'我的超人朋友','上礼单就立刻发家里卡收集的卡拉胶克鲁赛德阿斯蒂芬阿萨德','sfgdfgsf',1,'2019-11-28 03:21:45',1,2,8,3,'<p>sfgdfgsf</p>\n'),(2,'我的父亲','讲述关于我的父亲的信息','asdfasfadsfadfs',1,'2019-11-28 07:13:20',1,1,4,4,''),(3,'抗日战争','战争发生的故事','嘉陵江路发送到',1,'2019-11-28 08:21:18',2,1,11,5,''),(6,'水浒传','讲述梁山英雄好汉的故事','阿斯顿发送到',1,'2019-12-16 00:48:18',2,1,6,5,''),(7,'孔乙己','描述关于孔乙己的故事描述关于孔乙己的故事描述关于孔乙己的','<p>&nbsp;</p>\r\n\r\n<p>11111111111111111</p>\r\n\r\n<p>&nbsp;</p>',1,'2019-12-19 08:28:12',1,6,67,8,'&lt;p&gt;&nbsp;&lt;/p&gt;&lt;p&gt;11111111111111111&lt;/p&gt;&lt;p&gt;&nbsp;&lt;/p&gt;'),(11,'django-ckeditor upload image and settings 完全解决方案','django-ckeditor upload image and settings 完全解决方案。实践出真知','<p>个人项目用到了ckeditor 前面配置，使用什么都很简单流水设置。。。<br />\r\n详细教程见： https://github.com/riklaunim/django-ckeditor/tree/master/ckeditor/static/ckeditor/ckeditor</p>\r\n\r\n<p>Now:<br />\r\n现在想要实现后台上传图片功能：<br />\r\n首先：改变 models.py</p>\r\n\r\n<ol>\r\n	<li><span style=\"color:#e74c3c\"><strong><span style=\"background-color:null\">from ckeditor_uploader.fields import RichTextUploadingField</span></strong></span></li>\r\n	<li><span style=\"color:#e74c3c\"><strong><span style=\"background-color:null\">...</span></strong></span></li>\r\n	<li><span style=\"color:#e74c3c\"><strong><span style=\"background-color:null\">class Post(models.Model):</span></strong></span></li>\r\n	<li><span style=\"color:#e74c3c\"><strong><span style=\"background-color:null\">&nbsp; &nbsp; ...</span></strong></span></li>\r\n	<li><span style=\"color:#e74c3c\"><strong><span style=\"background-color:null\">&nbsp; &nbsp; body = RichTextUploadingField(verbose_name=&#39;正文&#39;) &nbsp;# 在你的正文里加上这</span></strong><span style=\"background-color:null\">种Field&nbsp;</span></span></li>\r\n</ol>\r\n\r\n<p>更改设置文件 settings.py</p>\r\n\r\n<p>INSTALLED_APPS = (<br />\r\n&nbsp; &nbsp; ...<br />\r\n&nbsp; &nbsp; &#39;ckeditor&#39;,<br />\r\n&nbsp; &nbsp; &#39;ckeditor_uploader&#39;,<br />\r\n)</p>\r\n\r\n<p># Media files<br />\r\nMEDIA_URL = &#39;/uploader/&#39; &nbsp;# 你的media url 在Url显示并没什么关系<br />\r\nMEDIA_ROOT = &#39;.../media/&#39; # 你media 的绝对地址。从根目录到你的media目录:/root/.../media/</p>\r\n\r\n<p>#注意！ media 目录与 CKEDITOR_UPLOAD_PATH 是相对的所以：<br />\r\n# Ckeditor settings<br />\r\nCKEDITOR_UPLOAD_PATH = &quot;uploads/&quot; &nbsp;# 他的目录相对与media root 就是 media root + CKEDITOR_UPLOAD_PATH 不能写成&quot;/uploads/&quot;<br />\r\nCKEDITOR_JQUERY_URL = &#39;js/jquery.min.js&#39;<br />\r\nCKEDITOR_IMAGE_BACKEND = &#39;pillow&#39; &nbsp;# 图像库支持需要安装 PIL</p>\r\n\r\n<p># 这个设置看你的偏好。。。仅仅是一个exsample</p>\r\n\r\n<ol>\r\n	<li>CKEDITOR_CONFIGS = {</li>\r\n	<li>&nbsp; &nbsp; &#39;default&#39;: {</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &#39;update&#39;: [&#39;Image&#39;, &#39;Update&#39;, &#39;Flash&#39;, &#39;Table&#39;, &#39;HorizontalRule&#39;, &#39;Smiley&#39;, &#39;SpecialChar&#39;, &#39;PageBreak&#39;],</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &#39;skin&#39;: &#39;moono&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; # &#39;skin&#39;: &#39;office2013&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &#39;toolbar_Basic&#39;: [</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [&#39;Source&#39;, &#39;-&#39;, &#39;Bold&#39;, &#39;Italic&#39;]</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; ],</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &#39;toolbar_YourCustomToolbarConfig&#39;: [</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;document&#39;, &#39;items&#39;: [&#39;Source&#39;, &#39;-&#39;, &#39;Save&#39;, &#39;NewPage&#39;, &#39;Preview&#39;, &#39;Print&#39;, &#39;-&#39;, &#39;Templates&#39;]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;clipboard&#39;, &#39;items&#39;: [&#39;Cut&#39;, &#39;Copy&#39;, &#39;Paste&#39;, &#39;PasteText&#39;, &#39;PasteFromWord&#39;, &#39;-&#39;, &#39;Undo&#39;, &#39;Redo&#39;]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;editing&#39;, &#39;items&#39;: [&#39;Find&#39;, &#39;Replace&#39;, &#39;-&#39;, &#39;SelectAll&#39;]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;forms&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;items&#39;: [&#39;Form&#39;, &#39;Checkbox&#39;, &#39;Radio&#39;, &#39;TextField&#39;, &#39;Textarea&#39;, &#39;Select&#39;, &#39;Button&#39;, &#39;ImageButton&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;HiddenField&#39;]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;/&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;basicstyles&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;items&#39;: [&#39;Bold&#39;, &#39;Italic&#39;, &#39;Underline&#39;, &#39;Strike&#39;, &#39;Subscript&#39;, &#39;Superscript&#39;, &#39;-&#39;, &#39;RemoveFormat&#39;]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;paragraph&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;items&#39;: [&#39;NumberedList&#39;, &#39;BulletedList&#39;, &#39;-&#39;, &#39;Outdent&#39;, &#39;Indent&#39;, &#39;-&#39;, &#39;Blockquote&#39;, &#39;CreateDiv&#39;, &#39;-&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;JustifyLeft&#39;, &#39;JustifyCenter&#39;, &#39;JustifyRight&#39;, &#39;JustifyBlock&#39;, &#39;-&#39;, &#39;BidiLtr&#39;, &#39;BidiRtl&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;Language&#39;]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;links&#39;, &#39;items&#39;: [&#39;Link&#39;, &#39;Unlink&#39;, &#39;Anchor&#39;]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;insert&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;items&#39;: [&#39;Image&#39;, &#39;Flash&#39;, &#39;Table&#39;, &#39;HorizontalRule&#39;, &#39;Smiley&#39;, &#39;SpecialChar&#39;, &#39;PageBreak&#39;, &#39;Iframe&#39;]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;/&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;styles&#39;, &#39;items&#39;: [&#39;Styles&#39;, &#39;Format&#39;, &#39;Font&#39;, &#39;FontSize&#39;]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;colors&#39;, &#39;items&#39;: [&#39;TextColor&#39;, &#39;BGColor&#39;]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;tools&#39;, &#39;items&#39;: [&#39;Maximize&#39;, &#39;ShowBlocks&#39;]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;about&#39;, &#39;items&#39;: [&#39;About&#39;]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;/&#39;, &nbsp;# put this to force next toolbar on new line</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;yourcustomtools&#39;, &#39;items&#39;: [</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # put the name of your editor.ui.addButton here</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;Preview&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;Maximize&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ]},</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; ],</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &#39;toolbar&#39;: &#39;YourCustomToolbarConfig&#39;, &nbsp;# put selected toolbar config here</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; # &#39;toolbarGroups&#39;: [{ &#39;name&#39;: &#39;document&#39;, &#39;groups&#39;: [ &#39;mode&#39;, &#39;document&#39;, &#39;doctools&#39; ] }],</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; # &#39;height&#39;: 291,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; # &#39;width&#39;: &#39;100%&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; # &#39;filebrowserWindowHeight&#39;: 725,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; # &#39;filebrowserWindowWidth&#39;: 940,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; # &#39;toolbarCanCollapse&#39;: True,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; # &#39;mathJaxLib&#39;: &#39;//cdn.mathjax.org/mathjax/2.2-latest/MathJax.js?config=TeX-AMS_HTML&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &#39;tabSpaces&#39;: 4,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &#39;extraPlugins&#39;: &#39;,&#39;.join(</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # your extra plugins here</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;div&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;autolink&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;autoembed&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;embedsemantic&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;autogrow&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # &#39;devtools&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;widget&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;lineutils&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;clipboard&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;dialog&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;dialogui&#39;,</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;elementspath&#39;</li>\r\n	<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ]),</li>\r\n	<li>&nbsp; &nbsp; }</li>\r\n	<li>}</li>\r\n</ol>\r\n\r\n<p><br />\r\n最后你需要配置你的URL<br />\r\nURL 或者是上面的任一步骤没有完全配置好都会导致失败.如我遇到的</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[17/Jul/2016 12:28:56] &quot;GET /uploader/uploads/2016/07/17/shiyan2.png HTTP/1.1&quot; 404 3657<br />\r\n1<br />\r\n没有找到文件。</p>\r\n\r\n<p>这是因为没有配置好URL：</p>\r\n\r\n<ol>\r\n	<li>from django.conf.urls.static import static</li>\r\n	<li>from django.conf import settings</li>\r\n	<li>&nbsp;</li>\r\n	<li>urlpatterns = [</li>\r\n	<li>&nbsp; &nbsp; ...,</li>\r\n	<li>&nbsp; &nbsp; url(r&#39;^ckeditor/&#39;, include(&#39;ckeditor_uploader.urls&#39;)),</li>\r\n	<li>] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)</li>\r\n</ol>\r\n\r\n<p><br />\r\nOK。如果有什么问题可以留言。</p>',1,'2019-12-23 09:28:25',1,1,67,13,'&lt;p&gt;个人项目用到了ckeditor 前面配置，使用什么都很简单流水设置。。。&lt;br /&gt;\n详细教程见： https://github.com/riklaunim/django-ckeditor/tree/master/ckeditor/static/ckeditor/ckeditor&lt;/p&gt;&lt;p&gt;Now:&lt;br /&gt;\n现在想要实现后台上传图片功能：&lt;br /&gt;\n首先：改变 models.py&lt;/p&gt;&lt;ol&gt;\n    &lt;li&gt;&lt;span style=\"color:#e74c3c\"&gt;&lt;strong&gt;&lt;span style=\"background-color:null\"&gt;from ckeditor_uploader.fields import RichTextUploadingField&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/li&gt;\n    &lt;li&gt;&lt;span style=\"color:#e74c3c\"&gt;&lt;strong&gt;&lt;span style=\"background-color:null\"&gt;...&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/li&gt;\n    &lt;li&gt;&lt;span style=\"color:#e74c3c\"&gt;&lt;strong&gt;&lt;span style=\"background-color:null\"&gt;class Post(models.Model):&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/li&gt;\n    &lt;li&gt;&lt;span style=\"color:#e74c3c\"&gt;&lt;strong&gt;&lt;span style=\"background-color:null\"&gt;&nbsp; &nbsp; ...&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/li&gt;\n    &lt;li&gt;&lt;span style=\"color:#e74c3c\"&gt;&lt;strong&gt;&lt;span style=\"background-color:null\"&gt;&nbsp; &nbsp; body = RichTextUploadingField(verbose_name=&#39;正文&#39;) &nbsp;# 在你的正文里加上这&lt;/span&gt;&lt;/strong&gt;&lt;span style=\"background-color:null\"&gt;种Field&nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\n&lt;/ol&gt;&lt;p&gt;更改设置文件 settings.py&lt;/p&gt;&lt;p&gt;INSTALLED_APPS = (&lt;br /&gt;\n&nbsp; &nbsp; ...&lt;br /&gt;\n&nbsp; &nbsp; &#39;ckeditor&#39;,&lt;br /&gt;\n&nbsp; &nbsp; &#39;ckeditor_uploader&#39;,&lt;br /&gt;\n)&lt;/p&gt;&lt;p&gt;# Media files&lt;br /&gt;\nMEDIA_URL = &#39;/uploader/&#39; &nbsp;# 你的media url 在Url显示并没什么关系&lt;br /&gt;\nMEDIA_ROOT = &#39;.../media/&#39; # 你media 的绝对地址。从根目录到你的media目录:/root/.../media/&lt;/p&gt;&lt;p&gt;#注意！ media 目录与 CKEDITOR_UPLOAD_PATH 是相对的所以：&lt;br /&gt;\n# Ckeditor settings&lt;br /&gt;\nCKEDITOR_UPLOAD_PATH = &quot;uploads/&quot; &nbsp;# 他的目录相对与media root 就是 media root + CKEDITOR_UPLOAD_PATH 不能写成&quot;/uploads/&quot;&lt;br /&gt;\nCKEDITOR_JQUERY_URL = &#39;js/jquery.min.js&#39;&lt;br /&gt;\nCKEDITOR_IMAGE_BACKEND = &#39;pillow&#39; &nbsp;# 图像库支持需要安装 PIL&lt;/p&gt;&lt;p&gt;# 这个设置看你的偏好。。。仅仅是一个exsample&lt;/p&gt;&lt;ol&gt;\n    &lt;li&gt;CKEDITOR_CONFIGS = {&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &#39;default&#39;: {&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &#39;update&#39;: [&#39;Image&#39;, &#39;Update&#39;, &#39;Flash&#39;, &#39;Table&#39;, &#39;HorizontalRule&#39;, &#39;Smiley&#39;, &#39;SpecialChar&#39;, &#39;PageBreak&#39;],&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &#39;skin&#39;: &#39;moono&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; # &#39;skin&#39;: &#39;office2013&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &#39;toolbar_Basic&#39;: [&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [&#39;Source&#39;, &#39;-&#39;, &#39;Bold&#39;, &#39;Italic&#39;]&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; ],&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &#39;toolbar_YourCustomToolbarConfig&#39;: [&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;document&#39;, &#39;items&#39;: [&#39;Source&#39;, &#39;-&#39;, &#39;Save&#39;, &#39;NewPage&#39;, &#39;Preview&#39;, &#39;Print&#39;, &#39;-&#39;, &#39;Templates&#39;]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;clipboard&#39;, &#39;items&#39;: [&#39;Cut&#39;, &#39;Copy&#39;, &#39;Paste&#39;, &#39;PasteText&#39;, &#39;PasteFromWord&#39;, &#39;-&#39;, &#39;Undo&#39;, &#39;Redo&#39;]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;editing&#39;, &#39;items&#39;: [&#39;Find&#39;, &#39;Replace&#39;, &#39;-&#39;, &#39;SelectAll&#39;]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;forms&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;items&#39;: [&#39;Form&#39;, &#39;Checkbox&#39;, &#39;Radio&#39;, &#39;TextField&#39;, &#39;Textarea&#39;, &#39;Select&#39;, &#39;Button&#39;, &#39;ImageButton&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;HiddenField&#39;]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;/&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;basicstyles&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;items&#39;: [&#39;Bold&#39;, &#39;Italic&#39;, &#39;Underline&#39;, &#39;Strike&#39;, &#39;Subscript&#39;, &#39;Superscript&#39;, &#39;-&#39;, &#39;RemoveFormat&#39;]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;paragraph&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;items&#39;: [&#39;NumberedList&#39;, &#39;BulletedList&#39;, &#39;-&#39;, &#39;Outdent&#39;, &#39;Indent&#39;, &#39;-&#39;, &#39;Blockquote&#39;, &#39;CreateDiv&#39;, &#39;-&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;JustifyLeft&#39;, &#39;JustifyCenter&#39;, &#39;JustifyRight&#39;, &#39;JustifyBlock&#39;, &#39;-&#39;, &#39;BidiLtr&#39;, &#39;BidiRtl&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;Language&#39;]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;links&#39;, &#39;items&#39;: [&#39;Link&#39;, &#39;Unlink&#39;, &#39;Anchor&#39;]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;insert&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&#39;items&#39;: [&#39;Image&#39;, &#39;Flash&#39;, &#39;Table&#39;, &#39;HorizontalRule&#39;, &#39;Smiley&#39;, &#39;SpecialChar&#39;, &#39;PageBreak&#39;, &#39;Iframe&#39;]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;/&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;styles&#39;, &#39;items&#39;: [&#39;Styles&#39;, &#39;Format&#39;, &#39;Font&#39;, &#39;FontSize&#39;]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;colors&#39;, &#39;items&#39;: [&#39;TextColor&#39;, &#39;BGColor&#39;]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;tools&#39;, &#39;items&#39;: [&#39;Maximize&#39;, &#39;ShowBlocks&#39;]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;about&#39;, &#39;items&#39;: [&#39;About&#39;]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;/&#39;, &nbsp;# put this to force next toolbar on new line&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {&#39;name&#39;: &#39;yourcustomtools&#39;, &#39;items&#39;: [&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # put the name of your editor.ui.addButton here&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;Preview&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;Maximize&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ]},&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; ],&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &#39;toolbar&#39;: &#39;YourCustomToolbarConfig&#39;, &nbsp;# put selected toolbar config here&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; # &#39;toolbarGroups&#39;: [{ &#39;name&#39;: &#39;document&#39;, &#39;groups&#39;: [ &#39;mode&#39;, &#39;document&#39;, &#39;doctools&#39; ] }],&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; # &#39;height&#39;: 291,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; # &#39;width&#39;: &#39;100%&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; # &#39;filebrowserWindowHeight&#39;: 725,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; # &#39;filebrowserWindowWidth&#39;: 940,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; # &#39;toolbarCanCollapse&#39;: True,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; # &#39;mathJaxLib&#39;: &#39;//cdn.mathjax.org/mathjax/2.2-latest/MathJax.js?config=TeX-AMS_HTML&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &#39;tabSpaces&#39;: 4,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &#39;extraPlugins&#39;: &#39;,&#39;.join(&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # your extra plugins here&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;div&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;autolink&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;autoembed&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;embedsemantic&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;autogrow&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # &#39;devtools&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;widget&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;lineutils&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;clipboard&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;dialog&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;dialogui&#39;,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;elementspath&#39;&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ]),&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; }&lt;/li&gt;\n    &lt;li&gt;}&lt;/li&gt;\n&lt;/ol&gt;&lt;p&gt;&lt;br /&gt;\n最后你需要配置你的URL&lt;br /&gt;\nURL 或者是上面的任一步骤没有完全配置好都会导致失败.如我遇到的&lt;/p&gt;&lt;p&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[17/Jul/2016 12:28:56] &quot;GET /uploader/uploads/2016/07/17/shiyan2.png HTTP/1.1&quot; 404 3657&lt;br /&gt;\n1&lt;br /&gt;\n没有找到文件。&lt;/p&gt;&lt;p&gt;这是因为没有配置好URL：&lt;/p&gt;&lt;ol&gt;\n    &lt;li&gt;from django.conf.urls.static import static&lt;/li&gt;\n    &lt;li&gt;from django.conf import settings&lt;/li&gt;\n    &lt;li&gt;&nbsp;&lt;/li&gt;\n    &lt;li&gt;urlpatterns = [&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; ...,&lt;/li&gt;\n    &lt;li&gt;&nbsp; &nbsp; url(r&#39;^ckeditor/&#39;, include(&#39;ckeditor_uploader.urls&#39;)),&lt;/li&gt;\n    &lt;li&gt;] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)&lt;/li&gt;\n&lt;/ol&gt;&lt;p&gt;&lt;br /&gt;\nOK。如果有什么问题可以留言。&lt;/p&gt;'),(18,'1213232','232','<p>2323</p>',1,'2019-12-26 08:20:21',1,1,1,1,'&lt;p&gt;2323&lt;/p&gt;');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tag_post_id_tag_id_740488d1_uniq` (`post_id`,`tag_id`),
  KEY `post_tag_tag_id_b4c30517_fk_tag_id` (`tag_id`),
  CONSTRAINT `post_tag_tag_id_b4c30517_fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`),
  CONSTRAINT `post_tag_post_id_6417984f_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (1,1,1),(2,2,2),(3,3,5),(12,6,1),(13,6,2),(14,7,2),(21,11,1),(28,18,1);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sidebar`
--

DROP TABLE IF EXISTS `sidebar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sidebar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `display_type` int(10) unsigned NOT NULL,
  `content` varchar(500) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_time` datetime NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sidebar_owner_id_20ae39d3_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `sidebar_owner_id_20ae39d3_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sidebar`
--

LOCK TABLES `sidebar` WRITE;
/*!40000 ALTER TABLE `sidebar` DISABLE KEYS */;
INSERT INTO `sidebar` VALUES (1,'欢迎交流咨询!',1,'联系博主：            wadayu@163.com               893695711@qq.com',1,'2019-12-10 12:43:28',1),(2,'最新文章',2,'',1,'2019-12-11 07:22:06',1),(3,'最热文章',3,'',1,'2019-12-11 07:27:41',1),(4,'最近评论',4,'',0,'2019-12-11 07:27:50',1);
/*!40000 ALTER TABLE `sidebar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'科幻',1,'2019-11-28 02:45:04'),(2,'爱情',1,'2019-11-28 06:25:01'),(3,'恐怖',1,'2019-11-28 06:25:08'),(4,'悬疑',1,'2019-11-28 06:48:17'),(5,'战争',1,'2019-11-28 08:21:16');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2019-12-21 12:12:15','127.0.0.1','1','我的超人朋友','change','修改 desc',8,1),(2,'2019-12-21 12:39:42','127.0.0.1','2','wadayu','change','修改 last_login 和 user_permissions',4,1),(3,'2019-12-21 12:41:26','127.0.0.1','3','daoyun','change','修改 last_login 和 user_permissions',4,1),(4,'2019-12-21 12:57:14','127.0.0.1',NULL,'','delete','批量删除 16 个 分类',NULL,1),(5,'2019-12-21 13:00:57','127.0.0.1','35','11','create','已添加。',7,1),(6,'2019-12-21 13:01:09','127.0.0.1',NULL,'','delete','批量删除 1 个 分类',NULL,1),(7,'2019-12-21 13:01:20','127.0.0.1','9','11','create','已添加。',9,1),(8,'2019-12-21 13:01:28','127.0.0.1',NULL,'','delete','批量删除 1 个 标签',NULL,1),(9,'2019-12-23 00:44:59','127.0.0.1','3','daoyun','change','修改 last_login 和 user_permissions',4,1),(10,'2019-12-23 03:16:08','127.0.0.1','9','1111','create','已添加。',8,1),(11,'2019-12-23 03:23:43','127.0.0.1','10','111111','create','已添加。',8,1),(12,'2019-12-23 03:26:38','127.0.0.1',NULL,'','delete','批量删除 1 个 文章',NULL,1),(13,'2019-12-23 03:33:01','127.0.0.1',NULL,'','delete','批量删除 1 个 分类',NULL,1),(14,'2019-12-23 05:19:14','127.0.0.1','7','孔乙己','change','修改 desc',8,1),(15,'2019-12-23 05:22:42','127.0.0.1','1','欢迎交流咨询!','change','修改 content',11,1),(16,'2019-12-23 07:31:37','127.0.0.1','7','孔乙己','change','修改 content',8,1),(17,'2019-12-23 07:34:08','127.0.0.1','7','孔乙己','change','修改 content',8,1),(18,'2019-12-23 08:42:57','127.0.0.1','8','测试','change','修改 content',8,1),(19,'2019-12-23 08:49:11','127.0.0.1','7','孔乙己','change','修改 content',8,1),(20,'2019-12-23 08:51:54','127.0.0.1','8','测试','change','修改 content',8,1),(21,'2019-12-23 08:52:42','127.0.0.1','8','测试','change','修改 content',8,1),(22,'2019-12-23 08:53:16','127.0.0.1','8','测试','change','修改 content',8,1),(23,'2019-12-23 08:55:34','127.0.0.1','8','测试','change','没有字段被修改。',8,1),(24,'2019-12-23 09:25:16','127.0.0.1','8','测试','change','修改 content',8,1),(25,'2019-12-23 09:26:26','127.0.0.1','8','测试','change','没有字段被修改。',8,1),(26,'2019-12-23 09:28:25','127.0.0.1','11','django-ckeditor upload image and settings 完全解决方案。实践出真知','create','已添加。',8,1),(27,'2019-12-23 09:30:11','127.0.0.1','11','django-ckeditor upload image and settings 完全解决方案。实践出真知','change','修改 content',8,1),(28,'2019-12-23 09:31:52','127.0.0.1','11','django-ckeditor upload image and settings 完全解决方案。实践出真知','change','修改 content',8,1),(29,'2019-12-23 09:32:21','127.0.0.1','11','django-ckeditor upload image and settings 完全解决方案。实践出真知','change','修改 content',8,1),(30,'2019-12-23 09:33:28','127.0.0.1','11','django-ckeditor upload image and settings 完全解决方案','change','修改 title',8,1),(31,'2019-12-23 10:24:27','127.0.0.1','11','django-ckeditor upload image and settings 完全解决方案','change','修改 content',8,1),(32,'2019-12-23 10:25:35','127.0.0.1','8','测试','change','修改 content',8,1),(33,'2019-12-23 10:26:31','127.0.0.1','8','测试','change','修改 content',8,1),(34,'2019-12-23 10:37:40','127.0.0.1','8','测试','change','修改 content',8,1),(35,'2019-12-23 10:44:29','127.0.0.1','8','测试','change','修改 content',8,1),(36,'2019-12-23 10:59:02','127.0.0.1','8','测试','change','修改 content',8,1),(37,'2019-12-23 11:12:09','127.0.0.1','8','测试','change','修改 content',8,1),(38,'2019-12-24 00:57:02','127.0.0.1','7','孔乙己','change','修改 desc',8,1),(39,'2019-12-24 10:53:43','192.168.30.160','8','测试','change','修改 content',8,1),(40,'2019-12-26 04:08:17','192.168.30.160',NULL,'','delete','批量删除 1 个 文章',NULL,1),(41,'2019-12-26 04:37:41','192.168.30.160','4','最近评论','change','修改 status',11,1),(42,'2019-12-26 06:43:47','192.168.30.160','12','ASFSD','create','已添加。',8,2),(43,'2019-12-26 06:46:31','192.168.30.160',NULL,'','delete','批量删除 1 个 文章',NULL,2),(44,'2019-12-26 06:47:33','192.168.30.160','13','你妹的','create','已添加。',8,2),(45,'2019-12-26 06:47:44','192.168.30.160',NULL,'','delete','批量删除 1 个 文章',NULL,2),(46,'2019-12-26 07:02:04','192.168.30.160',NULL,'','delete','批量删除 4 个 评论',NULL,1),(47,'2019-12-26 07:02:25','192.168.30.160',NULL,'','delete','批量删除 1 个 评论',NULL,1),(48,'2019-12-26 07:03:16','192.168.30.160','14','阿斯顿发','create','已添加。',8,1),(49,'2019-12-26 07:03:41','192.168.30.160',NULL,'','delete','批量删除 1 个 文章',NULL,1),(50,'2019-12-26 07:40:54','192.168.30.160','15','1111','create','已添加。',8,1),(51,'2019-12-26 07:45:25','192.168.30.160',NULL,'','delete','批量删除 1 个 文章',NULL,1),(52,'2019-12-26 07:47:01','192.168.30.160','16','11234','create','已添加。',8,1),(53,'2019-12-26 08:00:24','192.168.30.160','7','孔乙己','change','修改 content',8,1),(54,'2019-12-26 08:08:46','192.168.30.160',NULL,'','delete','批量删除 3 个 评论',NULL,1),(55,'2019-12-26 08:12:52','192.168.30.160',NULL,'','delete','批量删除 1 个 文章',NULL,1),(56,'2019-12-26 08:14:50','192.168.30.160','17','11','create','已添加。',8,1),(57,'2019-12-26 08:16:49','192.168.30.160',NULL,'','delete','批量删除 1 个 文章',NULL,1),(58,'2019-12-26 08:20:21','192.168.30.160','18','1213232','create','已添加。',8,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'dashboard:home:pos','',2),(3,'dashboard:home:pos','',3),(4,'blog_category_editform_portal','box-0,post_set-group,',1),(5,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-28 12:07:22
