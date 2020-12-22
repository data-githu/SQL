016 대소문자 변환 함수 배우기(UPPER, LOWER, INITCAP)

함수란? 어떤 특정 기능을 구현해 놓은 코드의 집합

입력값 -> 함수 -> 출력값

함수를 사용하는 이유는? 함수를 이용하면 좀 더 복잡한 데이터를 검색할 수 있다.

예 : 영화 겨울왕국에는 elsa 가 많이 나올까 anna가 많이 나올까?
	우리반 학생들이 제일 많이 쓰는 통신사가 어디인가?

함수의 종류 2가지?
	1. 단일행 함수 : 
	- 문자 : upper(대문자로 출력), lower(소문자로 출력), initcap(첫번째 철자는 대문자로 출력하고 나머지는 다 소문자로 출력하는 함수)
	- 숫자
	- 날짜
	- 변환
	- 일반
	2. 복수행 함수 : max, min, avg, sum, count, var, stddev

예제 : select upper(ename), lower(ename), initcap(ename) 
		from emp;
		
문제 63. 우리반 테이블에서 통신사가 sk와 관련된 통신사이면 그 학생의 이름과 통신사를 출력하시오!
-> select ename, telecom
	from emp12
	where upper(telecom) like '%SK%';



017 문자에서 특정 철자 추출하기(SUBSTR)

예제 : select ename, substr (ename, 1, 2)
		from emp12;
		
문제 64. 성씨가 김, 이, 유씨인 학생들의 이름과 나이를 출력하시오. (like 사용금지)
-> select ename, age
	from emp12
	where substr(ename,1,1) in ('김', '이', '유');
	
예제 : select ename, substr(ename,1,1)
		from emp12;

예제 : 성씨가 이씨인 학생들의 이름을 출력하시오
-> select ename
	from emp12
	where substr(ename,1,1) = '이';


018 문자열의 길이를 출력하기(LENGTH)


철자의 길이를 출력하는 함수

select ename, length(ename)
	from emp;
	
	
문제 65. 우리반 테이블에서 이메일을 출력하는데 이메일 철자의 길이를 출력하는데 이메일 철자의 길이가 가장 긴것부터 출력하시오!

->select ename, email, length(email)
	from emp12
	order by length(email) desc;
	
문제 66. emp 테이블에서 ename을 출력하고 그 옆에 ename의 첫번째 철자를 출력하시오!
-> select ename, substr(ename,1,1)
	from emp; 
	
문제 67. 위의 결과를 다시 출력하는데 이름의 첫번째 철자를 소문자로 출력하시오!
->select ename, lower(substr(ename, 1,1))
	from emp;


문제 68. 아래의 결과를 initcap 쓰지말고 upper와 lower, substr, ||를 사용해서 출력하시오!
select initcap(ename)
	from emp;
	
	
-> select 
substr(upper(ename), 1, 1) || substr(lower(ename),2,(length(ename)-1))
from emp;

설명 : substr(첫번째 인자값, 두번째 인자값, 세번째 인자값)
substr 작성시 세번째 인자값에 아무것도 적지 않으면 끝까지 읽는다.