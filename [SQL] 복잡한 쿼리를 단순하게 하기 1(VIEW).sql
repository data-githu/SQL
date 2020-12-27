095 ������ ������ �ܼ��ϰ� �ϱ� 1(VIEW)
"���̺��� �ƴϰ� �����͸� �ٶ󺸴� �������� ���̺� ó�� �ϳ��� object (��ü) �� ������ ���� ���մϴ�. "

�� : create table emp708
	as
	select empno, ename, sal, deptno
	from emp;

���� : as ������ ������ �������� ������ emp708 ���̺��� �����ȴ�.

select * from emp708;
	
emp ���̺���� ������ �� �ٸ� ���̺��̴�.

*emp�� �����ϴ� ���� ���� ���̺��� ���� �ִ� �� Ȯ���ϴ� ���

select table_name
	from user_tables
	where table_name like 'EMP%';


���� 369. DALLAS ���� �ٹ��ϴ� ������� �̸��� �μ���ġ�� ����Ͻÿ�! (����)
select e.ename, d.loc
    from emp e, dept d
    where e.deptno = d.deptno and d.loc = 'DALLAS';

���� 370. ���� ��� �����͸� ��� ���̺� emp710�� �����Ͻÿ�!
create table emp710
	as
select e.ename, d.loc
    from emp e, dept d
    where e.deptno = d.deptno and d.loc = 'DALLAS';

���� 371. ���� 1������ 10�������� ���ڸ� ��� ���̺��� emp 705�� �����Ͻÿ�
create table emp705
    as
select level as num1
    from dual
    connect by level <= 10;

���� : ���� level�� SQL���� ���� ������ ���� ���̺��� �÷������� ������ �� ����.


���� 372. emp705�� ���� ������ �߿� ���Ƿ� �ƹ��ų� �ϳ��� ����ÿ�!
delete from emp705
    where num1=4;


���� 373. 1���� 10������ ������ �ϳ��� ����. �� ����?
select sum2-sum1 as ���� ��
    from (select sum(num1) as sum1 from emp705) a,
            (select sum(level) as sum2 from dual connect by level <=10) b;


*view ����
create view emp801
as
select empno, ename, sal, deptno
	from emp;

���� : view�� table�� �ٸ��� ������ �����͸� �����ϰ� ���� �ʴ�.
�׳� �ٶ󺸰� �ִ´�.

"view�� ������Ʈ �ϸ� ���� ���̺� ������Ʈ �˴ϴ�. "

ȸ���� ������ �߿� �����ϸ� �ȵǴ� �����Ͱ� �ִ�. ex) �ΰ��� ������

���̳����� ������ �м��� �Ϸ� ���µ� ���̳� ������ ���ϴ� �������� �����Ͱ� �ִµ� ���� ������ �߿� ������ ���̳� ������ �������� �� ������ �����͸� ������ �ϰ� �󸶵��� ��ȸ�ϰ� ������Ʈ �����ϰ� �ϰ� �ʹٸ� ��� ������ �м������� �����͸� ����ϴ°�?

�� : ���޸� ���� view �� �������ָ� �ȴ�.

create view emp809
as
select empno, ename, job, hiredate, mgr, deptno
	from emp;
	
select * from emp809;

���� 374. ����, ������ ��Ż������ ����Ͻÿ�!
select job, sum(sal)
from emp
group by job;

���� 375. ���� ����� ����ϴ� emp403 view�� �����Ͻÿ�!
create view emp403
as
select job, sum(sal) as ��Ż
from emp
group by job;

���� : view�� ������ �� �׷��Լ��� ����ϰ� �Ǹ� �÷���Ī�� ����մϴ�.

���� 376. �μ���ȣ, �μ���ȣ�� ��տ����� ����ϴ� view�� deptno_avg��� �̸����� �����Ͻÿ�!

create view deptno_avg
as
select deptno, avg(sal) as ��տ���
from emp
group by deptno;

���� 377. emp �� ���� ���� deptno_avg view �� �����ؼ� �̸�, ����, �μ���ȣ, �μ���� ������ ����Ͻÿ�!
select e.ename, e.sal, e.deptno, d.��տ���
    from emp e, deptno_avg d
    where e.deptno = d.deptno;

���� 378. �̸�, ����, �μ���ȣ, �μ������ ����ϴµ� ������ �μ���պ��� �� ū ����鸸 ����Ͻÿ�!

select e.ename, e.sal, e.deptno, d.��տ���
	from emp e, deptno_avg d
	where e.deptbo = d.deptno and e.sal > d.��տ���;
	
���� 379. emp ���̺��� ����� �� ���� ������� �����ϱ� ���� �ڱ��� ������ �ڱⰡ ���� ������ ��տ��޺��� �� ���� ������� �̸��� ���ް� ������ ��������� ����Ͻÿ�!

create view job_avg
as
select job, avg(sal) as ��տ���
from emp
group by job;


select e.ename, e.sal, e.job, j.��տ���
	from emp e, job_avg j
	where e.job = j.job and e.sal > j.��տ���;


���� 380. ����, �̸�, ����, ������ ����ϴµ� ������ �������� ���� ������ ���� ������� ������ �ο��Ͻÿ�!

select job, ename, sal, ��artition by job order by sal desc) ����
	from emp
	
���� 381. ���� ������ ����� view�� ����� view�� �����ؼ� ������ 1���� ����鸸 ����Ͻÿ�!
create view job_avg
as
select job, avg(sal) as ��տ���
from emp
group by job;

select *
    from rank_sal
    where ���� = 1;
