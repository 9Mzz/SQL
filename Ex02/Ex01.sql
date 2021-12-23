--webdb  계정에 book 테이블 만들기
CREATE TABLE book (
    book_id  NUMBER,
    title    VARCHAR2(50),
    author   VARCHAR2(50),
    pub_date DATE
);

--book 테이블에 pubs 컬럼 추가하기.
ALTER TABLE book ADD (
    pubs VARCHAR2(50)
);

--book 테이블에 title 컬럼 수정하기
ALTER TABLE book MODIFY (
    title VARCHAR2(100)
);

--book 테이블에 title 컬럼을 subject로 바꾸기
ALTER TABLE book RENAME COLUMN title TO subject;

--컬럼 삭제
ALTER TABLE book DROP ( author );

--테이블 이름 변경
RENAME book TO article;

--테이블 완전 삭제
DROP TABLE article;

SELECT
    *
FROM
    article;

--작가 테이블 만들기
CREATE TABLE author (
    author_id   NUMBER(10),
    author_name VARCHAR2(100) NOT NULL,
    author_desc VARCHAR2(500),
    PRIMARY KEY ( author_id )
);
--책(book)테이블 만들기
CREATE TABLE book (
    book_id   NUMBER(10),
    title     VARCHAR2(100) NOT NULL,
    pubs      VARCHAR2(100),
    pub_date  DATE,
    author_id NUMBER(10),
    PRIMARY KEY ( book_id ),
    CONSTRAINT book_fk FOREIGN KEY ( author_id )
        REFERENCES author ( author_id )
);

--작가(author) 테이블에 데이터 추가(insert)
INSERT INTO author VALUES (
    1,
    '박경리',
    '토지 작가'
);

INSERT INTO author (
    author_id,
    author_name,
    author_desc
) VALUES (
    2,
    '이문열',
    '삼국지 등등 작가'
);

----------------------------
--3. 책 테이블 만들기

INSERT INTO author VALUES (
    3,
    '기안84',
    '웹툰작가'
);

INSERT INTO author (
    author_id,
    author_name,
    author_desc
) VALUES (
    4,
    '기안84',
    '웹툰작가'
);

--작가 테이블 정보 수정
UPDATE author
SET
    author_name = '김경리',
    author_desc = '토지작가'
WHERE
    author_id = 1;

--업데이트 주의(where절 없음)
UPDATE author
SET
    author_name = '김경리',
    author_desc = '토지작가';

--sequence(시퀸스) 번호표 뽑기
create SEQUENCE seq_author_id INCREMENT by 1 start with 1;

--시퀸스 넣기
insert into author values (seq_author_id.nextval, '박경리', '토지 작가');

insert into author values(seq_author_id.nextval, '강풀', '삼국지 작가');

--시퀀스 조회
select * from user_sequences;

--현재 시퀸스 조회
SELECT seq_author_id.currval 
FROM dual;

--다음 시퀸스 조회
SELECT seq_author_id.nextval 
FROM dual;

--시퀸스 삭제
DROP SEQUENCE seq_author_id;

--삭제 주의(where)절 없음!!
DELETE FROM author;

--작가 테이블 정보 삭제 삭제문 + where
DELETE FROM author where author_id = 21;
--시퀸스 삭제
drop sequence seq_author_id;

--조회
SELECT * FROM author; 

SELECT * fROM book;