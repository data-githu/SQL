
070 ���� �����ڷ� �������� ���̸� ����ϱ�(MINUS)
"�������� ���ϴ� ���� ������"
��:
select ename, age, telecom
    from emp12
    minus
    select ename, age, telecom
    from emp12_backup2;

���� : �达 ���� �� ��µǾ����ϴ�.
