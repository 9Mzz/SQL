--1번
SELECT
    COUNT(*)
FROM
    employees
WHERE
    manager_id IS NOT NULL;
--2번
SELECT
    MAX(salary),
    MIN(salary),
    MAX(salary) - MIN(salary) "최고임금 - 최저임금"
FROM
    employees;

--3번
SELECT
    to_char(
        MAX(hire_date), 'yyyy"년"mm"월"dd"일"'
    )
FROM
    employees;

--4번
SELECT
    department_id,
    AVG(salary),
    MAX(salary),
    MIN(salary)
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id ASC;

--5번
SELECT
    job_id,
    round(
        AVG(salary), 0
    ),
    MAX(salary),
    MIN(salary)
FROM
    employees
GROUP BY
    job_id
ORDER BY
    MIN(salary) DESC,
    AVG(salary) ASC;

--6번
SELECT
    to_char(
        MIN(hire_date), 'yyyy"-"mm"-"dd day'
    )
FROM
    employees;
--7번
SELECT
    department_id             부서,
    AVG(salary)               평균임금,
    MAX(salary)               최고임금,
    MIN(salary)               최저임금,
    MAX(salary) - MIN(salary) "최고임금-최저임금"
FROM
    employees
GROUP BY
    department_id;

--8번
SELECT
*
FROM
    employees ems,
    jobs      jos
WHERE
    ems.job_id = jos.job_id;