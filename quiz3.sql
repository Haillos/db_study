1.

SELECT 
name "이름",
substr(Birthday,1,2) "년도",
substr(Birthday,4,2) "월",
substr(Birthday,7,2) "일"
FROM student;

2.

SELECT 
NAME,
TEL,
INSTR(TEL, ')', 1) "괄호위치"
FROM student
WHERE deptno1 = 201;

3.

SELECT 
NAME,
TEL,
INSTR(TEL, 3, 1) "괄호위치"
FROM student
WHERE deptno1 = 101;

4.

SELECT 
NAME,
TEL,
SUBSTR(TEL, 1,INSTR(TEL, ')', 1)-1) "지역번호"
FROM student
WHERE deptno1 = 201;