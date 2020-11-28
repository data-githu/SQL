005 �ߺ��� �����͸� �����ؼ� ����ϱ�(DISTINCT)


"distinct Ű���带 �÷��� �տ� �ۼ��ϰ� �����ϸ� �ߺ��� �����͸� �����ϰ� ����� �� �ֽ��ϴ�."

�� : select job
	from emp;
	

	
�� : select distinct job
		from emp;
		


���� 12. �μ���ȣ�� ����ϴµ� �ߺ��� �����ؼ� ����Ͻÿ�.

select distinct deptno
	from emp;




006 �����͸� �����ؼ� ����ϱ�(ORDER BY)

order by ���� �����͸� �����ϴ� ���̰� select ���忡 �� �������� ����մϴ�.

�� : select ename, sal
	from emp
	order by sal asc;
-> ������ �÷���, ���Ĺ��

asc : �ø�����
desc : ��������




���� 13. �̸��� ������ ����ϴµ� ������ ���� ������� ����Ͻÿ�! 

-> select ename, sal
	from emp
	order by sal desc ;




���� 14. �̸� �Ի����� ����ϴµ� �ֱٿ� �Ի��� ������� ����Ͻÿ�!

-> select ename, hiredate
	from emp
	order by hiredate desc ;


	
	
(���ɽð� ����)

�̸��� ���ް� �μ���ȣ�� ����ϴµ� �μ���ȣ�� 10�� 20�� 30�� ������ ��µǰ� �ϰ� �÷����� �ѱ۷� �̸�, ����, �μ���ȣ�� ��µǰ� �Ͻÿ�!

-> select ename as �̸�, sal as ����, deptno as �μ���ȣ
	from emp
	order by deptno asc;




	- order by ���� �÷��� ���� ���� �ۼ��� �� �ִ�.
	select ename, deptno, sal
		from emp
		order by deptno asc, sal desc;


	
	select ename, deptno, sal
		from emp
		order by 2 asc, 3 desc;
	-> �÷� ������ ���൵ ������ ��� ���� ���´�.




���� 15. �̸��� ������ �Ի����� ����ϴµ� ������ abc ������� �����Ͽ� ����ϰ� ������ ������� ������ ���� �������� �Ի����� ���� �Ի��� ������� ��µǰ� �Ͻÿ�. 

-> select ename, job, hiredate
	from emp
	order by 2 asc, 3 asc ;




007 WHERE�� ���� 1(���� ������ �˻�)

"where ���� ����ϸ� Ư�� ���ǿ� ���� �����͸� �����ؼ� ����� �� �ִ�."

�� : select ename, sal 
	from emp
	where sal = 3000 ;
	



���� 16. �����ȣ�� 7788 ���� ����� �����ȣ�� �̸��� ������ ����Ͻÿ�!
-> select empno, ename, sal
	from emp
	where empno = 7788;




���� 17. 30�� �μ���ȣ���� �ٹ��ϴ� ������� �̸��� ���ް� �μ���ȣ�� ����Ͻÿ�!
-> select ename, sal, deptno
	from emp
	where deptno =30;



���� 18. ���� ����� ������ ����������� ����Ͻÿ�!
 
-> select ename, sal, deptno
	from emp
	where deptno =30
	order by 2 desc;



�� ���� : order by ���� ���� ������ �ٿ� �ۼ��մϴ�.

���� 19. �μ���ȣ�� 20���� ������� �̸��� �Ի��ϰ� �μ���ȣ�� ����ϴµ� �ֱٿ� �Ի��� ������� ����Ͻÿ�!

-> select ename, hiredate, deptno
	from emp
	where deptno = 20
	order by 2 desc;
	



008 WHERE�� ���� 2(���ڿ� ��¥ �˻�)

where ���� �����͸� �˻��� �� ���ڿʹ� �ٸ��� ���ڴ� ���ʿ� �̱� �����̼� ��ũ�� �ѷ���� �մϴ�.

�� : select ename, sal
	from emp
	where ename='SCOTT';
	

�� ���� 
	- SQL�� ��ҹ��ڸ� �������� ������ data�� ��ҹ��ڸ� �����Ѵ�.
	- �̱� �����̼� ��ũ �ȿ� �ִ� �����ʹ� ���� �Ǵ� ��¥�̴� ��� ����Ŭ���� �˷��ִ� ���Դϴ�.
	
���� 20. ������ SALESMAN �� ������� �̸��� ���ް�  ������ ����Ͻÿ�!
-> select ename, sal, job
	from emp
	where job = 'SALESMAN' ;




���� 21. 81�� 11�� 17�Ͽ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�!

-> select ename, hiredate
	from emp
	where hiredate = '81/11/17';
	

	
�� ���� : ��¥ �˻��� �� ���� �⵵/��/�� ������ �˻��ϸ� �Ǵµ� ���󸶴� ������ �ٸ� �� �ֽ��ϴ�. 
�̱��̳� ������ ��� ��/��/�� �� �Դϴ�.


