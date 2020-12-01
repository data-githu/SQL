
*날짜 함수
	1. months_between
	2. add_months
	3. next_day
	4. last_day


026 날짜 간 개월 수 출력하기(MONTHS_BETWEN)

 ★ 날짜

날짜 - 숫자 = 날짜
날짜 + 숫자 = 날짜
날짜 - 날짜 = 숫자


select sysdate
from dual;

select ename, sysdate - hiredate
	from emp;

문제 80. 위의 결과에서 소수점 이하는 안나오게 반올림하시오.
-> select ename, round(sysdate - hiredate)
	from emp;
	
문제 81. 이름, 입사한 날짜부터 오늘까지 총 몇주 근무했는지 출력하시오!
-> select ename, round(round((sysdate - hiredate)/7))
	from emp;


	
문제 82. 이름, 입사한 날짜부터 오늘까지 총 몇 달 근무했는지 출력하시오!
-> select ename, months_between(sysdate, hiredate)
	from emp;
설명 : months_between(최신날짜, 옛날날짜)
	 날짜와 날짜 사이의 개월수를 출력
	
문제 83. 아래와 같이 결과를 출력하시오!

KING 은 467 달을 근무했습니다.

-> select ename || ' 은 ' || round(months_between(sysdate, hiredate)) || ' 달을 근무했습니다.'
	from emp; 




027 개월 수 더한 날짜 출력하기(ADD_MONTHS)

예제 : 오늘 날짜에서 100달 뒤에 돌아오늘 날짜는 몇일인가?

-> select add_months(sysdate, 100)
	from dual;


028 특정 날짜 뒤에 오는 요일 날짜 출력하기(NEXT_DAY)


예제 : 오늘부터 앞으로 바로 돌아올 월요일의 날짜를 출력하시오!
-> select next_day(sysdate, '월요일')
	from dual;
	
문제 84. 오늘날짜에서 100달 뒤에 돌아오는 목요일의 날짜를 출력하시오!
-> select next_day((add_months(sysdate, 100)), '목요일')
	from dual;
	



029 특정 날짜가 있는 달의 마지막 날짜 출력하기(LAST_DAY)

select sysdate, last_day(sysdate)
	from dual;

	
*현재 내가 접속한 세션의 날짜 형식 확인
select * 
    from nls_session_parameters;

-> national language support

문제 85. 81/11/17 일에 입사한 사원의 이름과 입사일을 출력하시오!

select ename, hiredate
	from emp
	where hiredate = '81/11/17';
	
	
*미국의 오라클 환경으로 날짜 형식을 변경해본다

alter session set nls_date_format='DD/MM/RR';

select ename, hiredate
	from emp
	where hiredate = '17/11/81';
	
	
	
*날짜 형식
년도 : RRRR, YYYY, RR, YY
월 : MM, MON
일 : DD
시간 : HH, HH24
분 : MI
초 : SS

alter session set nls_date_format='YY/MM/DD';
select ename, hiredate
	from emp;
	
	
	RR (81) 1981 2081
			2020 : 현재연도에서 가장 가까운 연도를 선택
	
	YY (81) 1981 2081
			2020 :  현재세기로 인식
