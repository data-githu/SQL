046 데이터 분석 함수로 바로 전 행과 다음 행 출력하기(LAG, LEAD)

"바로 전행을 옆에 나오게 하거나 바로 다음행을 옆에 나오게 할 때 사용하는 함수"

예 : select ename, sal, lag(sal,1) over (order by sal asc) as 전행,
                             lead(sal,1) over (order by sal asc) as 다음행
	from emp;
    
	
문제 173. 이름, 입사일, 바로 전에 입사한 사원의 입사일, 바로 다음에 입사한 사원의 입사일 출력하시오!
->

select ename, hiredate, lag(hiredate, 1) over (order by hiredate asc) as 전입사일,
                        lead(hiredate, 1) over (order by hiredate asc) as 다음입사일
        from emp;

