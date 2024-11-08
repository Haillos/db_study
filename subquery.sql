--subquery

select *
from emp;

--사번이 7844인 사원과 같은 부서 사람들 조회
select *
from emp
where deptno <All (select deptno
                    from emp
                    where empno = 7844);
select deptno
from emp
where empno = 7844;

select * 
from emp2
where  EXISTS (select dcode
                from dept2
                where area = 'Pohang Main Office'
                and dcode = deptno);

select * 
from emp2
where deptno = :dno; --&를 입력하면 스캐너처럼 입력값을 받아 처리
                     --:를 입력하면 바인드 > 기본값 설정
                     
--join
select e.name, d.dname
from emp2 e, dept2 d
where e.deptno = d.dcode;

--subquery
select dname
from dept2
where dcode = 1006;

select
name,
(select dname
    from dept2
    where dcode = deptno) dname
    --where dcode > deptno) dname 다중행 결과를 만들어서 X
from emp2;

select dname
    from dept2
    where dcode > 1010;

select empno,ename,job, '직원'
from emp;

--
select AVG(avg_pay)
from (select deptno, AVG(pay) avg_pay -- 컬럼명 설정으로 상위 select에서 작업가능
        from emp2
        group by deptno);
        
--group by > join        
select e.deptno, e.max_sal, d.dname
from (select deptno, max(sal) max_sal
        from emp
        group by deptno) e, dept d
        where e.deptno = d.deptno;

--join > group by
select deptno, max(sal), dname
from (select e.sal, e.deptno, d.dname
    from emp e, dept d
    where e.deptno = d.deptno)
group by deptno, dname;
