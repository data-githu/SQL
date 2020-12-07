058 ���� ���̺��� �����͸� �����ؼ� ����ϱ� 1(EQUI JOIN)
	" ������ �̿��ϸ� �ΰ� �̻��� ���̺���� �÷����� �ϳ��� ����� ��Ƽ� �� �� �� �ֽ��ϴ�."
	
���� : select * from dept;

Deptno : �μ���ȣ
Dname : �μ���
Loc : �μ���ġ

���� : �̸�, �μ���ġ�� ����Ͻÿ�!
select ename, loc
    from emp, dept;

���� : 14�� * 4�� = 56�� �� �Ǿ �� ������ ����Դϴ�.

->
select ename, loc
    from emp, dept
    where emp.deptno = dept.deptno;

���� 210. ������ SALESMAN�� ������� �̸��� ���ް� ������ �μ���ġ�� ����Ͻÿ�!
->
select ename, sal, job, loc
    from emp, dept
    where emp.deptno = dept.deptno and job = 'SALESMAN';

���� 211. ������ 2000�̻��� ������� �̸� ���ް� �μ���ġ�� ����Ͻÿ�!
->
select ename, sal, loc
    from emp, dept
    where emp.deptno = dept.deptno and sal >= 2000;

���� 212. ���� ������� �̸�, ����, �μ���ġ ���� �μ���ȣ�� ���� ����Ͻÿ�!
->
select ename, sal, loc,emp.deptno
    from emp, dept
    where emp.deptno = dept.deptno and sal >= 2000;

���� : emp.deptno ��� �ۼ������ν� emp ���̺� �ִ� �μ���ȣ�� ��������� �ۼ����־�� �մϴ�.
������ ���� �ʴ´ٰ� �÷��� �տ� ���̺���� ���� �ʴ� ������ ������ ������ ���ι��忡���� �÷��� �տ� ���̺���� �����ݴϴ�. ���̺��.�÷��� ���� �ۼ������ �˻��ӵ��� �� �������ϴ�.

Select e.ename, e.sal, d.loc, e.deptno
	From emp e, dept d
	Where e.deptno = d.deptno and e.sal >= 2000;
	
���� : emp�� e��� �ϰ� dept�� d��� ��Ī�� �־ ��Ī�� ����ؼ� �ڵ��� �ϸ� �� �� �����ϰ� ���ι����� �ۼ��� �� �ֽ��ϴ�.

���� 213. ������ 1000���� 3000 ������ ������� �̸��� ���ް� �μ���ġ�� ����Ͻÿ�!
->
select emp.ename, emp.sal, dept.loc
    from emp, dept
    where emp.deptno = dept.deptno and emp.sal between 1000 and 3000;

���� 214. �����ȣ�� 7788, 7902, 7369 ���� ����� �����ȣ�� �̸��� ���ް� �μ���ġ�� ����Ͻÿ�!
->
select emp.empno, emp.ename, emp.sal, dept.loc
    from emp, dept
    where emp.deptno = dept.deptno and emp.empno in (7788,7902,7369);

���� 215. �̸��� ù��° ö�ڰ� S�� �����ϴ� ����� �̸��� ���ް� �μ���ġ�� ����Ͻÿ�!

->
select e.ename, e.sal, d.loc
    from emp e, dept d
    where e.deptno = d.deptno and lower(substr(e.ename, 1, 1)) = 's';
							-> e.ename like 'S%'

���� : �ΰ� �̻��� ���̺��� �����ϱ� ���ؼ��� �ݵ�� ���������� where ���� ����ؾ��մϴ�.

���� 216. DALLAS���� �ٹ��ϴ� ������� �̸��� ������ �μ���ġ�� ����Ͻÿ�!
->
select e.ename, e.job, d.loc
    from emp e, dept d
    where e.deptno = d.deptno and d.loc = 'DALLAS';

���� 217. �μ���ġ, �μ���ġ �� ��Ż������ ����Ͻÿ�!
->
select d.loc, sum(e.sal)
    from emp e, dept d
    where e.deptno = d.deptno
    group by d.loc;

���� 218. �μ���ġ, �μ���ġ�� ��տ����� ����ϴµ� �Ҽ��� ���ϴ� �ȳ����� �ݿø��� �ϰ� �μ���ġ�� ��տ����� �����ͺ��� ����ϰ� �μ���ġ�� ��տ����� ��µɶ� õ������ �ο��Ͻÿ�!

->
select d.loc, to_char(round(avg(e.sal)),'999,999')
    from emp e, dept d
    where e.deptno = d.deptno
    group by d.loc
    order by to_char(round(avg(e.sal)),'999,999') desc;


