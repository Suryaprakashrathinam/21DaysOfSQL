-- 3. Find the 3rd to 7th highest patient satisfaction scores from the patients table, showing patient_id, name, service, and satisfaction. Display only these 5 records. 

-- basic approach
-- select patient_id, name, service, satisfaction from patients order by satisfaction desc limit 5 offset 2

-- here multiple patients have same satiscation. so secondary sorting am doing
select patient_id, name, service, satisfaction from patients order by satisfaction desc, patient_id asc limit 5 offset 2