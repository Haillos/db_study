/*

1. 조회 SELECT

SELECT 조회 대상 컬럼 명 FROM 테이블명

select * from dept
* : 전체 ALL

테이블구조 확인 (Describe)
DESC 테이블명

조회 데이터 리터럴 활용!
SELECT '문자', 3019 FROM 테이블명;

컬럼명 별도로 지정하기 (컬럼별칭)
SELECT 컬럼명 AS "컬럼별칭"
    컬럼명 "컬럼별칭",
    컬럼명 컬럼별칭
FROM 테이블명;

*/

select * from dept; -- dept 테이블에 있는 모든 컬럼 조회

select * from dept2; -- dept2print_table 테이블에 있는 모든 컬럼 조회

select * from emp;

select mgr, sal from emp; --emp 테이블에서 mgr과 sal 컬럼을 조회

--가독성 고려했을 때
SELECT *
FROM emp;

SELECT
    empno,
    ename,
    job
FROM emp;

DESC emp; -- emp테이블의 구조를 보여달라

SELECT empno, ename, '그냥문자', 999 FROM emp; -- 문자열 사용 시 작은 따옴표 사용

SELECT '그냥''문자"', 999, q' [여기안에입력]' FROM emp;

SELECT ename AS "이름",
        empno "사번",
        job 직업,
        '그냥문자' 중요한의미,
        sal "직원의 월급"
FROM emp;

중복값 제거
DISTINCT

select * from emp;

select DISTINCT job -- job중복제거 조회
FROM emp;

select DISTINCT deptno -- deptno 부서번호 중복제거 조회
FROM emp;

select DISTINCT (deptno) -- deptno 부서번호 중복제거 조회
FROM emp;

select DISTINCT deptno, job -- 두개 조합 중복제거 조회
FROM emp;

|| 연결연산자

SELECT '나는' || '배가고프다' 
FROM dept;

SELECT DEPT NO || DNAME AS "부서번호이름",
       DEPT NO || DNAME "부서번호이름",
       DEPT NO || DNAME 부서번호이름
FROM dept;

SELECT deptno+10,
       deptno+20,
       deptno+30
FROM dept;

SELECT deptno+deptno+deptno
FROM dept;


 
select name || '''s ID: ' || id || ', WEIGHT is' || weight || 'Kg' AS "ID AND WEIGHT"
from student; --연습문제1

select ename || '(' ||job || ') , ' || ename || '''' || job || ''''  AS "NAME AND JOB"
from emp; --연습문제2

select ename || '''s sal is $' || sal AS "Name and Sal"  
from emp; --연습문제3

WHERE 조건
찾고 싶은 조건 (결과 필터링)

SELECT ...
FROM ...
WHERE ...

SELECT * 
FROM emp;

SELECT * 
FROM emp;
where comm is null; -- 성과급 지급 대상 X

SELECT * 
FROM emp;
where comm is not null; -- 성과급 지급 대상

select DISTINCT deptno from emp;

--부서번호 20번 부서에 속한 사람들만 보기
SELECT ename, sal
FROM emp
where deptno = 20;

--emp 테이블 급여 2000 보다 적게 받는 사람들 목록
SELECT * 
FROM table
where sal < 2000;

--emp 테이블 직업이 CLERK인 사람들 취합
SELECT * 
FROM table
where job = 'CLERK',

--emp 테이블 직업이 CLERK이 아닌 사람들 취합
SELECT * 
FROM table
where job <> 'CLERK',
-- whrer job != 'CLERK',

--emp 테이블 급여가 2000~3000인 사람들만 조회
SELECT * 
FROM emp
where sal between 2000 and 3000;
--where sal >= 2000 AND sal <= 3000; 

--student 테이블에서 1학년과 3학년만 조회 (1학년이거나 3학년이거나)
SELECT * 
FROM student
where grade in(1,3);
--where grade = 1 or grade = 3;

--student 테이블에서 1학년과 3학년만 제외하고 조회
SELECT * 
FROM student
where grade 
where grade not in (1,3); -- is null / is not null
-- where grade in (2,4);

