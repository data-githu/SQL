# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 22:00:48 2020

@author: Owner
"""


예제 : 판다스를 이용하지 않고 파이썬으로만 emp3.csv 에서 이름과 월급을 출력하시오!
import csv
file = open("c:\\data\\emp2.csv")
emp_csv = csv.reader(file)
print(emp_csv)
for emp_list in emp_csv:
    print(emp_list)

문제230. 판다스를 이용하지 말고 이름과 월급*12.3을 출력하시오!
import csv
file = open("c:\\data\\emp2.csv")
emp_csv = csv.reader(file)
print(emp_csv)
for emp_list in emp_csv:
    print(emp_list[1],int(emp_list[5])*12.3)


문제231. 위의 결과에서 소수점 첫번째 자리에서 반올림 되게 하시오!
import csv
file = open("c:\\data\\emp2.csv")
emp_csv = csv.reader(file)
print(emp_csv)
for emp_list in emp_csv:
    print(emp_list[1],round(int(emp_list[5])*12.3))

문제232. 판다스를 사용하지 말고 이름과 직업을 출력하는데 직업이 SALESMAN인 사원들만 출력하시오!
import csv
file = open("c:\\data\\emp2.csv")
emp_csv = csv.reader(file)
print(emp_csv)
for emp_list in emp_csv:
    if emp_list[2] == 'SALESMAN':
        print(emp_list[1],emp_list[2])

문제233. 부서번호가 20번인 사원들의 이름과 월급과 부서번호를 출력하시오!

판다스를 이용한 방법:
import pandas as pd
emp = pd.read_csv("c:\\data\\emp3.csv")
print(emp[['ename','sal','deptno']][(emp['deptno'] == 20)])

판다스를 이용하지 않은 방법:
import csv
file = open("c:\\data\\emp2.csv")
emp_csv = csv.reader(file)
print(emp_csv)
for emp_list in emp_csv:
    if emp_list[7] == '20':
        print(emp_list[1],emp_list[5],emp_list[7])