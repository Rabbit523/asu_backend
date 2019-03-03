# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.25-0ubuntu0.18.04.2)
# Database: forge
# Generation Time: 2019-03-02 19:18:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bans`;

CREATE TABLE `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bannable_id` int(10) unsigned NOT NULL,
  `bannable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `expired_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bans_bannable_id_bannable_type_index` (`bannable_id`,`bannable_type`),
  KEY `bans_created_by_id_created_by_type_index` (`created_by_id`,`created_by_type`),
  KEY `bans_expired_at_index` (`expired_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `bans` WRITE;
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;

INSERT INTO `bans` (`id`, `bannable_id`, `bannable_type`, `created_by_id`, `created_by_type`, `comment`, `expired_at`, `deleted_at`, `created_at`, `updated_at`)
VALUES
	(1,1,'App\\Post',22,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(2,2,'App\\Post',27,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(3,3,'App\\Post',29,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(4,4,'App\\Post',27,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(5,5,'App\\Post',30,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(6,6,'App\\Post',27,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(7,7,'App\\Post',28,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(8,8,'App\\Post',39,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(9,9,'App\\Post',38,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(10,10,'App\\Post',39,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(11,11,'App\\Post',39,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(12,12,'App\\Post',35,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(13,13,'App\\Post',39,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(14,14,'App\\Post',30,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(15,15,'App\\Post',36,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(16,16,'App\\Post',33,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(17,17,'App\\Post',22,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(18,18,'App\\Post',31,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(19,19,'App\\Post',34,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(20,20,'App\\Post',33,'App\\User',NULL,NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10');

/*!40000 ALTER TABLE `bans` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Test Category','2019-02-07 14:07:11','2019-02-07 14:07:11');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `channels`;

CREATE TABLE `channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_owner_id_foreign` (`owner_id`),
  CONSTRAINT `channels_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;

INSERT INTO `channels` (`id`, `owner_id`, `name`, `required`, `meta`, `created_at`, `updated_at`)
VALUES
	(3,NULL,'general',0,X'7B2275726C223A202273656E64626972645F6F70656E5F6368616E6E656C5F34333438395F32313333323530396334346538623561633334646365393339643632373364626439396138313930222C2022667265657A65223A2066616C73652C202269735F7375706572223A2066616C73652C202269735F7075626C6963223A20747275652C2022637265617465645F6174223A20313535303838313934332C20226163636573735F636F6465223A202243482D3335433730393439373342454444222C2022637573746F6D5F74797065223A2022222C202269735F64697374696E6374223A20747275652C202269735F657068656D6572616C223A2066616C73652C20226C6173745F6D657373616765223A2022222C20226D656D6265725F636F756E74223A20302C20226A6F696E65645F6D656D6265725F636F756E74223A20307D','2019-02-22 18:32:22','2019-02-22 18:32:23'),
	(4,NULL,'private',0,X'7B2275726C223A202273656E64626972645F67726F75705F6368616E6E656C5F34333438395F36363834393839396638323535336239323633373930633864396462373735363933636539393934222C2022667265657A65223A2066616C73652C202269735F7375706572223A2066616C73652C202269735F7075626C6963223A2066616C73652C2022637265617465645F6174223A20313535303838323730362C20226163636573735F636F6465223A202243482D3435433730393739323433373544222C2022637573746F6D5F74797065223A2022222C202269735F64697374696E6374223A2066616C73652C202269735F657068656D6572616C223A2066616C73652C20226C6173745F6D657373616765223A2022222C20226D656D6265725F636F756E74223A20302C20226A6F696E65645F6D656D6265725F636F756E74223A20307D','2019-02-22 18:45:05','2019-02-22 18:45:06'),
	(5,NULL,'anotherone',0,X'7B2275726C223A202273656E64626972645F6F70656E5F6368616E6E656C5F34333438395F32323130383566643232373030393466656132623533373534613739363661623062303530353236222C2022667265657A65223A2066616C73652C202269735F7375706572223A2066616C73652C202269735F7075626C6963223A20747275652C2022637265617465645F6174223A20313535303838343838362C20226163636573735F636F6465223A202243482D3535433730413031363241423744222C2022637573746F6D5F74797065223A2022222C202269735F64697374696E6374223A20747275652C202269735F657068656D6572616C223A2066616C73652C20226C6173745F6D657373616765223A2022222C20226D656D6265725F636F756E74223A20302C20226A6F696E65645F6D656D6265725F636F756E74223A20307D','2019-02-22 19:21:25','2019-02-22 19:21:26'),
	(6,NULL,'again',0,X'7B2275726C223A202273656E64626972645F6F70656E5F6368616E6E656C5F34333438395F62656132363362633861376631316664663234376530633664616634623036623237343762653037222C2022667265657A65223A2066616C73652C202269735F7375706572223A2066616C73652C202269735F7075626C6963223A20747275652C2022637265617465645F6174223A20313535303838353538302C20226163636573735F636F6465223A202243482D3635433730413243434243463444222C2022637573746F6D5F74797065223A2022222C202269735F64697374696E6374223A20747275652C202269735F657068656D6572616C223A2066616C73652C20226C6173745F6D657373616765223A2022222C20226D656D6265725F636F756E74223A20302C20226A6F696E65645F6D656D6265725F636F756E74223A20307D','2019-02-22 19:33:00','2019-02-22 19:33:00'),
	(7,NULL,'onemore',0,X'7B2275726C223A202273656E64626972645F6F70656E5F6368616E6E656C5F34333438395F39303737326662613237646436316162376536313066326363636633633437373032396339623433222C2022667265657A65223A2066616C73652C202269735F7375706572223A2066616C73652C202269735F7075626C6963223A20747275652C2022637265617465645F6174223A20313535313133323931372C20226163636573735F636F6465223A202243482D3735433734363846354238334246222C2022637573746F6D5F74797065223A2022222C202269735F64697374696E6374223A20747275652C202269735F657068656D6572616C223A2066616C73652C20226C6173745F6D657373616765223A2022222C20226D656D6265725F636F756E74223A20302C20226A6F696E65645F6D656D6265725F636F756E74223A20307D','2019-02-25 16:15:17','2019-02-25 16:15:17');

/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table event_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_user`;

CREATE TABLE `event_user` (
  `event_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `followed_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `event_user_event_id_foreign` (`event_id`),
  KEY `event_user_user_id_foreign` (`user_id`),
  CONSTRAINT `event_user_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `event_user` WRITE;
/*!40000 ALTER TABLE `event_user` DISABLE KEYS */;

INSERT INTO `event_user` (`event_id`, `user_id`, `followed_at`, `confirmed_at`, `created_at`, `updated_at`)
VALUES
	(9,39,'2019-01-24 17:44:10',NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(16,40,'2019-01-24 17:44:10',NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(11,41,'2019-01-24 17:44:10',NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(17,45,'2019-02-25 01:30:18',NULL,'2019-02-25 01:30:18','2019-02-25 01:30:18'),
	(20,48,NULL,'2019-02-26 00:19:30','2019-02-26 00:19:30','2019-02-26 00:19:30');

/*!40000 ALTER TABLE `event_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attendees` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;

INSERT INTO `events` (`id`, `name`, `address`, `city`, `state`, `zip_code`, `date`, `time`, `description`, `attendees`, `created_at`, `updated_at`)
VALUES
	(1,'west','55281 Kunde Villages','Olaffurt','Michigan','78443','2019-05-07','01:43:47','White Rabbit, \'and that\'s a fact.\' Alice did not quite like the wind, and the sound of many footsteps, and Alice joined the procession, wondering very much of a globe of goldfish she had peeped into.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(2,'emmerich','3216 Marks Brooks','Hermanmouth','Arkansas','58047','2019-03-25','10:59:45','March Hare said to the table for it, you know--\' \'What did they draw?\' said Alice, \'and those twelve creatures,\' (she was obliged to say anything. \'Why,\' said the Gryphon: \'I went to school in the.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(3,'brown','299 Borer Locks Apt. 553','Frederikburgh','Hawaii','45120','2019-04-02','19:22:51','And yet you incessantly stand on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in it,\' said the Hatter, and he checked himself suddenly: the others took the hookah out of a dance is.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(4,'emmerich','988 Bednar Ferry Apt. 245','Gunnartown','Alabama','53342','2019-03-29','05:19:13','Mystery,\' the Mock Turtle in a deep, hollow tone: \'sit down, both of you, and don\'t speak a word till I\'ve finished.\' So they began solemnly dancing round and look up in spite of all the children.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(5,'sanford','1785 Gage Canyon Suite 912','New Mason','Virginia','61084','2019-02-08','15:48:34','Hatter. \'I deny it!\' said the White Rabbit: it was YOUR table,\' said Alice; \'that\'s not at all what had become of me?\' Luckily for Alice, the little golden key, and unlocking the door with his.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(6,'braun','60940 Dach Falls Apt. 915','Volkmanmouth','Utah','02107-0207','2019-03-28','15:43:30','Alice: \'besides, that\'s not a VERY turn-up nose, much more like a Jack-in-the-box, and up I goes like a frog; and both footmen, Alice noticed, had powdered hair that WOULD always get into her face.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(7,'sawayn','15894 Bogisich Manor Suite 622','Nicklausstad','Indiana','40058','2019-05-07','07:55:32','Caterpillar seemed to think that proved it at all,\' said the Duchess. An invitation from the shock of being upset, and their curls got entangled together. Alice laughed so much contradicted in her.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(8,'donnelly','2649 Hills Radial Apt. 685','Port Ephraim','Missouri','85152','2019-03-09','16:55:01','His voice has a timid and tremulous sound.] \'That\'s different from what I say--that\'s the same thing as a lark, And will talk in contemptuous tones of her sharp little chin into Alice\'s head. \'Is.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(9,'ankunding','595 Chasity Walk','Harleyberg','Louisiana','79803','2019-04-18','04:46:58','Alice said; \'there\'s a large cauldron which seemed to think this a good deal to ME,\' said Alice a good deal frightened by this time). \'Don\'t grunt,\' said Alice; \'I must go by the whole court was a.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(10,'adams','5650 Cletus Highway','Schmelershire','California','49955-8203','2019-04-10','07:04:21','Alice ventured to remark. \'Tut, tut, child!\' said the Cat, as soon as it lasted.) \'Then the words have got into it), and handed back to the end of his great wig.\' The judge, by the Hatter, \'or.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(11,'jenkins','911 Corkery Track Apt. 233','Ottiliemouth','Utah','91085-0767','2019-05-08','07:17:36','I\'ll manage better this time,\' she said this, she noticed that one of them say, \'Look out now, Five! Don\'t go splashing paint over me like that!\' \'I couldn\'t help it,\' said Alice. \'I\'ve tried the.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(12,'wunsch','3879 Stiedemann Mountain Suite 561','Millsmouth','Arizona','27716-0615','2019-03-08','11:21:48','Mock Turtle went on so long since she had wept when she was going to dive in among the branches, and every now and then the other, and making quite a commotion in the pool a little startled when she.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(13,'trantow','8313 Labadie Plains Apt. 444','Russelview','Rhode Island','90490-6264','2019-05-19','12:25:38','And here Alice began telling them her adventures from the trees behind him. \'--or next day, maybe,\' the Footman remarked, \'till tomorrow--\' At this moment Five, who had been of late much accustomed.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(14,'renner','48982 Toby Islands Suite 458','Lake Corneliusberg','Idaho','14934-6195','2019-03-16','01:30:25','Oh, how I wish you could keep it to her usual height. It was so long that they must be on the ground as she could, and waited to see you any more!\' And here Alice began to feel which way you.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(15,'leffler','813 Georgiana Ranch','Santosfort','Washington','99043-5523','2019-05-19','21:46:08','English); \'now I\'m opening out like the Mock Turtle Soup is made from,\' said the Cat, \'a dog\'s not mad. You grant that?\' \'I suppose so,\' said Alice. \'Off with her head! Off--\' \'Nonsense!\' said.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(16,'oreilly','812 Carlee Light Apt. 470','New Jakob','West Virginia','02013-9256','2019-05-17','22:14:45','NOT, being made entirely of cardboard.) \'All right, so far,\' thought Alice, \'and if it thought that she let the Dormouse followed him: the March Hare. \'Exactly so,\' said Alice. \'Did you say things.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(17,'maggio','73813 Emard Drive Apt. 192','Johnnieport','Georgia','11456','2019-02-02','14:24:08','This of course, Alice could see it written up somewhere.\' Down, down, down. There was a dead silence. Alice noticed with some curiosity. \'What a number of changes she had nibbled some more of it.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(18,'crist','6823 Swift Station Suite 624','Bergnaumhaven','Montana','93632-8259','2019-05-13','02:16:15','An obstacle that came between Him, and ourselves, and it. Don\'t let me hear the name of the court. \'What do you know the song, \'I\'d have said to Alice, they all spoke at once, while all the.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(19,'stiedemann','92951 Farrell Vista Suite 138','Lupeview','Kentucky','23532','2019-03-11','02:31:02','There was nothing else to say than his first remark, \'It was a paper label, with the Duchess, \'and that\'s a fact.\' Alice did not seem to encourage the witness at all: he kept shifting from one of.',0,'2019-01-24 17:44:07','2019-01-24 17:44:07'),
	(20,'koch','13002 Bria Glens Apt. 602','Welchfurt','Utah','21057-7261','2019-02-07','10:45:35','Footman remarked, \'till tomorrow--\' At this the whole cause, and condemn you to death.\"\' \'You are old,\' said the Caterpillar. \'Well, perhaps you were all talking together: she made it out again, and.',2,'2019-01-24 17:44:07','2019-02-26 00:19:30');

/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;

INSERT INTO `jobs` (`id`, `title`, `description`, `city`, `state`, `zip_code`, `company`, `url`, `created_at`, `updated_at`)
VALUES
	(1,'Product Promoter','She waited for some time after the others. \'We must burn the house before she got back to my right size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Gryphon never learnt.','Stephaniaport','Arizona','28295-4926','Wintheiser Group','http://www.frami.com/quo-omnis-explicabo-blanditiis-deserunt-non','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(2,'Slot Key Person','Alice like the look of things at all, at all!\' \'Do as I used--and I don\'t want to get hold of its right.','Osinskichester','Maryland','27181','Reilly, Keeling and Conn','http://lang.biz/ut-id-pariatur-tempore-est-et','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(3,'Electrotyper','Alice, \'to pretend to be no chance of getting up and picking the daisies, when suddenly a footman in livery came running out of a bottle. They all returned from him.','Schoenview','Florida','15314','Dach, Adams and Hamill','http://moore.com/','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(4,'Artillery Crew Member','Cat, and vanished again. Alice waited a little, \'From the Queen. An invitation from the Gryphon, with a table set out under a tree in front of them, with her arms folded, quietly smoking a long time.','Zboncakstad','New York','75190-7160','Wuckert, Considine and Gibson','https://www.turcotte.info/dolorem-aspernatur-numquam-id-ab-ea-voluptatem','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(5,'Well and Core Drill Operator','Soup, so rich and green, Waiting in a melancholy way, being quite unable to move. She soon got it out to her great delight it.','Danikaside','Michigan','75856','Lakin, Keeling and Dietrich','http://www.grady.com/quia-molestiae-corporis-veniam-est','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(6,'Machinist','Hatter added as an explanation; \'I\'ve none of my life.\' \'You are all pardoned.\' \'Come, THAT\'S a good many voices.','Lake Antone','Nevada','95593-8954','Predovic Group','https://www.wuckert.com/voluptas-et-quia-fugiat-deserunt-eos-ut','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(7,'Dental Assistant','Alice asked in a low, weak voice. \'Now, I give you fair warning,\' shouted the Queen. \'Never!\' said the Duchess: \'and.','New Madysonchester','Connecticut','70789','White, Hackett and Schmitt','http://pfeffer.com/excepturi-rerum-dolorum-eligendi-enim','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(8,'Aviation Inspector','Gryphon went on. \'I do,\' Alice said with a yelp of delight, which changed into alarm in another moment, when she found a little before she had known.','Orionberg','Texas','38411-2774','Tromp Inc','http://ortiz.com/est-et-dignissimos-eos','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(9,'Court Clerk','HIS time of life. The King\'s argument was, that if something wasn\'t done about it while the Mouse had changed his mind.','Darrinside','Virginia','11634-0002','Grant, Daugherty and Kirlin','http://www.murray.com/quidem-quidem-facere-quam-voluptatibus-quaerat-necessitatibus-corrupti-non','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(10,'Order Clerk','Alice to find quite a new pair of white kid gloves in one hand and a pair of white kid gloves and a Dodo, a Lory and an old Crab took the hookah into its face was quite silent for a minute.','Kleinstad','Wyoming','78816-8100','Yundt-Toy','http://mcglynn.info/non-reiciendis-fugit-velit-ipsam-voluptate-at','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(11,'Pipe Fitter','I hate cats and dogs.\' It was so full of smoke from one foot to the Gryphon. \'--you advance twice--\' \'Each with a growl.','Kleinshire','New York','11037-2749','Ryan-Christiansen','http://klein.org/','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(12,'Illustrator','White Rabbit, trotting slowly back to the Queen. \'It proves nothing of the officers: but the cook till his eyes.','Port Manley','Pennsylvania','85125-7192','Hand Ltd','http://wolf.com/est-nesciunt-accusantium-aspernatur-est-dolor.html','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(13,'Recordkeeping Clerk','Queen, and Alice heard the Queen said--\' \'Get to your little boy, And beat him when he pleases!\' CHORUS. \'Wow! wow! wow!\' While the Owl and the.','North Lorinehaven','New Hampshire','19483','Paucek-Moen','http://schroeder.com/','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(14,'Court Clerk','Alice remarked. \'Right, as usual,\' said the Mouse, who was passing at the Mouse\'s tail; \'but why do you want to be?\' it asked. \'Oh, I\'m not Ada,\' she said.','Laneyfort','Idaho','65119-8711','Corwin-Bernier','http://www.dubuque.com/dolorem-nulla-praesentium-et-fugiat-vel-saepe-facere','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(15,'Library Technician','Alice did not look at them--\'I wish they\'d get the trial done,\' she thought, \'it\'s sure to happen,\' she said to herself, \'because of his great wig.\' The judge, by the.','Retaport','Arizona','52244-2143','Kiehn, Schimmel and Moore','http://www.rath.com/','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(16,'Assembler','LESS,\' said the Caterpillar. Alice thought the poor little thing sobbed again (or grunted, it was too much overcome to do it! Oh dear! I\'d nearly forgotten to ask.\'.','Port Monteton','Arizona','61014-6034','Kiehn PLC','https://turner.com/et-atque-soluta-est-ut-sit-molestias.html','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(17,'Tailor','King said to the Knave. The Knave of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' the King say in a moment. \'Let\'s go on for some time.','South Mariela','Georgia','37102','Schaefer, Lynch and Schuppe','http://www.corkery.net/saepe-fugit-accusantium-adipisci-libero-laudantium','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(18,'Medical Equipment Repairer','Lory positively refused to tell me your history, you know,\' said the King: \'however, it may kiss my hand if it had lost.','West Lysanne','Hawaii','35285','Jones-Zboncak','http://www.rogahn.net/','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(19,'PR Manager','I shall have somebody to talk to.\' \'How are you thinking of?\' \'I beg your pardon!\' she exclaimed in a rather offended tone, and she jumped up in such a curious appearance in the other.','Gussieton','Montana','67060','McCullough and Sons','http://www.doyle.com/','2019-01-24 17:44:10','2019-01-24 17:44:10'),
	(20,'Aircraft Assembler','IS that to be an old conger-eel, that used to it as she had known them all her knowledge of history, Alice had no idea how confusing it is I hate cats and dogs.\' It was the White Rabbit.','Lake Laurel','Missouri','14367','Wuckert, Schaefer and Pollich','http://www.keebler.net/','2019-01-24 17:44:10','2019-01-24 17:44:10');

/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),
	(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),
	(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
	(6,'2016_06_01_000004_create_oauth_clients_table',1),
	(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
	(8,'2017_03_04_000000_create_bans_table',1),
	(9,'2018_09_10_071451_create_permission_tables',1),
	(10,'2018_09_17_184747_create_social_media_feeds_table',1),
	(11,'2018_09_24_165310_create_posts_table',1),
	(12,'2018_09_28_080020_create_events_table',1),
	(13,'2018_09_28_103105_create_event_user_table',1),
	(14,'2018_09_28_170221_create_jobs_table',1),
	(15,'2018_09_28_201455_create_media_table',1),
	(16,'2018_10_03_191800_create_channels_table',1),
	(17,'2018_10_08_161824_create_tag_tables',1),
	(18,'2018_10_11_172345_create_categories_table',1),
	(19,'2018_10_11_173110_alter_tags_table',1),
	(20,'2018_11_02_121439_alter_users_table',1),
	(21,'2018_11_15_160153_alter_channel_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`)
VALUES
	(1,'App\\User',1),
	(2,'App\\User',2),
	(2,'App\\User',3),
	(2,'App\\User',4),
	(2,'App\\User',5),
	(2,'App\\User',6),
	(2,'App\\User',7),
	(2,'App\\User',8),
	(2,'App\\User',9),
	(2,'App\\User',10),
	(2,'App\\User',11),
	(2,'App\\User',12),
	(2,'App\\User',13),
	(2,'App\\User',14),
	(2,'App\\User',15),
	(2,'App\\User',16),
	(2,'App\\User',17),
	(2,'App\\User',18),
	(2,'App\\User',19),
	(2,'App\\User',20),
	(2,'App\\User',21),
	(4,'App\\User',22),
	(4,'App\\User',23),
	(4,'App\\User',24),
	(4,'App\\User',25),
	(4,'App\\User',26),
	(4,'App\\User',27),
	(4,'App\\User',28),
	(4,'App\\User',29),
	(4,'App\\User',30),
	(4,'App\\User',31),
	(4,'App\\User',32),
	(4,'App\\User',33),
	(4,'App\\User',34),
	(4,'App\\User',35),
	(4,'App\\User',36),
	(4,'App\\User',37),
	(4,'App\\User',38),
	(4,'App\\User',39),
	(4,'App\\User',40),
	(4,'App\\User',41),
	(4,'App\\User',42),
	(4,'App\\User',43),
	(3,'App\\User',44),
	(3,'App\\User',45),
	(3,'App\\User',46),
	(3,'App\\User',47),
	(3,'App\\User',48),
	(3,'App\\User',49),
	(3,'App\\User',50),
	(3,'App\\User',51),
	(3,'App\\User',52),
	(3,'App\\User',53),
	(3,'App\\User',54),
	(4,'App\\User',55),
	(4,'App\\User',56),
	(3,'App\\User',57),
	(3,'App\\User',58),
	(3,'App\\User',59),
	(3,'App\\User',60),
	(3,'App\\User',61),
	(1,'App\\User',62),
	(3,'App\\User',63),
	(3,'App\\User',64),
	(3,'App\\User',65),
	(1,'App\\User',66);

/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('0008d8e127da47dacf3fc76285bb0bf14cd908c2686e86283a3683ab915aaaafa6f3f4a35d27402b',48,1,NULL,'[]',0,'2019-02-25 10:53:13','2019-02-25 10:53:13','2019-02-25 11:53:13'),
	('008fa3990e22ec940ee03bafa08a2617a6d2d83c65e7e024bc3fa1b2f28faacf60a7d9f128c6c52e',47,1,NULL,'[]',0,'2019-02-26 09:27:00','2019-02-26 09:27:00','2019-02-26 10:27:00'),
	('00a8bbfbbb5317086078c08d5d1d41bafc035664ddb84cdfc377135e9b0f233bade94fddc1a1e745',45,1,NULL,'[]',0,'2019-02-26 07:20:41','2019-02-26 07:20:41','2019-02-26 08:20:41'),
	('01165fe4a2d9d44ee41bbcb5fdeb158f68495ea90ed043f8c79d5b8a25f6323e3e4f13edbaeea4a0',55,1,NULL,'[]',0,'2019-02-24 21:59:52','2019-02-24 21:59:52','2019-02-24 22:59:52'),
	('0228c0be145733fce4ecd89f78d977b4a7a98da70f450522e5d415d56157ed70d3a137db59140431',45,1,NULL,'[]',0,'2019-02-26 04:34:15','2019-02-26 04:34:15','2019-02-26 05:34:15'),
	('0293ba07c1de493f982200542866f093a8143be827770f6fa468eaa15ac52e068295da4e32faacd1',45,1,NULL,'[]',0,'2019-02-25 02:25:18','2019-02-25 02:25:18','2019-02-25 03:25:18'),
	('02f9381c8ffed80b895f459cc8c389bbfd93bff3350ce808ca0dec3670d58dd7c52ee5f10e4242ad',47,1,NULL,'[]',0,'2019-02-26 09:40:32','2019-02-26 09:40:32','2019-02-26 10:40:32'),
	('0322f404c231cd174730c0a42e3b712ab0a2e1da2c5fcb9ab1dcb2dd55c0fe240b5a5c00bc8b8838',45,1,NULL,'[]',0,'2019-02-26 08:38:14','2019-02-26 08:38:14','2019-02-26 09:38:14'),
	('035b37793b42802af0fea527b4d50c5e39855edb048207f76c65e1033e092d228ff1f597177d4e70',45,1,NULL,'[]',0,'2019-02-26 04:29:19','2019-02-26 04:29:19','2019-02-26 05:29:19'),
	('04e56edacff4fa8e34083ab69a8d646af9c18bb55fb4f92e4098476bf6a61258fe2301980cd4b1a8',45,1,NULL,'[]',0,'2019-02-26 07:32:35','2019-02-26 07:32:35','2019-02-26 08:32:35'),
	('057b19190d7e03875e43a203709c6ff82efd0bc6ff694b8732b351b026038c55900231cb6313bd26',45,1,NULL,'[]',0,'2019-02-25 02:10:02','2019-02-25 02:10:02','2019-02-25 03:10:02'),
	('05ede7d5f8a6916d400bafcd565775954a32d820fa072fd1680b4efaffdbf61637f764e6ff909d21',47,1,NULL,'[]',0,'2019-02-24 20:12:28','2019-02-24 20:12:28','2019-02-24 21:12:28'),
	('068b3eb6bd34bb85d8eadaadd801196a99fd830316473f54e6b193571702155ab9cb7af987df5fee',45,1,NULL,'[]',0,'2019-02-26 08:27:24','2019-02-26 08:27:24','2019-02-26 09:27:24'),
	('07131e1116d2e560d215648f51c0cecdd9ca63f48caef215ce32f624827ccb2c66c5058f767ed28e',45,1,NULL,'[]',0,'2019-02-25 01:10:49','2019-02-25 01:10:49','2019-02-25 02:10:49'),
	('07660da875063d3667e0b356473abc5a6467ecdc4a6d22b635cb3e28e54d0cab6eb5231ded2ddc1e',49,1,NULL,'[]',0,'2019-02-22 18:44:14','2019-02-22 18:44:14','2019-02-22 19:44:13'),
	('08135b811a356f30b0b53ad16d65f649fa1c2dae3804d295f630e5693226f7666bc6cccef3f44569',53,1,NULL,'[]',0,'2019-02-24 21:49:22','2019-02-24 21:49:22','2019-02-24 22:49:22'),
	('0a258f62db4b485646540f2010c01a91863f05f9406bd8b8220b3fa8ed0eec476129f7b49c2c60d9',45,1,NULL,'[]',0,'2019-02-19 13:05:03','2019-02-19 13:05:03','2019-02-19 14:05:02'),
	('0a35ff86222be05af25c0d0d1f32aa71841a4bfd22de0526f93a5ada91ddedacc3ce7bd661aedfb5',47,1,NULL,'[]',0,'2019-02-21 21:01:23','2019-02-21 21:01:23','2019-02-21 22:01:23'),
	('0a679e62cdd9fea635416c5a13d655254a789ca5ea3b8e825e4b0fd9032e072a58e26b8b386896c7',47,1,NULL,'[]',1,'2019-02-26 16:10:20','2019-02-26 16:10:20','2019-02-26 17:10:20'),
	('0bc77ec186c7a6fcb93793c0255896149bcc5bbc80ed5de3ebed923ff834b25e9707065dad75a2e9',47,1,NULL,'[]',1,'2019-02-26 14:13:03','2019-02-26 14:13:03','2019-02-26 15:13:03'),
	('0beff9edff724951e5d2f99a680b32ce005a7c1bc7bb805507d21e8aaee7dcad6fc7206eedbdbdd7',47,1,NULL,'[]',0,'2019-02-26 01:42:38','2019-02-26 01:42:38','2019-02-26 02:42:38'),
	('0c584c8d51852049bc2a8f059e25c0cb098b74d4f55b5c2897c7043db2e88a45a04aea5d2aea0e55',45,1,NULL,'[]',0,'2019-02-26 04:30:21','2019-02-26 04:30:21','2019-02-26 05:30:21'),
	('0ee65ca85b93f7e701260e3d2c7d2b2cd31ac73746c21699268ca472ee5f514545e19c24e3fc57d3',45,1,NULL,'[]',1,'2019-02-27 04:18:01','2019-02-27 04:18:01','2019-02-27 05:18:01'),
	('10d4042129c8e7afba78cab44390dd7e0f858e5f76c7957f66bacdc55322b0babb37e402f874d5c1',45,1,NULL,'[]',0,'2019-02-25 01:36:52','2019-02-25 01:36:52','2019-02-25 02:36:51'),
	('11228e0e853e2f56215dce260160e1fc1e0f3497580410ca48e313a2ff00b705b17d3993a2c740fa',45,1,NULL,'[]',0,'2019-02-25 03:05:16','2019-02-25 03:05:16','2019-02-25 04:05:16'),
	('11813c5550e94c5b8b451dc706c4a0e7ef3bfdf9436851c7aea0323fae53c6066087fe7f08ca041d',58,1,NULL,'[]',0,'2019-02-24 22:10:05','2019-02-24 22:10:05','2019-02-24 23:10:04'),
	('11ac6be6b08d8bb9a10341af297c46513a1f33a6a19293b7c63768a16fbe7cd6e979d1be3b258719',45,1,NULL,'[]',0,'2019-02-27 07:01:50','2019-02-27 07:01:50','2019-02-27 08:01:50'),
	('12fa5658177d392515ef76cf29534bf44fbf13facabaef41f1a2673c4c9ff907f9daa73ffcd4925d',45,1,NULL,'[]',0,'2019-02-26 06:05:50','2019-02-26 06:05:50','2019-02-26 07:05:50'),
	('1316670651008ddc73a81757bfdcbcbf27b480a0987b9d9937f36895786aee281b2b69bf049592a9',47,1,NULL,'[]',0,'2019-02-26 09:26:39','2019-02-26 09:26:39','2019-02-26 10:26:39'),
	('136fdefc47c60f784905279ee16c40b3357aca8caa8bd5236f5c53ac9127733702b2d1f17d0d05eb',48,1,NULL,'[]',0,'2019-02-25 17:31:33','2019-02-25 17:31:33','2019-02-25 18:31:33'),
	('13b477a7ed8ed65f058e71a06dd6cabb77077e6a5051aadbf55331aa9d95531ece3710043c230192',47,1,NULL,'[]',0,'2019-02-21 20:47:32','2019-02-21 20:47:32','2019-02-21 21:47:32'),
	('13b787b751c263e0400048c01ff7cf7e93576cca17682ef73af5ed3ba3127ed9766180c3cd6ea7ac',47,1,NULL,'[]',0,'2019-02-22 19:26:58','2019-02-22 19:26:58','2019-02-22 20:26:58'),
	('13f1a8f7eb7d8d07c1c3341254c4dcd8af78b41a9b0d11f3e854ed6df6b64e34aee686469aa2a908',47,1,NULL,'[]',0,'2019-02-26 09:40:50','2019-02-26 09:40:50','2019-02-26 10:40:50'),
	('1682a9cea620fbc3ceb8a98d2186ef38ad2a02fa3b9fc65335ffe557fc7f34076855e83451bfd84b',45,1,NULL,'[]',0,'2019-02-27 07:23:35','2019-02-27 07:23:35','2019-02-27 08:23:35'),
	('172e0ad13677a887083c5c71799cdb9f800bc45923d55ac50209e9ffea4fcac73978f672e6fc65ca',47,1,NULL,'[]',0,'2019-02-21 20:19:46','2019-02-21 20:19:46','2019-02-21 21:19:45'),
	('174dd6a82fc3b54efcf5a3c4a2ea50d0710732d5238373431cbbd9f78bd00f4a50c776f1b62b86db',45,1,NULL,'[]',0,'2019-02-27 06:47:28','2019-02-27 06:47:28','2019-02-27 07:47:28'),
	('186f09fbf14b689fb5720e147bfccc99287ce7ce4e81e5bd75aa02216d3628afa1d80c197e254645',45,1,NULL,'[]',0,'2019-02-26 09:07:36','2019-02-26 09:07:36','2019-02-26 10:07:36'),
	('1912e87b5b3e6bcbf391a15e8a8e6e49b0acc15c5fd00be6b58004d04ef21ed6c9c341615cfc3525',45,1,NULL,'[]',0,'2019-02-27 05:07:41','2019-02-27 05:07:41','2019-02-27 06:07:41'),
	('193a8bc4ac8e56c3bb7a1a17aae0d1574cb2c387c02d5cc64e7d6f6e0671b1d54497c6c0317f7786',45,1,NULL,'[]',0,'2019-02-26 08:50:34','2019-02-26 08:50:34','2019-02-26 09:50:34'),
	('194742157ab66779022e1c2b14d3e834b0d2acc6b7b9c90d65fbb239a45f66fb388593a3c579cc56',45,1,NULL,'[]',0,'2019-02-26 08:32:12','2019-02-26 08:32:12','2019-02-26 09:32:11'),
	('197a274e5edafa188af4b53fab6cbc2b479347435c1380d5723c6cedf2be4c44fc78a8c9c2daf42d',45,1,NULL,'[]',0,'2019-02-26 08:26:49','2019-02-26 08:26:49','2019-02-26 09:26:48'),
	('19fbae5a433547981452ba1b56b5d92867586999cbdf81fdd9986dfe40adc8338f4eb13d2600e9ad',47,1,NULL,'[]',0,'2019-03-01 01:55:00','2019-03-01 01:55:00','2019-03-01 02:55:00'),
	('1a8f53f4018571eb0cafe9c36c18e753ec663d1eb08105f7c149c009a85630cb1b2f792e57531e3f',45,1,NULL,'[]',0,'2019-02-28 03:59:36','2019-02-28 03:59:36','2019-02-28 04:59:36'),
	('1a95828e322c707a05cbff56ce81d65c83d6f498859e5d0e500d1c67702f48b3bc8f9bd33f4d03a7',45,1,NULL,'[]',0,'2019-02-26 04:33:32','2019-02-26 04:33:32','2019-02-26 05:33:32'),
	('1ad71b896a0a29f5cc3b4feed78b9846b270565f9ec4a7a6cdd4244be3029a34c22808cc8daf496e',47,1,NULL,'[]',0,'2019-02-26 02:03:41','2019-02-26 02:03:41','2019-02-26 03:03:41'),
	('1bac740acf01ad9d3d18fc38c841a30a1e742f93101d6c485185b986a6adbfa4703fbc5df2685886',46,1,NULL,'[]',0,'2019-02-21 18:40:31','2019-02-21 18:40:31','2019-02-21 19:40:30'),
	('1bb39a6e3600bf46a05fc209f08f121b64d96cd7921dc3bed53b17dd9d6a6279784a51cbed20f874',45,1,NULL,'[]',0,'2019-02-28 07:10:29','2019-02-28 07:10:29','2019-02-28 08:10:29'),
	('1c18c45eeaab85d937aec7b81152243b89750907e906f5f01ba92ff19e9b350a848f29627ecd9376',47,1,NULL,'[]',0,'2019-02-21 20:27:33','2019-02-21 20:27:33','2019-02-21 21:27:33'),
	('1cd70ab992260b4574774055a7c52a65b7a784ab87b570d3bc81d1c328827a70188df1bf9e1ee687',47,1,NULL,'[]',0,'2019-02-21 19:13:30','2019-02-21 19:13:30','2019-02-21 20:13:29'),
	('1d2bf0c0aa75180bc31629d1245061b5d90db35d60ab6536db0139334cdc147c5444626dd50eeb1d',45,1,NULL,'[]',0,'2019-02-26 10:18:57','2019-02-26 10:18:57','2019-02-26 11:18:57'),
	('1d58e6cbbe81ec4441c369fd5ea645082896621321ac843bf4b6d41e428c3b60b7e0319ae47aa389',45,1,NULL,'[]',0,'2019-02-28 05:28:53','2019-02-28 05:28:53','2019-02-28 06:28:53'),
	('1f4284cc3a3e179ff1b075762c61bfa7114085e97acf1eeaace88e09f3a36ee3a275db80b593e059',47,1,NULL,'[]',0,'2019-02-26 14:22:18','2019-02-26 14:22:18','2019-02-26 15:22:18'),
	('201c3d1679028544580c6479a639a2dddcfd5bf0f72b411831b1f69e2893a1b34a81ee383acac5e6',47,1,NULL,'[]',0,'2019-02-21 20:29:34','2019-02-21 20:29:34','2019-02-21 21:29:34'),
	('20a1bbb63c19830c5421c7493c3bb365396329efd11fe2ff433a6187fb1086ca450760265cc81f19',47,1,NULL,'[]',0,'2019-02-26 08:40:53','2019-02-26 08:40:53','2019-02-26 09:40:53'),
	('22d3ffb8737886f42472584a5934b1843321ad51bb48cd27c72ad2c34039a9319f77084ca3205193',45,1,NULL,'[]',0,'2019-02-25 10:57:14','2019-02-25 10:57:14','2019-02-25 11:57:14'),
	('22e87235eb3226c918dd431a649d5c27489be1a883fddbfe26e0cb56dc6f1769867d7267e8ae5a2d',42,1,NULL,'[]',0,'2019-02-07 16:03:06','2019-02-07 16:03:06','2019-02-07 17:03:06'),
	('22f36138c2db4da62aff3ff9109caa91faa8d5939fc154c0b7c24e7913328df4695bb53a9bc4689f',45,1,NULL,'[]',0,'2019-02-27 08:45:25','2019-02-27 08:45:25','2019-02-27 09:45:25'),
	('247250d115d7817c19535502884fbe3e49ae121e786142d9f282bfeb5615799791e657112c03530a',45,1,NULL,'[]',0,'2019-02-25 03:09:30','2019-02-25 03:09:30','2019-02-25 04:09:30'),
	('2491c884d00c90e1375505df443b60ca82404aec62cbe192275808459d678b293e0d670ecbaa3443',64,1,NULL,'[]',0,'2019-02-25 17:28:02','2019-02-25 17:28:02','2019-02-25 18:28:01'),
	('24df63a844da9de198d0a30c8b43e1498aba8e64527488d17671421614fcc0ac2d7e6f086b4cf05f',47,1,NULL,'[]',0,'2019-02-23 21:33:26','2019-02-23 21:33:26','2019-02-23 22:33:26'),
	('263a387c5e9bbee08a3e9d79aa32dbea8dd1380107cf32c777937857bb86a54822faf7a53f809e80',47,1,NULL,'[]',0,'2019-02-22 19:25:12','2019-02-22 19:25:12','2019-02-22 20:25:11'),
	('267413af64acc4b3c48c53a932965c67b44c7c13ef433a39b39c873884c835fd70a19229c217eddd',47,1,NULL,'[]',0,'2019-02-24 21:07:30','2019-02-24 21:07:30','2019-02-24 22:07:30'),
	('2678d924ef242355c73287513fd798e8b888d2abfd175006be476357ab4c6e93c99ca3277a9c2192',47,1,NULL,'[]',0,'2019-02-21 20:22:32','2019-02-21 20:22:32','2019-02-21 21:22:32'),
	('2692b3f9043b3d992c3e9f382fe07d073a72a982615f72ec9620dbea069409267231edb29896fac0',45,1,NULL,'[]',0,'2019-02-26 07:00:09','2019-02-26 07:00:09','2019-02-26 08:00:09'),
	('277d166e51ea03e9fdec6faf5d95f011ab7928e0ecd2a7619c4960bb8f2b8a7e37ba8d67a39ea20d',47,1,NULL,'[]',0,'2019-02-23 21:58:02','2019-02-23 21:58:02','2019-02-23 22:58:02'),
	('27a6e4476a277c59dc21eea12a2d57be65246f62668ca583219eaec2efa96bbc1523956b30ac5b4e',45,1,NULL,'[]',0,'2019-02-25 10:54:52','2019-02-25 10:54:52','2019-02-25 11:54:52'),
	('29b81229b3766921c06dbd9b8c73d83506e4e24935d3e1bcab70351608a72677051e073e95a6e145',47,1,NULL,'[]',1,'2019-02-24 21:33:34','2019-02-24 21:33:34','2019-02-24 22:33:34'),
	('2a191105c935660ecf39c56b0d0a927090e760ac0178c6ecbffa5ba46912d72f94c1739bf7785adb',45,1,NULL,'[]',0,'2019-02-27 06:42:15','2019-02-27 06:42:15','2019-02-27 07:42:15'),
	('2b2f8c51f39a5c038fcdb90b00682802e4b34b10ea5023043688aac463aa44b76ca404e833e4e9bc',45,1,NULL,'[]',0,'2019-02-26 08:37:27','2019-02-26 08:37:27','2019-02-26 09:37:27'),
	('2bb06195013055c0470ed451d7632a8e3c5050159abc8a2f4a946f8cf3277b41ecedbcb10e66a4bb',43,1,NULL,'[]',0,'2019-02-22 00:04:15','2019-02-22 00:04:15','2019-02-22 01:04:15'),
	('2d318ee7c442b8568a0995bec0447fba81b2001b812faf88790e158c152e3bb6085486349837a45e',45,1,NULL,'[]',0,'2019-02-25 02:34:05','2019-02-25 02:34:05','2019-02-25 03:34:04'),
	('2fe4a99a0712e6c612e833b0491b28c449f0382014ccddb64b0617882fdf3dc37bd87fd4496f0c98',57,1,NULL,'[]',0,'2019-02-24 22:03:36','2019-02-24 22:03:36','2019-02-24 23:03:35'),
	('31311a07073e08b238b728371128bcd7e16381d5ced254f96254965b9584c3fbf184a0d60165d607',45,1,NULL,'[]',0,'2019-02-25 01:23:21','2019-02-25 01:23:21','2019-02-25 02:23:21'),
	('326c719a443887eb31bedebcabc993563eef25c09d112478b355f545be3b1012a02b2b4a3e14721b',47,1,NULL,'[]',1,'2019-02-24 21:32:27','2019-02-24 21:32:27','2019-02-24 22:32:27'),
	('3306ecd1696967412e545f6b60dee89f05d7f8c1d71c88e34ad619c89a05bc0204c30de0e574c2c8',47,1,NULL,'[]',0,'2019-02-21 20:54:19','2019-02-21 20:54:19','2019-02-21 21:54:19'),
	('332d572f9c4e7d376dde31c24db97e37bb820e27936cde65ad7fcd2835806157d6e22a182a89db28',45,1,NULL,'[]',0,'2019-02-27 07:09:31','2019-02-27 07:09:31','2019-02-27 08:09:31'),
	('33f9d83a3968ff3ae66024e3d8d1959ebca62f5b6d41b309195e333f29d731d86838734089e10bac',47,1,NULL,'[]',1,'2019-02-26 10:00:36','2019-02-26 10:00:36','2019-02-26 11:00:36'),
	('354be5f899380944d87be0785abf0a62354f5cedbf03bf00ac4061148fc234d0d7e756abc0115090',45,1,NULL,'[]',0,'2019-02-26 06:06:07','2019-02-26 06:06:07','2019-02-26 07:06:07'),
	('361d6aef6c26daaa02a505161710aac9365e04db58c665be622e3e9ab0d083aeca0bdcb26bee723b',47,1,NULL,'[]',0,'2019-02-21 20:19:26','2019-02-21 20:19:26','2019-02-21 21:19:26'),
	('3685285fdedf8c9172c2d58b3072ad9e3e149cf2c043598887663850140686f6d03514b7bafdcead',45,1,NULL,'[]',0,'2019-02-26 07:19:16','2019-02-26 07:19:16','2019-02-26 08:19:16'),
	('392944fe41835398448e8bf8fa2670a69f0b28552952d43410561ce08de322da4b4db23d36488324',47,1,NULL,'[]',0,'2019-02-24 21:03:34','2019-02-24 21:03:34','2019-02-24 22:03:34'),
	('39323f568ca915837d445df6c62647827b918d0ec09a3c71ec75cbd6f8b44ce22e37e00f1f332af1',45,1,NULL,'[]',0,'2019-02-27 06:59:35','2019-02-27 06:59:35','2019-02-27 07:59:35'),
	('395fafb974d913f55f235600fffbed9c5b2c345740008cc531c5fa8b47927fce6458a37784f7a1e2',47,1,NULL,'[]',0,'2019-02-21 20:21:13','2019-02-21 20:21:13','2019-02-21 21:21:13'),
	('39c2b72220b978eff4213bcf14ea2453e985f93c002eed90a501ae765267dcd67039f9e3f1d70b3e',47,1,NULL,'[]',0,'2019-02-24 00:46:40','2019-02-24 00:46:40','2019-02-24 01:46:40'),
	('3a3b2bb2cf87d7c7a6427805c55cb82db21c1dc26b6eda310afaa6d567f8be501d3e2e5fac9683aa',45,1,NULL,'[]',0,'2019-02-27 06:57:14','2019-02-27 06:57:14','2019-02-27 07:57:14'),
	('3a4f7ec1015ea768f37b23178f1cacf19874dd5367f284008dc92f4fb843a538f6a506db25547d06',47,1,NULL,'[]',0,'2019-02-22 19:44:49','2019-02-22 19:44:49','2019-02-22 20:44:49'),
	('3b839c92961c4a6c470486f5c29f383f3642a89d6d3ce6ddfd6aeb4e9d30d9001a3971df75772617',47,1,NULL,'[]',0,'2019-02-24 01:10:00','2019-02-24 01:10:00','2019-02-24 02:10:00'),
	('3c0a0a258211734594130004bc33276609c9c14d435bf71e75ddea660d4e6c5bae303c8030d598c0',50,1,NULL,'[]',0,'2019-02-22 19:06:17','2019-02-22 19:06:17','2019-02-22 20:06:16'),
	('3c14b785c9b0becdb90da4aa202dd379b5a628090985b55c703b5534cdc60981c01eecf8a35839ad',45,1,NULL,'[]',0,'2019-02-26 08:56:35','2019-02-26 08:56:35','2019-02-26 09:56:35'),
	('3cbd620168f1c866ac597f925b97a4d40c153e526d869ef23679a51b05eab746e889565256a88064',43,1,NULL,'[]',0,'2019-02-22 18:41:14','2019-02-22 18:41:14','2019-02-22 19:41:14'),
	('3ccc121972ccf0ddc9ef90bfccf0e42efa2ad5f0e0f99001f44d2c752e7fc899fc9136d73ef98cd7',45,1,NULL,'[]',0,'2019-02-22 04:32:03','2019-02-22 04:32:03','2019-02-22 05:32:03'),
	('3f0037360d6b119d5a84e34544affd5fabaa16a53a3f975ee6f32a937b4132ec7ea466321dfe1737',45,1,NULL,'[]',0,'2019-02-28 03:26:18','2019-02-28 03:26:18','2019-02-28 04:26:18'),
	('3f347fb64c10f17bc9f9dd2bdce5e8f78a3fe8ba1462f8ebcca3d50b35f16764ea6cdb29fac88378',47,1,NULL,'[]',0,'2019-02-26 08:38:03','2019-02-26 08:38:03','2019-02-26 09:38:03'),
	('3fe231a9dcc651fea4e379553517c1f9fbbecf20bcd0917fb6f3112bd589703decf4f8fb8a8ceef7',47,1,NULL,'[]',0,'2019-02-24 00:44:51','2019-02-24 00:44:51','2019-02-24 01:44:51'),
	('40331e4aee314aeee5638b99508180e71c02ca9874714cd905426b64ebd127429c8facfe1e0c06aa',47,1,NULL,'[]',0,'2019-02-26 02:03:01','2019-02-26 02:03:01','2019-02-26 03:03:00'),
	('410c1729643a82ec524192aa0747cd0495a47aa3e693c98a25d9b24b163d6254f460b4adb780e275',48,1,NULL,'[]',0,'2019-02-22 18:34:58','2019-02-22 18:34:58','2019-02-22 19:34:57'),
	('4148517ed04c8001f9bd4c02160becf7ef41be1e08b3771ebc10984836b3188fc674bbd54fe3aeaf',45,1,NULL,'[]',0,'2019-02-22 05:08:47','2019-02-22 05:08:47','2019-02-22 06:08:47'),
	('417ea557c880ed5c5e6b76d9fb20720a803f1ddafd7f49f23f57ba8b69f9db2b5122d5bf086bc3d7',47,1,NULL,'[]',0,'2019-02-24 00:59:41','2019-02-24 00:59:41','2019-02-24 01:59:41'),
	('4198d6ecc20ed26dcc777cd88d4e094276849519b642b0259da11114c00d11ad65679e72efdf19d3',47,1,NULL,'[]',0,'2019-02-24 00:41:46','2019-02-24 00:41:46','2019-02-24 01:41:46'),
	('421a44dc9295118d03877e2b912b6226dd4ddd440c501e9457ece71b228593f0ba0fc79b8e7aeb16',47,1,NULL,'[]',0,'2019-02-26 08:35:03','2019-02-26 08:35:03','2019-02-26 09:35:03'),
	('4434e7e286cb2f88822254d9957754a122b6b2d7e86310dd81ede2f782892f51c8154ecb0e903af2',45,1,NULL,'[]',0,'2019-02-28 10:34:38','2019-02-28 10:34:38','2019-02-28 11:34:38'),
	('45374160230c693dde8f5532ef8922d793dc381340d5ccabaf0c7415c5cf2964b4f49701e22abc6b',45,1,NULL,'[]',0,'2019-02-25 02:23:30','2019-02-25 02:23:30','2019-02-25 03:23:30'),
	('457c549ac4022ae7e6a6b7de0b338307e79c70194032ce139fc47c7b45b6b8ad398f586349923c6a',47,1,NULL,'[]',0,'2019-02-22 20:27:30','2019-02-22 20:27:30','2019-02-22 21:27:30'),
	('4587d6efc9ed0ea2e8f4ea8dc6318103c7a3dc19c62449246a9cf21f27424d72d543ceec1fd3d33d',47,1,NULL,'[]',0,'2019-02-22 19:42:15','2019-02-22 19:42:15','2019-02-22 20:42:15'),
	('463b8c783d4fe5681b72beabf6d3c22df4f4c0b7b89418a35042adf03968322cfcd7b39749de9662',47,1,NULL,'[]',0,'2019-02-21 20:52:43','2019-02-21 20:52:43','2019-02-21 21:52:43'),
	('46df7c3f102a6bba0c911f344a3f87972392fdb93b76e438bb7caeb5a595ca079f68652827f40fff',47,1,NULL,'[]',0,'2019-02-21 20:07:11','2019-02-21 20:07:11','2019-02-21 21:07:11'),
	('476d0f5bc1cdb7782849b40cd056c4a095956eb9018405ec3717081dbc177320c5bdd61c4dfeb58f',47,1,NULL,'[]',0,'2019-02-22 19:24:14','2019-02-22 19:24:14','2019-02-22 20:24:14'),
	('47bc2f1dfe28b172c6e03d51c7748fde50fd7d089f8c5d9cf0d7b136864a71f7398c385a0b1cac24',47,1,NULL,'[]',0,'2019-02-22 20:09:21','2019-02-22 20:09:21','2019-02-22 21:09:21'),
	('488fdb49541d626e060550f91ce3fdea031a6c20ad8a8056c93fca171b155cf96b3f44b6fa946523',47,1,NULL,'[]',0,'2019-02-21 20:57:35','2019-02-21 20:57:35','2019-02-21 21:57:35'),
	('49752f03f322eb7d32cd5444541e4bb2ea3a7b8648b00976c2b61eac5bee493051c2ab001e82ddcf',45,1,NULL,'[]',0,'2019-02-26 08:04:54','2019-02-26 08:04:54','2019-02-26 09:04:54'),
	('497f2e082f0dab972d370d1a0208e468d291a8dc6d02a7318850427a50a827b0067d903e2c8b654c',47,1,NULL,'[]',1,'2019-02-26 14:10:46','2019-02-26 14:10:46','2019-02-26 15:10:46'),
	('4a29d6de6ecc9162f16a48db27acbf83e4bd9a4ba64b2de728f285281bf651511856e08efb9d1eef',47,1,NULL,'[]',0,'2019-02-21 19:14:01','2019-02-21 19:14:01','2019-02-21 20:14:01'),
	('4a3b428247a5cec61e3e81173157d86641d026445a1e80b372bc40546421e12fecf839e3a1f47cf5',45,1,NULL,'[]',0,'2019-02-26 10:17:27','2019-02-26 10:17:27','2019-02-26 11:17:27'),
	('4ab4314ddf58f3e76ccab7b68a2da334dc9d93866153197971e18f2529145313d37fc725ca420f9a',47,1,NULL,'[]',0,'2019-02-24 20:50:27','2019-02-24 20:50:27','2019-02-24 21:50:27'),
	('4af8d2772078b10b87b17f6cab0ea9cb70bca0cb5215f8793a5420875038a1795d8a02cf3472a472',47,1,NULL,'[]',0,'2019-02-26 01:51:21','2019-02-26 01:51:21','2019-02-26 02:51:21'),
	('4c2d65d57f928d160bd995da45b44bbe19023b7885d8313655b7994ae6ff83889471a1c14384aec5',47,1,NULL,'[]',0,'2019-03-01 03:36:25','2019-03-01 03:36:25','2019-03-01 04:36:25'),
	('4d41e778230daeee95556252911974c5c14d31300af2256523154ed993c88069f61cd60ab00b7767',54,1,NULL,'[]',0,'2019-02-24 21:58:50','2019-02-24 21:58:50','2019-02-24 22:58:49'),
	('4ec3747a90b7113b78b9bec555ea1789e754a5535496863329ee8e70775780824448fd173c58825b',45,1,NULL,'[]',0,'2019-02-27 07:08:40','2019-02-27 07:08:40','2019-02-27 08:08:40'),
	('4edf079b0fea51a8ae92dcdcfeeb0dc8ee130257ffa6f8ef5d6af7b1584b976d8e56e981f1758092',47,1,NULL,'[]',0,'2019-02-21 21:19:41','2019-02-21 21:19:41','2019-02-21 22:19:41'),
	('4ff21b8330b7f01dae7d97f12e4c093a47cc1c5f0825f5304cea3b1c810e6fc4e17922e03a5d231c',47,1,NULL,'[]',0,'2019-02-26 02:01:07','2019-02-26 02:01:07','2019-02-26 03:01:07'),
	('4ff4525931fa92f57da204a4f1800f8fa1c1048f17afc7d26af7900cb6d6677d14fc116ec824a4a2',59,1,NULL,'[]',0,'2019-02-24 22:23:41','2019-02-24 22:23:41','2019-02-24 23:23:41'),
	('5204652dedecaab38c1a5c35b171eb97a8565fb8d8e1121ca923a1e896ad697f56f6b87df2aab680',47,1,NULL,'[]',0,'2019-02-21 20:37:10','2019-02-21 20:37:10','2019-02-21 21:37:10'),
	('525e7fe1cb4f5830e8549f05b3159dae49ae75c5214a6ca8dfb5198bc3a94745d21068c2d96edddb',47,1,NULL,'[]',1,'2019-02-26 10:12:32','2019-02-26 10:12:32','2019-02-26 11:12:32'),
	('554cca4bf63e61f2d9f8441048a1a4b4f389dd34ecd89144fb500c0c5c5806174cb93eccba539f42',47,1,NULL,'[]',0,'2019-02-23 22:01:23','2019-02-23 22:01:23','2019-02-23 23:01:23'),
	('56c6cb626a52b8cae38e799b838c97d1827d052c873c63e5c8f5ac5fc3f0c85835dfe6a16f732d9e',45,1,NULL,'[]',0,'2019-02-27 08:23:31','2019-02-27 08:23:31','2019-02-27 09:23:31'),
	('585cbd9abe16e7fa34a7ae78c8c1847413cfa3b679fbb4b745c08eb8a2979d4c85a70684cfaec3d2',45,1,NULL,'[]',0,'2019-02-25 01:04:06','2019-02-25 01:04:06','2019-02-25 02:04:06'),
	('597e37b0de731f2d54ac231d231dfaf796ca73ef6855ad58071b32cc5477b0aec18a6c7a6c8ce4e2',52,1,NULL,'[]',0,'2019-02-23 00:19:55','2019-02-23 00:19:55','2019-02-23 01:19:54'),
	('59b2a45b10355c00aab8fa48ff4f1e502eee92ac7e1d00f69b8accd695f4367c0c0b93363b6ed965',45,1,NULL,'[]',0,'2019-02-26 07:39:12','2019-02-26 07:39:12','2019-02-26 08:39:12'),
	('59da2610af5bb291be832de273e1c7ce1e6cc306fa309ec034d1bd41f2273e49ec798ab0c5267cd3',45,1,NULL,'[]',0,'2019-02-26 07:15:27','2019-02-26 07:15:27','2019-02-26 08:15:27'),
	('5ab6a755b97f205ef27234dfe86690f73ff556e3bf6916832c5f7ff0f23139f291917d59b31896d6',45,1,NULL,'[]',0,'2019-02-20 12:23:03','2019-02-20 12:23:03','2019-02-20 13:23:03'),
	('5ae7529b01a2e3fca6221a2e737a29a048113079e53143461c937d8001afd496645f66169eb445e5',45,1,NULL,'[]',0,'2019-02-28 06:48:30','2019-02-28 06:48:30','2019-02-28 07:48:30'),
	('5d0faede32ed61c2d3449c23c3533e556a48cbafbbd3d1e0169e9a1260facec81695e35dc7709029',45,1,NULL,'[]',0,'2019-02-25 01:08:40','2019-02-25 01:08:40','2019-02-25 02:08:40'),
	('5d6b349ebc9f6c5c5eb6f1c9e489a23b44999f8b2ee93739a2bcee86c28e9e0dd9fb315c75a43b6d',45,1,NULL,'[]',0,'2019-02-26 07:39:59','2019-02-26 07:39:59','2019-02-26 08:39:59'),
	('5ee88071956fdbc674a0254f3aeb4b48cec6740c94d7cb020d9156ab3e7e62910d38e3036b4029a4',47,1,NULL,'[]',0,'2019-02-26 02:02:33','2019-02-26 02:02:33','2019-02-26 03:02:32'),
	('5f27cb1a0e025678e85b53ae3f36de08ce2a3975b8d6b2e1bea3eeea0e0632fcc3bfb94d5cd53151',47,1,NULL,'[]',0,'2019-02-21 20:08:05','2019-02-21 20:08:05','2019-02-21 21:08:05'),
	('60953484faec00ae6705e562373d8e62ba711badd581d1d68550ab635640c9507792d3147a10dae9',45,1,NULL,'[]',0,'2019-02-26 07:52:46','2019-02-26 07:52:46','2019-02-26 08:52:46'),
	('613381404db04e4012b46144c04241a9006617b7a889ebdfad401a2ad7e7629768aa104e2dfd78ca',47,1,NULL,'[]',0,'2019-02-22 20:19:07','2019-02-22 20:19:07','2019-02-22 21:19:07'),
	('613dd747998e725433571d0227dd2dca20dd3f9e225160e2680639cdba35db019379b52029efc926',47,1,NULL,'[]',0,'2019-02-26 02:22:09','2019-02-26 02:22:09','2019-02-26 03:22:09'),
	('63acd3fd87c49072537e394d6a8489982608b0efe2a6f47deb9e8a7d5306bc3b5d1a30da09de5ff0',47,1,NULL,'[]',0,'2019-02-21 20:13:37','2019-02-21 20:13:37','2019-02-21 21:13:37'),
	('6599aeec8bb9203f7bf8003016eeba1b1bc386594157b1e041cdbb2032aab69c067a9f5c74830436',47,1,NULL,'[]',0,'2019-02-24 00:51:20','2019-02-24 00:51:20','2019-02-24 01:51:20'),
	('6624e0aedace9dbb8aac040a225f7fe069bed9880e48b1a66a1ce54c306886de236b5719f24bd68f',48,1,NULL,'[]',0,'2019-02-26 00:18:54','2019-02-26 00:18:54','2019-02-26 01:18:53'),
	('66541d8fe90b31c616b32bc05bd4c62c7505a4d36619888b900cd9ef148cfdc9c411a862d09fea02',47,1,NULL,'[]',0,'2019-02-22 19:10:31','2019-02-22 19:10:31','2019-02-22 20:10:31'),
	('6684e231bd1784b7cdf256f9c114fb17d145623dc4b5fbc98da282a5a28ba9b6bfa114c7228623d7',47,1,NULL,'[]',0,'2019-02-24 19:12:59','2019-02-24 19:12:59','2019-02-24 20:12:59'),
	('66ae9869138550b77de7b95161944c267a20aaf4b66e8fd808d14600a73003e8dada24eae400d0fb',47,1,NULL,'[]',1,'2019-02-26 14:14:58','2019-02-26 14:14:58','2019-02-26 15:14:58'),
	('6810b1d422d49557b4ccc952d87d0dcd8e94c804f35e5ae83f22e88eac9d0132eca3d465f2c3865a',43,1,NULL,'[]',0,'2019-02-07 14:31:12','2019-02-07 14:31:12','2019-02-07 15:31:11'),
	('6898116898e8b29681594cdfe462ee0a918aee3c37931ee96c06e8a8bdc062d52c1a357a1b9f63ba',48,1,NULL,'[]',0,'2019-02-26 00:18:52','2019-02-26 00:18:52','2019-02-26 01:18:52'),
	('68cc5ce8137ea22c3e6b5626cb7d75e389e7776f525271b0abd53f56b458d0b861dee25672f082e2',47,1,NULL,'[]',0,'2019-02-26 09:39:48','2019-02-26 09:39:48','2019-02-26 10:39:47'),
	('68fbeef3bffac62a0ad4e6919677610ac7ac1083dd20ba766e6199d3fbc7204f9185ba6f8503e532',47,1,NULL,'[]',0,'2019-02-22 19:42:45','2019-02-22 19:42:45','2019-02-22 20:42:45'),
	('6ac4b0130d74a539d5a186d465425a8cbe59223f9c5ec463e8586e6b1baebcdf23d8766b71466ea5',45,1,NULL,'[]',0,'2019-02-26 08:23:31','2019-02-26 08:23:31','2019-02-26 09:23:30'),
	('6b7b9faec692479c407637e3a81b6c281d56591cb118d603cceab5a007c3fbdaffb5859b63dc90a6',45,1,NULL,'[]',0,'2019-02-26 07:50:25','2019-02-26 07:50:25','2019-02-26 08:50:25'),
	('6b99d65d10de52b85c8570aa1458ad6244fd25ce84d4dd8359331c3fb92cf9a7c5d687bc081a98c4',47,1,NULL,'[]',0,'2019-02-21 20:26:35','2019-02-21 20:26:35','2019-02-21 21:26:35'),
	('6c797f541fdaa41e7ef66a9361f4484873e0680e5933c40db672f8c4c18fa74c61bc119f379dbdd4',45,1,NULL,'[]',0,'2019-02-26 08:43:32','2019-02-26 08:43:32','2019-02-26 09:43:32'),
	('6c858e298b111a1d756c15476ab25557375c462d8196c8fbbdce0d6dd1ff457618b2fbea189ecd60',47,1,NULL,'[]',0,'2019-02-26 15:15:57','2019-02-26 15:15:57','2019-02-26 16:15:57'),
	('6c96c3a1b65b0baef9047c3c5031624d755ba2ec3fbc48d5b139b33143ec59da9c6bdb9dabc1a7ee',45,1,NULL,'[]',0,'2019-02-27 07:28:15','2019-02-27 07:28:15','2019-02-27 08:28:15'),
	('6caa88945d6e3f53c42a3f3abaf76c96442a6a6de0ec81e6f878b33160992b8e48a4fa5c29778b1b',54,1,NULL,'[]',0,'2019-02-24 21:59:14','2019-02-24 21:59:14','2019-02-24 22:59:14'),
	('6e5730f73f1b02af3cb3692dd8f269b9a272c32f4d37b9d26abe5da0dd90109e7d5a82979bca0a73',43,1,NULL,'[]',0,'2019-02-21 13:54:19','2019-02-21 13:54:19','2019-02-21 14:54:18'),
	('6e5c2122a67cee264f1c9a0ab21a73ee148bd25bf90abc4099fd7f6916751ac5cda2bef407a4f368',47,1,NULL,'[]',0,'2019-02-26 14:47:22','2019-02-26 14:47:22','2019-02-26 15:47:21'),
	('6eb517dac1da50ded0432427aec97d5b9aceab96d8fbe3e5991787c201237807a8e32ef47fbca102',45,1,NULL,'[]',0,'2019-02-26 06:06:39','2019-02-26 06:06:39','2019-02-26 07:06:39'),
	('6fc6b34eb59106ea05e49dd82fd4bdcad88312b5804dfa2e250ea6bacb1e829e7487bf4d0eb5d2d1',45,1,NULL,'[]',0,'2019-02-26 04:17:18','2019-02-26 04:17:18','2019-02-26 05:17:18'),
	('6fdfd37f78c0d97000e72dbefaccae99a61cba8521ecb44598760cf24dc8c6bea09f2942bd604ed6',45,1,NULL,'[]',0,'2019-02-26 07:41:15','2019-02-26 07:41:15','2019-02-26 08:41:15'),
	('6fe08ba297fa5cf5dee169e17c8f9612bbb29b7f7d004a8000a74441e1e9caac435da685d19d0b3c',65,1,NULL,'[]',0,'2019-02-26 09:47:06','2019-02-26 09:47:06','2019-02-26 10:47:05'),
	('70b83f85a16a5d9271c1627db09e06820cfc4ae1172f1d4aef0fc254c20c2129849c82292ad90455',47,1,NULL,'[]',0,'2019-02-24 21:04:57','2019-02-24 21:04:57','2019-02-24 22:04:57'),
	('7145f9b6f6fe0516e2af706d9010f9a35ca26a202f90b3b5b2773d56a5b8cebf352caf28b9b99b87',45,1,NULL,'[]',0,'2019-02-28 03:31:04','2019-02-28 03:31:04','2019-02-28 04:31:04'),
	('7147182cb3fc84885a1adbb8ab09ffc7f8677d5fc583976db63fe9ea07f44f7871d94a27f2ed5393',45,1,NULL,'[]',0,'2019-02-25 10:53:15','2019-02-25 10:53:15','2019-02-25 11:53:15'),
	('716630669b37d5af3d9371bcea022c9c64b3eb006826d2e4b2175f1cf7e780a1f89eea62a1904f74',47,1,NULL,'[]',0,'2019-02-22 20:25:33','2019-02-22 20:25:33','2019-02-22 21:25:32'),
	('723f1c59fcf8161360075ee26afd1da1095871815a2a2e21a15c63338981c9e0000577002b1e645b',64,1,NULL,'[]',1,'2019-02-25 23:03:17','2019-02-25 23:03:17','2019-02-26 00:03:17'),
	('73020f6f59359dd30a2b44a1f215f9672145afa606db6c1f962d2fc474b1d6fb639b4450a7058ff6',45,1,NULL,'[]',0,'2019-02-25 01:46:04','2019-02-25 01:46:04','2019-02-25 02:46:04'),
	('73ccea813a539e7c03aaa7ad123b2fab6aae97305abcb19f09bab03f8b9f86c49f670ec98fe27de4',47,1,NULL,'[]',0,'2019-03-01 02:05:21','2019-03-01 02:05:21','2019-03-01 03:05:21'),
	('73db1d2fd7e01bd8a33d7b41d32642c7364cab7f803878eb0f343d8177c9ff0398986f4cdb4bbce3',47,1,NULL,'[]',0,'2019-02-22 20:17:19','2019-02-22 20:17:19','2019-02-22 21:17:19'),
	('743e2c5c5a8b89071c5295a48ea7a00e40f01172f7ed39089f6d92d5c73c1aba1ec93d961f1e5eb4',45,1,NULL,'[]',0,'2019-02-26 09:32:52','2019-02-26 09:32:52','2019-02-26 10:32:52'),
	('75335ace0c2698c10e3e97d52470aee8a482ebef8abc6086afdef72cf93e070ca4838ac190aeca39',47,1,NULL,'[]',0,'2019-02-24 00:43:41','2019-02-24 00:43:41','2019-02-24 01:43:40'),
	('759852ba7cd5092e00f324945f4789d2530919511eec27a0edfcdbc93f1b1f6a9c14fc177f58a9f3',45,1,NULL,'[]',0,'2019-02-26 06:16:14','2019-02-26 06:16:14','2019-02-26 07:16:14'),
	('76c47a733f534ef5be6330c4658d18d5aa63d026216cc7387c7210abb9b0ae31103d25354a5e14d6',45,1,NULL,'[]',0,'2019-02-25 01:30:03','2019-02-25 01:30:03','2019-02-25 02:30:03'),
	('76ec26b8ea8ee7fba49a6ab390cada33e8ae71381f9acfffef2c646117b8467bd1065b57b2cf8557',45,1,NULL,'[]',0,'2019-02-22 04:58:22','2019-02-22 04:58:22','2019-02-22 05:58:22'),
	('77e4d9692000d68d2c34d1519393d29be23b3e281460a6922347b07cdc20be97864b703d2624a560',50,1,NULL,'[]',0,'2019-02-22 19:07:25','2019-02-22 19:07:25','2019-02-22 20:07:25'),
	('78533ee63943db8a845bd4178efa41a9b7352d199e30fb6119819b03996b6eda9849f9bc443f2144',45,1,NULL,'[]',0,'2019-02-28 09:59:14','2019-02-28 09:59:14','2019-02-28 10:59:14'),
	('78be56cb6c428dcf70d711eca4d217b89da712d525879964e2a186e2347babad8d0ebaa7ab1ccae6',47,1,NULL,'[]',1,'2019-02-26 10:02:58','2019-02-26 10:02:58','2019-02-26 11:02:58'),
	('797f829d95e57c2119c0a24c24ce498d993a3c51b6b13991b18a79553627ef1f96bb0e000b372478',45,1,NULL,'[]',0,'2019-02-25 01:35:50','2019-02-25 01:35:50','2019-02-25 02:35:50'),
	('7a65236a8f098eab21ac396fb6529dd41a91eb74c42ee6baf4c717081ef7c366f7e18b1de2fad1a3',47,1,NULL,'[]',0,'2019-02-24 20:23:15','2019-02-24 20:23:15','2019-02-24 21:23:15'),
	('7c4c0de10986d0e8a8ca3c5adfb4ef13a3fe78f6d266e32e112ca06043b1583c8b75967fc922a512',47,1,NULL,'[]',0,'2019-02-21 20:20:09','2019-02-21 20:20:09','2019-02-21 21:20:08'),
	('7dbd35eb59499bbdec10499f11fc66f14df9122d4ea427b98977338d2dbab69e4eee4329e3b37632',46,1,NULL,'[]',0,'2019-02-26 09:46:25','2019-02-26 09:46:25','2019-02-26 10:46:25'),
	('7e155121796ee8c807e5159d3d8e0bb75fea7b0c447d8a06399c07834497557745492580a46f1b8c',48,1,NULL,'[]',0,'2019-02-25 16:56:29','2019-02-25 16:56:29','2019-02-25 17:56:28'),
	('7e72fa55d4129dacb44db3e35578562ec8a400bced3fa9dced31ceedda860418573400cf2db3dbc3',47,1,NULL,'[]',0,'2019-02-26 01:57:30','2019-02-26 01:57:30','2019-02-26 02:57:30'),
	('7f82917a4c9e201fcc1849e6450dc941ec6a202593db6dac6c9414727d29d9876c30f175d3401248',45,1,NULL,'[]',0,'2019-02-26 06:15:18','2019-02-26 06:15:18','2019-02-26 07:15:18'),
	('7fe96a08195326766269ac6b09fd3b1b4c9a64956bc56427d5f7f809d43db4129faff1a03c76d2d5',45,1,NULL,'[]',0,'2019-02-26 07:42:58','2019-02-26 07:42:58','2019-02-26 08:42:58'),
	('805eac0fe53e086efa96b6b30829a03f7e805487475a76a704931461d010124a75757e2d4f78b6b3',45,1,NULL,'[]',0,'2019-02-26 04:32:48','2019-02-26 04:32:48','2019-02-26 05:32:48'),
	('8083766d7d5b6c9ef927f8cc350f3e08819609350dda4a0887b2a60051502c55bafc9e4045af6d0d',47,1,NULL,'[]',0,'2019-02-26 01:52:05','2019-02-26 01:52:05','2019-02-26 02:52:05'),
	('82b7d1a712738383da5e03099804f46888b56c8b22c1102a387a771abcca61c5c0bc28ff54a33ea7',46,1,NULL,'[]',1,'2019-02-26 18:27:58','2019-02-26 18:27:58','2019-02-26 19:27:58'),
	('833e677adcc5ed34a512612741e89042c28d398c7ba1296fec3c4bacc83ed0591c50e305ff1eaff7',47,1,NULL,'[]',0,'2019-02-26 08:33:18','2019-02-26 08:33:18','2019-02-26 09:33:18'),
	('8359fa621b3fd8e421bc1cbf3a65e594420e331ff08af79bc1a9cd305d0780903982f91939bcca87',47,1,NULL,'[]',0,'2019-03-01 03:17:30','2019-03-01 03:17:30','2019-03-01 04:17:30'),
	('83bd91b11ff3bd7d3813445e091126240d30e6f8584c82f47b3c207a3a243f5494246fcc7254dfd4',47,1,NULL,'[]',0,'2019-02-21 20:51:00','2019-02-21 20:51:00','2019-02-21 21:51:00'),
	('841a33f2164baab00d7b681051d7ddf94d09487358357b9ba2055e668f76f64a6978f8a717b1855f',47,1,NULL,'[]',0,'2019-02-22 20:04:38','2019-02-22 20:04:38','2019-02-22 21:04:38'),
	('85307f393bce88737bcfc889e6ccb2e46a91d439774903cbddbfa2cb76a0d28193f1fb099d6a1825',45,1,NULL,'[]',0,'2019-02-26 08:21:06','2019-02-26 08:21:06','2019-02-26 09:21:06'),
	('8688819b4192252df51fb3fdcc4642520c71dfe96b92f22ba5225c07790fd543de7fbca4d9cc4b8f',45,1,NULL,'[]',0,'2019-02-25 02:28:42','2019-02-25 02:28:42','2019-02-25 03:28:42'),
	('86db869980d602698ecf673f00a53f83f4e124f88f0eeff3875c39a1cad2b5bf6d927054dad3cc7f',44,1,NULL,'[]',0,'2019-02-07 15:07:21','2019-02-07 15:07:21','2019-02-07 16:07:20'),
	('87669223f5c85ea68d10ce62a3757ec120bb64c2c6d6d3c32a1c54726bb73b421fb6daf6f9f0e004',44,1,NULL,'[]',0,'2019-02-07 15:11:29','2019-02-07 15:11:29','2019-02-07 16:11:29'),
	('884540577a5a3d160832c61e115aaf77a8fb88ee5bdb562c1c1ea239e43f35e2e7bbd46f876a7a68',47,1,NULL,'[]',0,'2019-02-22 19:49:21','2019-02-22 19:49:21','2019-02-22 20:49:20'),
	('89db5e426ead665d2c4ca6e48caef2c8f848c912b20559d3bc7f6c0c9a2c3dd7a39bba4f0f6ed215',45,1,NULL,'[]',0,'2019-02-25 02:56:18','2019-02-25 02:56:18','2019-02-25 03:56:18'),
	('8a0f3091978cc739e267ba4af6e9a4ae6c3f5c03184ee7255c613cdf4b725fe1371e9aba6eebafb1',45,1,NULL,'[]',0,'2019-02-26 10:07:40','2019-02-26 10:07:40','2019-02-26 11:07:40'),
	('8a270c7fdf7c940ae2ae1197b08ac074aa0274c4c5f795d996ddc941da79fce07cf6381a4ffd362e',47,1,NULL,'[]',0,'2019-02-21 20:01:30','2019-02-21 20:01:30','2019-02-21 21:01:30'),
	('8af97a3792bcc503222dc8008a541a9100e4057dc7bc090dacecd4199ac152626bc1c91ecf0108fd',47,1,NULL,'[]',1,'2019-02-26 15:52:50','2019-02-26 15:52:50','2019-02-26 16:52:49'),
	('8ba233dfb90ec1fd4de837a1a7f9c6b64df892b4996bac6257f1588b51a40eefe04db7c9e81c8ce1',45,1,NULL,'[]',0,'2019-02-26 07:47:02','2019-02-26 07:47:02','2019-02-26 08:47:02'),
	('8bd8dbb1f3131b1174b69ca7a8a7441d7fcb9bb81569d014a5ac6babd332481a5a4109c7493bc67b',47,1,NULL,'[]',0,'2019-02-22 19:43:21','2019-02-22 19:43:21','2019-02-22 20:43:20'),
	('8d2290e755bc3f1d72ee06fa3bdfe23695a9a750738faa2889d7e156206b2b6412e9ed08d6769c70',47,1,NULL,'[]',0,'2019-02-24 20:03:33','2019-02-24 20:03:33','2019-02-24 21:03:33'),
	('8d323ed4572af2b6228546ad28238ddff63ed0fc58f08fdd0d2309fa726fb251f1d5a779bc9428f5',45,1,NULL,'[]',0,'2019-02-28 05:32:02','2019-02-28 05:32:02','2019-02-28 06:32:02'),
	('8de669a8873d2ec23f14322cc59a611709f5d9981a2cd58002761dd136595a8186a2eab0931b0a9d',45,1,NULL,'[]',0,'2019-02-26 08:49:26','2019-02-26 08:49:26','2019-02-26 09:49:26'),
	('8f14e123693d143aad2ae77a7f8ef93363bfccb4db7d72d2136a3871fe9a416f0a47ac7fed3ae6ee',45,1,NULL,'[]',0,'2019-02-26 04:23:09','2019-02-26 04:23:09','2019-02-26 05:23:09'),
	('8f5b456c506615f5eebb9d15ab87fdcf1bb0edf869489a18be76350485f5757c7b7a3ae550204bbc',45,1,NULL,'[]',0,'2019-02-26 08:57:26','2019-02-26 08:57:26','2019-02-26 09:57:26'),
	('8f96ecdac3a161a3f00a13db1ec730416d81f9d264ce3b57cb88f73940a540983ba15e4875655d51',47,1,NULL,'[]',0,'2019-02-21 20:56:24','2019-02-21 20:56:24','2019-02-21 21:56:24'),
	('90b79ad4bcd29bdcb03b403aa019592d8d68f25ef9fbc0b2f1975f08ece6731943a945cfb7aca178',47,1,NULL,'[]',0,'2019-02-26 09:40:09','2019-02-26 09:40:09','2019-02-26 10:40:09'),
	('91d9f6a455d749bbf62052ea29b0da6dce7b3d1135524182f3019d72a9c1c705754fcbc3635c598f',47,1,NULL,'[]',0,'2019-02-22 19:15:27','2019-02-22 19:15:27','2019-02-22 20:15:27'),
	('929e348544312f2774ab6b4a5c594d9fe5cc23a414ae3076c90ad40f548a0ee10915a50dad1219c7',45,1,NULL,'[]',0,'2019-02-26 04:49:08','2019-02-26 04:49:08','2019-02-26 05:49:08'),
	('92ff5314eb60f1d11e2c0f8a65338bf29f94f69275694c82bce9afcddca59733ace6ac72b2b1a2c0',47,1,NULL,'[]',0,'2019-02-23 21:42:57','2019-02-23 21:42:57','2019-02-23 22:42:57'),
	('9389c76218b7655d0da03e0f5ecf49fe43d3e2328e8d3ca735ed07554f8b75805a709f2f8dfe7d44',48,1,NULL,'[]',0,'2019-02-24 23:14:21','2019-02-24 23:14:21','2019-02-25 00:14:21'),
	('938d9eb40d996e44e0ed3279dc59366e70920a6d34b2960274bd02cd3b2b066285652dc80a4547a0',47,1,NULL,'[]',0,'2019-02-26 01:58:24','2019-02-26 01:58:24','2019-02-26 02:58:24'),
	('94156dfd64ea5e3544d2b003d940a94818661d082efe3cde538c23bfb540a0d9ebc278d4d18e293b',47,1,NULL,'[]',0,'2019-02-22 01:28:25','2019-02-22 01:28:25','2019-02-22 02:28:25'),
	('946238b6267e4a75ba7a233b099c8d513c51dd00b9e452436d926ffbc383a3f53de065f61f5e8d5c',65,1,NULL,'[]',0,'2019-02-26 09:48:01','2019-02-26 09:48:01','2019-02-26 10:48:01'),
	('947a748bf54464fb29d006ced0a8d0074ad1fafbffa7383a602ec8eba138ad30a10338f07e92a195',45,1,NULL,'[]',0,'2019-02-26 06:31:31','2019-02-26 06:31:31','2019-02-26 07:31:30'),
	('94e275379b88821c7844fd73ad0951700417a1adacd0254604ed483ccb83b0f815d53b909ade3d01',47,1,NULL,'[]',0,'2019-02-24 21:01:49','2019-02-24 21:01:49','2019-02-24 22:01:49'),
	('97581bf4fce77f2db9b92d9adc501a26172665e05f0922b9ee4e0b24e6194923dc2e44d32b5a89cc',46,1,NULL,'[]',1,'2019-02-26 16:12:08','2019-02-26 16:12:08','2019-02-26 17:12:08'),
	('97776b17400fd0ecbc3047253ec1fdba1ab9745943db3e4701752114845286b474b0dcf58868bcce',47,1,NULL,'[]',0,'2019-02-21 20:51:37','2019-02-21 20:51:37','2019-02-21 21:51:37'),
	('9789e8086b279ea95feea97440c0f72debb604592aa0108efc2a438038f6182e096fb556d7507344',45,1,NULL,'[]',0,'2019-02-26 07:24:49','2019-02-26 07:24:49','2019-02-26 08:24:49'),
	('97e316f747064ec3a61c6524c318a6f764329959a49aace9b7f007464438e784b3fe21a7385fb10a',45,1,NULL,'[]',0,'2019-02-25 03:00:56','2019-02-25 03:00:56','2019-02-25 04:00:56'),
	('98c46703d3b6569b694d2ed07b5daa13e85341c3f43c41bef34709a5d1fcbdb78ac1e54489f44d15',45,1,NULL,'[]',0,'2019-02-27 04:09:01','2019-02-27 04:09:01','2019-02-27 05:09:01'),
	('98ca6155ca1ad4b32d8b51c4544d517e6419fee4abf2ce1b7f163601ef5bc76818033e0361373b62',45,1,NULL,'[]',0,'2019-02-26 09:27:04','2019-02-26 09:27:04','2019-02-26 10:27:04'),
	('9951590b51eb6b5fbc75fabcfd666ea8074daa18c232c8acf196eb31d31895eb6cfc02d8f249005b',47,1,NULL,'[]',0,'2019-02-22 20:10:25','2019-02-22 20:10:25','2019-02-22 21:10:25'),
	('9aa846c85e42fb673dd7ebc73e246b355cd9acdd6cf0803fd8cf32cfe206907a5555a655bff5e09a',45,1,NULL,'[]',0,'2019-02-26 06:23:44','2019-02-26 06:23:44','2019-02-26 07:23:44'),
	('9b0556804f1a0dae498176990e8191f9a818f8dc1cfc1cde192a2b4335b280db49b1ca9da2962b0d',45,1,NULL,'[]',0,'2019-02-26 09:06:41','2019-02-26 09:06:41','2019-02-26 10:06:41'),
	('9bc75a7d020aabbf45ffe1cd28cbabff411cded8cfce12c23e2a07458ac2a8cc9dece17c98352904',45,1,NULL,'[]',0,'2019-02-25 00:52:27','2019-02-25 00:52:27','2019-02-25 01:52:27'),
	('9bf7bf0a76c93b9387973df0b529884dd03ba3d9c35346c153d65854710c7c397c79372756450a19',47,1,NULL,'[]',0,'2019-02-26 10:17:43','2019-02-26 10:17:43','2019-02-26 11:17:43'),
	('9ccd6e91ade54ea93f7ad4011beff748b0b577dcb3bb5433e3dde4299afb89d180e324e4105d3e1a',47,1,NULL,'[]',0,'2019-02-23 21:59:40','2019-02-23 21:59:40','2019-02-23 22:59:40'),
	('9ce84ec3785d07296b6f22d0b87cb50036541cf26a3fd6e70ac5fc77fa2375a3017a5f9bdbc89dab',47,1,NULL,'[]',0,'2019-02-21 20:55:08','2019-02-21 20:55:08','2019-02-21 21:55:08'),
	('9d156460fa86683804ad1ee305d46abc5efa53b8121780d3a0fd6289b3575ae70b2a14685d6110bb',45,1,NULL,'[]',0,'2019-02-25 02:20:49','2019-02-25 02:20:49','2019-02-25 03:20:48'),
	('9d24d03c1beb3f75c78453ff01b24ab27a5f1f691487d54a307fa67f211051dde35aededf263caf0',47,1,NULL,'[]',0,'2019-02-26 02:05:25','2019-02-26 02:05:25','2019-02-26 03:05:25'),
	('9d2bf9a0b4c2e16bd55aa39df937894677597ad491ba77bc9a3342511005e82708d8908c8ca5810b',47,1,NULL,'[]',0,'2019-02-21 20:28:45','2019-02-21 20:28:45','2019-02-21 21:28:45'),
	('9d80899f8542c86b516ffc6a8fa2cbf30d3374d6fef0de1199ac2f4ff9700006c2b860e2e65abfa2',61,1,NULL,'[]',1,'2019-02-24 22:55:51','2019-02-24 22:55:51','2019-02-24 23:55:50'),
	('9d92fc09c7b1ca3b75723a356a330ca160191afe8c25c14dff9a26d28a7ccd586c0e2640638e8536',45,1,NULL,'[]',0,'2019-02-26 04:53:23','2019-02-26 04:53:23','2019-02-26 05:53:23'),
	('9db9faab6f7e8826313ae70ea91f3794cc252047f805055de26bee3f8fe7863a65fec5782525dd5e',45,1,NULL,'[]',0,'2019-02-26 08:16:57','2019-02-26 08:16:57','2019-02-26 09:16:57'),
	('9e16e9f4dbd374716c786bac323ee24e219e8b4316b9f3010bfaa07370c6273a6f85fe464e2b1eb6',47,1,NULL,'[]',0,'2019-02-25 19:22:43','2019-02-25 19:22:43','2019-02-25 20:22:43'),
	('9ec6128b3e82d346d13ce53fdaab67eceda057f4eb367b948ea250bd9a49fb3af91571f2ff1218fe',47,1,NULL,'[]',0,'2019-02-24 20:13:32','2019-02-24 20:13:32','2019-02-24 21:13:32'),
	('9ff548ebcb7d1401b5404f04cdf4b93fdc191caa4e29bfc28d6152a3591c412e8aadedecae302105',53,1,NULL,'[]',0,'2019-02-24 21:48:16','2019-02-24 21:48:16','2019-02-24 22:48:15'),
	('a068ea8a88fe78692eb93cb94b08201f60451c001b28cba912303055cdc41bf9c1a8c498a216b5e2',48,1,NULL,'[]',0,'2019-02-28 10:28:56','2019-02-28 10:28:56','2019-02-28 11:28:56'),
	('a0efe539d0d56a7594e7e974149e79b98a68699aa5d2662eb3b41f62eafd8dc7849c0496aed0a4b5',45,1,NULL,'[]',0,'2019-02-28 06:54:18','2019-02-28 06:54:18','2019-02-28 07:54:18'),
	('a0f530c97570bff03eaa5e746d91e547349974056295cf24606bac2efad4021eee2bf452e07275e1',45,1,NULL,'[]',0,'2019-02-25 02:45:48','2019-02-25 02:45:48','2019-02-25 03:45:47'),
	('a26702d5002122c49161291ab2ad90deced0458f2e5abdb75a1d5f60c45f1ce9841e510402be2a9a',45,1,NULL,'[]',0,'2019-02-27 05:30:07','2019-02-27 05:30:07','2019-02-27 06:30:07'),
	('a26f23e7e3766bf8ecf6169758d4d2ca050e5441fd2f6b4e456b28b255515c3e91983bf2432c34c9',47,1,NULL,'[]',0,'2019-03-01 01:58:14','2019-03-01 01:58:14','2019-03-01 02:58:13'),
	('a2922a0d1909799226a011ecc6f0efb331b6e9ff2e2e64fd6576103866691fefb42ff5665f1f03f1',45,1,NULL,'[]',0,'2019-02-25 00:49:50','2019-02-25 00:49:50','2019-02-25 01:49:50'),
	('a39b0ce6417d4002aba4b2ec145afca3ec5f6063979ef121426834be1b66720e56c7442867f5d590',48,1,NULL,'[]',0,'2019-02-25 16:07:47','2019-02-25 16:07:47','2019-02-25 17:07:47'),
	('a3e233c251549879b3c70ef57552f825f60e9fb33ed64df917afaf3aeb480c2204e2d69596e1551a',45,1,NULL,'[]',0,'2019-02-26 04:49:55','2019-02-26 04:49:55','2019-02-26 05:49:55'),
	('a4a22e052c67b855def199d3320af7b2dc4228110d91c6b8ec8159216804a0ac5d58b852b938cc1a',48,1,NULL,'[]',0,'2019-02-22 22:48:12','2019-02-22 22:48:12','2019-02-22 23:48:12'),
	('a59d01a0004b6e13769d8787e44cf762c346d45e39fcc2f74fc0d9e31a5913503711231f5e62c8ad',47,1,NULL,'[]',0,'2019-02-21 20:02:45','2019-02-21 20:02:45','2019-02-21 21:02:45'),
	('a67bfdd4534b6841f34d3d23a512acc928d6975abb85604ad7adc171d630ba85f1d11075ab038e36',48,1,NULL,'[]',0,'2019-02-25 09:14:41','2019-02-25 09:14:41','2019-02-25 10:14:41'),
	('a67cb771a34ab2035b9901738b8c33a3b53d834940474c6f3e5ce0326cbee375ec0f3866a800fa3d',47,1,NULL,'[]',0,'2019-02-26 01:55:22','2019-02-26 01:55:22','2019-02-26 02:55:22'),
	('a697fe80ba052940eecf3e0529e95912a405e24aedb5e458758f1c6436ecec726eedf09e12e0397e',45,1,NULL,'[]',0,'2019-02-26 09:09:23','2019-02-26 09:09:23','2019-02-26 10:09:23'),
	('a795028e4dcbdb5354383325dde5db2b21114c4bb9511ceb84c64ce3722fb14124bedada5e509bc4',45,1,NULL,'[]',0,'2019-02-28 03:43:12','2019-02-28 03:43:12','2019-02-28 04:43:12'),
	('a873d2dd9a46462a60af7dd4fcd6a10a1b21c2b48b2ffc03757b9dd3157ad97feeba220cbdc984f1',45,1,NULL,'[]',0,'2019-02-26 07:48:18','2019-02-26 07:48:18','2019-02-26 08:48:18'),
	('a8ece6b33662061d3a2bcd5650c692c5bb9570da5a75b2edcb6bafa3e3a268bdd8a7533ab241438a',66,1,NULL,'[]',0,'2019-02-28 18:58:16','2019-02-28 18:58:16','2019-02-28 19:58:16'),
	('a911e37a7ca4eeb8fbaf165973115f14da6c26a8a3b48c71eedc43c18210288978e22bb579cc8619',45,1,NULL,'[]',0,'2019-02-26 08:50:03','2019-02-26 08:50:03','2019-02-26 09:50:03'),
	('a96bdeb5a2cf1d2acb5fc87c7559fea9ffd64677eda18198b2ab29583e8b5092e4902d1589da77aa',47,1,NULL,'[]',0,'2019-02-26 01:54:33','2019-02-26 01:54:33','2019-02-26 02:54:33'),
	('ab4c5ab604ba084470595d07719ce9df125a01330889a35060013f8303797264cf3b7173d1418aff',45,1,NULL,'[]',0,'2019-02-26 04:45:23','2019-02-26 04:45:23','2019-02-26 05:45:23'),
	('ac09e4d7a94663c89aa00f3d7dbde62c63642d51e17d497ab99ccdadb0285855255195e8703efffe',45,1,NULL,'[]',0,'2019-02-26 07:44:32','2019-02-26 07:44:32','2019-02-26 08:44:31'),
	('ac11adcb85ec4af55f92f0293cc08fa6b1680b8d72c64ce8a1d437ca120945556eebfa9efdab57ba',43,1,NULL,'[]',0,'2019-02-21 12:33:30','2019-02-21 12:33:30','2019-02-21 13:33:30'),
	('ac11d5ec4189011873a1c32e31edfb9bd99775b169a2138a5bfb63579a31aa4e4999caa65f8e16f2',47,1,NULL,'[]',0,'2019-02-24 19:22:02','2019-02-24 19:22:02','2019-02-24 20:22:02'),
	('acb675f0abebda49611d1704a6d4d4ce341f3e92f96961a22d580733e8b128f7758ab0b34b016f9d',47,1,NULL,'[]',0,'2019-02-26 01:53:50','2019-02-26 01:53:50','2019-02-26 02:53:50'),
	('ad052cc43f18d5255b303487518d0416d6c44b5c0de983199673f15a42d209f1c1c317c8990ccf39',45,1,NULL,'[]',0,'2019-02-26 08:38:49','2019-02-26 08:38:49','2019-02-26 09:38:49'),
	('ae3c0706b19d12a1449c20e1b206356bec6cf8df60b4776cec1f0ee7313170dc49b837d95c24fd37',47,1,NULL,'[]',0,'2019-02-24 01:30:38','2019-02-24 01:30:38','2019-02-24 02:30:38'),
	('af242063ad8fef41ddc9db11bb232e6a620dc87173870d990e7b367cf5daf9d2cde3d2aa9e092ab6',47,1,NULL,'[]',0,'2019-02-24 21:00:46','2019-02-24 21:00:46','2019-02-24 22:00:46'),
	('af2fc45225b2faa9b4681970f7141265d9753e89fd6234ff812ec5ad78c5d22842fdc571e2d04ac4',47,1,NULL,'[]',0,'2019-02-27 21:42:10','2019-02-27 21:42:10','2019-02-27 22:42:10'),
	('af75feecfb475c78c1b489edc69fb4a30eb737584ff4172324b3715291a6e2f16d39cc6158df74ea',45,1,NULL,'[]',0,'2019-02-28 07:50:51','2019-02-28 07:50:51','2019-02-28 08:50:51'),
	('afbbb04179c8143945d0eec3372d40f0fb9090855e7d62d2637f5d7b11238bea6393d7602d574161',45,1,NULL,'[]',0,'2019-02-26 07:49:37','2019-02-26 07:49:37','2019-02-26 08:49:37'),
	('afc84cf5000b1dc4d7c5477f06012fa27c6bcdfbe6ee27541b7697439c92ca14d0450000d3b8374e',64,1,NULL,'[]',0,'2019-02-25 17:43:27','2019-02-25 17:43:27','2019-02-25 18:43:27'),
	('affae27f8f2d56f9d4638b987c1a056713eba97efba71da908f9a193e1ee99d727fe24c0a31a5645',48,1,NULL,'[]',0,'2019-02-25 10:39:02','2019-02-25 10:39:02','2019-02-25 11:39:02'),
	('b009fd90bc3868e3b80203d8621535d03847ca7c716bcf9675d6dd64de579c060925fc9582bc7304',47,1,NULL,'[]',0,'2019-02-22 19:54:02','2019-02-22 19:54:02','2019-02-22 20:54:02'),
	('b015b6bfa8f9ae906bc179f97dc5890206afab57ff8e4c028f2ca84594475de65cc9a26d32aa9745',47,1,NULL,'[]',0,'2019-02-22 01:44:07','2019-02-22 01:44:07','2019-02-22 02:44:07'),
	('b0797d5ca47258ed5de0717125db175ce23efe6cc5c146140dbdbaf75b1b74483d0611643d924660',45,1,NULL,'[]',0,'2019-02-26 08:30:28','2019-02-26 08:30:28','2019-02-26 09:30:28'),
	('b08b3304c165e8fcada2582bd46fa3302706bb2a85114101cbe3007aa8efc206b52eba81198da027',45,1,NULL,'[]',0,'2019-02-26 04:16:07','2019-02-26 04:16:07','2019-02-26 05:16:07'),
	('b280277ddf0e025e11026c89fa5d32ad337a73230e04f6cf874afd2e73cb761b82ec676977680c7e',45,1,NULL,'[]',0,'2019-02-26 09:15:33','2019-02-26 09:15:33','2019-02-26 10:15:33'),
	('b2fc0ccf382085b4029ef15baefa75bb2e3eec757fc4317ef9d9a7ba3840536d51432160d17d1ce0',45,1,NULL,'[]',0,'2019-02-25 02:15:17','2019-02-25 02:15:17','2019-02-25 03:15:17'),
	('b37135ca6c258aaf33b36460335bc6b6aca49c83abc8e7c666fdbfa73b4910920a63a75ebcd64288',47,1,NULL,'[]',0,'2019-02-22 20:28:32','2019-02-22 20:28:32','2019-02-22 21:28:32'),
	('b7dcbc9095d36ac3f32a63673f33c00e56ed74bf5c856fc24e574cd8db5cb0920f9a2f9fdea6d2e3',47,1,NULL,'[]',0,'2019-02-22 20:20:41','2019-02-22 20:20:41','2019-02-22 21:20:41'),
	('b8fc9edc6f3ed1aa8c0861e305901213d6e8f23d9bee54d5296cf8cdef3021190915459f4be1d805',47,1,NULL,'[]',1,'2019-02-24 21:38:21','2019-02-24 21:38:21','2019-02-24 22:38:21'),
	('bbbccad6c116c6c9d09e752cb4fb917fa3e7605a8023d535a05bf795ac15c8ba333134e03a906d97',45,1,NULL,'[]',0,'2019-02-26 06:18:09','2019-02-26 06:18:09','2019-02-26 07:18:09'),
	('bc65f296ab55f6d95e516f888239f14f40e603341f2a7bc26cf7955ae074ee01df5ebb45aca2e070',47,1,NULL,'[]',0,'2019-02-24 00:42:22','2019-02-24 00:42:22','2019-02-24 01:42:22'),
	('bd1429fb88877dda61630558b7c05ee2757a0265a21a2eee8d82190808a1ac10de607db7a8618b1f',47,1,NULL,'[]',0,'2019-02-22 19:14:45','2019-02-22 19:14:45','2019-02-22 20:14:45'),
	('bd2e2cc7ceac211b0d001c46536ac71dc69ebf7df5532226c9f3f1fcc46fa089a10ccaf2a1318f82',47,1,NULL,'[]',0,'2019-02-24 00:54:41','2019-02-24 00:54:41','2019-02-24 01:54:41'),
	('bd880c74121b90e29f9f599cb3f6b8a1351de5ddb4f7d4b6794db9d47ea6e6e3961808c62936563c',45,1,NULL,'[]',0,'2019-02-26 04:52:54','2019-02-26 04:52:54','2019-02-26 05:52:54'),
	('bdda108a04b82da763e4cf00740fb5f87eba6c07d982ae93c10a0a9e46a9473fce771dc607012135',47,1,NULL,'[]',0,'2019-02-22 20:26:53','2019-02-22 20:26:53','2019-02-22 21:26:53'),
	('be45d41d1e1d581453fab7f1686311ac2eaf8fb19abdad516972457f0ad1d69c4f0e7b7d25586739',47,1,NULL,'[]',1,'2019-03-01 03:18:35','2019-03-01 03:18:35','2019-03-01 04:18:35'),
	('be6893048bdb8ed198e97a8ee129907be778c599717a7814f33c34e83092208ac0cdecf689966b2d',45,1,NULL,'[]',0,'2019-02-25 02:55:26','2019-02-25 02:55:26','2019-02-25 03:55:26'),
	('be7c651459d45c2d048ec1e28fecc6cfa012ef41895c1a8ba46e5d5257c17ad9615c6761c1e70f34',47,1,NULL,'[]',0,'2019-02-21 20:14:28','2019-02-21 20:14:28','2019-02-21 21:14:28'),
	('be99ef08a0a07037a73fd6b1280e3528903a8a0c6d9999f10206d55fc105a519b8be651fc9f5c49a',45,1,NULL,'[]',0,'2019-02-26 04:21:22','2019-02-26 04:21:22','2019-02-26 05:21:22'),
	('beadae26c6d649f5d65e4d924e7f4e6a18bb611c80eb6e73bb098adbfe9fa5242a1803d1310c14cc',45,1,NULL,'[]',0,'2019-02-26 09:04:46','2019-02-26 09:04:46','2019-02-26 10:04:46'),
	('c0dda90ae133e3362f152be7fd1b846e82a9db158af184ba7c639f233aac9581a5019ccd41ea2556',45,1,NULL,'[]',0,'2019-02-26 09:00:26','2019-02-26 09:00:26','2019-02-26 10:00:26'),
	('c2a78920304a540bb12924c1dbd4b7f73fea71dfbe33627ddf58d666e1a448d6dd8fc4ff49600160',47,1,NULL,'[]',0,'2019-02-26 09:29:03','2019-02-26 09:29:03','2019-02-26 10:29:03'),
	('c3d249527447a2b84d478e4e7e0ddcd2da5b7fde22e546e6a938a2a0e0de72c81235d1fc31cbb8b9',47,1,NULL,'[]',0,'2019-02-26 09:44:56','2019-02-26 09:44:56','2019-02-26 10:44:56'),
	('c4ca924b177171f7ae0f5f268d3c2e7cde51cd3478e03e7c42ccdc292fd9b1d7f85b7381e4c8f414',47,1,NULL,'[]',0,'2019-02-24 00:38:38','2019-02-24 00:38:38','2019-02-24 01:38:38'),
	('c5f87e6db9e191dc0acaf22253644e77c6095178b8d7de3bc116ed8e68a63e1423a1b7e0e3e18116',45,1,NULL,'[]',0,'2019-02-27 05:33:21','2019-02-27 05:33:21','2019-02-27 06:33:21'),
	('c6fcb43f7ad086eb192f13b609efeb7c2a937fa0358b832a07198cec3c60283066f4b1aeed6e45e5',45,1,NULL,'[]',0,'2019-02-25 03:36:22','2019-02-25 03:36:22','2019-02-25 04:36:22'),
	('c77c3037d0ee44078fa5a70e4308c765e56c77d14b8dadd84c96c88a5181f877152487c49ebe1848',47,1,NULL,'[]',0,'2019-02-21 19:31:54','2019-02-21 19:31:54','2019-02-21 20:31:53'),
	('c7f80cd4f115fe239732c0896a637f668277cc3838355a41e5c59088667dfde6ce009ea4e42f679e',47,1,NULL,'[]',0,'2019-02-26 09:45:50','2019-02-26 09:45:50','2019-02-26 10:45:50'),
	('c984661b945e13a1bb3d1f3bff6ddde4be8749daa2601b836fc9156633cc2a080ab5568d70381fcf',47,1,NULL,'[]',0,'2019-02-21 20:52:45','2019-02-21 20:52:45','2019-02-21 21:52:45'),
	('ca1265d210c53ade912256107b570e9f82a89a7a70f7679cd2c9cabd468d5024aeb81be77981c335',47,1,NULL,'[]',0,'2019-02-23 21:33:45','2019-02-23 21:33:45','2019-02-23 22:33:45'),
	('cb1fc65b8b5a9a46e6299070ebe007cb27928f1869c8677dd7b3e262e8cb928760cb41101754f2ba',45,1,NULL,'[]',0,'2019-02-27 02:56:27','2019-02-27 02:56:27','2019-02-27 03:56:27'),
	('cb6480031f84d02b24e21cbf194a4bd14453aa3870a436653558ceeb4792c8162100b388ba8f7d6b',51,1,NULL,'[]',0,'2019-02-23 00:08:39','2019-02-23 00:08:39','2019-02-23 01:08:38'),
	('cbe997ee0f9c77adf442af30af6c35352bfe676d6f026afd8afae7c4200db4bf55c39ad16906cac7',45,1,NULL,'[]',0,'2019-02-26 04:42:47','2019-02-26 04:42:47','2019-02-26 05:42:47'),
	('cbf71f00686a4327ada0746555fca4a293f5651c0686d450395c9c407a67c422cf96ce093b951e7e',45,1,NULL,'[]',0,'2019-02-26 08:58:13','2019-02-26 08:58:13','2019-02-26 09:58:13'),
	('cc40fb865f971301c56a87b47ccc505f7ffb4a844eab453cdb5ddb7ebb9a06bd0c21152912ec1ee9',45,1,NULL,'[]',0,'2019-02-25 01:33:04','2019-02-25 01:33:04','2019-02-25 02:33:04'),
	('cda0198a3e2007930ece130c580af608bce74c08a0d629f77d64dd7d4ca93876d4c8e1cbd814297c',45,1,NULL,'[]',0,'2019-02-27 07:19:39','2019-02-27 07:19:39','2019-02-27 08:19:39'),
	('ce0add10773d49341c1e39a5f01f04c560d58461a8e6bb923ad16e055ced7386b60c5070cac117e0',60,1,NULL,'[]',0,'2019-02-24 22:53:27','2019-02-24 22:53:27','2019-02-24 23:53:26'),
	('ce9ef6db4bc7564c34bd96d2725f6812faa63c8fc97bf8042aa256ea819d25a26d465c126cc18bb6',47,1,NULL,'[]',1,'2019-02-26 10:11:39','2019-02-26 10:11:39','2019-02-26 11:11:39'),
	('d1a652022cc9a92bc97e64b69535c2475388ee550dbf0a4451519a7af255ff611e3eb548aca55251',45,1,NULL,'[]',0,'2019-02-27 06:36:06','2019-02-27 06:36:06','2019-02-27 07:36:06'),
	('d3535a8879e24f6a74958b24a584ff52ae9e5013ea3004b79cd8dec0e25b60e424919ac4c38c4461',47,1,NULL,'[]',0,'2019-02-26 02:20:46','2019-02-26 02:20:46','2019-02-26 03:20:46'),
	('d43e914afbcf7305c8c1eed318f3a08f7b9de746037838a9cec5803a9b7102d9ba9e75eb640cfb9d',47,1,NULL,'[]',0,'2019-02-24 20:54:09','2019-02-24 20:54:09','2019-02-24 21:54:09'),
	('d47d911c293235a737ffa06674a7c0fcd4444a8c987196f7a8ee6afaa61dc4c81a8d3c46c0ff8db0',47,1,NULL,'[]',0,'2019-02-21 21:10:59','2019-02-21 21:10:59','2019-02-21 22:10:59'),
	('d4e5bfb5f5eb1e1e6c3e9575be2c42c54f0310ef9eec74cf715666b64638b00657884287ae53cf00',47,1,NULL,'[]',0,'2019-02-22 20:16:29','2019-02-22 20:16:29','2019-02-22 21:16:29'),
	('d55a901f1b4725b0cdf9300aa29dbd84fb0009dd5c0c7a393def70bf09453b23b82f33332193ed92',45,1,NULL,'[]',0,'2019-02-26 04:41:18','2019-02-26 04:41:18','2019-02-26 05:41:18'),
	('d59437bd0297d55c19a846c8cf531387c79ff6e37d01feed1931dd44c00a113eba1180adb1cc87cc',45,1,NULL,'[]',0,'2019-02-25 02:19:39','2019-02-25 02:19:39','2019-02-25 03:19:39'),
	('d5cfcafc09dee6007207891849c8469224c21b199bd6432193a0ca9464c782bdaf1f06ab3902efdb',47,1,NULL,'[]',1,'2019-02-26 09:51:43','2019-02-26 09:51:43','2019-02-26 10:51:43'),
	('d64a7bbcb20df0fd54c2a5a06fd90f2123a10d2aa6bd8fec285d37b5e23082b09b7858f467e45009',56,1,NULL,'[]',0,'2019-02-24 22:02:32','2019-02-24 22:02:32','2019-02-24 23:02:32'),
	('d803bedabf39100c60af26dab023a92d0a0f594d6104ad87f427b15fb283d7151eb31173b2be30a7',47,1,NULL,'[]',0,'2019-02-22 20:07:55','2019-02-22 20:07:55','2019-02-22 21:07:55'),
	('d8214b75ec8d680ad32b71335a02b278de237c15d1db78e3022e0f254d5ded762ab4e77387676df8',45,1,NULL,'[]',0,'2019-02-27 05:11:50','2019-02-27 05:11:50','2019-02-27 06:11:50'),
	('d8aeb56560a3427f8c00cee1c6b59361b45b085995b7a485975a6cffa5b87ed3e07feccfb8c23403',47,1,NULL,'[]',0,'2019-02-21 20:17:17','2019-02-21 20:17:17','2019-02-21 21:17:17'),
	('d9e14584b3d6c420aadf79ad88001f82a4ba1bab819c387cb3c60907af09b62d11fcd6e713e7c83f',47,1,NULL,'[]',0,'2019-02-23 22:07:21','2019-02-23 22:07:21','2019-02-23 23:07:21'),
	('daceb44fb1d6455925010345685a5938986432ff19f7249e96f36e3cb23261db1becfae2ab55a80d',45,1,NULL,'[]',0,'2019-02-25 10:52:05','2019-02-25 10:52:05','2019-02-25 11:52:05'),
	('dafa6f0083555c0780fb31bfe992458675b02ad11feb8a90255d75315dcddca6401171ad346f1a1a',47,1,NULL,'[]',0,'2019-02-21 21:09:04','2019-02-21 21:09:04','2019-02-21 22:09:04'),
	('db05e6e67719e578638252483ba05092983a65464ae1c85a3e06f5a2d8518cfa20d86f95d7102f9a',47,1,NULL,'[]',1,'2019-03-01 01:43:23','2019-03-01 01:43:23','2019-03-01 02:43:23'),
	('db1abb82999f9c7a5d75c28d33226ea78232c4000120d34b37698bd37555e6f740a55a61c6f4fe33',47,1,NULL,'[]',0,'2019-02-22 01:51:07','2019-02-22 01:51:07','2019-02-22 02:51:07'),
	('db793e88d9febfb3169258a8dea0f589489473e1bfa49053b4e3fdcbb2f432bda9c4fb8d488df2c0',47,1,NULL,'[]',0,'2019-02-26 09:19:44','2019-02-26 09:19:44','2019-02-26 10:19:44'),
	('dbc821cbc24f2fd2144145c482028791f2a011f1666f47966da82daa0d340854b300b39728d9e44a',45,1,NULL,'[]',0,'2019-02-26 09:05:33','2019-02-26 09:05:33','2019-02-26 10:05:32'),
	('dc8dd726a45d72ba9d54ebbec7378f3af8ca3596b97e36fd00a916cbfc4ed26c02e14c3db9595977',48,1,NULL,'[]',0,'2019-02-22 22:54:42','2019-02-22 22:54:42','2019-02-22 23:54:42'),
	('dcfe4df80600b81e9e04c17dc3bb73e73e0160779ebd58ff8f4f4ddcdd9e8c1862e0cf891eb6d0ca',56,1,NULL,'[]',0,'2019-02-24 22:02:18','2019-02-24 22:02:18','2019-02-24 23:02:17'),
	('dd077a38e600a2597c29dabd1a7c86c741b3aa46c662539bd2083015f4f8cd4d851a67362db06071',48,1,NULL,'[]',0,'2019-02-25 11:03:04','2019-02-25 11:03:04','2019-02-25 12:03:04'),
	('de4eb1855134d8ad289de5fd62d103a55d0a745430fc188571aa11f11bbe5ca642a27cd713989db6',47,1,NULL,'[]',0,'2019-02-22 20:13:33','2019-02-22 20:13:33','2019-02-22 21:13:33'),
	('de5a171b70efc78ea2ab1bcbcceb4cddf1a0805c8d615f65c35bb096d7144a799aabd8ab371d136a',47,1,NULL,'[]',0,'2019-02-21 21:17:55','2019-02-21 21:17:55','2019-02-21 22:17:55'),
	('df3520879a5dc79d0c9b8767900e9e2890189e8b4c277896e724d7f813befe5377761a513199725e',45,1,NULL,'[]',0,'2019-02-25 02:19:35','2019-02-25 02:19:35','2019-02-25 03:19:35'),
	('df9c31fba24c89e7b8be162501d7ae3f91d7aa33fe499af0085906c380fce85ac7a83d7af3923869',45,1,NULL,'[]',0,'2019-02-26 04:54:28','2019-02-26 04:54:28','2019-02-26 05:54:28'),
	('e11f6ce8ae922f10d31aaff0dc026d18b14c689e819509d375d131febdb1b05e7920d1afe0917cea',45,1,NULL,'[]',0,'2019-02-26 05:51:31','2019-02-26 05:51:31','2019-02-26 06:51:31'),
	('e179e6b0121dab598429b98154df249315fce8661696483e4807b77390ab77022513e77091ea53cf',45,1,NULL,'[]',0,'2019-02-26 08:36:07','2019-02-26 08:36:07','2019-02-26 09:36:07'),
	('e17d4c210217aa4e5005731c1f8d54f2097ef32ce3c59ed477745470f38c9bc196e6157ef7c7beb7',45,1,NULL,'[]',0,'2019-02-26 07:51:24','2019-02-26 07:51:24','2019-02-26 08:51:24'),
	('e197e7332838e0e57ceb48cfd60d606c200b12ba58f2c05b595aa63a686b9ae634a5cf3ad98c2e6d',47,1,NULL,'[]',0,'2019-02-23 21:40:40','2019-02-23 21:40:40','2019-02-23 22:40:40'),
	('e1c560b90440293ada9c58734c5811b302b064ffdb191cf7c642b35cf84e7bdfc606e6780937bfac',43,1,NULL,'[]',0,'2019-02-11 11:12:15','2019-02-11 11:12:15','2019-02-11 12:12:15'),
	('e20158d92f9099772502d933600f2b336f4881af4acf83f3fecef20a6f38b071b3e8289095744331',48,1,NULL,'[]',0,'2019-02-25 09:18:55','2019-02-25 09:18:55','2019-02-25 10:18:55'),
	('e36741c5bd721da38e9c137263435c7ff8894a6f12c6a60d903064d1f5a2803d03ccaaeb334553a7',48,1,NULL,'[]',0,'2019-02-23 21:53:48','2019-02-23 21:53:48','2019-02-23 22:53:48'),
	('e3a738345cadc4fe65e3ecfbabaed6d7d9701e685590471017a767e42ff0a4cf78a7988802e995fa',48,1,NULL,'[]',0,'2019-02-22 23:51:36','2019-02-22 23:51:36','2019-02-23 00:51:36'),
	('e436607ac010fa968c4436cdea10e8a79e7c94313baba4649012a6ff6247cc12597c7025e3a322f2',47,1,NULL,'[]',0,'2019-02-21 21:56:17','2019-02-21 21:56:17','2019-02-21 22:56:17'),
	('e457a7e4f1b64a1d1b9b0b645c91456926fc0dbabe9e693ca45a07520999de289b5d54893e9a33fc',45,1,NULL,'[]',0,'2019-02-27 08:30:07','2019-02-27 08:30:07','2019-02-27 09:30:07'),
	('e4741b5eeb9db3ce0047dee014e2e66fa43eade46cfea9f2dd256612a3058f773bd0d9497fb24a2e',45,1,NULL,'[]',0,'2019-02-26 04:10:03','2019-02-26 04:10:03','2019-02-26 05:10:03'),
	('e48544baae00d684a6f4a144946416117249ddc7a34efc14a03891b9f5e0f40b861af8a56422e1d1',45,1,NULL,'[]',0,'2019-03-01 04:10:45','2019-03-01 04:10:45','2019-03-01 05:10:45'),
	('e4fd78e26851b7be0543bdd5f1fab93cbf94e52d7c2de0bc2b0f1b701cf73aa113f985cf5ad7f76e',47,1,NULL,'[]',0,'2019-02-22 19:23:22','2019-02-22 19:23:22','2019-02-22 20:23:22'),
	('e5b22f42a7747521a110e067c886d9a01cdbeada0f37128ec90c5565edb3cf750fcb770f50307dfc',45,1,NULL,'[]',0,'2019-02-26 08:48:46','2019-02-26 08:48:46','2019-02-26 09:48:46'),
	('e5b25689b5e6d77cf31fea1928f1f36b70f046d8b776c371d1f63a5d583be20acb109bf7e7e3dffe',45,1,NULL,'[]',0,'2019-02-26 08:35:06','2019-02-26 08:35:06','2019-02-26 09:35:05'),
	('e6dbc06e33d1c022e5d804986ab78815656bdf9d201e830cd278f14f11b9278e1b34ebc4dc039ac5',47,1,NULL,'[]',0,'2019-02-22 19:44:15','2019-02-22 19:44:15','2019-02-22 20:44:15'),
	('e7215867bf97d704cb395b6ad8fa7f8f1d2d07fc4af05d36ca58ec09e19e9ddef90ce9700a8699e6',45,1,NULL,'[]',0,'2019-02-26 08:25:05','2019-02-26 08:25:05','2019-02-26 09:25:05'),
	('e7ccbd29bc385ed366e0baeb6921ea1f8186677cb60b233e0ede80f0bd097fa7757cc3b4ef38a4b9',45,1,NULL,'[]',0,'2019-02-26 08:54:09','2019-02-26 08:54:09','2019-02-26 09:54:09'),
	('e84050672299116c327aff3c4e6d939782645e7e5b1727f1b0c7aa341deffdb667f9199c2de10e55',45,1,NULL,'[]',0,'2019-02-28 07:02:17','2019-02-28 07:02:17','2019-02-28 08:02:17'),
	('e8bad977076fd094959282805420ad257eb0be43d84c360cc6874bd834ded422f6af5555c5090546',47,1,NULL,'[]',0,'2019-02-23 21:38:00','2019-02-23 21:38:00','2019-02-23 22:38:00'),
	('ea00fcad2eee99f2600520ee04c258e6c226bf5175272a6477a156f17824ae2e73905edaa1a4e85f',47,1,NULL,'[]',0,'2019-02-28 21:02:43','2019-02-28 21:02:43','2019-02-28 22:02:43'),
	('eaadc165799dc2420b0b6ff7e610ae0b0efb3f23ac7bf4028a9b7f7ffd5d007dd50fad693c95380a',47,1,NULL,'[]',0,'2019-02-27 21:38:53','2019-02-27 21:38:53','2019-02-27 22:38:53'),
	('eacd9c068bbeedeb2d24deb6747dbd488d601012f23ab7b3846779d2dd9f9327c8e9ea95f0336c94',45,1,NULL,'[]',0,'2019-02-26 09:03:18','2019-02-26 09:03:18','2019-02-26 10:03:18'),
	('eb8b02f703608b8c9cdd3ac184cdefd0bb0bde0c25723fa81f3c9f0034ec41079475306828c21f97',45,1,NULL,'[]',0,'2019-02-25 02:11:56','2019-02-25 02:11:56','2019-02-25 03:11:56'),
	('eb97d3ab7bd5ac8222117147e0f9b2c315230c086e2b719887cce949df747083f7bbbfc7229ae19e',50,1,NULL,'[]',0,'2019-02-22 22:51:00','2019-02-22 22:51:00','2019-02-22 23:51:00'),
	('ec417e8219c9f4517d60721f51a1c9501f4f1533577d29b5a405547fd88323169e04b4769d253c94',45,1,NULL,'[]',0,'2019-02-26 08:41:15','2019-02-26 08:41:15','2019-02-26 09:41:15'),
	('ec837e2f0b45b5d9e5611ace5e42052c70ddd1aa005ce5c5f76c44735a8fefce9bdb1a30d4dbde4b',47,1,NULL,'[]',1,'2019-02-26 02:13:08','2019-02-26 02:13:08','2019-02-26 03:13:08'),
	('ecd6dba6763dd5303c4f068b0d39421a4d3e26a32691f664f4040667f21148a23eedf873bf3c8077',45,1,NULL,'[]',0,'2019-02-28 05:26:21','2019-02-28 05:26:21','2019-02-28 06:26:21'),
	('ecdd9b08d4f47e6bbd45805158e7da459d9415c5c99888ee9659939ade1c37abc7c2cbdf7851861c',45,1,NULL,'[]',0,'2019-02-26 07:12:13','2019-02-26 07:12:13','2019-02-26 08:12:13'),
	('ed007010985cb62f4e4dfe87e54a2159dc9491cfc70d5ca4113eab04cc51ddfe64583af50875a200',47,1,NULL,'[]',0,'2019-02-23 21:54:46','2019-02-23 21:54:46','2019-02-23 22:54:46'),
	('ed51da59471a421059b9d2a257d608b3aba21e437e077a5b317070bcaacdd87facb3ddb66f82e9b7',47,1,NULL,'[]',0,'2019-02-21 20:19:47','2019-02-21 20:19:47','2019-02-21 21:19:47'),
	('effddf53c741866bbdfe1a6903e8440952a86be3484329b85209925b101a62621a3d1caed7fd13eb',47,1,NULL,'[]',0,'2019-02-21 20:16:28','2019-02-21 20:16:28','2019-02-21 21:16:28'),
	('f01666ee53f3ce820abca81711dfc82aadd3de499297fddc49d245d660df33244bee69a938801244',45,1,NULL,'[]',0,'2019-02-28 04:06:38','2019-02-28 04:06:38','2019-02-28 05:06:38'),
	('f040a3d4ea687bf268db3b4d6c223bad286435bc2b09aff5eacaa172c902a9b7e8801f4ef37a626d',45,1,NULL,'[]',0,'2019-02-26 09:06:17','2019-02-26 09:06:17','2019-02-26 10:06:17'),
	('f0b35bb90ec265294f439db18b5d455afda2656e0826a6f4b9fe9baf6bd346068a5808b5633fbac0',47,1,NULL,'[]',0,'2019-02-22 20:22:08','2019-02-22 20:22:08','2019-02-22 21:22:08'),
	('f15b96c2c735e75b4e811aa1e587e3ed1c09423d03de535ff76479e5f203c1106325dde187048b9e',45,1,NULL,'[]',0,'2019-02-28 10:17:53','2019-02-28 10:17:53','2019-02-28 11:17:53'),
	('f1a930857063abab156b0a6f67d0c0d1bef9b43867ae7e7af2e13e0164a829d6891b9498cca4f37a',47,1,NULL,'[]',0,'2019-02-22 19:53:49','2019-02-22 19:53:49','2019-02-22 20:53:49'),
	('f1ac6347b33e1894a347bdddb5b2c7c964bff1ef568891d0485f169a011996891d3da5f66dc4de9a',47,1,NULL,'[]',1,'2019-02-24 21:32:54','2019-02-24 21:32:54','2019-02-24 22:32:54'),
	('f2a4afc472d4de02450de92106aba55eac37076aa383e6900dcaca08ff08b8e874f063fe182a8d51',63,1,NULL,'[]',0,'2019-02-25 12:10:41','2019-02-25 12:10:41','2019-02-25 13:10:41'),
	('f682269e3e929989de5be230efcbef34fb97017ad7426e21be8c69e82d4de69dd1d03663b9cce883',47,1,NULL,'[]',0,'2019-02-24 21:10:02','2019-02-24 21:10:02','2019-02-24 22:10:02'),
	('f6e51d6a03b7a466f937b1c90c8bbe5148f3b7a2360a282fa00c787284ad5dab182027e309e84f75',47,1,NULL,'[]',0,'2019-02-21 22:02:47','2019-02-21 22:02:47','2019-02-21 23:02:47'),
	('f71fb3dfad9ccb89b09af3155b210ac11f7a386a9e1dc07b5b87ddac76b6b9eade1ed20f95d413d1',47,1,NULL,'[]',0,'2019-03-01 03:47:26','2019-03-01 03:47:26','2019-03-01 04:47:26'),
	('f7d3c94b7ca5e50f982ed71eeb77995cd7e8f164df5fa40fac7891b515727d19bed73a6a9d4bb975',55,1,NULL,'[]',0,'2019-02-24 21:59:35','2019-02-24 21:59:35','2019-02-24 22:59:34'),
	('f845708dfafb92c68fb191f588d6fe9d288f5f1c7bd01f716141f7e9f2e0ed69e996188244ff6679',47,1,NULL,'[]',0,'2019-02-24 00:45:42','2019-02-24 00:45:42','2019-02-24 01:45:42'),
	('f87df28b87a7cb06873e5a90ee782a6ff58f6ac637e881abf22c3c606582154eeadbeb753b4889b2',47,1,NULL,'[]',0,'2019-02-24 20:52:19','2019-02-24 20:52:19','2019-02-24 21:52:19'),
	('f8847a575e833d0222989499baf55ea126657681cc83e18f9d229577b890170f589e59573e775c67',45,1,NULL,'[]',0,'2019-02-26 04:55:18','2019-02-26 04:55:18','2019-02-26 05:55:18'),
	('fb41ac76eff2c63f7cf03afe38b870494f8ef2bd1c43a2963ee2d94bcbbc6e0051f04cf7a875905a',45,1,NULL,'[]',0,'2019-02-25 00:49:47','2019-02-25 00:49:47','2019-02-25 01:49:47'),
	('fc66d7dd0e041f3d574647cbd888d1d4b9ae880897df0d5fe29fef23e6c58d1ca2302a34e46e2925',45,1,NULL,'[]',0,'2019-02-25 02:38:35','2019-02-25 02:38:35','2019-02-25 03:38:35'),
	('fcb667f30bfaab54ce20098c2eb714d18a2af03cee1e735b49a04fa9102a9ebf1a7329ca277950a8',48,1,NULL,'[]',0,'2019-02-25 16:58:23','2019-02-25 16:58:23','2019-02-25 17:58:23'),
	('fd8643a27780357f095338cbea37f957a814a9d9b88ce653428da53c4fc18747c07efabfb7fe4395',45,1,NULL,'[]',0,'2019-02-26 06:32:52','2019-02-26 06:32:52','2019-02-26 07:32:52'),
	('feae513c2cfe0e7c188faf6f14eb4984dd13e003c820c9cbdfb5577bc77060516346cb1d1f969b19',47,1,NULL,'[]',0,'2019-02-24 20:04:56','2019-02-24 20:04:56','2019-02-24 21:04:56'),
	('ff154071f459c6a19717407980f2de1d2ffec950db1a07a1771dbc04b8888006dc3ff06c7c624d8c',45,1,NULL,'[]',0,'2019-02-25 00:57:04','2019-02-25 00:57:04','2019-02-25 01:57:04'),
	('ffd1bfc63e93827ccbcff66a574d24fde5f58ceb839426a7d812f6ba34df9124fcabe4e0c581f1bf',47,1,NULL,'[]',0,'2019-02-26 09:49:34','2019-02-26 09:49:34','2019-02-26 10:49:34'),
	('fff48ea94a6ac708db4461496ef6c05c54f8f20839478a293f61c935fbcc76d9802088b2d02bb0bc',47,1,NULL,'[]',0,'2019-02-22 20:11:18','2019-02-22 20:11:18','2019-02-22 21:11:17'),
	('fff4c2e2f95790f3f46254e2a5eeab8d03763e137c4257bd0c77880875bc1dffa2ca2a9065c06916',45,1,NULL,'[]',0,'2019-02-28 03:48:24','2019-02-28 03:48:24','2019-02-28 04:48:24');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Password Grant','KIXS0Uxi5FYn0HWk5riFPkYXQtjio7K9iYUvU67K','http://localhost',0,1,0,'2019-02-07 13:01:16','2019-02-07 13:01:16');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`)
VALUES
	('004b914a700b9771b7aba01f814ade510e4e5bb4c133aa9061e186883da135ce9be3d754a354f71e','90b79ad4bcd29bdcb03b403aa019592d8d68f25ef9fbc0b2f1975f08ece6731943a945cfb7aca178',0,'2019-03-08 09:40:09'),
	('00dc7bbbf9c1b1d59c76fa613867e33bdf43c08c685cbab6ef5185b513009a83d7f12296809cb43c','a96bdeb5a2cf1d2acb5fc87c7559fea9ffd64677eda18198b2ab29583e8b5092e4902d1589da77aa',0,'2019-03-08 01:54:33'),
	('01615a74c7059d9231984b9b8e59d7836d9b5645cdcc6b5a7b1db58841dc21d0a9b7d550eb9c8b13','0008d8e127da47dacf3fc76285bb0bf14cd908c2686e86283a3683ab915aaaafa6f3f4a35d27402b',0,'2019-03-07 10:53:13'),
	('0191687eb530832ce5a5aaafb959bcbe0480f06446e2821a36a8b8b6ef212c623ae4d1e1d6853afc','e5b22f42a7747521a110e067c886d9a01cdbeada0f37128ec90c5565edb3cf750fcb770f50307dfc',0,'2019-03-08 08:48:46'),
	('01ede4ffa7cc5a995a8479be932856502f2543be3910056739f83e7a9d699fa4f6039db692c49836','de4eb1855134d8ad289de5fd62d103a55d0a745430fc188571aa11f11bbe5ca642a27cd713989db6',0,'2019-03-04 20:13:33'),
	('02e5b0dd637716057712230b0aaec7a2fd58ddb5aa601c28e83b852d4ed01b4d8647d738a657bde6','01165fe4a2d9d44ee41bbcb5fdeb158f68495ea90ed043f8c79d5b8a25f6323e3e4f13edbaeea4a0',0,'2019-03-06 21:59:52'),
	('0313d28cbdc24141203d28d10e1b5e2482bd7eeb38fca296dbb666361987b96fae070cad4f3c48ee','946238b6267e4a75ba7a233b099c8d513c51dd00b9e452436d926ffbc383a3f53de065f61f5e8d5c',0,'2019-03-08 09:48:01'),
	('0381a7743245a585f60a1cc399c3b55a304ba2debde59853297854cd77ec103763315a5f81ca9582','d1a652022cc9a92bc97e64b69535c2475388ee550dbf0a4451519a7af255ff611e3eb548aca55251',0,'2019-03-09 06:36:06'),
	('046d0d37f4c0dc7c6bd5726a72a68c809985e0a8a4cdae734fcead34aef17a9c10e0f101cd21629b','b37135ca6c258aaf33b36460335bc6b6aca49c83abc8e7c666fdbfa73b4910920a63a75ebcd64288',0,'2019-03-04 20:28:32'),
	('050b76afae27b5f5c4fa1b8226c031191bcfb7d21835de6be9a205b9182dea3782fc9b0e4586ace6','1a8f53f4018571eb0cafe9c36c18e753ec663d1eb08105f7c149c009a85630cb1b2f792e57531e3f',0,'2019-03-10 03:59:36'),
	('05481d0288a14d251f42b904830b162af83060174b31e20dea75a161389d2a6764f0d39461edb05a','525e7fe1cb4f5830e8549f05b3159dae49ae75c5214a6ca8dfb5198bc3a94745d21068c2d96edddb',1,'2019-03-08 10:12:32'),
	('05d2090ec87bfae234754cd607a607cb742c97facd547f735ac515b6a8f556c67dbdae3e11d64dd2','6e5730f73f1b02af3cb3692dd8f269b9a272c32f4d37b9d26abe5da0dd90109e7d5a82979bca0a73',0,'2019-03-03 13:54:18'),
	('06b1535a2588614115eaa7342b2ec551770ef364b49c7d6de262ffa5709c70bcc01cdbcbad3b5f24','a2922a0d1909799226a011ecc6f0efb331b6e9ff2e2e64fd6576103866691fefb42ff5665f1f03f1',0,'2019-03-07 00:49:50'),
	('07016ddc0e3c6056d123180e31137d8c623c547dff2a541be370641551f6297bef53cd5b8d1ddc3c','d803bedabf39100c60af26dab023a92d0a0f594d6104ad87f427b15fb283d7151eb31173b2be30a7',0,'2019-03-04 20:07:55'),
	('0703d9cb06993eb11dc783278e4d7fd938b2b84674f1e51f1d8aa1262fbb64a1c56ac6d20d0e3ec4','05ede7d5f8a6916d400bafcd565775954a32d820fa072fd1680b4efaffdbf61637f764e6ff909d21',0,'2019-03-06 20:12:28'),
	('074d2a45cfbb015ad94fa4a727c43d78112aa985f371274109fe3a950b079ae920624433b95ec881','1ad71b896a0a29f5cc3b4feed78b9846b270565f9ec4a7a6cdd4244be3029a34c22808cc8daf496e',0,'2019-03-08 02:03:41'),
	('087408e5438e956f3fddf569c724a03b79fcb49b78a49b970d10e8783ae03671f1f0a659733676ce','463b8c783d4fe5681b72beabf6d3c22df4f4c0b7b89418a35042adf03968322cfcd7b39749de9662',0,'2019-03-03 20:52:43'),
	('08997fdada4fd6813efbba1f5938863c434fa05ed304d1a353ac10c120a7fb2981ecf53e6b4b7f08','22e87235eb3226c918dd431a649d5c27489be1a883fddbfe26e0cb56dc6f1769867d7267e8ae5a2d',0,'2019-02-17 16:03:06'),
	('0a0cb7eb5abb3c6d518ccb190f06cfe06adf9f088d00d48879b3b65089e73b91620c8e8cba243628','6caa88945d6e3f53c42a3f3abaf76c96442a6a6de0ec81e6f878b33160992b8e48a4fa5c29778b1b',0,'2019-03-06 21:59:14'),
	('0a96a7fef4535827b919dc47c78e45b855e065ab5cee4d272c0c010f3903450decf18f274369119d','8f96ecdac3a161a3f00a13db1ec730416d81f9d264ce3b57cb88f73940a540983ba15e4875655d51',0,'2019-03-03 20:56:24'),
	('0c153194416937ede99a3e2f13c03ba883445fd7ffa4b36be352b0115bb5155c993648ecb29d2498','6fe08ba297fa5cf5dee169e17c8f9612bbb29b7f7d004a8000a74441e1e9caac435da685d19d0b3c',0,'2019-03-08 09:47:05'),
	('0da30c3a7a2ca38665acc5694b4e49918c610ae0b6eefae9514e0c68bda540dac205f03fcca7145a','8af97a3792bcc503222dc8008a541a9100e4057dc7bc090dacecd4199ac152626bc1c91ecf0108fd',1,'2019-03-08 15:52:49'),
	('0dc73caf631b6c72ef8f4afa717a51739b8602bd0bd4e9a196604566b54fcbb6f7ceaee9f3cbcb01','8083766d7d5b6c9ef927f8cc350f3e08819609350dda4a0887b2a60051502c55bafc9e4045af6d0d',0,'2019-03-08 01:52:05'),
	('0df4bedd82813ad8a4c6ce2275bce9d9f2fd0f296801a474722437c31af2609bd1976ec99d4d6142','8f5b456c506615f5eebb9d15ab87fdcf1bb0edf869489a18be76350485f5757c7b7a3ae550204bbc',0,'2019-03-08 08:57:26'),
	('0e31474b0b96ff784d9658546c7144175ba6aecec68d1b0d5df27438836ffbafb8225e4ca86d4167','332d572f9c4e7d376dde31c24db97e37bb820e27936cde65ad7fcd2835806157d6e22a182a89db28',0,'2019-03-09 07:09:31'),
	('0ead14e1b4c6ae0a7cc3f9224e89636359fc742da7bb9e89ceb5fdca49fb720f5c3e5b4198116a39','ecdd9b08d4f47e6bbd45805158e7da459d9415c5c99888ee9659939ade1c37abc7c2cbdf7851861c',0,'2019-03-08 07:12:13'),
	('10c2ecfb5e2b41d09beaeee5977ea68e35433f659e549bc11e38c03937518690ff6c5e95e7053e89','805eac0fe53e086efa96b6b30829a03f7e805487475a76a704931461d010124a75757e2d4f78b6b3',0,'2019-03-08 04:32:48'),
	('12b8b894615d78dea6fb0aea68efef9bc75f3a931310e7b23854daa7b4e847e8b9e0242443a788d6','5ae7529b01a2e3fca6221a2e737a29a048113079e53143461c937d8001afd496645f66169eb445e5',0,'2019-03-10 06:48:30'),
	('12eb7cbd9a6dcec779da58c4689ad877674e46efd62c9a1e73759ab48f1af07896c2034e87bc1309','a59d01a0004b6e13769d8787e44cf762c346d45e39fcc2f74fc0d9e31a5913503711231f5e62c8ad',0,'2019-03-03 20:02:45'),
	('130197cebe727983510bca92941fb03c0956c525a82bcc913b3aa49dc7073ada11c80ddfb89f42d9','193a8bc4ac8e56c3bb7a1a17aae0d1574cb2c387c02d5cc64e7d6f6e0671b1d54497c6c0317f7786',0,'2019-03-08 08:50:34'),
	('1516c5184f7a41295854785358ad8d3edd7b8744194887e79c341b054933920c1377c86a110f0aac','197a274e5edafa188af4b53fab6cbc2b479347435c1380d5723c6cedf2be4c44fc78a8c9c2daf42d',0,'2019-03-08 08:26:48'),
	('15407b32b6f690381eb9658d9ba4a16217e0b83eb2fe275866324ef07137dfd592680c9f7a2192ec','929e348544312f2774ab6b4a5c594d9fe5cc23a414ae3076c90ad40f548a0ee10915a50dad1219c7',0,'2019-03-08 04:49:08'),
	('1550265d2a4299ddc5cfc98f204890a90d1b7e8e1438a91997e5b4a131609d1293b39eb6a9a2c520','ae3c0706b19d12a1449c20e1b206356bec6cf8df60b4776cec1f0ee7313170dc49b837d95c24fd37',0,'2019-03-06 01:30:38'),
	('16d2cbef66de02b26beb056ada0ec2c22ac7893a813d40fc3f55058492020d822ffaf8d0838066e6','2678d924ef242355c73287513fd798e8b888d2abfd175006be476357ab4c6e93c99ca3277a9c2192',0,'2019-03-03 20:22:32'),
	('16dab95ba71a777f75260f53d6f44170521435f11e8ac0e22f1ea50311ee9df6686c74493b562d81','66541d8fe90b31c616b32bc05bd4c62c7505a4d36619888b900cd9ef148cfdc9c411a862d09fea02',0,'2019-03-04 19:10:31'),
	('17e6a29b80f0a0370a162edae6704c79ab39763525c997b0303da811238597eb70e38b6df855cf02','c7f80cd4f115fe239732c0896a637f668277cc3838355a41e5c59088667dfde6ce009ea4e42f679e',0,'2019-03-08 09:45:50'),
	('17f97bdababacc245a22bc749742b739ebdab573db276e016fabd9ead0c82bdb340bd4ea71577e4d','d4e5bfb5f5eb1e1e6c3e9575be2c42c54f0310ef9eec74cf715666b64638b00657884287ae53cf00',0,'2019-03-04 20:16:29'),
	('1972f23c67aa0acb0600958554f889c83a1694e3c92a61a62608ce9cde610a95683f6a937078ea85','07131e1116d2e560d215648f51c0cecdd9ca63f48caef215ce32f624827ccb2c66c5058f767ed28e',0,'2019-03-07 01:10:49'),
	('197aaad306c3ef48c4084ee5827739aaed909b82e4ade7c10e0bceaefa99140012b67e08d783aa92','daceb44fb1d6455925010345685a5938986432ff19f7249e96f36e3cb23261db1becfae2ab55a80d',0,'2019-03-07 10:52:05'),
	('199ae1f59272289176d81275ae1455ccbf3f7565fae106c74867b5e0776c6eb003e259f07d269c3c','77e4d9692000d68d2c34d1519393d29be23b3e281460a6922347b07cdc20be97864b703d2624a560',0,'2019-03-04 19:07:25'),
	('19cb8c0d86edac5b30b66af7f23fa3c9c3440ac730977f138525e8c3c290461b4c92036a974d90e7','6c858e298b111a1d756c15476ab25557375c462d8196c8fbbdce0d6dd1ff457618b2fbea189ecd60',0,'2019-03-08 15:15:57'),
	('1a646ab8be51adc41d24176e2008e4b23b294546bb0d2f6d720fcf91cc4ac178c7ff0a24c5970381','4d41e778230daeee95556252911974c5c14d31300af2256523154ed993c88069f61cd60ab00b7767',0,'2019-03-06 21:58:49'),
	('1aa2bc7b3727e7cbd6d044a44e3c94db90e098bba1b6b337372886c6982e01697032b836bca04dea','11228e0e853e2f56215dce260160e1fc1e0f3497580410ca48e313a2ff00b705b17d3993a2c740fa',0,'2019-03-07 03:05:16'),
	('1b87cda5838358b604f9fc17161e3bd40458e5584c9c7b79db0fbf01c183cdee2d7825eb4c60486a','a873d2dd9a46462a60af7dd4fcd6a10a1b21c2b48b2ffc03757b9dd3157ad97feeba220cbdc984f1',0,'2019-03-08 07:48:18'),
	('1bea23c49557c684632bd98635356085103f190c23c3beb4efbe7883fce05c61de52cb82c3cbe8ab','3fe231a9dcc651fea4e379553517c1f9fbbecf20bcd0917fb6f3112bd589703decf4f8fb8a8ceef7',0,'2019-03-06 00:44:51'),
	('1bf68a24c4942b41b1d67f44bfe4377080527ddfeb7e7e8641f6a447eb50e57353473a51ab06170f','73ccea813a539e7c03aaa7ad123b2fab6aae97305abcb19f09bab03f8b9f86c49f670ec98fe27de4',0,'2019-03-11 02:05:21'),
	('1c2a58579b3d87cef4663949bf2b67b922a01280fd1cd4ab11ba544a0aa538ea608c5f5aa2edd0ce','2fe4a99a0712e6c612e833b0491b28c449f0382014ccddb64b0617882fdf3dc37bd87fd4496f0c98',0,'2019-03-06 22:03:35'),
	('1ce89fd448ba33fc5296d0e7886cc698c2c9cbbc1ccff54eb5dc058088a1130c0376d2f99c488707','a0efe539d0d56a7594e7e974149e79b98a68699aa5d2662eb3b41f62eafd8dc7849c0496aed0a4b5',0,'2019-03-10 06:54:18'),
	('1d0fabe44e3825cbaed86e0b759ebe34f4629ce991b6eb33eb0970697e62c974fbb2f2b17b6bb2f6','0beff9edff724951e5d2f99a680b32ce005a7c1bc7bb805507d21e8aaee7dcad6fc7206eedbdbdd7',0,'2019-03-08 01:42:38'),
	('1d3fa91a9ebc1f9efd2f25ab3e2060fbdaf3e3f0356162c95e374f44dd0e8fa5e593ed10b1e43b7b','eb97d3ab7bd5ac8222117147e0f9b2c315230c086e2b719887cce949df747083f7bbbfc7229ae19e',0,'2019-03-04 22:51:00'),
	('1fea4cdb786e1d164e301478adc8d1c881b06256d5e21ffebe246977eb33afc4c3d27d11322433bf','938d9eb40d996e44e0ed3279dc59366e70920a6d34b2960274bd02cd3b2b066285652dc80a4547a0',0,'2019-03-08 01:58:24'),
	('20492347893a20feb6864116903ded94aa3c8f7e060074a4578c4c4a21372b10de827c9427e660dc','d59437bd0297d55c19a846c8cf531387c79ff6e37d01feed1931dd44c00a113eba1180adb1cc87cc',0,'2019-03-07 02:19:39'),
	('20bd9ec087497a9359717aab7f8ce12b50b92814f50b528be0bb76dab3833ddfc1b9420f91faa9c2','46df7c3f102a6bba0c911f344a3f87972392fdb93b76e438bb7caeb5a595ca079f68652827f40fff',0,'2019-03-03 20:07:11'),
	('218361526e1c95c1cae92abe2d1f66eecd346efb75f20313661c2146ca472d3acc9785b9af31065a','f682269e3e929989de5be230efcbef34fb97017ad7426e21be8c69e82d4de69dd1d03663b9cce883',0,'2019-03-06 21:10:02'),
	('21f583defc8d1db499ae10a4e4ab81c8e7c41fc369de1b426d01cc68661b93edf8826e6c9db56c4b','e17d4c210217aa4e5005731c1f8d54f2097ef32ce3c59ed477745470f38c9bc196e6157ef7c7beb7',0,'2019-03-08 07:51:24'),
	('24a8ae225f3afab2249fd111c0b2787d01d641cbd36058daa9168b8bfac1f639d727a2df0a2a3590','dbc821cbc24f2fd2144145c482028791f2a011f1666f47966da82daa0d340854b300b39728d9e44a',0,'2019-03-08 09:05:32'),
	('24f5e8eeeb078ec6ff2c56666505f494a2da1036e5cdafaa176f688e1df41d47e20fc4eec3eee3b1','9b0556804f1a0dae498176990e8191f9a818f8dc1cfc1cde192a2b4335b280db49b1ca9da2962b0d',0,'2019-03-08 09:06:41'),
	('252f58caf41f54d53c4bf5411824f284c8f03e60ba95eb853a97f006a1cb0aaef05c18e4de113d5c','b7dcbc9095d36ac3f32a63673f33c00e56ed74bf5c856fc24e574cd8db5cb0920f9a2f9fdea6d2e3',0,'2019-03-04 20:20:41'),
	('25c6215f5ee045c028376f27dac115d1a93b9e9b1d4126096c0ce2127fa61a0602424d89a2b7750e','fb41ac76eff2c63f7cf03afe38b870494f8ef2bd1c43a2963ee2d94bcbbc6e0051f04cf7a875905a',0,'2019-03-07 00:49:47'),
	('264a86f747047248d5fa0ea301c823264122f80c358038cbb227d372591012c6f5984e9a2727dac5','b8fc9edc6f3ed1aa8c0861e305901213d6e8f23d9bee54d5296cf8cdef3021190915459f4be1d805',1,'2019-03-06 21:38:21'),
	('26ad80ab38ff0e71085be8678f2dfdf24085dec998763e0d68de61b0eb6079b906f7a5fd161534bd','07660da875063d3667e0b356473abc5a6467ecdc4a6d22b635cb3e28e54d0cab6eb5231ded2ddc1e',0,'2019-03-04 18:44:13'),
	('26c22dca91ab1debbde70f437de72d85e0f832f627c950a57a8f6b7325be445869dc3a873e6e4903','dd077a38e600a2597c29dabd1a7c86c741b3aa46c662539bd2083015f4f8cd4d851a67362db06071',0,'2019-03-07 11:03:04'),
	('26cb64940392dd2ebbc4e4ed63717cfe901b9355c0cf9b2cdef5491ea1a7221c87eb90b4eb3244af','c2a78920304a540bb12924c1dbd4b7f73fea71dfbe33627ddf58d666e1a448d6dd8fc4ff49600160',0,'2019-03-08 09:29:03'),
	('26fd35612ba6a85b58891a99a75ab3171264be0117b1ef54040485e77846f0c7941558e2c7c70ff1','eacd9c068bbeedeb2d24deb6747dbd488d601012f23ab7b3846779d2dd9f9327c8e9ea95f0336c94',0,'2019-03-08 09:03:18'),
	('27264963c0d8ed82ea41df6613030b1e326b8df4242db6684f964ae949f9291eef20fc254ff4627d','a26702d5002122c49161291ab2ad90deced0458f2e5abdb75a1d5f60c45f1ce9841e510402be2a9a',0,'2019-03-09 05:30:07'),
	('278ef938ecd42de6dcb6a4e09a2570fbc6830c663f1a88ef5e4ea3716990a80d9f7e7cf43957dd7b','11ac6be6b08d8bb9a10341af297c46513a1f33a6a19293b7c63768a16fbe7cd6e979d1be3b258719',0,'2019-03-09 07:01:50'),
	('27f704ff678117d5e17eb91276b232f4741f50aeb2014d26ea79d735be67c28e2f4914c42b4bb2bc','6810b1d422d49557b4ccc952d87d0dcd8e94c804f35e5ae83f22e88eac9d0132eca3d465f2c3865a',0,'2019-02-17 14:31:11'),
	('2825ccb9e01f83cbb7e84621d8506521232e8af5edca9ec5922d154a50d946cb7302edd8bf217b84','affae27f8f2d56f9d4638b987c1a056713eba97efba71da908f9a193e1ee99d727fe24c0a31a5645',0,'2019-03-07 10:39:02'),
	('284d58f56467209a207f01cf221a4173549ba82c213a98ea958d8927e7c903aa9cf22e032eac61ee','fcb667f30bfaab54ce20098c2eb714d18a2af03cee1e735b49a04fa9102a9ebf1a7329ca277950a8',0,'2019-03-07 16:58:23'),
	('28624adbc58daf8e529a5114b58202eb25b7bb25a4496f7f38c7a31f098869180ddd865164df5cb0','4ab4314ddf58f3e76ccab7b68a2da334dc9d93866153197971e18f2529145313d37fc725ca420f9a',0,'2019-03-06 20:50:27'),
	('29387e09c89af1fba70478f8ebe11c51e71f61d72bae302df94b05f5e70bec62a0d1874ba63b1a90','beadae26c6d649f5d65e4d924e7f4e6a18bb611c80eb6e73bb098adbfe9fa5242a1803d1310c14cc',0,'2019-03-08 09:04:46'),
	('299b6bb5a5c83eeb78c30f5a901476133bed090d80418899bf35841be14d3f7e9f986c891d77cb75','75335ace0c2698c10e3e97d52470aee8a482ebef8abc6086afdef72cf93e070ca4838ac190aeca39',0,'2019-03-06 00:43:40'),
	('2aac01b36460356928a8c73e694c9068c25e26418857ed91be6cabf8c9e53af6be12aac8a0179cdd','c4ca924b177171f7ae0f5f268d3c2e7cde51cd3478e03e7c42ccdc292fd9b1d7f85b7381e4c8f414',0,'2019-03-06 00:38:38'),
	('2c198b087c11d80292c96c869f8f7341c94bd853101fb76b422eaa67679deb6f4b3104a934abd8d5','057b19190d7e03875e43a203709c6ff82efd0bc6ff694b8732b351b026038c55900231cb6313bd26',0,'2019-03-07 02:10:02'),
	('2c29989dd04099aaeb7f46dd8e4c4c5f1e63af7c70525453662a17c9c553ef8b5a517e54b56c6283','a39b0ce6417d4002aba4b2ec145afca3ec5f6063979ef121426834be1b66720e56c7442867f5d590',0,'2019-03-07 16:07:47'),
	('2cb63159c3bf86de9d3d34f816a6c9a7dad9c23d67552a88e4dbf23cccaa184b5dbd8c40033af794','8a0f3091978cc739e267ba4af6e9a4ae6c3f5c03184ee7255c613cdf4b725fe1371e9aba6eebafb1',0,'2019-03-08 10:07:40'),
	('2f2f39eed6593ab39895598ad633de7803526c571471541e403ef1f84c805911a4694e0f4e32fadc','0a679e62cdd9fea635416c5a13d655254a789ca5ea3b8e825e4b0fd9032e072a58e26b8b386896c7',1,'2019-03-08 16:10:20'),
	('30e7bc5d3bb00062e110fb31d38ce6041614711e63649d1fbeb3e31e320af1ff3ef4d07d02335eb6','035b37793b42802af0fea527b4d50c5e39855edb048207f76c65e1033e092d228ff1f597177d4e70',0,'2019-03-08 04:29:19'),
	('30eaf802822a377dbcf595db8e6c0488f68c1c8ef31d8eb4d8cc09f9ff7636a93d050741950e4ec8','947a748bf54464fb29d006ced0a8d0074ad1fafbffa7383a602ec8eba138ad30a10338f07e92a195',0,'2019-03-08 06:31:30'),
	('3132f5104cad028a4da61273d52924f41219da805a17e33d7e118b666a43b1d323092f949105c811','59b2a45b10355c00aab8fa48ff4f1e502eee92ac7e1d00f69b8accd695f4367c0c0b93363b6ed965',0,'2019-03-08 07:39:12'),
	('3259a4429ea7ddaa3a8423098e34cec33d04ac9803c96ad4fd72eba24073f1a112abdea702a39c8b','a795028e4dcbdb5354383325dde5db2b21114c4bb9511ceb84c64ce3722fb14124bedada5e509bc4',0,'2019-03-10 03:43:12'),
	('33c338f485d2e6a2dd4e753d0a02c973e63bf5a3c7639641e28fc7eb5796616f323985f7ec355aa3','833e677adcc5ed34a512612741e89042c28d398c7ba1296fec3c4bacc83ed0591c50e305ff1eaff7',0,'2019-03-08 08:33:18'),
	('349331c7d5abd06d16f454e5cbc9a0184574d85f50e004fdd1b1817f1c41cb2c3d526a0333cec77e','76ec26b8ea8ee7fba49a6ab390cada33e8ae71381f9acfffef2c646117b8467bd1065b57b2cf8557',0,'2019-03-04 04:58:22'),
	('3587b24ac3ccf6786218d49841f0098e968130f5aae77e360b334481a67e99d36a615fe6f3692437','f1ac6347b33e1894a347bdddb5b2c7c964bff1ef568891d0485f169a011996891d3da5f66dc4de9a',1,'2019-03-06 21:32:54'),
	('35a6793c99e8c3ea30f6f2ac2bc7ae6e08957d83449f282e19dd803893c282012cf8c4fe8f1a7d14','c984661b945e13a1bb3d1f3bff6ddde4be8749daa2601b836fc9156633cc2a080ab5568d70381fcf',0,'2019-03-03 20:52:45'),
	('36b0214e2d9b4bf6e62cb29820b1483efdc744389712f9a563f4f49074ac8eede5f426019717e304','10d4042129c8e7afba78cab44390dd7e0f858e5f76c7957f66bacdc55322b0babb37e402f874d5c1',0,'2019-03-07 01:36:51'),
	('372a27ca7e929fccd97d5f2ed96179f60e6f0bd804c32d9097f2cdeeae3d0705032dce7ad3affa3d','cbe997ee0f9c77adf442af30af6c35352bfe676d6f026afd8afae7c4200db4bf55c39ad16906cac7',0,'2019-03-08 04:42:47'),
	('37c2c0330ab18d013646383f06d3fa4420bc3b0363b45fbb635feae357c64bcc85f95a688ad8b3e6','0bc77ec186c7a6fcb93793c0255896149bcc5bbc80ed5de3ebed923ff834b25e9707065dad75a2e9',1,'2019-03-08 14:13:03'),
	('37ce9cfe23a4860225c07da6d9b66ea204c608def627da6be8180b9a799e3095d53060ff87971557','d8aeb56560a3427f8c00cee1c6b59361b45b085995b7a485975a6cffa5b87ed3e07feccfb8c23403',0,'2019-03-03 20:17:17'),
	('388de2443f3422cec54a137373db633f5927c6a1c8b48f769c12766c528abfa7021bc1e79d92fffe','db793e88d9febfb3169258a8dea0f589489473e1bfa49053b4e3fdcbb2f432bda9c4fb8d488df2c0',0,'2019-03-08 09:19:44'),
	('38ee596e48f8deb728faa9e67063408728420dd16a8141ad4934dcf6e2341e860980445c2bbb5665','2d318ee7c442b8568a0995bec0447fba81b2001b812faf88790e158c152e3bb6085486349837a45e',0,'2019-03-07 02:34:04'),
	('39fedbb266cdebdc90ef023452bdaf129616100a22771be3ded98ed03ddf683fa65666c2aac58488','a67cb771a34ab2035b9901738b8c33a3b53d834940474c6f3e5ce0326cbee375ec0f3866a800fa3d',0,'2019-03-08 01:55:22'),
	('3a3da6245ba124d7a6a51abb0c6ad61ce3354b9a65e01c1429d9ab12946323d7bbb62adcba34d57c','d9e14584b3d6c420aadf79ad88001f82a4ba1bab819c387cb3c60907af09b62d11fcd6e713e7c83f',0,'2019-03-05 22:07:21'),
	('3b9de0361e21f78a7398e67633ad52776e021822c6841a044fc39195756f302eb9cb813e4225950b','7f82917a4c9e201fcc1849e6450dc941ec6a202593db6dac6c9414727d29d9876c30f175d3401248',0,'2019-03-08 06:15:18'),
	('3cb18a03e1537d4055119749f567f5af9c5745bd0c1fdce5f1f1f195d5707bb6de1d3ac73e25c1b2','3c14b785c9b0becdb90da4aa202dd379b5a628090985b55c703b5534cdc60981c01eecf8a35839ad',0,'2019-03-08 08:56:35'),
	('3d173770e39f115e22da68d41e72cf6083b795d6150820eca6ffb75a5a185f5ea81cdfa6c477ab76','6ac4b0130d74a539d5a186d465425a8cbe59223f9c5ec463e8586e6b1baebcdf23d8766b71466ea5',0,'2019-03-08 08:23:30'),
	('3dc9cb0918f31c1765585850997cf7dbe02cb1ad6f9d99389057ba90ee8e1a714b2d9eff6476023b','476d0f5bc1cdb7782849b40cd056c4a095956eb9018405ec3717081dbc177320c5bdd61c4dfeb58f',0,'2019-03-04 19:24:14'),
	('3de31911c46c9b03492da75ab1660c2dfdafa94ba7840cd32b0926e2ca4977e2ff40f3310e0ac960','6eb517dac1da50ded0432427aec97d5b9aceab96d8fbe3e5991787c201237807a8e32ef47fbca102',0,'2019-03-08 06:06:39'),
	('3e71b6584511900565ebef183ee45116d51dfbc59cd011eb1fa72807f56e932090e9ada33b76e60a','9ccd6e91ade54ea93f7ad4011beff748b0b577dcb3bb5433e3dde4299afb89d180e324e4105d3e1a',0,'2019-03-05 21:59:40'),
	('409f74015ec1e8a49f6b46441b3c2db8c3bccd9d332c3184a22cb705acbeeaf487688c247d01fc1f','8d2290e755bc3f1d72ee06fa3bdfe23695a9a750738faa2889d7e156206b2b6412e9ed08d6769c70',0,'2019-03-06 20:03:33'),
	('411910116157d140c36b4dce980e6ee89ba16db9fced8e74367119ced386209d6d5050e883c60e1d','d8214b75ec8d680ad32b71335a02b278de237c15d1db78e3022e0f254d5ded762ab4e77387676df8',0,'2019-03-09 05:11:50'),
	('42a3cee1ccb7edcdb911db9bf3f8bad96180b1aad68d36a5b0c26747f8480d1c6d6e7d3a77fc7b52','9389c76218b7655d0da03e0f5ecf49fe43d3e2328e8d3ca735ed07554f8b75805a709f2f8dfe7d44',0,'2019-03-06 23:14:21'),
	('42cceab79c7576f2dec1145ef086e09a9193c9bb3ebf885f4e1bf8d35220b2f64669f54c08faead1','dc8dd726a45d72ba9d54ebbec7378f3af8ca3596b97e36fd00a916cbfc4ed26c02e14c3db9595977',0,'2019-03-04 22:54:42'),
	('430175b0d021e3e0cbcc8f84601d1b7ecb8a74e935aaae965eed6efd7e7a2838cb70f38e114e08f0','d43e914afbcf7305c8c1eed318f3a08f7b9de746037838a9cec5803a9b7102d9ba9e75eb640cfb9d',0,'2019-03-06 20:54:09'),
	('433712144148dee63a04b7ac71a500d29e1e85848a76b544ffea51b05710d6e3ffdd888b96a28788','884540577a5a3d160832c61e115aaf77a8fb88ee5bdb562c1c1ea239e43f35e2e7bbd46f876a7a68',0,'2019-03-04 19:49:20'),
	('43749bc4ea3433cd2190dfb7adc1e9d55ab2d1bbffa54d68cec8ca254fd99ddf91e7205bd45c9952','effddf53c741866bbdfe1a6903e8440952a86be3484329b85209925b101a62621a3d1caed7fd13eb',0,'2019-03-03 20:16:28'),
	('43e7e2856553141f8ee1eadcde5395e19b8356f5a606458400fe60c10c78a05c597ff4e01712009c','277d166e51ea03e9fdec6faf5d95f011ab7928e0ecd2a7619c4960bb8f2b8a7e37ba8d67a39ea20d',0,'2019-03-05 21:58:02'),
	('44d7d27a296e28f9717b8aa12f221b43f8bb76e27bd0334f930036b849f4216677ab17d54bafd374','83bd91b11ff3bd7d3813445e091126240d30e6f8584c82f47b3c207a3a243f5494246fcc7254dfd4',0,'2019-03-03 20:51:00'),
	('45de11a173efb801211f6c92cbeb7c2e00072767b84b7ef5c140a4801526f0bc49544e52bd3e52ab','b280277ddf0e025e11026c89fa5d32ad337a73230e04f6cf874afd2e73cb761b82ec676977680c7e',0,'2019-03-08 09:15:33'),
	('46b82e3b7c32ee014c6c9b7dcef2a164fa3d8099a482c7149305fc6d7081c4f123a99c52cfaf7c94','716630669b37d5af3d9371bcea022c9c64b3eb006826d2e4b2175f1cf7e780a1f89eea62a1904f74',0,'2019-03-04 20:25:32'),
	('46dc8f9c87e91dee77c785d23b9463fc62ed4573ddb2248782fbcda03665c6a58a68d0e824ac8f5d','20a1bbb63c19830c5421c7493c3bb365396329efd11fe2ff433a6187fb1086ca450760265cc81f19',0,'2019-03-08 08:40:53'),
	('47e0916e9dc35cdac65c035e0e594fef3244b7ac5fd6ab5a0728ab5537a9e989a40aacb98b9a5508','66ae9869138550b77de7b95161944c267a20aaf4b66e8fd808d14600a73003e8dada24eae400d0fb',1,'2019-03-08 14:14:58'),
	('48ebf90232f12ccbce7aaed4b3c8f810cf713064a71a10a33adff2edcf20454b428ebf5a7191620a','488fdb49541d626e060550f91ce3fdea031a6c20ad8a8056c93fca171b155cf96b3f44b6fa946523',0,'2019-03-03 20:57:35'),
	('49501baabd26a217209456730cca7744fefc00bb0cefce75c295fa140f94836167090b88c717d909','af242063ad8fef41ddc9db11bb232e6a620dc87173870d990e7b367cf5daf9d2cde3d2aa9e092ab6',0,'2019-03-06 21:00:46'),
	('4c29c7c39b96b4a96cd03d71e723e2e40aa326d830134d34dcf3ac452444f1dc15840382733cf459','9d156460fa86683804ad1ee305d46abc5efa53b8121780d3a0fd6289b3575ae70b2a14685d6110bb',0,'2019-03-07 02:20:48'),
	('4c7e6c1995ecdbf91545bd63b63bb0e77cb971c3114cd1c7e03b267e9ba13eb100ac4c094e8623e9','d64a7bbcb20df0fd54c2a5a06fd90f2123a10d2aa6bd8fec285d37b5e23082b09b7858f467e45009',0,'2019-03-06 22:02:32'),
	('4c84b4f665c6d7cb6596ef5ace20c5cdb56e3aed7cad9c649e8b86636a7c762a5679709496075ae0','d55a901f1b4725b0cdf9300aa29dbd84fb0009dd5c0c7a393def70bf09453b23b82f33332193ed92',0,'2019-03-08 04:41:18'),
	('4e8ea0d3624ebe50cfdfe6b7020d3da8fdc914c5529910d1136f05c792fabe1b2d1e5f8290c66afc','5d6b349ebc9f6c5c5eb6f1c9e489a23b44999f8b2ee93739a2bcee86c28e9e0dd9fb315c75a43b6d',0,'2019-03-08 07:39:59'),
	('4fa257049fa7d46b5c4983afaab074d55cbf55ddd4d981b6f256b8b2fab47fe3e28ef8487b37b437','8f14e123693d143aad2ae77a7f8ef93363bfccb4db7d72d2136a3871fe9a416f0a47ac7fed3ae6ee',0,'2019-03-08 04:23:09'),
	('4fb11cfcbd664c754492e18a076f89c7bfcbef10dad0c8fc9cc518b5af305aacb2e69d43e5abc1e5','89db5e426ead665d2c4ca6e48caef2c8f848c912b20559d3bc7f6c0c9a2c3dd7a39bba4f0f6ed215',0,'2019-03-07 02:56:18'),
	('50aa4af87559935eb9147471e5e4a8a93d8844c38460c6005eb1fedab24406d8b14ba0213aa9f153','eaadc165799dc2420b0b6ff7e610ae0b0efb3f23ac7bf4028a9b7f7ffd5d007dd50fad693c95380a',0,'2019-03-09 21:38:53'),
	('513a06896f5e26ed280e034eb3b9537151cce42fe6b5ba9c63aa0b498266db54e3082d562e940b22','27a6e4476a277c59dc21eea12a2d57be65246f62668ca583219eaec2efa96bbc1523956b30ac5b4e',0,'2019-03-07 10:54:52'),
	('530da3261627b31a0f26ee158f95955e9ddd0e876616af4fc07475ae902e236977a5a5008b0b6613','361d6aef6c26daaa02a505161710aac9365e04db58c665be622e3e9ab0d083aeca0bdcb26bee723b',0,'2019-03-03 20:19:26'),
	('53389ad881aace334650a18bab0705cdee40f9fe19e196ac9e005b63197e0f61b687c7374300c0d2','1682a9cea620fbc3ceb8a98d2186ef38ad2a02fa3b9fc65335ffe557fc7f34076855e83451bfd84b',0,'2019-03-09 07:23:35'),
	('535731ab78dc84d91286c0fbbdb89ca061f6b6b56d0c0a9bc38f4f271cc068fd889ec8ee34d2ed4e','136fdefc47c60f784905279ee16c40b3357aca8caa8bd5236f5c53ac9127733702b2d1f17d0d05eb',0,'2019-03-07 17:31:33'),
	('588cc24ed5afbf6168335a93137b34268b5ce042980d82b80bc5c8fc79003fbbcfec0a63b55abc4b','6fc6b34eb59106ea05e49dd82fd4bdcad88312b5804dfa2e250ea6bacb1e829e7487bf4d0eb5d2d1',0,'2019-03-08 04:17:18'),
	('589f24a5c0950112ec8e7ffb919dbf3b0a326988b0796094f35ebcc21d1074cd86d33f4b3b3eb5e1','ff154071f459c6a19717407980f2de1d2ffec950db1a07a1771dbc04b8888006dc3ff06c7c624d8c',0,'2019-03-07 00:57:04'),
	('58cddd75788c1947f7a823332aa6c6379f77a759bcaa6db6a214451ba4800886a169c44278d26646','29b81229b3766921c06dbd9b8c73d83506e4e24935d3e1bcab70351608a72677051e073e95a6e145',1,'2019-03-06 21:33:34'),
	('58ee48499f9a8a57b12524abc2b3b8099d9f50980876ef9c958eae7b71ed0d4abd39d09fb025387e','5204652dedecaab38c1a5c35b171eb97a8565fb8d8e1121ca923a1e896ad697f56f6b87df2aab680',0,'2019-03-03 20:37:10'),
	('5993d74ce98b39e755a2b98345d7f49b465c4a87d4c47eb266e014ee51e814a2af103b8714fae4dc','1a95828e322c707a05cbff56ce81d65c83d6f498859e5d0e500d1c67702f48b3bc8f9bd33f4d03a7',0,'2019-03-08 04:33:32'),
	('59c81205d75e980246d76c079a132e06900794b2336a48b4c735da7acb4a82cae28c172e0822e579','186f09fbf14b689fb5720e147bfccc99287ce7ce4e81e5bd75aa02216d3628afa1d80c197e254645',0,'2019-03-08 09:07:36'),
	('5a5abea3116414655ad59877a0a562156c23b6465a4e756b8d2dd3064a75a8f36f356f399d1863fd','98ca6155ca1ad4b32d8b51c4544d517e6419fee4abf2ce1b7f163601ef5bc76818033e0361373b62',0,'2019-03-08 09:27:04'),
	('5b935cdbbf50c396a10dc30f85c276c949ba8abf1c6e65f5f6c9abad0fe9fb54d509788719200cf6','fff48ea94a6ac708db4461496ef6c05c54f8f20839478a293f61c935fbcc76d9802088b2d02bb0bc',0,'2019-03-04 20:11:17'),
	('5ca58b10fc6491789b694e13215082448fc94787cb7a98875ebeef1a393cf0e429ca938618e3534a','e3a738345cadc4fe65e3ecfbabaed6d7d9701e685590471017a767e42ff0a4cf78a7988802e995fa',0,'2019-03-04 23:51:36'),
	('5cb2e51fd02b32ec3c7f238a3dfbeefad474c73803fb9f2159ff811fb6875cd43a678746a170d31e','db1abb82999f9c7a5d75c28d33226ea78232c4000120d34b37698bd37555e6f740a55a61c6f4fe33',0,'2019-03-04 01:51:07'),
	('5e6fd9d81e7fdc116eea6824b3bba4971802367ba7c81063475c7d2d45400c139fe46a3f02286f28','b009fd90bc3868e3b80203d8621535d03847ca7c716bcf9675d6dd64de579c060925fc9582bc7304',0,'2019-03-04 19:54:02'),
	('5eaee47135471560c92413804be94cc65777b1b6955fb7656f86135e4ebe699b4a862923036d7c75','068b3eb6bd34bb85d8eadaadd801196a99fd830316473f54e6b193571702155ab9cb7af987df5fee',0,'2019-03-08 08:27:24'),
	('5f4bc4cecd2552ce1dcbe643767372057ae8ec7b17db7f8a48d9b6e6832d57802fc165ff65b256d2','c77c3037d0ee44078fa5a70e4308c765e56c77d14b8dadd84c96c88a5181f877152487c49ebe1848',0,'2019-03-03 19:31:53'),
	('5f6ed98aaf6c9359c04160c314bc9fb2ba9015d5808a854f8874b7e137fa515ff787ba9af22ed3a8','194742157ab66779022e1c2b14d3e834b0d2acc6b7b9c90d65fbb239a45f66fb388593a3c579cc56',0,'2019-03-08 08:32:11'),
	('5f92e363eec3e4c5780a057c2bae4afbeb40a28edfdbf5752b92d39e8eae7a7f123892aab37b3adb','59da2610af5bb291be832de273e1c7ce1e6cc306fa309ec034d1bd41f2273e49ec798ab0c5267cd3',0,'2019-03-08 07:15:27'),
	('60dca1b79a4c325ddb25e7a30d93b07f0fadb2323b96c832480a84c9d1d10ba5e54422edd09787cf','9bf7bf0a76c93b9387973df0b529884dd03ba3d9c35346c153d65854710c7c397c79372756450a19',0,'2019-03-08 10:17:43'),
	('6177c9ed0f9af4c8278e0a58475f3b25a91c6922e505602a7b25f6a919cbb32bec65a163340289ff','392944fe41835398448e8bf8fa2670a69f0b28552952d43410561ce08de322da4b4db23d36488324',0,'2019-03-06 21:03:34'),
	('63b7d75eba44677b2a2b1bd96bbe1e2d5a2faaaa28917e625a08a490a1e72e3f50e03b09f6024822','8ba233dfb90ec1fd4de837a1a7f9c6b64df892b4996bac6257f1588b51a40eefe04db7c9e81c8ce1',0,'2019-03-08 07:47:02'),
	('63f6c35722a6eaa46c8688b23b833228f0b5e24e3f7c023b6e4eac6e3f031c07b1a0c076526f5373','b08b3304c165e8fcada2582bd46fa3302706bb2a85114101cbe3007aa8efc206b52eba81198da027',0,'2019-03-08 04:16:07'),
	('651167bc6a53b7af96848d1e307ce9e5d47ce5117281b2d43281a317e630d760d09000c9e9077084','82b7d1a712738383da5e03099804f46888b56c8b22c1102a387a771abcca61c5c0bc28ff54a33ea7',1,'2019-03-08 18:27:58'),
	('653637d1af7c9da44b3cda4c12793c4f72fd3d14fdf2c0eccd37ed53f0fd202c5ba8f723f882999c','f7d3c94b7ca5e50f982ed71eeb77995cd7e8f164df5fa40fac7891b515727d19bed73a6a9d4bb975',0,'2019-03-06 21:59:34'),
	('65f1863687ef615401fe5786d0ae9ddf2e1ae488ff82256381a8d3e6ec5eab883abe96abc783e9e0','94156dfd64ea5e3544d2b003d940a94818661d082efe3cde538c23bfb540a0d9ebc278d4d18e293b',0,'2019-03-04 01:28:25'),
	('66174ead50dd9f6f56fead12fcd0daae8878dc13e5bb1859c3f0cd828ea0d8d4d68d22acc7f24922','97e316f747064ec3a61c6524c318a6f764329959a49aace9b7f007464438e784b3fe21a7385fb10a',0,'2019-03-07 03:00:56'),
	('66b6b97bff6c2e2e2a65ee5cb26425925da1f5f118e8e047cb739bba81e400be6d396b395fb1ae77','8a270c7fdf7c940ae2ae1197b08ac074aa0274c4c5f795d996ddc941da79fce07cf6381a4ffd362e',0,'2019-03-03 20:01:30'),
	('67be302ac8852f5848579c948d7a1b55f6df99df0c51a1de84f63ef4fcfeed54300b18b304bb796c','421a44dc9295118d03877e2b912b6226dd4ddd440c501e9457ece71b228593f0ba0fc79b8e7aeb16',0,'2019-03-08 08:35:03'),
	('6906592f2180ebd33ffff9e18bf81abd15614d77a131fcfd6c164078d044148ad5ac8722a4801dbc','e7ccbd29bc385ed366e0baeb6921ea1f8186677cb60b233e0ede80f0bd097fa7757cc3b4ef38a4b9',0,'2019-03-08 08:54:09'),
	('69ba533255d0e96d0939f45102d0611ee1527f18be1ffe20f5da1350e326ccdd78730de728a6dee5','a697fe80ba052940eecf3e0529e95912a405e24aedb5e458758f1c6436ecec726eedf09e12e0397e',0,'2019-03-08 09:09:23'),
	('69f7ac48b4874aa3711412a9c0686135edd473c5edf75e021b22cb6ffb1d77fa4ea1436e3cd5d536','a3e233c251549879b3c70ef57552f825f60e9fb33ed64df917afaf3aeb480c2204e2d69596e1551a',0,'2019-03-08 04:49:55'),
	('6a4a73fc89a76e4fcd6f617adb7d0e926cbc662af79ea0420f5c9d7541cf59e47eddc83b04853e1a','f845708dfafb92c68fb191f588d6fe9d288f5f1c7bd01f716141f7e9f2e0ed69e996188244ff6679',0,'2019-03-06 00:45:42'),
	('6a83d170242a2612a2c61630a6541c9dba8f89b92f90f14a190756e6b3bbacaf8836d1d24c18e40f','6898116898e8b29681594cdfe462ee0a918aee3c37931ee96c06e8a8bdc062d52c1a357a1b9f63ba',0,'2019-03-08 00:18:52'),
	('6ab813e2b0ff1586b1189f31a51df2903587043c09df9cfec3d65834d2197f8d2e303fca6b1059d7','bd1429fb88877dda61630558b7c05ee2757a0265a21a2eee8d82190808a1ac10de607db7a8618b1f',0,'2019-03-04 19:14:45'),
	('6abb353c38c1a9aefa1ba5f5fbefc37b232d7183af442b66262b8807bac903fc187b2f28958f0c7d','1316670651008ddc73a81757bfdcbcbf27b480a0987b9d9937f36895786aee281b2b69bf049592a9',0,'2019-03-08 09:26:39'),
	('6bf3f372099b854dd6f845c8ef43d68a8c4c13d4d719efb6598a9a52b07b2bda2d88fb6025c09ea9','cbf71f00686a4327ada0746555fca4a293f5651c0686d450395c9c407a67c422cf96ce093b951e7e',0,'2019-03-08 08:58:13'),
	('6c84b3bd8e9faaec0d94130d54394ddef9692fa2f151936409b00317e4c6ed7790ad6b57cd9dbe72','be7c651459d45c2d048ec1e28fecc6cfa012ef41895c1a8ba46e5d5257c17ad9615c6761c1e70f34',0,'2019-03-03 20:14:28'),
	('6ce2b0ec81e5c74add9ac6b4c2fa7f30e0c66fa93f6a2f84560cc7a15b2feabafb83504ab16e5602','4ff4525931fa92f57da204a4f1800f8fa1c1048f17afc7d26af7900cb6d6677d14fc116ec824a4a2',0,'2019-03-06 22:23:41'),
	('6d95508c11314ed94924ac61917a342502703a03340c5fb3d147907e1315d3026140939389755883','85307f393bce88737bcfc889e6ccb2e46a91d439774903cbddbfa2cb76a0d28193f1fb099d6a1825',0,'2019-03-08 08:21:06'),
	('6e2211b7ecf1f29a34a8dc4d28fba4085910a21ade31f815781fd4fedcca4f4aa4bae6806115ac7d','9d2bf9a0b4c2e16bd55aa39df937894677597ad491ba77bc9a3342511005e82708d8908c8ca5810b',0,'2019-03-03 20:28:45'),
	('6e29169a5eb1cbc80f1f8d604658d806a55243bcb10e1cb2c095566739e4015d4c56a13575212893','40331e4aee314aeee5638b99508180e71c02ca9874714cd905426b64ebd127429c8facfe1e0c06aa',0,'2019-03-08 02:03:00'),
	('6eb306a668dadde35b148cbee457b87a1d7d595ca28f5e08168affa92af6320b83d2737ab035d4b3','3f0037360d6b119d5a84e34544affd5fabaa16a53a3f975ee6f32a937b4132ec7ea466321dfe1737',0,'2019-03-10 03:26:18'),
	('6ed0f71f6e7175544aa75a2e12b187acc1ff2fdcffa037c56ae9556bbc05329eb991efc9edf22542','8bd8dbb1f3131b1174b69ca7a8a7441d7fcb9bb81569d014a5ac6babd332481a5a4109c7493bc67b',0,'2019-03-04 19:43:20'),
	('6f3b24ddeed96e8d028f1627ace644ae92a81bf615169a467bb766f52002bfb3387ee21765c3be36','0c584c8d51852049bc2a8f059e25c0cb098b74d4f55b5c2897c7043db2e88a45a04aea5d2aea0e55',0,'2019-03-08 04:30:21'),
	('70dc38ccbf8b25b55c82a6ceb220f56cdf77df137ab23e9b74118726fa16b4d0cfddead17302316e','7fe96a08195326766269ac6b09fd3b1b4c9a64956bc56427d5f7f809d43db4129faff1a03c76d2d5',0,'2019-03-08 07:42:58'),
	('715a0bc209bb1aba9cbf763409c0bec0179b8e5e47043af78e7380094dcdaa2b29496926ceb040f6','bd2e2cc7ceac211b0d001c46536ac71dc69ebf7df5532226c9f3f1fcc46fa089a10ccaf2a1318f82',0,'2019-03-06 00:54:41'),
	('71d58e5099e4425df5732160573328edccbc5bb9b78ae3643be6ae20946c3f77c225389784969a3b','e5b25689b5e6d77cf31fea1928f1f36b70f046d8b776c371d1f63a5d583be20acb109bf7e7e3dffe',0,'2019-03-08 08:35:05'),
	('7252c421d97a24f6ad9c73f0ea5a073c35034c680ff06bb685560025a6abc7a881efd782fed7461c','68cc5ce8137ea22c3e6b5626cb7d75e389e7776f525271b0abd53f56b458d0b861dee25672f082e2',0,'2019-03-08 09:39:47'),
	('7276275b5668ce3ff6d074cac379e79a65da34136e8729bfcf267efc22477c5fb6dc1418dcc5f506','7e155121796ee8c807e5159d3d8e0bb75fea7b0c447d8a06399c07834497557745492580a46f1b8c',0,'2019-03-07 16:56:28'),
	('73308a2cd00e4f08ff2452cd6bc71c6606a3101522a89e4bf7e8eb0804404ac18b9dbb0c6c8de1a2','e84050672299116c327aff3c4e6d939782645e7e5b1727f1b0c7aa341deffdb667f9199c2de10e55',0,'2019-03-10 07:02:17'),
	('73324d8b140bea8d67a388f336024dce7fc3d1268027e6866cfe5e7a5ca97d3f3ccc93a006fad70f','73020f6f59359dd30a2b44a1f215f9672145afa606db6c1f962d2fc474b1d6fb639b4450a7058ff6',0,'2019-03-07 01:46:04'),
	('73535c9d5957769e09f84b1a256d9188a6b564231912d93e7ca128e05967e8240c58cd941ce19865','613381404db04e4012b46144c04241a9006617b7a889ebdfad401a2ad7e7629768aa104e2dfd78ca',0,'2019-03-04 20:19:07'),
	('73f051381ba5deb7a27b786e9898f2f8ff883eee7f33b8f92b95f0bada53ede27fd097775187671d','00a8bbfbbb5317086078c08d5d1d41bafc035664ddb84cdfc377135e9b0f233bade94fddc1a1e745',0,'2019-03-08 07:20:41'),
	('749ccb8b7144c02bdbacab646727c18acd25aa120016f4258d9230d7ff77e5d1ffaffdf423b4a951','e436607ac010fa968c4436cdea10e8a79e7c94313baba4649012a6ff6247cc12597c7025e3a322f2',0,'2019-03-03 21:56:17'),
	('75c2d8a5eca3d00b4f1918af8476dba298f23337c5e8c7ed2535d07390ff64b9ffceb56338862010','3a3b2bb2cf87d7c7a6427805c55cb82db21c1dc26b6eda310afaa6d567f8be501d3e2e5fac9683aa',0,'2019-03-09 06:57:14'),
	('764679533ae5f05c82473b833617fcad5ea986927d931ebbb0fb010b27e7ae6dd444064dfbea21fb','ec837e2f0b45b5d9e5611ace5e42052c70ddd1aa005ce5c5f76c44735a8fefce9bdb1a30d4dbde4b',1,'2019-03-08 02:13:08'),
	('766162b09a0aaefedc66fe7f464ffc125b4a121564a3dbfbf766049ba35dd8a5b62a97c355d504fc','d3535a8879e24f6a74958b24a584ff52ae9e5013ea3004b79cd8dec0e25b60e424919ac4c38c4461',0,'2019-03-08 02:20:46'),
	('76da1ad1f72ed7c9ca6e46be100fb139249a9bdefdeff2f27b36a3ebd0f0ab9bde7cea2e999a54a7','e6dbc06e33d1c022e5d804986ab78815656bdf9d201e830cd278f14f11b9278e1b34ebc4dc039ac5',0,'2019-03-04 19:44:15'),
	('779020991b4a62b8c391b031fdfdcd5b97f14985d246cdacc156b0594179c847bdb973b1f1102a69','bdda108a04b82da763e4cf00740fb5f87eba6c07d982ae93c10a0a9e46a9473fce771dc607012135',0,'2019-03-04 20:26:53'),
	('782bd4f9373a6aa52ef902fb44d7204b86da58bad81fef2eb1fa10cf1cd25aa9350dbc7fbcdc1e85','12fa5658177d392515ef76cf29534bf44fbf13facabaef41f1a2673c4c9ff907f9daa73ffcd4925d',0,'2019-03-08 06:05:50'),
	('78637e1310914257e1b1ad0a85bcca2340eafb478df33e27a5ebb23f48eb8873a0b633a4fbe6a5fa','6b7b9faec692479c407637e3a81b6c281d56591cb118d603cceab5a007c3fbdaffb5859b63dc90a6',0,'2019-03-08 07:50:25'),
	('79022cad334234e0b189b8563b7c2d176b0fa34f1e038245795c2306bd5b5c4745b3002733399f4f','ca1265d210c53ade912256107b570e9f82a89a7a70f7679cd2c9cabd468d5024aeb81be77981c335',0,'2019-03-05 21:33:45'),
	('79311333a692950e8d7bddebfe6d4234c00d70fe6a5a8adbe0d9b3a8348e844cce06243ea32120c7','3c0a0a258211734594130004bc33276609c9c14d435bf71e75ddea660d4e6c5bae303c8030d598c0',0,'2019-03-04 19:06:16'),
	('7a8a487f866e30a26d3d52ab315baf5aa702ba44878138e989ea839f68328d397f71892db3a1adea','c5f87e6db9e191dc0acaf22253644e77c6095178b8d7de3bc116ed8e68a63e1423a1b7e0e3e18116',0,'2019-03-09 05:33:21'),
	('7a9d3783797869233f33bf0755822bcbbbc1983bc0e4b02179c7e0fd23f3b9e7b912bb6438e3907d','be6893048bdb8ed198e97a8ee129907be778c599717a7814f33c34e83092208ac0cdecf689966b2d',0,'2019-03-07 02:55:26'),
	('7c8aab74dcbdd7b08bd58a18a581a8f35f6f9641808ac768dc81bf7dc6d2f6f77f5dcd326c7f5bcd','5d0faede32ed61c2d3449c23c3533e556a48cbafbbd3d1e0169e9a1260facec81695e35dc7709029',0,'2019-03-07 01:08:40'),
	('7c9ef49d3c8e4c9e2348d60133b68a61fc21255536a1acb20d9b502deabaaf1cdb8c4c00db6fbf26','9789e8086b279ea95feea97440c0f72debb604592aa0108efc2a438038f6182e096fb556d7507344',0,'2019-03-08 07:24:49'),
	('7ca556ca461f11b438a603e8b73312494036b68feef43cc2fcf99262f3b85f3593ff4f232b9d0c2b','f6e51d6a03b7a466f937b1c90c8bbe5148f3b7a2360a282fa00c787284ad5dab182027e309e84f75',0,'2019-03-03 22:02:47'),
	('7d8802e041e08ffb15fb498e84423307492bc9e4a08e8830cddafe8ef35fe3b867722e939e3d2059','fd8643a27780357f095338cbea37f957a814a9d9b88ce653428da53c4fc18747c07efabfb7fe4395',0,'2019-03-08 06:32:52'),
	('7e07752a3596d4a6e7fee4127c1e5bc6c2462d027b724658293e85b4765952d664e7eedce70db170','457c549ac4022ae7e6a6b7de0b338307e79c70194032ce139fc47c7b45b6b8ad398f586349923c6a',0,'2019-03-04 20:27:30'),
	('7e41fb63e603060fc2a187aba32df054f58a5ddb0ba4b30c67972b5392a02786f0e2ecc91f02fade','2692b3f9043b3d992c3e9f382fe07d073a72a982615f72ec9620dbea069409267231edb29896fac0',0,'2019-03-08 07:00:09'),
	('7e64ab6534d825ade60b6790cff9fe97b341b7bf917530466c002aeabd5626bd0d022ddf6349ef99','1d2bf0c0aa75180bc31629d1245061b5d90db35d60ab6536db0139334cdc147c5444626dd50eeb1d',0,'2019-03-08 10:18:57'),
	('830933be8c31d8a03260663b108388f952909e4c7b3d4e30cad94640710581cb55ff733a84916343','395fafb974d913f55f235600fffbed9c5b2c345740008cc531c5fa8b47927fce6458a37784f7a1e2',0,'2019-03-03 20:21:13'),
	('85413db6888e0ff1003f0dcf025748e6a7841474d13d9c0f061885bc2fe4693261c4734ae26f2e35','49752f03f322eb7d32cd5444541e4bb2ea3a7b8648b00976c2b61eac5bee493051c2ab001e82ddcf',0,'2019-03-08 08:04:54'),
	('8618050bf1e2a400d1936424a920c79cd510013aca9d2b65c6beeb284b8b78553c1d37c3ddc24b1b','3cbd620168f1c866ac597f925b97a4d40c153e526d869ef23679a51b05eab746e889565256a88064',0,'2019-03-04 18:41:14'),
	('86ce2a88752c7635327287b3bf1ba66ead3c3d1fe595f4dc6fd5cef73929e2bd59131eb8d3553435','b0797d5ca47258ed5de0717125db175ce23efe6cc5c146140dbdbaf75b1b74483d0611643d924660',0,'2019-03-08 08:30:28'),
	('889aac25e51ddf300adf3a67cc90efd9b7badd3050e8bddcc8c156dc30d219dd91e568f36953e7d1','df3520879a5dc79d0c9b8767900e9e2890189e8b4c277896e724d7f813befe5377761a513199725e',0,'2019-03-07 02:19:35'),
	('891a77aa7cf2b3af3583d5deca6a71835a85f1d1265f521507627ce73dfb7b06d93ec50d6e0ec975','08135b811a356f30b0b53ad16d65f649fa1c2dae3804d295f630e5693226f7666bc6cccef3f44569',0,'2019-03-06 21:49:22'),
	('89b95cc777b74a7181c9f1f5f5ec7d18ebd1c8e6da4b9e9a2cdcd238f315a7855d53e9f6d2837f3d','9d80899f8542c86b516ffc6a8fa2cbf30d3374d6fef0de1199ac2f4ff9700006c2b860e2e65abfa2',1,'2019-03-06 22:55:50'),
	('8a4d1a3b21df245ff5a8c3a4dcbd1a833ae6e8d701499991c1c24010f45b9dc4a2860ba699fbab49','22d3ffb8737886f42472584a5934b1843321ad51bb48cd27c72ad2c34039a9319f77084ca3205193',0,'2019-03-07 10:57:14'),
	('8a7e91e81664e8aaa9b977b8cd62574373348ec7fcbf34e8861b7f9f82f5ce85cf92ec0ae39bf363','e11f6ce8ae922f10d31aaff0dc026d18b14c689e819509d375d131febdb1b05e7920d1afe0917cea',0,'2019-03-08 05:51:31'),
	('8b38d3a93a847f268686f417f8072f9d74083a77eedfb8faca93c7bb344def1a8b4a55863ae7f79b','cb1fc65b8b5a9a46e6299070ebe007cb27928f1869c8677dd7b3e262e8cb928760cb41101754f2ba',0,'2019-03-09 02:56:27'),
	('8b6820e50b2273793168ca2193fe17799eab4c9777a2c3ec53302a6a0ea6f06508bc0e89795acdfb','92ff5314eb60f1d11e2c0f8a65338bf29f94f69275694c82bce9afcddca59733ace6ac72b2b1a2c0',0,'2019-03-05 21:42:57'),
	('8eba0090ac96400c51b974d61fe9b400a5a57c06e9c0bf1e7f8219829c94bdb7a029820f87c8d03f','9aa846c85e42fb673dd7ebc73e246b355cd9acdd6cf0803fd8cf32cfe206907a5555a655bff5e09a',0,'2019-03-08 06:23:44'),
	('8ef631127af211879a7ff8967d95e67ba73a768ad3af4b1730d03c775478e886993ef37ba1002ecc','be45d41d1e1d581453fab7f1686311ac2eaf8fb19abdad516972457f0ad1d69c4f0e7b7d25586739',1,'2019-03-11 03:18:35'),
	('8f53a410cbbd036f105ea512fe8af317706621a0b9a3e79efb360ebc45d64bb2a58553b3a29cf07c','fff4c2e2f95790f3f46254e2a5eeab8d03763e137c4257bd0c77880875bc1dffa2ca2a9065c06916',0,'2019-03-10 03:48:24'),
	('8f698b70ee548cda902ca680144ce10a200d6dd7148d646bebca672aee2799b81f484765318fe8db','e197e7332838e0e57ceb48cfd60d606c200b12ba58f2c05b595aa63a686b9ae634a5cf3ad98c2e6d',0,'2019-03-05 21:40:40'),
	('8f87bd993e6c17aa71f06726ec9e48143e974a0d9e3d6a71ce8bbeb5b85a5d9802994f99a9b568be','ad052cc43f18d5255b303487518d0416d6c44b5c0de983199673f15a42d209f1c1c317c8990ccf39',0,'2019-03-08 08:38:49'),
	('8fc2b3167347ab358a69e7248d62dae3c402a7e1a1ab1c880bec23854f7781e1004626014b8ad04a','c6fcb43f7ad086eb192f13b609efeb7c2a937fa0358b832a07198cec3c60283066f4b1aeed6e45e5',0,'2019-03-07 03:36:22'),
	('90df0777884dffca3551e381a2bd02fd7c1516bbd7afd0b28311eed601aeb3360f5b8a8efb6c19bf','9951590b51eb6b5fbc75fabcfd666ea8074daa18c232c8acf196eb31d31895eb6cfc02d8f249005b',0,'2019-03-04 20:10:25'),
	('90fd5203dbbd70dced6658a0cd3a4c8f3d42853d51a06a58fd4a40b2b26396a21f4bbaa75a863b47','bbbccad6c116c6c9d09e752cb4fb917fa3e7605a8023d535a05bf795ac15c8ba333134e03a906d97',0,'2019-03-08 06:18:09'),
	('913b609968c39d3bd414a9e83f1df985d6871aef042ae27518bc9ebe9bcc44d1920609596cd40e53','354be5f899380944d87be0785abf0a62354f5cedbf03bf00ac4061148fc234d0d7e756abc0115090',0,'2019-03-08 06:06:07'),
	('9145ffde59ef560c0bd597e825597c08e749611532c8d665d9d4119983ec5e94c1455b53e6ffef2f','e36741c5bd721da38e9c137263435c7ff8894a6f12c6a60d903064d1f5a2803d03ccaaeb334553a7',0,'2019-03-05 21:53:48'),
	('91dbf889211c147b3c267956d0f398018251462db5f041db030d4af1dc940eeb2c0f7e007b05ffcb','9bc75a7d020aabbf45ffe1cd28cbabff411cded8cfce12c23e2a07458ac2a8cc9dece17c98352904',0,'2019-03-07 00:52:27'),
	('9303befa88779765e513e9cc78fc85161b7fbfeca049a1d545ebd141fa7f72bdf6f5b3a93a9b9ed2','4148517ed04c8001f9bd4c02160becf7ef41be1e08b3771ebc10984836b3188fc674bbd54fe3aeaf',0,'2019-03-04 05:08:47'),
	('931df543e6038f014034cb747bebc38fec271fbafe5a987e5cdba6b3b0cd0d02dd836befdcbf992e','417ea557c880ed5c5e6b76d9fb20720a803f1ddafd7f49f23f57ba8b69f9db2b5122d5bf086bc3d7',0,'2019-03-06 00:59:41'),
	('93336b0f465888a1ec0fa525f548eb7d1560267afe77cf1116f6b24c175574f1e7e2c26f58933dfa','19fbae5a433547981452ba1b56b5d92867586999cbdf81fdd9986dfe40adc8338f4eb13d2600e9ad',0,'2019-03-11 01:55:00'),
	('9387856aa7c87f2506b6c45fc9cb2714f0a30b25cbea8441ce8edf159883bd285a99b6b680ea22f0','bd880c74121b90e29f9f599cb3f6b8a1351de5ddb4f7d4b6794db9d47ea6e6e3961808c62936563c',0,'2019-03-08 04:52:54'),
	('93bf304558a9570fe17359eec84ab1b79bf2bdbd6d2c6a5dd46323166b1cb34b844328d966dbf630','4ff21b8330b7f01dae7d97f12e4c093a47cc1c5f0825f5304cea3b1c810e6fc4e17922e03a5d231c',0,'2019-03-08 02:01:07'),
	('94acd92639c6ead3cad89ebc9a583b7737711151e3857caf6176abc4ceae4c9db2cbd7cede815a5c','e4741b5eeb9db3ce0047dee014e2e66fa43eade46cfea9f2dd256612a3058f773bd0d9497fb24a2e',0,'2019-03-08 04:10:03'),
	('952020aecc890541ecb087f03b25e55684846efacfd5eec79db6c2a42f75794e3b6d47580493aa05','0322f404c231cd174730c0a42e3b712ab0a2e1da2c5fcb9ab1dcb2dd55c0fe240b5a5c00bc8b8838',0,'2019-03-08 08:38:14'),
	('962b12fa5b834de96e7635522dece786d597702dc8d556eb70d7e0c603aa8135009c34336122daa5','2a191105c935660ecf39c56b0d0a927090e760ac0178c6ecbffa5ba46912d72f94c1739bf7785adb',0,'2019-03-09 06:42:15'),
	('9688d1ff6d0c0af4bc2652a9b25d224362336ba8df5bbdb5b464d90a9e9a0bbcd946a47007062cc4','1d58e6cbbe81ec4441c369fd5ea645082896621321ac843bf4b6d41e428c3b60b7e0319ae47aa389',0,'2019-03-10 05:28:53'),
	('973f7641932bb2a5c33584699282b3b4107c2794670a22a30e88476e90796d7db90c8c426feb3b09','2491c884d00c90e1375505df443b60ca82404aec62cbe192275808459d678b293e0d670ecbaa3443',0,'2019-03-07 17:28:01'),
	('9818f7f35d2fc13f9ef5114b2a4a9a8e97d89b6652bc63f01fc132c0baf83ba6fa12d9a1cf08b32b','7145f9b6f6fe0516e2af706d9010f9a35ca26a202f90b3b5b2773d56a5b8cebf352caf28b9b99b87',0,'2019-03-10 03:31:04'),
	('98bc78a1badea1d90705e50344ae534a24b325335afdc402d6c5fcdbcd20b9fcc6f7c3a82c082f8b','9ff548ebcb7d1401b5404f04cdf4b93fdc191caa4e29bfc28d6152a3591c412e8aadedecae302105',0,'2019-03-06 21:48:15'),
	('99331d4d7c05b4c384f5abbef64bc4f5c1a592812b78c729c5cdd0e82f99381fcac280b489b001bf','b2fc0ccf382085b4029ef15baefa75bb2e3eec757fc4317ef9d9a7ba3840536d51432160d17d1ce0',0,'2019-03-07 02:15:17'),
	('99c90705be0dc414c4246fbdefcc7a518777bef3aeb5d8e24c3252c368b4cd753fb7691bd417d652','6624e0aedace9dbb8aac040a225f7fe069bed9880e48b1a66a1ce54c306886de236b5719f24bd68f',0,'2019-03-08 00:18:53'),
	('9af7460b0e781ff89c636df8df84100045ba9a5841e2d33280ed75ddc20d6f548eeee57ccc31eb65','008fa3990e22ec940ee03bafa08a2617a6d2d83c65e7e024bc3fa1b2f28faacf60a7d9f128c6c52e',0,'2019-03-08 09:27:00'),
	('9b1d2812b6fa0590bd4c8e5b3de181e24102e9352d99d79fc300f5024ab9478b29cec55cf76c27c0','b015b6bfa8f9ae906bc179f97dc5890206afab57ff8e4c028f2ca84594475de65cc9a26d32aa9745',0,'2019-03-04 01:44:07'),
	('9c759ccfa3c2deb89bf000ab66d3d90f278b5c28e007d3d21eea9ba6ad55ae93b84b73c2ee65dbeb','6599aeec8bb9203f7bf8003016eeba1b1bc386594157b1e041cdbb2032aab69c067a9f5c74830436',0,'2019-03-06 00:51:20'),
	('9dbff2f7a55c2648c832dc9299f3012ebc57f8171c0cd6f9f9a780cbd9a7bee7db0402a998685037','f2a4afc472d4de02450de92106aba55eac37076aa383e6900dcaca08ff08b8e874f063fe182a8d51',0,'2019-03-07 12:10:41'),
	('9ebfceef5549c21cc23a9c83308d40c15fd12f602ea466dcf14ec121d08f745378afb42dc8d2ccbd','0a258f62db4b485646540f2010c01a91863f05f9406bd8b8220b3fa8ed0eec476129f7b49c2c60d9',0,'2019-03-01 13:05:02'),
	('a02b683df860f569fd42203050833106e96ab8d4a668ece935d1a2aba0abab750f8a09f991c1e35f','9ce84ec3785d07296b6f22d0b87cb50036541cf26a3fd6e70ac5fc77fa2375a3017a5f9bdbc89dab',0,'2019-03-03 20:55:08'),
	('a03bc4e6046c19358165726ca40b245194c7712ec1ae99981966a2b8c3d3c554b569dd6774c7b34a','ec417e8219c9f4517d60721f51a1c9501f4f1533577d29b5a405547fd88323169e04b4769d253c94',0,'2019-03-08 08:41:15'),
	('a0b9684108d00772987837d6bb7db32397386b871f6a4c7a26fc71b12920b87555a65f8c9235eb70','cc40fb865f971301c56a87b47ccc505f7ffb4a844eab453cdb5ddb7ebb9a06bd0c21152912ec1ee9',0,'2019-03-07 01:33:04'),
	('a20229382bc74111543c9eb1feb7bef40dd8f697d828f3a734a22f01969fc933278afa83be9918a1','723f1c59fcf8161360075ee26afd1da1095871815a2a2e21a15c63338981c9e0000577002b1e645b',1,'2019-03-07 23:03:17'),
	('a2a4c44ecd2b2aed533a81208d34e042c9b8d6c50c378114f6c74245d3d95315cf11d41fe5168dbb','497f2e082f0dab972d370d1a0208e468d291a8dc6d02a7318850427a50a827b0067d903e2c8b654c',1,'2019-03-08 14:10:46'),
	('a2f4a9436b17fae23b371ae5bfa9f4e7405cc125eae533e3de0d35da64987c083d29cc6737f26d64','1cd70ab992260b4574774055a7c52a65b7a784ab87b570d3bc81d1c328827a70188df1bf9e1ee687',0,'2019-03-03 19:13:29'),
	('a33355eddbe3bba3d8fb97055c5c89319a3e6904977bf5aaed022407ee2349933b99fe7528e8f2a6','78be56cb6c428dcf70d711eca4d217b89da712d525879964e2a186e2347babad8d0ebaa7ab1ccae6',1,'2019-03-08 10:02:58'),
	('a3613ea2a54cc1e183ef6ebd1062b46e5ce169c7fa82f213c7fa3a31ab12216db7f1a4a1cc85cc3a','87669223f5c85ea68d10ce62a3757ec120bb64c2c6d6d3c32a1c54726bb73b421fb6daf6f9f0e004',0,'2019-02-17 15:11:29'),
	('a4076b3d39191515c1220aedc03786e8d28bbb47a330ec56243573168f13a98399e4d149d4d0100b','7147182cb3fc84885a1adbb8ab09ffc7f8677d5fc583976db63fe9ea07f44f7871d94a27f2ed5393',0,'2019-03-07 10:53:15'),
	('a4ed7daabdbf063aebc1d964e526d73ceb87f78716df8214ba7b59018717c28140238b8acdf9011d','dafa6f0083555c0780fb31bfe992458675b02ad11feb8a90255d75315dcddca6401171ad346f1a1a',0,'2019-03-03 21:09:04'),
	('a5310e3602f9501d7481712d70c84e36591a152f5c47ca9c9f1987173806ca3b3f6ef125ab890f63','86db869980d602698ecf673f00a53f83f4e124f88f0eeff3875c39a1cad2b5bf6d927054dad3cc7f',0,'2019-02-17 15:07:20'),
	('a57297de02a1576789e29ea07fbf897185450bf32659c4d52882c2208cb4b1f6b246905530e0c68d','3306ecd1696967412e545f6b60dee89f05d7f8c1d71c88e34ad619c89a05bc0204c30de0e574c2c8',0,'2019-03-03 20:54:19'),
	('a5cff4f84bc202b0fe39ea445f3e1a1206f6dd396e8474151fed3a86f01b01f5c256f1d1fd58a326','7e72fa55d4129dacb44db3e35578562ec8a400bced3fa9dced31ceedda860418573400cf2db3dbc3',0,'2019-03-08 01:57:30'),
	('a63515522ecdb39908a10849e15654981e6de70c924443df21e8b4cbc4f27d5ea1dc781d0118505a','4c2d65d57f928d160bd995da45b44bbe19023b7885d8313655b7994ae6ff83889471a1c14384aec5',0,'2019-03-11 03:36:25'),
	('a6cf539ebdd0264348e3f77b25ad7c99a70877cd5e2b70e62b4062c59770eb9e47ca4978733fb48f','326c719a443887eb31bedebcabc993563eef25c09d112478b355f545be3b1012a02b2b4a3e14721b',1,'2019-03-06 21:32:27'),
	('a73576ca1940edb42a027e11a7574283db09fc80ec4e004e3e824bcbc4fcb9be1b6ceafd121a53b9','743e2c5c5a8b89071c5295a48ea7a00e40f01172f7ed39089f6d92d5c73c1aba1ec93d961f1e5eb4',0,'2019-03-08 09:32:52'),
	('a737f2900e8f5547c3a7b411aaf3ac8bf3e49478295adcd6c265cfb6bdcffa3a6d9288a3a1020f61','0ee65ca85b93f7e701260e3d2c7d2b2cd31ac73746c21699268ca472ee5f514545e19c24e3fc57d3',1,'2019-03-09 04:18:01'),
	('a82d43e48ecb9710c50529377e60b1de22bf00199a15d71d56cf9b3c4821808b81b5cfafd24b323e','e1c560b90440293ada9c58734c5811b302b064ffdb191cf7c642b35cf84e7bdfc606e6780937bfac',0,'2019-02-21 11:12:15'),
	('a867abf49d504686512b4a658ed00282aa482c5731f5203291160969b97bab9e37aa0cb3128ec264','201c3d1679028544580c6479a639a2dddcfd5bf0f72b411831b1f69e2893a1b34a81ee383acac5e6',0,'2019-03-03 20:29:34'),
	('a8b0052b9f886b7e1373c7b023443f4bd6e926f075f3982295932f04ffd1a2b29739bc56cdf0269a','e7215867bf97d704cb395b6ad8fa7f8f1d2d07fc4af05d36ca58ec09e19e9ddef90ce9700a8699e6',0,'2019-03-08 08:25:05'),
	('a904e923c4d303c7ddcaa987dc7b3b3abc40d585bd4169a30904b4bb6b2629caa5c1c65c70d1573b','174dd6a82fc3b54efcf5a3c4a2ea50d0710732d5238373431cbbd9f78bd00f4a50c776f1b62b86db',0,'2019-03-09 06:47:28'),
	('ab2ef98a9fb5415b1c246bb1a001df7f334f5aa6b284c6eba09e007cb9ef8e685bc83e485a181d2f','3ccc121972ccf0ddc9ef90bfccf0e42efa2ad5f0e0f99001f44d2c752e7fc899fc9136d73ef98cd7',0,'2019-03-04 04:32:03'),
	('aba19233bdde49d0608a96d6bb8bf3bf14d36609c57425ac078d16d7e59d7534689b3fc3bdb4652a','a67bfdd4534b6841f34d3d23a512acc928d6975abb85604ad7adc171d630ba85f1d11075ab038e36',0,'2019-03-07 09:14:41'),
	('ac0dc074fc65ed0d32f024355d0ade2b8e9657c907934c501a870a9e20a04a454a9852fdc92da7e1','dcfe4df80600b81e9e04c17dc3bb73e73e0160779ebd58ff8f4f4ddcdd9e8c1862e0cf891eb6d0ca',0,'2019-03-06 22:02:17'),
	('ac801cf7e8aee2ce8e04d9533e54bf11ad7c0132dccd436d77d126a586a5326db10db430be6507e5','8359fa621b3fd8e421bc1cbf3a65e594420e331ff08af79bc1a9cd305d0780903982f91939bcca87',0,'2019-03-11 03:17:30'),
	('acbfd5ec4b0f5922b91d4bdec40d037511b7296f865fa0b9748443f58339ce10dff8c3fe83657424','5f27cb1a0e025678e85b53ae3f36de08ce2a3975b8d6b2e1bea3eeea0e0632fcc3bfb94d5cd53151',0,'2019-03-03 20:08:05'),
	('ad28b6e47b66a9b1183ff747114069f543fb82a3be530c8a2f462d0a30466bfc45823bbc31f782fa','ac11adcb85ec4af55f92f0293cc08fa6b1680b8d72c64ce8a1d437ca120945556eebfa9efdab57ba',0,'2019-03-03 12:33:30'),
	('ae254c4f04cdb01b4ec7f57458db01e3407383ff2eb9f19e5ac682a5dae6894e5e8cf82d2848e0ef','af75feecfb475c78c1b489edc69fb4a30eb737584ff4172324b3715291a6e2f16d39cc6158df74ea',0,'2019-03-10 07:50:51'),
	('aeb4c0ae1b2e53bf4b8c949192df072f3904e6b96f3d265e50bd7159f287e267a8ff0e3abcc52861','1f4284cc3a3e179ff1b075762c61bfa7114085e97acf1eeaace88e09f3a36ee3a275db80b593e059',0,'2019-03-08 14:22:18'),
	('b0240a34f6dd2dec77f3ba6beb540d2b50ffc7a2b4590a73ba70a5183989d8aa4a1492840ec52e3c','39323f568ca915837d445df6c62647827b918d0ec09a3c71ec75cbd6f8b44ce22e37e00f1f332af1',0,'2019-03-09 06:59:35'),
	('b0fcb5c66725d04c216c54f3ff5029aef0beb004404b1fa8c0fcbadaad48b0e4307c554ac7a67dff','f01666ee53f3ce820abca81711dfc82aadd3de499297fddc49d245d660df33244bee69a938801244',0,'2019-03-10 04:06:38'),
	('b2d190781f745fb8f49f9ecc66b3d73cf4b9fa0b170fc3e43e83b8409e4488f2fddb6fa7f8c71133','22f36138c2db4da62aff3ff9109caa91faa8d5939fc154c0b7c24e7913328df4695bb53a9bc4689f',0,'2019-03-09 08:45:25'),
	('b33a58ac1d5e871682b80be090a7f80cebb0defa9b486f5790cda6990510b5cfd3606b4ca177c635','7a65236a8f098eab21ac396fb6529dd41a91eb74c42ee6baf4c717081ef7c366f7e18b1de2fad1a3',0,'2019-03-06 20:23:15'),
	('b3772492cb899693906e9c80371be2e0ae4530eb6990374a6fca7ddfeb714951c5fb163ddcf8ab82','60953484faec00ae6705e562373d8e62ba711badd581d1d68550ab635640c9507792d3147a10dae9',0,'2019-03-08 07:52:46'),
	('b387687daa44f3542b02c042945132f6230cd7a7163467a3f4d195c6e8d9613495178be09e4361e0','d47d911c293235a737ffa06674a7c0fcd4444a8c987196f7a8ee6afaa61dc4c81a8d3c46c0ff8db0',0,'2019-03-03 21:10:59'),
	('b4e31ecfea140e30d4a8123c55782d35d7826a4e7c12c282cd95e014a4d9df57f17472a9d5348ae4','13b787b751c263e0400048c01ff7cf7e93576cca17682ef73af5ed3ba3127ed9766180c3cd6ea7ac',0,'2019-03-04 19:26:58'),
	('b537e9825c3a02cc127f05b51368348991e3b6197e00274e3881e9d3d50690ea4af180fdb26b3722','bc65f296ab55f6d95e516f888239f14f40e603341f2a7bc26cf7955ae074ee01df5ebb45aca2e070',0,'2019-03-06 00:42:22'),
	('b61818985f41914af16219b114271f3574e3ab348a9ed68aa758ab584e3a5b6eba061a025f5ba273','a0f530c97570bff03eaa5e746d91e547349974056295cf24606bac2efad4021eee2bf452e07275e1',0,'2019-03-07 02:45:47'),
	('b6963d085ebba4f79bf4aee953286cfa0cf8530099dc709517d69ac9e884c450841d04a31bc45ca3','7c4c0de10986d0e8a8ca3c5adfb4ef13a3fe78f6d266e32e112ca06043b1583c8b75967fc922a512',0,'2019-03-03 20:20:08'),
	('b756324f60ff45150a16c7516f82cb06188794e4eb8412136d916a1f8e9ba9df0152378675f65400','6c797f541fdaa41e7ef66a9361f4484873e0680e5933c40db672f8c4c18fa74c61bc119f379dbdd4',0,'2019-03-08 08:43:32'),
	('b76c9ff9731f6b56c44fe72b85b66cc7ec7421134221c714e68fbe46e9417d90703ec70be69e236b','a911e37a7ca4eeb8fbaf165973115f14da6c26a8a3b48c71eedc43c18210288978e22bb579cc8619',0,'2019-03-08 08:50:03'),
	('b7a1cf8926ad2bdfd61f7d9094fac747943121a9e738acf04d74065b75e660b0d70fa0c0d41d4819','76c47a733f534ef5be6330c4658d18d5aa63d026216cc7387c7210abb9b0ae31103d25354a5e14d6',0,'2019-03-07 01:30:03'),
	('b7b66c42c9d63593804384d7b286a54824447eccbfd17ef43391b5934642660c3ea0aef03fc31f82','acb675f0abebda49611d1704a6d4d4ce341f3e92f96961a22d580733e8b128f7758ab0b34b016f9d',0,'2019-03-08 01:53:50'),
	('b8320f6c6dae2900a05ac14aa46bab416a51f9245b27da64f8ba9ed6b56cfb5ec4cea4bf9ef10b1a','e48544baae00d684a6f4a144946416117249ddc7a34efc14a03891b9f5e0f40b861af8a56422e1d1',0,'2019-03-11 04:10:45'),
	('b882625f1b9d005eddc612600a711430986cab0ffb4d307f4c8c4355d82cab88f45c6e93ed11a9f3','a26f23e7e3766bf8ecf6169758d4d2ca050e5441fd2f6b4e456b28b255515c3e91983bf2432c34c9',0,'2019-03-11 01:58:13'),
	('ba5114269045dc98f7b23dc29c67ec1eb7ed6a04d1d674495f0802eea98a73270359ab4fdb32437f','ac11d5ec4189011873a1c32e31edfb9bd99775b169a2138a5bfb63579a31aa4e4999caa65f8e16f2',0,'2019-03-06 19:22:02'),
	('ba7994e8f42ff6f03eb81a2585a905b3e44af717e74200b35b63d1fd9729ce4bb97068b6d698447b','4587d6efc9ed0ea2e8f4ea8dc6318103c7a3dc19c62449246a9cf21f27424d72d543ceec1fd3d33d',0,'2019-03-04 19:42:15'),
	('baa7c1cb1a9e848beea37c287f8d8991660537f65a7f45de440604bb03f03e653386befbcd35f4f5','4ec3747a90b7113b78b9bec555ea1789e754a5535496863329ee8e70775780824448fd173c58825b',0,'2019-03-09 07:08:40'),
	('bad7f7c90503773d1b1ca81348c6d758e09a6c76a86d1e1287334d7160c1fc33b67b0bcf750fd72c','68fbeef3bffac62a0ad4e6919677610ac7ac1083dd20ba766e6199d3fbc7204f9185ba6f8503e532',0,'2019-03-04 19:42:45'),
	('bb3496788988f4a9b2738fbfddfbcd5d7551be82a279d6adb07e14619adeda2369120ea6c62f2b27','ed51da59471a421059b9d2a257d608b3aba21e437e077a5b317070bcaacdd87facb3ddb66f82e9b7',0,'2019-03-03 20:19:47'),
	('bba2bee95e8b1e3d1c287b275df8301a806ef0e0d754195f81b58be097dde66e6c3f90ccda182cd3','33f9d83a3968ff3ae66024e3d8d1959ebca62f5b6d41b309195e333f29d731d86838734089e10bac',1,'2019-03-08 10:00:36'),
	('bbdff9f9495bee1aa6b1d5cfaee532c262cd3bf929e82112511589228899b44d8fb73ca8e12ab99a','afbbb04179c8143945d0eec3372d40f0fb9090855e7d62d2637f5d7b11238bea6393d7602d574161',0,'2019-03-08 07:49:37'),
	('bbf217d32739552717072bab5c10eadb60756fe40d7d254c2d0dfd653febd1d14991154f357fda23','ce0add10773d49341c1e39a5f01f04c560d58461a8e6bb923ad16e055ced7386b60c5070cac117e0',0,'2019-03-06 22:53:26'),
	('bc3c75820a7b1970cfd3b2570b252a39edef37bdc0eca079030c339e666afe21b102ff490deb09dd','4a29d6de6ecc9162f16a48db27acbf83e4bd9a4ba64b2de728f285281bf651511856e08efb9d1eef',0,'2019-03-03 19:14:01'),
	('bddde4fe9f992fbe9a384834c9479fe7b3b79ced7b7f6a16b04dc7f92282f60e2779c718ed99ef55','554cca4bf63e61f2d9f8441048a1a4b4f389dd34ecd89144fb500c0c5c5806174cb93eccba539f42',0,'2019-03-05 22:01:23'),
	('be75512b6e582e21658b43c89b0ac35a8215a5c7daf3f7ec4f5375a3690d719a947b7dd734267635','3b839c92961c4a6c470486f5c29f383f3642a89d6d3ce6ddfd6aeb4e9d30d9001a3971df75772617',0,'2019-03-06 01:10:00'),
	('bed0d292793bd5b1d791c928784b2d4062ef7300001c6fbdf9e687215456c57a1c2345469b9d2808','7dbd35eb59499bbdec10499f11fc66f14df9122d4ea427b98977338d2dbab69e4eee4329e3b37632',0,'2019-03-08 09:46:25'),
	('bfd81c01799d985ce4159644b16d55913771d5e1ac8d53054495daa7640c490885f4408e5ff7c11b','4edf079b0fea51a8ae92dcdcfeeb0dc8ee130257ffa6f8ef5d6af7b1584b976d8e56e981f1758092',0,'2019-03-03 21:19:41'),
	('bff17de734731bf89cd018b316ee49ea4ab88bd9d4db6de0262c6dec443b03da8ba5899863d14e37','de5a171b70efc78ea2ab1bcbcceb4cddf1a0805c8d615f65c35bb096d7144a799aabd8ab371d136a',0,'2019-03-03 21:17:55'),
	('c1aaaf1d41e6534d09b928905648dc004fd2fffe32b5709327cfc1aa742b62ae818c8b7d9617520d','39c2b72220b978eff4213bcf14ea2453e985f93c002eed90a501ae765267dcd67039f9e3f1d70b3e',0,'2019-03-06 00:46:40'),
	('c25f54b959ebfcf7c373ece499ef64ccef7832d6b13da97cced11e5d148e8e7efa1b1bf08731dd9f','e457a7e4f1b64a1d1b9b0b645c91456926fc0dbabe9e693ca45a07520999de289b5d54893e9a33fc',0,'2019-03-09 08:30:07'),
	('c35d7bd4a1f24c34e8ff33abb2fd5114fd11088c5cda98f046f05ac30626b9d6e2f25ec603676902','f71fb3dfad9ccb89b09af3155b210ac11f7a386a9e1dc07b5b87ddac76b6b9eade1ed20f95d413d1',0,'2019-03-11 03:47:26'),
	('c38d525f9bf627bd095995259b46fd938d6548a8962fa60679c6b35c17f2eae71e585559f3ce6e98','02f9381c8ffed80b895f459cc8c389bbfd93bff3350ce808ca0dec3670d58dd7c52ee5f10e4242ad',0,'2019-03-08 09:40:32'),
	('c3b34bc7a0c313eab416ef1c14b949bb2e5d1341d7ff5285765e50b0da07b37bae466652bf35760d','9d24d03c1beb3f75c78453ff01b24ab27a5f1f691487d54a307fa67f211051dde35aededf263caf0',0,'2019-03-08 02:05:25'),
	('c4a8fe8585dae1e1930d8309ab09de655ac9ce9ee3d8eac3a7fc906f45c109a6c650c9d4a9b927e9','31311a07073e08b238b728371128bcd7e16381d5ced254f96254965b9584c3fbf184a0d60165d607',0,'2019-03-07 01:23:21'),
	('c4ab98d7a600dda5f245bcac60ffc520d82c5d5a10e1d891e07b4078c927ba0edb9ff1da41dee07c','8688819b4192252df51fb3fdcc4642520c71dfe96b92f22ba5225c07790fd543de7fbca4d9cc4b8f',0,'2019-03-07 02:28:42'),
	('c4ceb0ae503019234bd0f820261ed3af7b75991b5187df0510cbcd8d16f84d77fcd8ba7fd26651ea','263a387c5e9bbee08a3e9d79aa32dbea8dd1380107cf32c777937857bb86a54822faf7a53f809e80',0,'2019-03-04 19:25:11'),
	('c4f3b4b2d3e38749062bbfd69b5a245ab1fbf1d69bdc9455d6526a1ce8a3b42616ece10084340fe8','63acd3fd87c49072537e394d6a8489982608b0efe2a6f47deb9e8a7d5306bc3b5d1a30da09de5ff0',0,'2019-03-03 20:13:37'),
	('c52c3e022b7316eb608c9ab371a7aee2cddc7e673a1c86dd831af314e3827104559aec6d367b4b02','cb6480031f84d02b24e21cbf194a4bd14453aa3870a436653558ceeb4792c8162100b388ba8f7d6b',0,'2019-03-05 00:08:38'),
	('c61788066e241cc43a4d82e7993b019864aaae092c52b47edf20728a43e2397e39dc73ad9fee34e3','eb8b02f703608b8c9cdd3ac184cdefd0bb0bde0c25723fa81f3c9f0034ec41079475306828c21f97',0,'2019-03-07 02:11:56'),
	('c6442293fe2753d6df71d7fe7ff714c2d155ebd3c0272443e1df41048b6166cef4f1681eefad856e','5ab6a755b97f205ef27234dfe86690f73ff556e3bf6916832c5f7ff0f23139f291917d59b31896d6',0,'2019-03-02 12:23:03'),
	('c69a02348674f6c51aeddf5838d6c8feb4da897a55752eb28c9aafa1b1dac6493492fb68771abd25','6b99d65d10de52b85c8570aa1458ad6244fd25ce84d4dd8359331c3fb92cf9a7c5d687bc081a98c4',0,'2019-03-03 20:26:35'),
	('c6f23cd3fb389be3eb1a8be4f7992d16754b5a9fc8f28f2fd59f6fe4d10d50e04c05ac2d2d7977cc','e4fd78e26851b7be0543bdd5f1fab93cbf94e52d7c2de0bc2b0f1b701cf73aa113f985cf5ad7f76e',0,'2019-03-04 19:23:22'),
	('c956da832e8200deb733d3cfe3ff2d5ad0419a51d268819b517118b5f2e71fea12fc78ef6dd43b07','a8ece6b33662061d3a2bcd5650c692c5bb9570da5a75b2edcb6bafa3e3a268bdd8a7533ab241438a',0,'2019-03-10 18:58:16'),
	('ca7cf02c35eca3f4afd050e077d2aca78c8625fdbf077a59c2b1557756ab62671cbec7eafa86e15e','9d92fc09c7b1ca3b75723a356a330ca160191afe8c25c14dff9a26d28a7ccd586c0e2640638e8536',0,'2019-03-08 04:53:23'),
	('cc03070cb3bd7a6c405b69ad88542dfc0c97242cc6edceeffc937df6df26a928325fa2f8ee47f8c6','4af8d2772078b10b87b17f6cab0ea9cb70bca0cb5215f8793a5420875038a1795d8a02cf3472a472',0,'2019-03-08 01:51:21'),
	('cc19dfc89488618e8d4682ba564700b0e37a864c5bf184e0a05101b7d0c38f2a6e53e793a8c43943','ac09e4d7a94663c89aa00f3d7dbde62c63642d51e17d497ab99ccdadb0285855255195e8703efffe',0,'2019-03-08 07:44:31'),
	('cd114cf0ee37b76c60987664f41f125398c0194880e11001ac90392132b87eeeb4f80c6f29ad6505','94e275379b88821c7844fd73ad0951700417a1adacd0254604ed483ccb83b0f815d53b909ade3d01',0,'2019-03-06 21:01:49'),
	('ce3599e31339e9e55c63056566f810dd7aa01a1fa9d93fe811f4c4050c9014e5116d3acf05e5cb70','1c18c45eeaab85d937aec7b81152243b89750907e906f5f01ba92ff19e9b350a848f29627ecd9376',0,'2019-03-03 20:27:33'),
	('ce62b9014e1b547f035c8f39126ccb942afbf15cb89a117bc58548225b7bee85018b7fadeb8fdf68','6684e231bd1784b7cdf256f9c114fb17d145623dc4b5fbc98da282a5a28ba9b6bfa114c7228623d7',0,'2019-03-06 19:12:59'),
	('cec7fe9dcef8a8f6b26348f5652edf9f52b1efc647114a10829042ae4ed9144228587affe8da862b','11813c5550e94c5b8b451dc706c4a0e7ef3bfdf9436851c7aea0323fae53c6066087fe7f08ca041d',0,'2019-03-06 22:10:04'),
	('cece9ad8c87b00da2a4153ce3472dab2f043718e0c5681c8f0826a2b9060ba3cd0f5ec946bc52a1a','841a33f2164baab00d7b681051d7ddf94d09487358357b9ba2055e668f76f64a6978f8a717b1855f',0,'2019-03-04 20:04:38'),
	('ceda78d85da99eb1b267ff0de50fc73c8d8b17556011cf1cddbe8074d75c07a0add06e8ebe620564','9db9faab6f7e8826313ae70ea91f3794cc252047f805055de26bee3f8fe7863a65fec5782525dd5e',0,'2019-03-08 08:16:57'),
	('cf21fc62fb54587db25f566206f89a741a0dd1bd2f6ca9ece1a95257f40fd03c7df6509ba4a4ed4f','a068ea8a88fe78692eb93cb94b08201f60451c001b28cba912303055cdc41bf9c1a8c498a216b5e2',0,'2019-03-10 10:28:56'),
	('cf7179edb6f80eaf7b44ec236de5811bb1dad245dc67b1138b575cf61031f448fc5a487029e58849','1912e87b5b3e6bcbf391a15e8a8e6e49b0acc15c5fd00be6b58004d04ef21ed6c9c341615cfc3525',0,'2019-03-09 05:07:41'),
	('cff43d45e05f7fbb107be4c4031f5886de202738662148f13111ea2ffab41c7d2d0101eac1a6b038','247250d115d7817c19535502884fbe3e49ae121e786142d9f282bfeb5615799791e657112c03530a',0,'2019-03-07 03:09:30'),
	('d0aeadfecbf01992a74a27cfc0df0f8351e38fa15232d993b723ce6dbc4355eacfa33c1b97914dd1','172e0ad13677a887083c5c71799cdb9f800bc45923d55ac50209e9ffea4fcac73978f672e6fc65ca',0,'2019-03-03 20:19:46'),
	('d0e3e0469d99cf2f45b4084485fc7dfdf8034ac847be7139855353b091ddd184dcb2fa0580fd3bc0','8d323ed4572af2b6228546ad28238ddff63ed0fc58f08fdd0d2309fa726fb251f1d5a779bc9428f5',0,'2019-03-10 05:32:02'),
	('d1002b319eed4116db2cdfb9ea1819e2253e417106f73dfb19fe62ae37f4dd4eaedf7f0509896009','df9c31fba24c89e7b8be162501d7ae3f91d7aa33fe499af0085906c380fce85ac7a83d7af3923869',0,'2019-03-08 04:54:28'),
	('d2b0195cb3fbc5913240db2769f1b1cce42a23daa55d0d9bdd9fa0b46a1120db927be46282fc59aa','98c46703d3b6569b694d2ed07b5daa13e85341c3f43c41bef34709a5d1fcbdb78ac1e54489f44d15',0,'2019-03-09 04:09:01'),
	('d2e13aacf2e10e2bfb5ec1145431462b5b57011bbe8b9b8eb5472ba002a6999535809e71e2365129','56c6cb626a52b8cae38e799b838c97d1827d052c873c63e5c8f5ac5fc3f0c85835dfe6a16f732d9e',0,'2019-03-09 08:23:31'),
	('d2e6635e699e52abe3720ab8bf01c7a0a3a099ebed1a223ab197dd571b2acc2ae7b39280f888170e','759852ba7cd5092e00f324945f4789d2530919511eec27a0edfcdbc93f1b1f6a9c14fc177f58a9f3',0,'2019-03-08 06:16:14'),
	('d48023962f61004339dae323ba6930361df59ca464ef6c3764e7c2f29def3fd014e7318da29dda17','e20158d92f9099772502d933600f2b336f4881af4acf83f3fecef20a6f38b071b3e8289095744331',0,'2019-03-07 09:18:55'),
	('d59b19e353c16451f4ed7ef18ea6758d14ef49e79541e8d7353883f4997fb1737fa4345d3bcff8ec','585cbd9abe16e7fa34a7ae78c8c1847413cfa3b679fbb4b745c08eb8a2979d4c85a70684cfaec3d2',0,'2019-03-07 01:04:06'),
	('d698089e9d62bff663342612c61b1981287567109c20a4879653208f70560830d7c5440abad9c280','70b83f85a16a5d9271c1627db09e06820cfc4ae1172f1d4aef0fc254c20c2129849c82292ad90455',0,'2019-03-06 21:04:57'),
	('d769aebd97ddc72f1896186f5c9bc554afa95281a906730278298c351aaca21cb4baa3cd9c7463ad','6e5c2122a67cee264f1c9a0ab21a73ee148bd25bf90abc4099fd7f6916751ac5cda2bef407a4f368',0,'2019-03-08 14:47:21'),
	('d8a0ff990f28b7243dfcdf3a5cb29b738344f44dcbd3d8f8202b2d6f6acf23f2bd25c362de22cc80','ea00fcad2eee99f2600520ee04c258e6c226bf5175272a6477a156f17824ae2e73905edaa1a4e85f',0,'2019-03-10 21:02:43'),
	('d8fc4532492ad8bd507f8ab702d5a7e5a7f37134f153054c7eb47f37541f6a65038e43b098f2a420','267413af64acc4b3c48c53a932965c67b44c7c13ef433a39b39c873884c835fd70a19229c217eddd',0,'2019-03-06 21:07:30'),
	('d918164c728cd01cd40e654c7f04dd51677173fb3e5d170733f15432629e3d9f3f8fec9f94cbae79','ab4c5ab604ba084470595d07719ce9df125a01330889a35060013f8303797264cf3b7173d1418aff',0,'2019-03-08 04:45:23'),
	('da2f2f3aa18cc331927ad1eff2177169a9f32d7021e226d1bec3c851d73c28c5d38595f92515f4fc','45374160230c693dde8f5532ef8922d793dc381340d5ccabaf0c7415c5cf2964b4f49701e22abc6b',0,'2019-03-07 02:23:30'),
	('daf01508b8a915987fc89ba2ec8d5ba2bc1668e4f70212cfb857a570d8f5cdf7fbdc3f901b074ad5','d5cfcafc09dee6007207891849c8469224c21b199bd6432193a0ca9464c782bdaf1f06ab3902efdb',1,'2019-03-08 09:51:43'),
	('db52c37813daa28402e834eb04e3fddc8903176e25100eca2c193481b0b125e23bd0c18177854526','ecd6dba6763dd5303c4f068b0d39421a4d3e26a32691f664f4040667f21148a23eedf873bf3c8077',0,'2019-03-10 05:26:21'),
	('dba06934a17043dd5860f253bc54a0227de463a935e40948010c67b088dfdd9da8aaf0d48a6da70d','797f829d95e57c2119c0a24c24ce498d993a3c51b6b13991b18a79553627ef1f96bb0e000b372478',0,'2019-03-07 01:35:50'),
	('dbfcf882d7602cb979c279870e9c1d699849e17012dc4820dd4eac9c12f141cd70fc2ff35b059fd8','9ec6128b3e82d346d13ce53fdaab67eceda057f4eb367b948ea250bd9a49fb3af91571f2ff1218fe',0,'2019-03-06 20:13:32'),
	('de6d97e6074fdbebb2013588ba1db89b53ae69b4b2fdeb626adfda47461cb451225a056b9efd2e4b','f0b35bb90ec265294f439db18b5d455afda2656e0826a6f4b9fe9baf6bd346068a5808b5633fbac0',0,'2019-03-04 20:22:08'),
	('df3b38f01d65dd91e7506c002f2aa66313475a5ab39e2d11e7dcd2812c2b1917e797a69f1ad61c99','5ee88071956fdbc674a0254f3aeb4b48cec6740c94d7cb020d9156ab3e7e62910d38e3036b4029a4',0,'2019-03-08 02:02:32'),
	('df58e6f8c73f9b0cf64dd84fcb0522b4a2b9520e9cd41420ab0759d462ddfe0c1cd5197cd615bc94','6c96c3a1b65b0baef9047c3c5031624d755ba2ec3fbc48d5b139b33143ec59da9c6bdb9dabc1a7ee',0,'2019-03-09 07:28:15'),
	('df6b9f7108712c52de6fec83b1716d88ffe59990a26d53b33809bedc1bd0ce6c30d77dc36939339b','f8847a575e833d0222989499baf55ea126657681cc83e18f9d229577b890170f589e59573e775c67',0,'2019-03-08 04:55:18'),
	('e00f1c5361f6e32cd9d28f2328340482f66e26d431f8dbe836dbecb76685a830c2014cdfa2886523','97776b17400fd0ecbc3047253ec1fdba1ab9745943db3e4701752114845286b474b0dcf58868bcce',0,'2019-03-03 20:51:37'),
	('e0425958eb0c660494f641ba9d24dfbd50d76eb28e202b9eeb6fe1814fbc5aa956b3a24c2e06b79b','afc84cf5000b1dc4d7c5477f06012fa27c6bcdfbe6ee27541b7697439c92ca14d0450000d3b8374e',0,'2019-03-07 17:43:27'),
	('e112ec8c8b86bead4b2ccda7df95c1db7568b064d22ce16420fe3ffb04c798ffc068e9b482d359f1','47bc2f1dfe28b172c6e03d51c7748fde50fd7d089f8c5d9cf0d7b136864a71f7398c385a0b1cac24',0,'2019-03-04 20:09:21'),
	('e1a5e4585da370985ebdb80251a5419ad6058869caa7f31165101b120dd0c9d5a3e8bd51ab6eb21c','597e37b0de731f2d54ac231d231dfaf796ca73ef6855ad58071b32cc5477b0aec18a6c7a6c8ce4e2',0,'2019-03-05 00:19:54'),
	('e1c1d94a66bc1ba6699e75dc0ff4d128a55e97719bf89470fb9370116385d4eb37582d8bab6279e1','613dd747998e725433571d0227dd2dca20dd3f9e225160e2680639cdba35db019379b52029efc926',0,'2019-03-08 02:22:09'),
	('e1eada712183fcfdb8bbea0d04699df2f3aeeac2b891e00854488317919f38c8769546566389dd22','410c1729643a82ec524192aa0747cd0495a47aa3e693c98a25d9b24b163d6254f460b4adb780e275',0,'2019-03-04 18:34:57'),
	('e256267a938f68308bc12ac5dea1581802559e1282469aa9d8ad51c83f58f219b704d92b5e09fbba','2b2f8c51f39a5c038fcdb90b00682802e4b34b10ea5023043688aac463aa44b76ca404e833e4e9bc',0,'2019-03-08 08:37:27'),
	('e25d06486cd8c3c92da9afa1a11910aa85d84e43c5c0371857a923a2f3797e90cd3025b74b9fae3b','be99ef08a0a07037a73fd6b1280e3528903a8a0c6d9999f10206d55fc105a519b8be651fc9f5c49a',0,'2019-03-08 04:21:22'),
	('e2fe84e1252c636b9bf682820cbe97a3f19c00671bb412a1d0e3c44ac42350081e8a31a96dc1b482','e8bad977076fd094959282805420ad257eb0be43d84c360cc6874bd834ded422f6af5555c5090546',0,'2019-03-05 21:38:00'),
	('e427263fefaa7b264d4ad0579004f7ccd8f2c11b4186616123193fac9e4219c339199bd48d3dd058','04e56edacff4fa8e34083ab69a8d646af9c18bb55fb4f92e4098476bf6a61258fe2301980cd4b1a8',0,'2019-03-08 07:32:35'),
	('e5dce47a13f397968be670655d552e2cb5742123412fd9f603e3993f2058fcb78be0758cd7396239','73db1d2fd7e01bd8a33d7b41d32642c7364cab7f803878eb0f343d8177c9ff0398986f4cdb4bbce3',0,'2019-03-04 20:17:19'),
	('e6af1067bdb94efb15945bad1986d0c7ad4e52a45c6f56169be0702542835176d70d5951d2504aa3','3f347fb64c10f17bc9f9dd2bdce5e8f78a3fe8ba1462f8ebcca3d50b35f16764ea6cdb29fac88378',0,'2019-03-08 08:38:03'),
	('e70a211374668205758fa3a5401d42ace2df4dc491667650db890e56a75b013a94dcee56151436d0','1bac740acf01ad9d3d18fc38c841a30a1e742f93101d6c485185b986a6adbfa4703fbc5df2685886',0,'2019-03-03 18:40:30'),
	('e82c2e9ba9275de36e353147ffcab9859e1b7446a7b23de5ed5211ec60124e471b1e3bebe7561052','4434e7e286cb2f88822254d9957754a122b6b2d7e86310dd81ede2f782892f51c8154ecb0e903af2',0,'2019-03-10 10:34:38'),
	('e85ae487f30e13bf5f278b040b84723e9412bc5ff4a843a78881e75cde01e08271957208770a8f58','13f1a8f7eb7d8d07c1c3341254c4dcd8af78b41a9b0d11f3e854ed6df6b64e34aee686469aa2a908',0,'2019-03-08 09:40:50'),
	('e8c652735d7442150ba4aff35b66b5ce74b34636c9f6531c817f78cac8187ea95853c814e44bbf28','cda0198a3e2007930ece130c580af608bce74c08a0d629f77d64dd7d4ca93876d4c8e1cbd814297c',0,'2019-03-09 07:19:39'),
	('e9228fe514541e1efb32ee741f1c7c8dd894bd3399ea2b224d4b4eac2ec4f2501a02af87ca85a969','3a4f7ec1015ea768f37b23178f1cacf19874dd5367f284008dc92f4fb843a538f6a506db25547d06',0,'2019-03-04 19:44:49'),
	('e9e1b2fe2677e8015a15dbbff56d8bb4eb43e155cb171da19325962b3e85307e9065f95293e0f1f3','2bb06195013055c0470ed451d7632a8e3c5050159abc8a2f4a946f8cf3277b41ecedbcb10e66a4bb',0,'2019-03-04 00:04:15'),
	('e9f5620d3b91999ed9172b353b51a4c4adfdd9aedfcf29f0c4b50719862691e2b637ff7c7b88efc3','ffd1bfc63e93827ccbcff66a574d24fde5f58ceb839426a7d812f6ba34df9124fcabe4e0c581f1bf',0,'2019-03-08 09:49:34'),
	('eb2d3f5044ec8211fb6b41bed32e4c4f8ca05d5e026af220fd74bc5d12f8fb0097c5fa1084609483','f040a3d4ea687bf268db3b4d6c223bad286435bc2b09aff5eacaa172c902a9b7e8801f4ef37a626d',0,'2019-03-08 09:06:17'),
	('eb5793496d1fbfd85c8d08ef4b28040dd9d74e369ce68510487171b25da6ee4a06984e5223787472','4198d6ecc20ed26dcc777cd88d4e094276849519b642b0259da11114c00d11ad65679e72efdf19d3',0,'2019-03-06 00:41:46'),
	('ebe00e9ee44b3eeabdd2c5b73a7fe4db304c609f2726f48d4a9a5ce3ffee94c4a60cec8bd84c7b2c','f15b96c2c735e75b4e811aa1e587e3ed1c09423d03de535ff76479e5f203c1106325dde187048b9e',0,'2019-03-10 10:17:53'),
	('ecd12355e08e647103fe1d51527169da761b9b92c6a0ec67c5c3c5efc044024943fed6b02ddc6af7','6fdfd37f78c0d97000e72dbefaccae99a61cba8521ecb44598760cf24dc8c6bea09f2942bd604ed6',0,'2019-03-08 07:41:15'),
	('ed613d95ba3b0b70878266e80f1ac617209df6513782ac52087e48f4bb35b2279f9fd4d824bb843e','0228c0be145733fce4ecd89f78d977b4a7a98da70f450522e5d415d56157ed70d3a137db59140431',0,'2019-03-08 04:34:15'),
	('edc90f9a8905e76cdb0e17f16d80cc121f4ce7efbf265f33ed54b40b590add7b6140adce2fa99446','af2fc45225b2faa9b4681970f7141265d9753e89fd6234ff812ec5ad78c5d22842fdc571e2d04ac4',0,'2019-03-09 21:42:10'),
	('ee586363a8eb7eb48e2a26e7ab7cc8914251a0a26344a30422d0dd8581da2a0a292125c96018d111','f87df28b87a7cb06873e5a90ee782a6ff58f6ac637e881abf22c3c606582154eeadbeb753b4889b2',0,'2019-03-06 20:52:19'),
	('ee79deecd279a8af421c63faf3bc649a0b64d59ffab7872cff56b37429de97f76b58845dd77d9d04','24df63a844da9de198d0a30c8b43e1498aba8e64527488d17671421614fcc0ac2d7e6f086b4cf05f',0,'2019-03-05 21:33:26'),
	('f26bf60e0ca7553a64ada57494d9230b4c4397f52c802611b3b76b81f6f8535584916f080489abbe','e179e6b0121dab598429b98154df249315fce8661696483e4807b77390ab77022513e77091ea53cf',0,'2019-03-08 08:36:07'),
	('f26c30a64710e5165bc235947ff2778ada7dfcdb943248d4c4d2d2c1f7bef64caf940a171e2d64ae','4a3b428247a5cec61e3e81173157d86641d026445a1e80b372bc40546421e12fecf839e3a1f47cf5',0,'2019-03-08 10:17:27'),
	('f285f8f4289499eb90a2a71413c726ab6e22fb3ccaf1523932e653bfa10360484a51d99854d332a8','97581bf4fce77f2db9b92d9adc501a26172665e05f0922b9ee4e0b24e6194923dc2e44d32b5a89cc',1,'2019-03-08 16:12:08'),
	('f2b3536095654979382b60d5352c4efc972369d87cc6fc624648ad986f1df129f11fe02433068ef4','13b477a7ed8ed65f058e71a06dd6cabb77077e6a5051aadbf55331aa9d95531ece3710043c230192',0,'2019-03-03 20:47:32'),
	('f6195323b16fccbeda47d4f1180652c2c91ae2bc67db513520edfd1eb03765c727ebac9f59e3a105','c0dda90ae133e3362f152be7fd1b846e82a9db158af184ba7c639f233aac9581a5019ccd41ea2556',0,'2019-03-08 09:00:26'),
	('f6fe56f3b6095e2e077e4914fa8a1925ed2be054601873d403cfcdd788c39bda49ee7766a5ff72df','78533ee63943db8a845bd4178efa41a9b7352d199e30fb6119819b03996b6eda9849f9bc443f2144',0,'2019-03-10 09:59:14'),
	('f71bba894cf2cb14afdda95e6b5d00920d7d453274fe992697792c4a8c38ec272b8b8868fcfd6370','ed007010985cb62f4e4dfe87e54a2159dc9491cfc70d5ca4113eab04cc51ddfe64583af50875a200',0,'2019-03-05 21:54:46'),
	('f771fa0e6cac46867e9ad8a0d0f40796516615745f6286ff3ee877da560e9b7ebc28994e7b19b10f','8de669a8873d2ec23f14322cc59a611709f5d9981a2cd58002761dd136595a8186a2eab0931b0a9d',0,'2019-03-08 08:49:26'),
	('f7dbac150379c86d925cff9b3ec0872186fb62144ab9fd538641563b6a0f87bec361ae6727ef6c82','fc66d7dd0e041f3d574647cbd888d1d4b9ae880897df0d5fe29fef23e6c58d1ca2302a34e46e2925',0,'2019-03-07 02:38:35'),
	('f82a81c77a8d465cd161003edcf643d0f4d8be55b07e0abb63de6ca69e28c18509b225a2675d9896','0a35ff86222be05af25c0d0d1f32aa71841a4bfd22de0526f93a5ada91ddedacc3ce7bd661aedfb5',0,'2019-03-03 21:01:23'),
	('f86ab46db925955edee0a1f9d947d1243ac55a17e2502697eda411d64cf3b42c05518f19ae8bfbd0','ce9ef6db4bc7564c34bd96d2725f6812faa63c8fc97bf8042aa256ea819d25a26d465c126cc18bb6',1,'2019-03-08 10:11:39'),
	('f88c04b8e23cc613031e9527239740e560ab73695f284c52ec8cf26e3c1a5ba411b541fe62b64f64','feae513c2cfe0e7c188faf6f14eb4984dd13e003c820c9cbdfb5577bc77060516346cb1d1f969b19',0,'2019-03-06 20:04:56'),
	('fa1ea7e54b3578209cbd3d9da8b505a99c87389767c62c0d0737a550309e3a3470a95ccfcd553878','a4a22e052c67b855def199d3320af7b2dc4228110d91c6b8ec8159216804a0ac5d58b852b938cc1a',0,'2019-03-04 22:48:12'),
	('fa494c094490076f767655888533b14586c9ce4a04a644701b8f1d20e4ff2143ec940a82c4bf4c0a','db05e6e67719e578638252483ba05092983a65464ae1c85a3e06f5a2d8518cfa20d86f95d7102f9a',1,'2019-03-11 01:43:23'),
	('fbc211c43189644a2e60a0386aa25668784e5c2dc882fec4c8a020749dbbf907092fea7e32be6f56','f1a930857063abab156b0a6f67d0c0d1bef9b43867ae7e7af2e13e0164a829d6891b9498cca4f37a',0,'2019-03-04 19:53:49'),
	('fc0e5d91935d2b4ab01a241b2f824dee89cdf31b3705d0ed2706f357ae7d67b0b2a1082407d492cb','0293ba07c1de493f982200542866f093a8143be827770f6fa468eaa15ac52e068295da4e32faacd1',0,'2019-03-07 02:25:18'),
	('fc5c66b4d8721d36f3cdaace045d1850bf55d83be51b5c85297a83977d46c2b0f219508655f46afa','c3d249527447a2b84d478e4e7e0ddcd2da5b7fde22e546e6a938a2a0e0de72c81235d1fc31cbb8b9',0,'2019-03-08 09:44:56'),
	('fcbb3f6ec2fbc48225afa5b203fb4aa996343fc5ea3b6c4d97f9c734a31f0ddc9d525b3d9b7fa5a6','9e16e9f4dbd374716c786bac323ee24e219e8b4316b9f3010bfaa07370c6273a6f85fe464e2b1eb6',0,'2019-03-07 19:22:43'),
	('fd1ada23c27e4165389b2107d4e85e90a2afbe8fbcf4f900b2dd505bbd2bdba24d5d9b38ae8ef5f9','91d9f6a455d749bbf62052ea29b0da6dce7b3d1135524182f3019d72a9c1c705754fcbc3635c598f',0,'2019-03-04 19:15:27'),
	('fd547ac583b0656d204424784d3bd67289a09edae3a85aef7a89a1c184d13e6e78584fee704da4d1','1bb39a6e3600bf46a05fc209f08f121b64d96cd7921dc3bed53b17dd9d6a6279784a51cbed20f874',0,'2019-03-10 07:10:29'),
	('fdf3721b9179de1bd48f3d96c06ef2a71fac8f768f1a98ef88b94ba3499297050ab2b4a3be277292','3685285fdedf8c9172c2d58b3072ad9e3e149cf2c043598887663850140686f6d03514b7bafdcead',0,'2019-03-08 07:19:16');

/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'role.index','web',NULL,NULL),
	(2,'role.store','web',NULL,NULL),
	(3,'role.show','web',NULL,NULL),
	(4,'role.edit','web',NULL,NULL),
	(5,'role.destroy','web',NULL,NULL),
	(6,'admin.index','web',NULL,NULL),
	(7,'admin.store','web',NULL,NULL),
	(8,'admin.update','web',NULL,NULL),
	(9,'admin.destroy','web',NULL,NULL),
	(10,'user.index','web',NULL,NULL),
	(11,'user.password-reset','web',NULL,NULL),
	(12,'user.block','web',NULL,NULL),
	(13,'user.destroy','web',NULL,NULL),
	(14,'feed.index','web',NULL,NULL),
	(15,'feed.store','web',NULL,NULL),
	(16,'feed.update','web',NULL,NULL),
	(17,'feed.destroy','web',NULL,NULL),
	(18,'complaint.index','web',NULL,NULL),
	(19,'complaint.show-user','web',NULL,NULL),
	(20,'complaint.show-content','web',NULL,NULL),
	(21,'event.index','web',NULL,NULL),
	(22,'event.store','web',NULL,NULL),
	(23,'event.update','web',NULL,NULL),
	(24,'event.destroy','web',NULL,NULL),
	(25,'job.index','web',NULL,NULL),
	(26,'job.store','web',NULL,NULL),
	(27,'job.update','web',NULL,NULL),
	(28,'job.destroy','web',NULL,NULL),
	(29,'category.index','web',NULL,NULL),
	(30,'category.store','web',NULL,NULL),
	(31,'category.update','web',NULL,NULL),
	(32,'category.destroy','web',NULL,NULL),
	(33,'tag.index','web',NULL,NULL),
	(34,'tag.store','web',NULL,NULL),
	(35,'tag.update','web',NULL,NULL),
	(36,'tag.destroy','web',NULL,NULL),
	(37,'channel.index','web',NULL,NULL),
	(38,'channel.store','web',NULL,NULL),
	(39,'channel.update','web',NULL,NULL),
	(40,'channel.destroy','web',NULL,NULL);

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(21,1),
	(22,1),
	(23,1),
	(24,1),
	(25,1),
	(26,1),
	(27,1),
	(28,1),
	(29,1),
	(30,1),
	(31,1),
	(32,1),
	(33,1),
	(34,1),
	(35,1),
	(36,1),
	(37,1),
	(38,1),
	(39,1),
	(40,1),
	(10,2),
	(14,2),
	(15,2),
	(16,2),
	(17,2);

/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'super-admin','web',NULL,NULL),
	(2,'admin','web',NULL,NULL),
	(3,'student','web',NULL,NULL),
	(4,'teacher','web',NULL,NULL);

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table social_media_feeds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social_media_feeds`;

CREATE TABLE `social_media_feeds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table taggables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggables`;

CREATE TABLE `taggables` (
  `tag_id` int(10) unsigned NOT NULL,
  `taggable_id` int(10) unsigned NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `taggables_tag_id_foreign` (`tag_id`),
  CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `taggables` WRITE;
/*!40000 ALTER TABLE `taggables` DISABLE KEYS */;

INSERT INTO `taggables` (`tag_id`, `taggable_id`, `taggable_type`)
VALUES
	(1,1,'App\\Channel'),
	(1,2,'App\\Channel'),
	(1,3,'App\\Channel'),
	(1,4,'App\\Channel'),
	(1,5,'App\\Channel'),
	(1,6,'App\\Channel'),
	(1,7,'App\\Channel');

/*!40000 ALTER TABLE `taggables` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `name` json NOT NULL,
  `slug` json NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_column` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_category_id_foreign` (`category_id`),
  CONSTRAINT `tags_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `category_id`, `name`, `slug`, `type`, `order_column`, `created_at`, `updated_at`)
VALUES
	(1,1,X'7B22656E223A202254616731227D',X'7B22656E223A202274616731227D','channels',1,'2019-02-07 14:07:23','2019-02-07 14:07:23');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` json DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `meta` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `profile`, `password`, `remember_token`, `last_login_at`, `banned_at`, `created_at`, `updated_at`, `deleted_at`, `meta`)
VALUES
	(1,'Lup','lupka@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$iIupSAd/SPNPDn1UZCBqwOeW0M4c56MxAdABtmbNl7tr73W4CpIOK','4h2hvAacPNTxoFPX0VK1Mgazt8J8lMCFT8mmEfMRtEre4SNMOXH8mjp7NJVN','2019-02-28 10:54:37',NULL,'2019-01-24 17:44:07','2019-02-28 10:54:37',NULL,NULL),
	(39,'Miss Myah Armstrong','buckridge.madge@example.org',X'7B226D616A6F72223A2022776C65616E6E6F6E222C2022737461747573223A20225574207265696369656E646973206964206175742065742072656D207574206572726F722E222C20226C6F636174696F6E223A202235383733302053796C76657374657220537175617265735C6E4E6F727468204D617962656C6C2C205749203732373737222C202273747564656E745F6964223A20373736323332342C202267726164756174696F6E5F64617465223A202230312D32342D32303234227D','$2y$10$XOibbdVPKChD8qUhq6o.QeAjIW/J8Z/nIccBe1KctXHb2kh1vObwq','QmYfQY2iBp',NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10',NULL,NULL),
	(40,'Prof. Leilani Balistreri','ustracke@example.com',X'7B226D616A6F72223A202264617272656E2E6861636B657474222C2022737461747573223A2022436F6E73657175756E74757220736974206964206574206D61676E69207369742075742E222C20226C6F636174696F6E223A20223130363239204D61626C65205475726E70696B65205375697465203336305C6E536F757468204761727269736F6E2C20494C2030303931312D32333633222C202273747564656E745F6964223A20363330363636342C202267726164756174696F6E5F64617465223A202230312D32342D32303232227D','$2y$10$jrxAmH7TNVLrLvU06Xaqpe/UUBDmsOI3PwLZAGS0taz6Mx6dHqifq','vIkqLpuhDw',NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10',NULL,NULL),
	(41,'Prof. Madisen Haag','ondricka.owen@example.com',X'7B226D616A6F72223A2022677265676F72696F2E626172746F6E222C2022737461747573223A2022506172696174757220697073756D20726572756D2074656E65747572206E6F6E2065756D2E222C20226C6F636174696F6E223A202232323831362054656C6C792057656C6C73205375697465203338335C6E45617374204A65726D61696E766965772C204D54203830313135222C202273747564656E745F6964223A2035363138303637342C202267726164756174696F6E5F64617465223A202230312D32342D32303234227D','$2y$10$G6TzUVQzv5HPQC9HTOKhpO3eypFqO5wEJStNBr.vXp9EXdJorT6vO','jn2nMwLw7c',NULL,NULL,'2019-01-24 17:44:10','2019-01-24 17:44:10',NULL,NULL),
	(42,NULL,'lupka31@gmail.com',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$vTwKWb2UNSK7pLFP7iYe2uwju9MgH9E2BBkWsuJV/QLKBRG1XWgH6',NULL,'2019-02-07 16:03:06',NULL,'2019-02-07 12:37:55','2019-02-07 16:03:06',NULL,NULL),
	(43,NULL,'lupka31+1@gmail.com',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$rTthYqITx5994ivDIvUnHe.9Ivn44oGacaVg6S7Kcdj.6fXVkVEEC',NULL,'2019-02-22 18:41:14',NULL,'2019-02-07 14:31:11','2019-02-22 18:41:14',NULL,X'7B22757365725F6964223A20226C75706B6133312B3140676D61696C2E636F6D222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(44,NULL,'lupka+4@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$9jaFLmUtXUUnO63OEdwkpeMcf.sTFlLmNeZJBSsts8yWsTnNheJ5i',NULL,'2019-02-07 15:11:29',NULL,'2019-02-07 15:07:20','2019-02-07 15:11:29',NULL,X'7B22757365725F6964223A20226C75706B612B34406665772E696F222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(45,NULL,'Oscar@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$Az4YLnv2KDeIbQ7MzNVP4.mcsonF0b6RqJG/S7OYYI3ozTLqLd0Uu',NULL,'2019-03-01 04:10:45',NULL,'2019-02-19 13:05:02','2019-03-01 04:10:45',NULL,X'7B22757365725F6964223A20224F73636172406665772E696F222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(46,NULL,'a@gmail.com',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$O0B6h4qwO938DRfdP7MFJ.iT7xHUEbCQPDxTTreNo2TlKHQe7rJVy',NULL,'2019-02-26 18:27:58',NULL,'2019-02-21 18:40:30','2019-02-26 18:27:58',NULL,X'7B22757365725F6964223A20226140676D61696C2E636F6D222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(47,NULL,'B@gmail.com',X'7B226D616A6F72223A20226D617468222C2022737461747573223A202254657374222C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$LmFnPQZjjz65NtuH5mhD4eu67/ZIL3VXdvTtUjWV2i0w33sM0IMui',NULL,'2019-03-01 03:47:26',NULL,'2019-02-21 19:13:29','2019-03-01 03:47:26',NULL,X'7B22757365725F6964223A20224240676D61696C2E636F6D222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(48,NULL,'Lupka4@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$BB2wc9/XAmPKtOKll7S9MeeRyMMSHtw2xIldNXZ2xB54zP/GVGj2G',NULL,'2019-02-28 10:28:56',NULL,'2019-02-22 18:34:57','2019-02-28 10:28:56',NULL,X'7B22757365725F6964223A20224C75706B6134406665772E696F222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(49,NULL,'Lupka+11@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$3Y9SjFYEEj1StZuRS.RAZuFm8tUJSiPVtak2T9TlPFlyCle5E6mrO',NULL,'2019-02-22 18:44:14',NULL,'2019-02-22 18:44:13','2019-02-22 18:44:14',NULL,X'7B22757365725F6964223A20224C75706B612B3131406665772E696F222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(50,NULL,'Lupka7@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$t9BrGbc3q0mVuX1ci54On.BSirkDMvxohDxxxyULKqm.mm5SRhRb.',NULL,'2019-02-22 22:51:00',NULL,'2019-02-22 19:06:16','2019-02-22 22:51:00',NULL,X'7B22757365725F6964223A20224C75706B6137406665772E696F222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(51,NULL,'Lupka55@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$XeZhHlqx6FFJVHZ2VDiVv.kCTKNJW400zAeBzgBnHc.CP6UV6.31i',NULL,'2019-02-23 00:08:39',NULL,'2019-02-23 00:08:38','2019-02-23 00:08:39',NULL,X'7B22757365725F6964223A20224C75706B613535406665772E696F222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(52,NULL,'Lupkafff@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$D0wtD4ySCjn/7ymGYYwYhO1eUdMgDYGd.ZZeWEnWrHRJEkYsm4aQm',NULL,'2019-02-23 00:19:55',NULL,'2019-02-23 00:19:54','2019-02-23 00:19:55',NULL,X'7B22757365725F6964223A20224C75706B61666666406665772E696F222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(53,NULL,'Aa@gmail.com',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$T9FpDjGJqq5cBNi.FqKDnutZyMw9oxgcMtrwaPiz2ZA/sKrCIPzv6',NULL,'2019-02-24 21:49:22',NULL,'2019-02-24 21:48:15','2019-02-24 21:49:22',NULL,X'7B22757365725F6964223A2022416140676D61696C2E636F6D222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(54,NULL,'Aaa@gmail.com',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$N/4UsKnSw.CnV7jkcSD0UO8QMvn.EDUu03UI24.mzFpMSw3cwSyje',NULL,'2019-02-24 21:59:14',NULL,'2019-02-24 21:58:49','2019-02-24 21:59:14',NULL,X'7B22757365725F6964223A202241616140676D61696C2E636F6D222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(55,NULL,'Ab@gmail.com',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$jHyhtqDg9X38uRndLRr2FeeeWPgfferBOwXvZghfXtJRSOa3mzGVm',NULL,'2019-02-24 21:59:52',NULL,'2019-02-24 21:59:34','2019-02-24 21:59:52',NULL,X'7B22757365725F6964223A2022416240676D61696C2E636F6D222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(56,NULL,'Bb@gmail.com',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$DN4shHm2HGlt6W4vzIu1TOKvBp5waV.aQy5nOLQwccKSrkiu0wcy.',NULL,'2019-02-24 22:02:32',NULL,'2019-02-24 22:02:17','2019-02-24 22:02:32',NULL,X'7B22757365725F6964223A2022426240676D61696C2E636F6D222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(57,NULL,'Lupka+gg@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$QuwPKq6oBLwrNuVPtdxw6.dBAu9ZrysHa.45UaNKSOC4S0PHgi/NC',NULL,'2019-02-24 22:03:36',NULL,'2019-02-24 22:03:35','2019-02-24 22:03:36',NULL,X'7B22757365725F6964223A20224C75706B612B6767406665772E696F222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(58,NULL,'Asdf@asdf.com',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$00X01WJXXTqLpKabjXSKIuvAifPEkqpCBGEN.q9KDTaWwgyHX6kOu',NULL,'2019-02-24 22:10:05',NULL,'2019-02-24 22:10:04','2019-02-24 22:10:05',NULL,X'7B22757365725F6964223A20224173646640617364662E636F6D222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(59,NULL,'Lupka5555@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$ncnqtQh5cYfTkDTStaExZ.KLHRknk769QjB.BM.0//dYUpWy1IGS.',NULL,'2019-02-24 22:23:41',NULL,'2019-02-24 22:23:41','2019-02-24 22:23:41',NULL,X'7B22757365725F6964223A20224C75706B6135353535406665772E696F222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(60,NULL,'Bbb@gmail.com',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$rDy/IvGmCjhAgE2cYKmaZuvHcPDdGSMBmzQfAatUmy/lWOqHTviBe',NULL,'2019-02-24 22:53:27',NULL,'2019-02-24 22:53:26','2019-02-24 22:53:27',NULL,X'7B22757365725F6964223A202242626240676D61696C2E636F6D222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(61,NULL,'W@gmail.com',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$tOg11huRlYwI18KsMd4jkeVY25Gz0bMv.wbqkYS.hHFGMG1vxurWy',NULL,'2019-02-24 22:55:51',NULL,'2019-02-24 22:55:50','2019-02-24 22:55:51',NULL,X'7B22757365725F6964223A20225740676D61696C2E636F6D222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(62,'Zack','zack@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$wAr39/n5H/IiwQHTR2bj.exKVLYmFgwamR1TGfVQNqpSQmVbQHdzW','OwNCwCD1dlgNFB8OifyRWD8nBa0VvbEKTNsB0Y8Br31qhwHxhdUMxHIFQamA','2019-02-25 22:50:53',NULL,'2019-02-25 12:00:51','2019-02-25 22:50:53',NULL,NULL),
	(63,NULL,'lupkahh@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$Eb2jRrUhej5glDoOpLCxtuOg3hDLnYgDUeAxphjvWntgZ9ERdjMeO',NULL,'2019-02-25 12:10:41',NULL,'2019-02-25 12:10:41','2019-02-25 12:10:41',NULL,X'7B22757365725F6964223A20226C75706B616868406665772E696F222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(64,NULL,'Zack+2@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$Z8VMgaXKn0HmvzKyn1MUaefg3JIYddjXWUu1EUBX3ISYVbsXMBTra',NULL,'2019-02-25 23:03:17',NULL,'2019-02-25 17:28:01','2019-02-25 23:03:17',NULL,X'7B22757365725F6964223A20225A61636B2B32406665772E696F222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(65,NULL,'Abc@gmail.com',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$RZR7keFACtb0NCzdKcs63OogO7SwdqcG.b3EalVEDv6Aavg8zWW96',NULL,'2019-02-26 09:48:01',NULL,'2019-02-26 09:47:05','2019-02-26 09:48:01',NULL,X'7B22757365725F6964223A202241626340676D61696C2E636F6D222C202270726F66696C655F75726C223A2022222C20226C6173745F7365656E5F6174223A20302C20226861735F657665725F6C6F676765645F696E223A2066616C73657D'),
	(66,'Kim','kim@few.io',X'7B226D616A6F72223A206E756C6C2C2022737461747573223A206E756C6C2C20226C6F636174696F6E223A206E756C6C2C202273747564656E745F6964223A206E756C6C2C202267726164756174696F6E5F64617465223A206E756C6C7D','$2y$10$yc/TltHQzyHutYy9JO.ydeyKm0yPuZQa7LpBUwlecmjLf8Qg6qCju',NULL,'2019-02-28 18:58:16',NULL,'2019-02-28 10:55:08','2019-02-28 18:58:16',NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
