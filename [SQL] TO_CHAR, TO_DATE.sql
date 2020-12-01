
030 문자형으로 데이터 유형 변환하기(TO_CHAR)

숫자형 -> 문자형으로 변환
날짜형 -> 문자형으로 변환할 때 사용하는 함수

select to_char(sysdate, 'day')
	from dual; 
	
문제 86. 이름, 입사일, 입사한 요일을 출력하시오!
-> select ename, hiredate, to_char(hiredate, 'day')
	from emp;
	
문제 87. 수요일에 입사한 사원들의 이름과 입사일을 출력하시오!
-> select ename, hiredate
	from emp
	where to_char(hiredate, 'day') = '수요일';

문제 88. 내가 무슨 요일에 태어났는지 확인하시오!

-> select to_char(to_date('92/01/23', 'RR/MM/DD'), 'DAY')
	from dual;
	

*날짜 형식
년도 : RRRR, YYYY, RR, YY
월 : MM, MON
일 : DD
시간 : HH, HH24
분 : MI
초 : SS
요일 : day, dy, d

select ename, hiredate, to_char(hiredate,'day'), to_char(hiredate,'dy'), to_char(hiredate,'d')
	from emp;
	

031 날짜형으로 데이터 유형 변환하기(TO_DATE)

문제 89. 이름, 입사한 요일을 출력하는데 입사한 요일이 월화수목금토일 순으로 정렬되어서 출력되게하시오!

insert into emp(empno, ename, hiredate)
values(1234, 'JACK', to_date('82/01/10,'RR/MM/DD));
commit;

-> select ename, hiredate, to_char(hiredate, 'day')
	from emp
	 order by to_char(hiredate-1,'d') asc;
