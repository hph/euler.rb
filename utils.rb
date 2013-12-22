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

  def self.factorial(n)
    return 1 if n <= 1
    factorial(n - 1) * n
  end

  def self.p8_digits
    File.read('data/8.txt').tr("\n", '').split('').map(&:to_i)
  end

  def self.p13_numbers
    File.read('data/13.txt').split("\n").map(&:to_i)
  end

  def self.p42_chars
    to_ord = ->(s) { s.ord - 64 }

    File.read('data/42.txt').tr('"', '').split(',').map do |w|
      w.split('').map(&to_ord)
    end
  end
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
end
