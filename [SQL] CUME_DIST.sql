
044 ������ �м� �Լ��� ������ ���� ����ϱ�(CUME_DIST)


���� : select ename, sal, cume_dist() over(order by sal desc) ����
	from emp;
	
	
���� 168. ���� ������� �Ҽ��� ����°������ ��µǰ� �ݿø� �Ͻÿ�!
->
select ename, sal, round(cume_dist() over(order by sal desc),3) ����
    from emp;