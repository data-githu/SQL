088 ���� ������ ����Ͽ� ������ ��ġ��
"merge ���� ���������� ����ϱ� "

����1. �μ���ȣ, �μ���ȣ�� ��Ż������ ����Ͻÿ�!
select deptno, sum(sal)
from emp
group by deptno;

����2. �μ����̺� sumsal �̶�� �÷��� �߰��Ͻÿ�!

alter table dept
add sumsal number(10);

����3. ���� dept ���̺� �߰��� sumsal �÷��� �ش� �μ���ȣ�� ��Ż�������� ���� �����Ͻÿ�!
merge into dept d
using (select deptno, sum(sal) ��Ż���� from emp group by deptno) e
on (e.deptno = d.deptno)
when matched then
update set d.sumsal = e.��Ż����;

select deptno, sumsal
    from dept;

���� 323. �μ���ȣ, �μ���ȣ�� �ο����� ����Ͻÿ�!
select deptno, count(*)
    from emp
    group by deptno;

���� 324. �μ����̺� cnt ��� �÷��� �߰��Ͻÿ�!
alter table dept
add cnt number(10);


���� 325. ���� dept ���̺� �߰��� cnt �÷��� �ش� �μ���ȣ�� �ο����� ���� �����Ͻÿ�!
merge into dept d
using( select deptno, count(*) �ο��� from emp group by deptno) e
on(d.deptno = e.deptno)
when matched then
update set d.cnt = e.�ο���;

select deptno, cnt from dept ;

���� : using ���� ����� ������������ ����� ��ġ ���̺�ó�� �� merge ������ ���ǰ� �ִ�.



