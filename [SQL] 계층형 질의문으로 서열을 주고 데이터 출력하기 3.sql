091 ������ ���ǹ����� ������ �ְ� ������ ����ϱ� 3

������ ���ǹ��� ¦�� �Լ��� sys_connect_by_path �� �̿��ϸ� listagg�� ����� ��ó�� ���η� ����� ����� �� �ֽ��ϴ�.

���� : select ename, sys_connect_by_path(ename, ',')  as path
		from emp
		start with ename = 'KING'
		connect by prior empno = mgr;

���� 336. ���� ������� �տ� / �� �Ʒ��� ���� �߶�����ÿ�!
select ename, ltrim(sys_connect_by_path(ename, '/'),'/')  as path
		from emp
		start with ename = 'KING'
		connect by prior empno = mgr;

�� �߿伳�� : ������ ���ǹ��� �ۼ��� �� �ݵ�� �˾ƾ��ϴ� �ΰ��� ¦�� Ű���� 
	1. order by ���� siblings
	2. ������ ���η� ����ϴ� sys_connect_by_path
    