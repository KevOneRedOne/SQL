SELECT (employees.'FirstName' || ' ' || UPPER(employees.'LastName')) AS FullName, Count(customers.'SupportRepId') AS NumberOfCustomers FROM employees
INNER JOIN customers ON employees.'EmployeeId' = customers.'SupportRepId'
WHERE employees.'Title' = 'Sales Support Agent'
GROUP BY FullName
ORDER BY NumberOfCustomers ASC