-- book 테이블 생성
create table book(
    book_id number(5),
    title varchar2(50),
    author varchar2(10),
    pub_date date
);

-- book 테이블에 pubs 컬럼 추가
alter table book add(pubs varchar2(50));

-- book 테이블에 컬럼속성 변경
alter table book modify(subject varchar2(100));
alter table book rename column title to subject;

-- 컬럼 삭제
alter table book drop(author);

-- book 테이블명 변경
rename book to article;

-- 테이블 삭제
drop table article;

-- 작가테이블 만들기
create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);

select *
from all_tables;


-- book 테이블 만들기
CREATE TABLE book (
    book_id     NUMBER(10),
    title       VARCHAR2(100) NOT NULL,
    pubs        VARCHAR2(100),
    pub_date    DATE,
    author_id   NUMBER(10),
    
    PRIMARY KEY(book_id),
    CONSTRAINT book_fk FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- 작가 테이블에 데이터 추가
INSERT INTO author VALUES (1, '박경리', '토지작가' );
INSERT INTO author( author_id, author_name) VALUES (2, '이문열' );
INSERT INTO author VALUES (3, '기안84', '웹툰작가' );

-- 작가 테이블 수정
update author
set author_name='김경리',
    author_desc='토지작가'
where author_id = 1;

-- 작가 테이블 정보 삭제
delete 
from author
where author_id = 3;

delete 
from author;

-- sequence(시퀀스) 번호표
create sequence seq_author_id
increment by 1
start with 1
nocache;

create sequence seq_book_id
increment by 1
start with 1
nocache;

INSERT INTO author VALUES (seq_author_id.nextval, '박경리', '토지작가' );
INSERT INTO author VALUES (seq_author_id.nextval, '이문열', '삼국지작가');
INSERT INTO author VALUES (seq_author_id.nextval, '강풀', '웹툰작가');

-- 시퀀스 조회
select *
from user_sequences;

-- 현재 시퀀스
select seq_author_id.currval from dual;
select seq_book_id.currval from dual;

-- 다음 시퀀스( 조회만 해도 증가)
select seq_author_id.nextval from dual;

-- 시퀀스 삭제
drop sequence seq_author_id;
drop sequence seq_book_id;

--보기
select *
from author;