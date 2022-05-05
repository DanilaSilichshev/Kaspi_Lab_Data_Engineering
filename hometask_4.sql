CREATE VIEW `activity_info` AS  
WITH `mainquery` AS (
SELECT DISTINCT `member_id`, `calendar_year_month`, IF(NOT EXISTS(SELECT * FROM `revenue_analysis` WHERE 
 `revenue_analysis`.member_id = `ra`.member_id AND `revenue_analysis`.activity_year_month = `calendar_year_month`
),"Lapsed","Active") AS `member_lifecycle_status` FROM `revenue_analysis` AS `ra` CROSS JOIN `calendar`
 ORDER BY `member_id`, `calendar_year_month`),
 `seq_query` AS (SELECT *, 
	ROW_NUMBER() OVER (PARTITION BY `member_id` ORDER BY `member_id`,`calendar_year_month`) AS `seq1`,
	ROW_NUMBER() OVER (PARTITION BY `member_id`, `member_lifecycle_status` ORDER BY `member_id`,`calendar_year_month`) AS `seq2`
FROM `mainquery`) SELECT `member_id`, `calendar_year_month`, `member_lifecycle_status`, 
 CASE 
	WHEN `member_lifecycle_status` = "Active" THEN 0
	ELSE
	ROW_NUMBER() OVER (PARTITION BY `member_id`, `member_lifecycle_status`, 
    (SELECT `seq1` - `seq2` FROM `seq_query` WHERE `seq_query`.member_id = `mq`.member_id AND 
    `seq_query`.calendar_year_month = `mq`.calendar_year_month) ORDER BY `calendar_year_month`)
END AS `lapsed_months` FROM  `mainquery` `mq` ORDER BY `member_id`,`calendar_year_month`;
