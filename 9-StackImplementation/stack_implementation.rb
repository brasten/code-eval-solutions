# Repo available at: https://github.com/brasten/code-eval-solutions/
#

# Stack implementation
#
# This is, of course, a silly thing to implement in Ruby. I can't imagine code
# line this ever ending up in a Ruby application, but it was fun and quick.
#
# This is not a robust implementation, either.
#
class SagerStack  
  def initialize()
    @head = nil
  end
  
  # Pushes an element onto the stack
  #
  # @param [Object]
  #
  def push(obj)
    @head = StackElement.new(obj, head)
  end
  
  # Pops an element off of the stack
  #
  # @return [Object]
  #
  def pop
    return nil if head.nil?
    
    old_head = head
    @head = head.tail
    
    old_head.value
  end
  
  
  private
    attr_reader :head
    
    StackElement = Struct.new(:value, :tail)
    
end

Processor = ->(input) do
  stack = SagerStack.new
  
  input.split.each { |i| stack.push(i.to_i) }
  
  arr = []
  while (elem = stack.pop)
    stack.pop     # Pop off a second element and drop.
    arr << elem
  end

  arr.join(" ")
end

# Only execute the behavior if this file is being executed directly.
#
# Otherwise, we're probably trying to test.
#
if __FILE__==$0
  open( ARGV.shift ).each_line do |line|
    puts Processor[line.chomp] unless line.chomp.empty?
  end
end
