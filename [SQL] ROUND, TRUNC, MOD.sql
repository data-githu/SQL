
023 �ݿø��ؼ� ����ϱ�(ROUND)

���� : select round( 786.567, 2 )
		from dual;

 7  8  6  .  5  6  7
 -3 -2 -1 0 1 2 3

���� : �Ҽ��� ������ �ٷ� ���ڸ��� �������� �ΰ� �ڿ��� �ݿø��Ѵ�.

���� 77. �츮�� ���� ��հ��� ����Ͻÿ�!

-> select avg(age)
	from emp12;
	
���� 78. ���� ����� �ݿø� �Ͽ� �Ҽ��� ���Ĵ� �ȳ����� �Ͻÿ�!

->  select round( avg(age), 0)
	from emp12;
	
	
-> select round (avg(age))
	from emp12;
	
	
024 ���ڸ� ������ ����ϱ�(TRUNC)

->  select trunc(785.657, 2)
	from dual;
	
���� : trunc �� ������ �Լ��ε� �Ҽ��� ������ ������ �ڸ��� �����ؼ� ������ 
						�Ҽ��� ���Ĵ� ������ �ڸ� ���ĺ��� ������.


025 ���� ������ �� ����ϱ�(MOD)

���� : select mod(10, 3)
	from dual;
	
select mod(24,2), mod(25,2)
from dual;


���� 79. �츮�ݿ��� ���̰� ¦���� �л����� �̸��� ���̸� ����Ͻÿ�!
-> select ename, age
	from emp12
	where mod(age,2) = 0 ;


