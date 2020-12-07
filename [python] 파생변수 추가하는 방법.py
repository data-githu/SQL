# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 22:05:42 2020

@author: Owner
"""
■ 74. 판다스에서  파생변수 추가하는 방법

import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
emp['sal2'] = emp['sal']
print(emp)


문제245. 판다스를 이용해서 이름과 부서위치를 출력하세요!
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
dept = pd.read_csv("c:\\data\\dept3.csv")
result = pd.merge(emp, dept, how='inner',on='deptno')
print(result[['ename','loc']])

문제246. emp 데이터 프레임에 loc 컬럼을 추가하고 해당 사원의 부서위치로 값을 갱신하시오!
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
dept = pd.read_csv("c:\\data\\dept3.csv")
result = pd.merge(emp, dept, how='inner',on='deptno')
emp['loc']=result['loc']
print(emp)

설명 :  파생변수를 왜 추가하는가?
emp 테이블에서 퇴사할 것 같은 사원이 누구인지 예측하시오!
머신러닝을 이용해서 예측하면 됩니다.
머신러닝이 예측을 잘하려면 좋은 데이터를 주고 학습시켜야 합니다.
파생변수를 추가하면 머신러닝이 예측하기 좋은 데이터가 추가된 것 입니다.

문제247. 직업, 직업별 평균월급을 판다스로 출력하시오!
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
result = emp.groupby('job')['sal'].mean().reset_index()
result['sal'] = result['sal'].astype(int)
print(result)

문제248. emp와 result를 서로 조인해서 조인된 전체 데이터 프레임을 출력하시오!
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
result = emp.groupby('job')['sal'].mean().reset_index()
result['sal'] = result['sal'].astype(int)
result1 = pd.merge(emp, result, how='inner', on='job')
print(result1)

문제249. emp 데이터 프레임에 컬럼을 하나 추가하는데 job_avgsal 로 추가하고 문제 248번에서 구한 직업별 평균월급인 result2['sal_y']이 값으로 값을 갱신하시오!
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
result = emp.groupby('job')['sal'].mean().reset_index()
result['sal'] = result['sal'].astype(int)
result1 = pd.merge(emp, result, how='inner', on='job')
emp['job_avgsal']=result1['sal_y']
print(emp)

설명 : 현업에서 머신러닝 데이터 분석가들이 하는 일중 상당수가 바로 이런 파생변수를 추가하는 작업입니다. 좋은 파생변수를 추가해야 머신러닝이 예측을 잘 할 수 있습니다.
게임회사에서 어떻게 응용하냐면 그 게임을 탈퇴할 것 같은 유저를 머신러닝으로 찾아서 형평성에 어긋나지 않도록 하면서 그 유저가 인식하지 못하도록 조용히 혜택을 줍니다.

문제250. emp 데이터 프레임에 해당 사원이 근무하는 부서번호의 평균월급을 sal_avg 라는 이름으로 파생변수를 생성하시오!
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
result = emp.groupby('deptno')['sal'].mean().reset_index()
result['sal'] = result['sal'].astype(int)
result1 = pd.merge(emp, result, how='inner', on='deptno')
emp['deptno_avgsal']=result1['sal_y']
print(emp)
