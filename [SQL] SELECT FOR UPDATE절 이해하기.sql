084 SELECT FOR UPDATE절 이해하기
보통 lock 은 update 문을 수행할 때 주로 걸리나 select 를 수행할때는 lock 이 걸리지 않는데 select 를 수행할 때도 lock을 걸고 싶으면 select for update 문을 이용하면 됩니다.
내가 어떤 데이터를 보고 있는 동안 그 누구도 이 데이터를 갱신하지 못하도록 막고 싶을 때 select for update 문을 사용합니다.

예 : 코스트코 밤 9시에 문 닫는데 9시에 매장에 진열된 상품의 갯수를 파악해서 모자란 상품을 주문해서 채워넣으려고 합니다.
-> 9시를 기준으로 지금 매장의 상품들의 상품 갯수를 파악하고 싶다. 항상 10개의 상품이 있어야 하는 커피제품이 있다면 지금 남아있는 것이 3개면 7개를 주문하려고 한다. 그런데 상품의 갯수가 실시간으로 계속 변경되면 새로 주문을 넣을 때 혼란스러우므로 9시 현재를 기준으로 그 어떤 데이터도 갱신하지 못하도록 막아버립니다.

예제 :  
  
도스창 A                                         도스창 B
commit; 

select ename, sal
from emp 
where ename = 'BLAKE'
for update;
								commit;
							     update emp
							     set sal = 0
							    where ename = 'BLAKE'
							

