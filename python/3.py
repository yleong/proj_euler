#!/usr/bin/python
"""
generate list of primes using sieve of eratosthenes
then perform trial division using that?
"""

def main():
    n = 600851475143
    # n = 7913077 * 13 * 2 * 2
    import math
    max = int(math.sqrt(n))

    # primes = sieve(set(range(2, max+1)))
    primes = set(range(2, max+1))
    # print "primes are ", primes

    print n
    # time to prime factorize n
    largestSoFar = 0

    while True:
        found = False
        for p in primes:
            if p > n: break
            if n % p == 0:
                found = True
                print "found prime factor", p
                n = n/p
                print "new n is ", n
                largestSoFar = mymax(p, largestSoFar)
                break
        if not found:
            largestSoFar = mymax(n, largestSoFar)
            break

    print largestSoFar

#will just filter candidates to give you only the primes
def sieve(candidates):
    primes = set()
    while len(candidates) > 0:
        currPrime = smallestInSet(candidates)
        # print "currprime is", currPrime
        primes.add(currPrime)
        removeMultiples(candidates, currPrime)
        # print "currlist is", candidates
    return primes
 
#removes all multiples of num from list
def removeMultiples(myset, num):
    maxnum = biggestInSet(myset)
    currmult = num
    while currmult <= maxnum:
        if currmult in myset: myset.remove(currmult)
        currmult = currmult + num

def smallestInSet(myset):
    smallest = myset.pop()
    myset.add(smallest)
    for x in myset:
        if x < smallest:
            smallest = x
    return smallest

def biggestInSet(myset):
    biggest = myset.pop()
    myset.add(biggest)
    for x in myset:
        if x > biggest:
            biggest = x
    return biggest

def mymax(a, b):
    return a if a > b else b
if __name__ == "__main__":
    main()
