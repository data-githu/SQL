
034 IF���� SQL�� �����ϱ� 1(DECODE)
"if���� SQL�� ������ �� ����ϴ� �Լ�"
���࿡ �������� �������� ��� �ൿ�϶� ��� ��ǻ�� ���α׷����� �ϴ� ���ε� 

���� : select ename, sal, deptno, decode (deptno, 10, 5600, 20,4500, 0) as ���ʽ�
		from emp;
		
���� :  �μ���ȣ�� 10���̸� 5600�� ����ϰ� �μ���ȣ�� 20���̸� 4500�� ����ϰ� ������ �μ���ȣ�� 0�� ����϶�!

���� 103. �̸�, ����, ����, ���ʽ��� ����ϴµ� ���ʽ��� ������ SALESMAN �̸� 4500�� ����ϰ� ������  ANALYST�� 2400�� ����ϰ� ������ ������ 0�� ����Ͻÿ�!

-> select ename, sal, job, decode (job, 'SALESMAN', 4500, 'ANALYST', 2400 , 0) as ���ʽ�
	from emp;

���� 104.  �̸�, �Ի��ѳ⵵ 4�ڸ��� ����Ͻÿ�!
-> select ename, to_char(hiredate,'RRRR')
	from emp;
	
���� 105. �̸�, �Ի��ѳ⵵, ���ʽ��� ����ϴµ� ���ʽ��� �Ի��� �⵵�� 1980�� �̸� 5000�� ����ϰ� 1981�̸� 4000�� ����ϰ� ������ �⵵�� 0���� ����Ͻÿ�!

-> select ename, to_char(hiredate,'RRRR'), decode(to_char(hiredate,'RRRR'), '1980', 5000, '1981', 4000, 0) as ���ʽ�
    from emp;


�߿伳�� : decode�� ��ȣ(=) �񱳸� �����ϱ� ������ ���࿡ �ε�ȣ �񱳸� �Ϸ��� case���� ����ؾ��Ѵ�.


035 IF���� SQL�� �����ϱ� 2(CASE)


���� 106. �̸�, ����, ���ʽ��� ����ϴµ� ���ʽ��� ������ 4000�̻��̸� 500�� ����ϰ� ������ 2000�̻��̸� 300�� ����ϰ� ������ ������� �׳� 0�� ����Ͻÿ�!
-> select ename, sal, case when sal>=4000 then 500 when sal>=2000 then 300 else 0 end   as ���ʽ�
      from emp;

���� 107. �̸�, ����, �μ���ȣ, ���ʽ��� ����ϴµ� ���ʽ��� �μ���ȣ�� 10���̸� 500�� ����ϰ� �μ���ȣ�� 20�̸� 300�� ����ϰ� ������ �μ���ȣ�� 0�� ����Ͻÿ�!

-> select ename, sal, deptno, case when deptno = 10 then 500 when deptno = 20 then 300 else 0 end as ���ʽ�
    from emp;


���� 108. �츮�� ���̺��� �̸��� ����ϰ� �׿��� ���ʽ��� ����ϴµ� �̸��� ö�ڰ� 3�����̸� ���ʽ� 7000�� ����ϰ� �̸��� ö�ڰ� 2���ڸ� ���ʽ��� 5000�� ����ϰ� �̸��� ö�ڰ� 4�����̸� ���ʽ��� 4000�� ����Ͻÿ�!

-> select ename, case when length(ename) = 4 then 4000 when length(ename) = 3 then 7000 when length(ename) = 2 then 5000 end as ���ʽ�
    from emp12;


���� 109. �츮�� ���̺�� �̸� 3���ڷθ� �̸��� ��� ���ڸ� *�� ����Ͻÿ�!

	1. �̸��� ö���� ������ 3���ڿ� 2���ڴ� �Ʒ��� SQL�� ����
-> select replace(ename, substr(ename, 2, 1), '*')
	from emp12;

	2. �̸��� ö���� ������ 4���ڸ�
->  select replace(ename, substr(ename, -2, 1), '*')
	from emp12;
	
���� 110. �츮�� ���̺��� �̸��� ö���� ������ ������� �ϰ������� �̸��� *�� �Ʒ��� ���� ��µǰ� �Ͻÿ�!
-> select ename, case when length(ename) = 4 then replace(ename, substr(ename, -2, 1 ), '*') 
				  when length(ename) = 3 then replace(ename, substr(ename, 2,1), '*') 
				  else replace(ename, substr(ename, 2,1), '*') end
     from emp12;

���� 111. emp(���) ���̺��� �̸��� ����ϰ� �Ի��� ������ ����ϴµ� �Ի��� ������ ��ȭ��������� ������ ����Ͻÿ�!
-> select ename, hiredate, to_char(hiredate, 'day')
	from emp
	 order by to_char(hiredate-1,'d') asc;
