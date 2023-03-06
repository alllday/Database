-- 테이블 생성
CREATE TABLE nm_subject (
	강좌이름 varchar2(100) PRIMARY key,
	강의실 varchar2(100) NOT null
)

CREATE TABLE nm_department (
	학과 varchar2(100) PRIMARY key,
	학과사무실 varchar2(100) NOT null
)

CREATE TABLE nm_record (
	학생번호 number(38,0) NOT NULL,
	강좌이름 varchar2(100) NOT NULL,
	성적 float(22) NOT NULL
)

CREATE TABLE nm_student_information (
	학생번호 number(38,0) PRIMARY KEY,
	학생이름 varchar2(100) NOT NULL,
	주소 varchar2(100) NOT NULL,
	학과 float(22) NOT NULL
)

-- foreign key
ALTER TABLE HR.NM_RECORD 
ADD CONSTRAINT FK_NM_SUBJECT
FOREIGN KEY (강좌이름) 
REFERENCES HR.NM_SUBJECT(강좌이름);

ALTER TABLE NM_RECORD
ADD CONSTRAINT fk_nm_student_information
FOREIGN KEY (학생번호)
REFERENCES nm_student_information(학생번호)

ALTER TABLE NM_student_information
ADD CONSTRAINT fk_nm_department
FOREIGN KEY (학과)
REFERENCES nm_department(학과)

-- insert (순서주의)
INSERT INTO NM_SUBJECT VALUES ('db', 'a1')

INSERT INTO NM_SUBJECT VALUES ('java', 'a2')

INSERT INTO NM_DEPARTMENT VALUES ('건축과', 'aa1')

INSERT INTO NM_DEPARTMENT VALUES ('컴퓨터공학과', 'bb1')

INSERT INTO NM_STUDENT_INFORMATION VALUES (1, '홍길동', '서울', '건축과')

INSERT INTO NM_STUDENT_INFORMATION VALUES (2, '김철수', '부산', '컴퓨터공학과')

INSERT INTO NM_RECORD VALUES (2, 'db', 3.0)

INSERT INTO NM_RECORD VALUES (2, 'java', 4.0)

-- update
UPDATE NM_RECORD SET 학생번호 = 1 WHERE 강좌이름 = 'db'

UPDATE NM_RECORD SET 성적 = 3.5 WHERE 강좌이름 = 'db'

UPDATE NM_SUBJECT SET 강좌이름 = 'db' WHERE 강의실 = 'a01'

UPDATE NM_SUBJECT SET 강좌이름 = 'java' WHERE 강의실 = 'a02'

UPDATE NM_STUDENT_INFORMATION SET 학과 = '건축과' WHERE 학생이름 = '김철수'

UPDATE NM_STUDENT_INFORMATION SET 주소 = '인천' WHERE 학생이름 = '김철수'

UPDATE NM_DEPARTMENT SET 학과 = '멀티미디어공학과' WHERE 학과 = '컴퓨터공학과'

UPDATE NM_STUDENT_INFORMATION SET 학과 = '멀티미디어공학과' WHERE 학생이름 = '김철수'

-- DELETE 
DELETE FROM NM_RECORD WHERE 학생번호 = 1

DELETE FROM NM_SUBJECT WHERE 강좌이름 = 'db'

DELETE FROM NM_STUDENT_INFORMATION WHERE 학생번호 = 1

DELETE FROM NM_DEPARTMENT WHERE 학과 = '건축과'

--join
SELECT *
FROM NM_SUBJECT ns, NM_RECORD nr
where ns.강좌이름 = nr.강좌이름

SELECT *
FROM NM_SUBJECT ns 
INNER JOIN NM_RECORD nr 
on ns.강좌이름 = nr.강좌이름 

--subquery
SELECT * FROM hr.NM_STUDENT_INFORMATION nsi 
WHERE 학생번호 IN (SELECT 학생번호 FROM hr.NM_RECORD nr WHERE 성적 = 4.0)

SELECT * FROM hr.NM_STUDENT_INFORMATION nsi 
WHERE 학생번호 = (SELECT 학생번호 FROM hr.NM_RECORD nr WHERE 성적 = 4.0)

-- 조별활동 멀티캠퍼스 홈페이지 엔티티(게시글피드 / 사용자설정에서 계정설정)
CREATE TABLE feed
(
	피드아이디 varchar(100) PRIMARY KEY,
	아이디 varchar2(100),
	내용 varchar2(100),
	날짜 DATE,
	조회수 number(38,0),
	좋아요 number(38,0)
)

CREATE TABLE feeduser
(
	아이디 varchar2(100) PRIMARY KEY,
	이메일 varchar2(100),
	이름 varchar2(100),
	전화 varchar2(100)
)

ALTER TABLE feed
ADD CONSTRAINT fk_feeduser
FOREIGN KEY (아이디)
REFERENCES feeduser(아이디)

INSERT INTO feeduser
VALUES ('aa', 'a@a', '홍길동', '111')

INSERT INTO feeduser
VALUES ('ab', 'b@a', '김민수', '112')

INSERT INTO FEED 
VALUES ('1', 'aa', 'asd', sysdate, 0, 0)

INSERT INTO FEED 
VALUES ('2', 'aa', 'asd2', sysdate, 0, 0)

UPDATE FEEDUSER 
SET 아이디 = 'bb'
WHERE 전화 = '112'

UPDATE FEED  
SET 아이디 = 'bb'
WHERE 피드아이디 = '2'

SELECT *
FROM FEED f 
INNER JOIN FEEDUSER f2 
ON (f.아이디 = f2.아이디)

DELETE feed
WHERE 피드아이디 = '2'












