119 SQL로 알고리즘 문제 풀기 9(1부터 10까지 짝수만 출력)

문제 326. 1부터 10사이의 숫자를 출력하는데 짝수만 출력하시오!
select level
    from dual
     where mod(level,2) = 0
    connect by level <= 100;