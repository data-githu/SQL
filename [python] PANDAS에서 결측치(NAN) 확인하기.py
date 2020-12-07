# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 22:06:52 2020

@author: Owner
"""

■ 73. 판다스에서 결측치(NaN) 확인하기
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
print(emp[['ename','comm']])

문제240. 커미션이 결측치인 사원들의 이름과 커미션을 출력하시오!
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
print(emp[['ename','comm']][emp['comm'].isnull()])

문제241. 커미션이 null이 아닌 사원들의 이름과 커미션을 출력하시오!
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
print(emp[['ename','comm']][~emp['comm'].isnull()])

문제242. emp3.csv에 결측치가 있는지 확인하는 방법?
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
print(emp.isnull())

문제243. 위의 결과에서 결측치가 몇개인지 확인하는 방법?
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
print(emp.isnull().sum())

설명 : 결측치가 있으면 데이터 분석하기가 어렵고 머신러닝을 이용한 데이터 분석인 경우 좋은 머신러닝 모델이 나오기가 어렵습니다. 그래서 결측치를 처리해주어야 합니다.

문제244. 타이타닉 데이터에 결측치가 어느 컬럼에 많은지 확인하시오!
import pandas as pd
train = pd.read_csv("c:\\data\\train.csv")
print(train.isnull().sum())
