	
074 ���� ���� ����ϱ� 4(EXISTS�� NOT EXISTS)

�������������� exist �� not exists �� ����ؼ� ���������� �ִ� ������ �߿� ���������� �����ϴ��� ���� ������ �ľ��� �� ����ϴ� SQL ����

insert into emp (empno, ename, sal, job, deptno)
	values(9877, '�Ǽ���', 6000, 'ANALYST', 20);
	
commit;

select * from emp;


���� : �츮�� ���̺� �ִ� �л��� �߿� ��� ���̺��� �����ϴ� �л��� ������ �̸��� ����Ͻÿ�!
->
select ename
    from emp12 e12
    where exists (select *
                        from emp e
                        where e.ename = e12.ename);

���� : exists ���� main query �÷��� �������� ������ ���鼭 ����˴ϴ�.
	�׷��鼭 ���������� ������ �߿� ������������ ���� �����Ͱ� �����ϴ��� ã�ƺ��ϴ�.

���� 276. �μ� ���̺� �μ���ȣ�� �μ���ġ�� ����ϴµ� �μ� ���̺� �ִ� �μ���ȣ �߿� ������̺��� �����ϴ� �μ���ȣ�� ���� �͸� ����Ͻÿ�!
select deptno, loc
    from dept d
    where exists (select * from emp e where deptno = d.deptno);


���� 277. �������� �ʴ� �μ���ȣ�� �μ���ġ�� ����Ͻÿ�!
select deptno, loc
    from dept d
    where not exists (select * from emp e where deptno = d.deptno);

