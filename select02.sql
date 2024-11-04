단일행 함수

임시로 사용하는 테이블 dual >> 기능 확인할 때

select ename, INITCAP('ABCDE'), INITCAP(ename)
from emp;

SELECT Lower(name), UPPER(name)
FROM student;

SELECT LENGTH('abcdefg'), LENGTHB('abcdefg'), -- lengthb는 바이트 길이
LENGTH('점심'), LENGTHB('점심')
FROM dual;

SELECT * 
FROM emp -- 이름 5글자 이상인 사람들
where length(ename) >= 5;

SELECT '아침' || '점심' || '저녁' , concat('아침', '점심')
FROM dual;

-- SUBSTR (대상, 시작지점, 자리수)
select 
    SUBSTR('abcdefg', 2, 3),
    SUBSTR('abcdefg', -5, 2) -- -면 뒤에서부터 시작지점
from dual;

SELECT 
    name, 
    SUBSTR(jumin,3,4),
    SUBSTR(jumin,3,4) - 1 "Birthday - 1"
FROM student
WHERE deptno1 = 101;

SELECT 
    INSTR('2024/11/04 10/45/45', '/' , 1),
    INSTR('2024/11/04 10/45/45', '/' , 6) , -- 정한 시작점부터 찾고자 하는 대상의 위치
    INSTR('2024/11/04 10/45/45', '/' , 1, 4),
    INSTR('2024/11/04 10/45/45', '/' , 6, 2),
    INSTR('2024/11/04 10/45/45', '/' , 1, 5),
    INSTR('2024/11/04 10/45/45', '/' , 16, 2)
FROM dual;

SELECT name, tel, instr(tel, ')' , 1, 1) >> 첫번쨰부터 처음 것을 찾는건 생략가능
FROM student
where deptno1 = 201;

SELECT 
    LPAD('문자', 10, '*'),
    LPAD(123, 5, 0),
    LPAD(33, 3, 0)
FROM dual;

SELECT
    LPAD(id, 10, '*'),
    RPAD(id, 10, '*')
FROM student;

SELECT 
LPAD(ename, 9 , 12345)
FROM emp;

--TRIM > 불필요한요소제거
--공백제거용
SELECT 
LTRIM('abcd', 'a'),
LTRIM('abcd', 'd'),
RTRIM('abcd', 'b'),
LTRIM(' abcd '),
RTRIM(' abcd '),
TRIM(' abcd '),
TRIM(' a b c d ')
FROM dual;

SELECT
    REPLACE('abcde', 
FROM dual;

SELECT 
FROM student;