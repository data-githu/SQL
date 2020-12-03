
*select ���� 6������

�ڵ����� : select -> from -> where -> group by -> having -> order by
������� : from -> where -> group by -> having -> select -> order by
	
	5 select �˻��� �÷���
	1 from �˻��� ���̺��
	2 where �˻�����
	3 group by �׷����� �÷�
	4 having �׷��Լ��� �˻������� �� �� ���
	6 order by ������ �÷���
	

039 ��Ż�� ����ϱ�(SUM)

"��Ż���� ����ϴ� �Լ�"

���� : ��� ���̺��� �� ������ ����Ͻÿ�!
-> 
select sum(sal)
    from emp;

���� 138. ����, ������ ��Ż������ ����ϴµ� ������ ��Ż������ ���� �ͺ��� ����Ͻÿ�!
-> 
select job, sum(sal)
    from emp
    group by job
    order by sum(sal) desc;

���� 139. ���� ������� ������ SALESMAN  �� �����ϰ� ����Ͻÿ�!
->
select job, sum(sal)
    from emp
    where job != 'SALESMAN'
    group by job
    order by sum(sal) desc;

���� 140. ���� ����� �ٽ� ����ϴµ� ��Ż������ 6000 �̻��� �͸� ����Ͻÿ�!
->
select job, sum(sal)
    from emp
    where job != 'SALESMAN'
    group by job
    having sum(sal) >= 6000
    order by sum(sal) desc;

���� : group �Լ��� ������ �� ���� where ���� ����ϸ� �ȵǰ� having���� ����ؾ� �մϴ�. where ������ �׷��Լ��� ������� ���� �Ϲ����� �˻������� �� �� ����մϴ�.


	
���� 141. ����, ������ ��Ż������ ����ϴµ� ������ SALESMAN �� �����ϰ� ����ϰ� ������ ��Ż������ 6000 �̻��� �͸� ����ϰ�  ������ ��Ż������ �����ͺ��� ����Ͻÿ�!
->
select job, sum(sal)
    from emp
    where job != 'SALESMAN'
    group by job
    having sum(sal) >= 6000
    order by sum(sal) desc;

select job, sum(sal)
    from emp
    group by job
    having sum(sal) >= 6000 and job != 'SALESMAN'
    order by sum(sal) desc;


���� SQL�� ����ɱ��? 

�Ǳ�� �ϴµ� �˻��ӵ��� �������ϴ�. 
�Ϲ����� �˻������� having ���� ����ϸ� �˻��ӵ��� �������Ƿ� �ݵ�� where ���� �ۼ��ؾ��մϴ�.

���� 142. ��Ż�, ��Ż纰 ��Ż���̸� ����ϴµ� 'skt'�� �����ϰ� ��Ż���̰� 100 �̻��� �͸� ������� ����Ͻÿ�!

-> 
select lower(telecom), sum(age)
    from emp12
    where lower(telecom) != 'skt'
    group by lower(telecom)
    having sum(age) >= 100
    order by sum(age) desc;

���� 143. ���� ������ �ٽ� Ǫ�µ� �̹����� skt�� sk�� ���Խ��� ����Ͻÿ�!
-> 
select substr(lower(telecom),1,2), sum(age)
    from emp12
    group by substr(lower(telecom),1,2)
    having sum(age) >= 100
    order by sum(age) desc;

���� 144. �Ի��� �⵵(4�ڸ�), �Ի��� �⵵�� ��Ż������ ����ϴµ� ��Ż������ ����� �� õ���� ǥ�ð� ��µǰ� �Ͻÿ�!

-> 
select to_char(hiredate, 'RRRR'), to_char(sum(sal),'999,999')
    from emp
    group by to_char(hiredate, 'RRRR');
