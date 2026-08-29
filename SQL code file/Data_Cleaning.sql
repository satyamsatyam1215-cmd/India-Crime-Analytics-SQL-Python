-- 1  correcting the formate 
SET SQL_SAFE_UPDATES = 0;
START TRANSACTION;
UPDATE fact_crime SET 
  `Date Reported` = CASE
    WHEN `Date Reported` LIKE '____-__-__ __:__:__' THEN `Date Reported`
    WHEN CAST(LEFT(`Date Reported`, 2) AS UNSIGNED) > 12 THEN DATE_FORMAT(STR_TO_DATE(`Date Reported`, '%d-%m-%Y %H:%i'),'%Y-%m-%d %H:%i:%s')
    ELSE DATE_FORMAT(STR_TO_DATE(`Date Reported`, '%m-%d-%Y %H:%i'),'%Y-%m-%d %H:%i:%s')
  END,
  `Date of Occurrence` = CASE
    WHEN `Date of Occurrence` LIKE '____-__-__ __:__:__' THEN `Date of Occurrence`
    WHEN CAST(LEFT(`Date of Occurrence`, 2) AS UNSIGNED) > 12 THEN DATE_FORMAT(STR_TO_DATE(`Date of Occurrence`, '%d-%m-%Y %H:%i'),'%Y-%m-%d %H:%i:%s')
    ELSE DATE_FORMAT(STR_TO_DATE(`Date of Occurrence`, '%m-%d-%Y %H:%i'),'%Y-%m-%d %H:%i:%s')
  END,
  `Date Case Closed` = CASE
    WHEN `Date Case Closed` IS NULL OR `Date Case Closed` = '' THEN NULL
    WHEN `Date Case Closed` LIKE '____-__-__ __:__:__' THEN `Date Case Closed`
    WHEN CAST(LEFT(`Date Case Closed`, 2) AS UNSIGNED) > 12 THEN DATE_FORMAT(STR_TO_DATE(`Date Case Closed`, '%d-%m-%Y %H:%i'),'%Y-%m-%d %H:%i:%s')
    ELSE DATE_FORMAT(STR_TO_DATE(`Date Case Closed`, '%m-%d-%Y %H:%i'),'%Y-%m-%d %H:%i:%s')
  END;
  
  
  -- values corection 
update dim_victim set `Victim Gender`= case
when `Victim Gender`='M' then 'Male'
when `Victim Gender`='F' then 'Female'
end;
