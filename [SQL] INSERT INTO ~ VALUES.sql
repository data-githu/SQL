
078 데이터 입력하기(INSERT)

"테이블에 데이터를 입력하는 SQL 문장"
					데이터 입력할 컬럼들 기술
예 : insert into emp (empno, ename, sal)
	values(1234, 'jack', 4500);
             위의 컬럼 순서대로 값을 기술

문제 295. 사원 테이블에 아래의 데이터를 입력하시오

사원번호 2939
사원이름 jane
월급 4700
입사일 오늘날짜

insert into emp (empno, ename, sal, hiredate)
values(2939,'jane',4700,'20/11/05');

문제 296. 오늘 입사한 사원의 이름과 입사일을 출력하시오!
select ename, hiredate
    from emp
    where hiredate ='20/11/05';

select ename, hiredate
    from emp
    where hiredate = sysdate;
-> 출력되지 않습니다.

설명 : sysdate는 날짜 뿐만 아니라 시분초도 출력되기 때문에 아까 입력했을때 시분초와 지금 조회했을때 시분초가 서로 다르기 때문에 조회되지 않는 것입니다.

delete from emp where empno = 2939;

insert into emp (empno, ename, sal, hiredate)
values (2939, 'jane', 4700, to_date('20/11/05', 'RR/MM/DD') );

중요설명 : 날짜를 입력할 때는 to_date 를 사용해서 입력하세요!
		실패하지 않고 확실하게 날짜데이터를 입력하는 방법입니다.
		위와 같이 날짜를 입력하면 날짜는 정확하게 2020년 11월 05일로 입력되고 시분초는 00시 00분 00초 입력됩니다.


문제 297. 2020년 11월 05일에 입사한 사원의 이름과 입사일을 출력하시오!
select ename, hiredate
    from emp
    where hiredate = to_date('2020/11/05', 'RR/MM/DD')


문제 298. 아래의 데이터를 사원 테이블에 입력하시오!
insert into emp(empno, ename, sal, deptno)
	values(4945, 'mike   ',3000 ,20 );


문제 299. 이름이 mike 인 사원의 이름과 월급을 출력하시오!
select ename, sal
    from emp 
    where ename like 'mike%';

설명 : where 절에 컬럼에는 함수를 가급적 사용하지 않는 것이 검색 성능이 좋아집니다.

