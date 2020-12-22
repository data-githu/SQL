082 ������ �Է�, ����, ���� �ѹ��� �ϱ�(MERGE)
"������ �Է°� ������ ������ �ѹ��� �����ϴ� ��ɾ� �̰� SQL Ʃ���� ���ؼ� ���� ���Ǵ� SQL"

����1 : �̸��� �μ���ġ�� ����Ͻÿ� 
select e.ename, d.loc
    from emp e, dept d
    where e.deptno = d.deptno;

����2 : ������̺� �μ���ġ �÷��� �߰��Ͻÿ�
alter table emp
add loc varchar2(10);

select ename, loc from emp;
	
����3: ��� ���̺� �߰��� �μ���ġ �÷��� �����͸� �ش� ����� �μ���ġ�� ���� �����Ͻÿ�!
merge into emp e
using dept d
on (e.deptno = d.deptno)
when matched then
update set e.loc=d.loc;

select ename, loc from emp;

���� : merge into �������� ������ Ÿ�� ���̺���� �ۼ��ϰ� 
	 using �������� �ҽ� ���̺���� �ۼ��Ѵ�.
	 on �������� Ÿ��� �ҽ� ���̺��� ������� �ۼ��Ѵ�.
	 when matched then ������ ������ update ���� �ۼ��Ѵ�.
	
���� 307. �츮�� ���̺� telecom_price �÷��� �߰��ϰ� �ش� �ڷ����� ������� ���� �����Ͻÿ�!
alter table emp12
add telecom_price number(10);

merge into emp12 e
using telecom_price t
on (t.telecom = e.telecom)
when matched then
update set e.telecom_price = t.price;

���� 308. �μ���ġ, �μ���ġ�� ��Ż������ ����Ͻÿ�!
select loc, sum(sal)
    from emp
    group by loc;

���� 309. �μ���ȣ, �μ���ȣ�� ��Ż������ ����Ͻÿ�!
select deptno, sum(sal)
    from emp
    group by deptno;

���� 310. ��� ���̺�� �޿� ������̺��� �����ؼ� �̸��� ���ް� ����� ����Ͻÿ�!
select e.ename, e.sal, s.grade
    from emp e, salgrade s
    where e.sal between s.losal and s.hisal;

���� 311. ��� ���̺� �޿���� �÷��� �߰��Ͻÿ�!
alter table emp
add grade number(10);

���� 312. ������̺� �߰��� grade �÷��� �ش����� �޿�������� ���� �����Ͻÿ�!
merge into emp e
using salgrade s
on (e.sal between s.losal and s.hisal)
when matched then
update set e.grade = s.grade;

���� 313. �μ��� �÷��� emp ���̺� �߰��ϰ� �ش� ����� �μ������� emp ���̺��� dname�� �����Ͻÿ�!
alter table emp
add dname varchar2(10);

merge into emp e
using dept d
on (e.deptno = d.deptno)
when matched then
update set e.dname = d.dname;

select ename, dname from emp;