-- USE hospital;
-- 1. Retrieve all columns from the patients table. 
-- SELECT * FROM patients;

-- 2. Select only the patient_id, name, and age columns from the patients table.
-- SELECT patient_id, name, age FROM patients;

-- 3. Display the first 10 records from the services_weekly table.
-- select * from services_weekly limit 10

-- List all unique hospital services available in the hospital
select distinct service from services_weekly
