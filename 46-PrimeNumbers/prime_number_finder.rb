class PrimeNumberFinder
  def initialize
    # TODO: Cache
  end
  
  def previous_primes( number )
    # Base cases
    return [] if number <= 2
    return [2] if number == 3
    
    # Still brute-force, but recursively brute force! :-)
    subject = number - 1
    previous_primes(subject).tap do |primes|
      primes << subject if (2...subject).none? { |factor| subject % factor == 0 }
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
