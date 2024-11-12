--dml02 merge



-- 신발가게 날짜별 매출
CREATE TABLE SHOE_M
(
    w_date DATE,
    s_code NUMBER(3),-- 매장 고유코드 
    sales  NUMBER(10)
);

-- 옷가게 날짜별 매출
CREATE TABLE CLOT_M
(
    w_date DATE,
    s_code NUMBER(3),-- 매장 고유코드 
    sales  NUMBER(10)
);



-- 본사 전체 매출
CREATE TABLE COMP_M
(
    w_date DATE,
    s_code NUMBER(3),-- 매장 고유코드 
    sales  NUMBER(10)
);

CREATE TABLE COMP_M
(
    w_date DATE,
    s_code NUMBER(3),-- 매장 고유코드 
    sales  NUMBER(10),
    type VARCHAR2(2) -- 가게 구분 코드 'c' 옷가게, 's' 신발가게
);
 
DROP TABLE COMP_M;
-- 하나의 가게
-- 날짜별 여러가게
-- 날짜 구분 코드

INSERT ALL
INTO SHOE_M VALUES (TO_DATE('2024-11-01'), 1, 5000)
INTO SHOE_M VALUES (TO_DATE('2024-11-02'), 1, 10000)
INTO SHOE_M VALUES (TO_DATE('2024-11-03'), 1, 20000)
SELECT *FROM DUAL;

UPDATE SHOE_M 
SET sales = 13000
WHERE w_date = '2024-11-02';

INSERT ALL
INTO CLOT_M VALUES (TO_DATE('2024-11-04'), 50, 5000)
INTO CLOT_M VALUES (TO_DATE('2024-11-05'), 50, 10000)
INTO CLOT_M VALUES (TO_DATE('2024-11-06'), 50, 20000)
SELECT *FROM DUAL;

UPDATE CLOT_M 
SET sales = 9400
WHERE w_date = '2024-11-04';

select * from SHOE_M;

select * from CLOT_M;

select * from COMP_M;

-- DELETE 후 다시 합치는 방식
INSERT INTO COMP_M
select * from SHOE_M;

INSERT INTO COMP_M
select * from CLOT_M;

select s_code, SUM(Sales)
from comp_m
group by s_code;

select SUM(Sales)
from comp_m
where to_char(w_date, 'MM') = 11;

-- 하나의 가게 + 날짜 중복x
MERGE INTO comp_m m
USING SHOE_M s
ON (m.w_date = s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN -- 조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales, 'S');
    
MERGE INTO comp_m m
USING CLOT_M s
ON (m.w_date = s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN -- 조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales, 'M');



SELECT S_CODE, SUM(sales) 
FROM comp_m
group by TYPE, S_CODE;
-- 날짜별 여러가게

-- 날짜별 데이터 추가

INSERT ALL
INTO SHOE_M VALUES (TO_DATE('2024-11-01'), 2, 10000)
INTO SHOE_M VALUES (TO_DATE('2024-11-02'), 2, 20000)
INTO SHOE_M VALUES (TO_DATE('2024-11-03'), 2, 60000)
SELECT *FROM DUAL;

INSERT ALL
INTO CLOT_M VALUES (TO_DATE('2024-11-04'), 60, 19000)
INTO CLOT_M VALUES (TO_DATE('2024-11-05'), 60, 33000)
INTO CLOT_M VALUES (TO_DATE('2024-11-06'), 60, 62000)
SELECT *FROM DUAL;