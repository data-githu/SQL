051 ������ �м� �Լ��� ���� ����ϱ�(RATIO_TO_REPORT)

������ ������ ��ü �����߿����� ������ ��� �Ǵ� �� Ȯ���ϴ� �Լ�


select ename, sal, ratio_to_report(sal) over() as ����
	from emp
	where job='SALESMAN';