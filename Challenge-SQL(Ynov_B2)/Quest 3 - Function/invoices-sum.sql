SELECT SUM(Total) AS AllInvoicesTotalPrice FROM invoices
INNER JOIN customers ON invoices.'CustomerId' = customers.'CustomerId'
WHERE customers.'FirstName' = 'Tim' and customers.'LastName' = 'Goyer'

