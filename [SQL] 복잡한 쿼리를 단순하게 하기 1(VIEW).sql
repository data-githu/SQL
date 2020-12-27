095 복잡한 쿼리를 단순하게 하기 1(VIEW)
"테이블은 아니고 데이터를 바라보는 쿼리문을 테이블 처럼 하나의 object (객체) 로 생성한 것을 말합니다. "

예 : create table emp708
	as
	select empno, ename, sal, deptno
	from emp;

설명 : as 다음에 나오는 쿼리문의 결과대로 emp708 테이블이 생성된다.

select * from emp708;
	
emp 테이블과는 별개의 또 다른 테이블이다.

*emp로 시작하는 내가 만든 테이블이 뭐가 있는 지 확인하는 방법

select table_name
	from user_tables
	where table_name like 'EMP%';


문제 369. DALLAS 에서 근무하는 사원들의 이름과 부서위치를 출력하시오! (조인)
select e.ename, d.loc
    from emp e, dept d
    where e.deptno = d.deptno and d.loc = 'DALLAS';

문제 370. 위의 결과 데이터를 담는 테이블 emp710을 생성하시오!
create table emp710
	as
select e.ename, d.loc
    from emp e, dept d
    where e.deptno = d.deptno and d.loc = 'DALLAS';

문제 371. 숫자 1번부터 10번까지의 숫자를 담는 테이블을 emp 705로 생성하시오
create table emp705
    as
select level as num1
    from dual
    connect by level <= 10;

설명 : 위의 level은 SQL문과 같은 예약어여서 예약어를 테이블의 컬럼명으로 생성할 수 없다.


문제 372. emp705의 숫자 데이터 중에 임의로 아무거나 하나를 지우시오!
delete from emp705
    where num1=4;


문제 373. 1부터 10사이의 숫자중 하나가 없다. 그 수는?
select sum2-sum1 as 빠진 값
    from (select sum(num1) as sum1 from emp705) a,
            (select sum(level) as sum2 from dual connect by level <=10) b;


*view 생성
create view emp801
as
select empno, ename, sal, deptno
	from emp;

설명 : view는 table과 다르게 별도로 데이터를 저장하고 있지 않다.
그냥 바라보고 있는다.

"view를 업데이트 하면 실제 테이블도 업데이트 됩니다. "

회사의 데이터 중에 공개하면 안되는 데이터가 있다. ex) 민감한 데이터

라이나생명 데이터 분석을 하러 갔는데 라이나 생명에서 일하는 직원들의 데이터가 있는데 직원 데이터 중에 월급은 라이나 생에서 공개하지 고 나머지 데이터만 공개를 하고 얼마든지 조회하고 업데이트 가능하게 하고 싶다면 어떻게 데이터 분석가에게 데이터를 줘야하는가?

답 : 월급만 빼고 view 로 생성해주면 된다.

create view emp809
as
select empno, ename, job, hiredate, mgr, deptno
	from emp;
	
select * from emp809;

문제 374. 직업, 직업별 토탈월급을 출력하시오!
select job, sum(sal)
from emp
group by job;

문제 375. 위의 결과를 출력하는 emp403 view를 생성하시오!
create view emp403
as
select job, sum(sal) as 토탈
from emp
group by job;

설명 : view를 생성할 때 그룹함수를 사용하게 되면 컬럼별칭을 줘야합니다.

문제 376. 부서번호, 부서번호별 평균월급을 출력하는 view를 deptno_avg라는 이름으로 생성하시오!

create view deptno_avg
as
select deptno, avg(sal) as 평균월급
from emp
group by deptno;

문제 377. emp 와 지금 만든 deptno_avg view 와 조인해서 이름, 월급, 부서번호, 부서평균 월급을 출력하시오!
select e.ename, e.sal, e.deptno, d.평균월급
    from emp e, deptno_avg d
    where e.deptno = d.deptno;

문제 378. 이름, 월급, 부서번호, 부서평균을 출력하는데 월급이 부서평균보다 더 큰 사원들만 출력하시오!

select e.ename, e.sal, e.deptno, d.평균월급
	from emp e, deptno_avg d
	where e.deptbo = d.deptno and e.sal > d.평균월급;
	
문제 379. emp 테이블에서 퇴사할 것 같은 사원들을 예측하기 위해 자기의 월급이 자기가 속한 직업의 평균월급보다 더 작은 사원들의 이름과 월급과 직업과 직업평균을 출력하시오!

create view job_avg
as
select job, avg(sal) as 평균월급
from emp
group by job;


select e.ename, e.sal, e.job, j.평균월급
	from emp e, job_avg j
	where e.job = j.job and e.sal > j.평균월급;


문제 380. 직업, 이름, 월급, 순위를 출력하는데 순위가 직업별로 각각 월급이 높은 순서대로 순위를 부여하시오!

select job, ename, sal, ㅗartition by job order by sal desc) 순위
	from emp
	
문제 381. 위의 쿼리의 결과를 view로 만들고 view를 쿼리해서 순위가 1등인 사원들만 출력하시오!
create view job_avg
as
select job, avg(sal) as 평균월급
from emp
group by job;

select *
    from rank_sal
    where 순위 = 1;
