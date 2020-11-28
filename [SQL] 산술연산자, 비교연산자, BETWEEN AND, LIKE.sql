
009 산술 연산자 배우기(*, /, +, -)
예 : select ename, sal, sal +3000
	from emp;


문제 22. 이름과 연봉(sal*12) 을 출력하는데 컬럼명을 한글로 이름, 연봉으로 출력하시오!

->  select ename as 이름,  sal*12 as 연봉
	from emp;
	



문제 23. 위의 결과를 다시 출력하는데 연봉이 36000 인 사원들의 이름과 연봉을 출력하시오!

->  select ename as 이름, sal*12 as 연봉
	from emp
	where sal*12 =36000 ;
	


->  select ename as 이름, sal*12 as 연봉
	from emp
	where 연봉 =36000 ;
: 실행되지 않는다.


※ 설명 : 위의 SQL이 수행되지 않는 이유는 실행 순서 때문입니다.
코딩순서 : select -> from -> where
실행순서 : from -> where -> select

문제24. 이름과 연봉을 출력하는데 연봉이 높은 사원부터 출력하시오!
-> select ename as 이름, sal*12 as 연봉
	from emp
	order by 연봉 desc;


코딩순서 : select -> from -> order by
실행순서 : from  -> select -> order by
	
문제 25. 아래의 SQL 에서 더하기가 먼저 실행되게 하시오!

-> select ename, (sal+200) * 2
	from emp;


010 비교 연산자 배우기 1(〉, 〈, 〉=,〈=, =, !=,〈〉, ^= : 같지 않다.)

문제 26. 커미션이 150 이상인 사원들의 이름과 커미션을 출력하시오!
-> select ename, comm
	from emp
	where comm >=150;


문제 27. 월급이 3000 이상인 사원들의 이름과 월급을 출력하시오!
->  select ename, sal
	from emp
	where sal >= 3000 ;
	



문제 28. 직업이 SALESMAN  이 아닌 사원들의 이름과 직업을 출력하시오!
-> select ename, job
	from emp
	where job != 'SALESMAN';



※ 설명 : 문자와 날짜는 반드시 양쪽에 싱글 쿼테이션 마크를 둘러줘야 합니다.

더블 쿼테이션 마크는 오라클 전체를 통틀어서 딱 하나의 케이스에서만 사용합니다. 컬럼별칭 사용할 때 공백문자, 특수문자, 대소문자를 구분해서 컬럼별칭을 출력하고자 할때만 사용합니다. 나머지 케이스는 다 싱글입니다.

문제 29. 월급이 2400 이하인 사원들의 이름과 월급을 출력하는데 월급이 높은 사원부터 출력하시오!
->  select ename, sal
	from emp
	where sal >=2400 
	order by sal desc;



011 비교 연산자 배우기 2(BETWEEN AND)

문제 30. 월급이 1000에서 3000 사이인 사원들의 이름과 월급을 출력하시오!

-> select ename, sal
	from emp
	where sal between 1000 and 3000 ;  
	
	또는  where sal >= 1000 and sal <=3000 ; 


문제 31. 월급이 1000 에서 3000 사이가 아닌 사원들의 이름과 월급을 출력하시오!
-> select ename, sal
	from emp
	where sal not between 1000 and 3000 ;


	
문제 32. 1981년도에 입사한 사원들의 이름과 입사일을 출력하시오!
-> select ename, hiredate
	from emp
	where hiredate between '81/01/01' and '81/12/31' ;
	



012 비교 연산자 배우기 3(LIKE)

예제 : 이름의 첫글자가 S 로 시작하는 사원들의 이름을 출력하시오!
select ename
	from emp
	where ename like 'S%' ; 
	


※ 설명 : like 는 ~ 일 것 같은 이라는 영어 뜻처럼 영어의 첫번째 철자가 S로 시작할 것 같은과 같은 것이다. %는 와일드 카드로  이 자리에 뭐가 와도 관계없다. 그 철자의 갯수가 몇개가 되어도 관계없다.

문제 33. 이름의 끝 글자가 T로 끝나는 사원들의 이름을 출력하시오!
-> select ename
	from emp
	where ename like '%T' ;

	
문제 34. 81년도에 입사한 사원들의 이름과 입사일을 출력하는데 between and 사용하지 말고 like 사용해서 출력하시오!
-> select ename, hiredate
	from emp
	where hiredate like '81%' ; 
	




문제 35. 이름의 두번째 철자가 M인 사원들의 이름을 출력하시오!
-> select ename
	from emp
	where ename like '_M%' ;



※ 설명 : like 와 같이 쓸 수 있는 키워드 2가지
	1. % : 와일드 카드 -> 이 자리에 뭐가 와도 관계없고  그 갯수가 몇 개가 되던 상관없다.
	2. _ : 언더바 -> 이 자리에 뭐가 와도 관계없지만 그 자릿수는 1개여야 합니다. 

문제 36. 이름의 세번째 철자가 A인 사원들의 이름을 출력하시오!
-> select ename
	from emp
	where ename like '__A%' ;


*sql  developer 설치
이 툴은 도스창을 이용하지 않고 오라클에 접속해서 메모장 같은 화면에서 편하게 sql 을 작성할 수 있게 하는 툴  

oracle에 접속하기 위해서는 접속 정보를 알아야 합니다.

	1. 데이터 베이스 서버의 아이피 주소 (건물주소) = 127.0.0.1
	2. 포트번호 (건물내의 통로번호) = 1521
	3. 오라클 인스턴스 이름 (SID) (건물내에 특정 회사 이름) = orcl

위의 정보를 알아내는 명령어 
각 건물에 있는 경비원 아저씨에게 물어보면 된다. 
-> 도스창을 열고  lsnrctl status 라고 하고 엔터를 칩니다.
