with killer_suspect as 
(select distinct employee_id from keycard_logs
where room = 'CEO office' and entry_time between '2025-10-15 20:45' and '2025-10-15 21.10'),
liars as 
(select distinct a.employee_id from alibis a
join keycard_logs k on a.employee_id = k.employee_id and a.claim_time between k.entry_time and k.exit_time where a.claimed_location<>k.room),
suspicious_calls as 
(select distinct employee_id from (
select caller_id as employee_id from calls
where call_time between '2025-10-15 20:50' and '2025-10-15 21:00'
union all 
select receiver_id as employee_id from calls
where call_time between '2025-10-15 20:50' and '2025-10-15 21:00') sc),
possible_killer as 
(select ks.employee_id from killer_suspect ks
join liars l on ks.employee_id = l.employee_id
join suspicious_calls sc on ks.employee_id = sc.employee_id)
select e.name as killer from possible_killer pk join employees e on e.employee_id = pk.employee_id