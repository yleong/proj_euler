#!/usr/bin/python

#fibonacci with dynamic programming. this would be much more tedious in C
#unless I use the naive method without dp

fibdict={}

def fib(n):
    answer = 0
    if n == 1 or n == 2:
        answer = n
    elif n in fibdict.keys():
        answer = fibdict[n]
    else:
        answer  = fib(n-1) + fib(n-2)
        fibdict[n] = answer
    return answer

def main():
    sum = 0
    n = 1
    curr = fib(n)
    while curr < 4e6:
        # print n, ":", curr
        if curr % 2 == 0:
            sum += curr
        n += 1
        curr = fib(n)
    print sum

if __name__ == "__main__":
    main()
