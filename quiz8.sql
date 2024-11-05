SELECT 
avg(sal) 
FROM emp;

SELECT 
avg(sal) 
FROM emp
where deptno=30;

SELECT 
deptno,
avg(sal)
FROM emp
group by deptno;

SELECT
deptno,
count(sal),
avg(sal)
FROM emp
group by deptno;

SELECT 
job,
avg(sal)
FROM emp
group by job;

SELECT  
job,
MAX(sal)
FROM emp
group by job;

SELECT 
deptno,
MAX(sal)
FROM emp
group by deptno;
