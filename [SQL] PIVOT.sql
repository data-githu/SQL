048 COLUMN을 ROW로 출력하기 2(PIVOT)

세로를 가로로 출력하는 함수

예 : select *
	from (select  deptno, sal from emp) <- 사원테이블에서 부서번호와 월급만 가져온다. emp 테이블명만 딱 쓸 수 없다. 결과를 보기 위해서 필요한 컬럼만 선별해서 가져와야 됩니다. emp 테이블명만 쓰면 에러가 납니다. 
	아래의 결과를 보기 위해서 직업이 필요하지도 않고 입사일이 필요하지도 않습니다. 그냥 부서번호와 월급만 있으면 됩니다.
	
	pivot ( sum(sal) for deptno in (10, 20, 30));
	토탈월급을 출력하겠다. 어떤 토탈월급? 부서번호를 위한 어떤 부서번호? 10번, 20번, 30번의 부서번호
	

문제 180. 통신사, 통신사별 토탈나이를 가로로 출력하시오!
->
select * 
    from (select telecom, age from emp12)
    pivot ( sum(age) for telecom in ('sk'as "sk" ,'kt' as "kt" ,'lg' as "lg"));

문제 181. 위의 결과를 토탈나이가 아니라 평균나이로 나오게 하시오!
->
select * 
    from (select telecom, age from emp12)
    pivot (avg(age) for telecom in ('sk'as "sk" ,'kt' as "kt" ,'lg' as "lg"));
