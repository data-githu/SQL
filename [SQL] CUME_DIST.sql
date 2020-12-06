
044 데이터 분석 함수로 순위의 비율 출력하기(CUME_DIST)


예제 : select ename, sal, cume_dist() over(order by sal desc) 비율
	from emp;
	
	
문제 168. 위의 결과에서 소수점 세번째까지만 출력되게 반올림 하시오!
->
select ename, sal, round(cume_dist() over(order by sal desc),3) 비율
    from emp;