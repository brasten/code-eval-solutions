# An implementation of caching that always misses. A poor caching strategy, obviously.
#
class NoCache
  def get(subject, &block)
    # just do the thing, return the data
    block[subject]
  end
end

class PrimeNumberFinder
  attr_reader :cache
  
  def initialize(cache: NoCache.new)
    @cache = cache
  end
  
  def previous_primes( number )
    # Base cases
    return [] if number <= 2
    return [2] if number == 3
    
    # Still brute-force, but recursively brute force with CACHING! :-)
    @cache.get(number - 1) do |subject|
      previous_primes(subject).tap do |primes|
        primes << subject if (2...subject).none? { |factor| subject % factor == 0 }
      end
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
