-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: astutor
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authtokens`
--

DROP TABLE IF EXISTS `authtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtokens` (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(250) NOT NULL,
  `createdAt` datetime NOT NULL,
  `expiresAt` datetime NOT NULL,
  PRIMARY KEY (`token_id`),
  KEY `fk_AuthTokens_Users_idx` (`user_id`),
  CONSTRAINT `fk_AuthTokens_Users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtokens`
--

LOCK TABLES `authtokens` WRITE;
/*!40000 ALTER TABLE `authtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `courses_id` int NOT NULL AUTO_INCREMENT,
  `tutorId` int NOT NULL,
  `title` varchar(250) NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `Category` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`courses_id`),
  KEY `fk_Courses_Tutors1_idx` (`tutorId`),
  CONSTRAINT `fk_Courses_Tutors1` FOREIGN KEY (`tutorId`) REFERENCES `tutors` (`tutorId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,1,'Computer Programming 1','Intro to Computer Programming','Computer Science','2025-01-25 16:00:51'),(2,1,'Elective 1','Into of Elective 1','Computer Science','2025-01-25 16:13:33'),(3,1,'DSA','Into DSA','Computer Science','2025-01-26 20:07:45');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll` (
  `enrollId` int NOT NULL AUTO_INCREMENT,
  `studentId` int NOT NULL,
  `courses_id` int NOT NULL,
  `enrollmentDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Ongoing','Finish') NOT NULL DEFAULT 'Ongoing',
  PRIMARY KEY (`enrollId`),
  KEY `fk_Enroll_Courses1_idx` (`courses_id`),
  KEY `fk_Enroll_Students1_idx` (`studentId`),
  CONSTRAINT `fk_Enroll_Courses1` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`courses_id`),
  CONSTRAINT `fk_Enroll_Students1` FOREIGN KEY (`studentId`) REFERENCES `students` (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll`
--

LOCK TABLES `enroll` WRITE;
/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
INSERT INTO `enroll` VALUES (3,1,1,'2025-01-25 16:10:13','Ongoing'),(4,1,2,'2025-01-25 16:13:50','Ongoing'),(5,2,1,'2025-01-25 16:14:02','Ongoing'),(6,1,3,'2025-01-26 20:08:14','Ongoing'),(7,1,3,'2025-01-26 20:08:14','Ongoing'),(8,2,3,'2025-01-26 20:08:14','Ongoing'),(9,2,3,'2025-01-26 20:08:14','Ongoing');
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentId` int NOT NULL AUTO_INCREMENT,
  `studentId` int NOT NULL,
  `amount` int NOT NULL,
  `paymendate` datetime NOT NULL,
  `paymentMethod` varchar(50) NOT NULL,
  `status` blob NOT NULL,
  PRIMARY KEY (`paymentId`),
  KEY `fk_Payment_Students1_idx` (`studentId`),
  CONSTRAINT `fk_Payment_Students1` FOREIGN KEY (`studentId`) REFERENCES `students` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professional info`
--

DROP TABLE IF EXISTS `professional info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professional info` (
  `professionalInfo_id` int NOT NULL AUTO_INCREMENT,
  `tutorId` int NOT NULL,
  `qualification` varchar(250) NOT NULL,
  `specialization` varchar(250) NOT NULL,
  `experience_years` int NOT NULL,
  `rate_per_hour` int NOT NULL,
  PRIMARY KEY (`professionalInfo_id`),
  KEY `fk_Professional Info_Tutors1_idx` (`tutorId`),
  CONSTRAINT `fk_Professional Info_Tutors1` FOREIGN KEY (`tutorId`) REFERENCES `tutors` (`tutorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional info`
--

LOCK TABLES `professional info` WRITE;
/*!40000 ALTER TABLE `professional info` DISABLE KEYS */;
/*!40000 ALTER TABLE `professional info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `reviewsId` int NOT NULL AUTO_INCREMENT,
  `Students_studentId` int NOT NULL,
  `courses_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` varchar(250) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`reviewsId`),
  KEY `fk_Reviews_Courses1_idx` (`courses_id`),
  KEY `fk_Reviews_Students1_idx` (`Students_studentId`),
  CONSTRAINT `fk_Reviews_Courses1` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`courses_id`),
  CONSTRAINT `fk_Reviews_Students1` FOREIGN KEY (`Students_studentId`) REFERENCES `students` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `scheduleDate` datetime NOT NULL,
  `duration` int NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `studentId` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `fname` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `Mi` varchar(150) NOT NULL,
  `grade` int DEFAULT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`studentId`),
  KEY `fk_Students_Users1_idx` (`user_id`),
  CONSTRAINT `fk_Students_Users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,2,'xi@gmail.com','Xiianger','A',NULL,24),(2,3,'fatima@gmail.com','Fatima','B',NULL,20);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `submissionId` int NOT NULL AUTO_INCREMENT,
  `taskId` int NOT NULL,
  `studentId` int NOT NULL,
  `fileurk` varchar(250) NOT NULL,
  `SubmittedAt` datetime NOT NULL,
  `grade` int DEFAULT NULL,
  PRIMARY KEY (`submissionId`),
  KEY `fk_Submissions_Tasks1_idx` (`taskId`),
  KEY `fk_Submissions_Students1_idx` (`studentId`),
  CONSTRAINT `fk_Submissions_Students1` FOREIGN KEY (`studentId`) REFERENCES `students` (`studentId`),
  CONSTRAINT `fk_Submissions_Tasks1` FOREIGN KEY (`taskId`) REFERENCES `tasks` (`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `taskId` int NOT NULL AUTO_INCREMENT,
  `Courses_courses_id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` varchar(45) NOT NULL,
  `Duedate` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`taskId`),
  KEY `fk_Tasks_Courses1_idx` (`Courses_courses_id`),
  CONSTRAINT `fk_Tasks_Courses1` FOREIGN KEY (`Courses_courses_id`) REFERENCES `courses` (`courses_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutors`
--

DROP TABLE IF EXISTS `tutors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutors` (
  `tutorId` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `Mi` varchar(45) NOT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`tutorId`),
  KEY `fk_Tutors_Users1_idx` (`user_id`),
  CONSTRAINT `fk_Tutors_Users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutors`
--

LOCK TABLES `tutors` WRITE;
/*!40000 ALTER TABLE `tutors` DISABLE KEYS */;
INSERT INTO `tutors` VALUES (1,1,'nowellsaavedra@gmail.com','Saavedra','T',25);
/*!40000 ALTER TABLE `tutors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `role` enum('Student','Tutor','Admin') NOT NULL DEFAULT 'Student',
  `isVerified` tinyint NOT NULL DEFAULT '0',
  `lastLogin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'nowellsaavedra@gmail.com','Nowell','nowellsaavedra@gmail.com','Tutor',1,'2025-01-25 15:32:43','2025-01-25 15:32:43'),(2,'xi@gmail.com','xi','xizan@gmail.com','Student',1,'2025-01-25 15:33:23','2025-01-25 15:33:23'),(3,'fatima@gmail.com','fati','fatima@gmail.com','Student',1,'2025-01-25 16:11:24','2025-01-25 16:11:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-27 21:35:55
