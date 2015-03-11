#!/usr/bin/python

T = raw_input()
nums = []

for i in range(int(T)):
    if int(T) > 100:
        break
    if i >= 0 and i <= 999999999:
        nums.append(raw_input())

def make_largest(n):
    list = []
    if is_valid(n):
        for i in n:
            list.append(i)
        list.sort()
        list.reverse()
    largest = ''.join(str(i) for i in list)
    return largest

def is_valid(n):
    if int(n[0]) == 0 and int(n[1]) != 0:
        return 0
    else:
        return 1

count = 1
for i in nums:
    print "Case #"+str(count)+": "+i+" "+str(make_largest(i))
    count = count + 1


