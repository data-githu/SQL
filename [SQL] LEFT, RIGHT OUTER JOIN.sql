
065 ���� ���̺��� �����͸� �����ؼ� ����ϱ� 7(LEFT/RIGHT OUTER JOIN)
���� : ����Ŭ ���� ���� (�ƿ��� ����)

select e.ename, d.loc
	from emp e, dept d
	where e.deptno (+) = d.deptno;
	

insert into emp(empno, ename, sal, job, deptno)
	values( 1221, 'jack' , 3500, 'SALESMAN', 70);

	1) ����Ŭ ���� ���� (�ƿ��� ����)
	select e.ename, d.loc
		from emp e, dept d
		where e.deptno = d.deptno (+);
		
���� : dept ���̺��� 70�� �μ��� �����Ƿ� ������ �� equi ������ �ϰ� �Ǹ� ����� �ȳ�����  outer join�� ����ؾ� �մϴ�.

���� 247. ���� ����� 1999 ansi�������� �����Ͻÿ�!
->
select e.ename, d.loc
    from emp e left outer join dept d
    on (e.deptno = d.deptno);
