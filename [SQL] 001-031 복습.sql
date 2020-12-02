[001-031 복습시간]

	1. SELECT 절
	2. 함수
	- 단일행 함수 : 문자, 숫자, 날짜, 변환, 일반
	- 복수행 함수 : max, min, avg, sum, count

문자함수 : upper, lower, initcap, substr, instr, length, lpad, rpad, trim, ltrim, rtrim, replace
숫자함수 : round, trunc, mod
날짜함수 : month_between, add_months, next_day, last_day
변환함수 : to_char, to_number, to_date


문제 90. 직업이 SALESMAN 인 사원들의 이름과 월급과 직업을 출력하는데 월급이 높은 사원부터 출력하시오!
-> select ename, sal, job
    from emp
    where job='SALESMAN'
    order by sal desc;

문제 91. 직업이 SALESMAN 이 아닌 사원들의 이름과 입사일과 직업을 출력하는데 최근에 입사한 사원부터 출력하시오!

-> select ename, hiredate, job
    from emp
    where job != 'SALESMAN'
    order by hiredate desc;

     * 설명 :  select 컬럼명 - 3 (실행순서)
		 from 테이블명 - 1
		 where 검색조건 - 2
		 order by 정렬할 컬럼명 - 4

문제 92. 월급이 1000에서 3000사이인 사원들의 이름과 월급을 출력하시오!

-> select ename, sal
    from emp
    where sal between '1000' and '3000';

문제 93. 이름을 출력하고 그 옆에 이름의 첫번째 철자만 출력하는데 소문자로 출력하시오!

-> select ename, lower(substr(ename,1,1))
    from emp;

문제 94. 우리반 테이블에서 이름과 이메일을 출력하는데 그 옆에 이메일에서 @가 몇번째 철자인지 출력하시오!

-> select ename, email, instr(email, '@')
    from emp12;

문제 95. 이름과 입사일을 출력하는데 입사한 년도를 4자리로 출력하시오!

-> select ename, hiredate, to_char(hiredate, 'RRRR')
      from emp;

설명 : 년도 : RRRR, RR, YYYY, YY
	 달 : MM, MON
	 일 : DD
	 시간 : HH, HH24
	 분 : MI
	 초 : SS
	 요일 : DAY, DY, D
	
	
* 변환함수 : to_char 함수
 " 날짜 -> 문자/ 숫자 -> 문자 " 

select ename, hiredate, to_char(hiredate, 'MM')
	from emp;
	
문제 96. 11월에 입사한 사원들의 이름과 입사일을 출력하시오!

-> select ename, hiredate
    from emp
    where to_char(hiredate, 'MM') = '11';

문제 97. 문제 96번을 to_char 이용하지 말고  substr 로 수행하시오!

-> select ename, hiredate
    from emp
    where substr(hiredate,4,2) = '11';

* 변환함수 : to_date 함수 

 " 날짜로 형 변환하는 함수 "


예제 : select ename, hiredate
	from emp
	where hiredate = '81/11/17';
	
	
	select ename, hiredate
		from emp
		where hiredate = to_date('81/11/17', 'RR/MM/DD');
		           ↓
		날짜형 데이터 유형 = 날짜
		
		where sal = 3000 ;  
		         ↓
		숫자형 데이터 유형= 숫자

※ 설명 : 날짜형 데이터를 검색할 때는 반드시 to_date 함수를 사용할 것을 권장합니다.

문제 98. 1981년도에 입사한 사원들의 이름과 입사일을 출력하시오!

	1. to_char
	
-> select ename, hiredate
       from emp
       where to_char(hiredate,'RRRR') = '1981';

	2. to_date

-> select ename, hiredate
      from emp
      where hiredate between to_date('81/01/01', 'RR/MM/DD') and to_date('81/12/31','RR/MM/DD') ;
