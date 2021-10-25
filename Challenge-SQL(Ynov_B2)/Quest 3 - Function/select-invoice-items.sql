SELECT invoices.'InvoiceId', tracks.'Name' AS InvoiceItem, tracks.'UnitPrice' FROM invoices
INNER JOIN invoice_items ON invoices.'InvoiceId' = invoice_items.'InvoiceId'
INNER JOIN tracks ON invoice_items.'TrackId' = tracks.'TrackId'
WHERE invoices.'InvoiceId' = 10
ORDER BY tracks.'Name' ASC