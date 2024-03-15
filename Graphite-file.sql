-- Table structure for table `director_activity_log`
--

DROP TABLE IF EXISTS `director_activity_log`;
CREATE TABLE `director_activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_type` varchar(64) NOT NULL,
  `object_name` varchar(255) NOT NULL,
  `action_name` enum('create','delete','modify') NOT NULL,
  `old_properties` text DEFAULT NULL COMMENT 'Property hash, JSON',
  `new_properties` text DEFAULT NULL COMMENT 'Property hash, JSON',
  `author` varchar(64) NOT NULL,
  `change_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `checksum` varbinary(20) NOT NULL,
  `parent_checksum` varbinary(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sort_idx` (`change_time`),
  KEY `search_idx` (`object_name`),
  KEY `search_idx2` (`object_type`(32),`object_name`(64),`change_time`),
  KEY `search_author` (`author`),
  KEY `checksum` (`checksum`)
) 
--
-- Dumping data for table `director_activity_log`
--

LOCK TABLES `director_activity_log` WRITE;

ALTER TABLE `director_activity_log` ENABLE KEYS ;
UNLOCK TABLES;
