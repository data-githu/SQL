
054 ������ �м� �Լ��� ���� ��� ����ϱ� 3(GROUPING SETS)

"�������� ����ϴ� ������ �м� �Լ��Դϴ�."

���� : select deptno, sum(sal)
		From emp
		Group by grouping sets( deptno, () );
		                                 ��       ��
				 �μ���ȣ���� ����  ��ü����= rollup�� ���� ȿ��


���� 193. ����, ������ ��Ż������ ����ϴµ� �� �Ʒ��� ��ü ��Ż������ ��µǰ� �Ͻÿ�!
-> 
select job, sum(sal)
    from emp
    group by grouping sets(job,());

���� 194. �μ���ȣ�� ������ �̰� �� ���� �μ���ȣ�� ������ ��Ż������ ����Ͻÿ�!
->
select deptno, job, sum(sal)
    from emp
    group by deptno, job;

���� : select ���� �׷��Լ��� �Բ� ������ �÷����� �ݵ�� group by ���� ��ø� ����� ������ ���� �ʰ� ��µ� �� �ִ�.

���� 195. �μ���ȣ�� ������ ����ϰ� �� ���� �μ���ȣ�� ������ ��Ż������ ����ϰ� ���ÿ� �μ���ȣ�� ��Ż���޵� �߰��߰� ��µǰ� �Ͻÿ�!
->
select deptno, job, sum(sal)
    from emp
    group by grouping sets((deptno, job),(deptno));

���� 196. ���� ����� �� �Ʒ��� ��ü ��Ż������ ��µǰ� �Ͻÿ�!
->
select deptno, job, sum(sal)
    from emp
    group by grouping sets((deptno, job),(deptno),());

���� 197. �����ȣ, ����̸�, ������ ����ϴµ� �� �Ʒ��� ��ü ��Ż������ ����Ͻÿ�!
->
select empno, ename, sum(sal)
    from emp
    group by grouping sets(empno, ename, ());

���� : �����ȣ�� �ߺ����� �ʱ� ������ grouping sets �Լ��� ��ȣ�ȿ� grouping ����� �־ �׳� �ڱ� ������ ��µǰ� �ȴ�.
�ֳ��ϸ� ���� �ѰǾ��� �����ϱ� �����̴�. �� �Ѱ��� �����ϸ� �� ���� �ȴ�. �׸��� �� ���� () �� ��ü ��Ż������ ����ϴ� ���Դϴ�.


���� 198. �츮�� ���̺��� ��Ż�, �̸�, ���̸� ����ϴµ� �߰��߰� ��Ż纰 ��Ż���̰� ��µǰ� �Ͻÿ�!
->
select telecom, ename, sum(age)
    from emp12
    group by grouping sets((ename,telecom),(telecom));

���� 199. �Ի��� �⵵ (4�ڸ�), �Ի��� �⵵�� ��Ż������ ����ϴµ� ��ü ��Ż������ �� �Ʒ��� ��µǰ� �Ͻÿ�!
->
select to_char(hiredate,'RRRR'), sum(sal)
    from emp
    group by grouping sets((to_char(hiredate,'RRRR')),()); 

���� 200. ���� ����� �ٽ� ����ϴµ� �Ʒ��� ���� õ������ �ο��ؼ� ����Ͻÿ�!
->
select to_char(hiredate,'RRRR'), to_char(sum(sal),'999,999')
    from emp
    group by grouping sets((to_char(hiredate,'RRRR')),()); 

���� 201. �Ի��� �⵵(4�ڸ�), �μ���ȣ, �Ի��� �⵵�� �μ���ȣ�� ��Ż������ ����Ͻÿ�!

->
select to_char(hiredate, 'RRRR'), deptno, sum(sal)
    from emp
    group by to_char(hiredate, 'RRRR'), deptno;



���� 202. �Ի��� �⵵(4�ڸ�), �μ���ȣ, �Ի��� �⵵(4�ڸ�)�� �μ���ȣ�� ���� ����ϴµ� �߰��߰� �Ի��� �⵵(4�ڸ�)�� ��Ż������ ��µǰ� �ϰ� �� �Ʒ��� ��ü ��Ż������ ��µǰ� �Ͻÿ�!

 ->
select to_char(hiredate, 'RRRR'), deptno, sum(sal)
    from emp
    group by grouping sets((to_char(hiredate, 'RRRR'),deptno),(to_char(hiredate, 'RRRR')),());