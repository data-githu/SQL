085 ���� ������ ����Ͽ� ������ �Է��ϱ�
�츮�� ���ݱ��� ��� insert ������ �ѹ��� �ѰǸ� �Է��� �� �־����ϴ�.
insert into emp(empno, ename, sal)
values(1234,'aaa',7000)

�׷��� ���������� ����� insert ������ �̿��ϸ� �ѹ��� �������� �����͸� �Է��� �� �ְ� �˴ϴ�.
create table emp12_backup3
as 
select *
from emp12;

select count(*) from emp12_backup3;

truncate table emp12;

insert into emp12
select *
from emp12_backup3;

commit;

���� 314. dept ���̺��� ����Ͻÿ�!
create table dept_backup
as 
select *
from dept;

���� 315. dept ���̺��� truncate �Ͻÿ�!
truncate table dept;

���� 316. dept���̺��� dept_backup ���̺��� �̿��Ͽ� �����Ͻÿ�!
insert into dept
select *
from dept_backup;