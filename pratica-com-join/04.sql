SELECT e.id, u.name, c.name, r.name, e."startDate"
	FROM public.experiences e
	JOIN users u ON u.id = e."userId"
	JOIN companies c ON c.id = e."companyId"
	JOIN roles r ON r.id = e."roleId"
WHERE e."endDate" IS NULL;