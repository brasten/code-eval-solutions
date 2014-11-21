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

    primes = [2]
    number_iter = PrimeCandidateIterator.new(start: 3, max: (number-1))
    
    while subject = number_iter.next
      factor_iter = FactorCandidateIterator.new(primes, subject)
      found_factor = false
      
      while factor = factor_iter.next
        if subject % factor == 0
          found_factor = true
          break
        end
      end
      
      primes << subject unless found_factor
    end
    
    primes
  end
  
  # Easily iterate over numbers that might be primes. This way we can skip numbers that
  # couldn't possibly be primes (even numbers, 0, 1).
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
  
  # Easily iterate over a subset of prime numbers that could be factors
  # of the provided subject
  #
  class FactorCandidateIterator
    def initialize(primes, subject)
      @index = 0
      @primes = primes  # .dup if thread-safety is more important than perf.
      
      # only need to check factors up to the square root
      # of the subject
      @max_factor = Math.sqrt(subject).ceil
    end
    
    # @return [Number, nil]
    #
    def next
      factor = @primes[@index]
      return nil if factor.nil? || factor > @max_factor
      
      @index += 1
      factor
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
