
059 ���� ���̺��� �����͸� �����ؼ� ����ϱ� 2(NON EQUI JOIN)
	
"�����Ϸ��� �ΰ��� ���̺� ���̿� ����� �÷��� �������� ����ϴ� ���� ����"

�� : salgrade ���̺� ����

drop  table  salgrade;

create table salgrade
( grade   number(10), #grade �޿����
  losal   number(10),   #losal �ּҿ���
  hisal   number(10) );  #hisal �ִ����

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);

commit;

���� : �̸�, ����, �޿������ ����Ͻÿ�!
->
select e.ename, e.sal, s.grade
    from emp e, salgrade s
    where e.sal between s.losal  and s.hisal;

���� 224. ���� ������� ����� 3����� ����鸸 ����Ͻÿ�!
->
select e.ename, e.sal, s.grade
    from emp e, salgrade s
    where (e.sal between s.losal  and s.hisal ) and s.grade = 3;


���� 225. �޿����(grade), �޿���޺��� �ش� �ϴ� ������� �̸� ���η� ����Ͻÿ�!
->
select s.grade,
    listagg(e.ename, ', ') within group (order by ename asc) �̸�
    from emp e, salgrade s
    where e.sal between s.losal  and s.hisal 
    group by s.grade;

���� 226. ���� ������� ���޵� ���� ���� ������ �Ͻÿ�!
->
select s.grade,
    listagg(e.ename || '(' || e.sal || ')', ', ') within group (order by ename asc) �̸�
    from emp e, salgrade s
    where e.sal between s.losal  and s.hisal 
    group by s.grade;
