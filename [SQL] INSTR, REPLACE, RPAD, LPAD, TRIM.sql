019 문자에서 특정 철자의 위치 출력하기(INSTR)

특정 철자의 자릿수 출력하는 함수
예제 : select instr('smith','m')
		from dual;
		
예제 : 우리반 테이블에서 이메일을 출력하고 그 옆에 이메일에서 @가 몇번째 자리에 있는지 출력하시오!
-> select email, instr(email,'@')
	from emp12;

예제 : 우리반 테이블의 이메일에서 @ 앞에까지의 철자를 잘라내시오!
-> select email, substr(email,1,instr(email,'@')-1)
		from emp12;
		
		
문제 70. (점심시간문제) 이메일을 출력하고 그 옆에 이메일의 도메일을 출력하시오!
-> select email, substr(substr(email,instr(email,'@')+1),1,instr(substr(substr(email,instr(email,'@')+1),1),'.')-1)
    from emp12;


020 특정 철자를 다른 철자로 변경하기(REPLACE)
문법 : replace (컬럼명, 대체전 문자, 대체후 문자)

특정 철자를 다른 철자로 변경하는 함수

예제 : select replace('smith','m','k')
		from dual;
		
문제 71. 사원 테이블에서 이름과 월급을 출력하는데 월급을 출력할 때 숫자 0을 *로 출력하시오!
-> select ename, replace(sal,'0','*')
	from emp;

문제 72. 우리반 테이블에서 이름을 출력하고 그 옆에 이름에 두번째 철자를 출력하시오!
-> select ename, substr(ename, 2, 1)
	from emp12; 
	
	
문제 73. 아산병원 전광판 구현하시오!
-> select ename, replace(ename,substr(ename,2,1),'*')
	from emp12;
	
문제 74. 남궁솔미 데이터를 입력하고 남궁*미로 출력되게 하시오! 
(다음에 다시…이름이 2글자인 분이 계셔서)
alter table emp12
modify ename varchar2(30);

insert into emp12(ename,age)
values('남궁솔미',27);
commit;
select * from emp12;
------------------------------------------------------
update emp12
set email = 'icecream2@naver.com'
where ename='이신성';

commit;

-> select ename, replace(ename,substr(ename,-2,1),'*')
	from emp12;

021 특정 철자를 N개 만큼 채우기(LPAD, RPAD)

항상 고정된 자릿수를 보장하기 위해서 필요한 함수

문법 : lpad(컬럼명, 전체 자릿수, 채워넣을값)

예제 : select sal, lpad(sal,10,'*')
        from emp;

select sal, rpad(sal,10,'*')
        from emp;
        
설명 : lpad(sal,10,'*') 의 뜻은 월급을 출력하는데 전체를 10자리로 잡고 월급으르 출력하고 남은 왼쪽자리에 *를 채워넣겠다 라는 뜻이다. 
-> l : left/ r : right



022 특정 철자 잘라내기(TRIM, RTRIM, LTRIM)

공백을 잘라낼때 많이 사용하는 함수
공백때문에 데이터 검색이 안되는 경우가 종종있기 때문에 trim 함수를 자주 사용합니다.

문제 75. 경기도 사는 학생의 이름과 주소를 출력하시오! 와일드 카드를 양쪽에 사용하지 말고 한쪽에만 사용해서 출력하시오!

-> select ename, address
	from emp12
	where trim(address) like '경기도%';
	
ltrim : 왼쪽에 있는 공백 삭제
rtrim : 오른쪽에 있는 공백 삭제
trim : 양쪽에 있는 공백 삭제


문제 76. 정보통계학과가 전공인 학생의 이름과 나이와 전공을 출력하시오!
-> select ename, age, major
	from emp12
where trim(major) like '정보통계%';