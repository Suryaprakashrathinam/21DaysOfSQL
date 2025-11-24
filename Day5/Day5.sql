SELECT 
	sum(patients_admitted) as total_patients_admitted,
    sum(patients_refused) as total_patients_refused,
    round(avg(patient_satisfaction), 2) as average_patient_satisfaction
FROM hospital.services_weekly;