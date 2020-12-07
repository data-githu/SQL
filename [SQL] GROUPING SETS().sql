
054 데이터 분석 함수로 집계 결과 출력하기 3(GROUPING SETS)

"집계결과를 출력하는 데이터 분석 함수입니다."

예제 : select deptno, sum(sal)
		From emp
		Group by grouping sets( deptno, () );
		                                 ↑       ↑
				 부서번호별로 집계  전체집계= rollup과 같은 효과


문제 193. 직업, 직업별 토탈월급을 출력하는데 맨 아래에 전체 토탈월급이 출력되게 하시오!
-> 
select job, sum(sal)
    from emp
    group by grouping sets(job,());

문제 194. 부서번호와 직업을 뽑고 그 옆에 부서번호별 직업별 토탈월급을 출력하시오!
->
select deptno, job, sum(sal)
    from emp
    group by deptno, job;

설명 : select 절에 그룹함수와 함께 나열한 컬럼들을 반드시 group by 절에 명시를 해줘야 에러가 나지 않고 출력될 수 있다.

문제 195. 부서번호와 직업을 출력하고 그 옆에 부서번호별 직업별 토탈월급을 출력하고 동시에 부서번호별 토탈월급도 중간중간 출력되게 하시오!
->
select deptno, job, sum(sal)
    from emp
    group by grouping sets((deptno, job),(deptno));

문제 196. 위의 결과의 맨 아래에 전체 토탈월급이 출력되게 하시오!
->
select deptno, job, sum(sal)
    from emp
    group by grouping sets((deptno, job),(deptno),());

문제 197. 사원번호, 사원이름, 월급을 출력하는데 맨 아래에 전체 토탈월급을 출력하시오!
->
select empno, ename, sum(sal)
    from emp
    group by grouping sets(empno, ename, ());

설명 : 사원번호는 중복되지 않기 때문에 grouping sets 함수에 괄호안에 grouping 결과로 넣어도 그냥 자기 월급이 출력되게 된다.
왜냐하면 각각 한건씩만 존재하기 때문이다. 그 한건을 집계하면 그 값이 된다. 그리고 맨 끝에 () 은 전체 토탈월급을 출력하는 것입니다.


문제 198. 우리반 테이블에서 통신사, 이름, 나이를 출력하는데 중간중간 통신사별 토탈나이가 출력되게 하시오!
->
select telecom, ename, sum(age)
    from emp12
    group by grouping sets((ename,telecom),(telecom));

문제 199. 입사한 년도 (4자리), 입사한 년도별 토탈월급을 출력하는데 전체 토탈월급이 맨 아래에 출력되게 하시오!
->
select to_char(hiredate,'RRRR'), sum(sal)
    from emp
    group by grouping sets((to_char(hiredate,'RRRR')),()); 

문제 200. 위의 결과를 다시 출력하는데 아래와 같이 천단위를 부여해서 출력하시오!
->
select to_char(hiredate,'RRRR'), to_char(sum(sal),'999,999')
    from emp
    group by grouping sets((to_char(hiredate,'RRRR')),()); 

문제 201. 입사한 년도(4자리), 부서번호, 입사한 년도별 부서번호별 토탈월급을 출력하시오!

->
select to_char(hiredate, 'RRRR'), deptno, sum(sal)
    from emp
    group by to_char(hiredate, 'RRRR'), deptno;



문제 202. 입사한 년도(4자리), 부서번호, 입사한 년도(4자리)별 부서번호별 토을 출력하는데 중간중간 입사한 년도(4자리)별 토탈월급이 출력되게 하고 맨 아래에 전체 토탈월급이 출력되게 하시오!

 ->
select to_char(hiredate, 'RRRR'), deptno, sum(sal)
    from emp
    group by grouping sets((to_char(hiredate, 'RRRR'),deptno),(to_char(hiredate, 'RRRR')),());