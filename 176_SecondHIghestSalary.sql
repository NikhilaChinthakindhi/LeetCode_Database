/*
Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the query should return 200 as the second highest salary. 
If there is no second highest salary, then the query should return null.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+


1st solution
select max(salary) as SecondHighestSalary
from employee where id not in
(select id from employee where salary= 
 (select max(salary) from employee))
 */

select ifnull(
    (select distinct salary
    from employee
    order by salary desc
    limit 1 offset 1)
    , NULL) as SecondHighestSalary