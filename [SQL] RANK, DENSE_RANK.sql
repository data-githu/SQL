
041 ������ �м� �Լ��� ���� ����ϱ� 1(RANK)


������ �м� �Լ� : ������ �м��� �����ϰ� �ϱ� ���ؼ� �����ϴ� �Լ�
�� �߿� rank�� ������ ����ϴ� �Լ��Դϴ�.

���� :  �̸�, ����, ���޿� ���� ������ ����Ͻÿ�!
->
select ename, sal, rank() over (order by sal desc) as ����
     from emp;

���� 153. �̸�, ����, ������ ����ϴµ� ������ ���̰� ���� ������� ������ ����Ͻÿ�
->
select ename, age, rank() over (order by age desc) as ����
     from emp12;

���� 154. ����, �̸�, ����, ������ ����ϴµ� �������� ���� ������ ���� ������� ������ ��µǰ� �Ͻÿ�!
->
select job, ename, sal, rank() over (partition by job order by sal desc) as ����
     from emp;

�� ���� : partition by �� group by�ϰ� ȥ���ϸ� �ȵȴ�.
partition by�� ������ �м��Լ����� ��ȣ�ȿ� ���� �������� 
partition by job �̶�� �ϸ� �������� ���� ��Ƽ���ؼ� �����ڴٴ� ���̴�.

�׷��� �Ʒ��� ����
rank() over (partition by job <- �������� ��Ƽ���ؼ�
		order by sal desc ) <- ������ ���� ������� ������ ����ϰڴ�.
		
���� 155. �μ���ȣ, �̸�, �Ի���, ������ ����ϴµ� ������ �μ���ȣ���� ���� ���� �Ի��� ��������� ������ �ο��ǰ� �Ͻÿ�!


-> 
select deptno, ename, hiredate, rank() over(partition by deptno order by hiredate asc) as ����
    from emp;

���� 156. ��Ż�, �̸�, ����, ������ ����ϴµ� ��Ż纰�� ���� ���� ���� �л������� ������ �ο��Ͻÿ�!
->
select substr(lower(telecom),1,2), ename, age, rank() over(partition by substr(lower(telecom),1,2) order by age desc) as ����
    from emp12;
    


042 ������ �м� �Լ��� ���� ����ϱ� 2(DENSE_RANK)
���� : 
select substr(lower(telecom),1,2), ename, age, dense_rank() over(partition by substr(lower(telecom),1,2) order by age desc) as ����
    from emp12;

���� 157. �̸�, ����, ������ ����ϴµ� dense_rank()  �� �Ἥ ������ 1,2,3,4,5 �� ���� ��µǵ��� �Ͻÿ�!
->
select ename, sal, dense_rank() over (order by sal desc) as ����
    from emp;


���� 158. �Ի��� �⵵(4�ڸ�), �̸�, ����, ������ ����ϴµ� ������ �Ի��� �⵵ ���� ���� ������ ���� ������� ������ ����Ͻÿ�!
-> 
select to_char(hiredate, 'RRRR'), ename, sal, rank() over (partition by to_char(hiredate, 'RRRR')order by sal desc) as ����
    from emp;

���� 159. �̸��� ������, �̸�, ����, ������ ����ϴµ� ������ �̸��� ������ ���� ���� ���̰� ���� �л������� ��µǰ��Ͻÿ�!

->
select?substr(substr(email,instr(email,'@')+1),1,instr(substr(substr(email,instr(email,'@')+1),1),'.')-1),?ename,?age,?
????rank()?over?(partition?by?substr(substr(email,instr(email,'@')+1),1,instr(substr(substr(email,instr(email,'@')+1),1),'.')-1)?order?by?age?desc)?as?����
????from?emp12;

