091 계층형 질의문으로 서열을 주고 데이터 출력하기 3

계층형 질의문과 짝꿍 함수인 sys_connect_by_path 를 이용하면 listagg를 사용한 것처럼 가로로 결과를 출력할 수 있습니다.

예제 : select ename, sys_connect_by_path(ename, ',')  as path
		from emp
		start with ename = 'KING'
		connect by prior empno = mgr;

문제 336. 위의 결과에서 앞에 / 를 아래와 같이 잘라버리시오!
select ename, ltrim(sys_connect_by_path(ename, '/'),'/')  as path
		from emp
		start with ename = 'KING'
		connect by prior empno = mgr;

★ 중요설명 : 계층형 질의문을 작성할 때 반드시 알아야하는 두가지 짝꿍 키워드 
	1. order by 절의 siblings
	2. 서열을 가로로 출력하는 sys_connect_by_path
    