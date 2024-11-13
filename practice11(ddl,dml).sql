--1
INSERT INTO dept2 VALUES(9010, 'temp_10', 1006, 'temp area');

--2
INSERT INTO dept2 VALUES(9020, 'temp_20', 1006, null);

--3

CREATE TABLE professor4
AS
SELECT 
profno,
name,
pay
from professor
where profno <= 3000;

--4
UPDATE professor
SET bonus = 100
where name = 'Sharon Stone';

