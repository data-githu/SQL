
*��¥ �Լ�
	1. months_between
	2. add_months
	3. next_day
	4. last_day


026 ��¥ �� ���� �� ����ϱ�(MONTHS_BETWEN)

 �� ��¥

��¥ - ���� = ��¥
��¥ + ���� = ��¥
��¥ - ��¥ = ����


select sysdate
from dual;

select ename, sysdate - hiredate
	from emp;

���� 80. ���� ������� �Ҽ��� ���ϴ� �ȳ����� �ݿø��Ͻÿ�.
-> select ename, round(sysdate - hiredate)
	from emp;
	
���� 81. �̸�, �Ի��� ��¥���� ���ñ��� �� ���� �ٹ��ߴ��� ����Ͻÿ�!
-> select ename, round(round((sysdate - hiredate)/7))
	from emp;


	
���� 82. �̸�, �Ի��� ��¥���� ���ñ��� �� �� �� �ٹ��ߴ��� ����Ͻÿ�!
-> select ename, months_between(sysdate, hiredate)
	from emp;
���� : months_between(�ֽų�¥, ������¥)
	 ��¥�� ��¥ ������ �������� ���
	
���� 83. �Ʒ��� ���� ����� ����Ͻÿ�!

KING �� 467 ���� �ٹ��߽��ϴ�.

-> select ename || ' �� ' || round(months_between(sysdate, hiredate)) || ' ���� �ٹ��߽��ϴ�.'
	from emp; 




027 ���� �� ���� ��¥ ����ϱ�(ADD_MONTHS)

���� : ���� ��¥���� 100�� �ڿ� ���ƿ��� ��¥�� �����ΰ�?

-> select add_months(sysdate, 100)
	from dual;


028 Ư�� ��¥ �ڿ� ���� ���� ��¥ ����ϱ�(NEXT_DAY)


���� : ���ú��� ������ �ٷ� ���ƿ� �������� ��¥�� ����Ͻÿ�!
-> select next_day(sysdate, '������')
	from dual;
	
���� 84. ���ó�¥���� 100�� �ڿ� ���ƿ��� ������� ��¥�� ����Ͻÿ�!
-> select next_day((add_months(sysdate, 100)), '�����')
	from dual;
	



029 Ư�� ��¥�� �ִ� ���� ������ ��¥ ����ϱ�(LAST_DAY)

select sysdate, last_day(sysdate)
	from dual;

	
*���� ���� ������ ������ ��¥ ���� Ȯ��
select * 
    from nls_session_parameters;

-> national language support

���� 85. 81/11/17 �Ͽ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�!

select ename, hiredate
	from emp
	where hiredate = '81/11/17';
	
	
*�̱��� ����Ŭ ȯ������ ��¥ ������ �����غ���

alter session set nls_date_format='DD/MM/RR';

select ename, hiredate
	from emp
	where hiredate = '17/11/81';
	
	
	
*��¥ ����
�⵵ : RRRR, YYYY, RR, YY
�� : MM, MON
�� : DD
�ð� : HH, HH24
�� : MI
�� : SS

alter session set nls_date_format='YY/MM/DD';
select ename, hiredate
	from emp;
	
	
	RR (81) 1981 2081
			2020 : ���翬������ ���� ����� ������ ����
	
	YY (81) 1981 2081
			2020 :  ���缼��� �ν�
