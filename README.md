euler.rb
========

Solutions to Project Euler problems in functional Ruby.

The solutions aim to be concise and readable but not necessarily optimized and
fast. Some of the problems have more than one solution to illustrate different
algorithms or language features.

You will need to run `bundle` to install dependencies before running the
program (requires Ruby v2.1.0 or higher).

Running `./euler.rb` will show something like this:

    #1: Multiples of 3 and 5 (using Enumerable#select)
    Solution: [REDACTED]
    Duration: 0.000173000

    #1: Multiples of 3 and 5 (using Array#uniq)
    Solution: [REDACTED]
    Duration: 0.000217000

    #1: Multiples of 3 and 5 (using Set#union)
    Solution: [REDACTED]
    Duration: 0.000411000

    #2: Even Fibonacci numbers
    Solution: [REDACTED]
    Duration: 0.000049000

    #3: Largest prime factor
    Solution: [REDACTED]
    Duration: 0.000402000

    #4: Largest palindrome product
    Solution: [REDACTED]
    Duration: 0.375302000

    #5: Smallest multiple
    Solution: [REDACTED]
    Duration: 0.000016000

    #6: Sum square difference
    Solution: [REDACTED]
    Duration: 0.000039000

    #7: 10001st prime
    Solution: [REDACTED]
    Duration: 0.023675000

    #8: Largest product in a series
    Solution: [REDACTED]
    Duration: 0.001503000

    #9: Special Pythagorean triplet
    Solution: [REDACTED]
    Duration: 0.032407000

    #10: Summation of primes
    Solution: [REDACTED]
    Duration: 0.343563000

    #13: Large sum
    Solution: [REDACTED]
    Duration: 0.000311000

    #14: Longest Collatz sequence
    Solution: [REDACTED]
    Duration: 11.016418000

    #15: Lattice paths
    Solution: [REDACTED]
    Duration: 0.000027000

    #16: Power digit sum
    Solution: [REDACTED]
    Duration: 0.000110000

    #17: Number letter counts
    Solution: [REDACTED]
    Duration: 0.003618000

    #18: Maximum path sum I
    Solution: [REDACTED]
    Duration: 0.000193000

    #19: Counting Sundays
    Solution: [REDACTED]
    Duration: 0.000598000

    #20: Factorial digit sum
    Solution: [REDACTED]
    Duration: 0.000100000

    #24: Lexicographic permutations
    Solution: [REDACTED]
    Duration: 0.545315000

    #25: 1000-digit Fibonacci number
    Solution: [REDACTED]
    Duration: 0.086169000

    #29: Distinct powers
    Solution: [REDACTED]
    Duration: 0.014427000

    #35: Circular primes
    Solution: [REDACTED]
    Duration: 10.167205000

    #36: Double-base palindromes
    Solution: [REDACTED]
    Duration: 0.451829000

    #42: Coded triangle numbers
    Solution: [REDACTED]
    Duration: 0.007511000

    #48: Self powers
    Solution: [REDACTED]
    Duration: 0.011340000

    Total duration: 23.078

You may specify a range of problems to solve:

    ./euler.rb  2..4
    #2: Even Fibonacci numbers
    Solution: 4613732
    Duration: 0.000059000

    #3: Largest prime factor
    Solution: 6857
    Duration: 0.000399000

    #4: Largest palindrome product
    Solution: 906609
    Duration: 0.369261000

    Total duration: 0.380

You may also specify a comma-separated list of problems to solve:

    ./euler.rb 2,3,5
    #2: Even Fibonacci numbers
    Solution: 4613732
    Duration: 0.000054000

    #3: Largest prime factor
    Solution: 6857
    Duration: 0.000466000

    #5: Smallest multiple
    Solution: 232792560
    Duration: 0.000016000

    Total duration: 0.370
