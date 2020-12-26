092 계층형 질의문으로 서열을 주고 데이터 출력하기 4

계층형 질의문에서도 조인문장을 같이 쓸 수 있습니다.

예제 : 이름, 서열, 월급과 부서위치를 출력하시오!
   select rpad(' ', level*2) || e.ename, level, e.sal, d.loc
	from emp e, dept d
	where e.deptno = d.deptno
	start with ename = 'KING' 
	connect by prior empno = mgr;

문제 337. 이름, 서열, 월급, 급여등급 출력하시오!
  select rpad(' ', level*2) || e.ename, level, e.sal, s.grade
	from emp e, salgrade s
	where e.sal between s.losal and s.hisal
	start with ename = 'KING' 
    connect by prior empno = mgr;

문제 338. 위의 결과를 다시 출력하는데 서열의 정렬을 유지하면서 급여등급이 높은 사원부터 출력되게 하시오!
 select rpad(' ', level*2) || e.ename, level, e.sal, s.grade
	from emp e, salgrade s
	where e.sal between s.losal and s.hisal
	start with ename = 'KING' 
         connect by prior empno = mgr
        order siblings by grade desc;

문제 339. DALLAS에서 근무하는 사원들의 이름, 서열, 부서위치를 출력하시오!
(서열이 전체 사원을 기준으로 서열 순위를 부여하시오!)
 select rpad(' ', level*2) || e.ename, level, d.loc
	from emp e, dept d
	where e.deptno = d.deptno and d.loc = 'DALLAS'
	start with ename = 'KING' 
        connect by prior empno = mgr;
 
문제 340. (SQL 알고리즘 4번) 계층형 질의문을 이용해서 구구단 2단을 출력하시오!
select 2 ||'x'|| level || '='|| 2*level as 구구단2단
	from dual
        connect by level <= 9;

문제 341. (SQL 알고리즘 5번) 계층형 질의문을 이용해서 삼각형을 출력하시오!
select lpad('★', level, '★')
    from dual
    connect by level <=10;

설명 : ★을 출력하는데 level 수만큼 자리를 잡고 ★을 하나 출력하고 나머지 자리에 ★을 채워넣어라!

select lpad(sal, 10, '*')
	from emp;
	
설명 : 월급을 출력하는데 전체를 10자리로 잡고 월급을 출력하고 나머지 빈자리에 *을 채워 넣어라

문제 342. (SQL 알고리즘 6번) 아래와 같이 결과를 출력하시오!

★
★★
★★★
★★★★
★★★★★
★★★★
★★★
★★
★

select lpad('★', level, '★')
    from dual
    connect by level <=5
union all
select lpad('★', 5-level, '★')
    from dual
    connect by level <=4;