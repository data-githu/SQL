
056 출력되는 행 제한하기 1(ROWNUM)
	
"rownum"을 이용하면 출력되는 행의 갯수를 제한할 수 있습니다."

예제 : 
select rownum, empno, ename, sal
from emp
where rownum <=3;

설명 : row_number() 함수와는 다르게 인라인뷰(from 절의 서브쿼리)를 사용하지 않고 위의 3개의 행만 가져와라 같은 데이터 검색을 할 수 있다.

문제 205. 직업이 SALESMAN 인 사원들의 데이터 중 2개만 출력하시오! (사원이름, 직원과 월급을 출력하시오)
->
select rownum,ename, job, sal
    from emp
    where job = 'SALESMAN' and rownum <=2;

문제 206. 위의 결과에서 한건만 출력되게 하시오!
->
select rownum,ename, job, sal
    from emp
    where job = 'SALESMAN' and rownum <=1;

아래의 SQL의 결과는 없습니다.

select rownum,ename, job, sal
    from emp
    where job = 'SALESMAN' and rownum =2;

왜냐하면? Rownum쓸때는 부등호 비교와 같이 사용해야 합니다.
		등호 비교는 숫자 1만 비교됩니다.

Select rownum, ename, job, sal
	From emp
	Where rownum between 2 and 5;
	
설명 : 실제로 위의 SQL 의 결과를 보려면 인라인뷰를 사용해야합니다.

문제 207. 우리반 테이블의 데이터를 가져오는데 위의 3건만 가져와서 출력하시오!
->
select *
    from emp12
    where rownum <=3;