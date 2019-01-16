select * from departments;
select * from salaries;
-- 문제 1번 (Remko Zyda)
select concat(first_name,' ',last_name) from employees where emp_no= 10944;

-- 문제 2번
select concat(first_name,' ',last_name)as '이름', gender as '성별',
	birth_date as '입사일' 
    from employees 
    order by birth_date;
    
-- 문제 3번 -- 보충
select count(*) from employees where gender = 'f';
select count(*) from employees where gender = 'm';

-- 문제 4번 (2844047) -- count(emp_no)비교해보기
select * from salaries;
select count(*) from salaries where to_date like '9999-01-01';

-- 문제 5번 (9) distinct 중복제외
select count(distinct dept_no) from departments;

-- 문제 6번 (15) 
select count(dept_no) from dept_manager where to_date like '9999-01-01';

-- 문제 7번 --보충
select dept_name from departments order by length(dept_name) desc;

-- 문제 8번
select count(*) from salaries where salary >= 120000 to_date like '9999-01-01';

-- 문제 9번 group by가 먼저
select distinct title from titles group by title order by length(title) desc ;

-- 문제 10번
select count(*) from titles where title like 'Engineer' to_date like '9999-01-01';

-- 문제 11번 -- 직책변경상황 시간순
select title ,from_date,to_date from titles where emp_no = 13250;