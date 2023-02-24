CREATE TABLE "HR"."NOTICE" 
   (	"BOARDNO" NUMBER(38,0), 
	"TITLE" VARCHAR2(100), 
	"CONTENTS" VARCHAR2(100), 
	"WRITER" VARCHAR2(100), 
	"WRITEDATE" DATE, 
	"RECOMMEND" NUMBER(38,0), 
	"VIEW_COUNT" NUMBER(38,0)
   )
   
   -- 추천게시판(recommend)
   
   CREATE TABLE "HR"."RECOMMEND"(
   	"RE_NO"	NUMBER(38,0),
   	"TITLE" VARCHAR2(100),
   	"CONTENT" VARCHAR2(100),
   	"writer" varchar2(100)
   )
   
   DROP TABLE RECOMMEND -- 테이블 통째로 삭제
   
   CREATE TABLE "HR"."RECOMMEND"(
   	"RE_NO"	NUMBER(38,0),
   	"TITLE" VARCHAR2(100),
   	"CONTENT" VARCHAR2(100),
   	"WRITER" varchar2(100)
   )
   
   -- 폴더명(HR)은 대소문자 구분 / 테이블명,속성명은 대문자든 소문자든 쓴 그대로 들어가고 / 타입은 자동으로 대문자로 변환됨 
   CREATE table "HR"."recommend2"(
   	"re_no"	number(38,0),
   	"title" varchar2(100),HR.RECOMMEND
   	"content" varchar2(100),
   	"writer" varchar2(100)
   )
   
   -- " "안에 쓰는 건 Dbeaver의 특징, 사실 안써도 상관 없음 / " "안에 쓰면 대소문자 구문해줌 / " "이 없으면 소문자도 대문자로
   CREATE table HR.recommend3(
   	re_no number(38,0),
   	RE_NO2 number(38,0),
   	"title" varchar2(100),
   	"TITLE" varchar2(100),
   	"content" varchar2(100),
   	"writer" varchar2(100)
   )
   
   CREATE TABLE "HR"."BOARD3" 
   (	"BOARDNO" NUMBER(38,0), 
	"TITLE" VARCHAR2(100), 
	"CONTENTS" VARCHAR2(100), 
	"WRITER" VARCHAR2(100), 
	"WRITEDATE" DATE, 
	"RECOMMEND" NUMBER(38,0), 
	"VIEW_COUNT" NUMBER(38,0)
   )
   
   ALTER TABLE BOARD3 MODIFY WRITER VARCHAR2(200)
   
   ALTER TABLE BOARD3 DROP COLUMN VIEW_COUNT
   
   ALTER TABLE BOARD3 ADD TEST2 VARCHAR2(200)
   
   DROP TABLE BBS2
   
   -- DCL : DB를 관리/제어해주는 문법 (계정생성, 계정권한부여, 백업, 복구)
   
   CREATE USER APPLE IDENTIFIED BY A1234
   
   GRANT CONNECT, RESOURCE, DBA TO APPLE
   
   DROP TABLE "member"
   
   CREATE TABLE "HR"."PRODUCT3" 
   (	"ID" VARCHAR2(100) PRIMARY key, 
	"NAME" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"PRICE" NUMBER(38,0)
   )
   
   INSERT INTO MEMBER VALUES ('100', '100', 'PARK', '011')
   
   INSERT INTO MEMBER VALUES ('200', '200', 'PARK', '011')
   
   SELECT * FROM MEMBER

   SELECT * FROM MEMBER WHERE ID = '100'
   
   SELECT ID, PW FROM MEMBER WHERE ID = '100'

   SELECT ID AS 아이디, PW FROM MEMBER WHERE ID = '100'

   SELECT TEL FROM MEMBER WHERE NAME = 'paek' -- 조건문 조건의 ' '안에는 대/소문자 구별!
   
   UPDATE MEMBER SET NAME = 'SON' WHERE NAME = 'KIM'

   UPDATE MEMBER SET PW = '123', TEL = '010' WHERE NAME = 'PARK' AND PW = '100'
   
   DELETE FROM MEMBER WHERE TEL = '011'

   DELETE FROM MEMBER WHERE ID = '100'
   
   SELECT * FROM MEMBER WHERE ID = '200' OR PW = '100'
   
   -- id,name,content,price,company,img
   CREATE TABLE PRODUCT (
   	id varchar2(200),
   	name varchar2(200),
   	content varchar2(200),
   	price varchar2(200),
   	company varchar2(200),
   	img varchar2(200)
   )
   
   SELECT * FROM MEMBER ORDER BY ID -- 오름차

   SELECT * FROM MEMBER ORDER BY ID DESC -- 내림차
   
   -- select, update, delete 정리문제
   
   --1
   SELECT * FROM PRODUCT ORDER BY PRICE DESC
   
   --2
   SELECT NAME, CONTENT, PRICE FROM PRODUCT ORDER BY COMPANY
   
   --3
   SELECT NAME, PRICE FROM PRODUCT WHERE ID = '100'
   
   --4
   SELECT NAME, COMPANY FROM PRODUCT WHERE PRICE = '5000'
   
   --5
   SELECT NAME, IMG FROM PRODUCT WHERE ID = '100' AND PRICE = '1000'
   
   --6
   SELECT COMPANY, NAME FROM PRODUCT WHERE COMPANY = 'c100'
 
   --7
   SELECT NAME, PRICE FROM PRODUCT WHERE COMPANY = 'c100' OR COMPANY = 'c200'
   
   --8
   UPDATE PRODUCT SET CONTENT = '품절' WHERE PRICE = '5000'
   
   --9
   UPDATE PRODUCT SET IMG = 'o.png', PRICE = '10000' WHERE ID = '100' OR ID = '102'
   
   --10
   UPDATE PRODUCT SET COMPANY = 'apple', NAME = 'applehouse' WHERE ID = '101'
   
   --11
   DELETE FROM PRODUCT WHERE NAME = 'shoes1' OR ID = '107'
   
   --12
   DELETE FROM PRODUCT WHERE COMPANY = 'c100'
   
   --13
   DELETE FROM PRODUCT
   
   --14
   DROP TABLE PRODUCT
   