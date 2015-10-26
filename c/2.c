#include <stdio.h>

unsigned long long fib(int n){
   if(n <= 3) return n;
   else return fib(n-1) + fib(n-2);
}
int main(){
   int n = 1;
   unsigned long long curr = fib(n);
   unsigned long long sum = 0LL;
   do{
      if( (curr % 2LL) == 0LL){
         sum += curr;
      }
      n++;
      curr = fib(n);
   } while (curr < 4000000LL);

   printf("sum: %lld\n", sum);
   return 0;
}
