SELECT u.id, u.name, c.name as "city"
	FROM public.users u JOIN cities c ON c.id = u."cityId" WHERE c.name = 'Rio de Janeiro';