--그룹함수
--

--오류발생 이유확인할것 --> 1개의 row에 표현할 수 없다.
SELECT
    first_name,
    AVG(salary)
FROM
    employees;

--그룹함수 avg()
SELECT
    AVG(salary)
FROM
    employees;

--그룹함수 count()
SELECT
    COUNT(*),
    COUNT(commission_pct),
    COUNT(department_id)
FROM
    employees;

SELECT
    COUNT(*)
FROM
    employees
WHERE
    salary > 16000;
--부서번호가 100번인 사람의 갯수
SELECT
    COUNT(*)
FROM
    employees
WHERE
    department_id = 100;
    
--그룹함수 sum()
SELECT
    SUM(salary),
    COUNT(*),
    AVG(salary)
FROM
    employees;
------------------------
SELECT
    SUM(salary),
    COUNT(*),
    AVG(salary)
FROM
    employees
WHERE
    salary > 16000;
--그룹함수 avg()
SELECT
    COUNT(*),
    SUM(salary),
    SUM(salary) / COUNT(*) avg,
    AVG(salary)
FROM
    employees;
--
SELECT
    COUNT(*),
    SUM(salary),
    AVG(nvl(
        salary, 0
    ))
FROM
    employees;    
--그룹
SELECT
    COUNT(*),
    MAX(salary),
    MIN(salary)
FROM
    employees;
-- group by 절
SELECT
    department_id,
    AVG(salary)
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id ASC;

    
--기본값
SELECT
    *
FROM
    employees;