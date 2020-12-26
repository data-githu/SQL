093 일반 테이블 생성하기(CREATE TABLE)
DDL문 (Data Definition Language) :  create, alter, drop, truncate, rename

예 :  겨울왕국 대본을 오라클에 입력하고 elsa가 더 많이 나오는지 anna 가 더 많이 나오는지 또는 긍정적인 단어가 많이 나오는지 
부정적 단어가 더 많은지 등을 SQL 로 검색하려면 DDL문으로 테이블을 생성할 수 있어야 한다.


예제 : 테이블 생성 스크립트
create table emp500           
( empno number (10),            
  ename varchar2(20),
  sal number(10) ) ;


 컬럼명 데이터 유형(길이)  
1. 문자형 : varchar2, char
2. 숫자형 : number
3. 날짜형 : date


문제 343. emp500 테이블에 아래의 데이터를 입력하세요!
1111 scott 3000
2222 smith 2900

insert into emp500
 values(1111,'scott', 3000);
 
 insert into emp500
 values(2222, 'smith',2900);


문제 344. 아래의 테이블을 생성하는 이름을 501로 해서 생성하시오!
empno
ename
sal
hiredate
deptno

create table emp501
 (empno number(10),
 ename varchar2(20),
 sal number(10),
 hiredate date,
 deptno number(10) );

*datatype 의 유형

데이터 유형         설명

char - 고정길이 문자 데이터유형이고 최대길이가 2000 입니다.
varchar2 - 가변길이 문자 데이터유형이고 최대길이가 4000 입니다.
long - 가변길이 문자 데이터유형이고 최대 2GB 까지 데이터 허용
clob - 문자 데이터 유형이고 최대 4GB 까지 문자 데이터 허용
blob - 바이너리 데이터 유형이고 최대 4GB (사진, 동영상)
number - 숫자데이터 유형이고 최대 38까지 허용
date - 날짜 데이터 유형이고 기원전 4712년 1월 1일 부터 기원 후 9999년 12월 31일까지 날짜를 허용

문제 345. 아래의 emp501 테이블에 데이터를 2건 입력하시오!
insert into emp501(empno, ename, sal, hiredate, deptno)
values (7839, 'KING', 5000,to_date('81/11/17','RR/MM/DD'), 10);

insert into emp501(empno, ename, sal, hiredate, deptno)
values (7698, 'BLAKE', 2850,to_date('81/11/17','RR/MM/DD'), 30);


예제 : long 데이터 타입을 사용하는 방법 테스트
long 데이터 타입은 아주 긴 텍스트 데이터를 입력할 때 사용하는 데이 유형입니다.

create table profile2
(ename varchar2(20), 
self_intro long);


insert into profile2(ename, self_intro)
values ('김인호', '어렸을 때부터 우리집은 가난했었습니다. 그리고 어머니는 짜장면이 싫다고 하셨습니다. 야히 야히야') ; 

문제 346. 겨울왕국 대본을 입력하기 위한 테이블을 winter_kingdom 이라는 이름으로 생성하시오!
create table winter_kingdom
(win_text long);

문제 347. 영화 겨울왕국 대본에는 elsa가 많이 나오는가? anna가 많이 나오는가?
select sum(regexp_count(lower(win_text),'elsa')) as cnt
 from winter_kingdom;

설명 : 카운트 된 숫자들을 sum 함수를 이용해서 다 더한다.


문제 348. 겨울왕국 테이블을 지우고 다시 생성하시오
 drop table winter_kingdom;

 create table winter_kingdom
(win_text varchar2(4000));

select count(*) from winter_kingdom;


select sum(regexp_count(lower(win_text),'elsa')) as elsa, sum(regexp_count(lower(win_text),'anna')) as anna
 from winter_kingdom;

설명 : 위의 SQL이 유용한 경우 ?
	1. 뉴스기사를 분석해서 회사 주식에 영향을 주는지
	(미래에셋의 로보어드바이저)
	2. 외국 케냐의 사례중에 은행 고객 대출 한도를 정할 때 대출 신청자의 SNS 글을 분석해서 긍정적인 단어가 많은지 부정적인 단어가 많은지 분석해서 대출 여부를 결정
	
문제 349. 긍정단어를 저장하기 위한 테이블을 positive 라는 이름으로 아래와 같이 생성하시오!
create table positive
(p_text varchar2(2000) );

문제 350. 부정단어를 저장하기 위한 테이블을 negative 라는 이름으로 아래와 같이 생성하시오!
create table negative
(n_text varchar2(2000) );

문제 351. 긍정단어는 positive 테이블에 입력하고 부정단어는 negative 테이블에 입력하시오!

select count(*) from positive;

select count(*) from negative;


문제 352. 겨울왕국 대본에는 긍정단어가 많은가? 부정단어가 많은가?

	1. from 절 서브쿼리
	2. 조인
	3. regexp_substr

select count(*) 긍정단어
	from (
	select regexp_substr(lower(win_text), '[^ ]+', 1, a) word
		from winter, (select level a from dual connect by level <=15)
		)
	where word in (select lower(p_text) from positive) ;
	
문제 353. 엑셀 데이터를 오라클의 테이블의 데이터로 입력하시오!
(전국 대학교 등록금 현황 데이터를 저장할 테이블을 먼저 아래와 같이 생성하시오!)
create table univ
(division      varchar2 (20),
 type          varchar2(20 ),
 university    varchar2(50),
 campus_type   varchar2( 40),
 admission_fee  number( 20),
 college_fee    number( 20),
 supporting_fee number( 20),
 tuition       number(20 ) ) ;

