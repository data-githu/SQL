013 �� ������ ���� 4(IS NULL)

NULL ���� ��ȸ�� �� ����ϴ� �����ڰ� is null �Դϴ�.
null ���� �����Ͱ� ���� ���� �Ǵ� �� �� ���� ��(unknown) �Դϴ�.

���� : �̸��� ���ް� Ŀ�̼��� ����ϼ���!
-> select ename, sal, comm
	from emp;


���� 40. Ŀ�̼��� null �� ������� �̸��� Ŀ�̼��� ����Ͻÿ�!
-> select ename, comm
	from emp
	where comm is null ;



���� : comm = null  �δ� ��ȸ�� �� ����. 
�ֳ��ϸ� null�� �� �� ���� ���̹Ƿ� �� �������� = �δ� ��ȸ�� �� ����. 
��Ÿ �� �������� is null �� ����Ͽ��� �Ѵ�.

���� 41. Ŀ�̼��� null�� �ƴ� ������� �̸��� Ŀ�̼��� ����Ͻÿ�!
-> select ename, comm
	from emp
	where comm is not null ;



���� 42. mgr(�������� �����ȣ)�� null�� ����� �̸��� ������ ����Ͻÿ�!
-> select ename, job, mgr
	from emp
	where mgr is null;


���� : ����(president)�� ������ ��ȣ(mgr)�� ����.
	
���� 43. �����ȣ, �̸�, ������ ��ȣ�� ����Ͻÿ�!
-> select empno, ename, mgr
	from emp; 

014 �� ������ ���� 5(IN)
where ���� �˻����ǿ��� �������� ���� ���� ���� in�� ����ؾ� �մϴ�.

���� : �����ȣ�� 7788, 7902 �� ������� �����ȣ�� �̸��� ��ȸ�Ͻÿ�!
-> select empno, ename
	from emp
	where empno in (7788, 7902) ; 

���� : = �����ڴ� �ϳ��� ���� ���� �� �ֽ��ϴ�. 
�������� ���� ���� ���� in�� ����մϴ�. 

���� 44. ������ SALESMAN, ANALYIST �� ������� �̸��� ������ ����Ͻÿ�!
-> select ename, job
	from emp
	where job in ('SALESMAN', 'ANALYST');

���� 45. ������  SALESMAN, ANALYST �� �ƴ� ������� �̸��� ������ ����Ͻÿ�!
-> select ename, job
	from emp
	where job not in ('SALESMAN', 'ANALYST');
	
���� 46. ������ SALESMAN�� �ƴ� ������� �̸��� ������ ����Ͻÿ�!
-> select ename, sal, job
	from emp
	where job != 'SALESMAN';
	
���� 47. ���� ����� ������ ���� ������� ����Ͻÿ�!
-> select ename, sal, job
	from emp
	where job != 'SALESMAN'
	order by sal desc ; 

���� 48. �츮�� ���̺��� �̸��� ���̸� ����ϴµ� ���̰� ���� �л����� ����Ͻÿ�!
-> select ename, age, major
	from emp12
	order by age desc;
	
���� 49. �̸��� ���̿� �ּҸ� ����ϴµ� 30�� �̻��� �л��鸸 ����Ͻÿ�!
-> select ename, age, address
	from emp12
	where age >= 30 ;
	
���� 50. ������ �达�� �л����� �̸��� ��Ż縦 ����Ͻÿ�!
-> select ename, telecom
	from emp12
	where ename like '��%';
	
���� 51. ������ ��踦 �����ϰ� �ִ� �л����� �̸��� ������ ����Ͻÿ�!
-> select ename, major
	from emp12
	where major like '%���%';
	
���� : like �����ڸ� ����� �� Ư�� �ܾ �����ϰ� �ִ� �����͸� �˻��Ϸ��� '%�ܾ�%' ��� �Է��ϸ� �˴ϴ�.

���� 52. �츮�ݿ��� gmail�� ����ϴ� �л����� �̸��� ������ ����Ͻÿ�!
-> select ename, email
	from emp12
	where email like '%gmail%';
	
���� 53. ���̰� 27���� 34 ������ �л����� �̸��� ���̸� ����Ͻÿ�.
-> select ename, age
	from emp12
	where age between 27 and 34;
	
	where age >= 27 and age <=34;
	
���� 54. ���̰� 27���� 34 ���̰� �ƴ� �л����� �̸��� ���̸� ����Ͻÿ�!
-> select ename, age
	from emp12
	where age not between 27 and 34;
	
���� 55. �ּҰ� ��⵵�� �л����� �̸��� ���̿� �ּҸ� ����Ͻÿ�!
-> select ename, age, address
	from emp12
	where address like '���%';
	
���� 56. ��Ż簡 sk, lg �� �л����� �̸��� ��Ż縦 ����Ͻÿ�!
-> select ename, telecom
	from emp12
	where telecom in  ('sk', 'lg', 'skt', 'SK');
	
���� 57. ���￡�� ��� �л����� �̸��� ���̿� ������ ����ϴµ� ���̰� ���� �л����� ����Ͻÿ�!
-> select ename, major, age
	from emp12
	where address like '����%'
	order by age desc;
	
���� 58. �̸����� gmail �� naver�� �ƴ� �л����� �̸��� �̸����� ����ϼ���!
-> select ename, email
	from emp12
	where email not like '%gmail%';
	
	
���� 59. �Ʒ��� ���� ����� ��µǰ� �Ͻÿ�!

���ֿ� �л��� ���̴� 44�� �Դϴ�.
�Ǽ��� �л��� ���̴� 36�� �Դϴ�.
	:
	:
	
-> select ename || ' �л��� ���̴� ' || age || '�� �Դϴ�.'
	from emp12
	order by age desc; 
	
	
015 �� ������ ����(AND, OR, NOT)

����Ŭ �������� ������ 3�����Դϴ�.
	1. ��������� : * / + -
	2. �񱳿����� : >, <, >=, <=, !=, <>, ^=
	��Ÿ �񱳿����� : between and
				   like
				   in
				   is null
	3. �������� :  and, or, not


���� : ������ SALESMAN�̰� ������ 1200 �̻��� ������� �̸��� ���ް� ������ ����Ͻÿ�!
-> select ename, sal, job
	from emp
	where job = 'SALESMAN' and sal >= 1200;
	
	
���� : True and True �̸� True ���� ����� ����� �˴ϴ�.
	 False and True �̸� False ���� ����� ����� �ȵ˴ϴ�.
	 False or True �̸� True ���� ����� ����� �˴ϴ�.
	
	
���� 60. ������ SALESMAN �̰ų� ANALYST �� ������� �̸��� ���ް� ������ ����Ͻÿ�!

-> select ename, sal, job
	from emp
	where job = 'SALESMAN' or job = 'ANALYST' ;
	
	where job in ('SALESMAN', 'ANALYST');
	
���� 61. ������ �达, �̾��� �ƴ� �л����� �̸��� ����Ͻÿ�!

-> select ename
	from emp12
	where ename not like '��%' and ename not like '��%';

���� 62. �̸����� gmail �� naver �� �ƴ� �л����� �̸��� �̸����� ����Ͻÿ�!
-> select ename, email
	from emp12
	where email not like '%gmail%' and email not like '%naver%';
	

