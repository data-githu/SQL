*�����͸� �����ؼ� ����ϴ� ��� 2����
	1. ���� : �����͸� �翷���� �����ؼ� ����ϴ� ���
	2. ���� ������ : �����͸� ���Ʒ��� �����ؼ� ����ϴ� ���
			1) union all
			2) union
			3) intersect
			4) minus
            
���� : union all �� ���� �������� ����� �Ʒ��� �������� ����� �ϳ��� ���ļ� ����ϰ� �ִ�. 
���� �����ڸ� ����� �� ���ǻ����� ������ ����.

	1. ���տ����� �� �Ʒ��� �������� �÷��� ������ �����ؾ��մϴ�.
	2. ���տ����� �� �Ʒ��� �������� �÷��� ������ Ÿ�Ե� �����ؾ��մϴ�.
	3. ���տ����� �� �Ʒ��� �������� �÷��� �÷����� �����ؾ��մϴ�.
	4. order by�� ���� �Ʒ��� �������忡�� �ۼ��� �� �ֽ��ϴ�.


067 ���� �����ڷ� �����͸� ���Ʒ��� �����ϱ� 1(UNION ALL)
���� : ����, ������ ��Ż������ ����Ͻÿ�!
select job, sum(sal)
    from emp
    group by job;

���� :  ��ü ��Ż������ ����Ͻÿ�!
select sum(sal)
    from emp;

���� : ���� SQL�� �ϳ��� ���ļ� �����Ͱ� ���Ʒ��� ��µǰ� �Ͻÿ�!
->
select job, sum(sal)
    from emp
    group by job
    union all
select '��ü��Ż : ' as job, sum(sal)
    from emp;


���� 251. �μ���ȣ, �μ���ȣ�� ��Ż������ ����ϴµ� �� �Ʒ��� ��ü��Ż������ ��µǰ� �Ͻÿ�!
->
select to_char(deptno), sum(sal)
    from emp
    group by deptno
    union all
select '��Ż���� :' as deptno,sum(sal)
    from emp;


���� 252. �Ի��� �⵵ (4�ڸ�), �Ի��� �⵵�� ��Ż������ ����Ͻÿ�!
->
select to_char(hiredate, 'RRRR'), sum(sal)
    from emp
    group by to_char(hiredate,'RRRR');


���� 253. �Ի��� �⵵(4�ڸ�), �Ի��� �⵵�� ��Ż������ ����ϴµ� �ǾƷ��� ��ü ��Ż������ ��µǰ� �Ͻÿ�!
->
select to_char(hiredate, 'RRRR'), sum(sal)
    from emp
    group by to_char(hiredate,'RRRR')
    union all
select '��Ż���� :' as hire_year, sum(sal)
    from emp;

���� : union all �� �Ʒ��� �������� �÷��� ������ ���� �����ؾ��ϰ� �÷��� ������ �����ؾ��ϰ� ������ ������ �����ؾ��մϴ�.

���� 254. �츮�� ���̺��� ��Ż�, ��Ż纰 �ο����� ����Ͻÿ�!
->
select telecom, count(*)
    from emp12
    group by telecom;

���� 255. ���� ������� ��ü��Ż�� �� �Ʒ��� ��µǵ��� �Ͻÿ�!
->
select telecom, count(*)
    from emp12
    group by telecom
	union all
select '��ü :' as telecom, count(*)
    from emp12;

���� 256. ���� 253���� ����� �����ؼ� ����Ͻÿ�!
->
select to_char(hiredate, 'RRRR')as hire_year, sum(sal)
    from emp
    group by to_char(hiredate,'RRRR')
    union all
select '��Ż :' as hire_year, sum(sal)
    from emp
    order by hire_year asc;
