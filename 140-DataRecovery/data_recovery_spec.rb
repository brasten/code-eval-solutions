require 'data_recovery'

describe "Processor[...]" do
  subject(:result) { Processor[input] }
  
  context "with '2000 and was not However, implemented 1998 it until;9 8 3 4 1 5 7 2'" do
    let(:input) { '2000 and was not However, implemented 1998 it until;9 8 3 4 1 5 7 2' }
    
    it "returns 'However, it was not implemented until 1998 and 2000'" do
      expect(result).to eql('However, it was not implemented until 1998 and 2000')
    end
  end
  
  context "with 'programming first The language;3 2 1'" do
    let(:input) { 'programming first The language;3 2 1' }
    
    it "returns 'The first programming language'" do
      expect(result).to eql('The first programming language')
    end
  end
  
  context "with 'programs Manchester The written ran Mark 1952 1 in Autocode from;6 2 1 7 5 3 11 4 8 9'" do
    let(:input) { 'programs Manchester The written ran Mark 1952 1 in Autocode from;6 2 1 7 5 3 11 4 8 9' }
    
    it "returns 'The Manchester Mark 1 ran programs written in Autocode from 1952'" do
      expect(result).to eql('The Manchester Mark 1 ran programs written in Autocode from 1952')
    end
  end
  
end

  
