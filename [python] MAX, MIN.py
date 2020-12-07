# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 22:02:45 2020

@author: Owner
"""

■ 72. 최대값, 최소값 구하기(max, min)
예제 : 
a = [8,7,12,55,21,34,15,9,22]
print(max(a))

문제238. 사원테이블에서 최대월급을 출력하시오!
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
print(max(emp['sal']))


import csv
file =open("c:\\data\\emp2.csv")
emp=csv.reader(file)
a=[]
for i in emp:
    a.append(int(i[5]))
print(max(a))


문제239. 우리반 테이블에서 최소나이를 출력하시오!
import pandas as pd
emp122 = pd.read_csv("c:\\data\\emp122.csv")
print(min(emp122['AGE']))

import csv
file = open("c:\\data\\emp1222.csv")
emp=csv.reader(file)
a=[]
for i in emp:
    a.append(int(i[2]))
print(min(a))

