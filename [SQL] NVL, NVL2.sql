
033 NULL �� ��� �ٸ� ������ ����ϱ�(NVL, NVL2)

�Ϲ��Լ�
	1. nvl �Լ�
	2. decode �Լ�
	3. case �Լ�


�� nvl �Լ� : null �� ��ſ� �ٸ����� ����ϰ� ���� �� ����ϴ� �Լ�

���� : �̸�, ����, Ŀ�̼�, ���� + Ŀ�̼� �� ����Ͻÿ�!

->  select ename, sal, comm, nvl(comm, 0), sal + nvl(comm,0)
    from emp;

���� : nvl�Լ��� �ٸ����� ��ü�ؼ� ����ϴ� ������ ������ ���̺��� �����Ͱ� 0���� ����Ǵ� ���� �ƴϴ�.


���� 100. �̸��� Ŀ�̼��� ����Ͻÿ�
-> select ename, comm
	from emp;
	
���� 101. �̸�, Ŀ�̼��� ����ϴµ� Ŀ�̼��� null �� ������� no comm �̶�� �۾��� ��µǰ��Ͻÿ�!

->  select ename, nvl(to_char(comm), 'no comm')
    from emp;

���� : ������ ���������� ��ȯ�ؼ� ������ Ÿ���� ���� �����ϰ� �����ְ� ����ϸ� �ȴ�.


���� 102. Ŀ�̼��� null�� ����� �̸��� Ŀ�̼��� ����Ͻÿ�!
-> select ename, comm
    from emp
    where nvl(comm,-1)=-1;
