/****************************
*join
****************************/

/* equi join */
select first_name,
       salary,
       de.department_id,
       de.department_name
from employees em, departments de
where em.department_id = de.department_id;

--예)
select em.first_name,
       de.department_name,
       jo.job_title
from employees em, departments de, jobs jo
where em.department_id = de.department_id and
      em.job_id = jo.job_id;
      
/* outer join */
-- left outer join
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from employees em left outer join departments de
on em.department_id = de.department_id;

-- left outer join(오라클)
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from employees em, departments de
where em.department_id = de.department_id(+);

--right outer join
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from employees em right outer join departments de
on em.department_id = de.department_id;

-- right outer join(오라클)
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from employees em, departments de
where em.department_id(+) = de.department_id;


-- right outer join --> left outer join
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from departments de left outer join employees em
on de.department_id = em.department_id;

select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from departments de, employees em
where de.department_id = em.department_id(+);

-- full outer join
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from employees em full outer join departments de
on em.department_id = de.department_id;
-- full outer join 오라클 구문(+)는 사용할 수 없음


/* self join */
select em.employee_id,
       em.first_name,
       em.salary,
       em.phone_number,
       em.manager_id,
       ma.employee_id,
       ma.first_name,
       ma.phone_number
from employees em, employees ma     -- 같은 테이블명을 사용할 수 없어서 alias 꼭 사용
where em.manager_id = ma.employee_id;


select employee_id,
       first_name,
       phone_number,
       salary,
       manager_id
from employees;

--잘못된 조인
select  em.employee_id,
        em.first_name,
        em.salary,
        lo.location_id,
        lo.city
from employees em, locations lo
where em.salary = lo.location_id;