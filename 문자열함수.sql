-- mysql 문자열함수alter
select ucase('Seoul'),upper('seoul');
select lcase('Seoul'),lower('SEOUL');

select substring(first_name,3,2)from employees;
select substring('Happy Day',3,2) -- 3째부터 두개
	from dual; -- 표준문법에는 쓰게 되어있다.

select first_name,gender,hire_date 
	from employees 
    where substring(hire_date,1,4) = '1989';
    
select LPAD('hi',10,'*')from dual;
select RPAD('hi',10,'*')from dual;

-- 2001년 이후 
select *from employees;

select emp_no,LPAD(cast(salary as char),10,'*') from salaries;

select 
	concat('---',ltrim('   hello   '),'---'),
    concat('---',rtrim('   hello   '),'---'),
    concat('---', trim('   hello   '),'---');
-- ltrim은 왼쪽의 공백을 없애준다.

select concat(first_name,' ',last_name)as '이름', hire_date as '입사일'
	from employees where substring(hire_date,1,4);
    
    select trim(both 'x' from 'xxxhixxx'),
    trim(leading 'x' from 'xxxhixxx'),
    trim(trailing 'x' from 'xxxhixxx');
    
    