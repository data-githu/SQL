
함수의 종류 : 
    1. 단일의 함수
	2. 복수행 함수 : max, min, avg, sum, count

036 최대값 출력하기(MAX)

예제 : 최대월급을 출력하시오!
-> select max(sal)
	from emp;

문제 112. 직업이 SALESMAN인 사원들의 최대월급을 구하시오!
-> select max(sal)
    from emp
    where job = 'SALESMAN';

037 최소값 출력하기(MIN)

문제 113. 우리반에서 최소 나이인 학생의 나이를 출력하시오!
-> select min(age)
    from emp12;

문제 114. 통신사가 sk인 학생들 중에서 최대 나이인 학생의 나이를 출력하시오!
-> select max(age)
     from emp12
     where upper(telecom) = 'SK'; 

-> select max(age)
	from emp12
	where lower(telecom) in ('sk','skt');
	
문제 115.  부서번호 30의 최대월급을 출력하시오
-> select max(sal)
    from emp
    where deptno = 30;


-> select deptno, max(sal)
		↓           ↓
		여러개, 한개만 출력하려고 해서 에러발생
    from emp
    where deptno = 30;


-> select deptno, max(sal)
    from emp
    where deptno = 30
    group by deptno;

설명 : group by deptno 를 하면 여러 개 나오려는  deptno 를 grouping 해준다.

문제 116. (오늘의 마지막 문제) 직업, 직업별 최대월급을 출력하는데 직업이  SALESMAN만 출력하시오!

->select job, max(sal)
    from emp
    where job = 'SALESMAN'
    group by job;

