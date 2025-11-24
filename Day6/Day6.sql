SELECT 
	distinct service,
    sum(patients_admitted) as total_patients_admitted,
    sum(patients_refused) as total_patients_refused,
    round(sum(patients_admitted)*100.0/sum(patients_request), 2) as admission_rate
 FROM hospital.services_weekly group by service order by admission_rate desc;