insert into univ  values('대학','사립','가야대학교','본교',0,5606,0,5606);
insert into univ  values('대학','사립','가야대학교','제2캠퍼스',621,6670.5,0,6671);
insert into univ  values('대학','사립','가천대학교','본교',878.3,8250.1,0,8250);
insert into univ  values('대학','사립','가톨릭대학교','본교',880,6901.9,0,6902);
insert into univ  values('대학','사립','가톨릭대학교','제2캠퍼스',880,8111.3,0,8111);
insert into univ  values('대학','사립','가톨릭대학교','제3캠퍼스',880,6122,0,6122);
insert into univ  values('대학','사립','감리교신학대학교','본교',829,5994,0,5994);
insert into univ  values('대학','사립','강남대학교','본교',893,7418.7,0,7419);
insert into univ  values('대학','국립','강릉원주대학교','본교',166.3,768.6,3420.9,4190);
insert into univ  values('대학','국립','강릉원주대학교','제2캠퍼스',166.9,788.2,3690.7,4479);
insert into univ  values('대학','국립','강원대학교','본교',166,771.6,3303.6,4075);
insert into univ  values('대학','국립','강원대학교','제2캠퍼스',166,787.1,3492.9,4280);
insert into univ  values('대학','사립','건국대학교','본교',938,8133.7,0,8134);
insert into univ  values('대학','사립','건국대학교','캠퍼스',938,7761.7,0,7762);
insert into univ  values('대학','사립','건양대학교','본교',630,6399.4,0,6399);
insert into univ  values('대학','사립','건양대학교','제2캠퍼스',630,7221.2,0,7221);
insert into univ  values('대학','사립','경기대학교','본교',720,7353.8,0,7354);
insert into univ  values('대학','사립','경기대학교','제2캠퍼스',720,6871.2,0,6871);
insert into univ  values('대학','국립','경남과학기술대학교','본교',20,106.3,3666.9,3773);
insert into univ  values('대학','사립','경남대학교','본교',562,6384.5,0,6385);
insert into univ  values('대학','사립','경동대학교','본교',780,6812.4,0,6812);
insert into univ  values('대학','사립','경동대학교','제2캠퍼스',780,7210,0,7210);
insert into univ  values('대학','사립','경동대학교','제3캠퍼스',780,8494.4,0,8494);
insert into univ  values('대학','국립','경북대학교','본교',168,787.1,3516.3,4303);
insert into univ  values('대학','사립','경북외국어대학교','본교',620,5760,0,5760);
insert into univ  values('대학','국립','경상대학교','본교',168,776.9,3140.2,3917);
insert into univ  values('대학','사립','경성대학교','본교',500,6459.8,0,6460);
insert into univ  values('대학','사립','경운대학교','본교',700,7518.9,0,7519);
insert into univ  values('대학','사립','경운대학교','본교',0,7378,0,7378);
insert into univ  values('대학','국립','경인교육대학교','본교',175,660,2530.9,3191);
insert into univ  values('대학','국립','경인교육대학교','제2캠퍼스',0,0,0,0);
insert into univ  values('대학','사립','경일대학교','본교',700,7080.1,0,7080);
insert into univ  values('대학','사립','경주대학교','본교',740,6735.1,0,6735);
insert into univ  values('대학','사립','경희대학교','본교',912,7630.7,0,7631);
insert into univ  values('대학','사립','계명대학교','본교',708,7145.7,0,7146);
insert into univ  values('대학','사립','고려대학교','본교',1031.3,8207.7,0,8208);
insert into univ  values('대학','사립','고려대학교 세종캠퍼스','캠퍼스',1028,8078.5,0,8079);
insert into univ  values('대학','사립','고신대학교','본교',557.9,6642.3,0,6642);
insert into univ  values('대학','국립','공주교육대학교','본교',179,682,2742,3424);
insert into univ  values('대학','국립','공주대학교','본교',166,768,3063.8,3832);
insert into univ  values('대학','사립','관동대학교','본교',770,6988.3,0,6988);
insert into univ  values('대학','사립','광신대학교','본교',427,5998.4,0,5998);
insert into univ  values('대학','사립','광운대학교','본교',954,7804.6,0,7805);
insert into univ  values('대학','사립','광주가톨릭대학교','본교',0,0,0,0);
insert into univ  values('대학','국립','광주과학기술원','본교',0,0,2060,2060);
insert into univ  values('대학','국립','광주교육대학교','본교',178,682,2795.5,3478);
insert into univ  values('대학','사립','광주대학교','본교',492,6487.3,0,6487);
insert into univ  values('대학','사립','광주여자대학교','본교',537,6267,0,6267);
insert into univ  values('대학','사립','국민대학교','본교',887,7801.4,0,7801);
insert into univ  values('대학','국립','군산대학교','본교',168,788.9,3140.3,3929);
insert into univ  values('대학','사립','그리스도대학교','본교',686,6537.1,0,6537);
insert into univ  values('대학','사립','극동대학교','본교',812,7671,0,7671);
insert into univ  values('대학','사립','금강대학교','본교',1000,6600,0,6600);
insert into univ  values('대학','국립','금오공과대학교','본교',170,707.7,3062.6,3770);
insert into univ  values('대학','사립','김천대학교','본교',777,6694,0,6694);
insert into univ  values('대학','사립','꽃동네대학교','본교',750,7154.7,0,7155);
insert into univ  values('대학','사립','나사렛대학교','본교',750,7148.7,0,7149);
insert into univ  values('대학','사립','남부대학교','본교',556,6469.2,0,6469);
insert into univ  values('대학','사립','남서울대학교','본교',600,8016.7,0,8017);
insert into univ  values('대학','사립','남서울대학교','본교',0,7962.5,0,7963);
insert into univ  values('대학','사립','단국대학교','본교',913,8014.7,0,8015);
insert into univ  values('대학','사립','단국대학교','캠퍼스',913,8099.1,0,8099);
insert into univ  values('대학','사립','대구가톨릭대학교','본교',720,7102.5,0,7103);
insert into univ  values('대학','국립','대구교육대학교','본교',177,678,2926,3604);
insert into univ  values('대학','사립','대구대학교','본교',680,6808.8,0,6809);
insert into univ  values('대학','사립','대구예술대학교','본교',628,7965.6,0,7966);
insert into univ  values('대학','사립','대구외국어대학교','본교',600,5246.5,0,5247);
insert into univ  values('대학','사립','대구한의대학교','본교',730,7328.4,0,7328);
insert into univ  values('대학','사립','대신대학교','본교',550,6336.3,0,6336);
insert into univ  values('대학','사립','대전가톨릭대학교','본교',500,5760,0,5760);
insert into univ  values('대학','사립','대전대학교','본교',770,7201.8,0,7202);
insert into univ  values('대학','사립','대전신학대학교','본교',600,5956,0,5956);
insert into univ  values('대학','사립','대진대학교','본교',799,7184.9,0,7185);
insert into univ  values('대학','사립','덕성여자대학교','본교',933,6972.9,0,6973);
insert into univ  values('대학','사립','동국대학교','본교',1024,7929.6,0,7930);
insert into univ  values('대학','사립','동국대학교','캠퍼스',896,7781.6,0,7782);
insert into univ  values('대학','사립','동덕여자대학교','본교',772,7393.5,0,7394);
insert into univ  values('대학','사립','동명대학교','본교',550,6865,0,6865);
insert into univ  values('대학','사립','동서대학교','본교',567,6738.6,0,6739);
insert into univ  values('대학','사립','동신대학교','본교',530,6558.6,0,6559);
insert into univ  values('대학','사립','동아대학교','본교',791,6711.7,0,6712);
insert into univ  values('대학','사립','동양대학교','본교',680,6745.5,0,6746);
insert into univ  values('대학','사립','동의대학교','본교',600,6453.7,0,6454);
insert into univ  values('대학','사립','루터대학교','본교',690,6326.1,0,6326);
insert into univ  values('대학','사립','명지대학교 인문캠퍼스','제2캠퍼스',880,6785,0,6785);
insert into univ  values('대학','사립','명지대학교 자연캠퍼스','본교',880,9117,0,9117);
insert into univ  values('대학','사립','목원대학교','본교',758,7249.4,0,7249);
insert into univ  values('대학','사립','목포가톨릭대학교','본교',484,6462.3,0,6462);
insert into univ  values('대학','국립','목포대학교','본교',168,782.4,3117.5,3900);
insert into univ  values('대학','국립','목포해양대학교','본교',58.3,246.5,3248,3495);
insert into univ  values('대학','사립','배재대학교','본교',713,7164.3,0,7164);
insert into univ  values('대학','사립','백석대학교','본교',730,7881.8,0,7882);
insert into univ  values('대학','국립','부경대학교','본교',169,793,3253.6,4047);
insert into univ  values('대학','사립','부산가톨릭대학교','본교',528.8,6724.5,0,6725);
insert into univ  values('대학','국립','부산교육대학교','본교',178,684,2340,3024);
insert into univ  values('대학','국립','부산대학교','본교',170,789.5,3465.9,4256);
insert into univ  values('대학','사립','부산외국어대학교','본교',600,5964,0,5964);
insert into univ  values('대학','사립','부산장신대학교','본교',600,5832.2,0,5832);
insert into univ  values('대학','사립','삼육대학교','본교',870,7800.9,0,7801);
insert into univ  values('대학','사립','상명대학교','본교',978,7688.2,0,7688);
insert into univ  values('대학','사립','상명대학교','캠퍼스',978,8025.1,0,8025);
insert into univ  values('대학','사립','상지대학교','본교',774,7137.6,0,7138);
insert into univ  values('대학','사립','서강대학교','본교',969,7918.7,0,7919);
insert into univ  values('대학','사립','서경대학교','본교',824,7911.6,0,7912);
insert into univ  values('대학','사립','서남대학교','본교',581.1,6790.3,0,6790);
insert into univ  values('대학','사립','서남대학교','제2캠퍼스',577.5,5861.9,0,5862);
insert into univ  values('대학','국립','서울과학기술대학교','본교',22,198.3,5207,5405);
insert into univ  values('대학','국립','서울과학기술대학교','본교',0,175,4635.6,4811);
insert into univ  values('대학','국립','서울교육대학교','본교',171,650,2438,3088);
insert into univ  values('대학','사립','서울기독대학교','본교',680,7147.9,0,7148);
insert into univ  values('대학','국립','서울대학교','본교',169,5965.9,0,5966);
insert into univ  values('대학','공립','서울시립대학교','본교',92,420.4,1969.2,2390);
insert into univ  values('대학','사립','서울신학대학교','본교',798,6782.4,0,6782);
insert into univ  values('대학','사립','서울여자대학교','본교',881,7504.2,0,7504);
insert into univ  values('대학','사립','서울장신대학교','본교',850,7660.8,0,7661);
insert into univ  values('대학','사립','서원대학교','본교',721,6900.1,0,6900);
insert into univ  values('대학','사립','선문대학교','본교',760,7655.3,0,7655);
insert into univ  values('대학','사립','성결대학교','본교',850,7428.5,0,7429);
insert into univ  values('대학','사립','성공회대학교','본교',836,7144.2,0,7144);
insert into univ  values('대학','사립','성균관대학교','본교',944,8332.5,0,8333);
insert into univ  values('대학','사립','성신여자대학교','본교',932,7698.4,0,7698);
insert into univ  values('대학','사립','세명대학교','본교',710,6854.7,0,6855);
insert into univ  values('대학','사립','세종대학교','본교',990,7790.5,0,7791);
insert into univ  values('대학','사립','세한대학교','본교',535,6174.5,0,6175);
insert into univ  values('대학','사립','송원대학교','본교',500,6085.8,0,6086);
insert into univ  values('대학','사립','수원가톨릭대학교','본교',570,5097,0,5097);
insert into univ  values('대학','사립','수원대학교','본교',855,7464.5,0,7465);
insert into univ  values('대학','사립','숙명여자대학교','본교',913,7835.9,0,7836);
insert into univ  values('대학','국립','순천대학교','본교',170,778,3174.2,3952);
insert into univ  values('대학','사립','순천향대학교','본교',824,7741.9,0,7742);
insert into univ  values('대학','사립','숭실대학교','본교',900,7897.5,0,7898);
insert into univ  values('대학','사립','신경대학교','본교',850,6566.5,0,6567);
insert into univ  values('대학','사립','신라대학교','본교',600,6530,0,6530);
insert into univ  values('대학','사립','아세아연합신학대학교','본교',300,6557.2,0,6557);
insert into univ  values('대학','사립','아주대학교','본교',900,8170.1,0,8170);
insert into univ  values('대학','국립','안동대학교','본교',169,784.3,2969.8,3754);
insert into univ  values('대학','사립','안양대학교','본교',875,7581.9,0,7582);
insert into univ  values('대학','사립','안양대학교','제2캠퍼스',875,7660,0,7660);
insert into univ  values('대학','사립','연세대학교','본교',987,8567.6,0,8568);
insert into univ  values('대학','사립','연세대학교 원주캠퍼스','캠퍼스',987,8374.1,0,8374);
insert into univ  values('대학','사립','영남대학교','본교',712,7309.9,0,7310);
insert into univ  values('대학','사립','영남신학대학교','본교',550,5855.5,0,5856);
insert into univ  values('대학','사립','영동대학교','본교',748,7348.1,0,7348);
insert into univ  values('대학','사립','영산대학교','본교',549,6302.5,0,6303);
insert into univ  values('대학','사립','영산대학교','제2캠퍼스',549,6311,0,6311);
insert into univ  values('대학','사립','영산선학대학교','본교',150,2000,0,2000);
insert into univ  values('대학','사립','예수대학교','본교',449,6675.8,0,6676);
insert into univ  values('대학','사립','예원예술대학교','본교',575,7597.3,0,7597);
insert into univ  values('대학','사립','용인대학교','본교',783,7643.4,0,7643);
insert into univ  values('대학','사립','우석대학교','본교',579,6860.2,0,6860);
insert into univ  values('대학','사립','우송대학교','본교',650,7068.4,0,7068);
insert into univ  values('대학','국립','울산과학기술대학교','본교',300,6177.4,0,6177);
insert into univ  values('대학','사립','울산대학교','본교',687,7286.6,0,7287);
insert into univ  values('대학','사립','원광대학교','본교',577,7161,0,7161);
insert into univ  values('대학','사립','위덕대학교','본교',685,7397.8,0,7398);
insert into univ  values('대학','사립','을지대학교 대전캠퍼스','본교',789,9008.3,0,9008);
insert into univ  values('대학','사립','을지대학교 성남캠퍼스','제2캠퍼스',789,8435,0,8435);
insert into univ  values('대학','사립','이화여자대학교','본교',951,8405.8,0,8406);
insert into univ  values('대학','사립','인제대학교','본교',570,6856.7,0,6857);
insert into univ  values('대학','사립','인제대학교','제2캠퍼스',570,8515.9,0,8516);
insert into univ  values('대학','사립','인천가톨릭대학교','본교',0,5186,0,5186);
insert into univ  values('대학','사립','인천가톨릭대학교','제2캠퍼스',950,7782,0,7782);
insert into univ  values('대학','국립','인천대학교','본교',400,4857.8,0,4858);
insert into univ  values('대학','사립','인하대학교','본교',992,7591.1,0,7591);
insert into univ  values('대학','사립','장로회신학대학교','본교',907,6615.2,0,6615);
insert into univ  values('대학','국립','전남대학교','본교',168,787,3326.7,4114);
insert into univ  values('대학','국립','전남대학교','제2캠퍼스',168,779.2,3288.3,4068);
insert into univ  values('대학','국립','전북대학교','본교',168,781.6,3339.7,4121);
insert into univ  values('대학','국립','전주교육대학교','본교',168,636,2636,3272);
insert into univ  values('대학','사립','전주대학교','본교',650,7003.2,0,7003);
insert into univ  values('대학','사립','제주국제대학교','본교',540,6587.9,0,6588);
insert into univ  values('대학','국립','제주대학교','본교',168.6,770.6,3012.7,3783);
insert into univ  values('대학','사립','조선대학교','본교',634,6780.5,0,6781);
insert into univ  values('대학','사립','중부대학교','본교',600,7168.7,0,7169);
insert into univ  values('대학','사립','중앙대학교 서울캠퍼스','본교',980,7840.8,0,7841);
insert into univ  values('대학','사립','중앙대학교 안성캠퍼스','제2캠퍼스',980,8084.7,0,8085);
insert into univ  values('대학','사립','중앙승가대학교','본교',210,1680,0,1680);
insert into univ  values('대학','사립','중원대학교','본교',769,7116.8,0,7117);
insert into univ  values('대학','국립','진주교육대학교','본교',177,671,2780.3,3451);
insert into univ  values('대학','국립','진주산업대학교','본교',0,96,3092.9,3189);
insert into univ  values('대학','사립','차의과학대학교','본교',779,7161.5,0,7162);
insert into univ  values('대학','사립','창신대학교','본교',600,6254,0,6254);
insert into univ  values('대학','국립','창원대학교','본교',171,784.6,3120.3,3905);
insert into univ  values('대학','사립','청운대학교','본교',770,7468.1,0,7468);
insert into univ  values('대학','국립','청주교육대학교','본교',179,650,2580,3230);
insert into univ  values('대학','사립','청주대학교','본교',800,7822.1,0,7822);
insert into univ  values('대학','사립','초당대학교','본교',400,6512.8,0,6513);
insert into univ  values('대학','사립','초당대학교','본교',0,5410.9,0,5411);
insert into univ  values('대학','사립','총신대학교','본교',883.8,7017.9,0,7018);
insert into univ  values('대학','사립','추계예술대학교','본교',800,8386.9,0,8387);
insert into univ  values('대학','국립','춘천교육대학교','본교',179,680,2508.1,3188);
insert into univ  values('대학','국립','충남대학교','본교',181,790.7,3348.9,4140);
insert into univ  values('대학','국립','충북대학교','본교',166,772.6,3454.2,4227);
insert into univ  values('대학','사립','침례신학대학교','본교',765,5966.6,0,5967);
insert into univ  values('대학','사립','칼빈대학교','본교',830,6640.8,0,6641);
insert into univ  values('대학','사립','탐라대학교','본교',0,6506.8,0,6507);
insert into univ  values('대학','사립','평택대학교','본교',840,7445.8,0,7446);
insert into univ  values('대학','사립','포항공과대학교','본교',674,5580,0,5580);
insert into univ  values('대학','국립','한경대학교','본교',23,189,3872.1,4061);
insert into univ  values('대학','국립','한경대학교','본교',0,174,3063.7,3238);
insert into univ  values('대학','국립','한국과학기술원','본교',346,3416,3312,6728);
insert into univ  values('대학','국립','한국교원대학교','본교',0,0,3187.3,3187);
insert into univ  values('대학','국립','한국교통대학교','본교',45,300,3897.8,4198);
insert into univ  values('대학','국립','한국교통대학교','본교',0,189,3512,3701);
insert into univ  values('대학','사립','한국국제대학교','본교',530,6329.2,0,6329);
insert into univ  values('대학','사립','한국기술교육대학교','본교',230,4616.5,0,4617);
insert into univ  values('대학','사립','한국산업기술대학교','본교',750,9054.8,0,9055);
insert into univ  values('대학','사립','한국산업기술대학교','본교',0,7434,0,7434);
insert into univ  values('대학','사립','한국성서대학교','본교',450,7070.9,0,7071);
insert into univ  values('대학','사립','한국외국어대학교','본교',1007,6726,0,6726);
insert into univ  values('대학','사립','한국외국어대학교','캠퍼스',1007,7499.3,0,7499);
insert into univ  values('대학','국립','한국체육대학교','본교',97.3,378.5,3505.7,3884);
insert into univ  values('대학','사립','한국항공대학교','본교',922,8476.2,0,8476);
insert into univ  values('대학','국립','한국해양대학교','본교',123.3,590,3137.9,3728);
insert into univ  values('대학','사립','한남대학교','본교',721,7220.4,0,7220);
insert into univ  values('대학','사립','한동대학교','본교',900,6915.9,0,6916);
insert into univ  values('대학','사립','한라대학교','본교',700,6931.4,0,6931);
insert into univ  values('대학','사립','한려대학교','본교',484.3,6127,0,6127);
insert into univ  values('대학','사립','한려대학교','본교',0,5581.6,0,5582);
insert into univ  values('대학','사립','한림대학교','본교',921,7468,0,7468);
insert into univ  values('대학','국립','한밭대학교','본교',23,200.8,4250.4,4451);
insert into univ  values('대학','국립','한밭대학교','본교',0,174,3413.7,3588);
insert into univ  values('대학','사립','한북대학교','본교',770,7391.7,0,7392);
insert into univ  values('대학','사립','한서대학교','본교',700,8197,0,8197);
insert into univ  values('대학','사립','한성대학교','본교',826,7610.5,0,7611);
insert into univ  values('대학','사립','한세대학교','본교',945,8250.7,0,8251);
insert into univ  values('대학','사립','한신대학교','본교',926,7192.6,0,7193);
insert into univ  values('대학','사립','한양대학교','본교',977,8385.6,0,8386);
insert into univ  values('대학','사립','한양대학교','캠퍼스',977,8305.9,0,8306);
insert into univ  values('대학','사립','한영신학대학교','본교',500,6650.6,0,6651);
insert into univ  values('대학','사립','한일장신대학교','본교',520,5882,0,5882);
insert into univ  values('대학','사립','한중대학교','본교',627,6824.8,0,6825);
insert into univ  values('대학','사립','협성대학교','본교',800,7346.2,0,7346);
insert into univ  values('대학','사립','호남대학교','본교',520,6458.7,0,6459);
insert into univ  values('대학','사립','호남신학대학교','본교',496,6241.6,0,6242);
insert into univ  values('대학','사립','호서대학교','본교',750,7704.7,0,7705);
insert into univ  values('대학','사립','호원대학교','본교',470,6978.4,0,6978);
insert into univ  values('대학','사립','홍익대학교','본교',996,8183.4,0,8183);
insert into univ  values('대학','사립','홍익대학교 세종캠퍼스','캠퍼스',996,8353.4,0,8353);
insert into univ  values('전문대학','사립','가톨릭상지대학교','본교',700,5505.6,0,5506);
insert into univ  values('전문대학','사립','강동대학교','본교',635,5726.5,0,5727);
insert into univ  values('전문대학','사립','강릉영동대학교','본교',560,5650.1,0,5650);
insert into univ  values('전문대학','사립','강원관광대학교','본교',394,5019.8,0,5020);
insert into univ  values('전문대학','공립','강원도립대학','본교',230,1343,1025,2368);
insert into univ  values('전문대학','사립','거제대학교','본교',686,5964.4,0,5964);
insert into univ  values('전문대학','사립','경기과학기술대학교','본교',602,6331.4,0,6331);
insert into univ  values('전문대학','공립','경남도립거창대학','본교',316,1987.6,853,2841);
insert into univ  values('전문대학','공립','경남도립남해대학','본교',316,1928.2,827.1,2755);
insert into univ  values('전문대학','사립','경남정보대학교','본교',607,6091.9,0,6092);
insert into univ  values('전문대학','사립','경민대학교','본교',800,6416.7,0,6417);
insert into univ  values('전문대학','사립','경복대학교','본교',650,6068.6,0,6069);
insert into univ  values('전문대학','사립','경북과학대학교','본교',706,5606.3,0,5606);
insert into univ  values('전문대학','공립','경북도립대학교','본교',283,1587.3,908,2495);
insert into univ  values('전문대학','사립','경북전문대학교','본교',636,5528.3,0,5528);
insert into univ  values('전문대학','사립','경산1대학교','본교',636,5275.8,0,5276);
insert into univ  values('전문대학','사립','경인여자대학교','본교',710,5909.2,0,5909);
insert into univ  values('전문대학','사립','계명문화대학교','본교',722,5762.3,0,5762);
insert into univ  values('전문대학','사립','계원예술대학교','본교',770,7600,0,7600);
insert into univ  values('전문대학','사립','고구려대학교','본교',300,4335.1,0,4335);
insert into univ  values('전문대학','사립','광양보건대학교','본교',620,5643.7,0,5644);
insert into univ  values('전문대학','사립','광주보건대학교','본교',644,5072.1,0,5072);
insert into univ  values('전문대학','사립','구미대학교','본교',788,5643.8,0,5644);
insert into univ  values('전문대학','사립','국제대학교','본교',665,6309.5,0,6310);
insert into univ  values('전문대학','사립','군산간호대학교','본교',650,6300,0,6300);
insert into univ  values('전문대학','사립','군장대학교','본교',640,5814.4,0,5814);
insert into univ  values('전문대학','사립','기독간호대학교','본교',550,5318,0,5318);
insert into univ  values('전문대학','사립','김천과학대학교','본교',568,5505.1,0,5505);
insert into univ  values('전문대학','사립','김포대학교','본교',700,6291.9,0,6292);
insert into univ  values('전문대학','사립','김해대학교','본교',600,5283.6,0,5284);
insert into univ  values('전문대학','사립','농협대학교','본교',836,4737,0,4737);
insert into univ  values('전문대학','사립','대경대학교','본교',500,6159.1,0,6159);
insert into univ  values('전문대학','사립','대구공업대학교','본교',752,5921.7,0,5922);
insert into univ  values('전문대학','사립','대구과학대학교','본교',778,5626.6,0,5627);
insert into univ  values('전문대학','사립','대구미래대학교','본교',657,5546.4,0,5546);
insert into univ  values('전문대학','사립','대구보건대학교','본교',835,6092.1,0,6092);
insert into univ  values('전문대학','사립','대덕대학교','본교',450,5583.2,0,5583);
insert into univ  values('전문대학','사립','대동대학교','본교',650,5690.7,0,5691);
insert into univ  values('전문대학','사립','대림대학교','본교',721,6555,0,6555);
insert into univ  values('전문대학','사립','대원대학교','본교',623,5609.3,0,5609);
insert into univ  values('전문대학','사립','대전보건대학교','본교',503,5513.3,0,5513);
insert into univ  values('전문대학','사립','동강대학교','본교',400,5122.3,0,5122);
insert into univ  values('전문대학','사립','동남보건대학교','본교',620,6430.6,0,6431);
insert into univ  values('전문대학','사립','동부산대학교','본교',630,6002.7,0,6003);
insert into univ  values('전문대학','사립','동서울대학교','본교',770,6786.1,0,6786);
insert into univ  values('전문대학','사립','동아방송예술대학교','본교',760,7382.6,0,7383);
insert into univ  values('전문대학','사립','동아인재대학교','본교',261.2,4649.5,0,4650);
insert into univ  values('전문대학','사립','동양미래대학교','본교',820,6586.9,0,6587);
insert into univ  values('전문대학','사립','동우대학','본교',0,5644.7,0,5645);
insert into univ  values('전문대학','사립','동원대학교','본교',662,6498.2,0,6498);
insert into univ  values('전문대학','사립','동의과학대학교','본교',590,6212.3,0,6212);
insert into univ  values('전문대학','사립','동주대학교','본교',650,5925.6,0,5926);
insert into univ  values('전문대학','사립','두원공과대학교','본교',670,6465.8,0,6466);
insert into univ  values('전문대학','사립','마산대학교','본교',600,5642,0,5642);
insert into univ  values('전문대학','사립','명지전문대학','본교',811,6372.1,0,6372);
insert into univ  values('전문대학','사립','목포과학대학교','본교',465,5323.4,0,5323);
insert into univ  values('전문대학','사립','문경대학교','본교',524,5568.2,0,5568);
insert into univ  values('전문대학','사립','배화여자대학교','본교',764,5657.7,0,5658);
insert into univ  values('전문대학','사립','백석문화대학교','본교',600,6522.4,0,6522);
insert into univ  values('전문대학','사립','백제예술대학교','본교',600,7496.9,0,7497);
insert into univ  values('전문대학','사립','벽성대학','본교',597,4911,0,4911);
insert into univ  values('전문대학','사립','부산경상대학교','본교',608,5705.8,0,5706);
insert into univ  values('전문대학','사립','부산과학기술대학교','본교',640,6034.6,0,6035);
insert into univ  values('전문대학','사립','부산여자대학교','본교',600,5769.6,0,5770);
insert into univ  values('전문대학','사립','부산예술대학교','본교',650,6193.2,0,6193);
insert into univ  values('전문대학','사립','부천대학교','본교',750,6595.2,0,6595);
insert into univ  values('전문대학','사립','삼육보건대학교','본교',617,5739.2,0,5739);
insert into univ  values('전문대학','사립','상지영서대학교','본교',420,5777.8,0,5778);
insert into univ  values('전문대학','사립','서라벌대학교','본교',600,5400.4,0,5400);
insert into univ  values('전문대학','사립','서영대학교','본교',655,5436.4,0,5436);
insert into univ  values('전문대학','사립','서울여자간호대학교','본교',780,6346,0,6346);
insert into univ  values('전문대학','사립','서울예술대학교','본교',1000,8116.2,0,8116);
insert into univ  values('전문대학','사립','서일대학교','본교',781,6004.9,0,6005);
insert into univ  values('전문대학','사립','서정대학교','본교',669,6257.4,0,6257);
insert into univ  values('전문대학','사립','서해대학','본교',629,5180.7,0,5181);
insert into univ  values('전문대학','사립','선린대학교','본교',500,5703.4,0,5703);
insert into univ  values('전문대학','사립','성덕대학교','본교',300,5182,0,5182);
insert into univ  values('전문대학','사립','세경대학교','본교',650,4885.8,0,4886);
insert into univ  values('전문대학','사립','송곡대학교','본교',500,5001.9,0,5002);
insert into univ  values('전문대학','사립','송원대학','본교',0,5063.8,0,5064);
insert into univ  values('전문대학','사립','송호대학교','본교',515,5282.3,0,5282);
insert into univ  values('전문대학','사립','수성대학교','본교',722,5728.8,0,5729);
insert into univ  values('전문대학','사립','수원과학대학교','본교',689,5529.1,0,5529);
insert into univ  values('전문대학','사립','수원여자대학교','본교',725,6266.6,0,6267);
insert into univ  values('전문대학','사립','순천제일대학교','본교',600,5205.3,0,5205);
insert into univ  values('전문대학','사립','숭의여자대학교','본교',652,5279.5,0,5280);
insert into univ  values('전문대학','사립','신구대학교','본교',790,6546.5,0,6547);
insert into univ  values('전문대학','사립','신성대학교','본교',670,6462.3,0,6462);
insert into univ  values('전문대학','사립','신안산대학교','본교',680,6331.9,0,6332);
insert into univ  values('전문대학','사립','신흥대학교','본교',770,6126.7,0,6127);
insert into univ  values('전문대학','사립','아주자동차대학','본교',700,6326,0,6326);
insert into univ  values('전문대학','사립','안동과학대학교','본교',700,5559.5,0,5560);
insert into univ  values('전문대학','사립','안산대학교','본교',710,5987.6,0,5988);
insert into univ  values('전문대학','사립','양산대학','본교',619,5392.5,0,5393);
insert into univ  values('전문대학','사립','여주대학교','본교',700,6577.7,0,6578);
insert into univ  values('전문대학','사립','연성대학교','본교',680,6404.9,0,6405);
insert into univ  values('전문대학','사립','연암공업대학','본교',700,5470,0,5470);
insert into univ  values('전문대학','사립','영남외국어대학','본교',696,5527.8,0,5528);
insert into univ  values('전문대학','사립','영남이공대학교','본교',740,6086.4,0,6086);
insert into univ  values('전문대학','사립','영진전문대학','본교',763,5992.9,0,5993);
insert into univ  values('전문대학','사립','오산대학교','본교',730,6568.6,0,6569);
insert into univ  values('전문대학','사립','용인송담대학교','본교',709,6295.5,0,6296);
insert into univ  values('전문대학','사립','우송정보대학','본교',510,5549.9,0,5550);
insert into univ  values('전문대학','사립','울산과학대학교','본교',625,6000.1,0,6000);
insert into univ  values('전문대학','사립','웅지세무대학교','본교',724,6975,0,6975);
insert into univ  values('전문대학','사립','원광보건대학교','본교',650,6133.9,0,6134);
insert into univ  values('전문대학','사립','유한대학교','본교',660,6120.8,0,6121);
insert into univ  values('전문대학','사립','인덕대학교','본교',785,6275.4,0,6275);
insert into univ  values('전문대학','사립','인천재능대학교','본교',665,6365.8,0,6366);
insert into univ  values('전문대학','사립','인하공업전문대학','본교',814,6552,0,6552);
insert into univ  values('전문대학','사립','장안대학교','본교',780,6198.3,0,6198);
insert into univ  values('전문대학','사립','적십자간호대학','본교',0,6668,0,6668);
insert into univ  values('전문대학','사립','전남과학대학교','본교',550,5108.2,0,5108);
insert into univ  values('전문대학','공립','전남도립대학교','본교',306,865.9,1040.4,1906);
insert into univ  values('전문대학','사립','전북과학대학교','본교',515,5217.2,0,5217);
insert into univ  values('전문대학','사립','전주기전대학','본교',550,5999.3,0,5999);
insert into univ  values('전문대학','사립','전주비전대학교','본교',650,5879.6,0,5880);
insert into univ  values('전문대학','사립','제주관광대학교','본교',570,4544.4,0,4544);
insert into univ  values('전문대학','사립','제주산업정보대학','본교',0,4383.5,0,4384);
insert into univ  values('전문대학','사립','제주한라대학교','본교',532,4691.5,0,4692);
insert into univ  values('전문대학','사립','조선간호대학교','본교',562,4860,0,4860);
insert into univ  values('전문대학','사립','조선이공대학교','본교',714,5478.7,0,5479);
insert into univ  values('전문대학','사립','진주보건대학교','본교',600,5589.9,0,5590);
insert into univ  values('전문대학','사립','창신대학','본교',0,5272,0,5272);
insert into univ  values('전문대학','사립','창원문성대학','본교',570,5595.9,0,5596);
insert into univ  values('전문대학','사립','천안연암대학','본교',665,6100,0,6100);
insert into univ  values('전문대학','사립','청강문화산업대학교','본교',694,6639.3,0,6639);
insert into univ  values('전문대학','사립','청암대학교','본교',553,5176.9,0,5177);
insert into univ  values('원격대학','사립','한국복지사이버대학','본교',200,2520,0,2520);
insert into univ  values('전문대학','사립','춘해보건대학교','본교',615,6006.7,0,6007);
insert into univ  values('전문대학','공립','충남도립청양대학','본교',292,1324.5,1164,2489);
insert into univ  values('전문대학','공립','충북도립대학','본교',297,887,1202,2089);
insert into univ  values('전문대학','사립','충북보건과학대학교','본교',650,5999,0,5999);
insert into univ  values('전문대학','사립','충청대학교','본교',650,5756.2,0,5756);
insert into univ  values('전문대학','사립','포항대학교','본교',500,5945.8,0,5946);
insert into univ  values('전문대학','사립','한국골프대학','본교',250,4144.4,0,4144);
insert into univ  values('전문대학','사립','한국관광대학교','본교',689,6132.4,0,6132);
insert into univ  values('전문대학','국립','한국농수산대학','본교',0,0,0,0);
insert into univ  values('전문대학','국립','한국복지대학교','본교',93,249,2476.5,2726);
insert into univ  values('전문대학','사립','한국승강기대학교','본교',810,6746,0,6746);
insert into univ  values('전문대학','사립','한국영상대학교','본교',455,5817,0,5817);
insert into univ  values('전문대학','국립','한국철도대학','본교',0,308,1988,2296);
insert into univ  values('전문대학','사립','한림성심대학교','본교',660,5532.1,0,5532);
insert into univ  values('전문대학','사립','한양여자대학교','본교',762,6099.1,0,6099);
insert into univ  values('전문대학','사립','한영대학','본교',550,4968.5,0,4969);
insert into univ  values('전문대학','사립','혜전대학교','본교',500,5791.3,0,5791);
insert into univ  values('전문대학','사립','혜천대학교','본교',546,5792.8,0,5793);
insert into univ  values('원격대학','사립','건양사이버대학교','본교',300,2520,0,2520);
insert into univ  values('원격대학','사립','경희사이버대학교','본교',300,2800,0,2800);
insert into univ  values('원격대학','사립','고려사이버대학교','본교',300,2205,0,2205);
insert into univ  values('원격대학','사립','국제사이버대학교','본교',200,2578.4,0,2578);
insert into univ  values('원격대학','사립','글로벌사이버대학교','본교',300,2469.5,0,2470);
insert into univ  values('원격대학','사립','대구사이버대학교','본교',200,2520,0,2520);
insert into univ  values('원격대학','사립','디지털서울문화예술대학교','본교',300,2625,0,2625);
insert into univ  values('원격대학','사립','부산디지털대학교','본교',200,2423.6,0,2424);
insert into univ  values('원격대학','사립','사이버한국외국어대학교','본교',300,2800,0,2800);
insert into univ  values('원격대학','사립','서울디지털대학교','본교',300,2100,0,2100);
insert into univ  values('원격대학','사립','서울사이버대학교','본교',300,2707.5,0,2708);
insert into univ  values('원격대학','사립','세종사이버대학교','본교',300,2817.2,0,2817);
insert into univ  values('원격대학','사립','숭실사이버대학교','본교',300,2800,0,2800);
insert into univ  values('원격대학','사립','열린사이버대학교','본교',250,2080,0,2080);
insert into univ  values('원격대학','사립','영남사이버대학교','본교',0,0,0,0);
insert into univ  values('원격대학','사립','영진사이버대학','본교',200,2160,0,2160);
insert into univ  values('원격대학','사립','원광디지털대학교','본교',300,2763.8,0,2764);
insert into univ  values('원격대학','사립','한양사이버대학교','본교',300,2803.4,0,2803);
insert into univ  values('원격대학','사립','화신사이버대학교','본교',300,2520,0,2520);
insert into univ  values('기타대학','사립','구세군사관학교','본교',500,6400,0,6400);
insert into univ  values('기타대학','사립','순복음총회신학교','본교',500,5100,0,5100);
insert into univ  values('기타대학','사립','정석대학','본교',0,0,0,0);
insert into univ  values('기타대학','국립','한국방송통신대학교','본교',7,54,648.5,703);
insert into univ  values('기타대학','국립','한국예술종합학교','본교',168,812,4141,4953);
insert into univ  values('기타대학','국립','한국전통문화대학교','본교',153,726.6,2729.7,3456);
insert into univ  values('기타대학','사립','한국정보통신기능대학','본교',0,2200,0,2200);
insert into univ  values('기타대학','사립','한국폴리텍 I 대학 서울강서캠퍼스','본교',0,2318,0,2318);
insert into univ  values('기타대학','사립','한국폴리텍 I 대학 성남캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍 II 대학 인천캠퍼스','본교',0,2318,0,2318);
insert into univ  values('기타대학','사립','한국폴리텍 III 대학 강릉캠퍼스','본교',0,2561,0,2561);
insert into univ  values('기타대학','사립','한국폴리텍 III 대학 춘천캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍 IV 대학 대전캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍 IV 대학 아산캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍 IV 대학 청주캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍 IV 대학 홍성캠퍼스','본교',0,2011,0,2011);
insert into univ  values('기타대학','사립','한국폴리텍 V 대학 김제캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍 VII 대학 울산캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍 섬유패션캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍V대학 광주캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍V대학 목포캠퍼스','본교',0,2011,0,2011);
insert into univ  values('기타대학','사립','한국폴리텍대학 구미캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍대학 대구캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍대학 부산캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍대학 서울정수캠퍼스','본교',0,2318,0,2318);
insert into univ  values('기타대학','사립','한국폴리텍대학 익산캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍대학 창원캠퍼스','본교',0,2261,0,2261);
insert into univ  values('기타대학','사립','한국폴리텍대학 항공캠퍼스','본교',0,2316,0,2316);
insert into univ  values('기타대학','사립','한국폴리텍대학바이오캠퍼스','본교',0,2411,0,2411);
insert into univ  values('기타대학','사립','한국폴리텍대학안성여자캠퍼스','본교',0,2275.5,0,2276);
insert into univ  values('기타대학','사립','한민학교','본교',400,5945.8,0,5946);

