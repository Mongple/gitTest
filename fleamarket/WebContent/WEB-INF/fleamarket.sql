-- 위에서 부터 차례대로 마우스로 블럭을 칠하면서 실행하세요.
-- 문제 발생시 책임지지 않습니다.

-----------------------[ SYS 상태 ] --------------------------------------------
--
--select user
--from dual;
----==>> SYS
--
--
---- 계정 생성
--
--create user fleamarket identified by abc;
--  
--grant connect, dba, resource to fleamarket;
--
---- sql developer에서 접속 옵션을 저장하세요.
--
--
---- 계정 삭제
--drop user fleamarket cascade;

--alter user fleamarket identified by abc;
--
--
-----------------------[ SYS 상태 ] --------------------------------------------
--
--select user
--from dual;
----==>> SYS
--
--
--
---- ■■■ 암호화 복호화 ■■■ --
--
----1. 오라클에서 제공하는 암호화 및 복호화 기능을 사용하기 위해서는
---- 『DBMS_OBFUSCATION_TOOLKIT』 패키지를 이용한다.
---- 암호화, 복호화 알고리즘은 직점 구현하는 것도 가능하다.
---- 하지만, 편의상 제공하는 패키지를 통해 구현한다.
--
----2. DBMS_OBFUSCATION_TOOLKIT 패키지는
----   기본적(DEFAULT)으로는 사용할 수 없는 상태로 설정되어 있다.
----   이 패키지를 사용하기 위해서는 패키지에 대한 추가 설치 과정이 필요하다.
----   (dbmsobtk.sql, prvtobtk.plb 파일을 찾아서 실행)
--
--
----○ 암호화 패키지 설치
--
--@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\dbmsobtk.sql
--@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\prvtobtk.plb
----==>> 콘솔창에서 처리하고 왔으나... 여기서 실행해도 무방하다.
--
--
----○ 권한 부여
--grant execute on DBMS_OBFUSCATION_TOOLKIT TO fleamarket;
----==>> Grant을(를) 성공했습니다.
--
--
----3. 이 패키지는 4 개의 프로시저로 구성되어 있다.
----   VARCHAR@ 타입을 ENCRYPT/DECRYPT 할 수 있는 2개의 프로시저
----   ROW 타입을 ENCRYPT/DECRYPT 할 수 있는 2개의 프로시저
----  다른 타입은 지원하지 않기 때문에 NUMBER 인 경우 TO_CHAR 를 사용한다.
--
--
--
--
----------------------[ fleamarket 상태 ]------------------------------------------
--
--select user
--from dual;
----==>> fleamarket
--
--
----○ 패키지 선언
--create or replace package CRYPTPACK
--as
--FUNCTION ENCRYPT(str VARCHAR2, hash VARCHAR2) return VARCHAR2;
--FUNCTION DECRYPT(xcrypt VARCHAR2, hash VARCHAR2) return VARCHAR2;
--end CRYPTPACK;
----==>> Package CRYPTPACK이(가) 컴파일되었습니다.
--
--
----○ 패키지 몸체
--CREATE OR REPLACE PACKAGE BODY CRYPTPACK
--AS
--  CRYPTED_STRING VARCHAR2(2000);
--  FUNCTION ENCRYPT(STR VARCHAR2, HASH VARCHAR2)
--  RETURN VARCHAR2
--  IS
--  PIECES_OF_EIGHT NUMBER := ((FLOOR(LENGTH(STR)/8+.9))*8);
--  BEGIN
--  DBMS_OBFUSCATION_TOOLKIT.DESENCRYPT
--  ( INPUT_STRING  => RPAD(STR, PIECES_OF_EIGHT)
--  , KEY_STRING    => RPAD(HASH,8,'#')
--  , ENCRYPTED_STRING => CRYPTED_STRING
--  );
--  RETURN CRYPTED_STRING;
--  END;
--  
--  FUNCTION DECRYPT(XCRYPT VARCHAR2, HASH VARCHAR2)
--  RETURN VARCHAR2
--  IS
--  BEGIN
--  DBMS_OBFUSCATION_TOOLKIT.DESDECRYPT
--  ( INPUT_STRING  =>XCRYPT
--  , KEY_STRING    =>RPAD(HASH,8,'#')
--  , DECRYPTED_STRING => CRYPTED_STRING
--  );
--  RETURN TRIM(CRYPTED_STRING);
--  END;
--  
--END CRYPTPACK;

