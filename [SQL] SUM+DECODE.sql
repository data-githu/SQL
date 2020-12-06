047 COLUMN을 ROW로 출력하기 1(SUM+DECODE)

예제1 : 부서번호, 부서번호별 토탈월급을 출력하시오!
->
select deptno, sum(sal)
    from emp
    group by deptno;

예제2 : 부서번호, 부서번호가 10이면 월급 아니면 0이 출력되게 하시오!
->
select deptno, decode( deptno,10,sal,0)
from emp;

예제3: 위의 결과에서 부서번호 컬럼은 안나오게 하시오!
->
select decode( deptno,10,sal,0)
from emp;

예제4 : 위에서 출력된 14개의 데이터를 다 sum 하시오!
-> 
select sum(decode( deptno,10,sal,0))
    from emp;
    
예제5 : 위의 값을 출력하는데 해당 컬럼명을 10으로 출력되게 하시오.
->
select sum(decode( deptno,10,sal,0)) as "10"
    from emp;
    
예제6 : 그러면 아래와 같이 20번과 30번도 그 옆에 출력되게 하시오!
 ->
select sum(decode( deptno,10,sal,0)) as "10",
        sum(decode( deptno,20,sal,0)) as "20",
        sum(decode( deptno,30,sal,0)) as "30"
        from emp;

문제 174. 통신사, 통신사별 토탈나이를 출력하시오! (세로출력)
->
select telecom, sum(age)
    from emp12
    group by telecom;


문제 175. 통신사, 통신사별 토탈나이를 출력하시오! (가로출력)
-> select sum(decode( telecom,'sk',age)) as "sk",
        sum(decode( telecom,'kt',age)) as "kt",
        sum(decode( telecom,'lg',age)) as "lg"
        from emp12; 

문제176. 아래의 SQL 두개는 결과가 같을까? YES

select sum(comm) from emp;

select sum(nvl(comm,0) from emp;

 설명 : 위의 SQL이 더 성능이 좋다. 왜냐하면 null 값은 sum 연산에 포함되지 않았기 때문이다.

문제 177. 아래의 SQL 을 튜닝하시오
튜닝전
 select sum(decode( telecom,'sk',age,0)) as "sk",
            sum(decode( telecom,'kt',age,0)) as "kt",
            sum(decode( telecom,'lg',age,0)) as "lg"
            from emp12; 

튜닝후
 select sum(decode( telecom,'sk',age)) as "sk",
        sum(decode( telecom,'kt',age)) as "kt",
        sum(decode( telecom,'lg',age)) as "lg"
        from emp12; 

문제 178. 직업, 직업별 토탈월급을 출력하시오! (세로로 출력)
->
select job, sum(sal)
    from emp
    group by job;

문제 179. 직업, 직업별 토탈월급을 출력하시오! (가로로 출력)
->
 select sum(decode(job, 'ANALYST', sal, null)) as "ANALYST",
        sum(decode(job, 'CLERK', sal, null)) as "CLERK",
        sum(decode(job, 'MANAGER', sal, null)) as "MANAGER",
        sum(decode(job, 'PRESIDENT', sal, null)) as "PRESIDENT",
        sum(decode(job, 'SALESMAN', sal, null)) as "SALESMAN"
        from emp;