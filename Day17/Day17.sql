-- 1. Show each patient with their service's average satisfaction as an additional column.
-- select
-- 	p.patient_id,
--     p.name,
--     p.service,
--     p.satisfaction as patient_satisfaction,
-- (select round(avg(p2.satisfaction),2) from patients p2 where p2.service = p.service) as service_avg_satisfaction from patients p

-- 2. Create a derived table of service statistics and query from it.
-- SELECT 
--     ds.*
-- FROM (
--     SELECT  
--         sw.service,
--         SUM(sw.patients_admitted) AS total_admitted,
--         SUM(sw.patients_refused) AS total_refused,
--         ROUND(AVG(sw.patient_satisfaction), 2) AS avg_patient_satisfaction,
--         COUNT(DISTINCT s.staff_id) AS staff_count
--     FROM services_weekly sw
--     LEFT JOIN staff s  
--         ON sw.service = s.service
--     GROUP BY sw.service
-- ) AS ds
-- WHERE ds.avg_patient_satisfaction < 80
-- ORDER BY ds.total_admitted DESC;

-- 3. Display staff with their service's total patient count as a calculated field.
-- select
-- 	s.staff_id,
--     s.staff_name,
--     s.role,
--     s.service,
--     sc.total_admitted from staff s
--     join
--     (select
-- 	service,
--     sum(patients_admitted) as total_admitted
-- from services_weekly
-- group by service) sc
-- 	on s.service=sc.service
-- order by sc.total_admitted desc, s.staff_name

-- challenge : Create a report showing each service with: service name, total patients admitted, the difference between their total admissions 
-- and the average admissions across all services, and a rank indicator ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.
select
	ds.service,
    ds.total_admitted,
    (ds.total_admitted - oa.avg_admitted) as diff_from_avg,
    case
		when ds.total_admitted > oa.avg_admitted then 'Above Average'
        when ds.total_admitted = oa.avg_admitted then 'Average'
        else 'Below Average'
	end as admission_rank 
from (select
	service,
    sum(patients_admitted) as total_admitted
from services_weekly
group by service) ds
cross join 
(select avg(total_admitted) as avg_admitted
from (select
		service,
        sum(patients_admitted) as total_admitted
	from services_weekly
    group by service)x 
)oa
order by ds.total_admitted desc

