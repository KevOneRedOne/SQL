SELECT EmployeeID, LastName, FirstName, strftime('%d/%m/%Y',HireDate) AS HireFrenchDate FROM employees
ORDER BY HireDate ASC