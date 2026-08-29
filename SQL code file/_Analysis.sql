
-- analysis
-- 1__ Total crime 
select count(*) as Total_Crime from Crime_analysis;

-- 2 __ crime by city 
select city,count(*) as Total_crime from Crime_analysis group by city order by Total_crime desc;

-- 3 __ top crime types 
select `Crime Description`, count(*) as Total_crime from Crime_analysis group by `Crime Description` order by Total_crime desc limit 12;

-- 4 ___ crime domain  
select `Crime Domain`, count(*) as Total_crime from Crime_analysis group by `Crime Domain` order by Total_crime desc ;

-- 4 ___ weapon analyze !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! # having null values 
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
select hour(`Time of Occurrence`) as hour, count(*) as Total_Crimes from crime_analysis
 group by hour order by hour;
 
-- 10 city and Crime Description
select city, `Crime Description`, count(*) as crime_count from Crime_analysis group by city, `Crime Description` order by crime_count desc;

-- 11 crime Weapon!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! # having null values 
select `Crime Description`,`Weapon Used`, count(*) as crime_count from Crime_analysis  group by `Crime Description`,`Weapon Used`order by crime_count desc;

-- 12 gender crime 
select `Crime Description`,`Victim Age`,count(*) as Crime_count  from Crime_analysis group by `Crime Description`,`Victim Age` order by crime_count desc;

-- 13 city closure rate 
select City, count(*) as Total_Cases,sum(`Case Closed` = 'Yes') as Closed_Cases,round(sum(`Case Closed` = 'Yes') * 100.0 / count(*),2) as Closure_Rate
from crime_analysis group by City order by  Closure_Rate desc;

-- 14 ploice deployemnt vs closure rate 
select `Police Deployed`, count(*) as Total_Cases, sum(`Case Closed`='Yes') as Closed_cases, round(sum(`Case Closed`='Yes')* 100.0/count(*),2) as closure_rate
from Crime_analysis group by `Police Deployed` order by Total_Cases desc ;

-- 15 crime Yearly trend 
select year(`Date of Occurrence`) as Year, count(*) as Total_crimes from Crime_analysis group by Year order by year;

-- 16 crime monthly treand 
select year(`Date of Occurrence`) as year , month(`Date of Occurrence`) as month , monthname(`Date of Occurrence`) as Month_name, count(*) as Total_crimes
from Crime_analysis group by year,month,month_name order by year, month;