--==>> Package body CRYPTPACK이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------


-- ■■■ fleamarket 테이블 생성 시작 ■■■ --

-- 구간구간 꼭 드레그 해서 실행할것!!!!!


--○ 현재 접속계정 확인
SELECT USER
FROM DUAL;
--==>> fleamarket


--------------------------------------------------------------------------------


--○ 회원 테이블 생성
CREATE TABLE MEMBER
( MEM_NO NUMBER NOT NULL             -- 회원번호(PK)
, MEM_ID VARCHAR2(60)                -- 아이디
, MEM_PWD VARCHAR2(60)               -- 비밀번호
, MEM_NAME VARCHAR2(30)              -- 이름
, MEM_BIRTH VARCHAR2(30)             -- 생년월일
, MEM_DATE DATE                      -- 가입날짜
, MEM_PHONE VARCHAR2(60)             -- 폰번호
, MEM_EMAIL VARCHAR2(60)             -- 이메일
, MEM_GRANT VARCHAR2(10)             -- 권한
, MEM_BLACK NUMBER                   -- 
, CONSTRAINT MEMBER_MEMNO_PK PRIMARY KEY(MEM_NO)
);
--==>> Table MEMBER이(가) 생성되었습니다.


--○ 회원 테이블 제약조건까지 모두 삭제
--DROP TABLE MEMBER CASCADE CONSTRAINTS;


--------------------------------------------------------------------------------


--○ 회원 백업테이블 생성
CREATE TABLE BMEMBER
( BMEM_NO NUMBER NOT NULL             -- 회원번호(PK)
, BMEM_ID VARCHAR2(60)                -- 아이디
, BMEM_PWD VARCHAR2(60)               -- 비밀번호
, BMEM_NAME VARCHAR2(30)              -- 이름
, BMEM_BIRTH VARCHAR2(30)             -- 생년월일
, BMEM_PHONE VARCHAR2(60)             -- 폰번호
, BMEM_EMAIL VARCHAR2(60)             -- 이메일
, BMEM_OUT DATE                       -- 탈퇴날짜
, CONSTRAINT BMEMBER_BMEMNO_PK PRIMARY KEY(BMEM_NO)
);
--==>> Table BMEMBER이(가) 생성되었습니다.

--○ 회원 테이블 제약조건까지 모두 삭제
--DROP TABLE BMEMBER CASCADE CONSTRAINTS;

--------------------------------------------------------------------------------

--○ 통합게시판 테이블 생성
CREATE TABLE BOARD
( BA_NO NUMBER NOT NULL        -- 글번호(PK)
, MEM_NO NUMBER                -- 회원번호(FK)
, BA_TYPE VARCHAR2(20)         -- 게시판종류
, BA_TITLE VARCHAR2(1000)        -- 제목
, BA_CONTENT VARCHAR2(4000)      -- 내용
, BA_COUNT NUMBER              -- 조회수
, BA_DATE DATE                 -- 게시날짜
, CONSTRAINT BOARD_BANO_PK PRIMARY KEY(BA_NO)
, CONSTRAINT BOARD_MEMNO_FK FOREIGN KEY(MEM_NO)
              REFERENCES MEMBER(MEM_NO) ON DELETE CASCADE
);
--==>> Table BOARD이(가) 생성되었습니다.

--○ 통합게시판 테이블 제약조건까지 모두 삭제
--DROP TABLE BOARD CASCADE CONSTRAINTS;


--------------------------------------------------------------------------------


