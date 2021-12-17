-- 문제1.
SELECT
    COUNT(*) "haveMngCnt"
FROM
    employees
WHERE
    manager_id IS NOT NULL;

--문제2
SELECT
    MIN(salary)               최저임금,
    MAX(salary)               최고임금,
    MAX(salary) - MIN(salary) "최고임금 - 최저임금"
FROM
    employees;
--문제3
SELECT
    to_char(
        MAX(hire_date), 'yyyy"년"mm"월"dd"일"'
    ) "마지막 신입사원"
FROM
    employees;
--문제4
SELECT
    department_id "부서 아이디",
    AVG(salary)   "평균임금",
    MAX(salary)   "최고임금",
    MIN(salary)   "최저임금"
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id DESC;
--문제5
SELECT
    *
FROM
    employees;

--기본형
SELECT
    job_id      업무,
    round(
        AVG(salary), 0
    )           평균임금,
    MAX(salary) 최고임금,
    MIN(salary) 최저임금
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
    MIN(salary)               최저임금,
    AVG(salary) - MIN(salary) "평균임금-최저임금"
FROM
    employees
GROUP BY
    department_id
HAVING
    AVG(salary) - MIN(salary) < 2000
ORDER BY
    AVG(salary) - MIN(salary) DESC;

--8번
SELECT
    job_id,
    MIN(salary),
    MAX(salary)
FROM
    employees
GROUP BY
    job_id
ORDER BY
    job_id DESC;
    
--9번
SELECT
    hire_date,
    manager_id,
    round(
        AVG(salary), 0
    ),
    MIN(salary),
    MAX(salary)
FROM
    employees
WHERE
    hire_date > '05/01/01'
GROUP BY
    hire_date,
    manager_id
ORDER BY
    AVG(salary) ASC;
    
--10번
SELECT
    hire_date 입사일,
    CASE
    WHEN hire_date < '02/12/31' THEN
    '창립멤버'
    WHEN hire_date > '03/01/01'
         AND hire_date < '03/12/31' THEN
    '03년 입사'
    WHEN hire_date > '04/01/01'
         AND hire_date < '04/12/31' THEN
    '04년 입사'
    ELSE
    '상장이후입사'
    END "optDate"
FROM
    employees
ORDER BY
    hire_date ASC;