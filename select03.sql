1.
SELECT
    ename,
    REPLACE(ename, substr(ename,3,2) ,'--') "REPLACE"
FROM emp;

2.
SELECT
    NAME,   
    REPLACE(JUMIN, SUBSTR(JUMIN,7,7), '-/-/-/-') "주민뒷자리숨김"
FROM student
WHERE deptno1 = 101;

3.
SELECT
    NAME,   
    REPLACE(TEL , SUBSTR(TEL, INSTR(TEL,')',1)+1,3) , '***') "REPLACE",
    SUBSTR(tel, 1,4) || '***' || SUBSTR(tel, 8,5) 숨김2,
    SUBSTR(tel, 1,4) || '***' || SUBSTR(tel, -5,5) 숨김3,
    CONCAT ( CONCAT(SUBSTR(tel,1,4),'***') , SUBSTR(tel,-5,5)) 숨김4
FROM student
WHERE deptno1 = 102;

++Option
SELECT 
    NAME,   
    tel,
    INSTR(tel, ')'), --괄호위치
    INSTR(tel, '-'), --빼기위치
    INSTR(tel, '-') - INSTR(tel, ')') - 1, --위치차이
    
    SUBSTR(tel, INSTR(tel, ')')+1, (INSTR(tel, '-') - INSTR(tel, ')')-1)) "가운데자리", --가운데자리
    
    SUBSTR(tel, 1, instr(tel,')'))
    || LPAD('*', (INSTR(tel, '-') - INSTR(tel, ')') - 1), '*')
    || SUBSTR(tel, -5, 5)
FROM student
WHERE deptno1 = 101;

SELECT LPAD('*', 4, '*')
FROM dual;

4.
SELECT
    NAME,   
    SUBSTR(tel,1,8)|| '****' 숨김3,
    REPLACE(TEL , SUBSTR(TEL, INSTR( TEL,'-',1)+1, 4) , '****') REPLACE
FROM student
WHERE deptno1 = 101;

--------------------------

SELECT 
    round(1.66, 1),
    trunc(1.4567, 2),
    trunc(145.67, -1),
    MOD(15,4)
from dual;

SELECT
    rownum, --행번호
    CEIL(rownum/3),
    CEIL(rownum/4),
    empno,
    ename
FROM emp;

SELECT
    null,
    SYSDATE,
    SYSTIMESTAMP,
    MONTHS_BETWEEN('2024-03-05', '2024-01-04'),
    ADD_MONTHS(SYSDATE,3),
    LAST_DAY(SYSDATE)
FROM dual;

SELECT
    ROUND(SYSDATE), -- 24/11/04 15:48:ss    12:00
    TRUNC(SYSDATE),
    TRUNC(123.113, 1),        
    TRUNC(SYSDATE, 'MM'),
    TRUNC(SYSDATE, 'YY'),
    ADD_MONTHS(SYSDATE, 1),
    SYSDATE + 3,
    SYSDATE - 3,
    SYSDATE + 7,
    --다음달의 첫날
    TRUNC (ADD_MONTHs(SYSDATE,1), 'MM'),
    LAST_DAY(SYSDATE) +1,
    --전월의 마지막 날 
    TRUNC(ADD_MONTHS(SYSDATE, 'MM')-1,
    LAST_DAY(ADD_MONTHS(SYSDATE, -1))
FROM dual;
----------------------
select 2+ '2' --자동형변환
from dual;

select '2' || '123a'
from dual;

select
    TO_CHAR(123),
    TO_CHAR(590493.238),
    TO_CHAR(502.23),
    sysdate,
    TO_CHAR(sysdate), -- 날짜 > 문자
    TO_CHAR(sysdate, 'YYYY'),
    TO_CHAR(sysdate, 'MM'),
    TO_CHAR(sysdate, 'DD'),
    TO_CHAR(sysdate, 'YYYYMMDD'),
    TO_CHAR(sysdate, 'YYYY/MM/DD'),
    TO_CHAR(sysdate, 'YYYY-MM-DD')
from dual;

SELECT 
    sysdate,
    TO_CHAR(sysdate, 'yyyy-mm-dd hh24:MI:ss'),
    TO_CHAR(sysdate, 'hh24:MI:ss'),
    TO_CHAR(round(sysdate), 'yyyy-mm-dd hh24:MI:ss')
FROM dual;

select
    to_char(1234, '999999'),
    to_char(1234, '099999'),
    to_char(1234, '$99999'),
    '$' || 1234,
    to_char(1234, '99999.99'),
    to_char(1234, '99,999')
from;

--문자 > 날짜 TO_DATE
SELECT
    TO_DATE('2024-06-02') + 3,
    TO_DATE('2024/06/02') + 3,
    TO_DATE('24/06/02') + 3,
    TO_DATE('20240602') + 3,
    LAST_DAY('2024-08-05'),
    TO_DATE('24:06:02') + 3,
    TO_CHAR(sysdate, 'yyyy/mm/DD'),
    TO_DATE('2024-01-05', 'YYYY-MM-DD'),
    TO_DATE('2024-01-05', 'YYYY,MM,DD'),
    TO_DATE('12/10/20', 'MM/DD/YY')--12년 10월 20일 >> 12월 10일 20년
FROM dual;

--NVL
SELECT
    sal,
    comm,
    sal*12+comm,
    sal*12+nvl(comm,0) --숫자*12 + NULL
FROM emp;

SELECT -- NVL2 연습문제
    NVL(null, 10),
    NVL2(123, '있다', '없다'),
    NVL2(null, '있다', '없다')
from dual;

SELECT 
decode(10,10,'같다','다르다'),
decode(10,10,'같다'), -- 다르면 Null
decode(10, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다', '아니다')
FROM dual;

SELECT
deptno, name,
decode(deptno, 101, 'Computer Enginerring', 102, 'Multimedia Engineerong', 103, 'Software Engineering' , 'ETC') dept, 
decode(name, 'Audie Murphy' ,decode(deptno, 101, 'Best!' )),
decode(deptno, 101, '컴퓨터공학', null)
FROM professor;

--case
SELECT
    grade,
    decode(grade, 1 , '저학년', 2, '저학년', 3, '고학년', 4, '고학년'),
    case grade
        when 1 then '저학년'
        when 2 then '저학년'
        when 3 then '고학년'
        when 4 then '고학년'
    end as "학년구분",

    case
        when grade in (1,2) then '저학년'
        when grade between 3 and 4 then '고학년'
    end 학년구분
FROM student



