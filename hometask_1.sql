CREATE DATABASE IF NOT EXISTS `kaspi`;
USE `kaspi`;
CREATE TABLE IF NOT EXISTS `HOME_01`(
	`subject` VARCHAR(30),
	`topic` VARCHAR(60),
    `class_date_time` DATETIME
);

INSERT INTO `HOME_01` VALUES ('sql', 'sql basics', '2021-09-20 11:34:00'),
('python', 'mutable data types', '2021-10-28 19:04:00'), ('vizualization', 'visualization tools', '2021-12-24 21:21:00');

INSERT INTO `HOME_01` (`subject`, `topic`) VALUES ('python','pandas'), ('sql', 'views');

INSERT INTO `HOME_01` SELECT * FROM `HOME_01`; 
# Вставка  уже имеющихся значений была осуществлена с помощью подзапроса выборки данных из этой же таблицы `HOME_01`