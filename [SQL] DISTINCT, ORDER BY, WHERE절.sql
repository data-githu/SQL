005 중복된 데이터를 제거해서 출력하기(DISTINCT)


"distinct 키워드를 컬럼명 앞에 작성하고 실행하면 중복된 데이터를 제거하고 출력할 수 있습니다."

예 : select job
	from emp;
	

	
예 : select distinct job
		from emp;
		


문제 12. 부서번호를 출력하는데 중복을 제거해서 출력하시오.

select distinct deptno
	from emp;




006 데이터를 정렬해서 출력하기(ORDER BY)

order by 절은 데이터를 정렬하는 절이고 select 문장에 맨 마지막에 기술합니다.

예 : select ename, sal
	from emp
	order by sal asc;
-> 정렬할 컬럼명, 정렬방법

asc : 올림차순
desc : 내림차순




문제 13. 이름과 월급을 출력하는데 월급이 높은 사원부터 출력하시오! 

-> select ename, sal
	from emp
	order by sal desc ;




문제 14. 이름 입사일을 출력하는데 최근에 입사한 사원부터 출력하시오!

-> select ename, hiredate
	from emp
	order by hiredate desc ;


	
	
(점심시간 문제)

이름과 월급과 부서번호를 출력하는데 부서번호가 10번 20번 30번 순으로 출력되게 하고 컬럼명이 한글로 이름, 월급, 부서번호로 출력되게 하시오!

-> select ename as 이름, sal as 월급, deptno as 부서번호
	from emp
	order by deptno asc;




	- order by 절에 컬럼을 여러 개를 작성할 수 있다.
	select ename, deptno, sal
		from emp
		order by deptno asc, sal desc;


	
	select ename, deptno, sal
		from emp
		order by 2 asc, 3 desc;
	-> 컬럼 순서를 써줘도 동일한 결과 값이 나온다.




문제 15. 이름과 직업과 입사일을 출력하는데 직업은 abc 순서대로 정렬하여 출력하고 직업을 순서대로 정렬한 것을 기준으로 입사일을 먼저 입사한 사원부터 출력되게 하시오. 

-> select ename, job, hiredate
	from emp
	order by 2 asc, 3 asc ;




007 WHERE절 배우기 1(숫자 데이터 검색)

"where 절을 사용하면 특정 조건에 대한 데이터만 선별해서 출력할 수 있다."

예 : select ename, sal 
	from emp
	where sal = 3000 ;
	



문제 16. 사원번호가 7788 번인 사원의 사원번호와 이름과 월급을 출력하시오!
-> select empno, ename, sal
	from emp
	where empno = 7788;




문제 17. 30번 부서번호에서 근무하는 사원들의 이름과 월급과 부서번호를 출력하시오!
-> select ename, sal, deptno
	from emp
	where deptno =30;



문제 18. 위의 결과를 월급이 높은사원부터 출력하시오!
 
-> select ename, sal, deptno
	from emp
	where deptno =30
	order by 2 desc;



※ 설명 : order by 절은 가장 마지막 줄에 작성합니다.

문제 19. 부서번호가 20번인 사원들의 이름과 입사일과 부서번호를 출력하는데 최근에 입사한 사원부터 출력하시오!

-> select ename, hiredate, deptno
	from emp
	where deptno = 20
	order by 2 desc;
	



008 WHERE절 배우기 2(문자와 날짜 검색)

where 절로 데이터를 검색할 때 숫자와는 다르게 문자는 양쪽에 싱글 쿼테이션 마크를 둘러줘야 합니다.

예 : select ename, sal
	from emp
	where ename='SCOTT';
	

※ 설명 
	- SQL은 대소문자를 구분하지 않으나 data는 대소문자를 구분한다.
	- 싱글 쿼테이션 마크 안에 있는 데이터는 문자 또는 날짜이다 라고 오라클에게 알려주는 것입니다.
	
문제 20. 직업이 SALESMAN 인 사원들의 이름과 월급과  직업을 출력하시오!
-> select ename, sal, job
	from emp
	where job = 'SALESMAN' ;




문제 21. 81년 11월 17일에 입사한 사원의 이름과 입사일을 출력하시오!

-> select ename, hiredate
	from emp
	where hiredate = '81/11/17';
	

	
※ 설명 : 날짜 검색을 할 때는 년도/월/일 순으로 검색하면 되는데 나라마다 순서가 다를 수 있습니다. 
미국이나 영국의 경우 일/월/년 순 입니다.


