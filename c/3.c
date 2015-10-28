#include <stdio.h>

int main(){
   unsigned long long num = 600851475143LL;
   unsigned long sqrtn = 775146;
   unsigned long i;
   unsigned long biggestFactor = 0;

   for(i = 2L; i < sqrtn; i++){
      if(num % i == 0){
         while (num % i == 0) num = num / i;
         biggestFactor = i > biggestFactor ? i : biggestFactor;
         i = 2L;
      }
   }
   printf("%ld\n", biggestFactor);
   return 0;
}
