
076 서브 쿼리 사용하기 6(FROM절의 서브 쿼리)
"from 절에도 서브쿼리를 사용할 수 있습니다. from 절의 서브쿼리는 in line view 라고 합니다."

예제 : 이름, 월급, 순위를 출력하는데 순위가 월급이 높은 사원순으로 순위를 부여하시오!
select ename, sal, rank () over (order by sal desc) 순위
    from emp;


예제 : 위의 결과에서 순위가 4등인 사원만 출력하시오!
select ename, sal, rank () over (order by sal desc) 순위
    where 순위 = 4
    from emp;
-> 에러발생

설명 : 위의 SQL은 에러 발생합니다. 왜냐하면 실행순서 때문입니다. from 절을 실행하고 where 절을 실행하기 때문에 emp 테이블에는 순위라는 컬럼이 없기 때문에 에러가 납니다.

순위가 4등인 사원의 이름과 월급과 순위를 출력하려면 from 절의 서브쿼리를 사용해야합니다.

select * 
    from (select ename, sal, dense_rank() over (order by sal desc) 순위
            from emp );


select * 
    from (select ename, sal, dense_rank() over (order by sal desc) 순위
            from emp )
    where 순위 = 4;

설명 : from 절의 서브쿼리문의 결과가 마치 하나의 테이블처럼 만들어져서 서브쿼리문의 결과 데이터가 메모리에 올라가게 됩니다. 메모리에 올려놓은 데이터 중에 순위가 4등인 데이터를 가져온다.

문제 284. 직업, 이름, 월급, 순위를 출력하는데 순위가 직업별로 각각 월급이 높은 순서대로 순위를 부여하시오!
select  job, ename, sal, dense_rank () over (partition by job order by sal desc) 순위
        from emp;

문제 285. 위의 결과에서 순위가 1등인 사원들만 출력하시오!
select *
    from (select job, ename, sal, dense_rank() over (partition by job order by sal desc) 순위
        from emp )
    where 순위 = 1 ;

문제 286. 우리반 테이블에서 통신사별로 나이가 가장 많은 학생의 이름과 나이와 통신사와 나이의 순위를 출력하시오!
select *
    from (select ename,age, telecom, dense_rank() over (partition by telecom order by age desc) 순위
        from emp12)
    where 순위 = 1;

문제 288. 서울시에서 가장 비싼 식료품의 이름과 가격과 파는 곳을 출력하시오!
select *
    from (select A_NAME, A_PRICE, M_NAME, dense_rank() over (order by A_PRICE desc) 순위
            from price)
    where 순위 = 1;