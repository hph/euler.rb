#!/usr/bin/env ruby

require 'prime'
require_relative 'utils'

{
  1  => (0...1000).select { |n| n % 3 == 0 || n % 5 == 0 }.reduce(:+),
  2  => Utils.fibonaccis.take_while { |n| n < 4_000_000 }.select(&:even?)
          .reduce(:+),
  3  => 600_851_475_143.prime_division.flatten.max,
  4  => (100..999).map { |a| (a..999).map { |b| a * b } }.flatten
          .select { |n| n.to_s == n.to_s.reverse }.max,
  5  => (2..20).reduce(:lcm),
  6  => (1...100).reduce(:+)**2 - (1...100).map { |n| n**2 }.reduce(:+),
  7  => Prime.take(10_001).last,
  8  => (0..995).map { |i| Utils.p8[i..i + 4] }.reject { |a| a.member?(0) }
          .max.reduce(:*),
  9  => (1...1000).map do |a|
          (1..a).map do |b|
            Utils.triplets?(a, b, (c = 1000 - a - b)) ? [a, b, c] : []
          end
        end.flatten.reduce(:*),
  10 => Prime.take_while { |n| n < 2_000_000 }.reduce(:+)
}.map { |k, v| puts "##{k}: ".rjust(5) + v.to_s }