--○ 댓글 테이블 생성
CREATE TABLE REPLY
( RP_NO NUMBER                -- 댓글번호(PK)
, BA_NO NUMBER                -- 글번호(FK)
, MEM_NO NUMBER               -- 회원번호(FK)
, RP_CONTENT VARCHAR2(1000)     -- 내용
, RP_DATE DATE                -- 게시날짜
, CONSTRAINT REPLY_PRNO_PK PRIMARY KEY(RP_NO)
, CONSTRAINT REPLY_BANO_FK FOREIGN KEY(BA_NO)
              REFERENCES BOARD(BA_NO) on delete cascade
, CONSTRAINT REPLY_MEMNO_FK FOREIGN KEY(MEM_NO) 
              REFERENCES MEMBER(MEM_NO) on delete cascade
);
--==>> Table REPLY이(가) 생성되었습니다.


--○ 메뉴유형 테이블 제약조건까지 모두 삭제
--DROP TABLE REPLY CASCADE CONSTRAINTS;



--------------------------------------------------------------------------------


-- ■■■ 입력부분들 ■■■ --



--○ 데이터 입력(회원 테이블)

-- 관리자 샘플
INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BIRTH, MEM_DATE
            , MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK)
VALUES((SELECT NVL(MAX(MEM_NO),0)+1 FROM MEMBER)
,'HUNCH', CRYPTPACK.ENCRYPT('123','HUNCH'), '직감맨', '91/03/20', sysdate
, '010-7777-7777', 'haha@hunch.com', 'A', 0);


-- 일반회원 샘플

INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BIRTH, MEM_DATE
            , MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK)
VALUES((SELECT NVL(MAX(MEM_NO),0)+1 FROM MEMBER)
,'abc', CRYPTPACK.ENCRYPT('123','abc'), '슈퍼맨', '99/05/27', sysdate
, '010-7777-7777', 'babo@hunch.com', 'U', 1);

INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BIRTH, MEM_DATE
            , MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK)
VALUES((SELECT NVL(MAX(MEM_NO),0)+1 FROM MEMBER)
,'bbb', CRYPTPACK.ENCRYPT('123','bbb'), '배트맨', '94/11/11', sysdate
, '010-7777-7777', 'ggg@hunch.com', 'U', 2);

INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BIRTH, MEM_DATE
            , MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK)
VALUES((SELECT NVL(MAX(MEM_NO),0)+1 FROM MEMBER)
,'1', CRYPTPACK.ENCRYPT('123','1'), '1', '99/05/27', sysdate
, '010-7777-7777', 'babo@hunch.com', 'U', 1);

INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BIRTH, MEM_DATE
            , MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK)
VALUES((SELECT NVL(MAX(MEM_NO),0)+1 FROM MEMBER)
,'2', CRYPTPACK.ENCRYPT('123','2'), '2', '94/11/11', sysdate
, '010-7777-7777', 'ggg@hunch.com', 'U', 2);

INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BIRTH, MEM_DATE
            , MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK)
VALUES((SELECT NVL(MAX(MEM_NO),0)+1 FROM MEMBER)
,'3', CRYPTPACK.ENCRYPT('123','3'), '3', '99/05/27', sysdate
, '010-7777-7777', 'babo@hunch.com', 'U', 1);

INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BIRTH, MEM_DATE
            , MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK)
VALUES((SELECT NVL(MAX(MEM_NO),0)+1 FROM MEMBER)
,'4', CRYPTPACK.ENCRYPT('123','4'), '4', '94/11/11', sysdate
, '010-7777-7777', 'ggg@hunch.com', 'U', 2);

INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BIRTH, MEM_DATE
            , MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK)
VALUES((SELECT NVL(MAX(MEM_NO),0)+1 FROM MEMBER)
,'5', CRYPTPACK.ENCRYPT('123','5'), '5', '99/05/27', sysdate
, '010-7777-7777', 'babo@hunch.com', 'U', 1);

INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BIRTH, MEM_DATE
            , MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK)
VALUES((SELECT NVL(MAX(MEM_NO),0)+1 FROM MEMBER)
,'6', CRYPTPACK.ENCRYPT('123','6'), '6', '94/11/11', sysdate
, '010-7777-7777', 'ggg@hunch.com', 'U', 2);

INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BIRTH, MEM_DATE
            , MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK)
VALUES((SELECT NVL(MAX(MEM_NO),0)+1 FROM MEMBER)
,'7', CRYPTPACK.ENCRYPT('123','7'), '7', '94/11/11', sysdate
, '010-7777-7777', 'ggg@hunch.com', 'U', 2);

INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BIRTH, MEM_DATE
            , MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK)
VALUES((SELECT NVL(MAX(MEM_NO),0)+1 FROM MEMBER)
,'8', CRYPTPACK.ENCRYPT('123','8'), '8', '94/11/11', sysdate
, '010-7777-7777', 'ggg@hunch.com', 'U', 2);

--○ 회원 테이블 데이터 전체조회 쿼리문 구성
SELECT MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BIRTH, MEM_DATE, MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK
FROM MEMBER;

--○ 커밋
COMMIT;
--ROLLBACK;

--○ 관리자 테이블 조건에 맞는 데이터 삭제
--DELETE FROM MEMBER WHERE MEM_NO=4;


--------------------------------------------------------------------------------


--○ 데이터 입력(회원 백업테이블)

-- 탈퇴회원 샘플
--
--INSERT INTO BMEMBER(BMEM_NO, BMEM_ID, BMEM_PWD, BMEM_NAME, BMEM_BIRTH
--            , BMEM_PHONE, BMEM_EMAIL, BMEM_OUT)
--VALUES((SELECT NVL(MAX(BMEM_NO),0)+1 FROM MEMBER)
--,'abc', CRYPTPACK.ENCRYPT('123','abc'), '진상맨', '99/06/26'
--,'010-7777-7777', 'babo@hunch.com', '2016/03/29');
--
--
----○ 회원 백업 테이블 데이터 전체조회 쿼리문 구성
--SELECT BMEM_NO, BMEM_ID, BMEM_PWD, BMEM_NAME, BMEM_BIRTH, BMEM_PHONE, BMEM_EMAIL, BMEM_OUT
--FROM BMEMBER;
--
----○ 커밋
--COMMIT;

--○ 회원 백업 테이블 조건에 맞는 데이터 삭제
--DELETE FROM BMEMBER WHERE BMEM_NO=1;


--------------------------------------------------------------------------------


--○ 데이터 입력(통합게시판 테이블)

-- 공지사항 샘플
INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '주목', '샘플데이터입니다.', 0, '2016/01/01');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '공지사항입니다', '샘플데이터입니다.', 0, '2016/01/15');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '두번째 공지사항입니다', '샘플데이터입니다.', 0, '2016/02/01');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '주의하실점입니다', '샘플데이터입니다.', 0, '2016/02/19');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '사기에 주의하세요', '샘플데이터입니다.', 0, '2016/02/29');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '블랙리스트 회원입니다', '샘플데이터입니다.', 0, '2016/03/01');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '공지합니다', '샘플데이터입니다.', 0, '2016/03/03');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '문의하신내용입니다', '샘플데이터입니다.', 0, '2016/03/04');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '관리자입니다', '샘플데이터입니다.', 0, '2016/03/20');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '주목하세요', '샘플데이터입니다.', 0, '2016/03/21');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '우수회원목록입니다', '샘플데이터입니다.', 0, '2016/03/28');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '사이트공지사항에대해 알려드립니다', '샘플데이터입니다.', 0, '2016/03/29');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '주목해', '샘플데이터입니다.', 0, '2016/03/30');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '공지사항', '샘플데이터입니다.', 0, '2016/04/01');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '오늘자 공지사항', '샘플데이터입니다.', 0, '2016/04/02');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '공지사항수정입니다', '샘플데이터입니다.', 0, '2016/04/02');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '새로운 공지사항을 알려드립니다', '샘플데이터입니다.', 0, '2016/04/03');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '오늘자 블랙리스트회원', '샘플데이터입니다.', 0, '2016/04/03');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '사이트를 사랑해주셔서 감사합니다', '샘플데이터입니다.', 0, '2016/04/03');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '오프라인모임 공지입니다', '샘플데이터입니다.', 0, '2016/04/04');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,1, 'NOTICE', '새로운 공지사항을 알립니다^^', '샘플데이터입니다.', 0, '2016/04/05');

