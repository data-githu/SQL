050 데이터 분석 함수로 누적 데이터 출력하기(SUM OVER)

" 데이터를 누적해서 합계하는 데이터 분석 함수"

예제 : 사원번호, 이름, 월급, 월급의 누적치를 출력하시오!

select empno, ename, sal, sum(sal) over (order by empno asc)  누적치
	from emp;
	
문제 182. 이름, 나이, 나이의 누적치를 출력하시오~

    select ename, age, sum(age) over (order by ename asc) 누적치
	from emp12;
	
문제 183. 직업, 이름, 월급, 월급의 누적치를 출력하는데 직업별로 각각 누적되어서 출력되게 하시오!

select job, ename, sal, sum(sal) over (partition by job order by sal asc) 누적치
	from emp;

문제 184. 통신사, 이름, 나이, 나이의 누적치를 출력하는데 나이의 누적치가 통신사별로 각각 누적되어서 출력되게 하시오!
->
select telecom, ename, age, sum(age) over (partition by telecom order by ename asc) 누적치
    from emp12;
