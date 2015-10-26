#!/bin/sh

#I have an idea, I'll just generate it as I go along

curr=1
n=1
nprev=1
sum=0

while [ $curr -lt 4000000 ] #this is quite like powershell
do
   curr=`expr $n + $nprev`
   nprev=$n
   n=$curr
   if [ $(($curr % 2)) = 0 ]; then
      sum=`expr $sum + $curr`
   fi
done
echo $sum
