055 데이터 분석 함수로 출력 결과 넘버링 하기(ROW_NUMBER)

"출력결과의 행 앞에 숫자를 차례대로 부여하는 함수"

예 : select row_number() over (order by empno), empno, ename
	from emp; 
	
이렇게 row_number() 함수를 사용하면 언제 유용하냐면, 출력되는 행의 맨위의 3개의 행만 가져와라 또는 맨위의 하나의 행만 가져와라 라고 검색할 때 유용하다. 인라인뷰 (from 절의 서브쿼리)를 배우면 검색할 수 있습니다.


문제 203. 직업이 SALESMAN인 사원들의 이름과 직업을 출력하는데 row_number 함수를 사용해서 맨 앞에 번호 차례대로 부여되게 하시오!
->
select row_number()over(order by ename asc), ename, job
    from emp
    where job = 'SALESMAN';

설명 : order by 다음에 empno 를 써도 되고 ename을 써도 된다. 정렬하고 싶은대로 컬럼을 기술하면 된다.   order by ename 뒤에 정렬규칙을 안쓰면 기본값인 asc로 실행된다.

문제 204. 직업이 SALESMAN인 사원들의 이름과 월급과 직업을 출력하는데 맨앞에 row_number() 함수를 써서 번호가 부여되게 하시오. (월급이 높은 순서대로 출력되면서 번호가 부여되게 하시오)
->
select row_number() over(order by sal desc),ename, sal, job
    from emp
    where job = 'SALESMAN';
