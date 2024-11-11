create table new_table
(
    no NUMBER(3),
    name VARCHAR2(10),
    birth DATE
);

select *
from new_table;

desc new_table;

select SYSDATE from dual;

CREATE table tt02
(
    no NUMBER(3,1) DEFAULT 0,
    name VARCHAR2(10) DEFAULT 'NO Name',
    hiredate DATE DEFAULT SYSDATE
);

SELECT * FROM tt02;

--테이블 복사
CREATE TABLE dept3
AS
select * from dept2;    -- 구조 + 데이터 전체 복사

select * from dept3;

CREATE TABLE dept4
AS
select dcode, area from dept2; -- 컬럼 2개 + 데이터 복사

select * from dept4;

CREATE TABLE dept5  -- 컬럼구조만 복사 (데이터 X)
AS
select *
from dept2
where 1=2; -- 거짓 조건

select * from dept5;

-- 테이블 변경
ALTER TABLE dept4
ADD (location VARCHAR2(10) DEFAULT 'Cheonan');

INSERT INTO dept4
VALUES (2000, 'Cheonan Office');
select * from dept4;

--컬럼 삭제
ALTER TABLE dept4
DROP COLUMN location;

CREATE TABLE dept6
As
select * from dept4;

--임시부서여부 체크
ALTER TABLE dept4
ADD (temp_code VARCHAR2(2) DEFAULT 'N');

--테이블 삭제 (rollback 불가 / 자동 commit)
DROP TABLE dept5;

TRUNCATE TABLE dept6;
select *
from dept6;





UPDATE dept4
SET temp_code = 'N';

UPDATE dept4
SET temp_code = 'Y'
WHERE dcode = 2000;

select *
from dept4
where temp_code = 'Y';

CREATE TABLE professor2
AS
SELECT * FROM professor;

select *
from professor2
where position = 'assostant professor';

UPDATE professor2
SET bonus = 200
where position = 'assostant professor';

commit;
rollback;

select *
from dept4
where dcode = 2000;

UPDATE dept4
SET LOCATION = 'Asan'
where dcode = 2000;

INSERT INTO dept4
VALUES(2001, 'Asan Office', 'Asan', 'Y');

--데이터 삭제 rollback 가능 / 자동 commit X
SELECT * FROM dept4;

DELETE FROM dept4; 

select *
--delete
from dept4
where temp_code = 'Y';

