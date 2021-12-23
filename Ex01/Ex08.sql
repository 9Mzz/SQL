-- 급여를 가장 많이 받는 직원의 이름을 출력
select  max(salary)
from    employees;

select  first_name, salary
from    employees
where   salary= (select  max(salary)
                 from    employees);


-- 01.ROWNUM 이해                 
select  rownum
        first_name, salary
from    employees;        

-- 02. 급여순으로 정렬  --> ROWNUM이 섞임, ROWNUM이 작동하고 ORDER BY가 작동하기 때문
select  rownum,
        first_name, salary
from    employees
order by salary desc;

select  first_name, salary
from    employees
order by salary desc;

-- 03. 해결방법 정렬된 테이블을 사용해서 ROWNUM 사용
select  rownum,
        first_name, salary
from   (select  first_name, salary
        from    employees
        order by salary desc)
where   rownum<= 10; -- 급여 많이 받는 상위 10명 출력

select  rownum,
        first_name, salary
from   (select  first_name, salary
        from    employees
        order by salary desc) o -- 급여를 내림차순으로 정렬시킨 테이블
where   rownum between 2 and 5; -- 아무것도 출력되지 않음

-- 문제 해결
select  r.rno, first_name, salary
from    (select  rownum rno,
                 first_name, salary
         from   (select  first_name, salary
                 from    employees
                 order by salary desc) o) r -- 급여를 내림차순으로 정렬한 테이블에 ROWNUM 적용한 테이블
where   rno between 2 and 5;                 


-- 예제
-- 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은? 

-- 1단계. 2007년에 입사한 직원의 급여를 내림차순으로 정렬
select  to_char(hire_date, 'YYYY'), first_name, salary
from    employees
where   to_char(hire_date, 'YYYY')= 2007
order by salary desc;

-- 2단계. 전 단계 테이블에 ROWNUM 부여
select  rownum rno,
        first_name, salary
from    (select  to_char(hire_date, 'YYYY'), first_name, salary, hire_date
         from    employees
         where   to_char(hire_date, 'YYYY')= 2007
         order by salary desc) o;
         
-- 3단계. 전 단계 테이블에서 급여 순위 3~7등의 이름 급여 입사일 출력 (최종)
select  r.rno, first_name, salary, hire_date
from    (select  rownum rno,
                 first_name, salary, hire_date
         from    (select  to_char(hire_date, 'YYYY'), first_name, salary, hire_date
                  from    employees
                  where   to_char(hire_date, 'YYYY')= 2007
                  order by salary desc) o) r
where   r.rno between 3 and 7;        



-- 예제+
-- 07년에 입사한 직원중 급여가 많은 순위 3등에서 7등의 이름, 급여, 입사일, 부서명 출력 
select  r.rno, r.first_name, r.salary, r.hire_date, d.department_name
from    (select  rownum rno,
                 first_name, salary, hire_date, department_id
         from    (select  to_char(hire_date, 'YY'), first_name, salary, hire_date, department_id
                  from    employees
                  where   to_char(hire_date, 'YY')= 07
                  order by salary desc) o) r,
        departments d          
where   r.department_id= d.department_id(+)
and     r.rno between 3 and 7;



        