090 ������ ���ǹ����� ������ �ְ� ������ ����ϱ� 2

"������ ������ ����ϴ� SQL ��"

������ �������� where �� ������ ����ϸ� from �� ���Ŀ� ����ȴ�.
start with ���� connect by ���� �����Ǹ�, start with ���� ����� �� connect by ���� ����ȴ�. 
start with ���� ������ �����ϴ�.

��                                           ����
start with ��                      ��Ʈ ��带 �����ϸ� 1���� ����
connect by ��                    ��Ʈ ����� ���� ��带 �����ϸ� ��ȸ����� ���������� �ݺ� ����

����1 : 1~10������ ���ڸ� ����Ͻÿ�!

select level    (connect by ���� ������� ��µǴ� �÷�)
	from dual (����� ���� ���� ������ ���̺�)
	connect by level <= 10;  (level �� 10���� �۰ų� ���������� ����ؼ� ����)
	
����2: ��� ���̺��� ���� ������ ����Ͻÿ�!
select level, empno, ename, mgr
	from emp
	start with ename = 'KING'
	connect by prior empno = mgr;
					��      ��
				�����ȣ     �������� �����ȣ

���� : select������ level �̶�� �÷��� emp ���̺��� ���� �÷��Դϴ�.
�׷��� ��µ� �� �־��� ���� connect by ���� ��� �����Դϴ�.

���� 330. emp ���̺��� ������ SQL �� �ð�ȭ �Ͻÿ�!

select rpad(' ', level*2) || ename as employee, level
	from emp
	start with ename = 'KING' 
	connect by prior empno = mgr;

���� : rpad(' ', level*2)�� ���� (' ') level*2�� ���ڸ�ƴ ä���ְڴ�.

���� 331. ���� ������� BLAKE �� �����ϰ� ����Ͻÿ�
select rpad(' ', level*2) || ename as employee, level
	from emp
           where ename != 'BLAKE'
	start with ename = 'KING' 
	connect by prior empno = mgr;

���� 332. ���� ������� BLAKE �Ӹ� �ƴ϶� BLAKE �� ��������� ��� �����Ͻÿ�!
select rpad(' ', level*2) || ename as employee, level
	from emp
           where ename != 'BLAKE' 
	start with ename = 'KING' 
	connect by prior empno = mgr and ename != 'BLAKE' ;

���� : ��������� ��� �����͸� ��µ��� �ʰ� �Ϸ���  where ���� �ƴ϶� connect by ���� ������ �ָ� �˴ϴ�.


���� 333. �ٽ� BLAKE �� BLAKE �������� ���Խ�Ų ������ ����ϴ� SQL�� �Ʒ��� ���� �����ϴµ� ������ ���� ������� ����Ͻÿ�!
   select rpad(' ', level*2) || ename as employee, level, sal
	from emp
	start with ename = 'KING' 
	connect by prior empno = mgr 
           order by sal desc;

���� : ���� ����� ������ ���� ������� ������ �Ǹ鼭 ������ ���ĵ� ����� ����� ���ȴ�.

���� 334. ���� ����� �ٽ� ������ ���ĵ� ����� �����ϸ鼭 ������ ���� ������� ���ĵǼ� ��µǰ� �Ͻÿ�!
   select rpad(' ', level*2) || ename as employee, level, sal
	from emp
	start with ename = 'KING' 
	connect by prior empno = mgr 
           order siblings by sal desc;

���� : ����� ���� ���� ���� ������ ������ ���� ������� ���ĵǰ� �ֽ��ϴ�. ������ ���ǹ��� ����� �� order by ���� ������ siblings ��� Ű���带 ¦������ ����ؾ� �մϴ�.

���� 335. �̸��� �Ի��� ���� ������ ����ϴµ� ���� ������ ���Ļ��¸� �����ϸ鼭 ���� �Ի��� ��������� ������ �Ǿ ��µǰ� �Ͻÿ�!
  select rpad(' ', level*2) || ename,  hiredate, level
	from emp
	start with ename = 'KING' 
	connect by prior empno = mgr 
         order siblings by hiredate asc;


