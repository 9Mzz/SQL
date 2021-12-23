--rownum 이해
SELECT
    ROWNUM,
    first_name,
    salary
FROM
    employees;
--급여순으로 정렬 --> rownum 섞여버림
SELECT
    ROWNUM,
    first_name,
    salary
FROM
    employees
ORDER BY
    ROWNUM DESC;
--정렬이 가장 나중에 실행됨
SELECT
    first_name,
    salary
FROM
    employees
ORDER BY
    salary DESC;   

-- 정렬된 테이블을 사용 해서 rownum 붙임
SELECT
    ROWNUM,
    first_name,
    salary
FROM
    ordersalary;

SELECT
    first_name,
    salary
FROM
    employees
ORDER BY
    salary DESC;
    
--해결 >> 정렬된 테이블을 사용 해서 rownum을 붙임
--결합
SELECT
    ROWNUM,
    first_name,
    salary,
    email
FROM
    (
        SELECT
            *
        FROM
            employees
        ORDER BY
            salary DESC
    );
--최종본에선 from (select 전부 써줘야됨)
SELECT
    *
FROM
    employees
ORDER BY
    salary DESC;
-------------------------------------------------------
SELECT
    ROWNUM,
    first_name,
    salary,
    email
FROM
    (
        SELECT
            *
        FROM
            employees
        ORDER BY
            salary DESC
    )
WHERE
    ROWNUM >= 0
    AND ROWNUM <= 5;
----------------------------------------
SELECT
    rno,
    first_name,
    salary
FROM
    ( (
        SELECT
            ROWNUM rno,
            first_name,
            salary
        FROM
            (
                SELECT
                    *
                FROM
                    employees
                ORDER BY
                    salary DESC
            ) o
    ) )
WHERE
    rno >= 2
    AND rno <= 4;
-------------------------------------------------------------------
( SELECT
    ROWNUM rno,
    first_name,
    salary
FROM
    (
        SELECT
            *
        FROM
            employees
        ORDER BY
            salary DESC
    ) o
);
--------------------------------------
--월급 정렬
SELECT
    first_name,
    salary
FROM
    employees
ORDER BY
    salary DESC;

SELECT
    ROWNUM,
    first_name,
    salary
FROM
    employees;

SELECT
    ROWNUM,
    first_name,
    salary
FROM
    employees
WHERE
    ROWNUM >= 11
    AND ROWNUM <= 20;
--결합
SELECT
    ROWNUM rn,
    first_name,
    salary
FROM
    (
        SELECT
            ROWNUM rn,
            first_name,
            salary
        FROM
            (
                SELECT
                    first_name,
                    salary
                FROM
                    employees
                ORDER BY
                    salary DESC
            )
    )
WHERE
    rn >= 11
    AND rn <= 20;
--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
--07년에 입사한 직원
SELECT
    ROWNUM,
    first_name,
    hire_date
FROM
    employees
WHERE
    hire_date >= '07/01/01'
    AND hire_date <= '07/12/31';

--급여가 많은 직원
SELECT
    *
FROM
    employees
ORDER BY
    salary DESC;

--결합
SELECT
    ROWNUM,
    first_name,
    hire_date,
    salary
FROM
    (
        SELECT
            *
        FROM
            employees
        ORDER BY
            salary DESC
    )
WHERE
    hire_date >= '07/01/01'
    AND hire_date <= '07/12/31';

SELECT
    *
FROM
    employees;

-------
SELECT
    emp.first_name,
    emp.salary,
    emp.hire_date,
    dep.department_id
FROM
    employees   emp,
    departments dep
WHERE
    emp.department_id = dep.department_id
    AND hire_date >= '07/01/01'
    AND hire_date < '08/01/01'
ORDER BY
    emp.salary;
----------------결합
SELECT
    ort.rn,
    ort.first_name,
    ort.salary,
    ort.hire_date,
    ort.department_id
FROM
    (
        SELECT
            ROWNUM rn,
            ot.first_name,
            ot.salary,
            ot.hire_date,
            ot.department_id
        FROM
            (
                SELECT
                    emp.first_name,
                    emp.salary,
                    emp.hire_date,
                    dep.department_id
                FROM
                    employees   emp,
                    departments dep
                WHERE
                    emp.department_id = dep.department_id
                    AND hire_date >= '07/01/01'
                    AND hire_date < '08/01/01'
                ORDER BY
                    emp.salary
            ) ot
    ) ort
WHERE
    ort.rn >= 3
    AND ort.rn <= 7;
--------
SELECT
    ROWNUM rn,
    ot.first_name,
    ot.salary,
    ot.hire_date,
    ot.department_id
FROM
    (
        SELECT
            emp.first_name,
            emp.salary,
            emp.hire_date,
            dep.department_id
        FROM
            employees   emp,
            departments dep
        WHERE
            emp.department_id = dep.department_id
            AND hire_date >= '07/01/01'
            AND hire_date < '08/01/01'
        ORDER BY
            emp.salary
    ) ot;