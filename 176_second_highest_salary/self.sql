-- 176. Second Highest Salary
-- https://leetcode.com/problems/second-highest-salary/

/*
Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+

For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
*/


select
    case when (select count(distinct Salary) from Employee) < 2 then null
    else (select distinct Salary from Employee order by Salary desc limit 1 offset 1) end as SecondHighestSalary
from
    Employee
;
