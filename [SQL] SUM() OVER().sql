050 ������ �м� �Լ��� ���� ������ ����ϱ�(SUM OVER)

" �����͸� �����ؼ� �հ��ϴ� ������ �м� �Լ�"

���� : �����ȣ, �̸�, ����, ������ ����ġ�� ����Ͻÿ�!

select empno, ename, sal, sum(sal) over (order by empno asc)  ����ġ
	from emp;
	
���� 182. �̸�, ����, ������ ����ġ�� ����Ͻÿ�~

    select ename, age, sum(age) over (order by ename asc) ����ġ
	from emp12;
	
���� 183. ����, �̸�, ����, ������ ����ġ�� ����ϴµ� �������� ���� �����Ǿ ��µǰ� �Ͻÿ�!

select job, ename, sal, sum(sal) over (partition by job order by sal asc) ����ġ
	from emp;

���� 184. ��Ż�, �̸�, ����, ������ ����ġ�� ����ϴµ� ������ ����ġ�� ��Ż纰�� ���� �����Ǿ ��µǰ� �Ͻÿ�!
->
select telecom, ename, age, sum(age) over (partition by telecom order by ename asc) ����ġ
    from emp12;
