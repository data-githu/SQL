062 ���� ���̺��� �����͸� �����ؼ� ����ϱ� 5(ON��)
	
*���� ������ ���� 2����
		1. ����Ŭ ���� ����
			�� equi join : �ΰ� ���̺� ���̿� ����� �÷��� �־��� ���� ���� ���
			�� non equi join : �ΰ��� ���̺� ���̿� ����� �÷��� ������ ���� ���� ���
			�� outer join : �ΰ��� ���̺��� ����� �÷��� ������ �����Ϸ��� �÷��� �����Ͱ� ���� ��ġ���� ������ ����ϴ� ����
			�� self join : �ڱ� �ڽ��� ���̺�� �����ϴ� ����
	?
		2. 1999 ansi ���� ����
			�� on���� ����� ����
			�� using ���� ����� ����
			�� natural join
			�� left/right/full outer ����
			�� cross ����

�� : 

	1) ����Ŭ equi join

select e.ename, d.loc
	from emp e, dept d
	where e.deptno = d.deptno ;
	
	2) on ���� ����� ����

select e.ename, d.loc
	from emp e join dept d
	on (e.deptno = d.deptno) ;
	
	

���� 243. �̸��� ���ް� �μ���ġ�� ����ϴµ� ������ 2400 �̻��� ����鸸 ����Ͻÿ�
->
select e.ename, e.sal, d.loc
    from emp e join dept d
    on (e.deptno = d.deptno)
    where e.sal >= 2400;

���� : on���� ����� ���� ������ ���������� on ���� �ְ� �Ǿ��ְ� �˻������� where ���� �ֵ��� ������ �ξ���.

���� 244. DALLAS ���� �ٹ��ϴ� ������� �̸��� ���ް� �μ���ġ�� ������ ����ϴµ� on ���� ����� ���ι������� �����ϼ���!
->
select e.ename, e.sal, d.loc, e.sal
    from emp e join dept d
    on (e.deptno = d.deptno)
    where d.loc = 'DALLAS';

���� 245. emp ���̺�� salgrade ���̺��� ���� �����Ͽ� �̸�, ����, �޿������ ����ϴµ� 2��޸� ����ϴµ� 2��޸� ����Ͻÿ�! (on�� �̿�)
->
select e.ename, e.sal, s.grade
    from emp e join salgrade s
    on ( e.sal between s.losal and s.hisal)
    where s.grade = 2;
