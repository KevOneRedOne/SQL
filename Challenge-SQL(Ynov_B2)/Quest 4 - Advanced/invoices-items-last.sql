SELECT Name FROM tracks
WHERE "TrackId" = (
		SELECT invoice_items.'TrackId' FROM invoices
		INNER JOIN invoice_items ON invoice_items.'InvoiceId' = invoices.'InvoiceId'
		ORDER BY invoices.'InvoiceDate' DESC
		LIMIT 1)