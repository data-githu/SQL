
032 암시적 형 변환 이해하기

* to _number 함수 

"숫자로 형 변환하는 함수"

월급이 3000인 사원의 이름과 월급을 출력하시오!

select ename, sal
	from emp
	where sal = 3000; 
		  ↓      ↓
	      숫자형   숫자형
	
문자형 : varchar2
숫자형 : number
날짜형 : date

select ename, sal
	from emp
	where sal = '3000'; 
-> 문자형인데도 출력이 된다. 

설명 : 다른 database 소프트웨어에서는 에러가 나면서 실행이 안된다.
oracle은 실행을 하고 자체적으로 문자형을 숫자형으로 변환시켜준다.

문제 99. (점심시간 문제) 1981년도에 입사한 사원들의 이름과 입사일과 입사한 년도를 출력하는데 가장 최근에 입사한 사원부터 출력하시오!

-> select ename, hiredate, to_char(hiredate,'RRRR')
     from emp
     where to_char(hiredate,'RRRR') = '1981'
     order by hiredate desc;


변환함수 :   1. to_char : 문자로 형변환하는 함수
			2. to_number : 숫자로 형변환하는 함수
			3. to_date : 날짜로 형변환하는 함수
			
			
select ename, sal
	from emp
	where sal = '3000';
	

create table emp100
(ename varchar(10),
	sal varchar(10));
	
insert into emp100 values('scott', '2000');
insert into emp100 values('smith', '3000');


commit;


select ename, sal
	from emp100
	where sal = 2000;
		문자    숫자
		
설명 : where 절에 검색조건을 적을 때 주의할 사항은 문자 컬럼의 데이터를 검색할 때는 문자로 검색하고 숫자 컬럼의 데이터를 검색할 때는 숫자로 검색해야한다.
만약에 문자형인데 숫자형으로 검색하거나 숫자형인데 문자형으로 검색할 경우 오라클은 에러를 발생시키지 않지만 검색 성능이 느려지게 됩니다. 
그러므로 반드시 검색조건을 적을 때 위의 사항을 지켜줘야 합니다.