commit;

문제 354. 우리나라에서 대학등록금이 가장 비싼 학교는 어디인가?
select university as 대학교, tuition as 등록금
    from univ
    where tuition = (select max(tuition) from univ);

문제 355. 데이터 게시판 34번에 범죄 발생 지역 데이터를 내려받아 테이블을 생성하고 데이터를 입력하시오!

drop table crime_loc;

create  table  crime_loc
( CRIME_TYPE     varchar2(50),
  C_LOC             varchar2(50),
  CNT             number(10) );


Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','아파트',25389);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','집',37787);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','고속도로',151);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','노상',62560);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','상점',29977);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','시장노점',1239);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','숙박업소',9203);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','병원',16053);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','사무실',8416);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','공장',3540);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','공사장',4003);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','창고',2329);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','역대합실',881);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','지하철',737);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','교통',2249);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','유흥접객업소',631);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','유원지',1532);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','학교',3203);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','금융기관',5888);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','의료기관',2719);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','종교기관',2293);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','산야',2393);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','해상',50);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','부대',81);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','구금장소',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','공지',366);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('절도','기타',44333);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','아파트',88);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','집',130);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','고속도로',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','노상',483);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','상점',1188);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','시장노점',21);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','숙박업소',11);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','병원',39);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','사무실',271);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','공장',177);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','공사장',41);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','창고',57);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','역대합실',8);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','지하철',8);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','교통',13);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','유흥접객업소',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','유원지',6);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','학교',15);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','금융기관',26);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','의료기관',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','종교기관',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','산야',8);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','해상',14);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','부대',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','구금장소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','공지',15);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('장물','기타',575);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','아파트',3122);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','집',3172);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','고속도로',32);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','노상',22193);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','상점',2054);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','시장노점',142);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','숙박업소',907);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','병원',3539);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','사무실',1183);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','공장',158);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','공사장',217);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','창고',67);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','역대합실',100);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','지하철',41);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','교통',101);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','유흥접객업소',45);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','유원지',115);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','학교',239);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','금융기관',176);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','의료기관',194);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','종교기관',159);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','산야',624);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','해상',87);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','부대',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','구금장소',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','공지',76);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('손괴','기타',11821);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','아파트',242);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','집',312);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','고속도로',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','노상',280);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','상점',23);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','시장노점',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','숙박업소',43);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','병원',87);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','사무실',40);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','공장',15);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','공사장',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','창고',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','역대합실',8);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','지하철',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','교통',9);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','유흥접객업소',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','유원지',13);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','학교',8);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','금융기관',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','의료기관',19);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','종교기관',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','산야',8);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','해상',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','부대',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','구금장소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','공지',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('살인','기타',131);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','아파트',372);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','집',528);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','고속도로',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','노상',1541);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','상점',487);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','시장노점',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','숙박업소',262);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','병원',275);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','사무실',128);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','공장',16);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','공사장',8);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','창고',6);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','역대합실',13);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','지하철',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','교통',33);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','유흥접객업소',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','유원지',55);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','학교',35);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','금융기관',23);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','의료기관',24);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','종교기관',8);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','산야',12);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','해상',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','부대',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','구금장소',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','공지',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강도','기타',552);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','아파트',354);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','집',450);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','고속도로',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','노상',293);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','상점',66);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','시장노점',9);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','숙박업소',61);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','병원',86);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','사무실',77);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','공장',39);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','공사장',6);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','창고',17);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','역대합실',7);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','지하철',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','교통',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','유흥접객업소',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','유원지',16);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','학교',19);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','금융기관',13);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','의료기관',25);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','종교기관',29);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','산야',8);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','해상',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','부대',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','구금장소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','공지',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('방화','기타',298);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','아파트',2371);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','집',2927);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','고속도로',18);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','노상',3488);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','상점',390);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','시장노점',26);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','숙박업소',2798);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','병원',1362);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','사무실',352);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','공장',26);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','공사장',12);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','창고',24);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','역대합실',298);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','지하철',1339);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','교통',551);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','유흥접객업소',65);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','유원지',227);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','학교',188);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','금융기관',17);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','의료기관',147);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','종교기관',64);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','산야',37);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','해상',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','부대',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','구금장소',14);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','공지',11);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('강간','기타',3184);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','아파트',7603);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','집',7407);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','고속도로',107);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','노상',50270);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','상점',3669);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','시장노점',573);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','숙박업소',2097);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','병원',14142);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','사무실',3526);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','공장',480);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','공사장',349);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','창고',43);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','역대합실',720);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','지하철',508);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','교통',864);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','유흥접객업소',159);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','유원지',1240);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','학교',590);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','금융기관',92);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','의료기관',949);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','종교기관',183);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','산야',105);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','해상',65);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','부대',28);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','구금장소',79);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','공지',31);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭행','기타',13701);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','아파트',5115);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','집',5335);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','고속도로',75);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','노상',29219);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','상점',1973);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','시장노점',434);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','숙박업소',1434);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','병원',9568);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','사무실',2925);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','공장',560);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','공사장',374);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','창고',59);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','역대합실',347);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','지하철',188);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','교통',378);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','유흥접객업소',139);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','유원지',835);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','학교',844);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','금융기관',55);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','의료기관',651);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','종교기관',196);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','산야',181);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','해상',31);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','부대',25);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','구금장소',149);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','공지',53);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('상해','기타',9642);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','아파트',403);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','집',640);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','고속도로',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','노상',624);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','상점',99);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','시장노점',15);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','숙박업소',41);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','병원',247);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','사무실',368);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','공장',17);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','공사장',13);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','창고',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','역대합실',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','지하철',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','교통',12);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','유흥접객업소',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','유원지',16);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','학교',23);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','금융기관',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','의료기관',46);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','종교기관',18);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','산야',10);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','해상',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','부대',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','구금장소',7);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','공지',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('협박','기타',690);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','아파트',218);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','집',180);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','고속도로',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','노상',2154);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','상점',152);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','시장노점',43);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','숙박업소',58);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','병원',382);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','사무실',489);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','공장',37);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','공사장',101);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','창고',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','역대합실',27);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','지하철',12);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','교통',25);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','유흥접객업소',19);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','유원지',124);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','학교',190);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','금융기관',51);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','의료기관',38);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','종교기관',16);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','산야',7);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','해상',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','부대',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','구금장소',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','공지',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('공갈','기타',898);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','아파트',31);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','집',31);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','고속도로',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','노상',84);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','상점',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','시장노점',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','숙박업소',16);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','병원',8);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','사무실',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','공장',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','공사장',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','창고',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','역대합실',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','지하철',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','교통',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','유흥접객업소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','유원지',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','학교',15);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','금융기관',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','의료기관',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','종교기관',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','산야',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','해상',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','부대',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','구금장소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','공지',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('약취와유인','기타',23);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','아파트',71);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','집',96);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','고속도로',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','노상',222);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','상점',19);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','시장노점',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','숙박업소',50);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','병원',31);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','사무실',43);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','공장',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','공사장',6);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','창고',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','역대합실',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','지하철',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','교통',19);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','유흥접객업소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','유원지',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','학교',6);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','금융기관',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','의료기관',47);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','종교기관',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','산야',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','해상',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','부대',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','구금장소',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','공지',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('체포와감금','기타',122);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','아파트',2640);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','집',3089);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','고속도로',53);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','노상',20769);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','상점',1177);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','시장노점',236);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','숙박업소',738);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','병원',7396);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','사무실',1482);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','공장',385);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','공사장',237);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','창고',25);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','역대합실',140);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','지하철',70);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','교통',116);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','유흥접객업소',108);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','유원지',788);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','학교',755);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','금융기관',30);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','의료기관',251);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','종교기관',122);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','산야',109);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','해상',14);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','부대',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','구금장소',18);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','공지',28);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('폭력행위등처벌에관한법률위반','기타',6620);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','아파트',241);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','집',348);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','고속도로',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','노상',17);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','상점',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','시장노점',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','숙박업소',590);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','병원',23);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','사무실',40);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','공장',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','공사장',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','창고',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','역대합실',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','지하철',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','교통',16);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','유흥접객업소',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','유원지',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','학교',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','금융기관',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','의료기관',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','종교기관',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','산야',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','해상',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','부대',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','구금장소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','공지',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('간통','기타',404);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','아파트',625);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','집',2693);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','고속도로',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','노상',105);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','상점',420);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','시장노점',30);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','숙박업소',156);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','병원',976);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','사무실',3706);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','공장',41);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','공사장',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','창고',44);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','역대합실',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','지하철',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','교통',6);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','유흥접객업소',75);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','유원지',47);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','학교',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','금융기관',13);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','의료기관',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','종교기관',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','산야',15);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','해상',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','부대',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','구금장소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','공지',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도박과복표','기타',4300);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','아파트',65);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','집',64);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','고속도로',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','노상',463);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','상점',53);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','시장노점',13);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','숙박업소',19);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','병원',171);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','사무실',35);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','공장',20);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','공사장',12);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','창고',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','역대합실',18);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','지하철',28);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','교통',11);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','유흥접객업소',91);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','유원지',49);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','학교',31);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','금융기관',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','의료기관',25);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','종교기관',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','산야',14);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','해상',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','부대',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','구금장소',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','공지',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('과실치사상','기타',208);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','아파트',56);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','집',41);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','고속도로',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','노상',379);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','상점',58);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','시장노점',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','숙박업소',54);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','병원',76);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','사무실',50);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','공장',337);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','공사장',403);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','창고',16);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','역대합실',20);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','지하철',6);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','교통',39);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','유흥접객업소',15);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','유원지',32);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','학교',28);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','금융기관',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','의료기관',586);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','종교기관',9);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','산야',47);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','해상',158);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','부대',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','구금장소',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','공지',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('업무상과실치사상','기타',381);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','아파트',242);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','집',354);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','고속도로',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','노상',171);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','상점',120);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','시장노점',7);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','숙박업소',58);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','병원',139);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','사무실',53);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','공장',196);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','공사장',28);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','창고',94);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','역대합실',10);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','지하철',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','교통',16);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','유흥접객업소',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','유원지',11);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','학교',27);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','금융기관',6);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','의료기관',7);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','종교기관',16);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','산야',49);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','해상',27);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','부대',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','구금장소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','공지',15);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('실화','기타',423);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','아파트',1254);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','집',2454);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','고속도로',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','노상',153);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','상점',141);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','시장노점',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','숙박업소',175);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','병원',197);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','사무실',279);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','공장',72);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','공사장',17);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','창고',26);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','역대합실',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','지하철',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','교통',7);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','유흥접객업소',9);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','유원지',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','학교',56);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','금융기관',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','의료기관',36);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','종교기관',65);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','산야',17);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','해상',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','부대',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','구금장소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','공지',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('주거침입','기타',586);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','아파트',17);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','집',24);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','고속도로',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','노상',27);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','상점',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','시장노점',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','숙박업소',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','병원',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','사무실',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','공장',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','공사장',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','창고',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','역대합실',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','지하철',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','교통',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','유흥접객업소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','유원지',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','학교',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','금융기관',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','의료기관',9);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','종교기관',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','산야',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','해상',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','부대',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','구금장소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','공지',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('유기','기타',30);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','아파트',142);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','집',11);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','고속도로',489);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','노상',196218);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','상점',55);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','시장노점',30);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','숙박업소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','병원',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','사무실',64);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','공장',11);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','공사장',18);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','창고',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','역대합실',14);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','지하철',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','교통',74);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','유흥접객업소',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','유원지',60);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','학교',24);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','금융기관',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','의료기관',16);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','종교기관',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','산야',15);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','해상',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','부대',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','구금장소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','공지',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('교통사고처리','기타',1123);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','아파트',65);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','집',15);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','고속도로',211);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','노상',42824);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','상점',25);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','시장노점',6);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','숙박업소',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','병원',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','사무실',76);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','공장',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','공사장',7);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','창고',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','역대합실',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','지하철',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','교통',14);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','유흥접객업소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','유원지',21);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','학교',5);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','금융기관',2);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','의료기관',4);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','종교기관',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','산야',1);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','해상',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','부대',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','구금장소',0);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','공지',3);
Insert into CRIME_LOC (CRIME_TYPE,C_LOC,CNT) values ('도로교통법위반','기타',704);

