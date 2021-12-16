-- 1번
SELECT
    first_name
    || '-'
    || last_name 이름,
    salary       월급,
    phone_number 전화번호,
    hire_date    입사일
FROM
    employees
ORDER BY
    hire_date ASC;

--2번
SELECT
    *
FROM
    jobs
ORDER BY
    max_salary DESC,
    job_title DESC;
--3번
SELECT
    first_name 이름,
    manager_id "매니저 아이디",
    nvl(
        commission_pct, 0
    )          "커미션 비율",
    salary     월급
FROM
    employees
WHERE
    salary > 3000
    AND commission_pct IS NULL;
--4번
SELECT
    *
FROM
    jobs
WHERE
    max_salary >= 10000
ORDER BY
    max_salary DESC;
--5번
SELECT
    first_name 이름,
    salary     월급,
    nvl(
        commission_pct, 0
    )          "커미션 퍼센트"
FROM
    employees
WHERE
    salary BETWEEN 10000 AND 14000
ORDER BY
    salary ASC;
--6번
SELECT
    first_name    이름,
    salary 월급,
    to_char(hire_date, 'yyyy-mm')입사일,
    department_id 부서번호
FROM
    employees
WHERE
    department_id IN ( 10, 90, 100 );
--7번
select *
from employees
where first_name like ('%s%' or '%S%');