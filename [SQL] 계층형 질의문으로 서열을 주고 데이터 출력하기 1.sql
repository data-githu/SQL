089 계층형 질의문으로 서열을 주고 데이터 출력하기 1
select level
    from dual
    connect by level <= 10 ;