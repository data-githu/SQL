094 임시 테이블 생성하기(CREATE TEMPORAY TABLE)
"데이터를 영구히 database 에 저장하지 않고 임시로 저장하는 테이블"

데이터 중에서 영구히 저장할 필요는 없고 지금 잠깐 테스트를 위해서 볼 데이터라던지 아니면 지금 현재만 필요하고 나중에는 필요하지 않은 데이터가 있는데 그 데이터를 잠깐 저장할 때 사용하는 테이블이 임시 테이블입니다.

*임시테이블의 종류 2가지
	1. on commit delete rows 옵션 : 데이터를 commit 할 때 까지만 보관
	2. on commit preserve rows 옵션 : 데이터를 접속한 유저가 로그아웃 할 때 까지만 보관

예제1 : 
create global temporary table emp700
	(empno number(10),
	ename varchar2(10),
	sal number(10) )
	on commit delete rows;
	
insert into emp700
select empno, ename, sal
from emp;
	
select * from emp700;
commit;

select * from emp700;


예제2 : 
create global temporary table emp800
	(empno number(10),
	ename varchar2(10),
	sal number(10) )
	on commit preserve rows;
	
	insert into emp800
	select empno, ename, sal
	from emp;
	
select * from emp800;
commit;

select * from emp800;


예제3 : 

create global temporary table num1_9
(num1 number(10))
on commit preserve rows;

insert into num1_9
select level 
from dual
connect by level <=9;


create global temporary table num2_9
(num2 number(10))
on commit preserve rows;

insert into num2_9
select level 
from dual
connect by level <=9;

select num1|| 'x'|| num2|| '='|| num2*num1
    from num1_9, num2_9;
