
* 1999 ansi 문법의 cross 조인 이란?

where 절없이 조인해서 전체를 다 조인하는 조인 문법입니다.

	1. 오라클 조인 문법
	select e.ename, d.loc
		from emp e, dept d
        where e.deptno = d.deptno;
		
	2. 1999 ansi 문법
	select e.ename, d.loc
		from emp e cross join dept d;
        
