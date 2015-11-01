#!/usr/bin/zsh

# using zsh for the {$MIN..$MAX} syntax

# I want to explore lists and functions in bash
# Are there no local/function variables in bash/zsh?
# The local keyword doesn't seem to work

MIN=100
MAX=999
maxPalindrome=0
retval=0 #globally reserved function return value

# uses string manipulation syntax from here
# http://www.tldp.org/LDP/abs/html/string-manipulation.html
# it is better to use bash built in instead of calling processes/commands
# e.g. use {#currCandidate} instead of echo $currCandidate | wc -m
isPalindrome () {
   retval=true
   currCandidate=$1
   numlen=${#currCandidate}
   # echo "currcandidate is $currCandidate and numlen is $numlen"
   for k in {0..$(($numlen-1))}; do
      LHS=${currCandidate:$k:1}
      RHS=${currCandidate:$(($numlen-1-$k)):1}
      # echo "lhs is $LHS and rhs is $RHS"
      if [ $LHS != $RHS ]; then
         retval=false
      fi
   done
}

# want to be able to call isPalindrome in line 17 without separate process $() which is slow
for i in {$MIN..$MAX}; do   
   for j in {$MIN..$MAX}; do
      candidate=$(($i * $j))
      # have to retrieve the function return value like this
      isPalindrome $candidate; numIsPalindrome=$retval 
      if $numIsPalindrome && [ $candidate -gt $maxPalindrome ]; then
         maxPalindrome=$candidate
      fi
   done
done
echo $maxPalindrome
