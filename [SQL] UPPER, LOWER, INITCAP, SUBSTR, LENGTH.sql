016 ��ҹ��� ��ȯ �Լ� ����(UPPER, LOWER, INITCAP)

�Լ���? � Ư�� ����� ������ ���� �ڵ��� ����

�Է°� -> �Լ� -> ��°�

�Լ��� ����ϴ� ������? �Լ��� �̿��ϸ� �� �� ������ �����͸� �˻��� �� �ִ�.

�� : ��ȭ �ܿ�ձ����� elsa �� ���� ���ñ� anna�� ���� ���ñ�?
	�츮�� �л����� ���� ���� ���� ��Ż簡 ����ΰ�?

�Լ��� ���� 2����?
	1. ������ �Լ� : 
	- ���� : upper(�빮�ڷ� ���), lower(�ҹ��ڷ� ���), initcap(ù��° ö�ڴ� �빮�ڷ� ����ϰ� �������� �� �ҹ��ڷ� ����ϴ� �Լ�)
	- ����
	- ��¥
	- ��ȯ
	- �Ϲ�
	2. ������ �Լ� : max, min, avg, sum, count, var, stddev

���� : select upper(ename), lower(ename), initcap(ename) 
		from emp;
		
���� 63. �츮�� ���̺��� ��Ż簡 sk�� ���õ� ��Ż��̸� �� �л��� �̸��� ��Ż縦 ����Ͻÿ�!
-> select ename, telecom
	from emp12
	where upper(telecom) like '%SK%';



017 ���ڿ��� Ư�� ö�� �����ϱ�(SUBSTR)

���� : select ename, substr (ename, 1, 2)
		from emp12;
		
���� 64. ������ ��, ��, ������ �л����� �̸��� ���̸� ����Ͻÿ�. (like ������)
-> select ename, age
	from emp12
	where substr(ename,1,1) in ('��', '��', '��');
	
���� : select ename, substr(ename,1,1)
		from emp12;

���� : ������ �̾��� �л����� �̸��� ����Ͻÿ�
-> select ename
	from emp12
	where substr(ename,1,1) = '��';


018 ���ڿ��� ���̸� ����ϱ�(LENGTH)


ö���� ���̸� ����ϴ� �Լ�

select ename, length(ename)
	from emp;
	
	
���� 65. �츮�� ���̺��� �̸����� ����ϴµ� �̸��� ö���� ���̸� ����ϴµ� �̸��� ö���� ���̰� ���� ��ͺ��� ����Ͻÿ�!

->select ename, email, length(email)
	from emp12
	order by length(email) desc;
	
���� 66. emp ���̺��� ename�� ����ϰ� �� ���� ename�� ù��° ö�ڸ� ����Ͻÿ�!
-> select ename, substr(ename,1,1)
	from emp; 
	
���� 67. ���� ����� �ٽ� ����ϴµ� �̸��� ù��° ö�ڸ� �ҹ��ڷ� ����Ͻÿ�!
->select ename, lower(substr(ename, 1,1))
	from emp;


���� 68. �Ʒ��� ����� initcap �������� upper�� lower, substr, ||�� ����ؼ� ����Ͻÿ�!
select initcap(ename)
	from emp;
	
	
-> select 
substr(upper(ename), 1, 1) || substr(lower(ename),2,(length(ename)-1))
from emp;

���� : substr(ù��° ���ڰ�, �ι�° ���ڰ�, ����° ���ڰ�)
substr �ۼ��� ����° ���ڰ��� �ƹ��͵� ���� ������ ������ �д´�.