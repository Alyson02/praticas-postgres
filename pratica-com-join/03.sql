SELECT e.id, u.name, s.name, c.name, e."endDate"
	FROM public.educations e
	JOIN users u ON u.id = e."userId"
	JOIN schools s ON s.id = e."schoolId"
	JOIN courses c ON c.id = e."courseId"
	where status = 'finished' and u.id = 30;