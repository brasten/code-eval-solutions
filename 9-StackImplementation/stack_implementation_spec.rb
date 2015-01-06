require 'stack_implementation'

describe SagerStack do
  specify "objects can be pushed onto stack and popped off" do
    stack = SagerStack.new
    
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    stack.push(5)
    
    expect( stack.pop ).to eql(5)
    expect( stack.pop ).to eql(4)
    expect( stack.pop ).to eql(3)
    expect( stack.pop ).to eql(2)
    expect( stack.pop ).to eql(1)
  end
end
