
032 �Ͻ��� �� ��ȯ �����ϱ�

* to _number �Լ� 

"���ڷ� �� ��ȯ�ϴ� �Լ�"

������ 3000�� ����� �̸��� ������ ����Ͻÿ�!

select ename, sal
	from emp
	where sal = 3000; 
		  ��      ��
	      ������   ������
	
������ : varchar2
������ : number
��¥�� : date

select ename, sal
	from emp
	where sal = '3000'; 
-> �������ε��� ����� �ȴ�. 

���� : �ٸ� database ����Ʈ������� ������ ���鼭 ������ �ȵȴ�.
oracle�� ������ �ϰ� ��ü������ �������� ���������� ��ȯ�����ش�.

���� 99. (���ɽð� ����) 1981�⵵�� �Ի��� ������� �̸��� �Ի��ϰ� �Ի��� �⵵�� ����ϴµ� ���� �ֱٿ� �Ի��� ������� ����Ͻÿ�!

-> select ename, hiredate, to_char(hiredate,'RRRR')
     from emp
     where to_char(hiredate,'RRRR') = '1981'
     order by hiredate desc;


��ȯ�Լ� :   1. to_char : ���ڷ� ����ȯ�ϴ� �Լ�
			2. to_number : ���ڷ� ����ȯ�ϴ� �Լ�
			3. to_date : ��¥�� ����ȯ�ϴ� �Լ�
			
			
select ename, sal
	from emp
	where sal = '3000';
	

create table emp100
(ename varchar(10),
	sal varchar(10));
	
insert into emp100 values('scott', '2000');
insert into emp100 values('smith', '3000');


commit;


select ename, sal
	from emp100
	where sal = 2000;
		����    ����
		
���� : where ���� �˻������� ���� �� ������ ������ ���� �÷��� �����͸� �˻��� ���� ���ڷ� �˻��ϰ� ���� �÷��� �����͸� �˻��� ���� ���ڷ� �˻��ؾ��Ѵ�.
���࿡ �������ε� ���������� �˻��ϰų� �������ε� ���������� �˻��� ��� ����Ŭ�� ������ �߻���Ű�� ������ �˻� ������ �������� �˴ϴ�. 
�׷��Ƿ� �ݵ�� �˻������� ���� �� ���� ������ ������� �մϴ�.
