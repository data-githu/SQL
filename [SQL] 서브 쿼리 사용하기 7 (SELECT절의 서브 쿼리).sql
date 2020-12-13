077 ���� ���� ����ϱ� 7(SELECT���� ���� ����)

"select ���� ���������� ����� �� �ִµ� select ���� ���������� scalar subquery ��� �մϴ�."

���� : �̸�, ����, ������̺��� ��տ����� ����Ͻÿ�!
select ename, sal, avg(sal)
    from emp;
-> �����߻�

select ename, sal, (select avg(sal) from emp)
    from emp;

���� 289. ����̸�, ����, ��� ���̺��� �ִ����, ������̺��� �ּҿ����� ����Ͻÿ�!
select ename, sal, (select max(sal) from emp) as �ִ����, (select min(sal) from emp) as �ּҿ���
    from emp;

�߿伳�� : select ���� ���������� ��Į�� ���������� Ư¡?
��Į�� ���������� �� �Ѱ��� �� ������ �� �ִ�.

���� 290. �̸�, ����, �츮�� ������ ��ճ��̸� ����Ͻÿ�!
select ename, age, (select avg(age) from emp12) as ��ճ���
    from emp12;


����291. ���� ����� �Ҽ��� ���ϰ� �ȳ������� �ݿø� �Ͻÿ�!
select ename, age, (select round(avg(age))from emp12) as ��ճ���
    from emp12;

���� 292. (���̵� ��) ���� ������� �л��� ���̰� ��ճ��̺��� �� ū �л����� �̸��� ���̿� ��ճ��̸� ����Ͻÿ�!
select *
    from ( select ename, age, (select round(avg(age)) from emp12) ��ճ���
            from emp12)
    where age > ��ճ��� ;


���� 293. ������̺��� �̸�, ����, ������̺��� �ִ����, ������̺��� �ּҿ���, ������̺��� ��տ����� ����Ͻÿ�!

Ʃ����
 select ename, sal, (select max(sal) from emp), (select min(sal) from emp), (select avg(sal) from emp)
    from emp;  

Ʃ���� 
select ename, sal, max(sal) over () �ִ����, 
                            min(sal) over () �ּҿ���,
                             avg(sal) over () ��տ���
from emp;


���� 294. �츮�� ���̺��� �̸�, ����, �츮�� ������ �ִ볪��, �츮�� ������ �ּҳ���, �츮�� ������ ��ճ���, �츮�� �л����� �ο����� ����Ͻÿ�!
select ename, age, max(age) over () �ִ볪��,
                    min(age) over () �ּҳ���,
                    avg(age) over () ��ճ���,
                    count(*) over () �ο���
from emp12;

���� : select ���� ���������� ��Į�� ���������� ������ �����Ƿ� ���� ���� ������ �м��Լ��� �̿��ؼ� Ʃ���� �ϸ� ������ ��뷮 �������� �����͸� �˻��� �� �ֽ��ϴ�.
