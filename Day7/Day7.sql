-- 1. Find services that have admitted more than 500 patients in total.
-- select 
-- 	service,
--     sum(patients_admitted) as total_patients_admitted
-- from services_weekly
-- group by service
-- having total_patients_admitted > 1200 -- adjusted for cross check
-- order by total_patients_admitted

-- 2. Show services where average patient satisfaction is below 75.
-- select 
-- 	service,
--     round(avg(patient_satisfaction), 2) as avg_patient_satisfaction
-- from services_weekly
-- group by service
-- having avg_patient_satisfaction > 78 -- adjusted for cross check
-- order by avg_patient_satisfaction

-- 3. List weeks where total staff presence across all services was less than 50.
-- SELECT 
-- 	week,
--     sum(present) as total_staff_presence
-- from hospital.staff_schedule
-- group by week
-- having total_staff_presence < 50

-- challenge : Identify services that refused more than 100 patients in total and had an average patient satisfaction below 80. Show service name, total refused, and average satisfaction.
select
	service,
    sum(patients_refused) as total_patients_refused,
    round(avg(patient_satisfaction), 2) as avg_patient_satisfaction
from services_weekly
group by service
having total_patients_refused > 100 and avg_patient_satisfaction < 80