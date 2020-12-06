047 COLUMN�� ROW�� ����ϱ� 1(SUM+DECODE)

����1 : �μ���ȣ, �μ���ȣ�� ��Ż������ ����Ͻÿ�!
->
select deptno, sum(sal)
    from emp
    group by deptno;

����2 : �μ���ȣ, �μ���ȣ�� 10�̸� ���� �ƴϸ� 0�� ��µǰ� �Ͻÿ�!
->
select deptno, decode( deptno,10,sal,0)
from emp;

����3: ���� ������� �μ���ȣ �÷��� �ȳ����� �Ͻÿ�!
->
select decode( deptno,10,sal,0)
from emp;

����4 : ������ ��µ� 14���� �����͸� �� sum �Ͻÿ�!
-> 
select sum(decode( deptno,10,sal,0))
    from emp;
    
����5 : ���� ���� ����ϴµ� �ش� �÷����� 10���� ��µǰ� �Ͻÿ�.
->
select sum(decode( deptno,10,sal,0)) as "10"
    from emp;
    
����6 : �׷��� �Ʒ��� ���� 20���� 30���� �� ���� ��µǰ� �Ͻÿ�!
 ->
select sum(decode( deptno,10,sal,0)) as "10",
        sum(decode( deptno,20,sal,0)) as "20",
        sum(decode( deptno,30,sal,0)) as "30"
        from emp;

���� 174. ��Ż�, ��Ż纰 ��Ż���̸� ����Ͻÿ�! (�������)
->
select telecom, sum(age)
    from emp12
    group by telecom;


���� 175. ��Ż�, ��Ż纰 ��Ż���̸� ����Ͻÿ�! (�������)
-> select sum(decode( telecom,'sk',age)) as "sk",
        sum(decode( telecom,'kt',age)) as "kt",
        sum(decode( telecom,'lg',age)) as "lg"
        from emp12; 

����176. �Ʒ��� SQL �ΰ��� ����� ������? YES

select sum(comm) from emp;

select sum(nvl(comm,0) from emp;

 ���� : ���� SQL�� �� ������ ����. �ֳ��ϸ� null ���� sum ���꿡 ���Ե��� �ʾұ� �����̴�.

���� 177. �Ʒ��� SQL �� Ʃ���Ͻÿ�
Ʃ����
 select sum(decode( telecom,'sk',age,0)) as "sk",
            sum(decode( telecom,'kt',age,0)) as "kt",
            sum(decode( telecom,'lg',age,0)) as "lg"
            from emp12; 

Ʃ����
 select sum(decode( telecom,'sk',age)) as "sk",
        sum(decode( telecom,'kt',age)) as "kt",
        sum(decode( telecom,'lg',age)) as "lg"
        from emp12; 

���� 178. ����, ������ ��Ż������ ����Ͻÿ�! (���η� ���)
->
select job, sum(sal)
    from emp
    group by job;

���� 179. ����, ������ ��Ż������ ����Ͻÿ�! (���η� ���)
->
 select sum(decode(job, 'ANALYST', sal, null)) as "ANALYST",
        sum(decode(job, 'CLERK', sal, null)) as "CLERK",
        sum(decode(job, 'MANAGER', sal, null)) as "MANAGER",
        sum(decode(job, 'PRESIDENT', sal, null)) as "PRESIDENT",
        sum(decode(job, 'SALESMAN', sal, null)) as "SALESMAN"
        from emp;