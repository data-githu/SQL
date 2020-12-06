
043 데이터 분석 함수로 등급 출력하기(NTILE)

"등급을 출력하는 함수"
예제 : select ename, sal, ntile(4) over (order by sal desc) 등급
		from emp;

설명 : 월급이 높은 순으로 정렬한 데이터를 4등급으로 나누겠다.

0% - 25% : 1등급
25% - 50% : 2등급
50%-  75% : 3등급
75% - 100% : 4등급

문제 166. 이름, 나이, 등급을 출력하는데 등급을 7등급으로 나눠서 출력하시오!
(나이가 높은순서대로 등급을 나누시오.)
->
select ename, age, ntile(7) over(order by age desc) 등급
    from emp12;

문제 167. 직업, 이름, 월급, 등급을 출력하는데 직업별 각각 등급이 3등급으로 나눠지게 하시오!
(등급은 월급이 높은 순서대로의 등급입니다.)
->
select job, ename, sal, ntile(3) over (partition by job order by sal desc) 등급
     from emp;

