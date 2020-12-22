087 서브 쿼리를 사용하여 데이터 삭제하기
예제 : SCOTT 보다 월급을 많이 받는 사원들을 삭제하시오!

delete from emp
where sal > (select sal from emp where ename = 'SCOTT');
rollback;

문제 321. ALLEN 보다 늦게 입사한 사원들을 삭제하시오!
delete from emp
where hiredate > (select hiredate from emp where ename = 'ALLEN');

문제 322. JONES 와 같은 부서번호에서 일하는 사원들을 삭제하시오!
그런데 JONES는 제외하시오!
delete from emp
where deptno = (select deptno from emp where ename = 'JONES') and ename != 'JONES';

