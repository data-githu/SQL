040 �Ǽ� ����ϱ�(COUNT)

"�Ǽ��� ����ϴ� �Լ�"

���� : ��� ���̺��� �ο����� ����Ͻÿ�!

select count(empno)
	from emp;
	
���� 145. ����, ������ �ο����� ����Ͻÿ�!

select count(*)
    from emp
    group by job;

					 �θ�Ű �÷�
���� : select job, count(empno)
		from emp
		group by job;


���� 146. ����, ���̺� �ο����� ����Ͻÿ�!
->
select age,count(*)
    from emp12
    group by age;

���� 147. ���� ����� �ٽ� ����ϴµ� ���̺� �ο����� ���� �� ���� ����Ͻÿ�!
->
select age,count(*)
    from emp12
    group by age
    order by age desc;

���� 148. ���� ����� �ٽ� ����ϴµ� ���̺� �ο����� �θ� �̻��� �͸� ����Ͻÿ�!
->
select age,count(*)
    from emp12
    group by age
    having count(*) >= 2
    order by age desc;

���� 149. ��Ż�� ��Ż纰 �ο��� ����Ͻÿ�!
->
select substr(lower(telecom),1,2), count(*)
    from emp12
    group by substr(lower(telecom),1,2);

���� 150. �̸�, �̸����� �����θ� ����Ͻÿ�!
select ename, substr(substr(email,instr(email,'@')+1),1,instr(substr(substr(email,instr(email,'@')+1),1),'.')-1)
    from emp12;

���� 151. �̸����� �����κ� �ο��� ����Ͻÿ�!
select substr(substr(email,instr(email,'@')+1),1,instr(substr(substr(email,instr(email,'@')+1),1),'.')-1), count(*)
    from emp12
    group by substr(substr(email,instr(email,'@')+1),1,instr(substr(substr(email,instr(email,'@')+1),1),'.')-1);

���� 152. �ּ�, �ּҺ� �ο����� �Ʒ��� ���� ����Ͻÿ�!

����� 19
�Ȼ�� 19

->
select substr(address,1,3), count(*)
    from emp12
    where 
    group by substr(address,1,3);