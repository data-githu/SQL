
073 ���� ���� ����ϱ� 3(NOT IN)
select ename, age, telecom
    from emp12
    where age not in (select age from emp12 where telecom='sk' );

�� : �������� ������� �̸��� ����Ͻÿ�!
select ename
    from emp
    where empno in (select mgr from emp );

���� 274. �����ڰ� �ƴ� ������� �̸��� ����Ͻÿ�!
select ename
    from emp
    where empno not in (select mgr from emp )
-> �����߻�

�� �������������� not in ������ ���� ������ ����!
������������ null���� �ϳ��� ���ϵǸ� ����� ��µ��� �ʴ´�.

select ename
	from emp
	where empno in (7839, 7902, 7566, null);
	
select ename
	from emp
	where empno = 7839 or empno = 7902 or empno = 7566 or empno = null;
	
	
select ename
	from emp
	where empno not in (7839, 7902, 7566, null);
	 
select ename
	from emp
	where empno != 7839 and empno != 7902 and empno != 7566 and empno = null;
	

���� 275. �����ڰ� �ƴ� ������� ����Ͻÿ�!
select ename
    from emp
    where empno not in (select mgr from emp where mgr is not null);

�� �߿伳�� : ���������� ���� not in �����ڸ� ����ϸ� �ݵ�� ������������ ���������� null���� ���ϵ��� �ʵ��� ó���� ����� �մϴ�.

