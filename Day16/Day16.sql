-- Patients in services with high average satisfaction
-- select * from patients where service in
-- (select
-- 	service
-- from services_weekly
-- group by service
-- having avg(patient_satisfaction) > 80)

-- Patients older than the average age
-- select name, age from patients where age > (select avg(age) from patients)

-- Services that had any week with refusals
-- select 
-- 	distinct service
-- from services_weekly sw1
-- where exists
-- (select 1
-- from services_weekly sw2
-- where sw2.service = sw1.service and sw2.patients_refused>0) -- --> this can be rewritten as 
-- select distinct service from services_weekly where patients_refused > 0

-- Patients NOT in services with staff shortages
-- select * from patients where service not in(select service from staff group by service having count(*)<5)

-- Find patients with above-average satisfaction in their service
-- select * from patients p1 where satisfaction > (select avg(satisfaction) from patients p2 where p2.service = p1.service)
-- select service from patients where service is not null
-- select * from patients where age > (select avg(age) from patients)

-- 1. Find patients who are in services with above-average staff count.
-- select p.patient_id, p.name, p.age, p.service from patients p join
-- (select
-- 	service,
--     count(*) as staff_count
-- from staff
-- group by service) sc on p.service = sc.service
-- where sc.staff_count > 
-- (select avg(staff_count) from
-- (select
-- 	service,
--     count(*) as staff_count
-- from staff
-- group by service) t )

-- select patient_id, name, age, service from patients where service in(
-- select service from staff group by service having count(staff_id)>
-- (select avg(staff_count) from 
-- (select count(staff_id) as staff_count from staff group by service) as s))

-- 2. List staff who work in services that had any week with patient satisfaction below 70.
-- select * from staff s where exists 
-- (select 1 from services_weekly sw where sw.service = s.service and sw.patient_satisfaction < 70)

-- 3. Show patients from services where total admitted patients exceed 1000.
-- select p.name, p.age, p.service from patients p where p.service in (select service from services_weekly group by service having sum(patients_admitted) > 1000)

-- challenge : Find all patients who were admitted to services that had at least one week where patients were refused AND 
-- the average patient satisfaction for that service was below the overall hospital average satisfaction. Show patient_id, name, service, and their personal satisfaction score.
SELECT 
    p.patient_id,
    p.name,
    p.service,
    p.satisfaction
FROM patients p
WHERE EXISTS (
        SELECT 1
        FROM services_weekly sw1
        WHERE sw1.service = p.service
		AND sw1.patients_refused > 0)
AND (SELECT AVG(sw2.patient_satisfaction) 
	FROM services_weekly sw2
	WHERE sw2.service = p.service) < (SELECT AVG(sw3.patient_satisfaction)
	FROM services_weekly sw3
    );
