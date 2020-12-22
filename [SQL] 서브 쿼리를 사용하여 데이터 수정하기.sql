086 서브 쿼리를 사용하여 데이터 수정하기
update emp
set sal = 8900
where ename = 'SCOTT'

모든 절에서 서브쿼리 사용 가능합니다.

예제1. SCOTT 보다 더 많은 월급을 받는 사원들의 직업을 SALESMAN 으로 변경하시오!
update emp
set job = 'SALESMAN'
where sal > (select sal from emp where ename = 'SCOTT');

문제 317. ALLEN 보다 더 늦게 입사한 사원들의 커미션을 9000으로 수정하시오!
update emp
set comm = 9000
where hiredate > (select hiredate from emp where ename = 'ALLEN');

select ename, comm, hiredate from emp;

문제 318. SMITH 와 같은 직업을 갖는 사원들의 월급을 9800으로 변경하시오! (SMITH는 제외하시오!)
update emp
set sal = 9800
where job = (select job from emp where ename = 'SMITH') and ename != 'SMITH';

select ename, job, sal from emp;

문제 319. ALLEN의 월급을 KING의 월급으로 변경하시오!
update emp
set sal = (select sal from emp where ename = 'KING')
where ename = 'ALLEN';

문제 320. JONES 보다 월급이 많은 사원들의 직업을 MARTIN의 직업으로 변경하시오!
update emp
set job = (select job from emp where ename = 'MARTIN')
where sal > (select sal from emp where ename = 'JONES');

select ename, sal, job  from emp;
