080 ������ �����ϱ�(DELETE, TRUNCATE, DROP)

*����Ŭ���� �����͸� �����ϴ� ��� 3����
	1. delete
	2. truncate
	3. drop


���� : delete from emp
		where empno = 7788;


���� 303. ������ SALESMAN�� ������� �����Ͻÿ�!
delete from emp
    where job = 'SALESMAN';

*Ÿ�Ӹӽ� ����� �̿��ؼ� ���ŷ� emp ���̺� �ǵ����ϴ�.
	1. emp ���̺��� flashback�� ������ ���·� �����մϴ�.
	(Ÿ�Ӹӽ� ����� �� �� �ֵ��� �����Ѵ�.)
	
alter table emp enable row movement;

	2. ����ð��� 5�������� emp ���̺��� �ǵ�����.

flash table emp to timestamp
(systimestamp - interval '10' minute);


*truncate ��ɾ�
	1. ������ ��� ����
	2. rollback �ȵ�
	3. flashback �ȵ�
	4. ���̺� ������ ���ܵΰ� �� �����.

truncate table emp;

������� �����ͷ� �����ϴ� ��� �ۿ� ����.

*drop ��ɾ�

	1. ��� ������ ����
	2. ���̺� �������� �� ����
	3. rollback �ȵ�
	4. ������ ����� �־ flashback�� �����մϴ�.

show recyclebin;

flashback table emp to before drop;
