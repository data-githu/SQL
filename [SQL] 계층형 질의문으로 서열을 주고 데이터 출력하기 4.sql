092 ������ ���ǹ����� ������ �ְ� ������ ����ϱ� 4

������ ���ǹ������� ���ι����� ���� �� �� �ֽ��ϴ�.

���� : �̸�, ����, ���ް� �μ���ġ�� ����Ͻÿ�!
   select rpad(' ', level*2) || e.ename, level, e.sal, d.loc
	from emp e, dept d
	where e.deptno = d.deptno
	start with ename = 'KING' 
	connect by prior empno = mgr;

���� 337. �̸�, ����, ����, �޿���� ����Ͻÿ�!
  select rpad(' ', level*2) || e.ename, level, e.sal, s.grade
	from emp e, salgrade s
	where e.sal between s.losal and s.hisal
	start with ename = 'KING' 
    connect by prior empno = mgr;

���� 338. ���� ����� �ٽ� ����ϴµ� ������ ������ �����ϸ鼭 �޿������ ���� ������� ��µǰ� �Ͻÿ�!
 select rpad(' ', level*2) || e.ename, level, e.sal, s.grade
	from emp e, salgrade s
	where e.sal between s.losal and s.hisal
	start with ename = 'KING' 
         connect by prior empno = mgr
        order siblings by grade desc;

���� 339. DALLAS���� �ٹ��ϴ� ������� �̸�, ����, �μ���ġ�� ����Ͻÿ�!
(������ ��ü ����� �������� ���� ������ �ο��Ͻÿ�!)
 select rpad(' ', level*2) || e.ename, level, d.loc
	from emp e, dept d
	where e.deptno = d.deptno and d.loc = 'DALLAS'
	start with ename = 'KING' 
        connect by prior empno = mgr;
 
���� 340. (SQL �˰��� 4��) ������ ���ǹ��� �̿��ؼ� ������ 2���� ����Ͻÿ�!
select 2 ||'x'|| level || '='|| 2*level as ������2��
	from dual
        connect by level <= 9;

���� 341. (SQL �˰��� 5��) ������ ���ǹ��� �̿��ؼ� �ﰢ���� ����Ͻÿ�!
select lpad('��', level, '��')
    from dual
    connect by level <=10;

���� : ���� ����ϴµ� level ����ŭ �ڸ��� ��� ���� �ϳ� ����ϰ� ������ �ڸ��� ���� ä���־��!

select lpad(sal, 10, '*')
	from emp;
	
���� : ������ ����ϴµ� ��ü�� 10�ڸ��� ��� ������ ����ϰ� ������ ���ڸ��� *�� ä�� �־��

���� 342. (SQL �˰��� 6��) �Ʒ��� ���� ����� ����Ͻÿ�!

��
�ڡ�
�ڡڡ�
�ڡڡڡ�
�ڡڡڡڡ�
�ڡڡڡ�
�ڡڡ�
�ڡ�
��

select lpad('��', level, '��')
    from dual
    connect by level <=5
union all
select lpad('��', 5-level, '��')
    from dual
    connect by level <=4;