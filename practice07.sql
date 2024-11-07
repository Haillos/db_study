--1
select
s.name STU_NAME,
s.deptno1 DEPTNO1,
d.dname DEPT_NAME
from student s, department d
where s.deptno1 = d.deptno
;

--2
select
e.name,
e.position,
e.pay,
p.s_pay,
p.e_pay
from emp2 e, p_grade p
where e.position = p.position(+) and
      e.position is not null;

--3
SELECT * FROM emp2;
SELECT * FROM P_GRADE;

SELECT
e.name 이름,
e.position 지금포지션,
trunc(months_between('2010-05-30', e.birthday)/12+1) 한국나이,
--to_char(birthday, 'YYYY'),
--2010,
--2010-to_char(birthday, 'YYYY')+1
p.position 그나이에맞는포지션
FROM emp2 e, p_grade p
where trunc(months_between('2010-05-30', e.birthday)/12+1) between s_age and e_age
;
----
select
 TRUNC((SYSDATE - BIRTHDAY)/365.0).
 TRUNC((TO_DATE('2010-05-30') - BIRTHDAY)/365, 0)
from EMP2;
----

--4
SELECT
c.gname,
c.point,
g.gname
FROM customer c, gift g
where c.point > g_start and
g.gname like '%book'
;

--5 
SELECT
profno,
name,
hiredate,
rank() over (order by hiredate) -1 입사일이빠른사람
FROM professor;


--6
SELECT 
empno,
ename,
hiredate,
rank() over (order by hiredate) -1
FROM emp;