-- 의류게시판 샘플
INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'WEAR', '청바지 팔아요', '샘플데이터입니다.', 0, '2016/01/01');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'WEAR', '청바지 팝니다', '샘플데이터입니다.', 0, '2016/01/01');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,6, 'WEAR', '여기들어와보세요 많이 팔아요', '샘플데이터입니다.', 0, '2016/01/02');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'WEAR', '떨이로 팔아요', '샘플데이터입니다.', 0, '2016/01/03');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,6, 'WEAR', '진청 팔아요', '샘플데이터입니다.', 0, '2016/01/03');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,4, 'WEAR', '반팔티셔츠 팔아요', '샘플데이터입니다.', 0, '2016/01/03');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,8, 'WEAR', '자켓 팔아요', '샘플데이터입니다.', 0, '2016/01/04');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,6, 'WEAR', '셔츠 팔아요', '샘플데이터입니다.', 0, '2016/01/05');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,7, 'WEAR', '예쁜옷 많아요', '샘플데이터입니다.', 0, '2016/01/05');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'WEAR', '아기옷 팝니다', '샘플데이터입니다.', 0, '2016/01/05');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'WEAR', '명품 저렴하게 판매합니다', '샘플데이터입니다.', 0, '2016/01/06');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'WEAR', '면바지 판매합니다', '샘플데이터입니다.', 0, '2016/01/07');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,7, 'WEAR', '흰티 팔아요', '샘플데이터입니다.', 0, '2016/01/09');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,5, 'WEAR', '검은티 팔아요', '샘플데이터입니다.', 0, '2016/01/10');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,5, 'WEAR', '회색티셔츠 팝니다', '샘플데이터입니다.', 0, '2016/01/15');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,7, 'WEAR', '흰바지 팔아요', '샘플데이터입니다.', 0, '2016/01/17');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'WEAR', '청바지 팔아요', '샘플데이터입니다.', 0, '2016/01/18');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'WEAR', '운동화 팝니다', '샘플데이터입니다.', 0, '2016/01/20');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'WEAR', '나이키 운동복 팔아요', '샘플데이터입니다.', 0, '2016/01/21');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,4, 'WEAR', '아디다스 운동복 팔아요', '샘플데이터입니다.', 0, '2016/01/22');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,6, 'WEAR', '240Size 구두 팔아요', '샘플데이터입니다.', 0, '2016/01/22');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'WEAR', '긴티 팔아요', '샘플데이터입니다.', 0, '2016/02/02');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'WEAR', '여름옷 많이 팔아요', '샘플데이터입니다.', 0, '2016/02/02');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,5, 'WEAR', '한번도 안입은옷 팔아요', '샘플데이터입니다.', 0, '2016/02/03');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'WEAR', '사이즈 작아져서 티셔츠 팔아요', '샘플데이터입니다.', 0, '2016/02/04');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'WEAR', '청바지 새거 팔아요', '샘플데이터입니다.', 0, '2016/02/06');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'WEAR', '청자켓 A+상품 팔아요', '샘플데이터입니다.', 0, '2016/02/06');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'WEAR', '한번도 착용안한 A+상품 팔아요', '샘플데이터입니다.', 0, '2016/02/07');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'WEAR', '한번도 착용안한 A+상품 팔아요', '샘플데이터입니다.', 0, '2016/02/09');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'WEAR', '착용안한 상품 팔아요', '샘플데이터입니다.', 0, '2016/02/10');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'WEAR', '착용안한 검정티 팔아요', '샘플데이터입니다.', 0, '2016/03/10');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'WEAR', '착용한 상품 팔아요', '샘플데이터입니다.', 0, '2016/03/28');

