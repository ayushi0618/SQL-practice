-- SELECT w1.id
-- FROM Weather w1
-- JOIN Weather w2 
--   ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
-- WHERE w1.temperature > w2.temperature;


select Id from (select Id , temperature , recordDate,
lag(temperature) over (order by recordDate) as prev,
lag(recordDate) over (order by recordDate )as previ
from weather ) as sub
where temperature > prev and  DATEDIFF(recordDate, previ) =1;
