-- 1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
-- SELECT 
-- 	patient_id,
--     name,
--     satisfaction,
--     case
-- 		when satisfaction>=75 then 'High'
--         when satisfaction>=50 then 'Medium'
--         else 'Low'
-- 	end as satisfactio_category
--     FROM hospital.patients;

-- 2. Label staff roles as 'Medical' or 'Support' based on role type.
-- SELECT 
-- 	staff_id,
--     staff_name,
--     role,
--     case 
-- 		when role in ('doctor', 'Nurse') then 'Medical'
--         else 'Support'
-- 	end as role_type    
-- FROM hospital.staff_schedule;

-- 3. Create age groups for patients (0-18, 19-40, 41-65, 65+).
-- SELECT 
-- 	name,
--     age,
--     case 
-- 		when age between 0 and 18 then 'Child'
--         when age between 19 and 40 then 'Adult'
--         when age between 41 and 65 then 'Citizen'
--         when age > 65 then 'Senior citizen'
--         else 'Unknown'
-- 	end as age_group
-- FROM hospital.patients

-- Challenge : Create a service performance report showing service name, total patients admitted, and a performance category based on the following: 
-- 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. Order by average satisfaction descending.
SELECT 
	service,
    sum(patients_admitted) as total_patients_admitted,
    round(avg(patient_satisfaction), 2) as avg_satisfaction,
    case
		when avg(patient_satisfaction)>=85 then 'Excellent'
        when avg(patient_satisfaction)>=75 then 'Good'
        when avg(patient_satisfaction)>=65 then 'Fair'
        else 'Needs improvement'
	end as performence_category
FROM hospital.services_weekly group by service order by avg(patient_satisfaction) desc