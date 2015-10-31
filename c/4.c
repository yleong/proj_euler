#include <stdio.h>
#include <math.h>

const int MIN = 100;
const int MAX = 999;

int isPalindromeStr(char* buff, int bufflen);
void long2str(unsigned long num, char* buff, int bufflen);
int isPalindrome(unsigned long candidate);

int main(){
   int i, j;
   unsigned long candidate; 
   unsigned long maxPalindrome = 0L;

   for(i = MIN; i < MAX; i++){
      for(j = MIN; j < MAX; j++){
        candidate = i * j; 
        if(isPalindrome(candidate)){
            if(candidate > maxPalindrome){
               maxPalindrome = candidate;
            }
        }
      }
   }
   printf("%ld\n", maxPalindrome);
   return 0;
}

int isPalindrome(unsigned long candidate){

   /* we know that the candidate will be smaller than MAX * MAX which has const
    * digits so we will just allocate a fixed char buffer to hold its digits */

   /* we need to +1 to MAXBUFF to hold the \0 string terminator */
   const int MAXBUFF = (int)(ceil(log10(MAX*MAX))) + 1; 
   char buff[MAXBUFF];

   long2str(candidate, buff, MAXBUFF);

   return isPalindromeStr(buff, MAXBUFF);
}

void long2str(unsigned long num, char* buff, int bufflen){

   /* using snprintf because, security is serious business */
   snprintf(buff, bufflen, "%ld", num);

}

int isPalindromeStr(char* buff, int bufflen){
   /* printf(" bufflen %d testing: %s ", bufflen, buff); */
   int numdigits = bufflen - 1;  /* discount the \0 terminator */
   int isPalindrome = 1;
   int i; 

   for(i = 0; i < numdigits; i++){
      if(buff[i] != buff[numdigits-1-i]){
         isPalindrome = 0;
         break;
      }
   }
   /* printf("verdict: %s ", isPalindrome? "palindrome" : "not palindrome\n"); */
   return isPalindrome;   
}
