
SELECT 
name,
jumin,
birthday,
case
    when substr(birthday,4,2) in (01,02,03) then '1분기' 
    when substr(birthday,4,2) in (04,05,06) then '2분기' 
    when substr(birthday,4,2) in (07,08,09) then '3분기' 
    when substr(birthday,4,2) in (10,11,12) then '4분기'
        end as 분기,

case
    when to_char(birthday,'MM') in (01,02,03) then '1분기' 
    when to_char(birthday,'MM') in (04,05,06) then '2분기' 
    when to_char(birthday,'MM') in (07,08,09) then '3분기' 
    else '4분기'
        end as 분기
        
FROM student;


SELECT
empno,
ename,
sal,
case
    when sal < 1001 then 'Level 1'
    when sal > 1000 and sal < 2001 then 'Level 2'
    when sal > 2000 and sal < 3001 then 'Level 3'
    when sal > 3000 and sal < 4001 then 'Level 4'
    when sal > 4000 then 'Level 5'
    end as "LEVEL"
FROM emp;

