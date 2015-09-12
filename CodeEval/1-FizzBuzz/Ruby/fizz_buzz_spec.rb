require 'fizz_buzz'

describe Solution do
  subject(:result) { Solution[input] }
  
  context "with ['3 5 10', '2 7 15']" do
    let(:input) { ['3 5 10', '2 7 15'] }
    
    it "returns ['1 2 F 4 B F 7 8 F B', '1 F 3 F 5 F B F 9 F 11 F 13 FB 15']" do
      expect(result).to eql(['1 2 F 4 B F 7 8 F B', '1 F 3 F 5 F B F 9 F 11 F 13 FB 15'])
    end
  end
  
end
