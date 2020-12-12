
073 서브 쿼리 사용하기 3(NOT IN)
select ename, age, telecom
    from emp12
    where age not in (select age from emp12 where telecom='sk' );

예 : 관리자인 사원들의 이름을 출력하시오!
select ename
    from emp
    where empno in (select mgr from emp );

문제 274. 관리자가 아닌 사원들의 이름을 출력하시오!
select ename
    from emp
    where empno not in (select mgr from emp )
-> 오류발생

※ 서브쿼리문에서 not in 연산자 사용시 주의할 사항!
서브쿼리에서 null값이 하나라도 리턴되면 결과가 출력되지 않는다.

select ename
	from emp
	where empno in (7839, 7902, 7566, null);
	
select ename
	from emp
	where empno = 7839 or empno = 7902 or empno = 7566 or empno = null;
	
	
select ename
	from emp
	where empno not in (7839, 7902, 7566, null);
	 
select ename
	from emp
	where empno != 7839 and empno != 7902 and empno != 7566 and empno = null;
	

문제 275. 관리자가 아닌 사원들을 출력하시오!
select ename
    from emp
    where empno not in (select mgr from emp where mgr is not null);

※ 중요설명 : 서브쿼리문 사용시 not in 연산자를 사용하면 반드시 서브쿼리에서 메인쿼리로 null값이 리턴되지 않도록 처리를 해줘야 합니다.

