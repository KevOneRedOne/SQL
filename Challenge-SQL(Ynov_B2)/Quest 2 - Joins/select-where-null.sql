SELECT * FROM invoices
WHERE (BillingState is NULL) AND (BillingPostalCode is NULL) AND Total >= 10