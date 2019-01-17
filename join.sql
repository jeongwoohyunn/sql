select * from employees;
select * from salaries;
select * from titles;
-- equijoin(inner join)

-- 현재 근무중인 직원의 이름과 직책을 출력하세요.
select a.emp_no, a.first_name,b.title -- 번호에 상응하는 a의 성과 b의 타이틀
	from employees a,titles b
    where a.emp_no = b.emp_no -- join 조건
    and b.to_date = '9999-01-01'; -- 선택 조건(현재일때)
    -- select concat(employees.first_name,' ',employees.last_name) as '직원이름',

-- 현재 근무중인 직책이 Senior Engineer인 직원의 이름을 출력하세요(과 무엇을 출력하세요)

select a.emp_no, a.first_name -- 번호에 상응하는 a의 성과 b의 타이틀
	from employees a,titles b -- a로 쓰는것을 아리아스?
    where a.emp_no = b.emp_no -- join 조건
    and b.to_date = '9999-01-01' -- 선택 조건(현재일때)
    and b.title = 'senior Engineer';


-- 현재 근무중인 직책이 Senior Engineer인 여자직원의 이름을 출력하세요(과 무엇을 출력하세요)

select a.emp_no, a.first_name -- 번호에 상응하는 a의 성과 b의 타이틀
	from employees a,titles b -- a로 쓰는것을 아리아스?
    where a.emp_no = b.emp_no -- join 조건
    and b.to_date = '9999-01-01' -- 선택 조건(현재일때)
    and b.title = 'senior Engineer'
    and a.gender = 'f';

select * from employees;

    
-- ANSI/ISO SQL의 JOIN


-- 1. natural join 번 다시
select a.emp_no, a.first_name, b.title  -- 번호에 상응하는 a의 성과 b의 타이틀
	from employees a natural join titles b -- a로 쓰는것을 아리아스?
    where a.emp_no = b.emp_no ;-- join 조건



select a.emp_no, a.first_name, b.title  -- 번호에 상응하는 a의 성과 b의 타이틀
	from employees a -- a로 쓰는것을 아리아스?
	join titles b on a.emp_no = b.emp_no
   where b.to_date = '9999-01-01';
   
select a.emp_no, a.first_name, b.title  -- 번호에 상응하는 a의 성과 b의 타이틀
	from employee a -- a로 쓰는것을 아리아스?
	natural join titles b 
   where b.to_date = '9999-01-01';
   
-- 2번 join ~using
	select a.emp_no, a.first_name, b.title  -- 번호에 상응하는 a의 성과 b의 타이틀
	from employees a -- a로 쓰는것을 아리아스?
	join titles b using(emp_no)
   where b.to_date = '9999-01-01';
   
-- 3번 join ~on
	select a.emp_no, a.first_name, b.title  -- 번호에 상응하는 a의 성과 b의 타이틀
	from employees a -- a로 쓰는것을 아리아스?
	join titles b on a.emp_no = b.emp_no
   where b.to_date = '9999-01-01';

-- 예제
-- 현재 회사 상황을 반영한 근무부서를 사번, 직원이름전체, 근무부서 형태로 출력해보세요.


-- 다시 보충
select a.emp_no, concat(a.first_name,' ',a.last_name), c.dept_name  -- 번호에 상응하는 a의 성과 b의 타이틀
	from employees a,dept_emp b, department c -- a로 쓰는것을 아리아스?
	where a.emp_no = b.emp_no
    and b.emp_no = c.emp_no
    and c.emp_no = a.emp_no
    b.to_date = '9999-01-01'
    order by concat(a.first_name,' ',a.last_name);


-- 현재 회사에서 지급되고 있는 급여체계를 반영한 결과를 출력하세요 
select a.emp_no as '사번', concat(a.first_name,' ',a.last_name) as '전체이름', b.salary as ''
	from employees a, salaries b
    where a.emp_no = b.emp_no
	b.to_date = '9999-01-01'
	order by concat(a.first_name,' ',a.last_name);
    
    
    