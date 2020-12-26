090 계층형 질의문으로 서열을 주고 데이터 출력하기 2

"순위와 서열을 출력하는 SQL 문"

계층형 질의절은 where 절 다음에 기술하며 from 절 이후에 수행된다.
start with 절과 connect by 절로 구성되며, start with 절이 수행된 후 connect by 절이 수행된다. 
start with 절은 생략이 가능하다.

절                                           설명
start with 절                      루트 노드를 생성하며 1번만 수행
connect by 절                    루트 노드의 하위 노드를 생성하며 조회결과가 없을때까지 반복 수행

예제1 : 1~10까지의 숫자를 출력하시오!

select level    (connect by 절을 써야지만 출력되는 컬럼)
	from dual (결과를 보기 위한 가상의 테이블)
	connect by level <= 10;  (level 이 10보다 작거나 같을때까지 계속해서 연결)
	
예제2: 사원 테이블의 서열 순서를 출력하시오!
select level, empno, ename, mgr
	from emp
	start with ename = 'KING'
	connect by prior empno = mgr;
					↑      ↑
				사원번호     관리자의 사원번호

설명 : select절에서 level 이라는 컬럼은 emp 테이블에는 없는 컬럼입니다.
그런데 출력될 수 있었던 것은 connect by 절을 썼기 때문입니다.

문제 330. emp 테이블의 서열을 SQL 로 시각화 하시오!

select rpad(' ', level*2) || ename as employee, level
	from emp
	start with ename = 'KING' 
	connect by prior empno = mgr;

설명 : rpad(' ', level*2)은 공백 (' ') level*2의 숫자만틈 채워넣겠다.

문제 331. 위의 결과에서 BLAKE 는 제외하고 출력하시오
select rpad(' ', level*2) || ename as employee, level
	from emp
           where ename != 'BLAKE'
	start with ename = 'KING' 
	connect by prior empno = mgr;

문제 332. 위의 결과에서 BLAKE 뿐만 아니라 BLAKE 의 팀원들까지 모두 제외하시오!
select rpad(' ', level*2) || ename as employee, level
	from emp
           where ename != 'BLAKE' 
	start with ename = 'KING' 
	connect by prior empno = mgr and ename != 'BLAKE' ;

설명 : 하위노드의 모든 데이터를 출력되지 않게 하려면  where 절이 아니라 connect by 절에 조건을 주면 됩니다.


문제 333. 다시 BLAKE 와 BLAKE 팀원들을 포함시킨 서열을 출력하는 SQL을 아래와 같이 실행하는데 월급이 높은 순서대로 출력하시오!
   select rpad(' ', level*2) || ename as employee, level, sal
	from emp
	start with ename = 'KING' 
	connect by prior empno = mgr 
           order by sal desc;

설명 : 위의 결과는 월급이 높은 순서대로 정렬이 되면서 서열로 정렬된 결과가 사라져 버렸다.

문제 334. 위의 결과를 다시 서열로 정렬된 결과를 유지하면서 월급이 높은 순서대로 정렬되서 출력되게 하시오!
   select rpad(' ', level*2) || ename as employee, level, sal
	from emp
	start with ename = 'KING' 
	connect by prior empno = mgr 
           order siblings by sal desc;

설명 : 결과를 보면 같은 서열 내에서 월급이 높은 순서대로 정렬되고 있습니다. 계층형 질의문을 사용할 때 order by 절을 쓸때는 siblings 라는 키워드를 짝꿍으로 사용해야 합니다.

문제 335. 이름과 입사일 서열 순위를 출력하는데 서열 순위에 정렬상태를 유지하면서 먼저 입사한 사원순으로 정렬이 되어서 출력되게 하시오!
  select rpad(' ', level*2) || ename,  hiredate, level
	from emp
	start with ename = 'KING' 
	connect by prior empno = mgr 
         order siblings by hiredate asc;


