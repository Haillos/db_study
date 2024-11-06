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

--HAVING

SELECT DEPTNO, AVG(sal)
FROM emp
group by deptno
--where AVG(sal >= 2000)
group by deptno
having AVG(sal) >= 2000
;
1) 급여가 1500 이상인 직원들만 대상으로, 부서별 평균 급여
select deptno, AVG(sal)
from emp
where sal >= 1500
group by deptno
;
2) 부서별 평균 급여가 1500 이상인 정보만 보여주기
select deptno, AVG(sal)
from emp
group by deptno
having AVG(sal) >= 1500
;

SELECT
grade,
AVG(weight)
FROM student
where grade <> 4
group by grade
having avg(weight) >= 65
;
select deptno, job, round(avg(sal), 1)
from emp
group by deptno, job;

select deptno, job, round(avg(sal), 1)
from emp
group by ROLLUP(deptno, job);

SELECT * 
FROM emp
where job = 'SALESMAN' and deptno = 30;

group by ROLLUP(deptno, job);
1) deptno, job 그룹화
2) deptno 그룹화 계
3) () 그룹화 계
4  ()계

select deptno, job, mgr, ROUND(AVG(sal), 1)
from emp
group by ROLLUP(deptno, job, mgr);

select deptno, job, round(avg(sal), 1)
from emp
group by ROLLUP((deptno, job)); 
-- 괄호로 묶으면
1) deptno, job 그룹화
2) () 그룹화 계

--RANK DENSE RANK
SELECT 
ename, 
sal, 
RANK() OVER (order by sal desc),
DENSE_RANK() OVER (ORDER BY sal desc)
FROM emp;
--order by sal;

SELECT 
    name, 
    height, 
    RANK() OVER (order by height desc) 순위 1,
    DENSE_RANK() OVER (ORDER BY height desc) 순위 2,
    grade,
    RANK() OVER (partition by grade order by height desc) 순위 3,
    DENSE_RANK() OVER (partition by grade order by height desc) 순위 4
FROM student
order by grade, height desc;












