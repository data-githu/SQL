045 ������ �м� �Լ��� �����͸� ���η� ����ϱ�(LISTAGG)

->
select deptno,
        listagg(ename, ', ') within group (order by ename asc)  �̸�
        from emp
        group by deptno;

���� : �̸��� ���η� ����ϴµ� �޸�(,)�� �����ؼ� ����ϰڴ�. �̸��� abcd ������ ���ĵǾ ��µǰ� �ִ�. listagg�� �ٸ� �м��Լ��� �ٸ��� group by ���� �ʿ��ϴ�.


���� 169. ����, �������� �ش��ϴ� ������� �̸��� ���η� ����Ͻÿ�!
-->
select job,
        listagg(ename, ', ') within group (order by ename asc) �̸�
        from emp
        group by job;


���� 170.  �Ʒ��� ���� ����Ͻÿ�!

ANALYST	    FORD(3000), SCOTT(3000)
CLERK	    ADAMS(1100), JAMES(950), MILLER(1300), SMITH(800)
MANAGER	    BLAKE(2850), CLARK(2450), JONES(2975)
PRESIDENT	KING(5000)
SALESMAN	ALLEN(1600), MARTIN(1250), TURNER(1500), WARD(1250)

->
select job,
        listagg(ename|| '('|| sal|| ')', ', ') within group (order by ename asc) 
        from emp
        group by job;



���� 171. ����, ���̺��� �ش��ϴ� �л����� �̸��� ���η� ����Ͻÿ�!

->
select age, listagg(ename, ', ') within group (order by ename asc) �̸�
    from emp12
    group by age;



���� 172. ��Ż縦 ����ϰ� ��Ż纰�� �ش��ϴ� �л����� �̸��� ����ϴµ� �̸� ���� ���̵� ���� ��µǰ� �ϰ� ���̰� ���� �л����� ��µǰ� �Ͻÿ�!

->
select telecom,
	listagg(ename || '(' || age || ')', ', ') within group (order by age desc)
	from emp12
	group by telecom;