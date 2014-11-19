require 'prime_number_finder'
# require 'minitest/autorun'

describe PrimeNumberFinder do
  subject(:finder) { PrimeNumberFinder.new }
  
  describe "#previous_prime(...)" do
    it "returns [2] when called with 3" do
      expect(finder.previous_primes(3)).to eql([2])
    end
  end

  
end
