-- find records with null events
-- SELECT * FROM hospital.services_weekly where event is null

-- find records with not null events
-- SELECT * FROM hospital.services_weekly where event is not null

-- replace null with default value 
-- select
-- 	service,
-- 	week,
--     coalesce(event, 'No Event') as event_status
-- from services_weekly

-- count null values
-- select
-- 	count(*) as total_rows,
--     count(event) as non_null_events,
--     count(*)-count(event) as null_events
-- from services_weekly

-- filter excluding empties and nulls
-- SELECT * FROM hospital.services_weekly where event is not null and event != ''

-- 1. Find all weeks in services_weekly where no special event occurred.
-- select week, service from services_weekly where event is null or event = 'None'

-- 2. Count how many records have null or empty event values
-- select count(*) from services_weekly where event is null or event = 'None'

-- 3. List all services that had at least one week with a special event.
-- select service, event from services_weekly where event<>'none' and event is not null group by service, event

-- challenge : Analyze the event impact by comparing weeks with events vs weeks without events. Show: event status ('With Event' or 'No Event'), 
-- count of weeks, average patient satisfaction, and average staff morale. Order by average patient satisfaction descending.
select 
	case
	when event <> 'none' and event is not null then 'With Event'
	else 'No Event'
	end as event_status,
	count(week) as count_of_weeks,
    round(avg(patient_satisfaction), 2) as avg_patient_satisfaction,
    round(avg(staff_morale), 2) as avg_staff_morale
from services_weekly
group by event_status
order by avg_patient_satisfaction desc