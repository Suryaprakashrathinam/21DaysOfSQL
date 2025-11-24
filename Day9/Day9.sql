-- SELECT 
-- 	patient_id,
--     name,
--     datediff(departure_date, arrival_date) as length_of_stay 
-- from patients

-- 1. Extract the year from all patient arrival dates.
-- select 
-- 	patient_id,
--     name,
--     year(arrival_date) as arrival_year
-- from patients

-- 2. Calculate the length of stay for each patient (departure_date - arrival_date).
-- SELECT 
-- 	patient_id,
--     name,
--     year(arrival_date) as arrival_year,
--     datediff(departure_date, arrival_date) as length_of_stay 
-- from patients

-- 3. Find all patients who arrived in a specific month.
-- SELECT 
-- 	patient_id,
--     name,
--     year(arrival_date) as arrival_year,
--     datediff(departure_date, arrival_date) as length_of_stay 
-- from patients 
-- where month(arrival_date)=3

-- challenge : Calculate the average length of stay (in days) for each service, showing only services where the average stay is more than 7 days. 
-- Also show the count of patients and order by average stay descending.
select
	service,
    round(avg(datediff(departure_date, arrival_date)), 2) as avg_length_of_stay,
    count(patient_id)
from patients
group by service
having avg_length_of_stay>7
order by avg_length_of_stay desc