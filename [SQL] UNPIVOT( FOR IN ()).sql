049 ROW�� COLUMN���� ����ϱ�(UNPIVOT)
 pivot �� : ���� -> ����
Unpivot�� : ���� -> ����

# order2��� ���̺��� �����ϰ� �����͸� 3�� �Է��Ѵ�.
	1. ���̺� ���� ��ũ��Ʈ
create table order2
( ename  varchar2(10),
  bicycle  number(10),
  camera   number(10),
  notebook  number(10) );
	2. ������ �Է� ��ũ��Ʈ
insert  into  order2  values('SMITH', 2,3,1);
insert  into  order2  values('ALLEN',1,2,3 );
insert  into  order2  values('KING',3,2,2 );

commit;

���� : 
select * 
    from order2
    unpivot( �Ǽ� for ��ǰ in (BICYCLE, CAMERA, NOTEBOOK));

���� : ����(�÷�) -> ����(������)
	 ���� SQL ���� �Ǽ��� ��ǰ�� SQL �ۼ��ڰ� ������� �̸��� ����ص� �Ǵµ�, �̸��� ����ϴ´�� �÷������� ����� �ȴ�. �׸��� BICYCLE, CAMERA, NOTEBOOK �� ���ʿ� �̱� �����̼� ��ũ�� �ѷ����� �ʾƵ� �˴ϴ�.
