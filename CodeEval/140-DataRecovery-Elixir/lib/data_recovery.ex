defmodule DataRecovery do  
  def process(line) do
    resp = line
      |> parse_line_into_hash
      |> build_response
      
    {:ok, resp}
  end
  
  defp build_response(dict) do
    (1..Dict.size(dict))
      |> Enum.map(fn(idx) -> dict[idx] || dict[-1] end)
      |> Enum.join(" ")
  end
    
  defp parse_line_into_hash(line) do
    line 
      |> split_into_words_and_indices
      |> List.zip
      |> List.foldl( HashDict.new, &fold_element/2 )
  end
  
  defp split_into_words_and_indices(line) do
    [words, indices] = 
      String.split( line, [";"] )
        |> Enum.map( fn(x) -> String.split(x, [" "]) end )
        
    [words, indices ++ ["-1"]]
  end
  
  defp fold_element({word, pos}, acc), do: Dict.put(acc, String.to_integer(pos), word)  
end

if Mix.env() != :test do
  input = System.argv() |> Enum.at(0)
  
  if input && File.exists?(input) do
    File.stream!(input, [:read, :utf8])
      |> Enum.map( fn(line) -> 
        String.rstrip(line) 
          |> DataRecovery.process 
        end )
      |> Enum.each( fn({:ok, result}) -> IO.puts(result) end )
  end
end
