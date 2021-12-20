/************************
*join
*************************/

--카티젼 프로덕트(Cartesian Product)
--col:15  row:2889
SELECT
    *
FROM
    employees,
    departments;

SELECT
    em.employee_id,
    em.first_name,
    em.salary,
    de.department_name,
    em.department_id,
    de.department_id
FROM
    employees   em,
    departments de
WHERE
    em.department_id = de.department_id;

SELECT
    em.first_name,
    de.department_name,
    jo.job_title
FROM
    employees   em,
    departments de,
    jobs        jo
WHERE
    em.department_id = de.department_id
    AND em.job_id = jo.job_id
ORDER BY
    em.first_name ASC;

SELECT
    COUNT(*)
FROM
    employees   em,
    departments de,
    jobs        jo
WHERE
    em.department_id = de.department_id
    AND em.job_id = jo.job_id;

-- c11 r107 
SELECT
    employee_id,
    first_name,
    salary,
    job_id,
    department_id
FROM
    employees; 

--c04  r27
SELECT
    *
FROM
    departments;

SELECT
    *
FROM
    jobs;