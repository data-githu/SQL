
078 ������ �Է��ϱ�(INSERT)

"���̺� �����͸� �Է��ϴ� SQL ����"
					������ �Է��� �÷��� ���
�� : insert into emp (empno, ename, sal)
	values(1234, 'jack', 4500);
             ���� �÷� ������� ���� ���

���� 295. ��� ���̺� �Ʒ��� �����͸� �Է��Ͻÿ�

�����ȣ 2939
����̸� jane
���� 4700
�Ի��� ���ó�¥

insert into emp (empno, ename, sal, hiredate)
values(2939,'jane',4700,'20/11/05');

���� 296. ���� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�!
select ename, hiredate
    from emp
    where hiredate ='20/11/05';

select ename, hiredate
    from emp
    where hiredate = sysdate;
-> ��µ��� �ʽ��ϴ�.

���� : sysdate�� ��¥ �Ӹ� �ƴ϶� �ú��ʵ� ��µǱ� ������ �Ʊ� �Է������� �ú��ʿ� ���� ��ȸ������ �ú��ʰ� ���� �ٸ��� ������ ��ȸ���� �ʴ� ���Դϴ�.

delete from emp where empno = 2939;

insert into emp (empno, ename, sal, hiredate)
values (2939, 'jane', 4700, to_date('20/11/05', 'RR/MM/DD') );

�߿伳�� : ��¥�� �Է��� ���� to_date �� ����ؼ� �Է��ϼ���!
		�������� �ʰ� Ȯ���ϰ� ��¥�����͸� �Է��ϴ� ����Դϴ�.
		���� ���� ��¥�� �Է��ϸ� ��¥�� ��Ȯ�ϰ� 2020�� 11�� 05�Ϸ� �Էµǰ� �ú��ʴ� 00�� 00�� 00�� �Էµ˴ϴ�.


���� 297. 2020�� 11�� 05�Ͽ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�!
select ename, hiredate
    from emp
    where hiredate = to_date('2020/11/05', 'RR/MM/DD')


���� 298. �Ʒ��� �����͸� ��� ���̺� �Է��Ͻÿ�!
insert into emp(empno, ename, sal, deptno)
	values(4945, 'mike   ',3000 ,20 );


���� 299. �̸��� mike �� ����� �̸��� ������ ����Ͻÿ�!
select ename, sal
    from emp 
    where ename like 'mike%';

���� : where ���� �÷����� �Լ��� ������ ������� �ʴ� ���� �˻� ������ �������ϴ�.

