
030 ���������� ������ ���� ��ȯ�ϱ�(TO_CHAR)

������ -> ���������� ��ȯ
��¥�� -> ���������� ��ȯ�� �� ����ϴ� �Լ�

select to_char(sysdate, 'day')
	from dual; 
	
���� 86. �̸�, �Ի���, �Ի��� ������ ����Ͻÿ�!
-> select ename, hiredate, to_char(hiredate, 'day')
	from emp;
	
���� 87. �����Ͽ� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�!
-> select ename, hiredate
	from emp
	where to_char(hiredate, 'day') = '������';

���� 88. ���� ���� ���Ͽ� �¾���� Ȯ���Ͻÿ�!

-> select to_char(to_date('92/01/23', 'RR/MM/DD'), 'DAY')
	from dual;
	

*��¥ ����
�⵵ : RRRR, YYYY, RR, YY
�� : MM, MON
�� : DD
�ð� : HH, HH24
�� : MI
�� : SS
���� : day, dy, d

select ename, hiredate, to_char(hiredate,'day'), to_char(hiredate,'dy'), to_char(hiredate,'d')
	from emp;
	

031 ��¥������ ������ ���� ��ȯ�ϱ�(TO_DATE)

���� 89. �̸�, �Ի��� ������ ����ϴµ� �Ի��� ������ ��ȭ��������� ������ ���ĵǾ ��µǰ��Ͻÿ�!

insert into emp(empno, ename, hiredate)
values(1234, 'JACK', to_date('82/01/10,'RR/MM/DD));
commit;

-> select ename, hiredate, to_char(hiredate, 'day')
	from emp
	 order by to_char(hiredate-1,'d') asc;
