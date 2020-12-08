
060 여러 테이블의 데이터를 조인해서 출력하기 3(OUTER JOIN)

"조인하려는 두 테이블의 공통된 컬럼인 deptno 의 데이터가 서로 똑같이 일치하지 않을 때 조인하기 위해서 사용하는 조인 방법 "

예 : 사원테이블에서 부서번호를 출력하는데 중복제거해서 출력하시오!
->
select distinct deptno
    from emp;

예 : 부서테이블에서 부서번호를 출력하시오!
->
select deptno
    from dept;

문제 227. emp 와 dept 를 서로 조인해서 이름과 부서위치와 부서번호를 출력하시오!
->
select e.ename, d.loc, e.deptno
    from emp e, dept d
    where e.deptno = d.deptno;

설명 : 위의 결과를 보면 40번은 조인이 되지 않아서 결과로 출력되지 않았습니다.
왜 조인이 안되었나요? 사원테이블에 40번 부서번호가 없어서 입니다.
->
select e.ename, d.loc, e.deptno
    from emp e, dept d
    where e.deptno(+) = d.deptno;

설명 : outer join sign (+) 는 결과로 출력될 때 데이터가 부족한 쪽에 붙여준다.
	emp 테이블에는 부서번호가 10, 20, 30 이 있고 40번이 없습니다.
	dept 테이블에는 부서번호가 10, 20, 30, 40 번이 있습니다.
	그래서 emp 테이블 쪽에 붙여줍니다.

문제 228. 부서위치, 부서위치별 토탈월급을 출력하시오!
->
select d.loc, sum(e.sal)
    from emp e, dept d
    where e.deptno = d.deptno
    group by d.loc;

설명 : 위의 조인된 결과를 보면 부서위치(loc) 쪽에 BOSTON이 보이지 않습니다.

문제 229. 위의 결과에서 BOSTON 도 나오도록 조인문법을 변경하시오!
->
select d.loc, sum(e.sal)
    from emp e, dept d
    where e.deptno (+) = d.deptno
    group by d.loc;


*우리반 테이블과 조인하기 위한 테이블을 생성
(통신사 기본 요금 테이블)
 drop  table  telecom_price;

  create  table   telecom_price
  (   telecom     varchar2(10),
      price         number(10),
     service_cnt   number(10) );

 insert  into   telecom_price   values('sk', 18500,  9 );
 insert  into   telecom_price   values('kt', 17000,  9 );
 insert  into   telecom_price   values('lg', 18000, 10 ); 

 commit; 

문제230. 우리반 테이블과  telecom_price 테이블을 조인해서  이름, 나이, 성별, 통신사, 통신사 기본요금(price) 을 출력하는데  나이가 27 이상인 학생들만 출력되게 하시오!
->
select e.ename, e.age, e.gender, e.telecom, t.price
    from emp12 e, telecom_price t
    where e.telecom = t.telecom and e.age >=27 ;

