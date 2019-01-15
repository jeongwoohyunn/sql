select *from employees limit 1000,1000; -- 자동으로 리미트를 걸어준다.

-- concat column의 값을 합친것.

select emp_no as '번호',concat(first_name,' ',last_name) as '이름',hire_date as '입사일' from employees;

-- distinct
select distinct title from titles;

-- orderby --위치변경

select concat(first_name,' ',last_name) as '이름', gender, hire_date from employees 
order by hire_date asc;

select emp_no,salary from salaries
-- where '2000-12-31'<from_date
where from_date like '2001-%' order by salary desc;


select first_name,gender,hire_date from employees where hire_date < '1989-01-01' and gender = 'f';


select * 
	from dept_emp 
    where dept_no in('d005','d009');
    
    
select first_name,gender,hire_date from employees where hire_date like '1989-__-__';


