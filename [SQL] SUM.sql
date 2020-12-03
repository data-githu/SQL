
*select 문의 6가지절

코딩순서 : select -> from -> where -> group by -> having -> order by
실행순서 : from -> where -> group by -> having -> select -> order by
	
	5 select 검색할 컬럼명
	1 from 검색할 테이블명
	2 where 검색조건
	3 group by 그룹핑할 컬럼
	4 having 그룹함수로 검색조건을 줄 때 사용
	6 order by 정렬할 컬럼명
	

039 토탈값 출력하기(SUM)

"토탈값을 출력하는 함수"

예제 : 사원 테이블의 총 월급을 출력하시오!
-> 
select sum(sal)
    from emp;

문제 138. 직업, 직업별 토탈월급을 출력하는데 직업별 토탈월급이 높은 것부터 출력하시오!
-> 
select job, sum(sal)
    from emp
    group by job
    order by sum(sal) desc;

문제 139. 위의 결과에서 직업이 SALESMAN  은 제외하고 출력하시오!
->
select job, sum(sal)
    from emp
    where job != 'SALESMAN'
    group by job
    order by sum(sal) desc;

문제 140. 위의 결과를 다시 출력하는데 토탈월급이 6000 이상인 것만 출력하시오!
->
select job, sum(sal)
    from emp
    where job != 'SALESMAN'
    group by job
    having sum(sal) >= 6000
    order by sum(sal) desc;

설명 : group 함수로 조건을 줄 때는 where 절에 사용하면 안되고 having절에 사용해야 합니다. where 절에는 그룹함수를 사용하지 않은 일반적인 검색조건을 줄 때 사용합니다.


	
문제 141. 직업, 직업별 토탈월급을 출력하는데 직업이 SALESMAN 은 제외하고 출력하고 직업별 토탈월급이 6000 이상인 것만 출력하고  직업별 토탈월급이 높은것부터 출력하시오!
->
select job, sum(sal)
    from emp
    where job != 'SALESMAN'
    group by job
    having sum(sal) >= 6000
    order by sum(sal) desc;

select job, sum(sal)
    from emp
    group by job
    having sum(sal) >= 6000 and job != 'SALESMAN'
    order by sum(sal) desc;


위의 SQL이 수행될까요? 

되기는 하는데 검색속도가 느려집니다. 
일반적인 검색조건을 having 절에 사용하면 검색속도가 느려지므로 반드시 where 절에 작성해야합니다.

문제 142. 통신사, 통신사별 토탈나이를 출력하는데 'skt'는 제외하고 토탈나이가 100 이상인 것만 순서대로 출력하시오!

-> 
select lower(telecom), sum(age)
    from emp12
    where lower(telecom) != 'skt'
    group by lower(telecom)
    having sum(age) >= 100
    order by sum(age) desc;

문제 143. 위의 문제를 다시 푸는데 이번에는 skt를 sk에 포함시켜 출력하시오!
-> 
select substr(lower(telecom),1,2), sum(age)
    from emp12
    group by substr(lower(telecom),1,2)
    having sum(age) >= 100
    order by sum(age) desc;

문제 144. 입사한 년도(4자리), 입사한 년도별 토탈월급을 출력하는데 토탈월급을 출력할 때 천단위 표시가 출력되게 하시오!

-> 
select to_char(hiredate, 'RRRR'), to_char(sum(sal),'999,999')
    from emp
    group by to_char(hiredate, 'RRRR');
