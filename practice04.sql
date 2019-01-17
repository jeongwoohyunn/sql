select * from employees;
select * from salaries;
-- 모델링 sql 

-- 1번

select count(a.emp_no) 
	from employees a,salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and salary>(select avg(salary)
		from salaries
        where to_date = '9999-01-01'
    );
    
-- 2번

select a.emp_no , concat(a.first_name,' ',a.last_name), b.dept_name, c.salary
	-- from employees a, departments b, salaries c, dept_emp d
    where a.emp_no = c.emp_no
    and a.emp_no = d.emp_no
    and b.dept_no = d.dept_no
    and c.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    and salary = any (select max(salary)
		from salaries
        where to_date = '9999-01-01')
	group by b.dept_name
    having max(salary)
    order by salary desc;

-- 3번

select b.dept_name,avg(c.salary)
	from employees a, departments b, salaries c, dept_emp d
    where a.emp_no = c.emp_no
    and a.emp_no = d.emp_no
    and b.dept_no = d.dept_no
    and c.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    and salaryany(select emp_no);
    
-- 4번
    
    
	
