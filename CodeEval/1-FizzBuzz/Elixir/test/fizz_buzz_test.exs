defmodule FizzBuzzTest do
  use ExUnit.Case
  
  test "returns '1 2 F 4 B F 7 8 F B' for [3, 5, 10]" do
    assert "1 2 F 4 B F 7 8 F B" = FizzBuzz.fizz_buzz([3, 5, 10])
  end
  
  test "returns '1 F 3 F 5 F B F 9 F 11 F 13 FB 15' for [2, 7, 15]" do
    assert "1 F 3 F 5 F B F 9 F 11 F 13 FB 15" = FizzBuzz.fizz_buzz([2, 7, 15])
  end
end
