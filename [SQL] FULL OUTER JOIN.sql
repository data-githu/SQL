066 여러 테이블의 데이터를 조인해서 출력하기 8(FULL OUTER JOIN)
 예제 : select e.ename, d.loc
		from emp e, dept d
		where e.deptno (+) = d.deptno (+);
	
3행에 오류 : 
ORA-01468 : outer-join 된 테이블은 1개만 지정할 수 있습니다.

위의 결과 출력을 가능하게 해주는 조인 문법이 1999 ANSI 의 full outer join 입니다.

select e.ename, d.loc
	from emp e full outer join dept d
	on (e.deptno = d.deptno);
