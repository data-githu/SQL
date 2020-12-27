097 ������ �˻� �ӵ��� ���̱�(INDEX)

*����Ŭ �����ͺ��̽��� ��ü�� ���� 5����
	1. table : �����͸� �����ϴ� �⺻ �����
	2. view : �����͸� �ٷκ��� ������
	3. index : �˻� �ӵ��� ���̱� ���� db object
	4. sequence : ������� ��ȣ�� �����ϴ� db object
	5. synonym : ���̺�� ���� �� �ٸ� �̸�
	
	SQL Ʃ���� ���� �ݵ�� �˾ƾ� �ϴ� db object
	-> �˻��ӵ��� ���̴� ���

���� : �ε����� å���� ġ�� å�� �տ� ������ ������ �ε����Դϴ�.
å�� ���̺��̸� �ε����� å�� �����Դϴ�.
������ ���� ���¿��� å�� �����߿� � ������ ã�´ٸ� ó������ ������ �� ��ĵ�ؾ� �� ���Դϴ�.

����1. �̸� SCOTT �� ����� �̸��� ������ ����Ͻÿ�!
select ename, sal
    from emp
    where ename = 'SCOTT';

���� : ename �� �ε����� ���� ������ SCOTT �� emp ���̺��� ã���� ó������ ������ full table scan �� ���� ���Դϴ�.


����2. emp ���̺� ename �� �ε����� �����Ͻÿ�!
create index emp_ename
	on emp(ename);
	
select ename, sal
    from emp
    where ename = 'SCOTT';


���� : ���� ���� �ε����� �����ϸ� �� �˻��� ���� ���ΰ�?
å���� ġ�� �տ� ������ ��������� �Դϴ�. �׷��� ������ ���� �˻��ϰ� å�� �˻��ϸ� �ξ� ������ ���ϴ� �����͸� �˻��� �� �ֱ� �����Դϴ�.

*�ε���(����)�� ����

	������ + ������ ��ȣ

create index emp_ename
on emp(ename);

���� ���� ename�� �ε����� ����� ename�� �̿��ؼ� ���� �ε����� ������ �÷��� + rowid�� �����Ǿ� �ְ� �÷����� ABCD ������� ���ĵǾ�  �ε����� �����մϴ�.

rowid �� �� ���� ��ǥ�ϴ� �ּ��Դϴ�.

select rowid, ename, sal
	from emp;

*emp_ename �� �ε����� ������ ���� ������

select ename, rowid
	from emp
	where ename > ' ';
	
select ename, rowid
	from emp;
	

���� 385. ��� ���̺� ���޿� �ε����� �Žÿ�!
create index emp_sal
    on emp(sal);


���� 386. emp ���̺��� sal �� �ε����� emp_sal �� ������ Ȯ���Ͻÿ�
select sal, rowid
	from emp
	where sal >= 0;
    