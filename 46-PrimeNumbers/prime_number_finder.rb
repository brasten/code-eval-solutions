class PrimeNumberFinder
  def initialize
    # TODO: Cache
  end
  
  def previous_primes( number )
    # Base cases
    return [] if number <= 2
    return [2] if number == 3
    
    # Brute force calculation
    [2] + (3...number).find_all do |subject|
      (2...subject).none? { |factor| subject % factor == 0 }
    end    
  end
end


if __FILE__==$0
  
end
