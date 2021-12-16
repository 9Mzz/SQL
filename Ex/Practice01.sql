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
    salary >= 3000
    AND commission_pct IS NOT NULL;