083 락(LOCK) 이해하기
"특정 창(session) 에 접속한 유저가 KING 의 월급을 9000으로 변경하고 있는 상태에서 다른 창에 접속한 유저가 KING의 월급을 변경할 수 없도록 막는 기능을 LOCK 이라고 합니다."

내가 변경한 데이터를 남이 보려면 내가 commit 해줘야 볼 수 있다.
commit 하지 않으면 내가 변경한 데이터를 다른 사람이 볼 수 없다.

update 를 수행하면 update 를 수행하고 있는 행(row) 에 락(lock) 을 건다.

예 :
update emp 
set sal = 8000 
where ename = 'KING';

설명 : 위와 같이 update를 하면 KING의 전체 행에 락(LOCK)을 겁니다.
다른 창(session) 에 접속한 유저가 KING 의 데이터를 절대로 갱신할 수 없습니다.


예제 : 
도스창 A                           도스창 B

commit;                                      commit;

update emp                                  update emp        
set sal = 9700                                set sal = 8000
where ename='JAMES';                        where ename = 'ALLEN';

설명 : 도스창 A는 JAMES  행에 LOCK 을 걸었고 도스창 B는 ALLEN 의 행에 LOCK 을 건 것이여서 서로 충돌되지 않습니다.

