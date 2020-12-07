057 ��µǴ� �� �����ϱ� 2(Simple TOP-n Queries)
	"order by ������ ����ؼ� �˻��ϴ� SELECT ���� ��µǴ� ���� �Ϻθ� ������ �� ����ϴ� ����"
	
�� : select rownum, empno, ename, sal
        from emp
        order by sal desc;

���� :  order by �� ����Ǳ� ���� rownum �� �ο��Ǿ ��ȣ�� ���׹��� ������.

���� : ��� ���̺� ������ ���� ��� 4�� ����Ͻÿ�!
->
select ename, sal
    from emp
    where rownum <=4
    order by sal desc;

���� : ����� ��µ��� �ʾҴ�. ������� �����̴�. Emp ���̺��� ������ 4�� �����ͼ� �� 4������ ������ ���� ������� �����߱� �����Դϴ�. ���� ����� ����� ����ϱ� ���ؼ��� �Ʒ��� ���� top n query�� �ۼ��ؾ� �մϴ�.
->
select ename, sal
    from emp
    order by sal desc
    fetch first 4 rows only;

���� : fetch�� �˻����� �������� �����͸� �����Ͷ� ��� ���Դϴ�.
First 4 rows only �� �����ε� ���߿� 4���� �ุ �����Ͷ� ��� ���Դϴ�.

���� 208. �츮�ݿ� ���̰� ���� ���� �л����� �̸��� ���̸� ����ϴµ� �� 5�� ����Ͻÿ�!
->
select ename, age
    from emp12
    order by age desc
    fetch first 5 rows only;

���� 209. ����, ������ ��Ż������ ����ϴµ� ������ ��Ż������ �����ͺ��� ����ϴµ� ���ʿ� 2���� �ุ ����Ͻÿ�!
->
select job, sum(sal)
    from emp
    group by job
    order by sum(sal) desc
    fetch first 2 rows only;

