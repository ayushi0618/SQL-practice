# Write your MySQL query statement below
-- select distinct max(salary)  as SecondHighestSalary from employee
-- where salary<(select distinct max(salary) from employee);
with salaryRank as (
    select salary, dense_rank() over(order by salary desc) as rnk
    from employee
)
select max(salary) as secondhighestsalary
from salaryRank
where rnk = 2;