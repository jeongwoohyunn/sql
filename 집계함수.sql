-- 집계 함수(통계)
select emp_no, avg(salary), sum(salary)
	from salaries
    where emp_no = '10060';

-- select 문에 집계함수가 들어가면 다른것은 올수 없다.
select emp_no, avg(salary), sum(salary)
	from salaries
    group by emp_no;
    
select salary,from_date
	from salaries
    where emp_no = '10060';    

-- 112슬라이드
select *
from( select max(salary) as max_salary, 
			 min(salary) as min_salary
	 from salaries
    where emp_no = 10060) a;


select count(*) from titles group by emp_no;

-- //
select emp_no,avg(salary) from salaries where avg(salary)>10000 group by emp_no;
-- avg(salary)가 나올수없

