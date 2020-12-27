097 데이터 검색 속도를 높이기(INDEX)

*오라클 데이터베이스의 객체의 종류 5가지
	1. table : 데이터를 저장하는 기본 저장소
	2. view : 데이터를 바로보는 쿼리문
	3. index : 검색 속도를 높이기 위한 db object
	4. sequence : 순서대로 번호를 생성하는 db object
	5. synonym : 테이블명에 대한 또 다른 이름
	
	SQL 튜닝을 위해 반드시 알아야 하는 db object
	-> 검색속도를 높이는 기술

설명 : 인덱스는 책으로 치면 책의 앞에 나오는 목차가 인덱스입니다.
책이 테이블이면 인덱스는 책의 목차입니다.
목차가 없는 상태에서 책의 내용중에 어떤 내용을 찾는다면 처음부터 끝까지 다 스캔해야 할 것입니다.

예제1. 이름 SCOTT 인 사원의 이름과 월급을 출력하시오!
select ename, sal
    from emp
    where ename = 'SCOTT';

설명 : ename 에 인덱스가 없기 때문에 SCOTT 을 emp 테이블에서 찾을때 처음부터 끝까지 full table scan 을 했을 것입니다.


예제2. emp 테이블에 ename 에 인덱스를 생성하시오!
create index emp_ename
	on emp(ename);
	
select ename, sal
    from emp
    where ename = 'SCOTT';


설명 : 위와 같이 인덱스를 생성하면 왜 검색이 빠른 것인가?
책으로 치면 앞에 목차가 만들어져서 입니다. 그래서 목차를 먼저 검색하고 책을 검색하면 훨씬 빠르고 원하는 데이터를 검색할 수 있기 때문입니다.

*인덱스(목차)의 구조

	소제목 + 페이지 번호

create index emp_ename
on emp(ename);

위와 같이 ename에 인덱스를 만들면 ename을 이용해서 만든 인덱스의 구조는 컬럼명 + rowid로 구성되어 있고 컬럼명은 ABCD 순서대로 정렬되어  인덱스를 구성합니다.

rowid 는 그 행을 대표하는 주소입니다.

select rowid, ename, sal
	from emp;

*emp_ename 의 인덱스의 구조를 보는 쿼리문

select ename, rowid
	from emp
	where ename > ' ';
	
select ename, rowid
	from emp;
	

문제 385. 사원 테이블에 월급에 인덱스를 거시오!
create index emp_sal
    on emp(sal);


문제 386. emp 테이블의 sal 의 인덱스인 emp_sal 의 구조를 확인하시오
select sal, rowid
	from emp
	where sal >= 0;
    