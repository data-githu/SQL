063 ���� ���̺��� �����͸� �����ؼ� ����ϱ� 5(USING��)
->
select e.ename, d.loc
    from emp e join dept d
    using (deptno);

���� 246. ������ SALESMAN�� ������� �̸��� ���ް� ����, �μ���ġ�� ����ϴµ� USING ���� ����� ���ι������� �����Ͻÿ�!
->
select e.ename, e.sal, e.job, d.loc
    from emp e join dept d
    using(deptno)
    where job = 'SALESMAN';