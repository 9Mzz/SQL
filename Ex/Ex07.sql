/***********************************
*Sub Query(단일행)
************************************/
--1)전체쿼리문 구조
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary > "Den 의 급여"; 

--2) Den의 급여
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name = 'Den';

--3) Query문 완성   -->들여쓰기 잘할것
SELECT
    first_name,
    salary,
    phone_number,
    department_id
FROM
    employees
WHERE
    salary > (
        SELECT
            salary
        FROM
            employees
        WHERE
            first_name = 'Den'
    );

--예제)
--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?

--1. 급여를 가장 적게 받는 사람의 급여
SELECT
    MIN(salary)
FROM
    employees;

--2. 2100받는 사람의 이름, 급여, 사원번호
SELECT
    first_name,
    salary,
    employee_id
FROM
    employees
WHERE
    salary = 2100;

--3. 식 조합
SELECT
    first_name,
    salary,
    employee_id
FROM
    employees
WHERE
    salary = (
        SELECT
            MIN(salary)
        FROM
            employees
    );

--예제)
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?
--1. 평균급여?
SELECT
    AVG(salary)
FROM
    employees;

--2. 6461.83 보다 적게 받은 사람의 이름, 급여
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary < 6461.83;

--3. 식 조합
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary < (
        SELECT
            AVG(salary)
        FROM
            employees
    );

/***********************************
*Sub Query(다중행)
************************************/
--부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요
--1. 부서번호가 110인 직원의 급여리스트를 구한다.
--   12008  8300
SELECT
    salary
FROM
    employees
WHERE
    department_id = 110;

--2. 급여가 12008, 8300 인 직원의 리스틀 구한다
--표현1
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary = 12008
    OR salary = 8300;

--표현2
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary IN ( 12008, 8300 );

--3 두식을 조합한다
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary IN (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id = 110
    );

--예제)
--각 부서별로 최고급여를 받는 사원을 출력하세요
/*
 100(마케팅)  20000   황일영   
 200(IT)     12300   강호동   
 200(IT)     8700    이효리    (X)
*/
--1. 그룹(부서)별 최고급여를 구한다 (사람 first_name은 표현할 수 없다)
SELECT
    department_id,
    MAX(salary)
FROM
    employees
GROUP BY
    department_id;

--그룹(부서)별 최고급여 --> 사원테이블에서 그룹(부서)번호 와 급여가 같은 직원을 구한다.
SELECT
    first_name,
    salary,
    phone_number,
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

-- any 연산자
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 
--사번, 이름, 급여를 출력하세요.(or연산--> 8300보다 큰)

--1. 부서번호가 110인 직원의 급여
SELECT
    salary
FROM
    employees
WHERE
    department_id = 110;

--2. 부서번호가 110인(12008, 8300) 보다 급여가 큰직원리스트( 사번, 이름, 급여)를 출력
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary > 12008
    OR salary > 8300;

--3.조합
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary > ANY (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id = 110
    ); 

-- all 연산자
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 
--사번, 이름, 급여를 출력하세요.(and연산--> 12008보다 큰)

--1. 부서번호가 110인 직원의 급여
SELECT
    salary
FROM
    employees
WHERE
    department_id = 110;

--2. 부서번호가 110인(12008, 8300) 보다 급여가 큰직원리스트( 사번, 이름, 급여)를 출력
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary > 12008
    AND salary > 8300;

--3. 조합
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary > ALL (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id = 110
    );

SELECT
    department_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary IN (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id = 110
    );
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

--각 부서별로 최고급여를 받는 사원을 출력하세요

--01. 각 부서별 최고 급여 리스트
SELECT
    department_id,
    MAX(salary)
FROM
    employees
GROUP BY
    department_id;
--02. 직원 리스트에서 부서별 최고 급여를 받는 사람을 구한다.
SELECT
    first_name,
    salary,
    department_id
FROM
    employees
WHERE
    salary = 11008
    AND department_id = 30;

--
SELECT
    *
FROM
    employees
WHERE
    ( department_id, salary ) IN (
        SELECT
            department_id, MAX(salary) salary
        FROM
            employees
        GROUP BY
            department_id
    );
    
--테이블 서브쿼리
--각 부서별 최고급여를 받는 사원을 출력하세요
--01. 각 부서별 최고 급여 리스트 --> join 에 이용할 테이블로 사용에정
SELECT
    COUNT(*)
FROM
    employees;
-----------------------------
SELECT
    department_id,
    MAX(salary)
FROM
    employees
GROUP BY
    department_id;

SELECT
    em.first_name,
    em.salary,
    ms.salary,
    em.department_id,
    ms.department_id
FROM
    employees em,
    (
        SELECT
            department_id,
            MAX(salary) salary
        FROM
            employees
        GROUP BY
            department_id
    )         ms
WHERE
    em.department_id = ms.department_id
    AND em.salary = ms.salary;