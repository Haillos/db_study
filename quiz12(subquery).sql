select *  from emp2;
select *  from dept2;



select
e.empno,
e.name,
e.deptno,
d.dname,
d.area,
e.pay
from emp2 e, dept2 d
where e.deptno = d.dcode and
pay >= (SELECT avg(pay)
        FROM emp2 e, dept2 d
        WHERE e.deptno = d.dcode and
              d.area in (select d.area
                            from emp2 e, dept2 d                            
                            where name = 'AL Pacino'
                            and e.deptno = d.dcode)
        group by area);



SELECT d.area, avg(pay)
FROM emp2 e, dept2 d
WHERE e.deptno = d.dcode
group by area;

