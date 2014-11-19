#!/usr/bin/env ruby

require_relative 'prime_number_finder'

finder = PrimeNumberFinder.new

open( ARGV.shift ).each_line do |line|
  puts finder.previous_primes(line.to_i).join(",")
end
