049 ROW를 COLUMN으로 출력하기(UNPIVOT)
 pivot 문 : 세로 -> 가로
Unpivot문 : 가로 -> 세로

# order2라는 테이블을 생성하고 데이터를 3건 입력한다.
	1. 테이블 생성 스크립트
create table order2
( ename  varchar2(10),
  bicycle  number(10),
  camera   number(10),
  notebook  number(10) );
	2. 데이터 입력 스크립트
insert  into  order2  values('SMITH', 2,3,1);
insert  into  order2  values('ALLEN',1,2,3 );
insert  into  order2  values('KING',3,2,2 );

commit;

예제 : 
select * 
    from order2
    unpivot( 건수 for 물품 in (BICYCLE, CAMERA, NOTEBOOK));

설명 : 가로(컬럼) -> 세로(데이터)
	 위의 SQL 에서 건수와 물품은 SQL 작성자가 마음대로 이름을 명명해도 되는데, 이름을 명명하는대로 컬럼명으로 출력이 된다. 그리고 BICYCLE, CAMERA, NOTEBOOK 은 양쪽에 싱글 쿼테이션 마크를 둘러주지 않아도 됩니다.
