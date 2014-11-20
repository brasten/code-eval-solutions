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

    subject = 3
    while( subject < number ) #skipping all even numbers
      found_factor = false
      factor_index = 0
      
      factor = primes[factor_index]
      while( factor && (factor <= Math.sqrt(subject).ceil) )
        if subject % factor == 0
          found_factor = true
          break
        end

        factor_index += 1
        factor = primes[factor_index]
      end

      primes << subject unless found_factor
            
      subject += 2
    end
    
    primes
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
