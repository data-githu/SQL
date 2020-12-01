019 ���ڿ��� Ư�� ö���� ��ġ ����ϱ�(INSTR)

Ư�� ö���� �ڸ��� ����ϴ� �Լ�
���� : select instr('smith','m')
		from dual;
		
���� : �츮�� ���̺��� �̸����� ����ϰ� �� ���� �̸��Ͽ��� @�� ���° �ڸ��� �ִ��� ����Ͻÿ�!
-> select email, instr(email,'@')
	from emp12;

���� : �츮�� ���̺��� �̸��Ͽ��� @ �տ������� ö�ڸ� �߶󳻽ÿ�!
-> select email, substr(email,1,instr(email,'@')-1)
		from emp12;
		
		
���� 70. (���ɽð�����) �̸����� ����ϰ� �� ���� �̸����� �������� ����Ͻÿ�!
-> select email, substr(substr(email,instr(email,'@')+1),1,instr(substr(substr(email,instr(email,'@')+1),1),'.')-1)
    from emp12;


020 Ư�� ö�ڸ� �ٸ� ö�ڷ� �����ϱ�(REPLACE)
���� : replace (�÷���, ��ü�� ����, ��ü�� ����)

Ư�� ö�ڸ� �ٸ� ö�ڷ� �����ϴ� �Լ�

���� : select replace('smith','m','k')
		from dual;
		
���� 71. ��� ���̺��� �̸��� ������ ����ϴµ� ������ ����� �� ���� 0�� *�� ����Ͻÿ�!
-> select ename, replace(sal,'0','*')
	from emp;

���� 72. �츮�� ���̺��� �̸��� ����ϰ� �� ���� �̸��� �ι�° ö�ڸ� ����Ͻÿ�!
-> select ename, substr(ename, 2, 1)
	from emp12; 
	
	
���� 73. �ƻ꺴�� ������ �����Ͻÿ�!
-> select ename, replace(ename,substr(ename,2,1),'*')
	from emp12;
	
���� 74. ���üֹ� �����͸� �Է��ϰ� ����*�̷� ��µǰ� �Ͻÿ�! 
(������ �ٽá��̸��� 2������ ���� ��ż�)
alter table emp12
modify ename varchar2(30);

insert into emp12(ename,age)
values('���üֹ�',27);
commit;
select * from emp12;
------------------------------------------------------
update emp12
set email = 'icecream2@naver.com'
where ename='�̽ż�';

commit;

-> select ename, replace(ename,substr(ename,-2,1),'*')
	from emp12;

021 Ư�� ö�ڸ� N�� ��ŭ ä���(LPAD, RPAD)

�׻� ������ �ڸ����� �����ϱ� ���ؼ� �ʿ��� �Լ�

���� : lpad(�÷���, ��ü �ڸ���, ä��������)

���� : select sal, lpad(sal,10,'*')
        from emp;

select sal, rpad(sal,10,'*')
        from emp;
        
���� : lpad(sal,10,'*') �� ���� ������ ����ϴµ� ��ü�� 10�ڸ��� ��� �������� ����ϰ� ���� �����ڸ��� *�� ä���ְڴ� ��� ���̴�. 
-> l : left/ r : right



022 Ư�� ö�� �߶󳻱�(TRIM, RTRIM, LTRIM)

������ �߶󳾶� ���� ����ϴ� �Լ�
���鶧���� ������ �˻��� �ȵǴ� ��찡 �����ֱ� ������ trim �Լ��� ���� ����մϴ�.

���� 75. ��⵵ ��� �л��� �̸��� �ּҸ� ����Ͻÿ�! ���ϵ� ī�带 ���ʿ� ������� ���� ���ʿ��� ����ؼ� ����Ͻÿ�!

-> select ename, address
	from emp12
	where trim(address) like '��⵵%';
	
ltrim : ���ʿ� �ִ� ���� ����
rtrim : �����ʿ� �ִ� ���� ����
trim : ���ʿ� �ִ� ���� ����


���� 76. ��������а��� ������ �л��� �̸��� ���̿� ������ ����Ͻÿ�!
-> select ename, age, major
	from emp12
where trim(major) like '�������%';