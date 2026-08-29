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
create or replace view Crime_analysis as 
select f.`Report Number`,f.`Date Reported`,f.`Date of Occurrence`,f.`Time of Occurrence`,
case
when hour(f.`Time of Occurrence`) between 0 and 5 then 'Night'
when hour(f.`Time of Occurrence`) between 6 and 11 then 'Morning'
when hour(f.`Time of Occurrence`) between 12 and 16 then 'Afternoon'
when hour(f.`Time of Occurrence`) between 17 and 20 then 'Evening'
when hour(f.`Time of Occurrence`) between 21 and 23 then 'Night'
end as `Time_category`,
l.city,
c.`Crime Code`,c.`Crime Description`,c.`Crime Domain`,
v.`Victim Age`,v.`Victim Gender`,
w.`Weapon Used`,
f.`Police Deployed`,f.`Case Closed`,f.`Date Case Closed`,
case
when f.`Case Closed` = 'Yes'
then DATEDIFF(f.`Date Case Closed`,f.`Date Reported`)
else null
end as `Days_To_Close`
from fact_crime f 
left join dim_location l on f.city_id = l.city_id
left join dim_crime c on f.`crime code`=c.`crime code` 
left join dim_victim v on f.Victim_ID = v.Victim_ID
left join dim_weapon w on f.Weapon_ID = w.Weapon_ID;
-- view thw view 
select * from Crime_analysis;



alter TABLE fact_crime
  MODIFY COLUMN `Date Reported` DATETIME,
  MODIFY COLUMN `Date of Occurrence` DATETIME,
  MODIFY COLUMN `Date Case Closed` DATETIME;
alter table dim_victim
modify column `Victim Age` int;
alter table fact_crime
modify column `Police Deployed` int;