
�Լ��� ���� : 
    1. ������ �Լ�
	2. ������ �Լ� : max, min, avg, sum, count

036 �ִ밪 ����ϱ�(MAX)

���� : �ִ������ ����Ͻÿ�!
-> select max(sal)
	from emp;

���� 112. ������ SALESMAN�� ������� �ִ������ ���Ͻÿ�!
-> select max(sal)
    from emp
    where job = 'SALESMAN';

037 �ּҰ� ����ϱ�(MIN)

���� 113. �츮�ݿ��� �ּ� ������ �л��� ���̸� ����Ͻÿ�!
-> select min(age)
    from emp12;

���� 114. ��Ż簡 sk�� �л��� �߿��� �ִ� ������ �л��� ���̸� ����Ͻÿ�!
-> select max(age)
     from emp12
     where upper(telecom) = 'SK'; 

-> select max(age)
	from emp12
	where lower(telecom) in ('sk','skt');
	
���� 115.  �μ���ȣ 30�� �ִ������ ����Ͻÿ�
-> select max(sal)
    from emp
    where deptno = 30;


-> select deptno, max(sal)
		��           ��
		������, �Ѱ��� ����Ϸ��� �ؼ� �����߻�
    from emp
    where deptno = 30;


-> select deptno, max(sal)
    from emp
    where deptno = 30
    group by deptno;

���� : group by deptno �� �ϸ� ���� �� ��������  deptno �� grouping ���ش�.

���� 116. (������ ������ ����) ����, ������ �ִ������ ����ϴµ� ������  SALESMAN�� ����Ͻÿ�!

->select job, max(sal)
    from emp
    where job = 'SALESMAN'
    group by job;

