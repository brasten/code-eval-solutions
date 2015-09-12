# Repo at: https://github.com/brasten/code-eval-solutions

Solution = ->(input) do
  
  input.map do |line|
    x, y, rounds = line.split(' ').map(&:to_i)
    
    (1..rounds).map do |round|
      "".tap do |res|
        res << "F" if round % x == 0
        res << "B" if round % y == 0
        res << round.to_s if res.empty?
      end
    end.join(" ")
  end
  
end

if __FILE__==$0
  puts Solution[ open( ARGV.shift ).lines.map(&:chomp) ].join("\n")
end
