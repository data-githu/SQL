096 ������ ������ �ܼ��ϰ� �ϱ� 2(VIEW)

*view�� ���� 2����
	- �ܼ� view ���̺��� : 1��/ �׷��Լ� : ���Ծȵ�/ DML���� : ����  
	- ���� view ���̺��� : 2���̻�/ �׷��Լ� : ���Ե�/ DML���� : �Ұ��� �� ���� �ִ�.

���� 383. ename_loc�� ������ �߿� SCOTT �� �μ���ġ�� washington ���� �����Ͻÿ�!
update ename_loc
set loc = 'wasington'
where ename = 'SCOTT';

-> ������� �ʽ��ϴ�.


���� 375������ ���� emp403 view�� �����ϰ� ����� ���ÿ�!
create view emp403
as 
select job, sum(sal) as ��Ż
from emp
group by job;

update emp403
set ��Ż = 2000
where job = 'SALESMAN';

���� : ���� ���� ���պ�� �����͸� ������ �� ���µ� ���� ��Ż������ ���ŵȴٸ� �������� ����������ϱ� ������ ������ ���� ���� �ؼ��� �ȵ˴ϴ�.

���� 384. ���� �׵��� ���� view ���� Ȯ���Ͻÿ�!

select view_name, text
from user_views

���� :  ���� ���� ��ȸ�ϸ� VIEW �� ��������� ����� ���̺�� �� �� �ֽ��ϴ�.

*view ����
drop view emp809;
