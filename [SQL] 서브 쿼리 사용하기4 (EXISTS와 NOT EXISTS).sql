	
074 서브 쿼리 사용하기 4(EXISTS와 NOT EXISTS)

서브쿼리문에서 exist 와 not exists 를 사용해서 메인쿼리에 있는 데이터 중에 서브쿼리에 존재하는지 존재 유무를 파악할 때 사용하는 SQL 문법

insert into emp (empno, ename, sal, job, deptno)
	values(9877, '권세원', 6000, 'ANALYST', 20);
	
commit;

select * from emp;


예제 : 우리반 테이블에 있는 학생들 중에 사원 테이블에도 존재하는 학생이 있으면 이름을 출력하시오!
->
select ename
    from emp12 e12
    where exists (select *
                        from emp e
                        where e.ename = e12.ename);

설명 : exists 문의 main query 컬럼이 서브쿼리 안으로 들어가면서 실행됩니다.
	그러면서 메인쿼리의 데이터 중에 서브쿼리에도 같은 데이터가 존재하는지 찾아봅니다.

문제 276. 부서 테이블에 부서번호와 부서위치를 출력하는데 부서 테이블에 있는 부서번호 중에 사원테이블에도 존재하는 부서번호에 대한 것만 출력하시오!
select deptno, loc
    from dept d
    where exists (select * from emp e where deptno = d.deptno);


문제 277. 존재하지 않는 부서번호와 부서위치를 출력하시오!
select deptno, loc
    from dept d
    where not exists (select * from emp e where deptno = d.deptno);

