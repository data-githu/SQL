086 ���� ������ ����Ͽ� ������ �����ϱ�
update emp
set sal = 8900
where ename = 'SCOTT'

��� ������ �������� ��� �����մϴ�.

����1. SCOTT ���� �� ���� ������ �޴� ������� ������ SALESMAN ���� �����Ͻÿ�!
update emp
set job = 'SALESMAN'
where sal > (select sal from emp where ename = 'SCOTT');

���� 317. ALLEN ���� �� �ʰ� �Ի��� ������� Ŀ�̼��� 9000���� �����Ͻÿ�!
update emp
set comm = 9000
where hiredate > (select hiredate from emp where ename = 'ALLEN');

select ename, comm, hiredate from emp;

���� 318. SMITH �� ���� ������ ���� ������� ������ 9800���� �����Ͻÿ�! (SMITH�� �����Ͻÿ�!)
update emp
set sal = 9800
where job = (select job from emp where ename = 'SMITH') and ename != 'SMITH';

select ename, job, sal from emp;

���� 319. ALLEN�� ������ KING�� �������� �����Ͻÿ�!
update emp
set sal = (select sal from emp where ename = 'KING')
where ename = 'ALLEN';

���� 320. JONES ���� ������ ���� ������� ������ MARTIN�� �������� �����Ͻÿ�!
update emp
set job = (select job from emp where ename = 'MARTIN')
where sal > (select sal from emp where ename = 'JONES');

select ename, sal, job  from emp;
