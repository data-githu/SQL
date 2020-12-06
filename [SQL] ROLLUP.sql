052 데이터 분석 함수로 집계 결과 출력하기 1(ROLLUP)

"집계한 결과를 맨 아래쪽에 출력하고 싶을 때 사용하는 함수"

예제 : 부서번호, 부서번호별 토탈월급을 출력하시오!
->
select deptno, sum(sal)
    from emp
    group by deptno;

예제 : 직업, 직업별 토탈월급을 출력하시오!
->
select job, sum(sal)
    from emp
    group by job;

예제 : 직업, 직업별 토탈월급을 출력하시오! 가장 아래 토탈월급의 합계를 출력하시오!
->
select job, sum(sal)
    from emp
    group by rollup(job);