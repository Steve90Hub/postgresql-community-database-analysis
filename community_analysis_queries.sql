-- First Display each of the 7 tables to familiarize

select * 
from interview limit 10

select * 
from get_fit_now_check_in limit 10

select * 
from get_fit_now_member limit 10

select * 
from facebook_event_checkin limit 10

select * 
from person limit 10

select * 
from drivers_license limit 10

select * 
from income 
order by 2 desc limit 20

/* 

Question 1.  
What are the popular car brands in the community? 
Show a table that shows a summary of car brands and 
number of persons that owns that brand. 

*/

select car_make as "Car Brand", count(car_make) as "Number of Cars"
from drivers_license
group by "Car Brand"
order by 2 desc

/* 

Question 2. 

The council is thinking of creating a fund raiser. please identify 
the top 20 highest earning individuals in the community.  
It would be nice if you can show us in the table the following:  
Their name, their address, their age, gender, and the type of car they drive.   

*/

select name as "Name", address_street_name as "Address", age as "Age", 
gender as "Gender", car_make as "Car Type", 
annual_income as "Income"
from person as P
left join drivers_license as dl
on P.license_id = dl.id
inner join income
using(ssn)
order by 6 desc limit 20

/* 

Question 3. 

The council have been having some concerns over pressures on the 
use of some available public places such as libraries, parks etc. 
Help the council generate a summary table that shows the name 
of the street and the number of persons living in that street. 

*/

select address_street_name as "Street Name", 
count(name) as "Population"
from person
group by "Street Name"
order by 2 desc

/* 

Question 4. 

The government is planning on promoting fitness. But they 
will need to know some facts about the fitness centre in the DB.  
a.) How many males and females are currently registered at the gym?  
b.) What is the breakdown of the membership status? 
[That is, how many people are there for each membership category?]

*/

-- a.) How many males and females are currently registered at the gym?
-- Observation: One registered gym member did not identify as Male or Female

select gender as "Gender", count(gym.name) as "Population"
from get_fit_now_member as gym
left join person as P
on gym.person_id = P.id
full join drivers_license as dl
on P.license_id = dl.id
group by "Gender"
order by 2 desc

-- b.) What is the breakdown of the membership status?

select membership_status as "Membership Status", count(gym.name) as "Population"
from get_fit_now_member as gym
left join person as P
on gym.person_id = P.id
inner join drivers_license as dl
on P.license_id = dl.id
group by "Membership Status"
order by 2 desc
