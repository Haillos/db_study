select 
s.studno 학번,
s.name 이름,
c.total 점수,
h.grade  학점
from student s, score c, hakjum h
where s.studno = c.studno
        and c.total between h.min_point and h.max_point 
        order by h.grade;
        
select 
s.studno 학번,
s.name 이름,
c.total 점수,
h.grade  학점
from student s, score c, hakjum h
where s.studno = c.studno
        and c.total between h.min_point and h.max_point 
        and deptno1 in (101,102)
        order by h.grade;
        
SELECT
s.name,
s.grade,
p.name,
p.deptno,
d.dname
FROM student s , professor p , department d
where s.profno = p.profno
and p.deptno = d.deptno
and p.deptno <> 301;
    --and p.deptno = d.dname;
    
    