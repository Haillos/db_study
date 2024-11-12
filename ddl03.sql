--ddl03


--외래키 참조하는 테이블(부모)에 존재하는 값만 저장 가능 (+null가능)
--외래키 설정된 테이블에서 자신을 참조하는 데이터가 존재(자식)하는 경우, 삭제 불가

--외래키 삭제조건
ON DELETE CASCADE; -- 부모 데이터 삭제시, 그 값을 참조하는 자식 데이터도 같이 삭제
ON DELETE SET NULL; -- 부모 데이터 삭제시, 참조하는 자식 데이터 NULL로 변경

DROP TABLE T_;

CREATE TABLE T_MEMBER
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(30),
    club_id REFERENCES T_CLUB(id) ON DELETE CASCADE
);

CREATE TABLE T_CLUB
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(30)
);

select * from t_club;

INSERT INTO T_CLUB
VALUES (1, '독서');

INSERT INTO T_CLUB
VALUES (2, '등산');

INSERT INTO T_CLUB
VALUES (3, '낚시');

INSERT INTO T_MEMBER
VALUES (1, '가이름', 3);

select * from t_member;

select * 
from t_member m , t_club c
where m.club_id = c.id;

INSERT INTO T_MEMBER
VALUES (2, '나이름', 2); 

INSERT INTO T_MEMBER
VALUES (3, '다이름', 1);

INSERT INTO T_MEMBER
VALUES (4, '라이름', null); 

select *
-- delete 
from t_club
where id = 3;

--데이터 딕셔너리
-- USER_ / DBA_ / ALL_
-- INDEXES / CONSTRAINTS / TABLES / SEQUENCES / SYNONYMS
-- VIEWS / ROLES
select *
from user_ROLE_PRIVS;

SELECT * 
FROM TAB; --테이블 이름 정보

SELECT *
FROM TAB
WHERE tname like '%STU%';

----
CREATE TABLE tt05
(
    id number
    no number 
    age umber
    CONSTRINAT tt05_pk PRIMARY KEY(id, no) --id,no 두개 컬럼을 묶어서 PK
);

