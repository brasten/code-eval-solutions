class PrimeNumberFinder
  
  # Reversing course a bit:
  #
  # Caching may be useful but was an unnecessary pre-optimization; recursion
  # is probably not the right approach here.
  #
  # Instead focusing on reducing operations to a minimum using obvious prime-finding rules:
  # - even numbers are out
  # - only factors less than the square-root of the subject should be checked
  # - ... and then only prime factors.
  #
  def previous_primes( number )
    # Base cases
    return [] if number <= 2
    return [2] if number == 3

    limiter   = ->(p) { Math.sqrt(p).ceil }
    numbers   = PrimeCandidateIterator.new(start: 3, max: (number-1))
    primes    = RewindablePrimesIterator.new([2])
    
    while subject = numbers.next
      primes.rewind_with_limit( limiter[subject] )
      
      while factor = primes.next
        primes.add_prime(subject) if subject % factor == 0
      end
    end
    
    primes
  end
  
  # Easily iterate over numbers that might be primes.
  #
  # Current implementation only returns 2, 3, and all other 
  # odd numbers.
  #
  class PrimeCandidateIterator
    def initialize(start:nil, max:nil)
      @max  = max
      @next = (start || 2)
    end
    
    # @return [Number, nil]
    #
    def next
      return nil if (@max && @max < @next)  # bail
      
      ret_val = @next  
      @next = (@next == 2) ? 3 : @next += 2      
      ret_val
    end
  end
  
  # Multi-responsibility object -- iterates and collects prime numbers.
  # 
  # This is not a great OO principle, but it serves our purpose. Minimizes
  # allocations.
  #
  class RewindablePrimesIterator
    attr_reader :primes
    
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
    
    # Adds a number to the collection of primes. Also, fast-forwards
    # the iterator so that subsequent #next() calls return nil.
    #
    def add_prime(prime)
      @limit = 0
      primes << prime
    end
  end
end

Formatter = ->(values) {
  values.join(",")
}

# Only execute the behavior if this file is being executed directly.
#
# Otherwise, we're probably trying to test.
#
if __FILE__==$0
  finder = PrimeNumberFinder.new

  open( ARGV.shift ).each_line do |line|
    puts Formatter[ finder.previous_primes(line.to_i) ]
  end
end
