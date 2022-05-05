# Task 1
SELECT ROW_NUMBER() OVER(ORDER BY `member_id`) AS `position_row`, `member_id`, DATE_FORMAT(`activity_date`, '%Y-%m') AS `act_year_month`, 
SUM(`number_of_wagers`) AS `number_of_wagers` FROM `revenue_analysis` GROUP BY  `member_id`, DATE_FORMAT(`activity_date`, '%Y-%m')
ORDER BY `member_id`;

# Task 2
SELECT DISTINCT `member_id`, DATE_FORMAT(`activity_date`, '%Y-%m') AS `act_year_month`, 
SUM(`number_of_wagers`) OVER (PARTITION BY `member_id`, DATE_FORMAT(`activity_date`, '%Y-%m')) AS `sum`,
SUM(`number_of_wagers`) OVER () AS `sum_n_o_w` FROM `revenue_analysis` ORDER BY `member_id`;
