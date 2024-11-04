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
    TO_CHAR(sysdate, 'yyyy-mm-dd hh24:MI:ss')
FROM dual;