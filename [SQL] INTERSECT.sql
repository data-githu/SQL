
069 ���� �����ڷ� �������� �������� ����ϱ�(INTERSECT)

���� ������ : 
		    1. ������ ������ : union all, union
			2. ������ ������ : intersect
			3. ������ ������ : minus

���� : �츮�� ���̺��� ����Ͻÿ�!
create table emp12_backup
	as select * from emp12;

select * from emp12_backup;
		
create table emp12_backup2
as select * from emp12
where ename like '��%';

select * from emp12_backup2;

���� : 
select ename, age, telecom
    from emp12
    union all
    select ename, age, telecom
    from emp12_backup2;

select ename, age, telecom
    from emp12
    union
    select ename, age, telecom
    from emp12_backup2;

���� : union�� ������ �������ε� �ߺ��� �����͸� �����ϰ� �����۾��� �����մϴ�.

���� :
select ename, age, telecom
    from emp12
    intersect
    select ename, age, telecom
    from emp12_backup2;

���� : �� ���̺� ������ �ߺ��� ���� ����մϴ�.