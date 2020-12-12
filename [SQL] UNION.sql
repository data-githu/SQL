
068 집합 연산자로 데이터를 위아래로 연결하기 2(UNION)
"union은 union all 과 같은 합집합 연산자인데 차이점은 union 은 order by 절을 사용하지 않아도 정렬을 암시적으로 수행합니다. 그리고 중복된 데이터를 하나로 출력합니다.

문제 257. 부서번호, 부서번호별 토탈월급을 출력하는데 맨 아래에 전체토탈월급이 출력되게 하고 부선번호를 10,20,30번 순으로 정렬해서 출력되게하시오!
->
select to_char(deptno) as deptno , sum(sal)
    from emp
    group by deptno
    union
select '토탈 :'as deptno, sum(sal)
    from emp;

설명 : union 은 암시적으로 정렬 작업을 수행하기 때문에 굳이 정렬된 결과를 볼 필요가 없다면 union all을 사용하는게 더 검색 성능에 좋습니다.

문제 259. 부서위치, 부서위치별 월급의 합을 출력하고 맨 아래에 전체토탈 월급을 출력하시오!
->
select d.loc, sum(sal)
    from emp e, dept d
    where e.deptno=d.deptno
    group by d.loc
    union all
select '전체토탈' as loc, sum(sal)
    from emp;

문제 260. 위의 결과를 다시 출력하는데 직업을 ABCD 순서대로 정렬해서 출력되게 하시오!
->
select d.loc, sum(sal)
    from emp e, dept d
    where e.deptno=d.deptno
    group by d.loc
    union
select '전체토탈' as loc, sum(sal)
    from emp;

설명 : 정렬을 할 필요가 없으면 union all을 사용하고 정렬이 필요하면 union을 사용합니다.


문제 261. 직업, 직업별 최대월급, 최소월급, 평균월급, 인원수를 출력해보시오!
->
select job, max(sal), min(sal), avg(sal), count(*)
    from emp
    group by job;

문제 262. 사원 테이블에서 최대월급, 최소월급, 평균월급, 전체인원수를 출력하시오!
->
select max(sal), min(sal), avg(sal), count(*)
    from emp;

문제 263. 문제 261번의 결과와 문제 262번의 결과를 위아래로 연결해서 출력하시오!
->
select job, max(sal), min(sal), avg(sal), count(*)
    from emp
    group by job
union all
select '전체 :',max(sal), min(sal), avg(sal), count(*)
    from emp;
