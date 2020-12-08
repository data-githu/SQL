062 여러 테이블의 데이터를 조인해서 출력하기 5(ON절)
	
*조인 문법의 종류 2가지
		1. 오라클 조인 문법
			§ equi join : 두개 테이블 사이에 공통된 컬럼이 있었을 때의 조인 방법
			§ non equi join : 두개의 테이블 사이에 공통된 컬럼이 없었을 때의 조인 방법
			§ outer join : 두개의 테이블의 공통된 컬럼은 있으나 조인하려는 컬럼의 데이터가 서로 일치하지 않을때 사용하는 조인
			§ self join : 자기 자신의 테이블과 조인하는 조인
	?
		2. 1999 ansi 조인 문법
			§ on절을 사용한 조인
			§ using 절을 사용한 조인
			§ natural join
			§ left/right/full outer 조인
			§ cross 조인

예 : 

	1) 오라클 equi join

select e.ename, d.loc
	from emp e, dept d
	where e.deptno = d.deptno ;
	
	2) on 절을 사용한 조인

select e.ename, d.loc
	from emp e join dept d
	on (e.deptno = d.deptno) ;
	
	

문제 243. 이름과 월급과 부서위치를 출력하는데 월급이 2400 이상인 사원들만 출력하시오
->
select e.ename, e.sal, d.loc
    from emp e join dept d
    on (e.deptno = d.deptno)
    where e.sal >= 2400;

설명 : on절을 사용한 조인 문법은 조인조건은 on 절에 주게 되어있고 검색조건은 where 절에 주도록 구분해 두었다.

문제 244. DALLAS 에서 근무하는 사원들의 이름과 월급과 부서위치와 직업을 출력하는데 on 절을 사용한 조인문법으로 수행하세요!
->
select e.ename, e.sal, d.loc, e.sal
    from emp e join dept d
    on (e.deptno = d.deptno)
    where d.loc = 'DALLAS';

문제 245. emp 테이블과 salgrade 테이블을 서로 조인하여 이름, 월급, 급여등급을 출력하는데 2등급만 출력하는데 2등급만 출력하시오! (on절 이용)
->
select e.ename, e.sal, s.grade
    from emp e join salgrade s
    on ( e.sal between s.losal and s.hisal)
    where s.grade = 2;
