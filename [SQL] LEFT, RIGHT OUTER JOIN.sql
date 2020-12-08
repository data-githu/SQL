
065 여러 테이블의 데이터를 조인해서 출력하기 7(LEFT/RIGHT OUTER JOIN)
예제 : 오라클 조인 문법 (아우터 조인)

select e.ename, d.loc
	from emp e, dept d
	where e.deptno (+) = d.deptno;
	

insert into emp(empno, ename, sal, job, deptno)
	values( 1221, 'jack' , 3500, 'SALESMAN', 70);

	1) 오라클 조인 문법 (아우터 조인)
	select e.ename, d.loc
		from emp e, dept d
		where e.deptno = d.deptno (+);
		
설명 : dept 테이블에는 70번 부서가 없으므로 조인할 때 equi 조인을 하게 되면 결과가 안나오고  outer join을 사용해야 합니다.

문제 247. 위의 결과를 1999 ansi문법으로 구현하시오!
->
select e.ename, d.loc
    from emp e left outer join dept d
    on (e.deptno = d.deptno);
