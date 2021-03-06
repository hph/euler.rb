require 'benchmark'
require 'prime'

module Utils
  def self.fibonaccis
    Enumerator.new do |y|
      a = b = 1
      loop do
        y << a
        a, b = b, a + b
      end
    end
  end

  def self.collatz_sequence_size(n, cache={})
    return cache[n] unless cache[n].nil?
    size = 1
    while n != 1
      if n.even?
        n = n / 2
      else
        n = 3 * n + 1
      end
      size += 1
    end
    cache[n] = size
  end

  def self.p8_digits
    File.read('data/8.txt').tr("\n", '').chars.map(&:to_i)
  end

  def self.p13_numbers
    File.read('data/13.txt').lines.map(&:to_i)
  end

  def self.p18_numbers
    File.read('data/18.txt').lines.map { |l| l[0..-1].split.map(&:to_i) }
  end

  def self.p42_chars
    to_ord = ->(s) { s.ord - 64 }

    File.read('data/42.txt').tr('"', '').split(',').map do |w|
      w.chars.map(&to_ord)
    end
  end
end

def problems
  @problems = if ARGV.first.include?('.')
                Range.new(*ARGV.first.split('..').map(&:to_i))
              else
                @problems = ARGV.first.split(',').map(&:to_i)
              end unless ARGV.empty?
  puts 'Total duration: %.3f' % Benchmark.measure { yield }.real
end

def solve(problem, description)
  return if @problems && !@problems.member?(problem)
  puts "##{problem}: #{description}"
  puts 'Duration: %.9f' % Benchmark.measure { puts "Solution: #{yield}" }.real
  puts
end

module Enumerable
  def sum
    self.reduce(0, :+)
  end
end

class Integer
  def choose(k)
    (self - k + 1..self).reduce(1, :*) / (2..k).reduce(1, :*)
  end

  def factorial
    return 1 if self <= 1
    (self - 1).factorial * self
  end

  def digits
    self.to_s.chars.map(&:to_i)
  end

  def palindrome?
    self.to_s.palindrome?
  end

  def rotations
    digits = self.digits
    (0...digits.size).map { |n| digits.rotate(n).join.to_i }
  end

  @@factors = {}
  def prime_division(generator = Prime::Generator23.new)
    return @@factors[self] if @@factors.key?(self)
    @@factors[self] = Prime.prime_division(self, generator)
  end

  @@primes = {}
  def prime?
    return @@primes[self] if @@primes.key?(self)
    @@primes[self] = Prime.prime?(self)
  end
end

class String
  def palindrome?
    self == self.reverse
  end
end

class Array
  def mult
    self.reduce(:*)
  end
end

class Range
  def product(iterable)
    self.to_a.product(iterable.to_a)
  end
end
