--복수행 함수

count( 대상) 갯수

SELECT count(*)
FROM emp;

SELECT count(empno), count(*)
FROM emp;

SELECT count(job), count(mgr), count(hiredate), count(comm) 
FROM emp; -- NULL은 카운트 제외

SELECT count(*)
FROM emp
where comm is not null;

select SUM(sal), count (*)
from emp;

-- 10번 20번 부서 다니는 애들 총 몇명? 총 급여 얼마?
SELECT count(*), sum(sal)
FROM emp
where deptno in (10,20);

SELECT AVG(height), MAX(height), MIN(height), STDDEV(height), VARIANCE(height) 
FROM student;

select '1학년',AVG(height)
from student
where grade =1
UNION ALL
select '2학년',AVG(height)
from student
where grade =2
UNION ALL
select '3학년',AVG(height)
from student
where grade =3
UNION ALL
select '4학년',AVG(height)
from student
where grade =4;

select...
from...
where...
group by
order by

SELECT avg(height)
FROM student
group by grade;

select studno, avg(height)
from student
group by studno;

select grade, avg(height) height
from student
group by grade
order by height;








