-- 1
CREATE TABLE T_PERSON_INFO
(
     id number(8) PRIMARY KEY,
     name varchar2(64),
     age number(3),
     dept varchar2(64)
);

INSERT INTO T_PERSON_INFO VALUES(20210034, '이상형', 21, '법학과'); 
INSERT INTO T_PERSON_INFO VALUES(20220011, '김건우', 24, '물리학과'); 
INSERT INTO T_PERSON_INFO VALUES(20240109, '전지훈', 21, '컴퓨터공학과'); 
INSERT INTO T_PERSON_INFO VALUES(20230002 '강순구', 21, '건축학과'); 

--2

CREATE TABLE board_list
(
    board_list_id number(5) PRIMARY KEY,
    title varchar2(100) NOT NULL,
    content varchar2(2000),
    writer varchar2(60) NOT NULL,
    create_time number(13) NOT NULL  
);

--3

SELECT 
e.empno no,
e.ename name,
e.sal salary,
d.dname d_name,
d.loc loc
from emp e, dept d
where e.deptno = d.deptno and e.sal >= 2000
order by e.sal desc;

--4
commit;
rollback;

--5
1) OracleServiceORCL
2) 192.168.0.1
3) 4872
4) scott
5) tiger

