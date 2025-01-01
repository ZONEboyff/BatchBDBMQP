-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: PRATIK
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apply` (
  `sid` int(11) NOT NULL,
  `cname` varchar(25) NOT NULL,
  `major` varchar(30) NOT NULL,
  `decision` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sid`,`cname`,`major`),
  CONSTRAINT `fk_apply_sid` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (1,'AITDE','Electrical','yes'),(1,'DBCE','Computer Science','no'),(2,'KALE','Computer Science','no'),(2,'MIT','Computer Science','YES'),(2,'PCCE','Electrical','yes'),(3,'AITDE','Mechanical','yes'),(3,'PCCE','Mechanical','yes'),(4,'DBCE','Civil','no'),(4,'KALE','Civil','no'),(5,'AITDE','Electronics','yes'),(5,'MIT','Computer Science','NO'),(5,'PCCE','Electronics','yes'),(6,'DBCE','Information Technology','no'),(7,'AITDE','Chemical','yes'),(8,'KALE','Aeronautical','no'),(9,'MIT','Electrical','YES'),(9,'PCCE','Biomedical','yes'),(9,'Stanford','Biology','NO'),(10,'DBCE','Environmental','no'),(10,'MIT','Electrical','YES'),(10,'Stanford','Bioscience','YES'),(11,'Stanford','Computer Science','NO'),(11,'Stanford','Electrical','YES'),(12,'KALE','Electrical','YES'),(13,'Stanford','Computer Science','YES');
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_adoption`
--

DROP TABLE IF EXISTS `book_adoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_adoption` (
  `book_isbn` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  PRIMARY KEY (`book_isbn`,`courseid`),
  KEY `fk_book_adoption_courseid` (`courseid`),
  CONSTRAINT `fk_book_adoption_book_isbn` FOREIGN KEY (`book_isbn`) REFERENCES `textbook` (`book_isbn`),
  CONSTRAINT `fk_book_adoption_courseid` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_adoption`
--

