SELECT customers.'FirstName', customers.'LastName', AVG(invoices.'Total') AS InvoicesAverage FROM customers
INNER JOIN invoices ON customers.'CustomerId' = invoices.'CustomerId'
GROUP BY invoices.'CustomerId'
ORDER BY customers.'FirstName' ASC