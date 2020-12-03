
038 평균값 출력하기(AVG)

"avg 함수로 평균값을 출력할 수 있습니다."

문제 130. 우리반 나이의 평균값을 구하시오!
-> 
select avg(age)
    from emp12;

문제 131. 사원테이블의 월급의 평균값을 출력하시오!
-> 
select avg(sal)
    from emp;

설명 : 월급을 다 더한후 14로 나눔.

문제 132. 커미션의 평균값을 출력하시오!
->
select avg(comm)
    from emp;

설명 : 커미션을 다 더한 후 4로 나눔.

"그룹함수는 null값을 무시한다."


문제 133. 위의 결과를 다시 출력하는데 4로 나누지 않고 14로 나누게 하시오!
->
select avg(nvl(comm,0))
    from emp;

설명 : null 값을 0으로 다 변경했기 때문에 4로 나누지 않고 14로 나누게 되었다.

문제 134. 위의 결과에서 소수점 이하는 안나오게 반올림 하시오!
->
select round(avg(nvl(comm,0)))
    from emp;

문제 135. 직업, 직업별 평균월급을 출력하시오
->
select job,avg(sal)
    from emp
    where job is not null
    group by job;


job에서 null  인 것을 지운다.

delete from emp
	where job is null;
	
commit;

문제 136. 통신사, 통신사별 평균나이를 출력하시오!
->
select decode(lower(telecom),'skt','sk', lower(telecom)), avg(age)
    from emp12
    group by decode(lower(telecom),'skt','sk', lower(telecom));

설명 : lower(telecom) 데이터가 skt면 sk로 출력하고 나머지 통신사는 그냥 그대로 lower(telecom)으로 출력해라!


문제 137. 전공, 전공별 평균나이를 출력하는데 전공이 ㄱ,ㄴ,ㄷ, … 순으로 출력되게 하시오!
-> 
select major, avg(age)
    from emp12
    group by major
    order by major asc;