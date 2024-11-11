--dml

--데이터 저장 INSERT 
--데이터 수정 UPDATE
--데이터 삭제 DELETE
--데이터 병합 MERGE

INSERT INTO 테이블명 (컬럼명...)
VALUES (데이터값...);

INSERT INTO new_table (no, name, birth)
VALUES (1, '이름1', SYSDATE);

INSERT INTO new_table (name, birth, no)
VALUES ('이름2', SYSDATE, 2);

INSERT INTO new_table (name, birth, no)
VALUES ('이름3', '2002-02-16', 3);

INSERT INTO new_table (name, birth, no)
VALUES ('이름4', TO_DATE('2002-10-25'), 4);

--컬럼명 생략
--전체 컬럼에 저장하는 경우 + 순서
INSERT INTO new_table
VALUES (5, '이름5', SYSDATE);

INSERT INTO new_table(no, name)
VALUES (6, '이름6');

INSERT INTO new_table
VALUES (7, '이름7', null);
---
INSERT INTO tt02 (no)
VALUES (1);

INSERT INTO tt02 (no,name,hiredate)
VALUES(2, null, null);

--UPDATE 수정
UPDATE 테이블명
SET 컬럼명 = 값
WHERE 조건
