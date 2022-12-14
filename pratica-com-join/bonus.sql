SELECT 
	a.id,
	s.name as "school",
	cors.name as "course",
	comp.name as "company",
	r.name as "role"
FROM public.applicants a
JOIN educations e on e."userId" = a."userId"
JOIN schools s ON s.id = e."schoolId"
JOIN courses cors ON cors.id = e."courseId"
JOIN jobs j on j.id = a."jobId"
JOIN companies comp on comp.id = j."companyId"
JOIN roles r ON r.id = j."roleId"
WHERE comp.id = 10 and r.name = 'Software Engineer';