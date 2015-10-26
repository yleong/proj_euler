#!/usr/bin/python

#the pythonic way would be to use list comprehensions
sum = 0
for i in range(1,1000):
    if i % 3 == 0 or i % 5 == 0:
      sum += i  
print sum
