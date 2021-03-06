--문제1.
--평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.
--평균 급여
SELECT
    AVG(salary)
FROM
    employees;

--급여를 받는 직원
SELECT
    COUNT(salary)
FROM
    employees;

--결합
SELECT
    COUNT(salary)
FROM
    employees
WHERE
    salary < (
        SELECT
            AVG(salary)
        FROM
            employees
    );

--문제2.
--평균급여 이상, 최대급여 이하의 월급을 받는 사원의
--직원번호(employee_id), 이름(first_name), 급여(salary), 평균급여, 최대급여를 급여의 오름차
--순으로 정렬하여 출력하세요

--평균급여 
SELECT
    AVG(salary)
FROM
    employees;
--최대급여
SELECT
    MAX(salary)
FROM
    employees;

-- 월급을 받는 사원
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary >= (
        SELECT
            AVG(salary)
        FROM
            employees
    )
    AND salary <= (
        SELECT
            MAX(salary)
        FROM
            employees
    )
ORDER BY
    salary ASC;
    

--문제3.
--직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소
--를 알아보려고 한다.
--도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주
--(state_province), 나라아이디(country_id) 를 출력하세요

--직원 이름이 Steven king
SELECT
    lo.location_id    "도시 아이디",
    lo.street_address "거리명",
    lo.postal_code    "우편번호",
    lo.city           "도시명",
    lo.state_province 주,
    lo.country_id     "나라 아이디"
FROM
    employees   em,
    departments de,
    locations   lo
WHERE
    first_name = 'Steven'
    AND last_name = 'King'
    AND em.department_id = de.department_id
    AND de.location_id = lo.location_id;
    
--문제4.
--job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로
--출력하세요 -ANY연산자 사용
--(74건)
-- job_id가 ST_MAN
SELECT
    *
FROM
    employees
WHERE
    job_id = 'ST_MAN';

--직원의 사번, 이름, 급여
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
ORDER BY
    salary ASC;
--결합
SELECT
    employee_id 사번,
    first_name  이름,
    salary      급여
FROM
    employees
WHERE
    salary < ANY (
        SELECT
            salary
        FROM
            employees
        WHERE
            job_id = 'ST_MAN'
    )
ORDER BY
    salary ASC;
    
--
--문제5. 
--각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여
--(salary) 부서번호(department_id)를 조회하세요
--단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
--조건절비교, 테이블조인 2가지 방법으로 작성하세요
--(11건)

--사원의 전화번호, 이름, 급여, 부서번호
SELECT
    employee_id,
    first_name,
    salary,
    department_id
FROM
    employees;

--부서별로 최고의 급여
SELECT
    department_id,
    MAX(salary)
FROM
    employees
GROUP BY
    department_id;

--조건절 결합

--테이블조인 결합
SELECT
    employee_id,
    first_name,
    salary,
    department_id
FROM
    employees
WHERE
    ( department_id, salary ) IN (
        SELECT
            department_id, MAX(salary)
        FROM
            employees
        GROUP BY
            department_id
    );
    
--문제6.
--각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 
--연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오
--(19건)

-- 업무명, 연봉 총합
SELECT
    jo.job_title,
    SUM(em.salary)
FROM
    employees em,
    jobs      jo
WHERE
    jo.job_id = em.job_id
GROUP BY
    jo.job_title
ORDER BY
    SUM(em.salary) DESC;

--문제7.
--자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id), 이름
--(first_name)과 급여(salary)을 조회하세요
--(38건)

--자신의 부서 평균 급여
SELECT
    department_id,
    AVG(salary) salary
FROM
    employees
GROUP BY
    department_id;

--직원번호, 이름, 급여 조회
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees;

--결합
SELECT
    em.employee_id,
    em.first_name,
    em.salary
FROM
    employees em,
    (
        SELECT
            department_id,
            AVG(salary) salary
        FROM
            employees
        GROUP BY
            department_id
    )         em1
WHERE
    em.department_id = em1.department_id
    AND em.salary > em1.salary;

--문제8.
--직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 급여, 입사일을 입사일 순서로 출력
--하세요
--직원 입사일
SELECT
    hire_date
FROM
    employees
ORDER BY
    hire_date DESC;

--직원의 사번, 이름, 급여, 입사일
SELECT
    ROWNUM,
    employee_id,
    first_name,
    salary,
    hire_date
FROM
    employees;

--입사일이 11번째에서 15번째
SELECT
    ROWNUM,
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    ROWNUM >= 11
    AND ROWNUM <= 15 --> 출력 안됨
    ;

--1차 결합
SELECT
    ROWNUM,
    employee_id,
    first_name,
    salary,
    hire_date
FROM
    (
        SELECT
            *
        FROM
            employees
        ORDER BY
            hire_date DESC
    );
--최종 결합
SELECT
    r.ron,
    r.employee_id,
    r.first_name,
    r.salary,
    r.hire_date
FROM
    (
        SELECT
            ROWNUM ron,
            employee_id,
            first_name,
            salary,
            hire_date
        FROM
            (
                SELECT
                    *
                FROM
                    employees
                ORDER BY
                    hire_date DESC
            ) o
    ) r
WHERE
    r.ron >= 11
    AND r.ron <= 15;