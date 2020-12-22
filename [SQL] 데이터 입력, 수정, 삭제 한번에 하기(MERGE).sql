082 데이터 입력, 수정, 삭제 한번에 하기(MERGE)
"데이터 입력과 수정과 삭제를 한번에 수행하는 명령어 이고 SQL 튜닝을 위해서 자주 사용되는 SQL"

예제1 : 이름과 부서위치를 출력하시오 
select e.ename, d.loc
    from emp e, dept d
    where e.deptno = d.deptno;

예제2 : 사원테이블에 부서위치 컬럼을 추가하시오
alter table emp
add loc varchar2(10);

select ename, loc from emp;
	
예제3: 사원 테이블에 추가한 부서위치 컬럼에 데이터를 해당 사원의 부서위치로 값을 갱신하시오!
merge into emp e
using dept d
on (e.deptno = d.deptno)
when matched then
update set e.loc=d.loc;

select ename, loc from emp;

설명 : merge into 다음에는 변경할 타깃 테이블명을 작성하고 
	 using 다음에는 소스 테이블명을 작성한다.
	 on 다음에는 타깃과 소스 테이블간의 연결고리를 작성한다.
	 when matched then 다음에 변경할 update 문을 작성한다.
	
문제 307. 우리반 테이블에 telecom_price 컬럼을 추가하고 해당 텔레콤의 요금으로 값을 갱신하시오!
alter table emp12
add telecom_price number(10);

merge into emp12 e
using telecom_price t
on (t.telecom = e.telecom)
when matched then
update set e.telecom_price = t.price;

문제 308. 부서위치, 부서위치별 토탈월급을 출력하시오!
select loc, sum(sal)
    from emp
    group by loc;

문제 309. 부서번호, 부서번호별 토탈월급을 출력하시오!
select deptno, sum(sal)
    from emp
    group by deptno;

문제 310. 사원 테이블과 급여 등급테이블을 조인해서 이름과 월급과 등급을 출력하시오!
select e.ename, e.sal, s.grade
    from emp e, salgrade s
    where e.sal between s.losal and s.hisal;

문제 311. 사원 테이블에 급여등급 컬럼을 추가하시오!
alter table emp
add grade number(10);

문제 312. 사원테이블에 추가한 grade 컬럼에 해당사원의 급여등급으로 값을 갱신하시오!
merge into emp e
using salgrade s
on (e.sal between s.losal and s.hisal)
when matched then
update set e.grade = s.grade;

문제 313. 부서명 컬럼을 emp 테이블에 추가하고 해당 사원의 부서명으로 emp 테이블의 dname을 갱신하시오!
alter table emp
add dname varchar2(10);

merge into emp e
using dept d
on (e.deptno = d.deptno)
when matched then
update set e.dname = d.dname;

select ename, dname from emp;