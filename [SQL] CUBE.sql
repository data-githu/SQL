053 ������ �м� �Լ��� ���� ��� ����ϱ� 2(CUBE)

"���� ����� ���ʿ� ����ϴ� �Լ�"

���� : select job, sum(sal)
             from emp
	  group by cube(job);
	
���� 185. ��Ż�, ��Ż纰 ��Ż���̸� ����ϴµ� ������ ��ü ��Ż���̰� ��µǰ� �Ͻÿ�!
->
select telecom, sum(age)
    from emp12
    group by cube(telecom);

���� 186. �Ի��� �⵵(4�ڸ�), �Ի��� �⵵�� ��Ż������ ����ϴµ� �� ���� ��ü��Ż������ ����Ͻÿ�!
->
select to_char(hiredate,'RRRR'), sum(sal)
    from emp
    group by cube(to_char(hiredate,'RRRR'));

���� 187. �Ի��� �⵵(4�ڸ�), �Ի��� �⵵�� ��Ż������ ����Ͻÿ�!
	1. select to_char(hiredate,'RRRR'), sum(sal)
	    from emp
	    group by to_char(hiredate,'RRRR');


	2. select sum(decode( to_char(hiredate,'RRRR'),'1980',sal,0)) as "1980",
	        sum(decode( to_char(hiredate,'RRRR'),'1981',sal,0)) as "1981",
	        sum(decode( to_char(hiredate,'RRRR'),'1982',sal,0)) as "1982",
	        sum(decode( to_char(hiredate,'RRRR'),'1983',sal,0)) as "1983"
	        from emp;

