
079 데이터 수정하기(UPDATE)

"데이터를 수정하는 SQL문"

예제 : update emp
		set sal = 0
		where ename = 'SCOTT';

rollback; -> 위에 했던 작업을 취소하는 문장

문제 301. KING의 월급을 9000으로 변경하시오!
update emp
    set sal = 9000
    where ename = 'KING';

commit; -> 지금까지 변경한 모든 작업을 다 database에 영구히 저장하겠다는 문장
		

문제 302. 직업이 SALESMAN인 사원들의 커미션을 9500으로 수정하시오!
update emp
    set comm = 9500
    where job = 'SALESMAN';