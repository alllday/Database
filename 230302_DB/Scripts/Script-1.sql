CREATE TABLE member
   ( "ID" VARCHAR2(10), 
	"PW" VARCHAR2(10), 
	"NAME" VARCHAR2(10), 
	"TEL" VARCHAR2(10)
	)
	
	CREATE TABLE BBS
(	
	no VARCHAR2(100),
	TITLE VARCHAR2(100),
	CONTENT VARCHAR2(100),
	WRITER VARCHAR2(100)
)

CREATE TABLE PRODUCT(
ID VARCHAR2(200),
NAME VARCHAR2(200),
CONTENT VARCHAR2(200),
PRICE VARCHAR2(200),
COMPANY VARCHAR2(200),
IMG VARCHAR2(200)
)

CREATE TABLE orderList (
	no VARCHAR2(100),
	member_id varchar2(100),
	product_id varchar2(100),
	total_count varchar2(100)
) 

CREATE TABLE depart (
	id VARCHAR2(100),
	name varchar2(100),
	instructor varchar2(100)
) 

SELECT * FROM depart

CREATE TABLE student (
	id VARCHAR2(100),
	name varchar2(100),
	tel varchar2(100),
	depart_id varchar2(100)
) 

SELECT * FROM STUDENT

CREATE TABLE subject (
	id VARCHAR2(100),
	title varchar2(100),
	depart_id varchar2(100)
) 

SELECT * FROM SUBJECT

CREATE TABLE "HR"."BBS2" 
(	"no" VARCHAR2(100), 
	"TITLE" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"WRITER" VARCHAR2(100), 
	 CONSTRAINT "BBS_PK22" PRIMARY KEY ("no"),
	 CONSTRAINT "FK_MEMBER22" FOREIGN KEY ("WRITER")
	  REFERENCES "HR"."MEMBER" ("ID")
) 

CREATE TABLE "HR"."BBS3" 
(	"no" VARCHAR2(100), 
	"TITLE" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"WRITER" VARCHAR2(100)
) 

--PK
ALTER TABLE HR.BBS3
ADD CONSTRAINT BBS3_PK PRIMARY KEY ("no")
ENABLE;

--FK
ALTER TABLE HR.BBS3 
ADD CONSTRAINT FK_MEMBER33 
FOREIGN KEY (WRITER) REFERENCES HR."MEMBER"(ID);

CREATE TABLE DEPART2
(
	ID VARCHAR2(100),
	NAME VARCHAR2(100),
	INSTRUCTOR VARCHAR2(100),
	CONSTRAINT "DEPART2_PK22" PRIMARY KEY ("ID")
)

CREATE TABLE STUDENT2
(
	ID VARCHAR2(100),
	NAME VARCHAR2(100),
	TEL VARCHAR2(100),
	DEPART_ID VARCHAR2(100)
)

ALTER TABLE STUDENT2
ADD CONSTRAINT STUDENT2_PK
PRIMARY KEY ("ID")
ENABLE;
-- ENABLE; 없어도 상관없는데 이뮤는 몰라~

ALTER TABLE STUDENT2
ADD CONSTRAINT FK_DEPART22
FOREIGN KEY (DEPART_ID)
REFERENCES HR."DEPART2"(ID);

-- 테이블복사
CREATE TABLE member22
AS SELECT * FROM member

INSERT INTO MEMBER22
VALUES ('banana', 'banana', 'banana', 'banana', sysdate)

SELECT * FROM member22

INSERT INTO MEMBER22
VALUES ('banana2', 'banana2', 'banana2', 'banana2', sysdate, 'aaa')

INSERT INTO BBS 
VALUES (bbs_id_seq.nextval, 'happy', 'happy day', 'ice')

SELECT * FROM bbs

INSERT INTO BBS 
VALUES (bbs_id_seq.nextval, 'happy2', 'happy day2', 'ice')

SELECT * FROM bbs

CREATE SEQUENCE pd_id_seq INCREMENT BY 1 START WITH 1

CREATE TABLE PRODUCT2 
(
	id number(38,0),
	name varchar(100)
)

INSERT INTO PRODUCT2
VALUES (pd_id_seq.nextval, 's')

SELECT * FROM product2

CREATE TABLE orderlist2
(
	id number(38,0),
	title varchar(100),
	price number(38,0)
)

CREATE SEQUENCE or_seq INCREMENT BY 1 START WITH 1

INSERT INTO ORDERLIST2
VALUES (or_seq.nextval, 'c', 300)

SELECT * FROM ORDERLIST2

SELECT * FROM ORDERLIST2
ORDER BY id -- 오름차순

SELECT * FROM ORDERLIST2
ORDER BY id DESC -- 내림차순

SELECT * FROM ORDERLIST2
WHERE id >= 3
ORDER BY id -- 오름차순

CREATE TABLE DEPT
(
	DEPTNO NUMBER(2),
	DNAME VARCHAR2(14 BYTE),
	LOC VARCHAR2(13 BYTE)
)

CREATE TABLE EMP
(
	EMPNO NUMBER(4),
	ENAME VARCHAR2(10 BYTE),
	JOB VARCHAR2(9 BYTE),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2)
)

CREATE TABLE SALGRADE
(
	GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER
)

ALTER TABLE DEPT ADD (
CONSTRAINT PK_DEPT
PRIMARY KEY
(DEPTNO));

ALTER TABLE EMP ADD (
CONSTRAINT PK_EMP
PRIMARY KEY
(EMPNO));

ALTER TABLE EMP ADD (
CONSTRAINT FK_DEPTNO
FOREIGN KEY (DEPTNO)
REFERENCES DEPT (DEPTNO));

SELECT * FROM emp -- selection : 행

SELECT deptno FROM emp -- projection : 열

SELECT DISTINCT deptno FROM emp -- DISTINCT : 중복제거

SELECT ename, sal * 12 AS yearsal FROM emp

SELECT * FROM EMP
WHERE DEPTNO = 30
ORDER BY sal

SELECT * FROM EMP
WHERE NOT DEPTNO = 30
ORDER BY sal DESC

SELECT * FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN'

SELECT * FROM EMP
WHERE JOB IN ('SALSEMAN', 'MANAGER')

SELECT * FROM EMP
WHERE JOB NOT IN ('SALSEMAN', 'MANAGER')

SELECT * FROM EMP
WHERE SAL BETWEEN 2000 AND 3000

SELECT * FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000

SELECT * FROM EMP
WHERE ENAME LIKE '_L%'

SELECT * FROM EMP
WHERE ENAME NOT LIKE '_L%'

SELECT * FROM EMP
WHERE COMM IS NULL 

SELECT * FROM EMP
WHERE COMM IS NOT NULL

CREATE TABLE DETP_TEMP2
AS SELECT * FROM DEPT

SELECT * FROM DETP_TEMP2

UPDATE DETP_TEMP2
SET LOC = 'SEOUL'

UPDATE DETP_TEMP2
SET DNAME = 'DATABASE', LOC = 'BUSAN'

UPDATE DETP_TEMP2
SET DNAME = 'SALES'
