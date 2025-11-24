-- 1. Convert all patient names to uppercase.
-- 2. Find the length of each staff member's name.
-- SELECT 
-- 	upper(name) as patients_name,
--     length(name) as length
--     -- concat(staff_id, ' - ', staff_name) as staff_det
--  FROM hospital.patients;
 
 -- 3. Concatenate staff_id and staff_name with a hyphen separator.
--  select 
-- 	distinct(concat(staff_id, ' - ', staff_name)) as staff_det
-- from staff_schedule

-- challenge : Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, age category 
-- (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length. Only show patients whose name length is greater than 10 characters.
SELECT 
	patient_id,
    upper(name) as patients_name,
    lower(service) as service,
    char_length(name) as name_length,
    -- age>=65 as senior
    case 
		when age>=65 then 'Senior'
        when age>=18 then 'Adult'
        else 'Minor'
	end as age_category
FROM hospital.patients where char_length(name)>10