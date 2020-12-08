
061 여러 테이블의 데이터를 조인해서 출력하기 4(SELF JOIN)
	
"자기 자신의 테이블과 조인하는 조인 문법"

왜 자기 자신의 테이블과 조인을 해야하는가? 
사원테이블로 예를 들면 사원이름과 그사원을 관리하는 관리자의 이름을 하나의 결과로 볼 수 있기 때문이다.

예 : 사원번호, 사원이름, 관리자 번호를 출력하시오!
->
select empno, ename, mgr
    from emp;

예제 : 사원이름, 해당 사원의 관리자의 이름을 출력하시오!
-> 
select 사원.ename,관리자.ename
    from emp 사원, emp 관리자
    where 사원.mgr = 관리자.empno;

위의 결과를 다시 출력하는데 컬럼명을 한글로 사원, 관리자로 출력되게 하시오!
->
select 사원.ename as 사원,관리자.ename as 관리자
    from emp 사원, emp 관리자
    where 사원.mgr = 관리자.empno;

문제 232. 사원이름, 사원월급, 관리자 이름, 관리자의 월급을 출력하시오!
->
select 사원.ename as 사원, 사원.sal as 사원월급, 관리자.ename as 관리자, 관리자.sal as 관리자월급
    from emp 사원, emp 관리자
    where 사원.mgr = 관리자.empno;

문제 233. 위의 결과를 다시 출력하는데 사원의 월급이 관리자의 월급보다 더 큰 사원들만 출력하시오!
->
select 사원.ename as 사원, 사원.sal as 사원월급, 관리자.ename as 관리자, 관리자.sal as 관리자월급
    from emp 사원, emp 관리자
    where 사원.mgr = 관리자.empno and 사원.sal > 관리자.sal;


문제 234. 관리자보다 먼저 입사한 사원들의 이름과 사원입사일, 관리자이름, 관리자 입사일을 출력하시오!
->
select 사원.ename as 사원, 사원.hiredate, 관리자.ename as 관리자, 관리자.hiredate
    from emp 사원, emp 관리자
    where 사원.mgr = 관리자.empno and 사원.hiredate < 관리자.hiredate;

문제 235. 관리자의 이름을 출력하고 그옆에 해당 관리자에 속한 사원들의 이름을 가로로 출력하시오!
-> 
select 관리자.ename,  
    listagg(사원.ename, ', ') within group (order by 사원.ename asc) as 사원
    from emp 사원, emp 관리자
    where 사원.mgr = 관리자.empno
    group by 관리자.ename;
    
    