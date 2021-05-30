-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 30, 2021 at 02:28 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `pleed`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `town` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `name`, `number`, `country`, `town`) VALUES
(1, 'avenu philippe auguste', 60, 'france', 'paris');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(255) NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `content`, `question_id`, `image_path`) VALUES
(1, 'Excessif ', 1, NULL),
(2, 'Adapté', 1, NULL),
(3, 'Pas suffisant', 1, NULL),
(4, 'inutile', 1, NULL),
(5, 'oui', 2, NULL),
(6, 'non', 2, NULL),
(7, ' Excessif', 3, NULL),
(8, 'Adapté', 3, NULL),
(9, 'Pas suffisant', 3, NULL),
(10, 'Inutile', 3, NULL),
(11, 'oui', 4, NULL),
(12, 'non', 4, NULL),
(13, 'oui', 6, NULL),
(14, 'non', 6, NULL),
(15, 'Excessif', 5, NULL),
(16, 'Adapté', 5, NULL),
(17, 'Pas suffisant', 5, NULL),
(18, 'Inutile', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `color`) VALUES
(1, 'ORGANISATION', 'blue'),
(2, 'COMMUNICATION', 'purple'),
(3, 'GESTION DE TEMPS', 'red');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `date_creation` datetime NOT NULL,
  `number_of_employes` int(11) NOT NULL,
  `address_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `date_creation`, `number_of_employes`, `address_id`) VALUES
(1, 'fabino', '2021-05-27 00:00:00', 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `function`
--

CREATE TABLE `function` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `function`
--

INSERT INTO `function` (`id`, `name`) VALUES
(1, 'coach');

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `preview` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `photo_path` varchar(255) NOT NULL,
  `video_path` varchar(255) NOT NULL,
  `intro` text NOT NULL,
  `prob` text NOT NULL,
  `solution` text NOT NULL,
  `conclusion` text NOT NULL,
  `createAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `name`, `preview`, `category_id`, `photo_path`, `video_path`, `intro`, `prob`, `solution`, `conclusion`, `createAt`) VALUES
