# Repo available at: https://github.com/brasten/code-eval-solutions/
#

# Processor lambda accepts an input line and returns the result.
#
# Process overview:
#
# * split up input into arrays of words and offsets
#
# * iterate words and offsets, placing word in offset position in
#   a result array
#
# * if the offset array is empty (last word), then our special =xor=
#   variable should now hold the correct position.
#
Processor = ->(input) do
  words, offsets = input.split(";").map(&:split)
  
  result  = Array.new(words.size)
  xors    = 0

  words.each_with_index do |word, idx|
    xors = xors ^ (idx+1)                 # xor sourcery
    
    pos = (offsets.shift || xors).to_i    # get next position
    xors = xors ^ pos                     # more xor sourcery
    
    result[pos-1] = word    
  end
  
  result.join(" ")
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
