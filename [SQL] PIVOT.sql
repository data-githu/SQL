048 COLUMN�� ROW�� ����ϱ� 2(PIVOT)

���θ� ���η� ����ϴ� �Լ�

�� : select *
	from (select  deptno, sal from emp) <- ������̺��� �μ���ȣ�� ���޸� �����´�. emp ���̺�� �� �� �� ����. ����� ���� ���ؼ� �ʿ��� �÷��� �����ؼ� �����;� �˴ϴ�. emp ���̺�� ���� ������ ���ϴ�. 
	�Ʒ��� ����� ���� ���ؼ� ������ �ʿ������� �ʰ� �Ի����� �ʿ������� �ʽ��ϴ�. �׳� �μ���ȣ�� ���޸� ������ �˴ϴ�.
	
	pivot ( sum(sal) for deptno in (10, 20, 30));
	��Ż������ ����ϰڴ�. � ��Ż����? �μ���ȣ�� ���� � �μ���ȣ? 10��, 20��, 30���� �μ���ȣ
	

���� 180. ��Ż�, ��Ż纰 ��Ż���̸� ���η� ����Ͻÿ�!
->
select * 
    from (select telecom, age from emp12)
    pivot ( sum(age) for telecom in ('sk'as "sk" ,'kt' as "kt" ,'lg' as "lg"));

���� 181. ���� ����� ��Ż���̰� �ƴ϶� ��ճ��̷� ������ �Ͻÿ�!
->
select * 
    from (select telecom, age from emp12)
    pivot (avg(age) for telecom in ('sk'as "sk" ,'kt' as "kt" ,'lg' as "lg"));
