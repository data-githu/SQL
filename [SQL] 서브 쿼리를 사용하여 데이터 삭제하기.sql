087 ���� ������ ����Ͽ� ������ �����ϱ�
���� : SCOTT ���� ������ ���� �޴� ������� �����Ͻÿ�!

delete from emp
where sal > (select sal from emp where ename = 'SCOTT');
rollback;

���� 321. ALLEN ���� �ʰ� �Ի��� ������� �����Ͻÿ�!
delete from emp
where hiredate > (select hiredate from emp where ename = 'ALLEN');

���� 322. JONES �� ���� �μ���ȣ���� ���ϴ� ������� �����Ͻÿ�!
�׷��� JONES�� �����Ͻÿ�!
delete from emp
where deptno = (select deptno from emp where ename = 'JONES') and ename != 'JONES';

