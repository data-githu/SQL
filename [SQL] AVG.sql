
038 ��հ� ����ϱ�(AVG)

"avg �Լ��� ��հ��� ����� �� �ֽ��ϴ�."

���� 130. �츮�� ������ ��հ��� ���Ͻÿ�!
-> 
select avg(age)
    from emp12;

���� 131. ������̺��� ������ ��հ��� ����Ͻÿ�!
-> 
select avg(sal)
    from emp;

���� : ������ �� ������ 14�� ����.

���� 132. Ŀ�̼��� ��հ��� ����Ͻÿ�!
->
select avg(comm)
    from emp;

���� : Ŀ�̼��� �� ���� �� 4�� ����.

"�׷��Լ��� null���� �����Ѵ�."


���� 133. ���� ����� �ٽ� ����ϴµ� 4�� ������ �ʰ� 14�� ������ �Ͻÿ�!
->
select avg(nvl(comm,0))
    from emp;

���� : null ���� 0���� �� �����߱� ������ 4�� ������ �ʰ� 14�� ������ �Ǿ���.

���� 134. ���� ������� �Ҽ��� ���ϴ� �ȳ����� �ݿø� �Ͻÿ�!
->
select round(avg(nvl(comm,0)))
    from emp;

���� 135. ����, ������ ��տ����� ����Ͻÿ�
->
select job,avg(sal)
    from emp
    where job is not null
    group by job;


job���� null  �� ���� �����.

delete from emp
	where job is null;
	
commit;

���� 136. ��Ż�, ��Ż纰 ��ճ��̸� ����Ͻÿ�!
->
select decode(lower(telecom),'skt','sk', lower(telecom)), avg(age)
    from emp12
    group by decode(lower(telecom),'skt','sk', lower(telecom));

���� : lower(telecom) �����Ͱ� skt�� sk�� ����ϰ� ������ ��Ż�� �׳� �״�� lower(telecom)���� ����ض�!


���� 137. ����, ������ ��ճ��̸� ����ϴµ� ������ ��,��,��, �� ������ ��µǰ� �Ͻÿ�!
-> 
select major, avg(age)
    from emp12
    group by major
    order by major asc;