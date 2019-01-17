desc employee;
desc department;

insert 
	into department
		values(null,'총무팀');
insert 
	into department
		values(null,'개발팀');
insert 
	into department
		values(null,'인사팀');
insert 
	into department
		values(null,'영업팀');
        
select * from department;

desc employee;

insert
	into employee
		values(null,'둘리',1);
insert
	into employee
		values(null,'마이콜',2);
insert
	into employee
		values(null,'또치',3);
        
insert into employee values(null,'길동',null);
        
select * from employee;

select * from employee,department;

select * from employee a, department b 
	where a.no = b.no;
    
-- join on    
    
select * from employee a
		join department b 
		on a.department_no = b.no;
        
-- join on    
    
select * 
	from employee a
	left join department b 
    on a.department_no = b.no;
