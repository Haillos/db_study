SELECT -- 1
deptno, name,
decode(name, 'Audie Murphy' ,decode(deptno, 101, 'Best!' )) 비고
FROM professor;

SELECT -- 2
deptno,
name,
decode(name,
        'Audie Murphy' ,decode(deptno, 101, 'Best!' ),
            decode(deptno, 101, 'GOOD!')) 비고
FROM professor;

SELECT -- 3
deptno,
name,
decode(name,
        'Audie Murphy' ,decode(deptno, 101, 'Best!' ),
            decode(deptno, 101, 'GOOD!', 'N/A')) 비고
FROM professor;

SELECT -- 4
name,
jumin,
decode(substr(jumin, 7,1) , 1, '남자', '여자')
FROM student
where deptno1 = 101;

SELECT -- 5
name,
tel,
decode(substr(tel,1,instr(tel, ')')-1) , 02, 'SEOUL', 031, 'GYEONGGI', 051, 'BUSAN', 052, 'ULSAN', 055, 'GYENGNAM') 
FROM student
where deptno1 = 101;