(1, 'TestFormation - Niveau 1 - Faire des réunion plus éfficaces\r\n', 'Test', 1, 'question_mail.png', 'question_mail.png', 'On a tous déjà assisté à une réunion d’équipe de 2 heures qui aurait pu se faire en 30 minutes. Ce genre de réunion commence généralement avec 5 à 10 minutes de retard, n’a pas d’ordre du jour formel et n’aboutit que rarement à des décisions et actions concrètes. Ce sont des réunions de « bla bla » où on discute de tout et de rien.\r\n', 'L’animateur de la réunion étant peu préparé laisse la discussion aller dans tous les sens et autorise constamment les histoires personnelles, les blagues, et les remarques des gens qui prennent trop de place, en ne ramenant que rarement la réunion à l’essentiel. Pendant ce moment, le temps avance et le meeting n’aboutit à rien. Les participants commencent alors à décrocher et à faire autre chose pendant la réunion pour optimiser leur temps. C’est alors qu’ils sortent leur téléphone ou leur ordinateur pour répondre à quelques courriels, envoyer des textos, accomplir quelques petites tâches, ou pire encore, pour faire une petite sieste (#dejavu). Finalement, la réunion qui aurait pu être faite en 30 minutes intensives se termine au bout de 2 heures et tout le monde est énervé et a l’impression d’avoir perdu 2 heures de sa journée.\r\n', 'La première chose que je vous conseille de faire pour écourter la durée de vos réunions d’équipe est de retrancher systématiquement 25% de la durée habituelle de votre réunion. \r\n\r\nSi votre réunion dure habituellement 2 heures, retranchez par défaut 25% de sa durée aujourd’hui. Cela veut donc dire qu’à partir de maintenant votre réunion n’est plus de 2 heures, mais de 1h30.\r\nMon deuxième conseil pour réduire la durée de vos réunions est simple : commencez vos réunions à l’heure! Cela semble banal, mais la réalité montre que c’est un énorme défi pour plusieurs organisations. Donc même si ce conseil est évident, la réalité montre que les équipes ne le mettent pas en pratique et commencent leurs réunions en retard.\r\n\r\nMon prochain conseil est la suite du précédent et il s’agit de terminer vos réunions à l’heure! Encore une fois, cela peut paraître banal, mais c’est souvent négligé au sein des équipes. J’ai souvent vu dans ma vie des réunions s’étendre bien au-delà de ce qui était prévu à la base. Par exemple, une réunion hebdomadaire qui devait normalement durer de 10h à 11h et qui s’échelonne finalement jusqu’à 11h30 puisque quelqu’un a soulevé un point important qui a démarré une longue et interminable conversation (qui n’était pas sur l’ordre du jour bien entendu).\r\n', 'Personne n’a de temps à perdre en réunion! Ni vous, ni moi, ni votre patron. Si vous animez des réunions, soyez conscient de la valeur du temps des participants. Savez-vous combien vaut 2 heures du temps de votre collègue ou de votre employé? Ce que peut accomplir votre collègue/employé en 2 heures est énorme…. Communiquez d’avance aux participants que vous ne faites pas des réunions pour perdre votre temps, prendre une pause ou prendre des nouvelles du weekend, mais bien dans un but professionnel ainsi que dans le but d’atteindre un résultat bien précis. Si vous animez des réunions appliquez un ou plusieurs de ces conseils dès votre prochaine réunion pour réduire la durée de celle-ci!\r\n', '2021-05-27 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_done`
--

CREATE TABLE `lesson_done` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_undone`
--

CREATE TABLE `lesson_undone` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson_undone`
--

INSERT INTO `lesson_undone` (`user_id`, `lesson_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE `poll` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `preview` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `createAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll`
--

INSERT INTO `poll` (`id`, `title`, `preview`, `category_id`, `image_path`, `createAt`) VALUES
(1, 'Comment éviter la surcharge ', 'Questionnaire concernant les mails', 1, 'question_mail.png', '2021-05-27 00:00:00'),
(2, 'Les échanges', 'Questionnaire concernant \r\nla prise de paroles en réunions.', 2, 'prise_de_paroles.png', '2021-05-28 00:00:00'),
(3, 'Comment éviter le rush', 'Questionnaire concernant \r\ncomment tenir son aganda ', 3, 'organiser_son_aganda.png', '2021-05-28 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `poll_done`
--

CREATE TABLE `poll_done` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `poll_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poll_undone`
--

CREATE TABLE `poll_undone` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `poll_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll_undone`
--

INSERT INTO `poll_undone` (`user_id`, `poll_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `poll_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `description`, `poll_id`) VALUES
(1, 'Vous trouvez que le nombre de réunion quotidien est ?', 1),
(2, 'Trouvez-vous que le nombre de réunion quotidien est excessif ', 1),
(3, 'Vous trouvez que le nombre de réunion quotidien est ?', 2),
(4, 'Trouvez-vous que le nombre de réunion quotidien est excessif ', 2),
(5, 'Vous trouvez que le nombre de réunion quotidien est ?', 3),
(6, 'Trouvez-vous que le nombre de réunion quotidien est excessif ', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_update` datetime NOT NULL,
  `function_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `salt`, `phone`, `date_creation`, `date_update`, `function_id`, `company_id`) VALUES
(1, 'fabian', 'zuo', 'fabianzuo@gmail.com', '123456789', '123', '0618253262', '2021-05-27 00:00:00', '2021-05-27 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_answer`
--

CREATE TABLE `user_has_answer` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `answer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_has_answer`
--

INSERT INTO `user_has_answer` (`user_id`, `answer_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(1, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_answer_question1_idx` (`question_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_company_address1_idx` (`address_id`);

--
-- Indexes for table `function`
--
ALTER TABLE `function`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_lesson_lesson_category1_idx` (`category_id`);

--
-- Indexes for table `lesson_done`
--
ALTER TABLE `lesson_done`
  ADD PRIMARY KEY (`user_id`,`lesson_id`),
  ADD KEY `fk_user_has_lesson_lesson1_idx` (`lesson_id`),
  ADD KEY `fk_user_has_lesson_user1_idx` (`user_id`);

--
-- Indexes for table `lesson_undone`
--
ALTER TABLE `lesson_undone`
  ADD PRIMARY KEY (`user_id`,`lesson_id`),
  ADD KEY `fk_user_has_lesson_lesson2_idx` (`lesson_id`),
  ADD KEY `fk_user_has_lesson_user2_idx` (`user_id`);

--
-- Indexes for table `poll`
--
ALTER TABLE `poll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_formation_category1_idx` (`category_id`);

--
-- Indexes for table `poll_done`
--
ALTER TABLE `poll_done`
  ADD PRIMARY KEY (`user_id`,`poll_id`),
  ADD KEY `fk_user_has_formation_formation1_idx` (`poll_id`),
  ADD KEY `fk_user_has_formation_user1_idx` (`user_id`);

--
-- Indexes for table `poll_undone`
--
ALTER TABLE `poll_undone`
  ADD PRIMARY KEY (`user_id`,`poll_id`),
  ADD KEY `fk_user_has_formation_formation2_idx` (`poll_id`),
  ADD KEY `fk_user_has_formation_user2_idx` (`user_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_question_formation1_idx` (`poll_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_function_idx` (`function_id`),
  ADD KEY `fk_user_company1_idx` (`company_id`);

--
-- Indexes for table `user_has_answer`
--
ALTER TABLE `user_has_answer`
  ADD PRIMARY KEY (`user_id`,`answer_id`),
  ADD KEY `fk_user_has_answer_answer1_idx` (`answer_id`),
  ADD KEY `fk_user_has_answer_user1_idx` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `function`
--
ALTER TABLE `function`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `poll`
--
ALTER TABLE `poll`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `fk_answer_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `fk_company_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `fk_lesson_lesson_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lesson_done`
--
ALTER TABLE `lesson_done`
  ADD CONSTRAINT `fk_user_has_lesson_lesson1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_lesson_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lesson_undone`
--
ALTER TABLE `lesson_undone`
  ADD CONSTRAINT `fk_user_has_lesson_lesson2` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_lesson_user2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `poll`
--
ALTER TABLE `poll`
  ADD CONSTRAINT `fk_formation_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `poll_done`
--
ALTER TABLE `poll_done`
  ADD CONSTRAINT `fk_user_has_formation_formation1` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_formation_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `poll_undone`
--
ALTER TABLE `poll_undone`
  ADD CONSTRAINT `fk_user_has_formation_formation2` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_formation_user2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `fk_question_formation1` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_function` FOREIGN KEY (`function_id`) REFERENCES `function` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_has_answer`
--
ALTER TABLE `user_has_answer`
  ADD CONSTRAINT `fk_user_has_answer_answer1` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_answer_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
