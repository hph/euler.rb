#!/usr/bin/env ruby

require 'prime'
require 'set'

require 'humanize'

require_relative 'utils'

problems do
  solve 1, 'Multiples of 3 and 5 (using Enumerable#select)' do
    (0..999).select { |n| n % 3 == 0 || n % 5 == 0 }.sum
  end

  solve 1, 'Multiples of 3 and 5 (using Array#uniq)' do
    [*(0..999).step(3), *(0..999).step(5)].uniq.sum
  end

  solve 1, 'Multiples of 3 and 5 (using Set#union)' do
    (Set.new((0..999).step(3)) | Set.new((0..999).step(5))).sum
  end

  solve 2, 'Even Fibonacci numbers' do
    Utils.fibonaccis.take_while { |n| n < 4_000_000 }.select(&:even?).sum
  end

  solve 3, 'Largest prime factor' do
    600_851_475_143.prime_division.flatten.max
  end

  solve 4, 'Largest palindrome product' do
    (100..999).map { |a| (a..999).map { |b| a * b } }
      .flatten.select(&:palindrome?).max
  end

  solve 5, 'Smallest multiple' do
    (2..20).reduce(:lcm)
  end

  solve 6, 'Sum square difference' do
    (1..100).sum**2 - (1..100).map { |n| n**2 }.sum
  end

  solve 7, '10001st prime' do
    Prime.take(10_001).last
  end

  solve 8, 'Largest product in a series' do
    digits = Utils.p8_digits

    digits.each_cons(5).map { |d| d.reduce(:*) }.max
  end

  solve 9, 'Special Pythagorean triplet' do
    triplets = ->(a, b) do
      a**2 + b**2 == (1000 - a - b)**2 ? [a, b, 1000 - a - b] : []
    end

    (1..999).map { |a| (1..a).map { |b| triplets.call(a, b) } }.flatten.sum
  end

  solve 10, 'Summation of primes' do
    Prime.take_while { |n| n < 2_000_000 }.sum
  end

  solve 13, 'Large sum' do
    numbers = Utils.p13_numbers

    numbers.sum.to_s[0..9]
  end

  solve 14, 'Longest Collatz sequence' do
    (1..1_000_000).map { |n| [Utils.collatz_sequence_size(n), n] }.max.last
  end

  solve 15, 'Lattice paths' do
    40.choose(20)
  end

  solve 16, 'Power digit sum' do
    (2**1000).digits.sum
  end

  solve 17, 'Number letter counts' do
    (1..1000).map(&:humanize).map { |s| s.tr(' ', '').tr('-', '') }.join.size
  end

  solve 18, 'Maximum path sum I' do
    numbers = Utils.p18_numbers

    (2..numbers.size).map do |i|
      (1..numbers[-i].size).map do |j|
        numbers[-i][j - 1] += [numbers[-i + 1][j - 1], numbers[-i + 1][j]].max
      end
    end
    numbers.first.first
  end

  solve 20, 'Factorial digit sum' do
    100.factorial.digits.sum
  end

  solve 25, '1000-digit Fibonacci number' do
    Utils.fibonaccis.take_while { |n| n.to_s.size < 1000 }.size + 1
  end

  solve 29, 'Distinct powers' do
    (2..100).map { |a| (2..100).map { |b| a**b} }.flatten.uniq.size
  end

  solve 36, 'Double-base palindromes' do
    (0..999_999).select(&:palindrome?).select { |n| n.to_s(2).palindrome? }.sum
  end

  solve 42, 'Coded triangle numbers' do
    words = Utils.p42_chars
    triangles = (1..26).map { |n| (0.5 * n * (n + 1)).to_i }

    words.map(&:sum).select { |n| triangles.member?(n) }.size
  end

  solve 48, 'Self powers' do
    (1..1000).map { |n| n**n }.sum.to_s[-10..-1]
  end
end
