--연습문제
--1번
SELECT
    em.employee_id     사번,
    em.first_name      이름,
    em.last_name       성,
    de.department_name 부서명
FROM
    employees   em,
    departments de
WHERE
    em.department_id = de.department_id
ORDER BY
    de.department_id ASC,
    em.employee_id DESC;

--2번
SELECT
    em.employee_id     사번,
    em.first_name      이름,
    em.salary          급여,
    de.department_name 부서명,
    jo.job_title       현재업무
FROM
    employees   em,
    departments de,
    jobs        jo
WHERE
    em.job_id = jo.job_id
    AND em.department_id = de.department_id
ORDER BY
    em.employee_id ASC;
    
--2-1번 >>>> check
SELECT
    em.employee_id     사번,
    em.first_name      이름,
    em.salary          급여,
    de.department_name 부서명,
    jo.job_title       현재업무
FROM
    employees   em,
    departments de,
    jobs        jo
WHERE
    em.department_id = de.department_id (+)
    AND em.job_id = jo.job_id
ORDER BY
    em.employee_id ASC;
    

--3번
SELECT
    lo.city,
    de.department_name,
    de.department_id
FROM
    departments de,
    locations   lo
WHERE
    de.location_id = lo.location_id
ORDER BY
    lo.country_id ASC;

-- 3-1번
SELECT
    lo.city,
    de.department_name,
    de.department_id
FROM
    departments de,
    locations   lo
WHERE
    de.location_id (+) = lo.location_id
ORDER BY
    lo.country_id ASC;

--3-2번 ex
SELECT
    *
FROM
    departments de
    RIGHT OUTER JOIN locations   lo ON de.location_id = lo.location_id
ORDER BY
    lo.country_id ASC;

--4번
SELECT
    *
FROM
    regions   re,
    countries co
WHERE
    re.region_id = co.region_id
ORDER BY
    re.region_id ASC,
    re.region_name DESC;

--5번
SELECT
    em.employee_id 사번,
    em.first_name  이름,
    em.hire_date   채용,
    ma.first_name  매니저이름,
    ma.hire_date   매니저입사일
FROM
    employees em,
    employees ma
WHERE
    em.manager_id = ma.manager_id
    AND em.hire_date > ma.hire_date;

--6번
SELECT
    co.country_name    나라명,
    co.country_id      나라아이디,
    lo.city            도시명,
    lo.country_id      도시아이디,
    de.department_name 부서명,
    de.department_id   부서아이디
FROM
    countries   co,
    locations   lo,
    departments de
WHERE
    co.country_id = lo.country_id
    AND lo.location_id = de.location_id
ORDER BY
    ( co.country_name ) DESC;
    
--7번
SELECT
    em.employee_id  사번,
    em.first_name
    || '-'
    || em.last_name 이름,
    em.job_id       업무아이디,
    jo.start_date   시작일,
    jo.end_date     종료일
FROM
    job_history jo,
    employees   em
WHERE
    jo.employee_id = em.employee_id
    AND jo.job_id = 'AC_ACCOUNT';
    
--8번
SELECT
    de.department_id   "부서 번호",
    de.department_name "부서 이름",
    ma.first_name      "매니저 이름",
    lo.city            "도시",
    co.country_name    "나라 이름",
    re.region_name     "지역 이름"
FROM
    departments de,
    employees   em,
    employees   ma,
    locations   lo,
    countries   co,
    regions     re
WHERE
    em.manager_id = ma.manager_id
    AND de.department_id = em.department_id
    AND de.location_id = lo.location_id
    AND lo.country_id = co.country_id
    AND co.region_id = re.region_id
ORDER BY
    de.department_id ASC;
    
--9번
SELECT
    em.employee_id     사번,
    em.first_name      이름,
    de.department_name 부서명,
    ma.first_name      "매니저 이름"
FROM
    employees   em,
    employees   ma,
    departments de
WHERE
    em.manager_id = ma.manager_id
    AND em.department_id = de.department_id (+)

order by em.employee_id asc    
;