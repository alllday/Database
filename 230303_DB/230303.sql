-- 교안 : https://docs.google.com/presentation/d/1pI7dhOtt_v1kidZFjyLGp-CGbP9bgAMdzWMf27YZ7jU/edit#slide=id.g179e42f73c0_0_74

SELECT * FROM EMP

SELECT LENGTH(trim(ENAME)) FROM EMP

SELECT LENGTH(ENAME) FROM EMP

SELECT CONCAT(EMPNO, ':') AS CONCAT_RESULT FROM EMP

SELECT EMPNO || ':' || ENAME FROM EMP

SELECT CONCAT(CONCAT(EMPNO, ':'), ENAME) AS CONCAT_RESULT FROM EMP

SELECT ENAME FROM EMP

SELECT TRIM(BOTH 'A' from ename) FROM emp -- 양쪽끝에 A를 제거

SELECT TRIM(LEADING 'A' from ename) FROM emp -- 앞쪽에 A를 제거

SELECT TRIM(TRAILING 'A' from ename) FROM emp -- 뒷쪽에 A를 제거

SELECT SAL+COMM FROM EMP 

UPDATE EMP SET COMM = 0 WHERE COMM IS NULL 

-- 문자/숫자함수 정리문제
SELECT * FROM EMP

--1
SELECT LENGTH(ENAME) FROM EMP

--2
SELECT LENGTH(ENAME) FROM EMP WHERE JOB = 'MANAGER'

--3
SELECT ENAME, JOB FROM EMP WHERE COMM IS NULL 

--4
SELECT HIREDATE FROM EMP WHERE COMM IS NOT NULL

--5
SELECT SUBSTR(ENAME, 2) FROM EMP

--6
SELECT SUBSTR(JOB, 1, 3) FROM EMP

--7
SELECT REPLACE(ENAME, 'K', 'P') FROM EMP

--8
SELECT EMPNO || '번은 ' || ENAME || '입니다' FROM EMP 
-- = SELECT  CONCAT(CONCAT(CONCAT(EMPNO, '번은 '), ENAME), '입니다') FROM EMP

--9
SELECT TO_CHAR(HIREDATE, 'MM'), TO_CHAR(HIREDATE, 'DD') FROM EMP

--10
SELECT JOB, 
	CASE JOB
		WHEN 'MANAGER' THEN 'LEVEL11'
		WHEN 'SALESMAN' THEN 'LEVEL12'
		ELSE 'LEVEL13'
	END AS LEVEL_RESULT
FROM EMP
-- =
--SELECT JOB,
--	DECODE(JOB,
--		'MANAGER', 'LEVEL11',
--		'SALESMAN', 'LEVEL12',
--		'LEVEL13') AS LEVEL_RESULT
--FROM EMP
	
-------------------------------

SELECT COUNT(*) FROM EMP -- 행(ROW)개수를 센다

SELECT COUNT(SAL) FROM EMP WHERE JOB = 'SALESMAN'

-- 집계함수
SELECT COUNT(SAL), SUM(SAL), AVG(SAL), MIN(SAL), MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN'

SELECT JOB, COUNT(SAL), SUM(SAL), AVG(SAL), MIN(SAL), MAX(SAL) 
FROM EMP
GROUP BY JOB

SELECT JOB, COUNT(SAL), SUM(SAL), AVG(SAL), MIN(SAL), MAX(SAL) 
FROM EMP
GROUP BY JOB
ORDER BY MAX(SAL) DESC

SELECT JOB, COUNT(SAL), SUM(SAL), AVG(SAL), MIN(SAL), MAX(SAL) 
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) > 2000 -- 그룹을 지어서 검색 후, (그룹을)필터링
ORDER BY COUNT(SAL)

-- 집계/그룹함수 정리 문제
--1
SELECT COUNT(*) FROM EMP

--2
SELECT COUNT(*) FROM EMP
WHERE DEPTNO = 20 OR MGR <= 7700

--3
SELECT MIN(SAL) FROM EMP
WHERE DEPTNO = 10 OR DEPTNO = 20

--4
SELECT MIN(SAL), MAX(SAL), SUM(SAL) FROM EMP

--5
SELECT DEPTNO, AVG(SAL) FROM EMP
GROUP BY DEPTNO

--6
SELECT DEPTNO, SUM(SAL) FROM EMP 
GROUP BY DEPTNO
ORDER BY DEPTNO

--7
SELECT DEPTNO, AVG(SAL) FROM EMP 
GROUP BY DEPTNO  
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO DESC

