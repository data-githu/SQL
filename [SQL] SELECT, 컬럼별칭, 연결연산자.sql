

001 테이블에서 특정 열(column) 선택하기 -> select
예 : select ename, sal 
	from emp ;
	
 select (조회하라, 선택하라 )  + column명
 from (~로 부터) + table 명

문제 3. emp 테이블의 컬럼이 무엇무엇이 있는지 확인하시오!
	describe emp;

문제 4. 이름, 월급, 커미션을 출력하시오!
	select ename, sal, comm 
		from emp ; 


문제 5. 이름, 직업, 입사일, 부서번호를 출력하시오
	select ename, job, hiredate, deptno
		from emp;

문제 6. emp 테이블의 모든 컬럼을 검색하시오.
	decribe emp;
	select empno, ename, job, mgr, hiredate, sal, comm, deptno
		from emp;


※ SQL 작성시 주의사항!

	1. SQL은 대소문자를 구분하지 않습니다.
	예 : SELECT ENAME, SAL, FROM EMP;
	     select ename, sal, from emp;
	     -> 같은 결과가 나옵니다.
	
	2. SQL은 한줄로 작성하지 말고, 절은 라인으로 분리해서 작성한다.
	SELECT절
	FROM절
	
	3. 들여쓰기를 사용해서  SQL의 가독성을 높인다. 
	select ename, sal
	  from emp ; 
	  where
	  group by
	  having
	  order by
	
※ 참고사항 (툴의 명령어)

	- 결과 화면의 가로 사이즈 조절하는 명령어
	 set lines 300 SQLPLUS 라는 툴의 명령어이고  SQL 은 아니다.
	
	- 결과 화면에서 세로 사이즈 조절하는 명령어
	 set pages 400
	
	- / 하고 엔터를 치면 방금 수행했던 SQL을 다시 실행할 수 있다. 



002 테이블에서 모든 열(COLUMN) 출력하기 -> *
	select * 
	    from emp;

※ 설명 : * 을   asterisk  라고 하고 모든 컬럼을 다 선택할 때 사용합니다.

문제 7. dept 테이블의 모든 컬럼을 출력하시오.
	select * 
		from dept;
		
※ 설명 : dept는 부서 테이블이고 컬럼은 3개가 있는데 다음과 같습니다. 

deptno : 부서번호
dname : 부서명
loc : 부서위치

003 컬럼 별칭을 사용하여 출력되는 컬럼명 변경하기 -> as
"컬럼별칭은 컬럼 대신에 다른 컬럼명을 지정할 때 사용하는 문법입니다."

예 : select ename as 이름 , sal as 월급
	from emp;

※ 컬럼명 뒤에  as 를 쓰고 컬럼별칭을 작성한다. 결과가 출력될 때 컬럼별칭이 출력됩니다.  as는 생략이 가능합니다.

문제 8. 이름과 입사일과 부서번호를 출력하는데 컬럼명이 한글로 이름, 입사일, 부서번호로 출력되게 하시오!
	select ename as 이름, hiredate as 입사일, deptno 부서번호
		from emp;
	
	
문제 9. 이름과 월급을 출력하는데 컬럼명이 아래와 같이 출력되게 하시오!
     select ename as "Employee name", sal as "Salary" 
	     from emp;

※ 설명 : 컬럼 별칭에 대소문자를 구분하고 싶다거나 공백 문자나 특수문자를 넣으려면 양쪽에 더블 쿼테이션 마크를 둘러줘야 합니다. 


004 연결 연산자 사용하기(||)

"연결 연산자는 두컬럼의 데이터를 연결해서 출력하는 연산자 입니다."

예 : select ename || sal 
	from emp;
	
예 : select ename || ' 의 월급은 ' || sal
	from emp;

ed 를 누르고 엔터를 누르면 메모장이 열리면 기존에 실행했던 부분이 불러와져서 수정하고 /를 통해 수정해서 재실행 할 수 있다.

문제 10. 아래와 같이 결과를 출력하시오!
 KING의 직업은 PRESIDENT 입니다.

select ename || '의 직업은 ' || job || ' 입니다.'
	from emp;



문제 11. 위의 결과에서 출력되는 컬럼명을 사원정보라는 한글로 출력되게 하시오!

select ename || '의 직업은 ' || job || ' 입니다.' as 사원정보
	from emp;
	



