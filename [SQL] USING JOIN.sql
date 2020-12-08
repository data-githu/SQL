063 여러 테이블의 데이터를 조인해서 출력하기 5(USING절)
->
select e.ename, d.loc
    from emp e join dept d
    using (deptno);

문제 246. 직업이 SALESMAN인 사원들의 이름과 월급과 직업, 부서위치를 출력하는데 USING 절을 사용한 조인문법으로 수행하시오!
->
select e.ename, e.sal, e.job, d.loc
    from emp e join dept d
    using(deptno)
    where job = 'SALESMAN';