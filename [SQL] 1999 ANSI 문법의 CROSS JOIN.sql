
*1999 ansi ������ cross ���� �̶�?

where ������ �����ؼ� ��ü�� �� �����ϴ� ���� �����Դϴ�.

	1. ����Ŭ ���� ����
	select e.ename, d.loc
		from emp e, dept d
        where e.deptno = d.deptno;
		
	2. 1999 ansi ����
	select e.ename, d.loc
		from emp e cross join dept d;
        