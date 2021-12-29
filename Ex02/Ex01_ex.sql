--author 테이블 생성
CREATE TABLE author (
    author_id   NUMBER(30),
    author_name VARCHAR2(1000),
    author_desc VARCHAR2(1000),
    PRIMARY KEY ( author_id )
);

-- book 테이블 생성
CREATE TABLE book (
    book_id   NUMBER(30),
    title     VARCHAR2(1000) NOT NULL,
    pubs      VARCHAR2(1000),
    pub_date  DATE,
    author_id NUMBER(30),
    CONSTRAINT book_fk FOREIGN KEY ( author_id )
        REFERENCES author ( author_id )
);
--value 테이블 값 넣기
--value 시퀸스 사용
INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '김문열',
    '경북 영양'
);

INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '박경리',
    '경상남도 통영'
);

INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '유시민',
    '17대 국회의원'
);

INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '기안84',
    '기안동에서 산 83년생'
);

INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '강풀',
    '온라인 만화가 1세대'
);

INSERT INTO author VALUES (
    seq_author_id.NEXTVAL,
    '김영하',
    '알쓸신잡'
);

--book 시퀸스 사용
INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '우리들의 일그러진 영웅',
    '다림',
    '1998-02-22',
    1
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '삼국지',
    '민음사',
    '2002-03-01',
    1
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '토지',
    '마로니에북스',
    '2012-08-15',
    2
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '유시민의 글쓰기 특강',
    '생각의 길',
    '2015-04-01',
    2
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '패션왕',
    '중앙북스(books)',
    '2012-02-22',
    4
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '순정만화',
    '재미주의',
    '2011-08-03',
    5
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '오직 두사람',
    '재미주의',
    '2017-05-04',
    6
);

INSERT INTO book VALUES (
    seq_book_id.NEXTVAL,
    '26년',
    '재미주의',
    '2012-02-04',
    5
);


--author 시퀸스 생성
create SEQUENCE seq_author_id
INCREMENT by 1
start with 1
;
--book 시퀸스 생성
create SEQUENCE seq_book_id
increment by 1
start with 1;

--시퀸스 삭제
DROP SEQUENCE seq_author_id;


--컬럼 삭제
DROP TABLE book;

--삭제 주의(where)절 없음!!
DELETE FROM book;

SELECT
    *
FROM
    author;

SELECT
    *
FROM
    book;

SELECT
    bo.book_id,
    bo.title,
    bo.pubs,
    bo.pub_date,
    bo.author_id,
    au.author_name,
    au.author_desc
FROM
    author au,
    book   bo
WHERE
    au.author_id = bo.author_id;