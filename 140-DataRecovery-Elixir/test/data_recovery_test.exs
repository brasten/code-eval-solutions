defmodule DataRecoveryTest do
  use ExUnit.Case

  test "returns correct response for \"2000 and was not However, implemented 1998 it until;9 8 3 4 1 5 7 2\"" do
    {:ok, result} = DataRecovery.process("2000 and was not However, implemented 1998 it until;9 8 3 4 1 5 7 2")
    
    assert result == "However, it was not implemented until 1998 and 2000"
  end
    
  test "returns correct response for \"programming first The language;3 2 1\"" do
    {:ok, result} = DataRecovery.process("programming first The language;3 2 1")
    
    assert result == "The first programming language"
  end

  test "returns correct response for \"programs Manchester The written ran Mark 1952 1 in Autocode from;6 2 1 7 5 3 11 4 8 9\"" do
    {:ok, result} = DataRecovery.process("programs Manchester The written ran Mark 1952 1 in Autocode from;6 2 1 7 5 3 11 4 8 9")

    assert result == "The Manchester Mark 1 ran programs written in Autocode from 1952"
  end
end
