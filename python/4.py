#!/usr/bin/python

def main():
    candidates = generate(100, 999)
    print getmax(getpalindromes(candidates))

# generate all products made of two 3-digit integers
def generate(first, last):
    setA = set(range(first, last+1))
    setB = set(setA)
    result = set()

    for numA in setA:
        for numB in setB:
            result.add(numA*numB)

    return result

# filter myset to only get the palindromes
def getpalindromes(myset):
    result = set()
    
    for num in myset:
        if ispalindrome(num):
            result.add(num)
    
    return result
    
# checks if num is a palindrome
def ispalindrome(num):
    numstr = str(num) 

    ispalindrome = True
    for i in range(1, len(numstr)):
        if numstr[i] != numstr[len(numstr)-1-i]:
            ispalindrome = False
            break
        
    return ispalindrome
    
# gets max natural number from myset
def getmax(myset):
    mymax = 0 

    for num in myset:
        if num > mymax:
            mymax = num

    return mymax

if __name__ == "__main__":
    main()
