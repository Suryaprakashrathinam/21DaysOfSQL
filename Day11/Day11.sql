-- 1. List all unique services in the patients table.
SELECT 
	distinct service from hospital.patients;
    
-- 2. Find all unique staff roles in the hospital.
-- select 
-- 	distinct role from hospital.staff;
    
-- 3. Get distinct months from the services_weekly table.
-- SELECT DISTINCT month
-- FROM hospital.services_weekly;

-- Challenge : Find all unique combinations of service and event type from the services_weekly table where events are not null or none,
--  along with the count of occurrences for each combination. Order by count descending
select 
	distinct service, event,
    count(*) as occurence_count
from services_weekly
where event is not null and event!='none'
group by service, event 
order by occurence_count desc 