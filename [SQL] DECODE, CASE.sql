
034 IF문을 SQL로 구현하기 1(DECODE)
"if문을 SQL로 구현할 때 사용하는 함수"
만약에 무슨일이 벌어지면 어떻게 행동하라 라고 컴퓨터 프로그래밍을 하는 것인데 

예제 : select ename, sal, deptno, decode (deptno, 10, 5600, 20,4500, 0) as 보너스
		from emp;
		
설명 :  부서번호가 10번이면 5600을 출력하고 부서번호가 20번이면 4500을 출력하고 나머지 부서번호는 0을 출력하라!

문제 103. 이름, 월급, 직업, 보너스를 출력하는데 보너스가 직업이 SALESMAN 이면 4500을 출력하고 직업이  ANALYST면 2400을 출력하고 나머지 직언은 0을 출력하시오!

-> select ename, sal, job, decode (job, 'SALESMAN', 4500, 'ANALYST', 2400 , 0) as 보너스
	from emp;

문제 104.  이름, 입사한년도 4자리로 출력하시오!
-> select ename, to_char(hiredate,'RRRR')
	from emp;
	
문제 105. 이름, 입사한년도, 보너스를 출력하는데 보너스가 입사한 년도가 1980년 이면 5000을 출력하고 1981이면 4000을 출력하고 나머지 년도는 0으로 출력하시오!

-> select ename, to_char(hiredate,'RRRR'), decode(to_char(hiredate,'RRRR'), '1980', 5000, '1981', 4000, 0) as 보너스
    from emp;


중요설명 : decode는 등호(=) 비교만 가능하기 때문에 만약에 부등호 비교를 하려면 case문을 사용해야한다.


035 IF문을 SQL로 구현하기 2(CASE)


문제 106. 이름, 월급, 보너스를 출력하는데 보너스가 월급이 4000이상이면 500을 출력하고 월급이 2000이상이면 300을 출력하고 나머지 사원들은 그냥 0을 출력하시오!
-> select ename, sal, case when sal>=4000 then 500 when sal>=2000 then 300 else 0 end   as 보너스
      from emp;

문제 107. 이름, 월급, 부서번호, 보너스를 출력하는데 보너스가 부서번호가 10번이면 500을 출력하고 부서번호가 20이면 300을 출력하고 나머지 부서번호면 0을 출력하시오!

-> select ename, sal, deptno, case when deptno = 10 then 500 when deptno = 20 then 300 else 0 end as 보너스
    from emp;


문제 108. 우리반 테이블에서 이름을 출력하고 그옆에 보너스를 출력하는데 이름의 철자가 3글자이면 보너스 7000을 출력하고 이름의 철자가 2글자면 보너스를 5000을 출력하고 이름의 철자가 4글자이면 보너스를 4000을 출력하시오!

-> select ename, case when length(ename) = 4 then 4000 when length(ename) = 3 then 7000 when length(ename) = 2 then 5000 end as 보너스
    from emp12;


문제 109. 우리반 테이블로 이름 3글자로만 이름의 가운데 글자를 *로 출력하시오!

	1. 이름의 철자의 갯수가 3글자와 2글자는 아래의 SQL로 수행
-> select replace(ename, substr(ename, 2, 1), '*')
	from emp12;

	2. 이름의 철자의 갯수가 4글자면
->  select replace(ename, substr(ename, -2, 1), '*')
	from emp12;
	
문제 110. 우리반 테이블의 이름의 철자의 갯수와 관계없이 일괄적으로 이름이 *이 아래와 같이 출력되게 하시오!
-> select ename, case when length(ename) = 4 then replace(ename, substr(ename, -2, 1 ), '*') 
				  when length(ename) = 3 then replace(ename, substr(ename, 2,1), '*') 
				  else replace(ename, substr(ename, 2,1), '*') end
     from emp12;

문제 111. emp(사원) 테이블에서 이름을 출력하고 입사한 요일을 출력하는데 입사한 요일이 월화수목금토일 순으로 출력하시오!
-> select ename, hiredate, to_char(hiredate, 'day')
	from emp
	 order by to_char(hiredate-1,'d') asc;
