
068 ���� �����ڷ� �����͸� ���Ʒ��� �����ϱ� 2(UNION)
"union�� union all �� ���� ������ �������ε� �������� union �� order by ���� ������� �ʾƵ� ������ �Ͻ������� �����մϴ�. �׸��� �ߺ��� �����͸� �ϳ��� ����մϴ�.

���� 257. �μ���ȣ, �μ���ȣ�� ��Ż������ ����ϴµ� �� �Ʒ��� ��ü��Ż������ ��µǰ� �ϰ� �μ���ȣ�� 10,20,30�� ������ �����ؼ� ��µǰ��Ͻÿ�!
->
select to_char(deptno) as deptno , sum(sal)
    from emp
    group by deptno
    union
select '��Ż :'as deptno, sum(sal)
    from emp;

���� : union �� �Ͻ������� ���� �۾��� �����ϱ� ������ ���� ���ĵ� ����� �� �ʿ䰡 ���ٸ� union all�� ����ϴ°� �� �˻� ���ɿ� �����ϴ�.

���� 259. �μ���ġ, �μ���ġ�� ������ ���� ����ϰ� �� �Ʒ��� ��ü��Ż ������ ����Ͻÿ�!
->
select d.loc, sum(sal)
    from emp e, dept d
    where e.deptno=d.deptno
    group by d.loc
    union all
select '��ü��Ż' as loc, sum(sal)
    from emp;

���� 260. ���� ����� �ٽ� ����ϴµ� ������ ABCD ������� �����ؼ� ��µǰ� �Ͻÿ�!
->
select d.loc, sum(sal)
    from emp e, dept d
    where e.deptno=d.deptno
    group by d.loc
    union
select '��ü��Ż' as loc, sum(sal)
    from emp;

���� : ������ �� �ʿ䰡 ������ union all�� ����ϰ� ������ �ʿ��ϸ� union�� ����մϴ�.


���� 261. ����, ������ �ִ����, �ּҿ���, ��տ���, �ο����� ����غ��ÿ�!
->
select job, max(sal), min(sal), avg(sal), count(*)
    from emp
    group by job;

���� 262. ��� ���̺��� �ִ����, �ּҿ���, ��տ���, ��ü�ο����� ����Ͻÿ�!
->
select max(sal), min(sal), avg(sal), count(*)
    from emp;

���� 263. ���� 261���� ����� ���� 262���� ����� ���Ʒ��� �����ؼ� ����Ͻÿ�!
->
select job, max(sal), min(sal), avg(sal), count(*)
    from emp
    group by job
union all
select '��ü :',max(sal), min(sal), avg(sal), count(*)
    from emp;
