
059 여러 테이블의 데이터를 조인해서 출력하기 2(NON EQUI JOIN)
	
"조인하려는 두개의 테이블 사이에 공통된 컬럼이 없었을때 사용하는 조인 문법"

예 : salgrade 테이블 생성

drop  table  salgrade;

create table salgrade
( grade   number(10), #grade 급여등급
  losal   number(10),   #losal 최소월급
  hisal   number(10) );  #hisal 최대월급

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);

commit;

예제 : 이름, 월급, 급여등급을 출력하시오!
->
select e.ename, e.sal, s.grade
    from emp e, salgrade s
    where e.sal between s.losal  and s.hisal;

문제 224. 위의 결과에서 등급이 3등급인 사원들만 출력하시오!
->
select e.ename, e.sal, s.grade
    from emp e, salgrade s
    where (e.sal between s.losal  and s.hisal ) and s.grade = 3;


문제 225. 급여등급(grade), 급여등급별로 해당 하는 사원들의 이름 가로로 출력하시오!
->
select s.grade,
    listagg(e.ename, ', ') within group (order by ename asc) 이름
    from emp e, salgrade s
    where e.sal between s.losal  and s.hisal 
    group by s.grade;

문제 226. 위의 결과에서 월급도 옆에 같이 나오게 하시오!
->
select s.grade,
    listagg(e.ename || '(' || e.sal || ')', ', ') within group (order by ename asc) 이름
    from emp e, salgrade s
    where e.sal between s.losal  and s.hisal 
    group by s.grade;
