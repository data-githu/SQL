081 데이터 저장 및 취소하기(COMMIT, ROLLBACK)

commit은 지금까지 변경한 데이터 베이스 작업들 (DML 문장) 을 데이터베이스에 영구히 반영하겠다 라는 TCL (Transaction Control Language) 문

rollback은 지금까지 변경한 데이터 베이스 작업들(DML 문장)을 취소하는 명령어 마지막으로 commit 한 이후의 작업한 DML 작업들을 취소한다.


SQL 의 종류
	1. Query 문 : select 문의 6가지 절, 조인, 서브쿼리
	2. DML문 : insert, update, delete, merge
	3. DDL문 : create, alter, drop, truncate, rename
	4. DCL문 : grant, revoke
	5. TCL문 : commit, rollback, savepoint


예제 :
select count(*) from emp;
delete from emp;
select * from emp;

rollback;
select count(*) from emp;


문제 306. rollback 이 마지막 commit 한 시점까지만 rollback 이 된다는 것을 테스트 하기 위해서 commit을 지금 수행하고 사원테이블의 월급을 모두 다 0으로 변경하시오!

commit;

update emp 
    set sal = 0;
    
select * from emp ;
commit;

delete from emp;
rollback;

select * from emp;

*암시적 commit 
	1. 정상 종료 (exit)
	2. DDL 문 수행 : create, alter, drop, truncate, rename
	3. DCL 문 수행 : grant, revoke


예제 : SQL > delete from emp;
	 SQL > create table emp902
			(empno number(10), ename varchar2(10));

중요설명 : 오라클은 DML문장을 수행하고서 정상종료 또는 DDL문 수행 또는 DCL 문을 수행하지 않았고 명시적으로 commit을 수행하지 않았다면 DML 작업을 취소(rollback)  할 수 있다.
	
