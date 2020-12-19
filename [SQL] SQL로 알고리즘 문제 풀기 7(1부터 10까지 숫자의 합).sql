117 SQL로 알고리즘 문제 풀기 7(1부터 10까지 숫자의 합)
예: 1부터 10까지의 합은 무엇인가요?
(알고리즘 문제 1)
	1. select 1+2+3+4+5+6+7+8+9+10
	from dual;
	
	2. select sum(level)
    from dual
    connect by level <= 10;

설명 : 1번부터 connect by 절의 level 다음에 나오는 숫자만큼 숫자가 증가해서 출력이 된다.

