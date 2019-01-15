-- 기본쿼리 연습
-- ctrl enter
drop table pet;
create table pet(
	name varchar(20),
    owner varchar(20),
    species varchar(20),
	gendr char(1),
    birth date,
    death date
);

desc pet;-- 테이블의 스키마를 보여줌

insert into pet values('띵이', '우현','cat','F','2018-10-10',null);
-- insert 순서대로 넣어준다.

select name, owner from pet;
-- 사용할 데이터만 가져오는 것이 좋다. 

-- load data
-- 엑셀의 내용을 뺴내서 활용
load data local infile "c://pet.txt" into table pet; -- 경로를 지정해줘야된다.

select * from pet;
-- 모든 로우

-- sql select

select * from pet where name = "Bowser";-- 안에 내용데이터의 대소문자는 구분한다.

select * from pet where birth > '1998-01-01';
-- 여기서부터


select * from pet where species = 'dog' and gendr = 'f';-- and 사용가능

select * from pet where species = 'snake' or species = 'bird';

select name, birth from pet;

-- no1 만들어서 order by로 목록.

select name, birth from pet order by birth;

select name, birth from pet order by birth desc;



-- null다루기
select * from pet where death is null;

select name from pet where death is not NULL;

-- LIKE 검색

select * from pet where name like 'b%';

select * from pet where name like 'b_____';

select * from pet where name like '%fy';

select * from pet where name like '%w%';

select * from pet where name like '_____'; 

select * from pet where length(name)=5;

select count(*) as '총 애완동물 수' from pet; -- as!

select owner, count(*) as '총 애완동물 수' from pet group by owner; 
-- select부터 보고 group by count
select *from pet;
-- select -from -where -group by 

select owner, count(*) from pet where death is null or death = '0000-00-00' group by owner having count(*)>1; -- as!


