#!/bin/sh

#no need to use $ when declaring variables
#do not put a space surrounding =
sum=0
start=1
end=1000

for i in `seq 1 1000`;
do 
   #$(()) is used to perform arithmetic
   # the spaces are important in [ ] 
   # each condition is surrounded by []
   if [ $(($i % 5)) = 0 ] || [ $(($i % 3)) = 0 ]; then 
      #`expr ` can also be used to do arithmetic
      #somehow no need to prefix sum with $ on LHS
      sum=`expr $sum + $i`
   fi
done

echo $sum
