#! /usr/bin/env bash
################################################################################################################################################################################### 
# FizzBuzz test cases
#
# The script uses a `for` loop to iterate over the numbers from 1 to 100.
# For each number, it checks if it's divisible by 3 and/or 5 using the modulo operator `%`.
# If it's divisible by both, it prints "FizzBuzz". If it's only divisible by 3, it prints "Fizz".
# If it's only divisible by 5, it prints "Buzz". If it's not divisible by either, it prints the number itself.
#
# The script uses the `if` statement to check if the number is divisible by 3 and/or 5.
# If it's divisible by both, it prints "FizzBuzz". If it's only divisible by 3, it prints "Fizz".
# If it's only divisible by 5, it prints "Buzz". If it's not divisible by either, it prints the number itself.
# The `elif` statement is used to check the other conditions if the first condition is not met.
# The `else` statement is used to print the number itself if none of the conditions are met.
#
# The script uses the `(( ))` syntax to perform arithmetic operations.
# The `%` operator is used to check if the number is divisible by 3 and/or 5. The `echo` command is used to print the output to the console.
#
# To summarize, the script is a Bash implementation of the FizzBuzz problem
# that uses a `for` loop, `if` statement, and arithmetic operations to print the numbers from 1 to 100
# with "Fizz", "Buzz", and "FizzBuzz" replacing the numbers that are divisible by 3, 5, and both, respectively.
#
#
# 
# This code (( i % 3 == 0 )) && (( i % 5 == 0 )); is a conditional statement that checks if the value of `i` is divisible by both 3 and 5. 
#
# The `%` operator is the modulus operator, which returns the remainder of the division of `i` by 3 and 5 respectively. If the remainder is 0, then `i` is divisible by that number. 
#
# So, `(( i % 3 == 0 ))` checks if `i` is divisible by 3, and `(( i % 5 == 0 ))` checks if `i` is divisible by 5. 
# 
# The `&&` operator is the logical AND operator, which means that both conditions must be true for the entire statement to be true. 
# 
# Therefore, the entire statement `(( i % 3 == 0 )) && (( i % 5 == 0 ))` checks if `i` is divisible by both 3 and 5, and returns `true` if it is, and `false` otherwise.
#
#
######################################################################################################################################################################################

# set -xv 


# Set constants - Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"


for i in 3 5 15 7 30 98 100 1 0 -3; do
    if (( i == 0 )); then
        echo -e "$COL_YELLOW FizzBuzz $COL_GREEN [+] $COL_RESET"
    elif (( i % 3 == 0 )) && (( i % 5 == 0 )); then
        echo -e "$COL_YELLOW FizzBuzz $COL_GREEN [+] $COL_RESET"
    elif (( i % 3 == 0 )); then
        echo -e "$COL_YELLOW Fizz $COL_GREEN [+] $COL_RESET"
    elif (( i % 5 == 0 )); then
        echo -e "$COL_YELLOW Buzz $COL_GREEN [+] $COL_RESET"
    else
        echo $i
    fi
done