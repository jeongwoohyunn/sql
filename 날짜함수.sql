select curdate(),current_date;
select curtime(),current_time;
select now(),sysdate();

-- now()는 쿼리가 실행될 때 시간이 계속 유지
-- sysdate()은 출력 될 때 마다 현재 시간으로 바뀐다.
select emp_no, now() from employees;
select emp_no, sysdate() from employees;

-- 포맷팅

select first_name, 
	date_format(hire_date,'%Y-%m-%d %h:%i:%s') -- 년도 애소문자 앞 옵션
    from employees;
    
-- 각 직원들에 대해 직원의 이동과 근무월수
select first_name,
	concat(
	cast(period_diff(date_format(curdate(),'%Y%m'),
    date_format(hire_date,'%Y%m'))as char),'개월')
    from employees;
    
-- 각 사원 입사 후 6개월 뒤에 정규직으로 발령이 된다.
-- 발령날은 언제?
-- month,week,year,day
select first_name,
	hire_date,
    date_Add(hire_date, interval 6 month)
	from employees;
    
select date_add(
	cast('1994-11-10' as DATE), interval 10000 day);
    