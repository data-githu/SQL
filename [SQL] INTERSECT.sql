
069 집합 연산자로 데이터의 교집합을 출력하기(INTERSECT)

집합 연산자 : 
		    1. 합집합 연산자 : union all, union
			2. 교집합 연산자 : intersect
			3. 차집합 연산자 : minus

예제 : 우리반 테이블을 백업하시오!
create table emp12_backup
	as select * from emp12;

select * from emp12_backup;
		
create table emp12_backup2
as select * from emp12
where ename like '김%';

select * from emp12_backup2;

예제 : 
select ename, age, telecom
    from emp12
    union all
    select ename, age, telecom
    from emp12_backup2;

select ename, age, telecom
    from emp12
    union
    select ename, age, telecom
    from emp12_backup2;

설명 : union은 합집합 연산자인데 중복된 데이터를 제거하고 정렬작업도 수행합니다.

예제 :
select ename, age, telecom
    from emp12
    intersect
    select ename, age, telecom
    from emp12_backup2;

설명 : 두 테이블 사이의 중복된 값을 출력합니다.