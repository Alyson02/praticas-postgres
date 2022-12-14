SELECT t.id, w.name as "writer", r.name as "recipient", t.message, "publicationDate"
	FROM public.testimonials t 
	JOIN users w on w.id = t."writerId"
	JOIN users r on r.id = t."recipientId";