drop table member;

create table member(
	no int unsigned not null,
    emaill varchar(50)not null,
    password varchar(20)not null,
    name varchar(20),
    department_name varchar(20)not null default 'none',
    primary key(no)
);

desc member;
-- 칼럼 추가

alter table member add column jumin char(13) not null;
alter table member drop column jumin;
alter table member add column jumin char(13) not null first;
alter table member drop column jumin;

-- 146슬라이드
alter table member add column join_Date datetime not null after name;

-- 147슬라이드
alter table member change no no int unsigned not null auto_increment;

-- 148슬라이드 
alter table member change department_name dept_name varchar(20);

desc member;


alter table member rename user;


desc user;

-- foreign key constraint(제약조건 : 데이터의 생성, 삭제, 수정에 제약을 가하다)
create table user(
	no int unsigned not null auto_increment,
    name varchar(50) not null,
    password varchar(64)not null,
    email varchar(50) not null,
    jumin char(13) not null,
    join_date datetime not null,
    dept_no int unsigned,
    primary key(no),
    
    foreign key(dept_no) references dept(no)
    on delete cascade-- set null, cascade
);
drop table user;

insert into dept(name) values('개발팀');
select * from user;
insert into user values(null,'a@a.com',password('1234'),'둘리','',now(),1);

-- on delete restrict
delete from dept where no =2;
