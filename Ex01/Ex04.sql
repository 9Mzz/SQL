/************************
*group by 절
*************************/
SELECT
    department_id,
    AVG(salary)
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id;

SELECT
    department_id,
    COUNT(*),
    AVG(salary)
FROM
    employees
GROUP BY
    department_id;

SELECT
    department_id,
    job_id,
    COUNT(*),
    AVG(salary)
FROM
    employees
GROUP BY
    department_id,
    job_id
ORDER BY
    department_id ASC;

--where 절에는 그룹 함수를 쓸 수 없다
SELECT
    department_id,
    COUNT(*),
    SUM(salary)
FROM
    employees
WHERE
    SUM(salary) >= 20000
GROUP BY
    department_id;

--having절
SELECT
    department_id,
    COUNT(*),
    SUM(salary)
FROM
    employees
GROUP BY
    department_id
HAVING
    SUM(salary) >= 20000;

SELECT
    department_id,
    COUNT(*),
    SUM(salary)
FROM
    employees
GROUP BY
    department_id
HAVING SUM(salary) >= 20000
       OR department_id = 40;

--CASE ~ END 문 
SELECT
    employee_id "사번",
    first_name,
    salary,
    job_id,
    CASE
    WHEN job_id = 'AC_ACCOUNT' THEN
    salary + salary * 0.1
    WHEN job_id = 'SA_REP'     THEN
    salary + salary * 0.2
    WHEN job_id = 'ST_CLERK'   THEN
    salary + salary * 0.3
    ELSE
    salary
    END         realsalary
FROM
    employees;

--DECODE()
SELECT
    employee_id,
    first_name,
    salary,
    job_id,
    decode(
        job_id, 'AC_ACCOUNT', salary + salary * 0.1, 'SA_REP', salary + salary * 0.2, 'ST_CLERK', salary + salary * 0.2, salary
    ) AS realsalary
FROM
    employees;

--예제)
/*
직원의 이름, 부서, 팀을 출력하세요
팀은 코드로 결정하며 
부서코드가 10~50 이면 ‘A-TEAM’
          60~100이면 ‘B-TEAM’  
          110~150이면 ‘C-TEAM’ 
나머지는 ‘팀없음’ 으로 출력하세요.
*/
SELECT
    first_name,
    department_id,
    CASE
    WHEN department_id >= 10
         AND department_id <= 50 THEN
    'A-TEAM'
    WHEN department_id >= 60
         AND department_id <= 100 THEN
    'B-TEAM'
    WHEN department_id >= 110
         AND department_id <= 150 THEN
    'C-TEAM'
    ELSE
    '팀없음'
    END AS team
FROM
    employees;