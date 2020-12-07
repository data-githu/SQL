# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 22:12:45 2020

@author: Owner
"""

■ 71. 정수 리스트에서 소수만 걸러내기(filter)
파이썬 내장함수인 filter() 는 리스트와 같은 자료형에서 특정 조건을 만족하는 값만 편리하게 추출할 수 있는 방법을 제공합니다.
filter()의 첫번째 인자는 특정 조건의 값을 추출하는 함수가 입력되며 두번째 인자(입력매개변수) 리스트와 같은 자료형이 입력됩니다.

예제 : 숫자가 나열되어있는 리스트에서 짝수만 추출해내는 코드를 작성
a= [1,2,3,4,5,6,7,8,9,10]

	1. 숫자를 입력하여 짝수이면 결과를 출력하고 홀수면 출력하지 않는 함수를 생성
	def get_even(num):
		if num%2 == 0:
			return num
		else:
			return
	print(get_even(2))
	print(get_even(7))
	2. filter 함수와 get_even 함수를 이용해서 위의 a리스트에서 짝수를 추출하기
	result = filter(get_even, a)
	print(list(result))

문제236. 아래의 리스트에서 숫자가 300이상이면 출력하고 300미만이면 출력되지 않게 하시오!
b=[100,352,254,456,123, 234,567,903]
def get_num(num):
    if num >= 300:
        return num
    else:
        return
result = filter(get_num, b)
print(list(result))

