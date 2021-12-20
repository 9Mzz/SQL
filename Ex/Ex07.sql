--sub Query

-- 질문 1 전체 쿼리문 구조
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary >= 11000;
-- 질문 2 Den의 급여
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name = 'Den';
--질문1 + 질문2 Query문 완성 --> 들여쓰기 잘할것
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary >= (
        SELECT
            salary
        FROM
            employees
        WHERE
            first_name = 'Den'
    );
    
--ex 급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
SELECT
    MIN(salary)
FROM
    employees;
--
SELECT
    first_name,
    salary,
    employee_id
FROM
    employees
WHERE
    salary = (
        SELECT
            MIN(salary)
        FROM
            employees
    );
--
SELECT
    *
FROM
    employees;

--ex 평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?
SELECT
    first_name,
    salary
FROM
    employees;
--
SELECT
    AVG(salary)
FROM
    employees;
--
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary <= (
        SELECT
            AVG(salary)
        FROM
            employees
    );
--