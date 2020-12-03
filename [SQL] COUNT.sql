040 건수 출력하기(COUNT)

"건수를 출력하는 함수"

예제 : 사원 테이블의 인원수를 출력하시오!

select count(empno)
	from emp;
	
문제 145. 직업, 직업별 인원수를 출력하시오!

select count(*)
    from emp
    group by job;

					 부모키 컬럼
설명 : select job, count(empno)
		from emp
		group by job;


문제 146. 나이, 나이별 인원수를 출력하시오!
->
select age,count(*)
    from emp12
    group by age;

문제 147. 위의 결과를 다시 출력하는데 나이별 인원수가 높은 것 부터 출력하시오!
->
select age,count(*)
    from emp12
    group by age
    order by age desc;

문제 148. 위의 결과를 다시 출력하는데 나이별 인원수가 두명 이상인 것만 출력하시오!
->
select age,count(*)
    from emp12
    group by age
    having count(*) >= 2
    order by age desc;

문제 149. 통신사와 통신사별 인원을 출력하시오!
->
select substr(lower(telecom),1,2), count(*)
    from emp12
    group by substr(lower(telecom),1,2);

문제 150. 이름, 이메일의 도메인만 출력하시오!
select ename, substr(substr(email,instr(email,'@')+1),1,instr(substr(substr(email,instr(email,'@')+1),1),'.')-1)
    from emp12;

문제 151. 이메일의 도메인별 인원을 출력하시오!
select substr(substr(email,instr(email,'@')+1),1,instr(substr(substr(email,instr(email,'@')+1),1),'.')-1), count(*)
    from emp12
    group by substr(substr(email,instr(email,'@')+1),1,instr(substr(substr(email,instr(email,'@')+1),1),'.')-1);

문제 152. 주소, 주소별 인원수를 아래와 같이 출력하시오!

서울시 19
안산시 19

->
select substr(address,1,3), count(*)
    from emp12
    where 
    group by substr(address,1,3);