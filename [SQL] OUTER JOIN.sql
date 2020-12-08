
060 ���� ���̺��� �����͸� �����ؼ� ����ϱ� 3(OUTER JOIN)

"�����Ϸ��� �� ���̺��� ����� �÷��� deptno �� �����Ͱ� ���� �Ȱ��� ��ġ���� ���� �� �����ϱ� ���ؼ� ����ϴ� ���� ��� "

�� : ������̺��� �μ���ȣ�� ����ϴµ� �ߺ������ؼ� ����Ͻÿ�!
->
select distinct deptno
    from emp;

�� : �μ����̺��� �μ���ȣ�� ����Ͻÿ�!
->
select deptno
    from dept;

���� 227. emp �� dept �� ���� �����ؼ� �̸��� �μ���ġ�� �μ���ȣ�� ����Ͻÿ�!
->
select e.ename, d.loc, e.deptno
    from emp e, dept d
    where e.deptno = d.deptno;

���� : ���� ����� ���� 40���� ������ ���� �ʾƼ� ����� ��µ��� �ʾҽ��ϴ�.
�� ������ �ȵǾ�����? ������̺� 40�� �μ���ȣ�� ��� �Դϴ�.
->
select e.ename, d.loc, e.deptno
    from emp e, dept d
    where e.deptno(+) = d.deptno;

���� : outer join sign (+) �� ����� ��µ� �� �����Ͱ� ������ �ʿ� �ٿ��ش�.
	emp ���̺��� �μ���ȣ�� 10, 20, 30 �� �ְ� 40���� �����ϴ�.
	dept ���̺��� �μ���ȣ�� 10, 20, 30, 40 ���� �ֽ��ϴ�.
	�׷��� emp ���̺� �ʿ� �ٿ��ݴϴ�.

���� 228. �μ���ġ, �μ���ġ�� ��Ż������ ����Ͻÿ�!
->
select d.loc, sum(e.sal)
    from emp e, dept d
    where e.deptno = d.deptno
    group by d.loc;

���� : ���� ���ε� ����� ���� �μ���ġ(loc) �ʿ� BOSTON�� ������ �ʽ��ϴ�.

���� 229. ���� ������� BOSTON �� �������� ���ι����� �����Ͻÿ�!
->
select d.loc, sum(e.sal)
    from emp e, dept d
    where e.deptno (+) = d.deptno
    group by d.loc;


*�츮�� ���̺�� �����ϱ� ���� ���̺��� ����
(��Ż� �⺻ ��� ���̺�)
 drop  table  telecom_price;

  create  table   telecom_price
  (   telecom     varchar2(10),
      price         number(10),
     service_cnt   number(10) );

 insert  into   telecom_price   values('sk', 18500,  9 );
 insert  into   telecom_price   values('kt', 17000,  9 );
 insert  into   telecom_price   values('lg', 18000, 10 ); 

 commit; 

����230. �츮�� ���̺��  telecom_price ���̺��� �����ؼ�  �̸�, ����, ����, ��Ż�, ��Ż� �⺻���(price) �� ����ϴµ�  ���̰� 27 �̻��� �л��鸸 ��µǰ� �Ͻÿ�!
->
select e.ename, e.age, e.gender, e.telecom, t.price
    from emp12 e, telecom_price t
    where e.telecom = t.telecom and e.age >=27 ;

