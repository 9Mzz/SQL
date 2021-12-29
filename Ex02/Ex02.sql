ROLLBACK;

COMMIT;

UPDATE author
SET
    author_name = '김문열',
    author_desc = '삼국지 작가'
WHERE author_id = 1;

SELECT
    *
FROM
    author;