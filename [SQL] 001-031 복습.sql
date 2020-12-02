[001-031 �����ð�]

	1. SELECT ��
	2. �Լ�
	- ������ �Լ� : ����, ����, ��¥, ��ȯ, �Ϲ�
	- ������ �Լ� : max, min, avg, sum, count

�����Լ� : upper, lower, initcap, substr, instr, length, lpad, rpad, trim, ltrim, rtrim, replace
�����Լ� : round, trunc, mod
��¥�Լ� : month_between, add_months, next_day, last_day
��ȯ�Լ� : to_char, to_number, to_date


���� 90. ������ SALESMAN �� ������� �̸��� ���ް� ������ ����ϴµ� ������ ���� ������� ����Ͻÿ�!
-> select ename, sal, job
    from emp
    where job='SALESMAN'
    order by sal desc;

���� 91. ������ SALESMAN �� �ƴ� ������� �̸��� �Ի��ϰ� ������ ����ϴµ� �ֱٿ� �Ի��� ������� ����Ͻÿ�!

-> select ename, hiredate, job
    from emp
    where job != 'SALESMAN'
    order by hiredate desc;

     * ���� :  select �÷��� - 3 (�������)
		 from ���̺�� - 1
		 where �˻����� - 2
		 order by ������ �÷��� - 4

���� 92. ������ 1000���� 3000������ ������� �̸��� ������ ����Ͻÿ�!

-> select ename, sal
    from emp
    where sal between '1000' and '3000';

���� 93. �̸��� ����ϰ� �� ���� �̸��� ù��° ö�ڸ� ����ϴµ� �ҹ��ڷ� ����Ͻÿ�!

-> select ename, lower(substr(ename,1,1))
    from emp;

���� 94. �츮�� ���̺��� �̸��� �̸����� ����ϴµ� �� ���� �̸��Ͽ��� @�� ���° ö������ ����Ͻÿ�!

-> select ename, email, instr(email, '@')
    from emp12;

���� 95. �̸��� �Ի����� ����ϴµ� �Ի��� �⵵�� 4�ڸ��� ����Ͻÿ�!

-> select ename, hiredate, to_char(hiredate, 'RRRR')
      from emp;

���� : �⵵ : RRRR, RR, YYYY, YY
	 �� : MM, MON
	 �� : DD
	 �ð� : HH, HH24
	 �� : MI
	 �� : SS
	 ���� : DAY, DY, D
	
	
* ��ȯ�Լ� : to_char �Լ�
 " ��¥ -> ����/ ���� -> ���� " 

select ename, hiredate, to_char(hiredate, 'MM')
	from emp;
	
���� 96. 11���� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�!

-> select ename, hiredate
    from emp
    where to_char(hiredate, 'MM') = '11';

���� 97. ���� 96���� to_char �̿����� ����  substr �� �����Ͻÿ�!

-> select ename, hiredate
    from emp
    where substr(hiredate,4,2) = '11';

* ��ȯ�Լ� : to_date �Լ� 

 " ��¥�� �� ��ȯ�ϴ� �Լ� "


���� : select ename, hiredate
	from emp
	where hiredate = '81/11/17';
	
	
	select ename, hiredate
		from emp
		where hiredate = to_date('81/11/17', 'RR/MM/DD');
		           ��
		��¥�� ������ ���� = ��¥
		
		where sal = 3000 ;  
		         ��
		������ ������ ����= ����

�� ���� : ��¥�� �����͸� �˻��� ���� �ݵ�� to_date �Լ��� ����� ���� �����մϴ�.

���� 98. 1981�⵵�� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�!

	1. to_char
	
-> select ename, hiredate
       from emp
       where to_char(hiredate,'RRRR') = '1981';

	2. to_date

-> select ename, hiredate
      from emp
      where hiredate between to_date('81/01/01', 'RR/MM/DD') and to_date('81/12/31','RR/MM/DD') ;
