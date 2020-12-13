
075 서브 쿼리 사용하기 5(HAVING절의 서브 쿼리)

*select 문장에서 서브쿼리를 쓸 수 있는 절
select -> scalar subquery
from -> in line view
where
group by
having
order by -> scalar subquery

문제 280. JAMES 보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력하시오!
select ename, sal
    from emp 
    where sal > (select sal from emp where ename = 'JAMES');

문제 281. 직업, 직업별 토탈월급을 출력하시오!
select job, sum(sal)
    from emp
    group by job;

문제282. 위의 결과를 다시 출력하는데 직업이 SALESMAN의 토탈월급보다 더 큰 직업들만 출력하시오!

select job, sum(sal)
    from emp
    where sum(sal) > (select sum(sal) from emp where job = 'SALESMAN')
    group by job;
   -> 에러 발생

select job, sum(sal)
    from emp
    group by job
    having sum(sal) > (select sum(sal) from emp where job = 'SALESMAN');
    
설명 : 그룹함수로 조건을 주는 절은 having 절 입니다.
	where 절에 작성하면 에러가 발생합니다.

문제 283. 부서번호와 부서번호별 인원수를 출력하는데 10번 부서번호의 인원수보다 더 큰것만 출력하시오!
select deptno, count(*)
    from emp
    group by deptno
    having count(*) > (select count(*) from emp where deptno = 10);