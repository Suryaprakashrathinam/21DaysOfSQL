-- 1. Find all patients who are older than 60 years.
-- SELECT name, age FROM patients where age > 60

-- 2. Retrieve all staff members who work in the 'Emergency' service.
-- select staff_name from staff where service like '%emergency%'

-- 3. List all weeks where more than 100 patients requested admission in any service.
-- SELECT distinct week FROM services_weekly where patients_request>100

-- Daily challange (Find all patients admitted to 'Surgery' service with a satisfaction score below 70, showing their patient_id, name, age, and satisfaction score.)
select patient_id, name, age, satisfaction as satisfaction_score from patients where service = 'surgery' and satisfaction<70