--8
SELECT COUNT(*), AVG(SAL) FROM EMP 
WHERE JOB = 'MANAGER'

--9
SELECT COUNT(*) FROM EMP 
WHERE ENAME LIKE '%S%'

--10
SELECT * FROM EMP  
WHERE SAL >= 3000 AND COMM IS NOT NULL
ORDER BY SAL DESC

-------------------------
-- join : 왜 하는가? : 검색을 하고 싶은데 항목들이 여러 개의 테이블에 흩어져 있는 경우
-- 2개 테이블의 공통된 값들만 조인해서 검색 

SELECT *
FROM MEMBER m , BBS b 
WHERE M.ID = B.WRITER 

-- 두 테이블중 하나만 있으면 그냥 써도 되지만 같은 이름의 컬럼이 있다면 어느 테이블의 컬럼인지 명시해줘야 함.
SELECT B.NO, B.TITLE, NAME
FROM MEMBER m , BBS b 
WHERE M.ID = B.WRITER 

-- Inner JOIN : 테이블간 공통된 값만 추출
-- emp테이블과 dept테이블을 조인하세요.
-- 하나의 컬럼이상이 동일한 컬럼이 있어야 함.

SELECT EMPNO, ENAME, JOB, E.DEPTNO, LOC
FROM EMP e, DEPT d 
WHERE E.DEPTNO = D.DEPTNO

SELECT *
FROM "MEMBER" m -- LEFT 조인이니까 얘가 기준
LEFT OUTER JOIN BBS b 
ON (M.ID = B.WRITER)

SELECT *
FROM "MEMBER" m 
RIGHT OUTER JOIN BBS b -- RIGHT 조인이니까 얘가 기준
ON (M.ID = B.WRITER)

-- 조인 확인문제
--1
SELECT *
FROM "MEMBER" m, BBS b
WHERE M.ID = B.WRITER 

--2
SELECT *
FROM "MEMBER" m
LEFT OUTER JOIN BBS b
ON (M.ID = B.WRITER)

--3
SELECT *
FROM "MEMBER" m
RIGHT OUTER JOIN BBS b
ON (M.ID = B.WRITER)

--조별활동 조인
-- 뒷 테이블이 기준이고 출력은 앞 테이블이 먼저 나옴. 뒷 테이블에서 하나의 row를 앞 테이블과 모두 합치고, 그 다음 row를 앞 테이블과 모두 합치기
--1
SELECT *
FROM PRODUCT p, COMPANY c
WHERE P.COMPANY = C.ID

--1-1
SELECT *
FROM COMPANY c, PRODUCT p
WHERE C.ID = P.COMPANY

--2
SELECT *
FROM PRODUCT p
LEFT OUTER JOIN COMPANY c
ON (P.COMPANY = C.ID)

--2-2
SELECT *
FROM COMPANY c
LEFT OUTER JOIN PRODUCT p 
ON (C.ID = P.COMPANY)

--3
SELECT *
FROM PRODUCT p
RIGHT OUTER JOIN COMPANY c
ON (P.COMPANY = C.ID)

--3-3
SELECT *
FROM COMPANY c
RIGHT OUTER JOIN PRODUCT p
ON (C.ID = P.COMPANY)

--1. SQL을 3가지로 구분, 각각을 간단 설명, 예를 들어보세요.
--	DDL(스키마, create) , DML(데이터 조작, insert),  DCL(db제어관리, create user, grant)
--2. DML로 할 수 있는 조작 4가지를 부르는 말
--   	       CRUD
--	create, read, update, delete
--3. DML의 조작 4가지에 해당하는 각 SQL문
--	       CRUD
--	create, read, update, delete
--4. 정형데이터 베이스란?
--항목을 정해서 저장하는 db
--5. 스키마란?
--schema : 데이터를 저장하기 위한 틀(뼈대) + 제약조건(db명, 테이블명, 컬럼명, 제약조건)
--6. 제약조건이란? 예 1개 이상
--not null, pk, kf, unique
--7. primary key를 왜 설정하는가?
--not null, unique
--8. foreign key를 왜 설정하는가?
--문제가 있는 데이터가 들어가지 않게 자동 체크
--9. 저장할 대상을 부르는 말? 한글 /영어
--개체, 엔티티
--10. varchar2와 char의 차이
--가변, 불변
--11. join을 왜 하는가?
--검색할 내용이 여러 테이블을 합해서 해야하는 경우
--12. join의 3가지 종류 비교
--inner, left(outer), right(outer)
