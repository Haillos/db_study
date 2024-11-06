/*SELECT
empno "사번",
name "이름",
substr(birthday,1,1 "생년월일",
pay "급여",
(pay * 1.5) "성과급",
emp_type,
tel ,
case 
    when pay <= 35000000 then '화이팅'
    when pay > 35000001 and pay <=45000000 then '하'
    when pay > 45000001 and pay <=60000000 then '중'
    when pay > 60000001 then '상'
     end  as "급여수준"
FROM emp2
where emp_type= 'Permanent employee'
group by t*/

SELECT  
    empno 사번,
    name 이름,
    birthday 생년월일,
    hobby 취미,
    pay 급여,
    pay*1.5 성과급,
    replace(emp_type, 'employee', 'family') 직원분류,
    substr(emp_type, 1, instr(emp_type, ' ')) || 'family' 직원분류2,
    case 
    when pay <= 35000000 then '화이팅'
    when pay > 35000001 and pay <=45000000 then '하'
    when pay > 45000001 and pay <=60000000 then '중'
    when pay > 60000001 then '상'
     end  as "급여수준",
     tel
FROM emp2
where TO_char(birthday, 'YY') between 70 and 79
and
substr( tel , 1 , instr( tel , ')' ) -1) in (02, 031)
;