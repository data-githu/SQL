045 데이터 분석 함수로 데이터를 가로로 출력하기(LISTAGG)

->
select deptno,
        listagg(ename, ', ') within group (order by ename asc)  이름
        from emp
        group by deptno;

설명 : 이름을 가로로 출력하는데 콤마(,)로 구분해서 출력하겠다. 이름이 abcd 순으로 정렬되어서 출력되고 있다. listagg는 다른 분석함수와 다르게 group by 절이 필요하다.


문제 169. 직업, 직업별로 해당하는 사원들의 이름을 가로로 출력하시오!
-->
select job,
        listagg(ename, ', ') within group (order by ename asc) 이름
        from emp
        group by job;


문제 170.  아래와 같이 출력하시오!

ANALYST	    FORD(3000), SCOTT(3000)
CLERK	    ADAMS(1100), JAMES(950), MILLER(1300), SMITH(800)
MANAGER	    BLAKE(2850), CLARK(2450), JONES(2975)
PRESIDENT	KING(5000)
SALESMAN	ALLEN(1600), MARTIN(1250), TURNER(1500), WARD(1250)

->
select job,
        listagg(ename|| '('|| sal|| ')', ', ') within group (order by ename asc) 
        from emp
        group by job;



문제 171. 나이, 나이별로 해당하는 학생들의 이름을 가로로 출력하시오!

->
select age, listagg(ename, ', ') within group (order by ename asc) 이름
    from emp12
    group by age;



문제 172. 통신사를 출력하고 통신사별로 해당하는 학생들의 이름을 출력하는데 이름 옆에 나이도 같이 출력되게 하고 나이가 높은 학생순로 출력되게 하시오!

->
select telecom,
	listagg(ename || '(' || age || ')', ', ') within group (order by age desc)
	from emp12
	group by telecom;