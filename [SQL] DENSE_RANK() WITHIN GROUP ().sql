
���� 160. �̸�, �Ի���, ������ ����ϴµ� ������ ���� �Ի��� ��������� ������ ����Ͻÿ�!
-> 
select ename, hiredate, rank() over(order by hiredate asc) as ����
    from emp;

���� 161. ����, �̸�, �Ի���, ������ ����ϴµ� ������ �������� ���� ���� �Ի��� ��������� ������ �ο��Ͻÿ�!
->
select job, ename, hiredate, rank() over(partition by job order by hiredate asc) as ����
    from emp;


���� 162. �̸�, ����, ������ ����ϴµ� ������ ������ ���� ������� ������ �ο��Ͻÿ�!
->
select ename, sal, rank() over(order by sal desc) as ����
    from emp;

���� 163. ������ 2975�� ������ �����ΰ�?
->
select dense_rank(2975) within group (order by sal desc) as ����
    from emp;

���� : within ~�̳��� 
	������ ���� ������� ������ �׷� �ȿ��� 2975�� ������ �����ΰ�?

���� 164. �츮�ݿ��� 34�� ������ ������ ����Ͻÿ� 
->
select dense_rank(34) within group (order by age desc) as ����
    from emp12;

���� 165. 81�� 11�� 17�Ͽ� �Ի��� ����� ��� ���̺��� ���°�� �Ի��� ����ΰ�?
->
select dense_rank(to_date('81/11/17','RR/MM/DD')) within group (order by hiredate asc) as ����
    from emp;
    
