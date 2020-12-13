077 서브 쿼리 사용하기 7(SELECT절의 서브 쿼리)

"select 절에 서브쿼리를 사용할 수 있는데 select 절의 서브쿼리를 scalar subquery 라고 합니다."

예제 : 이름, 월급, 사원테이블의 평균월급을 출력하시오!
select ename, sal, avg(sal)
    from emp;
-> 에러발생

select ename, sal, (select avg(sal) from emp)
    from emp;

문제 289. 사원이름, 월급, 사원 테이블의 최대월급, 사원테이블의 최소월급을 출력하시오!
select ename, sal, (select max(sal) from emp) as 최대월급, (select min(sal) from emp) as 최소월급
    from emp;

중요설명 : select 절의 서브쿼리인 스칼라 서브쿼리의 특징?
스칼라 서브쿼리는 단 한개값 만 리턴할 수 있다.

문제 290. 이름, 나이, 우리반 나이의 평균나이를 출력하시오!
select ename, age, (select avg(age) from emp12) as 평균나이
    from emp12;


문제291. 위의 결과가 소수점 이하가 안나오도록 반올림 하시오!
select ename, age, (select round(avg(age))from emp12) as 평균나이
    from emp12;

문제 292. (난이도 상) 위의 결과에서 학생의 나이가 평균나이보다 더 큰 학생들의 이름과 나이와 평균나이를 출력하시오!
select *
    from ( select ename, age, (select round(avg(age)) from emp12) 평균나이
            from emp12)
    where age > 평균나이 ;


문제 293. 사원테이블에서 이름, 월급, 사원테이블의 최대월급, 사원테이블의 최소월급, 사원테이블의 평균월급을 출력하시오!

튜닝전
 select ename, sal, (select max(sal) from emp), (select min(sal) from emp), (select avg(sal) from emp)
    from emp;  

튜닝후 
select ename, sal, max(sal) over () 최대월급, 
                            min(sal) over () 최소월급,
                             avg(sal) over () 평균월급
from emp;


문제 294. 우리반 테이블에서 이름, 나이, 우리반 나이의 최대나이, 우리반 나이의 최소나이, 우리반 나이의 평균나이, 우리반 학생들의 인원수를 출력하시오!
select ename, age, max(age) over () 최대나이,
                    min(age) over () 최소나이,
                    avg(age) over () 평균나이,
                    count(*) over () 인원수
from emp12;

설명 : select 절의 서브쿼리인 스칼라 서브쿼리가 성능이 느리므로 위와 같이 데이터 분석함수를 이용해서 튜닝을 하면 빠르게 대용량 데이터의 데이터를 검색할 수 있습니다.
