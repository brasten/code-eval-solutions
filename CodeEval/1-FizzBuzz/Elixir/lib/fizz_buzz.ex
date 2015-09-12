defmodule FizzBuzz do  
  @moduledoc """
  FizzBuzz.
  
  ## Examples
  The classic Fizz Buzz rules:
  
  iex> FizzBuzz.fizz_buzz(3, 5, 200)
  
  """

  @doc """
  Definitions and implementations for the replace method
  """
  def replace(0, 0, _), do: "FB"
  def replace(0, _, _), do: "F"
  def replace(_, 0, _), do: "B"
  def replace(_, _, x), do: x
  
  @doc """
  Main fizz_buzz method
  """
  def fizz_buzz([fizz_denom, buzz_denom, num]) do
    (1..(num))
    |> Enum.map( &(FizzBuzz.replace(rem(&1,fizz_denom), rem(&1,buzz_denom), &1)) )
    |> Enum.join(" ")
  end
end

#  
if Mix.env() != :test do
  input = System.argv() |> Enum.at(0) || ""
  
  if File.exists?(input) do
    for line <- input |> File.stream! do
      String.rstrip(line) 
      |> String.split(" ") 
      |> Enum.map(&Integer.parse/1)
      |> Enum.map(&(elem(&1, 0)))
      |> FizzBuzz.fizz_buzz
      |> IO.puts
    end
  end
end
