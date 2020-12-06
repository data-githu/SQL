051 데이터 분석 함수로 비율 출력하기(RATIO_TO_REPORT)

본인의 월급이 전체 월급중에서의 비율이 어떻게 되는 지 확인하는 함수


select ename, sal, ratio_to_report(sal) over() as 비율
	from emp
	where job='SALESMAN';