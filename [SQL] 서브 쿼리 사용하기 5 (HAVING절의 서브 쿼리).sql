
075 ���� ���� ����ϱ� 5(HAVING���� ���� ����)

*select ���忡�� ���������� �� �� �ִ� ��
select -> scalar subquery
from -> in line view
where
group by
having
order by -> scalar subquery

���� 280. JAMES ���� �� ���� ������ �޴� ������� �̸��� ������ ����Ͻÿ�!
select ename, sal
    from emp 
    where sal > (select sal from emp where ename = 'JAMES');

���� 281. ����, ������ ��Ż������ ����Ͻÿ�!
select job, sum(sal)
    from emp
    group by job;

����282. ���� ����� �ٽ� ����ϴµ� ������ SALESMAN�� ��Ż���޺��� �� ū �����鸸 ����Ͻÿ�!

select job, sum(sal)
    from emp
    where sum(sal) > (select sum(sal) from emp where job = 'SALESMAN')
    group by job;
   -> ���� �߻�

select job, sum(sal)
    from emp
    group by job
    having sum(sal) > (select sum(sal) from emp where job = 'SALESMAN');
    
���� : �׷��Լ��� ������ �ִ� ���� having �� �Դϴ�.
	where ���� �ۼ��ϸ� ������ �߻��մϴ�.

���� 283. �μ���ȣ�� �μ���ȣ�� �ο����� ����ϴµ� 10�� �μ���ȣ�� �ο������� �� ū�͸� ����Ͻÿ�!
select deptno, count(*)
    from emp
    group by deptno
    having count(*) > (select count(*) from emp where deptno = 10);