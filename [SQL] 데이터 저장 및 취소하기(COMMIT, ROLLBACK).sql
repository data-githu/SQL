081 ������ ���� �� ����ϱ�(COMMIT, ROLLBACK)

commit�� ���ݱ��� ������ ������ ���̽� �۾��� (DML ����) �� �����ͺ��̽��� ������ �ݿ��ϰڴ� ��� TCL (Transaction Control Language) ��

rollback�� ���ݱ��� ������ ������ ���̽� �۾���(DML ����)�� ����ϴ� ��ɾ� ���������� commit �� ������ �۾��� DML �۾����� ����Ѵ�.


SQL �� ����
	1. Query �� : select ���� 6���� ��, ����, ��������
	2. DML�� : insert, update, delete, merge
	3. DDL�� : create, alter, drop, truncate, rename
	4. DCL�� : grant, revoke
	5. TCL�� : commit, rollback, savepoint


���� :
select count(*) from emp;
delete from emp;
select * from emp;

rollback;
select count(*) from emp;


���� 306. rollback �� ������ commit �� ���������� rollback �� �ȴٴ� ���� �׽�Ʈ �ϱ� ���ؼ� commit�� ���� �����ϰ� ������̺��� ������ ��� �� 0���� �����Ͻÿ�!

commit;

update emp 
    set sal = 0;
    
select * from emp ;
commit;

delete from emp;
rollback;

select * from emp;

*�Ͻ��� commit 
	1. ���� ���� (exit)
	2. DDL �� ���� : create, alter, drop, truncate, rename
	3. DCL �� ���� : grant, revoke


���� : SQL > delete from emp;
	 SQL > create table emp902
			(empno number(10), ename varchar2(10));

�߿伳�� : ����Ŭ�� DML������ �����ϰ� �������� �Ǵ� DDL�� ���� �Ǵ� DCL ���� �������� �ʾҰ� ��������� commit�� �������� �ʾҴٸ� DML �۾��� ���(rollback)  �� �� �ִ�.
	
