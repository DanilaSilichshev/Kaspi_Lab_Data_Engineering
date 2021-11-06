# Task 1
# Вариант 1 (Через Join)
SELECT DISTINCT `coaches`.discipline AS `discipline`, `coaches`.noc AS `noc` FROM `coaches` INNER JOIN `teams` ON 
`coaches`.discipline = `teams`.discipline AND `coaches`.noc = `teams`.noc GROUP BY `discipline`, `noc`;

# Вариант 2 (Оператор Intersect не поддерживается в MySQL)
SELECT `discipline`, `noc` FROM  `teams`
INTERSECT  
SELECT `discipline`, `noc` FROM  `coaches`;

# Вариант 3 (Эмуляция оператора Intersect в MySQL)
SELECT DISTINCT `teams`.discipline AS `discipline`, `teams`.noc AS `noc` FROM `teams` WHERE EXISTS 
(SELECT * FROM `coaches` WHERE `coaches`.discipline = `teams`.discipline AND `coaches`.noc = `teams`.noc);

# Task 2
SELECT `coaches`.noc AS `noc`, GROUP_CONCAT(DISTINCT `entries_gender`.discipline," ") AS `discipline` FROM `entries_gender` INNER JOIN `coaches` ON 
`coaches`.discipline = `entries_gender`.discipline GROUP BY `coaches`.noc ORDER BY `coaches`.noc;