
071 서브 쿼리 사용하기 1(단일행 서브쿼리)

예제1. 사원 테이블에서 최대월급을 받는 사원의 이름과 월급을 출력하시오!
->
select ename, max(sal)
    from emp;

설명: 위의 SQL 을 수행하려면 서브쿼리문을 사용해야 합니다.

예제2. JONES의 월급을 출력하시오!
select sal
	from emp
	where ename='JONES'; 
	
예제3. JONES의 월급보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력하시오!
->
select ename,sal
    from emp
    where sal >= 2975;


예제2번과 예제3번을 각각 수행하지말고 한번에 수행하자!

select ename,sal
    from emp
    where sal >= (select sal from emp where ename='JONES');

문제 265. SCOTT 과 같은 월급을 받는 사원들의 이름과 월급을 출력하시오!
select ename, sal
    from emp
    where sal = (select sal from emp where ename='SCOTT')
and ename != 'SCOTT';

문제266. SMITH 와 직업이 같 사원들의 이름과 직업을 출력하는데 SMITH는 제외하고 출력하시오!
select ename, job
    from emp
    where job = (select job from emp where ename ='SMITH')
and ename != 'SMITH';

문제 267. ALLEN 보다 늦게 입사한 사원들의 이름과 입사일을 출력하시오!
select ename, hiredate
    from emp
    where hiredate > (select hiredate from emp where ename = 'ALLEN')
and ename != 'ALLEN';

문제 268. 직업이 SALESMAN인 사원의 최대 월급보다 더 많이 월급을 받는 사원들의 이름과 월급을 출력하시오!
select ename, sal
    from emp
    where sal > (select max(sal) from emp where job = 'SALESMAN');

문제 269. 최대월급을 받는 사원의 이름과 월급을 출력하시오!
select ename, sal
    from emp
    where sal >= (select max(sal) from emp);

문제 270. 전공에 통계가 포함되어져있는 학생들 중에서의 최대 나이인 학생의 이름과 나이와 전공을 출력하시오!
select ename, age, major
    from emp12
    where age = (select max(age) from emp12 where major like '%통계%')
and major like '%통계%';


문제 271. KING에게 보고하는 사원들의 이름을 출력하시오!
->
select ename
    from emp
    where mgr = (select empno from emp where ename = 'KING' );
