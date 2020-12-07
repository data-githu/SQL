058 여러 테이블의 데이터를 조인해서 출력하기 1(EQUI JOIN)
	" 조인을 이용하면 두개 이상의 테이블들의 컬럼들을 하나의 결과로 모아서 볼 수 가 있습니다."
	
예제 : select * from dept;

Deptno : 부서번호
Dname : 부서명
Loc : 부서위치

예제 : 이름, 부서위치를 출력하시오!
select ename, loc
    from emp, dept;

설명 : 14건 * 4건 = 56건 이 되어서 다 조인한 결과입니다.

->
select ename, loc
    from emp, dept
    where emp.deptno = dept.deptno;

문제 210. 직업이 SALESMAN인 사원들의 이름과 월급과 직업과 부서위치를 출력하시오!
->
select ename, sal, job, loc
    from emp, dept
    where emp.deptno = dept.deptno and job = 'SALESMAN';

문제 211. 월급이 2000이상인 사원들의 이름 월급과 부서위치를 출력하시오!
->
select ename, sal, loc
    from emp, dept
    where emp.deptno = dept.deptno and sal >= 2000;

문제 212. 위의 결과에서 이름, 월급, 부서위치 옆에 부서번호도 같이 출력하시오!
->
select ename, sal, loc,emp.deptno
    from emp, dept
    where emp.deptno = dept.deptno and sal >= 2000;

설명 : emp.deptno 라고 작성함으로써 emp 테이블에 있는 부서번호를 가져오라고 작성해주어야 합니다.
에러가 나지 않는다고 컬럼명 앞에 테이블명을 적지 않는 습관을 버리고 무조건 조인문장에서는 컬럼명 앞에 테이블명을 적어줍니다. 테이블명.컬럼명 으로 작성해줘야 검색속도가 더 빨라집니다.

Select e.ename, e.sal, d.loc, e.deptno
	From emp e, dept d
	Where e.deptno = d.deptno and e.sal >= 2000;
	
설명 : emp는 e라고 하고 dept는 d라고 별칭을 주어서 별칭을 사용해서 코딩을 하면 좀 더 간결하게 조인문장을 작성할 수 있습니다.

문제 213. 월급이 1000에서 3000 사이인 사원들의 이름과 월급과 부서위치를 출력하시오!
->
select emp.ename, emp.sal, dept.loc
    from emp, dept
    where emp.deptno = dept.deptno and emp.sal between 1000 and 3000;

문제 214. 사원번호가 7788, 7902, 7369 번인 사원의 사원번호와 이름과 월급과 부서위치를 출력하시오!
->
select emp.empno, emp.ename, emp.sal, dept.loc
    from emp, dept
    where emp.deptno = dept.deptno and emp.empno in (7788,7902,7369);

문제 215. 이름의 첫번째 철자가 S로 시작하는 사원의 이름과 월급과 부서위치를 출력하시오!

->
select e.ename, e.sal, d.loc
    from emp e, dept d
    where e.deptno = d.deptno and lower(substr(e.ename, 1, 1)) = 's';
							-> e.ename like 'S%'

설명 : 두개 이상의 테이블을 조인하기 위해서는 반드시 조인조건을 where 절에 기술해야합니다.

문제 216. DALLAS에서 근무하는 사원들의 이름과 직업과 부서위치를 출력하시오!
->
select e.ename, e.job, d.loc
    from emp e, dept d
    where e.deptno = d.deptno and d.loc = 'DALLAS';

문제 217. 부서위치, 부서위치 별 토탈월급을 출력하시오!
->
select d.loc, sum(e.sal)
    from emp e, dept d
    where e.deptno = d.deptno
    group by d.loc;

문제 218. 부서위치, 부서위치별 평균월급을 출력하는데 소수점 이하는 안나오게 반올림을 하고 부서위치별 평균월급이 높은것부터 출력하고 부서위치별 평균월급이 출력될때 천단위를 부여하시오!

->
select d.loc, to_char(round(avg(e.sal)),'999,999')
    from emp e, dept d
    where e.deptno = d.deptno
    group by d.loc
    order by to_char(round(avg(e.sal)),'999,999') desc;


