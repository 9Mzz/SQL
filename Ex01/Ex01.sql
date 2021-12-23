--select 문 
--    select 절
--    from 절

--직원테이블 전체 조회
SELECT
    *
FROM
    employees;

--부서테이블 전체 조회 
SELECT
    *
FROM
    departments;

SELECT
    *
FROM
    departments;
--원하는 칼럼만 조회
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees;

--예)

SELECT
    first_name,
    phone_number,
    hire_date,
    salary
FROM
    employees;
--예시2
SELECT
    first_name,
    last_name,
    salary,
    phone_number,
    email,
    hire_date
FROM
    employees;
--출력할 컬럼명 별명 적용하기.
SELECT
    employee_id empno,
    first_name  "f-name",
    salary      연봉
FROM
    employees;

SELECT
    employee_id  사원번호,
    first_name   "name",
    last_name    성,
    salary       급여,
    phone_number 전화번호,
    email        이메일,
    hire_date    입사일
FROM
    employees;
    
--연결 연산자(Concatenateion)로 컬럼들 붙이기
SELECT
    first_name || last_name
FROM
    employees;
---------------------------------
SELECT
    first_name
    || ' '
    || last_name name
FROM
    employees;
---------------------------------
SELECT
    first_name
    || ' 입사일은 '
    || hire_date
FROM
    employees;
--산술 연산자 사용하기
SELECT
    first_name,
    salary,
    salary * 12
FROM
    employees;
-- 산술연산자 응용
SELECT
    first_name,
    salary      AS 월급,
    salary * 12 AS 연봉,
    ( salary + 300 ) * 12
FROM
    employees;

SELECT
    ( job_id ) * 12
FROM
    employees;

SELECT
    first_name
    || '-'
    || last_name           성명,
    salary                 급여,
    ( salary ) * 12        연봉,
    ( salary * 12 + 5000 ) 연봉2,
    phone_number           전화번호
FROM
    employees;

--Where절
-- 비교 연산자
SELECT
    first_name,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
    department_id >= 10;
    
--예제
--연봉이 15000 이상인 사원들의 이름과 월급을 출력하세요
SELECT
    first_name
    || '-'
    || last_name 이름,
    salary       월급
FROM
    employees
WHERE
    ( salary ) * 12 >= 15000;
--07/01/01 일 이후 입사한 사원들의 이름과 입사일을 출력하세요
SELECT
    first_name
    || '-'
    || last_name 이름,
    salary       월급,
    hire_date    입사일
FROM
    employees
WHERE
    hire_date > '07/01/01';
--이름인 Lex인 직원의 연봉을 출력하세요
SELECT
    first_name      이름,
    ( salary ) * 12 연봉
FROM
    employees
WHERE
    first_name = 'Lex';
---------------------------------
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary >= 14000
    AND salary <= 17000;
---------------------------------
SELECT
    first_name,
    hire_date
FROM
    employees
WHERE
    hire_date >= '04/01/01'
    AND hire_date <= '05/12/31';
---Betweeb 연산자로 특정구간 값 출력하기
SELECT
    *
FROM
    employees
WHERE
    salary >= 14000
    AND salary <= 17000;

SELECT
    *
FROM
    employees
WHERE
    salary BETWEEN 14000 AND 17000;

-- % << 이후에 어떤 단어가 상관없다..
SELECT
    *
FROM
    employees
WHERE
    first_name LIKE 'L%';
    
-- 이름에 am을 포함한 사원의 이름과 연봉을 출력하세요.
SELECT
    *
FROM
    employees
WHERE
    first_name LIKE '%am%';
---------------------------------
SELECT
    *
FROM
    employees
WHERE
    first_name LIKE '_a%';
    
--이름이 네번째 글자가 a인 사원의 이름을 출력하세요
SELECT
    *
FROM
    employees
WHERE
    first_name LIKE '__a_';
-- 이름이 4글자인 사원들 끝에서 두먼째 글자가 a인 사원의 이름을 출력하세요.
SELECT
    *
FROM
    employees
WHERE
    first_name LIKE '%a_';
---------------------------------
SELECT
    *
FROM
    employees
WHERE
    first_name = 'Neena'
    OR first_name = 'Lex'
    OR first_name = 'John'; 
---------------------------------
SELECT
    *
FROM
    employees
WHERE
    first_name IN ( 'Neena', 'Lex', 'John' );

--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary IN ( 2100, 3100, 4100, 5100 );
---------------------------------
--Null
SELECT
    first_name,
    salary,
    salary * commission_pct
FROM
    employees
WHERE
    salary BETWEEN 13000 AND 15000;
--is null / ins not null
SELECT
    *
FROM
    employees
WHERE
    commission_pct IS NULL;
--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
SELECT
    first_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL;
--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
SELECT
    first_name,
    manager_id,
    commission_pct
FROM
    employees
WHERE
    manager_id IS NOT NULL
    AND commission_pct IS NULL;
    
--ORDER BY 절
--desc >> 큰거부터 작은거 내림차순
SELECT
    *
FROM
    employees
ORDER BY
    salary DESC;
--asc >> 작은거부터 큰거 오름차순
SELECT
    *
FROM
    employees
ORDER BY
    salary ASC;
-----------------------
SELECT
    *
FROM
    employees
WHERE
    salary >= 9000
ORDER BY
    salary ASC;
-- 부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
SELECT
    employee_id,
    salary,
    first_name
    || ' '
    || last_name
FROM
    employees
ORDER BY
    employee_id ASC;
    
-- 급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
SELECT
    first_name
    || '-'
    || last_name 이름,
    salary       급여
FROM
    employees
WHERE
    salary >= 10000
ORDER BY
    salary DESC;
    
-- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요
SELECT
    employee_id  부서번호,
    salary       급여,
    first_name
    || ' '
    || last_name 이름
FROM
    employees
ORDER BY
    department_id DESC,
    salary DESC;