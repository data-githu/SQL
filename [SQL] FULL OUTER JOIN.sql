066 ���� ���̺��� �����͸� �����ؼ� ����ϱ� 8(FULL OUTER JOIN)
 ���� : select e.ename, d.loc
		from emp e, dept d
		where e.deptno (+) = d.deptno (+);
	
3�࿡ ���� : 
ORA-01468 : outer-join �� ���̺��� 1���� ������ �� �ֽ��ϴ�.

���� ��� ����� �����ϰ� ���ִ� ���� ������ 1999 ANSI �� full outer join �Դϴ�.

select e.ename, d.loc
	from emp e full outer join dept d
	on (e.deptno = d.deptno);
