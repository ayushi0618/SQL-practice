# Write your MySQL query statement below
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num,
           LEAD(num, 1) OVER (ORDER BY id) AS next_num1,
           LEAD(num, 2) OVER (ORDER BY id) AS next_num2
    FROM Logs
) t
WHERE num = next_num1 AND num = next_num2;