문제 356. 범죄 유형을 출력하는데 중복제거해서 출력하시오!
select distinct crime_type
from crime_loc;

문제 357. 살인이 가장 많이 일어나는 장소가 어디입니까?
select * 
    from crime_loc
    where crime_type = '살인'
    order by cnt desc
    fetch first 1 rows only;

문제 358. 절도가 가장 많이 일어나는 장소가 어디인지 1위부터 3위까지 출력하시오!
select * 
    from crime_loc
    where crime_type = '절도'
    order by cnt desc
    fetch first 1 rows 3 only;


select crime_type, c_loc, rank () over (order by cnt desc) as 순위
    from crime_loc
    where crime_type = '절도'
    fetch first 3 rows  only;



문제 359. 데이터 게시판에서 범죄원인 데이터를 가져와서 오라클 테이블로 구성하고 데이터를 입력하시오!

create table crime_cause
(
crime_type  varchar2(30),
생계형  number(10),
유흥 number(10),
도막 number(10),
허영심 number(10),
복수  number(10),
해고  number(10),
징벌 number(10),
가정불화  number(10),
호기심 number(10),
유혹  number(10),
사고   number(10),
불만   number(10), 
부주의   number(10),
기타   number(10)  );

 insert into crime_cause values( '살인',1,6,0,2,5,0,0,51,0,0,147,15,2,118);
 insert into crime_cause values( '살인미수',0,0,0,0,2,0,0,44,0,1,255,38,3,183);
 insert into crime_cause values( '강도',631,439,24,9,7,53,1,15,16,37,642,27,16,805);
 insert into crime_cause values( '강간강제추행',62,19,4,1,33,22,4,30,1026,974,5868,74,260,4614);
 insert into crime_cause values( '방화',6,0,0,0,1,2,1,97,62,0,547,124,40,339);
 insert into crime_cause values( '상해',26,6,2,4,6,42,18,1666,27,17,50503,1407,1035,22212);
 insert into crime_cause values( '폭행',43,15,1,4,5,51,117,1724,45,24,55814,1840,1383,24953);
 insert into crime_cause values( '체포감금',7,1,0,0,1,2,0,17,1,3,283,17,10,265);
 insert into crime_cause values( '협박',14,3,0,0,0,10,11,115,16,16,1255,123,35,1047);
 insert into crime_cause values( '약취유인',22,7,0,0,0,0,0,3,8,15,30,6,0,84);
 insert into crime_cause values( '폭력행위등',711,1125,12,65,75,266,42,937,275,181,52784,1879,1319,29067);
 insert into crime_cause values( '공갈',317,456,12,51,17,116,1,1,51,51,969,76,53,1769);
 insert into crime_cause values( '손괴',20,4,0,1,3,17,8,346,61,11,15196,873,817,8068);
 insert into crime_cause values( '직무유기',0,1,0,0,0,0,0,0,0,0,0,0,18,165);
 insert into crime_cause values( '직권남용',1,0,0,0,0,0,0,0,0,0,1,0,12,68);
 insert into crime_cause values( '증수뢰',25,1,1,2,5,1,0,0,0,10,4,0,21,422);
 insert into crime_cause values( '통화',15,11,0,1,1,0,0,0,6,2,5,0,2,44);
 insert into crime_cause values( '문서인장',454,33,8,10,37,165,0,16,684,159,489,28,728,6732);
 insert into crime_cause values( '유가증권인지',23,1,0,0,2,3,0,0,0,0,3,0,11,153);
 insert into crime_cause values( '사기',12518,2307,418,225,689,2520,17,47,292,664,3195,193,4075,60689);
 insert into crime_cause values( '횡령',1370,174,58,34,86,341,3,10,358,264,1273,23,668,8697);
 insert into crime_cause values( '배임',112,4,4,0,30,29,0,0,2,16,27,1,145,1969);
 insert into crime_cause values( '성풍속범죄',754,29,1,6,12,100,2,114,1898,312,1051,60,1266,6712);
 insert into crime_cause values( '도박범죄',1005,367,404,32,111,12969,4,8,590,391,2116,9,737,11167);
 insert into crime_cause values( '특별경제범죄',5313,91,17,28,293,507,31,75,720,194,9002,1206,6816,33508);
 insert into crime_cause values( '마약범죄',57,5,0,1,2,19,3,6,399,758,223,39,336,2195);
 insert into crime_cause values( '보건범죄',2723,10,6,4,63,140,1,6,5,56,225,6,2160,10661);
 insert into crime_cause values( '환경범죄',122,1,0,2,1,2,0,0,15,3,40,3,756,1574);
 insert into crime_cause values( '교통범죄',258,12,3,4,2,76,3,174,1535,1767,33334,139,182010,165428);
 insert into crime_cause values( '노동범죄',513,11,0,0,23,30,0,2,5,10,19,3,140,1251);
 insert into crime_cause values( '안보범죄',6,0,0,0,0,0,1,0,4,0,4,23,0,56);
 insert into crime_cause values( '선거범죄',27,0,0,3,1,0,2,1,7,15,70,43,128,948);
 insert into crime_cause values( '병역범죄',214,0,0,0,2,7,3,35,2,6,205,50,3666,11959);
 insert into crime_cause values( '기타',13872,512,35,55,552,2677,51,455,2537,1661,18745,1969,20957,87483);

commit;


문제 360. 살인을 일으키는 가장 큰원인은 무엇인가?

데이터 -> 컬럼 : pivot문
컬럼 -> 데이터 : unpivot문


위의 문제를 풀기 위해서는 컬럼을 데이터로 넣어줘야만 가능합니다.

아래의 SQL은 as 다음에 나오는 쿼리문의 결과를 crime_cause2로 생성하겠다 라는 뜻입니다.

create  table  crime_cause2
as
select *
from crime_cause
unpivot ( cnt for term in (생계형,
유흥,
도막,
허영심,
복수,
해고,
징벌,
가정불화,
호기심,
유혹,
사고,
불만,
부주의,
기타));


select *
from crime_cause2
where crime_type='살인'
order by cnt desc
fetch first 1 rows only;

