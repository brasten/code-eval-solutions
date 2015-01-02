defmodule DataRecovery do  
  def process(sender, file_name) do
    send sender, {:ok, "BLAAAH."}
  end
end

if Mix.env() != :test do
  input = System.argv() |> Enum.at(0)
end
