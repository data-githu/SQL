# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 22:03:29 2020

@author: Owner
"""

문제251. 판다스로 이름과 월급을 출력하는데 월급이 높은 사원부터 출력하시오!
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
result = emp.sort_values('sal', ascending = False)
print(result)

설명 : 판다스를 사용할 때 데이터 정렬하려면 위와 같이 sort_values 함수를 이용하면 됩니다. 
ascending = True : 낮은값에 높은값 순으로 정렬하겠다.
ascending = False : 높은값에 낮은값 순으로 정렬하겠다.

문제252. 아래의 SQL을 판다스로 구현하시오!
SQL> 
select job, sum(sal)
	from emp
	group by job
	having sum(sal) >= 6000
	order by sum(sal) desc;
	

import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
result = emp.groupby('job')['sal'].sum().reset_index()
result = result[['job','sal']][result['sal']>=6000]
result = result.sort_values('sal',ascending=False)
print(result)
