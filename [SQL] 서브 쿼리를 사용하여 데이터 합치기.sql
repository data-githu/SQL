088 서브 쿼리를 사용하여 데이터 합치기
"merge 문에 서브쿼리를 사용하기 "

예제1. 부서번호, 부서번호별 토탈월급을 출력하시오!
select deptno, sum(sal)
from emp
group by deptno;

예제2. 부서테이블에 sumsal 이라는 컬럼을 추가하시오!

alter table dept
add sumsal number(10);

예제3. 위의 dept 테이블에 추가한 sumsal 컬럼에 해당 부서번호의 토탈월급으로 값을 갱신하시오!
merge into dept d
using (select deptno, sum(sal) 토탈월급 from emp group by deptno) e
on (e.deptno = d.deptno)
when matched then
update set d.sumsal = e.토탈월급;

select deptno, sumsal
    from dept;

문제 323. 부서번호, 부서번호별 인원수를 출력하시오!
select deptno, count(*)
    from emp
    group by deptno;

문제 324. 부서테이블에 cnt 라는 컬럼을 추가하시오!
alter table dept
add cnt number(10);


문제 325. 지금 dept 테이블에 추가한 cnt 컬럼에 해당 부서번호에 인원수로 값을 갱신하시오!
merge into dept d
using( select deptno, count(*) 인원수 from emp group by deptno) e
on(d.deptno = e.deptno)
when matched then
update set d.cnt = e.인원수;

select deptno, cnt from dept ;

설명 : using 절에 사용한 서브쿼리문의 결과가 마치 테이블처럼 이 merge 문에서 사용되고 있다.



