# PRIME NUMBERS #
Source: https://www.codeeval.com/open_challenges/46/

## Solution Justification ##

This solution is kind of a pragmatic compromise between code readability and performance. Moving all the logic
inline would squeeze out a little more performance but is highly unreadable. On the other-hand, an OO design with
better encapsulation, thread-safety, etc would improve readability and maintainability but decrease performance.


## CHALLENGE DESCRIPTION ##

Print out the prime numbers less than a given number N. For bonus points your solution should run in N*(log(N)) time or better. You may assume that N is always a positive integer.

#### INPUT SAMPLE ####

Your program should accept as its first argument a path to a filename. Each line in this file is one test case. Each test case will contain an integer n < 4,294,967,295. E.g.

    10
    20
    100
    
#### OUTPUT SAMPLE ####

For each line of input, print out the prime numbers less than N, in ascending order, comma delimited. (There should not be any spaces between the comma and numbers) E.g.

    2,3,5,7
    2,3,5,7,11,13,17,19
    2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97
