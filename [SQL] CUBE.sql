053 데이터 분석 함수로 집계 결과 출력하기 2(CUBE)

"집계 결과를 위쪽에 출력하는 함수"

예제 : select job, sum(sal)
             from emp
	  group by cube(job);
	
문제 185. 통신사, 통신사별 토탈나이를 출력하는데 맨위에 전체 토탈나이가 출력되게 하시오!
->
select telecom, sum(age)
    from emp12
    group by cube(telecom);

문제 186. 입사한 년도(4자리), 입사한 년도별 토탈월급을 출력하는데 맨 위에 전체토탈월급을 출력하시오!
->
select to_char(hiredate,'RRRR'), sum(sal)
    from emp
    group by cube(to_char(hiredate,'RRRR'));

문제 187. 입사한 년도(4자리), 입사한 년도별 토탈월급을 출력하시오!
	1. select to_char(hiredate,'RRRR'), sum(sal)
	    from emp
	    group by to_char(hiredate,'RRRR');


	2. select sum(decode( to_char(hiredate,'RRRR'),'1980',sal,0)) as "1980",
	        sum(decode( to_char(hiredate,'RRRR'),'1981',sal,0)) as "1981",
	        sum(decode( to_char(hiredate,'RRRR'),'1982',sal,0)) as "1982",
	        sum(decode( to_char(hiredate,'RRRR'),'1983',sal,0)) as "1983"
	        from emp;

