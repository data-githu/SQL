
079 ������ �����ϱ�(UPDATE)

"�����͸� �����ϴ� SQL��"

���� : update emp
		set sal = 0
		where ename = 'SCOTT';

rollback; -> ���� �ߴ� �۾��� ����ϴ� ����

���� 301. KING�� ������ 9000���� �����Ͻÿ�!
update emp
    set sal = 9000
    where ename = 'KING';

commit; -> ���ݱ��� ������ ��� �۾��� �� database�� ������ �����ϰڴٴ� ����
		

���� 302. ������ SALESMAN�� ������� Ŀ�̼��� 9500���� �����Ͻÿ�!
update emp
    set comm = 9500
    where job = 'SALESMAN';