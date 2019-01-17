
-- subquery

select b.dept_no
	from employees a, dept_emp b
    where a.emp_no = b.emp_no
    and concat(a.first_name,' ',a.last_name) = 'Fai Bale'
    and b.to_date = '9999-01-01';
    
select a.emp_no, a.first_name
	from employees a, dept_emp b -- 가져오는건 두개밖에없지만
    where a.emp_no = b.emp_no
    and b.detp_no = (select b.dept_no
						from employees a, dept_emp b
						where a.emp_no = b.emp_no
						and concat(a.first_name,' ',a.last_name) = 'Fai Bale'
						and b.to_date = '9999-01-01');
-- 1번 
select title,min(avg_salary) -- 138tm - -from절에 넣어주다
from (select title , avg(a.salary) as avg_salary
		from salaries a , titles b, employees c
		where c.emp_no = a.emp_no
        and c.emp_no = b.emp_no
		and a.to_date = '9999-01-01'
		and b.to_date = '9999-01-01'
	group by title) a;
    -- order by avg_salary asc
		-- limit 0,1; 0번째부터 1개
    

    
-- ex2) 현재 가장적은 평균 급여를 받고 있는 직책에 
select a.first_name,b.salary
	from employees a, salaries b
	where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and salary<(select avg(salary) 
				from salaries 
				where to_date = '9999-01-01')
order by b.salary desc;




select a.first_name,b.salary
	from employees a, salaries b
	where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and salary<(select avg(salary) 
				from salaries 
				where to_date = '9999-01-01')
order by b.salary desc;
    
-----
-- any,all 보충


select emp_no
	from salaries where to_date = '9999-01-01' and salary>50000;

select concat(first_name,' ',last_name),salary
	from employees a, salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and a.emp_no = any(select emp_no
	from salaries where to_date = '9999-01-01' and salary>50000);
    
select concat(first_name,' ',last_name),salary
	from employees a ,(select emp_no ,salary from salaries where to_date = '9999-01-01' and salary>50000) b
    where a.emp_no = b.emp_no;
    
-- from 절에 넣는것과 where 절에 넣는 것의 차이
