013 비교 연산자 배우기 4(IS NULL)

NULL 값을 조회할 때 사용하는 연산자가 is null 입니다.
null 값은 데이터가 없는 상태 또는 알 수 없는 값(unknown) 입니다.

예제 : 이름과 월급과 커미션을 출력하세요!
-> select ename, sal, comm
	from emp;


문제 40. 커미션이 null 인 사원들의 이름과 커미션을 출력하시오!
-> select ename, comm
	from emp
	where comm is null ;



설명 : comm = null  로는 조회할 수 없다. 
왜냐하면 null은 알 수 없는 값이므로 비교 연산자인 = 로는 조회할 수 없다. 
기타 비교 연산자인 is null 을 사용하여야 한다.

문제 41. 커미션이 null이 아닌 사원들의 이름과 커미션을 출력하시오!
-> select ename, comm
	from emp
	where comm is not null ;



문제 42. mgr(관리자의 사원번호)이 null인 사원의 이름과 직업을 출력하시오!
-> select ename, job, mgr
	from emp
	where mgr is null;


설명 : 사장(president)은 관리자 번호(mgr)이 없다.
	
문제 43. 사원번호, 이름, 관리자 번호를 출력하시오!
-> select empno, ename, mgr
	from emp; 

014 비교 연산자 배우기 5(IN)
where 절의 검색조건에서 여러개의 행을 비교할 때는 in을 사용해야 합니다.

예제 : 사원번호가 7788, 7902 인 사원들의 사원번호와 이름을 조회하시오!
-> select empno, ename
	from emp
	where empno in (7788, 7902) ; 

설명 : = 연산자는 하나의 값만 비교할 수 있습니다. 
여러개의 값을 비교할 때는 in을 사용합니다. 

문제 44. 직업이 SALESMAN, ANALYIST 인 사원들의 이름과 직업을 출력하시오!
-> select ename, job
	from emp
	where job in ('SALESMAN', 'ANALYST');

문제 45. 직업이  SALESMAN, ANALYST 가 아닌 사원들의 이름과 직업을 출력하시오!
-> select ename, job
	from emp
	where job not in ('SALESMAN', 'ANALYST');
	
문제 46. 직업이 SALESMAN이 아닌 사원들의 이름과 월급을 출력하시오!
-> select ename, sal, job
	from emp
	where job != 'SALESMAN';
	
문제 47. 위의 결과를 월급이 높은 사원부터 출력하시오!
-> select ename, sal, job
	from emp
	where job != 'SALESMAN'
	order by sal desc ; 

문제 48. 우리반 테이블에서 이름과 나이를 출력하는데 나이가 높은 학생부터 출력하시오!
-> select ename, age, major
	from emp12
	order by age desc;
	
문제 49. 이름과 나이와 주소를 출력하는데 30살 이상인 학생들만 출력하시오!
-> select ename, age, address
	from emp12
	where age >= 30 ;
	
문제 50. 성씨가 김씨인 학생들의 이름과 통신사를 출력하시오!
-> select ename, telecom
	from emp12
	where ename like '김%';
	
문제 51. 전공에 통계를 포함하고 있는 학생들의 이름과 전공을 출력하시오!
-> select ename, major
	from emp12
	where major like '%통계%';
	
설명 : like 연산자를 사용할 때 특정 단어를 포함하고 있는 데이터를 검색하려면 '%단어%' 라고 입력하면 됩니다.

문제 52. 우리반에서 gmail을 사용하는 학생들의 이름과 메일을 출력하시오!
-> select ename, email
	from emp12
	where email like '%gmail%';
	
문제 53. 나이가 27에서 34 사이인 학생들의 이름과 나이를 출력하시오.
-> select ename, age
	from emp12
	where age between 27 and 34;
	
	where age >= 27 and age <=34;
	
문제 54. 나이가 27에서 34 사이가 아닌 학생들의 이름과 나이를 출력하시오!
-> select ename, age
	from emp12
	where age not between 27 and 34;
	
문제 55. 주소가 경기도인 학생들의 이름과 나이와 주소를 출력하시오!
-> select ename, age, address
	from emp12
	where address like '경기%';
	
문제 56. 통신사가 sk, lg 인 학생들의 이름과 통신사를 출력하시오!
-> select ename, telecom
	from emp12
	where telecom in  ('sk', 'lg', 'skt', 'SK');
	
문제 57. 서울에서 사는 학생들의 이름과 나이와 전공을 출력하는데 나이가 높은 학생부터 출력하시오!
-> select ename, major, age
	from emp12
	where address like '서울%'
	order by age desc;
	
문제 58. 이메일이 gmail 과 naver가 아닌 학생들의 이름과 이메일을 출력하세요!
-> select ename, email
	from emp12
	where email not like '%gmail%';
	
	
문제 59. 아래와 같이 결과가 출력되게 하시오!

김주원 학생의 나이는 44세 입니다.
권세원 학생의 나이는 36세 입니다.
	:
	:
	
-> select ename || ' 학생의 나이는 ' || age || '세 입니다.'
	from emp12
	order by age desc; 
	
	
015 논리 연산자 배우기(AND, OR, NOT)

오라클 연산자의 종류는 3가지입니다.
	1. 산술연산자 : * / + -
	2. 비교연산자 : >, <, >=, <=, !=, <>, ^=
	기타 비교연산자 : between and
				   like
				   in
				   is null
	3. 논리연산자 :  and, or, not


예제 : 직업이 SALESMAN이고 월급이 1200 이상인 사원들의 이름과 월급과 직업을 출력하시오!
-> select ename, sal, job
	from emp
	where job = 'SALESMAN' and sal >= 1200;
	
	
설명 : True and True 이면 True 여서 결과가 출력이 됩니다.
	 False and True 이면 False 여서 결과가 출력이 안됩니다.
	 False or True 이면 True 여서 결과가 출력이 됩니다.
	
	
문제 60. 직업이 SALESMAN 이거나 ANALYST 인 사원들의 이름과 월급과 직업을 출력하시오!

-> select ename, sal, job
	from emp
	where job = 'SALESMAN' or job = 'ANALYST' ;
	
	where job in ('SALESMAN', 'ANALYST');
	
문제 61. 성씨가 김씨, 이씨가 아닌 학생들의 이름을 출력하시오!

-> select ename
	from emp12
	where ename not like '김%' and ename not like '이%';

문제 62. 이메일이 gmail 과 naver 가 아닌 학생들의 이름과 이메일을 출력하시오!
-> select ename, email
	from emp12
	where email not like '%gmail%' and email not like '%naver%';
	

