057 출력되는 행 제한하기 2(Simple TOP-n Queries)
	"order by 절까지 사용해서 검색하는 SELECT 문의 출력되는 행의 일부를 가져올 때 사용하는 문법"
	
예 : select rownum, empno, ename, sal
        from emp
        order by sal desc;

설명 :  order by 가 수행되기 전에 rownum 이 부여되어서 번호가 뒤죽박죽 섞였다.

예제 : 사원 테이블에 월급이 높은 사원 4명만 출력하시오!
->
select ename, sal
    from emp
    where rownum <=4
    order by sal desc;

설명 : 제대로 출력되지 않았다. 실행순서 때문이다. Emp 테이블에서 맨위의 4명만 가져와서 그 4명만으로 월급이 높은 순서대로 정렬했기 때문입니다. 위의 결과를 제대로 출력하기 위해서는 아래와 같이 top n query와 작성해야 합니다.
->
select ename, sal
    from emp
    order by sal desc
    fetch first 4 rows only;

설명 : fetch는 검색으로 가져오는 데이터를 가져와라 라는 뜻입니다.
First 4 rows only 는 문법인데 그중에 4개의 행만 가져와라 라는 뜻입니다.

문제 208. 우리반에 나이가 가장 많은 학생들의 이름과 나이를 출력하는데 한 5명만 출력하시오!
->
select ename, age
    from emp12
    order by age desc
    fetch first 5 rows only;

문제 209. 직업, 직업별 토탈월급을 출력하는데 직업별 토탈월급이 높은것부터 출력하는데 위쪽에 2개의 행만 출력하시오!
->
select job, sum(sal)
    from emp
    group by job
    order by sum(sal) desc
    fetch first 2 rows only;

