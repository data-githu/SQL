055 ������ �м� �Լ��� ��� ��� �ѹ��� �ϱ�(ROW_NUMBER)

"��°���� �� �տ� ���ڸ� ���ʴ�� �ο��ϴ� �Լ�"

�� : select row_number() over (order by empno), empno, ename
	from emp; 
	
�̷��� row_number() �Լ��� ����ϸ� ���� �����ϳĸ�, ��µǴ� ���� ������ 3���� �ุ �����Ͷ� �Ǵ� ������ �ϳ��� �ุ �����Ͷ� ��� �˻��� �� �����ϴ�. �ζ��κ� (from ���� ��������)�� ���� �˻��� �� �ֽ��ϴ�.


���� 203. ������ SALESMAN�� ������� �̸��� ������ ����ϴµ� row_number �Լ��� ����ؼ� �� �տ� ��ȣ ���ʴ�� �ο��ǰ� �Ͻÿ�!
->
select row_number()over(order by ename asc), ename, job
    from emp
    where job = 'SALESMAN';

���� : order by ������ empno �� �ᵵ �ǰ� ename�� �ᵵ �ȴ�. �����ϰ� ������� �÷��� ����ϸ� �ȴ�.   order by ename �ڿ� ���ı�Ģ�� �Ⱦ��� �⺻���� asc�� ����ȴ�.

���� 204. ������ SALESMAN�� ������� �̸��� ���ް� ������ ����ϴµ� �Ǿտ� row_number() �Լ��� �Ἥ ��ȣ�� �ο��ǰ� �Ͻÿ�. (������ ���� ������� ��µǸ鼭 ��ȣ�� �ο��ǰ� �Ͻÿ�)
->
select row_number() over(order by sal desc),ename, sal, job
    from emp
    where job = 'SALESMAN';
