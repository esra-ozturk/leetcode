
WITH cte AS (
SELECT RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary  DESC) ranking, 
e.id , e.departmentId, e.name , e.salary
FROM employee e
)
SELECT  d.name AS Department, cte.name AS Employee, cte.salary AS Salary
FROM  cte 
INNER JOIN department d
ON cte.departmentId = d.id
WHERE cte.ranking = 1;