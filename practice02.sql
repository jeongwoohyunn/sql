select * from employees;
select * from salaries;

-- 1번
select max(salary) as '최고임금', min(salary) as '최저임금',(max(salary)-min(salary)) as '최고임금 - 최저임금' from salaries ;
			
-- 2번 -- hire_date
select date_format(max(hire_date),'%Y년 %m월 %d일') from employees;

-- 3번
select date_format(min(hire_date),'%Y년 %m월 %d일') from employees;

-- 4번
select avg(salary) from salaries where to_date like '9999-01-01'; 

-- 5번
select max(salary),min(salary) from salaries where to_date like '9999-01-01';

-- 6번 -- 보충
select (2019-max(from_date)), (2019-min(from_date)) from salaries;
