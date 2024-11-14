CREATE TABLE T_ITEM_LIST
(
    no NUMBER(6) PRIMARY KEY,
    item_name VARCHAR2(24) NOT NULL,
    price NUMBER(6),
    create_date DATE DEFAULT SYSDATE
);

CREATE SEQUENCE T_ITEM_LIST_PK_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 999999
NOCYCLE;

select T_ITEM_LIST_PK_SEQ.nextval from dual;

INSERT INTO T_ITEM_LIST (no, item_name, price)
VALUES ( (T_ITEM_LIST_PK_SEQ.nextval) , '순대', 1200);

SELECT * FROM T_ITEM_LIST;

INSERT ALL
INTO T_ITEM_LIST (no, item_name, price) VALUES ( (T_ITEM_LIST_PK_SEQ.nextval) , '순대', 1200)
INTO T_ITEM_LIST (no, item_name, price) VALUES ( (T_ITEM_LIST_PK_SEQ.nextval) , '순대', 1200);
select * from dual;