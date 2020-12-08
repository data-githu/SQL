064 여러 테이블의 데이터를 조인해서 출력하기 6(NATURAL JOIN)
예 : select e.ename, d.loc
	from emp e natural join dept d;
	
설명 : where 절 없이 간단하게 조인하는 조인 문법
	오라클이 알아서 두 테이블 사이에 공통된 컬럼이 있는지 찾아보고 조인한다.