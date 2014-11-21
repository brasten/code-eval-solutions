# Repo available at: https://github.com/brasten/code-eval-solutions/tree/master/46-PrimeNumbers

# Easily iterate over numbers that might be primes.
#
# Current implementation only returns 2, 3, and all other 
# odd numbers.
#
class PrimeCandidateIterator
  def initialize(opts={})
    @max, @next = opts[:max], (opts[:start] || 2)
  end
  
  def next
    return nil if (@max && @max < @next)  # bail
    
    value = @next  
    @next += (value == 2) ? 1 : 2
    value
  end
end

# Multi-responsibility object -- iterates and collects prime numbers.
# 
# This is not a great OO principle, but it serves our purpose. Minimizes
# allocations.
#
class RewindablePrimesIterator
  attr_reader :primes
  alias :to_a :primes
  
  def initialize(primes)
    @primes, @index, @limit = primes, 0, 0
  end
  
  def rewind_with_limit(limit)
    @limit, @index = limit, 0
  end
  
  # @return [Number, nil]
  #
  def next
    factor = primes[@index]
    return nil if factor.nil? || factor > @limit
    
    @index += 1
    factor
  end
  
  # Adds a number to the collection of primes.
  #
  def add_prime(prime)
    primes << prime
  end
  
end

# This is the driving function.
#
Primes = ->(number) do
  return [] if number <= 2
  return [2] if number == 3

  limiter   = ->(p) { Math.sqrt(p).ceil }
  numbers   = PrimeCandidateIterator.new(start: 3, max: (number-1))
  primes    = RewindablePrimesIterator.new([2])
  
  while subject = numbers.next
    primes.rewind_with_limit( limiter[subject] )
    
    factor_found = false
    while factor = primes.next
      if subject % factor == 0
        factor_found = true
        break
      end
    end
    
    primes.add_prime(subject) unless factor_found
  end
  
  primes.to_a
end 


Formatter = ->(values) do
  values.join(",")
end

# Only execute the behavior if this file is being executed directly.
#
# Otherwise, we're probably trying to test.
#
if __FILE__==$0
  open( ARGV.shift ).each_line do |line|
    puts Formatter[ Primes[line.to_i] ] unless line.chomp.empty?
  end
end
