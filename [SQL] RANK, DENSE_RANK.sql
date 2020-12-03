
041 데이터 분석 함수로 순위 출력하기 1(RANK)


데이터 분석 함수 : 데이터 분석을 용이하게 하기 위해서 제공하는 함수
그 중에 rank는 순위를 출력하는 함수입니다.

예제 :  이름, 월급, 월급에 대한 순위를 출력하시오!
->
select ename, sal, rank() over (order by sal desc) as 순위
     from emp;

문제 153. 이름, 나이, 순위를 출력하는데 순위가 나이가 높은 순서대로 순위를 출력하시오
->
select ename, age, rank() over (order by age desc) as 순위
     from emp12;

문제 154. 직업, 이름, 월급, 순위를 출력하는데 직업별로 각각 월급이 높은 순서대로 순위가 출력되게 하시오!
->
select job, ename, sal, rank() over (partition by job order by sal desc) as 순위
     from emp;

※ 설명 : partition by 는 group by하고 혼동하면 안된다.
partition by는 데이터 분석함수에서 괄호안에 쓰는 문법으로 
partition by job 이라고 하면 직업별로 각각 파티션해서 나누겠다는 것이다.

그래서 아래의 뜻은
rank() over (partition by job <- 직업별로 파티션해서
		order by sal desc ) <- 월급이 높은 순서대로 순위를 출력하겠다.
		
문서 155. 부서번호, 이름, 입사일, 순위를 출력하는데 순위가 부서번호별로 각각 먼저 입사한 사원순으로 순위가 부여되게 하시오!


-> 
select deptno, ename, hiredate, rank() over(partition by deptno order by hiredate asc) as 순위
    from emp;

문제 156. 통신사, 이름, 나이, 순위를 출력하는데 통신사별로 각각 나이 높은 학생순으로 순위를 부여하시오!
->
select substr(lower(telecom),1,2), ename, age, rank() over(partition by substr(lower(telecom),1,2) order by age desc) as 순위
    from emp12;
    


042 데이터 분석 함수로 순위 출력하기 2(DENSE_RANK)
예제 : 
select substr(lower(telecom),1,2), ename, age, dense_rank() over(partition by substr(lower(telecom),1,2) order by age desc) as 순위
    from emp12;

문제 157. 이름, 월급, 순위를 출력하는데 dense_rank()  를 써서 순위가 1,2,3,4,5 등 전부 출력되도록 하시오!
->
select ename, sal, dense_rank() over (order by sal desc) as 순위
    from emp;


문제 158. 입사한 년도(4자리), 이름, 월급, 순위를 출력하는데 순위가 입사한 년도 별로 각각 월급이 높은 순서대로 순위를 출력하시오!
-> 
select to_char(hiredate, 'RRRR'), ename, sal, rank() over (partition by to_char(hiredate, 'RRRR')order by sal desc) as 순위
    from emp;

문제 159. 이메일 도메인, 이름, 나이, 순위를 출력하는데 순위가 이메일 도메인 별로 각각 나이가 높은 학생순으로 출력되게하시오!

->
select?substr(substr(email,instr(email,'@')+1),1,instr(substr(substr(email,instr(email,'@')+1),1),'.')-1),?ename,?age,?
????rank()?over?(partition?by?substr(substr(email,instr(email,'@')+1),1,instr(substr(substr(email,instr(email,'@')+1),1),'.')-1)?order?by?age?desc)?as?순위
????from?emp12;

