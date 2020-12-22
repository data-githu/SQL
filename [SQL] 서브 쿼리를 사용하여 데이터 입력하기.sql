085 서브 쿼리를 사용하여 데이터 입력하기
우리가 지금까지 배운 insert 문장은 한번에 한건만 입력할 수 있었습니다.
insert into emp(empno, ename, sal)
values(1234,'aaa',7000)

그런데 서브쿼리를 사용한 insert 문장을 이용하면 한번에 여러건의 데이터를 입력할 수 있게 됩니다.
create table emp12_backup3
as 
select *
from emp12;

select count(*) from emp12_backup3;

truncate table emp12;

insert into emp12
select *
from emp12_backup3;

commit;

문제 314. dept 테이블을 백업하시오!
create table dept_backup
as 
select *
from dept;

문제 315. dept 테이블을 truncate 하시오!
truncate table dept;

문제 316. dept테이블을 dept_backup 테이블을 이용하여 복구하시오!
insert into dept
select *
from dept_backup;