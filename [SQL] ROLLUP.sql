052 ������ �м� �Լ��� ���� ��� ����ϱ� 1(ROLLUP)

"������ ����� �� �Ʒ��ʿ� ����ϰ� ���� �� ����ϴ� �Լ�"

���� : �μ���ȣ, �μ���ȣ�� ��Ż������ ����Ͻÿ�!
->
select deptno, sum(sal)
    from emp
    group by deptno;

���� : ����, ������ ��Ż������ ����Ͻÿ�!
->
select job, sum(sal)
    from emp
    group by job;

���� : ����, ������ ��Ż������ ����Ͻÿ�! ���� �Ʒ� ��Ż������ �հ踦 ����Ͻÿ�!
->
select job, sum(sal)
    from emp
    group by rollup(job);