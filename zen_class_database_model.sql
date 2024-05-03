CREATE TABLE `Students` (
  `studentId` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `email` varchar(255),
  `phone` varchar(255),
  `address` text,
  `dateOfBirth` date,
  `gender` varchar(255)
);

CREATE TABLE `Mentors` (
  `mentorId` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `email` varchar(255),
  `phone` varchar(255),
  `address` varchar(255),
  `dateOfBirth` date,
  `gender` varchar(255),
  `expertise` varchar(255)
);

CREATE TABLE `Coordinators` (
  `coordinatorId` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `email` varchar(255),
  `phone` varchar(255),
  `address` varchar(255),
  `dateOfBirth` date,
  `gender` varchar(255)
);

CREATE TABLE `Sessions` (
  `sessionId` int PRIMARY KEY AUTO_INCREMENT,
  `session_name` varchar(255),
  `start_time` datetime,
  `end_time` datetime,
  `batch_id` int,
  `mentor_id` int
);

CREATE TABLE `Batch` (
  `batchId` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `start_date` date,
  `end_date` date,
  `mentor_id` int,
  `coordinator_id` int
);

CREATE TABLE `Task` (
  `taskId` int PRIMARY KEY AUTO_INCREMENT,
  `task_name` varchar(255),
  `description` varchar(255),
  `deadline` datetime,
  `session_id` int,
  `student_id` int
);

ALTER TABLE `Sessions` ADD FOREIGN KEY (`batch_id`) REFERENCES `Batch` (`batchId`);

ALTER TABLE `Sessions` ADD FOREIGN KEY (`mentor_id`) REFERENCES `Mentors` (`mentorId`);

ALTER TABLE `Batch` ADD FOREIGN KEY (`mentor_id`) REFERENCES `Mentors` (`mentorId`);

ALTER TABLE `Batch` ADD FOREIGN KEY (`coordinator_id`) REFERENCES `Coordinators` (`coordinatorId`);

ALTER TABLE `Task` ADD FOREIGN KEY (`session_id`) REFERENCES `Sessions` (`sessionId`);

ALTER TABLE `Task` ADD FOREIGN KEY (`student_id`) REFERENCES `Students` (`studentId`);
