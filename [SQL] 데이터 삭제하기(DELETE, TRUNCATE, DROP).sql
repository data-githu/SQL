080 데이터 삭제하기(DELETE, TRUNCATE, DROP)

*오라클에서 데이터를 삭제하는 방법 3가지
	1. delete
	2. truncate
	3. drop


예제 : delete from emp
		where empno = 7788;


문제 303. 직업이 SALESMAN인 사원들을 삭제하시오!
delete from emp
    where job = 'SALESMAN';

*타임머신 기능을 이용해서 과거로 emp 테이블만 되돌립니다.
	1. emp 테이블을 flashback이 가능한 상태로 변경합니다.
	(타임머신 기능을 쓸 수 있도록 설정한다.)
	
alter table emp enable row movement;

	2. 현재시간에 5분전으로 emp 테이블을 되돌린다.

flash table emp to timestamp
(systimestamp - interval '10' minute);


*truncate 명령어
	1. 데이터 모두 삭제
	2. rollback 안됨
	3. flashback 안됨
	4. 테이블 구조만 남겨두고 다 지운다.

truncate table emp;

백업받은 데이터로 복구하는 방법 밖에 없다.

*drop 명령어

	1. 모든 데이터 삭제
	2. 테이블 구조까지 다 삭제
	3. rollback 안됨
	4. 휴지통 기능이 있어서 flashback은 가능합니다.

show recyclebin;

flashback table emp to before drop;
