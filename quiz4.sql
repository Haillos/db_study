SELECT 
studno 번호,
name 이름,
ID 아이디
FROM student
where height>159 and height<176
union all
SELECT 
profno 번호,
name 이름,
ID 아이디
FROM professor
where deptno in(101,102,103,201) and nvl(bonus,'0') = 0;
-- bonus is null



SELECT
'이름:'||name 이름,
'아이디:'||ID 아이디,
'주민번호:'||substr(jumin,1,6)||'-'||substr(jumin,7,7) 주민번호
FROM student;