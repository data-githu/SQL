094 �ӽ� ���̺� �����ϱ�(CREATE TEMPORAY TABLE)
"�����͸� ������ database �� �������� �ʰ� �ӽ÷� �����ϴ� ���̺�"

������ �߿��� ������ ������ �ʿ�� ���� ���� ��� �׽�Ʈ�� ���ؼ� �� �����Ͷ���� �ƴϸ� ���� ���縸 �ʿ��ϰ� ���߿��� �ʿ����� ���� �����Ͱ� �ִµ� �� �����͸� ��� ������ �� ����ϴ� ���̺��� �ӽ� ���̺��Դϴ�.

*�ӽ����̺��� ���� 2����
	1. on commit delete rows �ɼ� : �����͸� commit �� �� ������ ����
	2. on commit preserve rows �ɼ� : �����͸� ������ ������ �α׾ƿ� �� �� ������ ����

����1 : 
create global temporary table emp700
	(empno number(10),
	ename varchar2(10),
	sal number(10) )
	on commit delete rows;
	
insert into emp700
select empno, ename, sal
from emp;
	
select * from emp700;
commit;

select * from emp700;


����2 : 
create global temporary table emp800
	(empno number(10),
	ename varchar2(10),
	sal number(10) )
	on commit preserve rows;
	
	insert into emp800
	select empno, ename, sal
	from emp;
	
select * from emp800;
commit;

select * from emp800;


����3 : 

create global temporary table num1_9
(num1 number(10))
on commit preserve rows;

insert into num1_9
select level 
from dual
connect by level <=9;


create global temporary table num2_9
(num2 number(10))
on commit preserve rows;

insert into num2_9
select level 
from dual
connect by level <=9;

select num1|| 'x'|| num2|| '='|| num2*num1
    from num1_9, num2_9;
