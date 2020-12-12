
072 서브 쿼리 사용하기 2(다중 행 서브쿼리)

*서브쿼리의 종류 3가지 : 
		1. 단일행 서브 쿼리 : 서브쿼리에서 메인쿼리로 하나의 값이 리턴되는 경우
		2. 다중행 서브 쿼리 : 서브쿼리에서 메인쿼리로 여러개의 값이 리턴되는 경우
	    3. 다중 컬럼 서브 쿼리 : 서브쿼리에서 메인쿼리로 여러개의 컬럼값이 리턴되는 경우
				
예 : 직업이 SALESMAN 인 사원들의 월급이 같은 사원들의 이름과 월급을 출력하시오!
select ename, sal
    from emp
    where sal in (select sal from emp where job = 'SALESMAN' );

문제 272. 통신사가 sk인 학생들과 나이가 같은 학생들의 이름과 나이와 통신사를 출력하시오!
select ename, age, telecom
    from emp12
    where age in (select age from emp12 where telecom='sk' );