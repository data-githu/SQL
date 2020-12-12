
070 집합 연산자로 데이터의 차이를 출력하기(MINUS)
"차집합을 구하는 집한 연산자"
예:
select ename, age, telecom
    from emp12
    minus
    select ename, age, telecom
    from emp12_backup2;

설명 : 김씨 빼고 다 출력되었습니다.
