require 'benchmark'

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

def problems(&block)
  puts 'Total duration: %.3f' % Benchmark.measure { yield }.real
end

def solve(problem, description, &block)
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
end

class String
  def palindrome?
    self == self.reverse
  end
end
