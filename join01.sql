--join 01

SELECT * 
FROM emp;

SELECT * 
FROM dept;

--조인기준 deptno가 같은
select A.empno, A.ename, B.dname, B.loc, B.deptno
from emp A INNER JOIN dept B
where A.deptno = B.deptno;

--카디션 곱
--조인기준 deptno가 같은
select A.empno, A.ename, B.dname, B.loc, B.deptno
from emp A INNER JOIN dept B;
--where A.deptno = B.deptno;

-- student <- profno -> professor
SELECT * 
from student;

select count(*)
from student;

select *
from professor;

select *
from student s, professor p
where s.profno = p.profno;
-- 둘 다 같은 출력
select *
from student s INNER JOIN professor p
ON s.profno = p.profno;

--INNER JOIN vs OUTER JOIN
select *
from student s, professor p
where s.profno = p.profno(+);

select *
from student s RIGHT OUTER JOIN professor p
ON s.profno = p.profno;

--
select 
s.name STU_NAME,
d.dname DEPT_NAME,
p.name PROF_NAME
from student s, professor p, department d
where s.profno = p.profno
    and
    s.deptno1 = d.deptno; --student 학과번호 = department 학과번호

select 
s.name STU_NAME,
d.dname DEPT_NAME,
p.name PROF_NAME
from student s, professor p, department d
where s.profno = p.profno
    and
    p.deptno = d.deptno; --student 학과번호 = department 학과번호

select 
s.name STU_NAME,
d.dname DEPT_NAME,
p.name PROF_NAME
from student s 
     INNER JOIN professor p
     ON s.profno = p.profno
     INNER JOIN department d
     ON s.deptno1 = d.deptno;
     
--교수학과이름, 학생학과이름
select s.name,
       s.deptno1,
       d.dname, 
       s.profno, 
       p.profno, 
       p.name, 
       p.deptno,
       d2.dname
from student s, professor p, department d, department d2
where s.profno = p.profno
    and s.deptno1 = d.deptno --학생의 학과이름
    and p.deptno = d2.deptno; --교수의 학과이름
    
SELECT * 
FROM customer;

SELECT * 
FROM gift;

-- 1~65000~100000

SELECT c.gname, c.point, g.gname
FROM customer c, gift g
where c.point between g.g_start and g.g_end
;

select 
s.studno 학번,
s.name 이름,
c.total 점수,
h.grade  학점
from student s, score c, hakjum h
where s.studno = c.studno
        and c.total between h.min_point and h.max_point 
        order by h.grade;
select *
from hakjum;

--- 내 사번, 내이름, 내상사 사번, 상사이름
select *
from emp e1, emp e2
where e1.mgr = e2.empno;



