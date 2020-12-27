096 복잡한 쿼리를 단순하게 하기 2(VIEW)

*view의 종류 2가지
	- 단순 view 테이블갯수 : 1개/ 그룹함수 : 포함안됨/ DML여부 : 가능  
	- 복합 view 테이블갯수 : 2개이상/ 그룹함수 : 포함됨/ DML여부 : 불가능 할 수도 있다.

문제 383. ename_loc의 데이터 중에 SCOTT 의 부서위치를 washington 으로 변경하시오!
update ename_loc
set loc = 'wasington'
where ename = 'SCOTT';

-> 변경되지 않습니다.


문제 375번에서 만든 emp403 view를 쿼리하고 결과를 보시오!
create view emp403
as 
select job, sum(sal) as 토탈
from emp
group by job;

update emp403
set 토탈 = 2000
where job = 'SALESMAN';

설명 : 위와 같은 복합뷰는 데이터를 갱신할 수 없는데 만약 토탈월급이 갱신된다면 실제값도 갱신해줘야하기 때문에 갱신할 수도 없고 해서도 안됩니다.

문제 384. 내가 그동안 만든 view 들을 확인하시오!

select view_name, text
from user_views

설명 :  위와 같이 조회하면 VIEW 를 만들었을때 사용한 테이블명도 볼 수 있습니다.

*view 삭제
drop view emp809;