---------
LIKE 패턴 검색
    LIKE
        % _
        %: 아무거나 아무갯수 0~개
        _: 그 위치에 한개
SELECT * 
FROM emp
where ename LIKE 'M%'; -- M으로 시작하는 단어
--where ename = 'WARD';

where ename LIKE '%MI%'; -- --MI~ ~MI ~MI~

SELECT * 
FROM emp
where ename lije '_MI'; -- 3글자 2~3번째가 MI
where ename lije '_MI__'; -- 5글자 2~3 번째가 MI
where ename lije '_MI%'; -- n개~글자수 2~3번째가 MI

--< <= > >=
SELECT * 
FROM emp
where hiredate < '1981-95-01'; -- 날짜는 미래가 더 크다
--where hiredate = '91-95-01';

-------------------
정렬 ORDER BY
*정렬을 사용하지 않으면 순서보장 X
ORDER BY 정렬할 기준이 되는 컬럼명 ASC 오름차순 / DESC 내림차순

SELECT ...
FROM ...
WHERE ...
ORDER BY ...

SELECT ...
FROM ...
ORDER BY ...
;

SELECT * 
FROM student
ORDER BY NAME; -- 오름차순

SELECT * 
FROM student
ORDER BY NAME DESC; -- 내림차순



SELECT * 
FROM student
order by grade desc; -- 학년기준 내림차순

SELECT * 
FROM student
order by birthday; -- 생일 기준 오름차순

SELECT * 
FROM student
order by birthday desc; -- 생일 기준 내림차순 ( 큰 수 > 작은 수 방향)
                        -- 날짜에서 큰 수는? 더 최근/미래 작은 수는 ? 과거
                        
SELECT * 
FROM student
where grade in (1,2,3)
order by grade, height desc; -- 학년 오름차순, 키는 내림차순 정렬 

--------------------쿼리 연습


SELECT * 
FROM emp
order by ename;

SELECT * 
FROM emp
order by deptno, sal desc;

SELECT * 
FROM emp
where sal>2000
order by sal desc;

SELECT * 
FROM student
where grade > 1
order by birthday desc;

------------------------
집합 연산자
UNION 합집합 (중복제거)
UNION ALL 합집합 (중복제거X)
INTERSECT  교집합
MINUS 차집합

    조건 (제약)
        1. 컬럼 갯수 동일
        2. 컬럼 데이터형 동일
        3. 컬럼명은 상관 없음.
---
SELECT * 
FROM student
WHERE deptno1 = 101
UNION ALL
SELECT * 
FROM student
WHERE deptno1 = 102;

SELECT studno, name, deptno1 -- 둘 다 존재 하는 컬럼을 선택해야 하며  
FROM student                   -- 타입과 컬럼의 개수가 같아야함.
WHERE deptno1 = 101
UNION ALL
SELECT profno, name, 0 -- 리터럴 값이라도 넣어 컬럼의 개수를 맞춰준다,
FROM professor
WHERE deptno = 101; 

select 
    studno idno,
    name, 
    deptno1 deptno, 
    'email' -- 숫자 / 문자 / 숫자 3개 / email
from student
where deptno1 = 101

UNION ALL

select 
    profno, 
    name,   
    deptno, 
    email -- 숫자 / 문자 / 숫자 / 문자 4개
from professor
where deptno = 101;

SELECT studno, name, deptno1, 'STD' divtype   -- 문자로 구분
FROM student
where deptno1 = 101
union all
SELECT profno, name, deptno, 'PRF'  
FROM professor
where deptno = 101; 

SELECT studno, name, deptno1, 1 divtype  --숫자로 구분
FROM student
where deptno1 = 101
union all
SELECT profno, name, deptno, 2  
FROM professor
where deptno = 101;
-----
SELECT * 
FROM student
where deptno1 = 101
intersect
SELECT * 
FROM student
where deptno2 = 201;

SELECT * 
FROM student
where deptno1 = 101 and deptno2 = 201;

SELECT * 
FROM emp
where job = 'SALESMAN' and comm > 400;
MINUS
SELECT * 
FROM emp 
where hiredate <'1982-01-01';




