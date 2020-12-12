*데이터를 연결해서 출력하는 방법 2가지
	1. 조인 : 데이터를 양옆으로 연결해서 출력하는 방법
	2. 집합 연산자 : 데이터를 위아래로 연결해서 출력하는 방법
			1) union all
			2) union
			3) intersect
			4) minus
            
설명 : union all 로 위의 쿼리문의 결과와 아래의 쿼리문의 결과를 하나로 합쳐서 출력하고 있다. 
집합 연산자를 사용할 때 주의사항은 다음과 같다.

	1. 집합연산자 위 아래의 쿼리문의 컬럼의 갯수가 동일해야합니다.
	2. 집합연산자 위 아래의 쿼리문의 컬럼의 데이터 타입도 동일해야합니다.
	3. 집합연산자 위 아래의 쿼리문의 컬럼의 컬럼명이 동일해야합니다.
	4. order by는 가장 아래의 쿼리문장에만 작성할 수 있습니다.


067 집합 연산자로 데이터를 위아래로 연결하기 1(UNION ALL)
예제 : 직업, 직업별 토탈월급을 출력하시오!
select job, sum(sal)
    from emp
    group by job;

예제 :  전체 토탈월급을 출력하시오!
select sum(sal)
    from emp;

예제 : 위의 SQL을 하나로 합쳐서 데이터가 위아래로 출력되게 하시오!
->
select job, sum(sal)
    from emp
    group by job
    union all
select '전체토탈 : ' as job, sum(sal)
    from emp;


문제 251. 부서번호, 부서번호별 토탈월급을 출력하는데 맨 아래에 전체토탈월급이 출력되게 하시오!
->
select to_char(deptno), sum(sal)
    from emp
    group by deptno
    union all
select '토탈월급 :' as deptno,sum(sal)
    from emp;


문제 252. 입사한 년도 (4자리), 입사한 년도별 토탈월급을 출력하시오!
->
select to_char(hiredate, 'RRRR'), sum(sal)
    from emp
    group by to_char(hiredate,'RRRR');


문제 253. 입사한 년도(4자리), 입사한 년도별 토탈월급을 출력하는데 맨아래에 전체 토탈월급이 출력되게 하시오!
->
select to_char(hiredate, 'RRRR'), sum(sal)
    from emp
    group by to_char(hiredate,'RRRR')
    union all
select '토탈월급 :' as hire_year, sum(sal)
    from emp;

설명 : union all 위 아래로 쿼리문의 컬럼의 갯수가 서로 동일해야하고 컬럼명도 가급적 동일해야하고 데이터 유형도 동일해야합니다.

문제 254. 우리반 테이블에서 통신사, 통신사별 인원수를 출력하시오!
->
select telecom, count(*)
    from emp12
    group by telecom;

문제 255. 위의 결과에서 전체토탈이 맨 아래에 출력되도록 하시오!
->
select telecom, count(*)
    from emp12
    group by telecom
	union all
select '전체 :' as telecom, count(*)
    from emp12;

문제 256. 문제 253번의 결과를 정렬해서 출력하시오!
->
select to_char(hiredate, 'RRRR')as hire_year, sum(sal)
    from emp
    group by to_char(hiredate,'RRRR')
    union all
select '토탈 :' as hire_year, sum(sal)
    from emp
    order by hire_year asc;
