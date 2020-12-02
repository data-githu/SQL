
033 NULL 값 대신 다른 데이터 출력하기(NVL, NVL2)

일반함수
	1. nvl 함수
	2. decode 함수
	3. case 함수


○ nvl 함수 : null 값 대신에 다른값을 출력하고 싶을 때 사용하는 함수

예제 : 이름, 월급, 커미션, 월급 + 커미션 을 출력하시오!

->  select ename, sal, comm, nvl(comm, 0), sal + nvl(comm,0)
    from emp;

설명 : nvl함수로 다른값을 대체해서 출력하는 것이지 실제로 테이블의 데이터가 0으로 변경되는 것은 아니다.


문제 100. 이름과 커미션을 출력하시오
-> select ename, comm
	from emp;
	
문제 101. 이름, 커미션을 출력하는데 커미션이 null 인 사원들은 no comm 이라는 글씨로 출력되게하시오!

->  select ename, nvl(to_char(comm), 'no comm')
    from emp;

설명 : 숫자형 문자형으로 변환해서 데이터 타입을 서로 동일하게 맞춰주고 출력하면 된다.


문제 102. 커미션이 null인 사원의 이름과 커미션을 출력하시오!
-> select ename, comm
    from emp
    where nvl(comm,-1)=-1;

