118 SQL로 알고리즘 문제 풀기 8(1부터 10까지 숫자의 곱)

로그의 성질을 이용하면 알고리즘 3번 문제를 풀 수 있습니다.

문제 327. 밑수가 자연상수 (e) 이고 진수가 10인 로그값을 출력하시오!
select ln(10) 
	from dual;

문제 328. 자연상수 (e) 의 10승은 얼마인가?
 select exp(10) 
	from dual;

문제 329. 1부터 10까지의 곱을 sql 로 출력하시오!
(알고리즘 문제 3)
select exp(sum(ln(level)))
    from dual
    connect by level <= 10;