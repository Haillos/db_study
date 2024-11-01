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

