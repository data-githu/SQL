
문제 160. 이름, 입사일, 순위를 출력하는데 순위가 먼저 입사한 사원순으로 순위를 출력하시오!
-> 
select ename, hiredate, rank() over(order by hiredate asc) as 순위
    from emp;

문제 161. 직업, 이름, 입사일, 순위를 출력하는데 순위가 직업별로 각각 먼저 입사한 사원순으로 순위를 부여하시오!
->
select job, ename, hiredate, rank() over(partition by job order by hiredate asc) as 순위
    from emp;


문제 162. 이름, 월급, 순위를 출력하는데 순위가 월급이 높은 순서대로 순위를 부여하시오!
->
select ename, sal, rank() over(order by sal desc) as 순위
    from emp;

문제 163. 월급이 2975는 순위가 몇위인가?
->
select dense_rank(2975) within group (order by sal desc) as 순위
    from emp;

설명 : within ~이내에 
	월급이 높은 순서대로 정렬한 그룹 안에서 2975가 몇위의 순위인가?

문제 164. 우리반에서 34의 나이의 순위를 출력하시오 
->
select dense_rank(34) within group (order by age desc) as 순위
    from emp12;

문제 165. 81년 11월 17일에 입사한 사원은 사원 테이블에서 몇번째로 입사한 사원인가?
->
select dense_rank(to_date('81/11/17','RR/MM/DD')) within group (order by hiredate asc) as 순위
    from emp;
    
