#!/usr/bin/env ruby

require 'prime'
require_relative 'utils'

solve 1, 'Multiples of 3 and 5' do
  multiple_of_3_or_5 = ->(n) { n % 3 == 0 || n % 5 == 0 }

  (0...1000).select(&multiple_of_3_or_5).reduce(:+)
end

solve 2, 'Even Fibonacci numbers' do
  Utils.fibonaccis.take_while { |n| n < 4_000_000 }.select(&:even?).reduce(:+)
end

solve 3, 'Largest prime factor' do
  600_851_475_143.prime_division.flatten.max
end

solve 4, 'Largest palindrome product' do
  palindrome = ->(n) { n.to_s == n.to_s.reverse }

  (100..999).map { |a| (a..999).map { |b| a * b } }
    .flatten.select(&palindrome).max
end

solve 5, 'Smallest multiple' do
  (2..20).reduce(:lcm)
end

solve 6, 'Sum square difference' do
  (1...100).reduce(:+)**2 - (1...100).map { |n| n**2 }.reduce(:+)
end

solve 7, '10001st prime' do
  Prime.take(10_001).last
end

solve 8, 'Largest product in a series' do
  digits = Utils.p8_digits

  (0...5).map do |i|
    digits[i..-1].each_slice(5).reject { |a| a.member?(0) }.max.reduce(:*)
  end.max
end

solve 9, 'Special Pythagorean triplet' do
  triplets = ->(a, b) do
    a**2 + b**2 == (1000 - a - b)**2 ? [a, b, 1000 - a - b] : []
  end

  (1...1000).map { |a| (1..a).map { |b| triplets.call(a, b) } }
    .flatten.reduce(:*)
end

solve 10, 'Summation of primes' do
  Prime.take_while { |n| n < 2_000_000 }.reduce(:+)
end

solve 16, 'Power digit sum' do
  (2**1000).to_s.split('').map(&:to_i).reduce(:+)
end

solve 20, 'Factorial digit sum' do
  Utils.factorial(100).to_s.split('').map(&:to_i).reduce(:+)
end

solve 25, '1000-digit Fibonacci number' do
  Utils.fibonaccis.take_while { |n| n.to_s.size < 1000 }.size + 1
end

solve 29, 'Distinct powers' do
  (2..100).map { |a| (2..100).map { |b| a ** b} }.flatten.uniq.size
end

solve 48, 'Self powers' do
  (1..1000).map { |n| n ** n }.reduce(:+).to_s[-10..-1]
end
