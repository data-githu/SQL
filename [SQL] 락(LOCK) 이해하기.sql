083 ��(LOCK) �����ϱ�
"Ư�� â(session) �� ������ ������ KING �� ������ 9000���� �����ϰ� �ִ� ���¿��� �ٸ� â�� ������ ������ KING�� ������ ������ �� ������ ���� ����� LOCK �̶�� �մϴ�."

���� ������ �����͸� ���� ������ ���� commit ����� �� �� �ִ�.
commit ���� ������ ���� ������ �����͸� �ٸ� ����� �� �� ����.

update �� �����ϸ� update �� �����ϰ� �ִ� ��(row) �� ��(lock) �� �Ǵ�.

�� :
update emp 
set sal = 8000 
where ename = 'KING';

���� : ���� ���� update�� �ϸ� KING�� ��ü �࿡ ��(LOCK)�� �̴ϴ�.
�ٸ� â(session) �� ������ ������ KING �� �����͸� ����� ������ �� �����ϴ�.


���� : 
����â A                           ����â B

commit;                                      commit;

update emp                                  update emp        
set sal = 9700                                set sal = 8000
where ename='JAMES';                        where ename = 'ALLEN';

���� : ����â A�� JAMES  �࿡ LOCK �� �ɾ��� ����â B�� ALLEN �� �࿡ LOCK �� �� ���̿��� ���� �浹���� �ʽ��ϴ�.

