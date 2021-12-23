-- initcap 첫글자만 대문자
SELECT
    email,
    initcap(email) "Email2",
    department_id
FROM
    employees
WHERE
    department_id = 100;
--Lower 모두 소문자
--Upper 모두 대문자,
SELECT
    first_name,
    lower(first_name) l_first_name,
    upper(first_name) u_first_name,
    first_name,
    first_name
FROM
    employees
WHERE
    department_id = 100;
--문자함수 - SUBSTR (컬럼명, 시작위치, 글자수) 시작위치 ~ 글자수
SELECT
    first_name,
    substr(
        first_name, 1, 3
    ),
    substr(
        first_name, - 3, 2
    ),
    first_name
FROM
    employees
WHERE
    department_id = 100;
--문자함수 -LPAD (컬럼명, 자리수 , '채울문자) \ RPAD (컬럼명, 자리수, )
SELECT
    first_name,
    lpad(
        first_name, 10, '*'
    ),
    rpad(
        first_name, 10, '*'
    ),
    first_name
FROM
    employees;
-- 문자함수 - REPLACE(컬럼명, 문자1, 문자2) 문자1을 문자2로 바꿈
SELECT
    first_name,
    replace(
        first_name, 'i', '*'
    ) replace,
    replace(
        first_name, substr(
            first_name, 2, 3
        ), '***'
    ) "replace+substr",
    first_name
FROM
    employees;
--숫자함수 -Round(숫자, 출력을 원하는 자리수)
SELECT
    round(
        123.456, 2
    ) "r2",
    round(
        123.456, 0
    ) "r0",
    round(
        123.456, - 1
    ) "r-1"
FROM
    dual;
--숫자함수 -trunc(숫자, 출력을 원하는 자리수)
SELECT
    trunc(
        123.456, - 1
    ) "r-1",
    trunc(
        123.956, 0
    ) "r0",
    trunc(
        123.456, 2
    ) "r2"
FROM
    dual;

-- 날짜함수 - SYSDATE()
SELECT
    sysdate
FROM
    dual;
--날짜함수 - 
SELECT
    sysdate,
    hire_date,
    months_between(
        sysdate, hire_date
    )
FROM
    employees
WHERE
    department_id = 100;
--날짜함수 - sysdate()
SELECT
    sysdate,
    hire_date,
    months_between(
        sysdate, hire_date
    ),
    round(
        months_between(
            sysdate, hire_date
        ), 0
    )
FROM
    employees
WHERE
    employee_id = 100;
--TO_CHAR(숫자, '출력모양') 숫자형 -> 문자형으로 변환하기
SELECT
    first_name,
    salary,
    salary * 12,
    to_char(
        salary * 12, '$999999999'
    ) "$",
    to_char(
        salary * 12, '09999999999'
    ) "09",
    to_char(
        salary * 12, '99999999999'
    ) "99",
    to_char(
        salary * 12, '999,999,999'
    ) "000,000"
FROM
    employees
WHERE
    department_id = 100;
-- 변환함수 > to_char(날짜, '출력모양') 날짜 -> 문자형으로 변환하기
SELECT
    sysdate,
    to_char(
        sysdate, 'yyyy"년"mm"월"dd"일" hh24:mi:ss'
    )
FROM
    dual;
------------------
SELECT
    sysdate,
    to_char(
        sysdate, 'dy'
    ),
    hire_date,
    to_char(
        hire_date, 'mm'
    )
FROM
    employees;
-- 일반함수>NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때 값
SELECT
    first_name,
    commission_pct,
    nvl(
        commission_pct, 0
    ),
    nvl2(
        commission_pct, 100, 0
    )
FROM
    employees;