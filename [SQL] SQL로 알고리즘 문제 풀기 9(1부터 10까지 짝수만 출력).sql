119 SQL�� �˰��� ���� Ǯ�� 9(1���� 10���� ¦���� ���)

���� 326. 1���� 10������ ���ڸ� ����ϴµ� ¦���� ����Ͻÿ�!
select level
    from dual
     where mod(level,2) = 0
    connect by level <= 100;