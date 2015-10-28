#!/bin/sh

n=$1
maxFact=0
while [ $n -gt 1 ] #this is quite like powershell
do
   sqrt=$(python -c "import math; print math.sqrt($n)") # is this cheating?
   found=false
   for i in $(seq 2 $sqrt);
   do
      if [ $(($n % $i)) = 0 ]; then   # $(()) means treat result as num
         echo "found factor $i of $n"
         if [ $i -gt $maxFact ]; then
            maxFact=$i
            while [ $(($n % $i)) = 0 ] # handle cases e.g. n=1024
            do
               n=$(expr $n / $i)
            done
            found=true
         fi
      fi
   done
   
   # not found means current n is itself prime
   if [ !found ] && [ $n -gt $maxFact ]; then
      maxFact=$n
      n=1
   fi
done
echo $maxFact
