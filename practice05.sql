select --예 1
empno,
ename,
sal,
COMM,
to_char(sal*12+comm, '99,999') SALARY
from emp
where ename = 'ALLEN';

SELECT --예2
name,
pay,
bonus,
to_char((pay*12)+bonus, '999,999') TOTAL
FROM professor
where deptno = 201; 

SELECT -- 형변환 함수 퀴즈
empno,
ename,
to_char(hiredate, 'YYYY-MM-DD') HIREDATE,
to_char((sal*12+comm) , '$999,999') SAL,
to_char((sal*12+comm)*1.15 , '$999,999') "15% UP"
FROM emp
where comm is not null;

SELECT
profno,
name,
pay,
bonus,
12*pay+nvl(bonus,0) TOTAL
FROM Professor
where deptno = 201;

SELECT
empno,
ename,
comm,
sal*12 + comm TOTAL,
sal*12 + nvl(comm,0) TOTAL2,
sal*12 + nvl2(comm, comm, 0) TOTAL3
FROM emp
where deptno = 30;