046 ������ �м� �Լ��� �ٷ� �� ��� ���� �� ����ϱ�(LAG, LEAD)

"�ٷ� ������ ���� ������ �ϰų� �ٷ� �������� ���� ������ �� �� ����ϴ� �Լ�"

�� : select ename, sal, lag(sal,1) over (order by sal asc) as ����,
                             lead(sal,1) over (order by sal asc) as ������
	from emp;
    
	
���� 173. �̸�, �Ի���, �ٷ� ���� �Ի��� ����� �Ի���, �ٷ� ������ �Ի��� ����� �Ի��� ����Ͻÿ�!
->

select ename, hiredate, lag(hiredate, 1) over (order by hiredate asc) as ���Ի���,
                        lead(hiredate, 1) over (order by hiredate asc) as �����Ի���
        from emp;

