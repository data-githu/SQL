
071 ���� ���� ����ϱ� 1(������ ��������)

����1. ��� ���̺��� �ִ������ �޴� ����� �̸��� ������ ����Ͻÿ�!
->
select ename, max(sal)
    from emp;

����: ���� SQL �� �����Ϸ��� ������������ ����ؾ� �մϴ�.

����2. JONES�� ������ ����Ͻÿ�!
select sal
	from emp
	where ename='JONES'; 
	
����3. JONES�� ���޺��� �� ���� ������ �޴� ������� �̸��� ������ ����Ͻÿ�!
->
select ename,sal
    from emp
    where sal >= 2975;


����2���� ����3���� ���� ������������ �ѹ��� ��������!

select ename,sal
    from emp
    where sal >= (select sal from emp where ename='JONES');

���� 265. SCOTT �� ���� ������ �޴� ������� �̸��� ������ ����Ͻÿ�!
select ename, sal
    from emp
    where sal = (select sal from emp where ename='SCOTT')
and ename != 'SCOTT';

����266. SMITH �� ������ �� ������� �̸��� ������ ����ϴµ� SMITH�� �����ϰ� ����Ͻÿ�!
select ename, job
    from emp
    where job = (select job from emp where ename ='SMITH')
and ename != 'SMITH';

���� 267. ALLEN ���� �ʰ� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�!
select ename, hiredate
    from emp
    where hiredate > (select hiredate from emp where ename = 'ALLEN')
and ename != 'ALLEN';

���� 268. ������ SALESMAN�� ����� �ִ� ���޺��� �� ���� ������ �޴� ������� �̸��� ������ ����Ͻÿ�!
select ename, sal
    from emp
    where sal > (select max(sal) from emp where job = 'SALESMAN');

���� 269. �ִ������ �޴� ����� �̸��� ������ ����Ͻÿ�!
select ename, sal
    from emp
    where sal >= (select max(sal) from emp);

���� 270. ������ ��谡 ���ԵǾ����ִ� �л��� �߿����� �ִ� ������ �л��� �̸��� ���̿� ������ ����Ͻÿ�!
select ename, age, major
    from emp12
    where age = (select max(age) from emp12 where major like '%���%')
and major like '%���%';


���� 271. KING���� �����ϴ� ������� �̸��� ����Ͻÿ�!
->
select ename
    from emp
    where mgr = (select empno from emp where ename = 'KING' );
