
Processor = ->(input) do
  
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
