
056 ��µǴ� �� �����ϱ� 1(ROWNUM)
	
"rownum"�� �̿��ϸ� ��µǴ� ���� ������ ������ �� �ֽ��ϴ�."

���� : 
select rownum, empno, ename, sal
from emp
where rownum <=3;

���� : row_number() �Լ��ʹ� �ٸ��� �ζ��κ�(from ���� ��������)�� ������� �ʰ� ���� 3���� �ุ �����Ͷ� ���� ������ �˻��� �� �� �ִ�.

���� 205. ������ SALESMAN �� ������� ������ �� 2���� ����Ͻÿ�! (����̸�, ������ ������ ����Ͻÿ�)
->
select rownum,ename, job, sal
    from emp
    where job = 'SALESMAN' and rownum <=2;

���� 206. ���� ������� �ѰǸ� ��µǰ� �Ͻÿ�!
->
select rownum,ename, job, sal
    from emp
    where job = 'SALESMAN' and rownum <=1;

�Ʒ��� SQL�� ����� �����ϴ�.

select rownum,ename, job, sal
    from emp
    where job = 'SALESMAN' and rownum =2;

�ֳ��ϸ�? Rownum������ �ε�ȣ �񱳿� ���� ����ؾ� �մϴ�.
		��ȣ �񱳴� ���� 1�� �񱳵˴ϴ�.

Select rownum, ename, job, sal
	From emp
	Where rownum between 2 and 5;
	
���� : ������ ���� SQL �� ����� ������ �ζ��κ並 ����ؾ��մϴ�.

���� 207. �츮�� ���̺��� �����͸� �������µ� ���� 3�Ǹ� �����ͼ� ����Ͻÿ�!
->
select *
    from emp12
    where rownum <=3;