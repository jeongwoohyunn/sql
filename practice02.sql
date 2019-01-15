select * from employees;
select * from salaries;

-- 1번
select (max(salary)-min(salary)) as '최고임금 - 최저임금' from salaries ;
			
-- 2번
select date_format(max(from_date),'%Y년 %m월 %d일') from salaries order by from_Date;

-- 3번
select date_format(min(from_date),'%Y년 %m월 %d일') from salaries;

-- 4번
select avg(salary) from salaries; 

-- 5번
select max(salary),min(salary) from salaries;

-- 6번
select (2019-max(from_date)), (2019-min(from_date)) from salaries;
