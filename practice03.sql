select *from employees;
select *from titles;
select *from salaries;
select * from departments;
SELECT * FROM employees.dept_emp;

-- 문제1번 -- 두개이상 join은 주테이블들이랑 join묶어주기

select a.emp_no as '사번',a.last_name as '이름', b.salary as '연봉'
	from employees a,salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    order by salary desc;
    
-- 문제2번 --현재추가?

select a.emp_no as '사번',a.last_name as '이름', b.title as '직책' 
	from employees a,titles b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    order by a.last_name; 
    
-- 문제3번

select a.emp_no as '사번',a.last_name as '이름', c.dept_name as '부서' 
	from employees a,dept_emp b,departments c
    where a.emp_no = b.emp_no
    and b.dept_no = c.dept_no
    and b.to_date = '9999-01-01'
    order by a.last_name; 
    
-- 문제4번

select a.emp_no as '사번',a.last_name as '이름',b.salary as '연봉',c.title as '직책', e.dept_name as '부서' 
	from employees a,salaries b,titles c,dept_emp d,departments e
    where a.emp_no = b.emp_no
    and b.emp_no = c.emp_no
    and a.emp_no = d.emp_no
    and d.dept_no = e.dept_no
    and b.to_date = '9999-01-01'
    order by a.last_name; 
    
    
-- 문제5번 --과거무슨말?

select a.emp_no as '사번',concat(a.first_name,' ',a.last_name )as '이름'
	from employees a, titles b
    where a.emp_no = b.emp_no
    and title = 'Technique Leader';
    
-- 문제6번
select a.last_name as '이름', d.dept_name as '부서명'  ,c.title as '직책' 
	from employees a,dept_emp b, titles c, departments d
    where a.emp_no = b.emp_no
    and b.dept_no = d.dept_no
    and b.emp_no = c.emp_no
    and a.last_name like 'S%'
    and b.to_date = '9999-01-01';
    
-- 문제7번

select a.last_name as '사원',c.salary as '급여'
	from employees a, titles b, salaries c
	where a.emp_no = b.emp_no
    and b.emp_no = c.emp_no
    and title like 'Engineer'
    and salary>=40000
    and b.to_date = '9999-01-01'
    order by salary desc;
    
-- 문제8번

select a.title as '직책',b.salary as '급여'
	from titles a,salaries b
    where a.emp_no = b.emp_no
    and b.salary>=50000
    and b.to_date = '9999-01-01'
    order by b.salary desc;
    
-- 문제9번 --부서별 평균연봉이 큰 순서대로

select c.dept_name,avg(d.salary)
	from employees a, dept_emp b,departments c, salaries d
    where a.emp_no = b.emp_no
    and b.dept_no = c.dept_no
    and a.emp_no = d.emp_no
    and b.to_date = '9999-01-01'
    group by c.dept_name
    order by avg(d.salary) desc;
    
-- 문제10번 --보충

select e.title,avg(d.salary)
	from employees a, salaries d , titles e
    where a.emp_no = d.emp_no
    and  a.emp_no = e.emp_no
    and b.to_date = '9999-01-01'
    group by e.title
    order by avg(d.salary) desc;
    
-- slide 119 예제 4번

select emp_no , avg(salary)
	from salaries
    group by emp_no
    having avg(salary) >50000;
    
-- 5번 --주테이블도 포함시키는 것이 좋다. where join조건은 from테이블수-1 ctrl+b

select b.title,avg(a.salary) as '평균연봉',count(a.emp_no) as '인원수' 
	from salaries a,titles b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and a.to_date = '9999-01-01'
    group by b.title
    having count(a.emp_no)>=100;
    
-- 6번

select c.dept_name as '부서',avg(b.salary) as '평균급여'
	from employees e,titles a, salaries b, departments c,dept_emp d
    where e.emp_no = a.emp_no
	and e.emp_no = d.emp_no
    and e.emp_no = b.emp_no
    and d.dept_no = c.dept_no
    and a.title like 'Engineer'
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    group by c.dept_name;
    
-- 7번 --별로 = group by -- 수정

select a.title as '직책',sum(b.salary) as '급여총합'
	from titles a, salaries b,employees c
    where c.emp_no = a.emp_no
    and c.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and a.to_date = '9999-01-01'
    group by a.title
    having sum(b.salary)>=2000000000
    and a.title != 'Engineer' -- = and a.title <> 
    order by sum(b.salary) desc;
    
    