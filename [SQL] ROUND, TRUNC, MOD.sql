
023 반올림해서 출력하기(ROUND)

예제 : select round( 786.567, 2 )
		from dual;

 7  8  6  .  5  6  7
 -3 -2 -1 0 1 2 3

설명 : 소수점 이전은 바로 그자리를 기준으로 두고 뒤에서 반올림한다.

문제 77. 우리반 나이 평균값을 출력하시오!

-> select avg(age)
	from emp12;
	
문제 78. 위의 결과를 반올림 하여 소수점 이후는 안나오게 하시오!

->  select round( avg(age), 0)
	from emp12;
	
	
-> select round (avg(age))
	from emp12;
	
	
024 숫자를 버리고 출력하기(TRUNC)

->  select trunc(785.657, 2)
	from dual;
	
설명 : trunc 는 버리는 함수인데 소수점 이전은 지정된 자리를 포함해서 버리고 
						소수점 이후는 지정된 자리 이후부터 버린다.


025 나눈 나머지 값 출력하기(MOD)

예제 : select mod(10, 3)
	from dual;
	
select mod(24,2), mod(25,2)
from dual;


문제 79. 우리반에서 나이가 짝수인 학생들의 이름과 나이를 출력하시오!
-> select ename, age
	from emp12
	where mod(age,2) = 0 ;


