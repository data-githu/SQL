
076 ���� ���� ����ϱ� 6(FROM���� ���� ����)
"from ������ ���������� ����� �� �ֽ��ϴ�. from ���� ���������� in line view ��� �մϴ�."

���� : �̸�, ����, ������ ����ϴµ� ������ ������ ���� ��������� ������ �ο��Ͻÿ�!
select ename, sal, rank () over (order by sal desc) ����
    from emp;


���� : ���� ������� ������ 4���� ����� ����Ͻÿ�!
select ename, sal, rank () over (order by sal desc) ����
    where ���� = 4
    from emp;
-> �����߻�

���� : ���� SQL�� ���� �߻��մϴ�. �ֳ��ϸ� ������� �����Դϴ�. from ���� �����ϰ� where ���� �����ϱ� ������ emp ���̺��� ������� �÷��� ���� ������ ������ ���ϴ�.

������ 4���� ����� �̸��� ���ް� ������ ����Ϸ��� from ���� ���������� ����ؾ��մϴ�.

select * 
    from (select ename, sal, dense_rank() over (order by sal desc) ����
            from emp );


select * 
    from (select ename, sal, dense_rank() over (order by sal desc) ����
            from emp )
    where ���� = 4;

���� : from ���� ������������ ����� ��ġ �ϳ��� ���̺�ó�� ��������� ������������ ��� �����Ͱ� �޸𸮿� �ö󰡰� �˴ϴ�. �޸𸮿� �÷����� ������ �߿� ������ 4���� �����͸� �����´�.

���� 284. ����, �̸�, ����, ������ ����ϴµ� ������ �������� ���� ������ ���� ������� ������ �ο��Ͻÿ�!
select  job, ename, sal, dense_rank () over (partition by job order by sal desc) ����
        from emp;

���� 285. ���� ������� ������ 1���� ����鸸 ����Ͻÿ�!
select *
    from (select job, ename, sal, dense_rank() over (partition by job order by sal desc) ����
        from emp )
    where ���� = 1 ;

���� 286. �츮�� ���̺��� ��Ż纰�� ���̰� ���� ���� �л��� �̸��� ���̿� ��Ż�� ������ ������ ����Ͻÿ�!
select *
    from (select ename,age, telecom, dense_rank() over (partition by telecom order by age desc) ����
        from emp12)
    where ���� = 1;

���� 288. ����ÿ��� ���� ��� �ķ�ǰ�� �̸��� ���ݰ� �Ĵ� ���� ����Ͻÿ�!
select *
    from (select A_NAME, A_PRICE, M_NAME, dense_rank() over (order by A_PRICE desc) ����
            from price)
    where ���� = 1;