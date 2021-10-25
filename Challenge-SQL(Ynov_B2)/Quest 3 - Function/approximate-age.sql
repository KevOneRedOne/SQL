SELECT FirstName, LastName, (DATE(HireDate) - DATE(BirthDate)) AS ApproximateAge FROM employees
ORDER BY ApproximateAge
