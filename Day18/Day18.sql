-- Combine patient and staff names
-- select
-- 	name as full_name,
--     'patient' as type,
--     service
-- from patients
-- union all select staff_name as full_name,
-- 'staff' as type,
-- service
-- from staff
-- order by service, type, full_name

-- High and low performers
-- select
-- 	patient_id,
--     name,
--     satisfaction,
--     'High Performer' as category
-- from patients
-- where satisfaction>=90 union 
-- select
-- 	patient_id,
--     name,
--     satisfaction,
--     'Low Performer' as category
-- from patients
-- where satisfaction <50 
-- order by satisfaction desc

-- All unique services from multiple tables
-- select
-- 	distinct service from patients
-- union select
-- 	distinct service from staff
-- union select
-- 	distinct service from services_weekly

-- Monthly summary from different metrics
-- select
-- 	'Admissions' as metric,
--     month,
--     sum(patients_admitted) as value 
-- from services_weekly
-- group by month
-- union all 
-- select
-- 	'Refusals' as metric,
--     month,
--     sum(patients_refused) as value
-- from services_weekly
-- group by month order by month, metric

# 1. Combine patient names and staff names into a single list.
-- select
-- 	name from patients
-- union all select staff_name from staff

# 2. Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
-- select
--     name,
--     satisfaction
-- from patients
-- where satisfaction>=90 union 
-- select
--     name,
--     satisfaction
-- from patients
-- where satisfaction <50
-- order by satisfaction, name desc

# 3. List all unique names from both patients and staff tables.
-- select distinct name from patients 
-- union 
-- select distinct staff_name from staff

-- Challange : Create a comprehensive personnel and patient list showing: identifier (patient_id or staff_id), full name, type ('Patient' or 'Staff'), and 
-- associated service. Include only those in 'surgery' or 'emergency' services. Order by type, then service, then name.