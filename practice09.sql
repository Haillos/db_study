select 
name,
position,
pay
from emp2
where pay >ANY (select pay
                from emp2
                where position = 'Section head' );
                
SELECT
name,
grade,
weight
FROM student
where weight <ALL (select weight
                    from student
                    where grade in 2);
                    

SELECT deptno,avg(pay)
FROM emp2
group by deptno;

SELECT
d.dname,
e.name,
e.pay
FROM emp2 e, dept2 d
where e.deptno = d.dcode
and e.pay <ALL (select avg(pay)
                    from emp2
                    group by deptno);
                    
/*1. professor 테이블과 department 테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의
교수번호화 이름, 학과명을 출력하세요
(입사일 순으로 오름차순 정렬)*/

select
p.profno,
p.name,
d.dname
from professor p , department d
where (p.deptno, p.hiredate) IN (select deptno, MIN(hiredate)
                            from professor
                            group by deptno)
and p.deptno = d.deptno
order by p.hiredate;

/*2. emp2 테이블 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요
(연봉순으로 오름차순 정렬)*/

select name, position, pay
from emp2
where (position, pay) in (select position, max(pay)
                            from emp2
                            group by position)
order by pay;
                            


                            