LOCK TABLES `book_adoption` WRITE;
/*!40000 ALTER TABLE `book_adoption` DISABLE KEYS */;
INSERT INTO `book_adoption` VALUES (113,1),(114,1),(115,1),(120,3),(120,5),(121,3),(121,4),(122,3),(123,4),(124,4),(125,4),(126,5),(127,5),(128,5);
/*!40000 ALTER TABLE `book_adoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college` (
  `cname` varchar(25) NOT NULL,
  `state` varchar(20) NOT NULL,
  `enrollment` int(11) DEFAULT NULL,
  PRIMARY KEY (`cname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES ('DBCE','Goa',10500),('KALE','Karnataka',11000);
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseid` int(11) NOT NULL,
  `title` varchar(25) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `credits` tinyint(4) DEFAULT NULL,
  `cname` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`courseid`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'DBMPQ','Computer',3,'GEC'),(2,'CS112','Computer',3,'GEC'),(3,'MATH101','Mathematics',4,'Science'),(4,'PHYS101','Physics',4,'Science'),(5,'HIST201','History',3,'Humanities'),(6,'HM023','Humanity',3,'Standford');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `course_and_books`
--

DROP TABLE IF EXISTS `course_and_books`;
/*!50001 DROP VIEW IF EXISTS `course_and_books`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `course_and_books` AS SELECT
 1 AS `courseid`,
  1 AS `title`,
  1 AS `credits`,
  1 AS `dept_name`,
  1 AS `book_title`,
  1 AS `author` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course_stud`
--

DROP TABLE IF EXISTS `course_stud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_stud` (
  `courseid` int(11) NOT NULL,
  `num_students` int(11) DEFAULT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_stud`
--

LOCK TABLES `course_stud` WRITE;
/*!40000 ALTER TABLE `course_stud` DISABLE KEYS */;
INSERT INTO `course_stud` VALUES (1,4),(2,5),(3,6),(4,6),(5,4),(6,2);
/*!40000 ALTER TABLE `course_stud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `courses_not_taken`
--

DROP TABLE IF EXISTS `courses_not_taken`;
/*!50001 DROP VIEW IF EXISTS `courses_not_taken`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `courses_not_taken` AS SELECT
 1 AS `not_taken_courses` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `number_of_authors_per_textbook`
--

DROP TABLE IF EXISTS `number_of_authors_per_textbook`;
/*!50001 DROP VIEW IF EXISTS `number_of_authors_per_textbook`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `number_of_authors_per_textbook` AS SELECT
 1 AS `book_title`,
  1 AS `number_of_authors` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `number_of_students`
--

DROP TABLE IF EXISTS `number_of_students`;
/*!50001 DROP VIEW IF EXISTS `number_of_students`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `number_of_students` AS SELECT
 1 AS `cname`,
  1 AS `number_of_students` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `number_of_textbooks`
--

DROP TABLE IF EXISTS `number_of_textbooks`;
/*!50001 DROP VIEW IF EXISTS `number_of_textbooks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `number_of_textbooks` AS SELECT
 1 AS `courseid`,
  1 AS `number_of_textbooks` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stud2_access`
--

DROP TABLE IF EXISTS `stud2_access`;
/*!50001 DROP VIEW IF EXISTS `stud2_access`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `stud2_access` AS SELECT
 1 AS `sname`,
  1 AS `gpa` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stud_course`
--

DROP TABLE IF EXISTS `stud_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_course` (
  `sid` int(11) NOT NULL,
  `num_courses` int(11) DEFAULT NULL,
  `max_grade` char(2) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_course`
--

LOCK TABLES `stud_course` WRITE;
/*!40000 ALTER TABLE `stud_course` DISABLE KEYS */;
INSERT INTO `stud_course` VALUES (1,3,'A'),(2,3,'B'),(3,2,'B'),(4,2,'A'),(5,2,'C'),(6,2,'A'),(7,2,'A'),(8,2,'C'),(9,2,'B'),(10,2,'A'),(11,1,'AA'),(12,1,'AA'),(13,1,'AA'),(14,2,'B');
/*!40000 ALTER TABLE `stud_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `sid` int(11) NOT NULL,
  `sname` varchar(25) NOT NULL,
  `gpa` float(5,2) DEFAULT NULL,
  `sizehs` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Pratik',10.20,15000,'2001-05-20'),(2,'Anjali',10.70,22000,'2002-06-15'),(3,'Rahul',10.20,16000,'2001-09-10'),(4,'Sneha',10.20,23000,'2002-01-22'),(5,'Ravi',10.20,13500,'2003-11-30'),(6,'Bhola',10.20,24000,'2001-03-14'),(7,'Vikram',10.20,12000,'2002-07-25'),(8,'Chatur',10.20,21000,'2003-08-08'),(9,'Sahil',10.20,12500,'2001-12-01'),(10,'Ritika',10.70,25000,'2003-02-10'),(11,'Darron',10.70,900,'2004-04-18'),(12,'Sameer',10.20,400,'2002-10-05'),(13,'Sarah',10.20,800,'2001-07-11'),(14,'John Smith',10.20,17000,'2004-08-09');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `student_courses`
--

DROP TABLE IF EXISTS `student_courses`;
/*!50001 DROP VIEW IF EXISTS `student_courses`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `student_courses` AS SELECT
 1 AS `sid`,
  1 AS `sname`,
  1 AS `title` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `table1`
--

DROP TABLE IF EXISTS `table1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table1` (
  `a1` int(11) NOT NULL,
  PRIMARY KEY (`a1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table1`
--

LOCK TABLES `table1` WRITE;
/*!40000 ALTER TABLE `table1` DISABLE KEYS */;
INSERT INTO `table1` VALUES (1);
/*!40000 ALTER TABLE `table1` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER insert_into_table2
AFTER INSERT ON table1
FOR EACH ROW
BEGIN
    INSERT INTO table2 (a2) VALUES (NEW.a1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER delete_from_table3_if_exists
AFTER INSERT ON table1
FOR EACH ROW
BEGIN
    DELETE FROM table3 WHERE a3 = NEW.a1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_b4_in_table4
AFTER INSERT ON table1
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM table4 WHERE a4 = NEW.a1) THEN
        UPDATE table4 SET b4 = b4 + 1 WHERE a4 = NEW.a1;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `table2`
--

DROP TABLE IF EXISTS `table2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table2` (
  `a2` int(11) NOT NULL,
  PRIMARY KEY (`a2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table2`
--

LOCK TABLES `table2` WRITE;
/*!40000 ALTER TABLE `table2` DISABLE KEYS */;
INSERT INTO `table2` VALUES (1);
/*!40000 ALTER TABLE `table2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table3`
--

DROP TABLE IF EXISTS `table3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table3` (
  `a3` int(11) NOT NULL,
  PRIMARY KEY (`a3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table3`
--

LOCK TABLES `table3` WRITE;
/*!40000 ALTER TABLE `table3` DISABLE KEYS */;
INSERT INTO `table3` VALUES (2),(3),(4);
/*!40000 ALTER TABLE `table3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table4`
--

DROP TABLE IF EXISTS `table4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table4` (
  `a4` int(11) NOT NULL,
  `b4` int(11) DEFAULT 0,
  PRIMARY KEY (`a4`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table4`
--

LOCK TABLES `table4` WRITE;
/*!40000 ALTER TABLE `table4` DISABLE KEYS */;
INSERT INTO `table4` VALUES (1,2),(2,2),(3,4),(4,8);
/*!40000 ALTER TABLE `table4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taken`
--

DROP TABLE IF EXISTS `taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taken` (
  `sid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `grade` varchar(2) DEFAULT 'AA',
  PRIMARY KEY (`sid`,`courseid`),
  KEY `fk_taken_courseid` (`courseid`),
  CONSTRAINT `fk_taken_courseid` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  CONSTRAINT `fk_taken_sid` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taken`
--

LOCK TABLES `taken` WRITE;
/*!40000 ALTER TABLE `taken` DISABLE KEYS */;
INSERT INTO `taken` VALUES (1,2,'A'),(1,3,'B'),(1,6,'B'),(2,4,'A'),(2,5,'B'),(2,6,'B'),(3,1,'C'),(3,4,'B'),(4,2,'A'),(4,3,'A'),(5,1,'D'),(5,5,'C'),(6,3,'B'),(6,4,'A'),(7,2,'B'),(7,5,'A'),(8,1,'C'),(8,3,'D'),(9,2,'B'),(9,4,'C'),(10,3,'A'),(10,5,'B'),(11,4,'AA'),(12,2,'AA'),(13,3,'AA'),(14,1,'C'),(14,4,'B');
/*!40000 ALTER TABLE `taken` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_insert_taken
AFTER INSERT ON taken
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM stud_course WHERE sid = NEW.sid) THEN
        UPDATE stud_course
        SET 
            num_courses = num_courses + 1,
            max_grade = GREATEST(max_grade, NEW.grade)
        WHERE 
            sid = NEW.sid;
    ELSE
        INSERT INTO stud_course (sid, num_courses, max_grade)
        VALUES (NEW.sid, 1, NEW.grade);
    END IF;

    IF EXISTS (SELECT 1 FROM course_stud WHERE courseid = NEW.courseid) THEN
        UPDATE course_stud
        SET 
            num_students = num_students + 1
        WHERE 
            courseid = NEW.courseid;
    ELSE
        INSERT INTO course_stud (courseid, num_students)
        VALUES (NEW.courseid, 1);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_delete_taken
AFTER DELETE ON taken
FOR EACH ROW
BEGIN
    DECLARE new_max_grade CHAR(2);

    IF EXISTS (SELECT 1 FROM stud_course WHERE sid = OLD.sid) THEN
        UPDATE stud_course
        SET num_courses = num_courses - 1
        WHERE sid = OLD.sid;

        IF (SELECT num_courses FROM stud_course WHERE sid = OLD.sid) = 0 THEN
            DELETE FROM stud_course WHERE sid = OLD.sid;
        ELSE
            
            SELECT MAX(grade) INTO new_max_grade FROM taken WHERE sid = OLD.sid;
            UPDATE stud_course
            SET max_grade = new_max_grade
            WHERE sid = OLD.sid;
        END IF;
    END IF;

    IF EXISTS (SELECT 1 FROM course_stud WHERE courseid = OLD.courseid) THEN
        UPDATE course_stud
        SET num_students = num_students - 1
        WHERE courseid = OLD.courseid;

        IF (SELECT num_students FROM course_stud WHERE courseid = OLD.courseid) = 0 THEN
            DELETE FROM course_stud WHERE courseid = OLD.courseid;
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `textbook`
--

DROP TABLE IF EXISTS `textbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `textbook` (
  `book_isbn` int(11) NOT NULL,
  `book_title` varchar(25) NOT NULL,
  `author` varchar(20) DEFAULT NULL,
  `publisher` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`book_isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textbook`
--

LOCK TABLES `textbook` WRITE;
/*!40000 ALTER TABLE `textbook` DISABLE KEYS */;
INSERT INTO `textbook` VALUES (113,'Advanced DB Systems','Raghu Ramakrishnan','McGraw-Hill'),(114,'Database Concepts','Abraham Silberschatz','McGraw-Hill'),(115,'Fundamentals of DBMS','Ramez Elmasri','Pearson'),(120,'Calculus: Early Transc.','James Stewart','Cengage Learning'),(121,'Linear Algebra','Gilbert Strang','Cengage Learning'),(122,'Discrete Math & Appl.','Kenneth H. Rosen','McGraw-Hill'),(123,'Physics for Scientists','Raymond A. Serway','Cengage Learning'),(124,'Fundamentals of Physics','David Halliday','Wiley'),(125,'Feynman Lectures','Richard P. Feynman','Addison-Wesley'),(126,'History of Western Soc.','John P. McKay','Bedford/St. Martin\'s'),(127,'Guns, Germs, & Steel','Jared Diamond','W.W. Norton & Co.'),(128,'Ancient World History','Susan Wise Bauer','W.W. Norton & Co.'),(129,'Atomic Habits','James Clear','McGraw Hills');
/*!40000 ALTER TABLE `textbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `course_and_books`
--

/*!50001 DROP VIEW IF EXISTS `course_and_books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `course_and_books` AS select `c`.`courseid` AS `courseid`,`c`.`title` AS `title`,`c`.`credits` AS `credits`,`c`.`dept_name` AS `dept_name`,`t`.`book_title` AS `book_title`,`t`.`author` AS `author` from ((`course` `c` join `book_adoption` `b` on(`c`.`courseid` = `b`.`courseid`)) join `textbook` `t` on(`b`.`book_isbn` = `t`.`book_isbn`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `courses_not_taken`
--

/*!50001 DROP VIEW IF EXISTS `courses_not_taken`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `courses_not_taken` AS select count(0) AS `not_taken_courses` from (`course` `c` left join `taken` `t` on(`c`.`courseid` = `t`.`courseid`)) where `t`.`courseid` is null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number_of_authors_per_textbook`
--

/*!50001 DROP VIEW IF EXISTS `number_of_authors_per_textbook`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number_of_authors_per_textbook` AS select `course_and_books`.`book_title` AS `book_title`,count(distinct `course_and_books`.`author`) AS `number_of_authors` from `course_and_books` group by `course_and_books`.`book_title` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number_of_students`
--

/*!50001 DROP VIEW IF EXISTS `number_of_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number_of_students` AS select `apply`.`cname` AS `cname`,count(`apply`.`sid`) AS `number_of_students` from `apply` group by `apply`.`cname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number_of_textbooks`
--

/*!50001 DROP VIEW IF EXISTS `number_of_textbooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number_of_textbooks` AS select `course_and_books`.`courseid` AS `courseid`,count(`course_and_books`.`book_title`) AS `number_of_textbooks` from `course_and_books` group by `course_and_books`.`courseid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stud2_access`
--

/*!50001 DROP VIEW IF EXISTS `stud2_access`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stud2_access` AS select `student`.`sname` AS `sname`,`student`.`gpa` AS `gpa` from `student` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_courses`
--

/*!50001 DROP VIEW IF EXISTS `student_courses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_courses` AS select `student`.`sid` AS `sid`,`student`.`sname` AS `sname`,`course`.`title` AS `title` from ((`student` join `taken` on(`student`.`sid` = `taken`.`sid`)) join `course` on(`taken`.`courseid` = `course`.`courseid`)) where `course`.`dept_name` = 'Computer' */;
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

-- Dump completed on 2025-01-01 15:25:50