-- 가전게시판 샘플
INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'PRODUCT', '밥솥 팔아요', '샘플데이터입니다.', 0, '2016/02/02');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'PRODUCT', '전기밥솥 팔아요', '샘플데이터입니다.', 0, '2016/02/02');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'PRODUCT', '전기밥솥 팔아요', '샘플데이터입니다.', 0, '2016/02/03');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,7, 'PRODUCT', 'TV 팔아요', '샘플데이터입니다.', 0, '2016/02/05');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,5, 'PRODUCT', '컴퓨터 팔아요', '샘플데이터입니다.', 0, '2016/02/08');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,8, 'PRODUCT', '모니터 팔아요', '샘플데이터입니다.', 0, '2016/02/10');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,4, 'PRODUCT', '마우스 싸게 팔아요', '샘플데이터입니다.', 0, '2016/02/10');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'PRODUCT', '노트북 팔아요', '샘플데이터입니다.', 0, '2016/02/11');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,6, 'PRODUCT', '키보다 팔아요', '샘플데이터입니다.', 0, '2016/02/12');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,5, 'PRODUCT', '무선마우스 팔아요', '샘플데이터입니다.', 0, '2016/02/15');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'PRODUCT', '유에스비 팔아요', '샘플데이터입니다.', 0, '2016/02/16');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'PRODUCT', '전자레인지 팔아요', '샘플데이터입니다.', 0, '2016/02/20');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,5, 'PRODUCT', '가스레인지 팔아요', '샘플데이터입니다.', 0, '2016/02/21');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,6, 'PRODUCT', '아이폰 팔아요', '샘플데이터입니다.', 0, '2016/03/01');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'PRODUCT', '갤럭시노트 팔아요', '샘플데이터입니다.', 0, '2016/03/01');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,3, 'PRODUCT', '아이패드 팔아요', '샘플데이터입니다.', 0, '2016/03/03');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,2, 'PRODUCT', 'mp3 팔아요', '샘플데이터입니다.', 0, '2016/03/04');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,8, 'PRODUCT', '모니터 싸게 팔아요', '샘플데이터입니다.', 0, '2016/03/05');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,6, 'PRODUCT', 'TV 팝니다', '샘플데이터입니다.', 0, '2016/03/07');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,6, 'PRODUCT', '컴퓨터 랑 TV 팝니다', '샘플데이터입니다.', 0, '2016/03/20');

INSERT INTO BOARD(BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE)
VALUES((SELECT NVL(MAX(BA_NO),0)+1 FROM BOARD)
,6, 'PRODUCT', '가전제품 싸게 팝니다', '샘플데이터입니다.', 0, '2016/04/01');

--○ 통합게시판 테이블 데이터 전체조회 쿼리문 구성
SELECT BA_NO, MEM_NO, BA_TYPE, BA_TITLE, BA_CONTENT, BA_COUNT, BA_DATE
FROM BOARD;

--○ 커밋
COMMIT;

--○ 통합게시판 테이블 조건에 맞는 데이터 삭제
--DELETE FROM BOARD WHERE BA_NO=4;



--------------------------------------------------------------------------------


--○ 데이터 입력(댓글 테이블)

-- 의류게시판 댓글 샘플
INSERT INTO REPLY(RP_NO, BA_NO, MEM_NO, RP_CONTENT, RP_DATE)
VALUES((SELECT NVL(MAX(RP_NO),0)+1 FROM REPLY)
,2, 2, '얼마인가요', '2016/03/29');


-- 가전게시판 댓글 샘플
INSERT INTO REPLY(RP_NO, BA_NO, MEM_NO, RP_CONTENT, RP_DATE)
VALUES((SELECT NVL(MAX(RP_NO),0)+1 FROM REPLY)
,3, 3, '얼마인가요', '2016/03/29');



--○ 댓글 테이블 데이터 전체조회 쿼리문 구성
SELECT RP_NO, BA_NO, MEM_NO, RP_CONTENT, RP_DATE
FROM REPLY;

--○ 커밋
COMMIT;

--○ 댓글 테이블 조건에 맞는 데이터 삭제
--DELETE FROM REPLY WHERE RP_NO=1;


SELECT MEM_NO, MEM_ID, MEM_NAME, MEM_BIRTH, MEM_DATE, MEM_PHONE, MEM_EMAIL, MEM_GRANT, MEM_BLACK
FROM MEMBER;





-------------------------------------------------------------------------------
--Test

-- 회원수
select nvl(count(MEM_NO), 0) as MEM_NO
from MEMBER
where MEM_GRANT = 'U';

-- 관리자수
select nvl(count(MEM_NO), 0) as MEM_NO
from MEMBER
where MEM_GRANT = 'A';

