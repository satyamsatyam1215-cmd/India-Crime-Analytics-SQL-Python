-- create database Crime;
use crime;
show tables;

select * from dim_crime;
select * from dim_location;
select * from dim_victim;
select * from dim_weapon;
select * from fact_crime;



-- sample joing process
select f.`Report Number`,f.`Date of Occurrence`,l.City,c.`Crime Description`
from fact_crime f 
left join dim_location l on f.city_ID = l.city_ID 
left join dim_crime c on f.`Crime Code`= c.`Crime Code`;




-- joing all the tables
SELECT f.`Report Number`,f.`Date Reported`,f.`Date of Occurrence`,f.`Time of Occurrence`,
l.City,c.`Crime Description`,c.`Crime Domain`,
v.`Victim Age`,v.`Victim Gender`,
w.`Weapon Used`,
f.`Police Deployed`,f.`Case Closed`,f.`Date Case Closed`
FROM Fact_Crime f
LEFT JOIN Dim_Location l ON f.City_ID = l.City_ID
LEFT JOIN Dim_Crime c ON f.`Crime Code` = c.`Crime Code`
LEFT JOIN Dim_Victim v ON f.Victim_ID = v.Victim_ID
LEFT JOIN Dim_Weapon w ON f.Weapon_ID = w.Weapon_ID;



-- crate table with joined table
create view Crime_analysis as 
select f.`Report Number`,f.`Date Reported`,f.`Date of Occurrence`,f.`Time of Occurrence`,
l.city,
c.`Crime Code`,c.`Crime Description`,c.`Crime Domain`,
v.`Victim Age`,v.`Victim Gender`,
w.`Weapon Used`,
f.`Police Deployed`,f.`Case Closed`,f.`Date Case Closed`
from fact_crime f 
left join dim_location l on f.city_id = l.city_id
left join dim_crime c on f.`crime code`=c.`crime code` 
left join dim_victim v on f.Victim_ID = v.Victim_ID
left join dim_weapon w on f.Weapon_ID = w.Weapon_ID;
-- view thw view 
select * from Crime_analysis;



-- date and time chages 
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
  
-- changing the data type 
desc Crime_analysis;
--   modifying data type
alter TABLE fact_crime
  MODIFY COLUMN `Date Reported` DATETIME,
  MODIFY COLUMN `Date of Occurrence` DATETIME,
  MODIFY COLUMN `Date Case Closed` DATETIME;
alter table dim_victim
modify column `Victim Age` int;
alter table fact_crime
modify column `Police Deployed` int;

-- analysis


-- 1__ Total crime 
select count(*) as Total_Crime from Crime_analysis;

-- 2 __ crime by city 
select city,count(*) as Total_crime from Crime_analysis group by city order by Total_crime desc;

-- 3 __ top crime types 
select `Crime Description`, count(*) as Total_crime from Crime_analysis group by `Crime Description` order by Total_crime desc limit 12;

-- 4 ___ crime domain  
select `Crime Domain`, count(*) as Total_crime from Crime_analysis group by `Crime Domain` order by Total_crime desc ;

-- 4 ___ weapon analyze  # having null values 
select `Weapon Used` , count(*) as Total_crimes from Crime_analysis group by `Weapon Used` order by Total_crimes desc;

-- 5 gender 
select `Victim Gender`, count(*) as Total_cases from Crime_analysis group by `Victim Gender` order by Total_cases desc;

-- 6  age
select `Victim age`, count(*) as Total_cases from Crime_analysis group by `Victim age` order by Total_cases desc;

-- 7 case closure
select `Case Closed`, count(*) as Total_cases from Crime_analysis group by `Case Closed` order by Total_cases desc;

-- 8 closure rate 
select round(sum(`Case Closed`='Yes')*100.0/count(*),2) as Closure_Rate from Crime_analysis;

-- 9  Average resolution time


-- 10 city and Crime Description
select city, `Crime Description`, count(*) as crime_count from Crime_analysis group by city, `Crime Description` order by crime_count desc;

-- 11 crime Weapon
select `Crime Description`,`Weapon Used`, count(*) as crime_count 


