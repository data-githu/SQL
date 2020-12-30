■ 치환 변수 사용법(&)

  SQL 문장을 수행할때 매번 검색해야하는 데이터 값이 다른데
  SQL 문장이 같을때 검색을 용이하게 하는 오라클 SQL 문법 

예:   select   empno, ename, sal
         from  emp
         where  empno = &사원번호;

undefine  던진횟수
select count(*) / &&던진횟수 as "동전이 앞면이 나올 확률"
   from ( select round( dbms_random.value(0, 1) ) as 동전
               from dual
               connect by level <= &던진횟수)
   where 동전 = 0;

설명: 던진횟수를 SQL 내에서 두번 입력해야하는데 한번만 입력하게 하려면
       엔퍼센트(&) 를 앞에 두개쓰고 뒤에 한개 쓰면 됩니다.
       그런데 SQL 내에서 치환변수시 사용하는 엔퍼센트(&) 를 두개를 
       한번이라도 사용하게 되면 두번째 실행할 때는 안물어보고 바로
       전에 입력된 값으로 실행해버린다. 그래서 치환변수내의 내용을 
       비우려면 undefine  치환변수 이름을 해줘야합니다.

	