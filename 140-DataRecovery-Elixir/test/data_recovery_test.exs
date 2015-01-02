defmodule DataRecoveryTest do
  use ExUnit.Case

  test "returns correct response for \"2000 and was not However, implemented 1998 it until;9 8 3 4 1 5 7 2\"" do
    spawn_link(DataRecovery, :process, [self(), "2000 and was not However, implemented 1998 it until;9 8 3 4 1 5 7 2"])
    
    receive do
      {:ok, result} -> assert result == "However, it was not implemented until 1998 and 2000"
    after
      5_000 -> flunk("No result after 5 seconds!")  
    end  
  end
    
  test "returns correct response for \"programming first The language;3 2 1\"" do
    spawn_link(DataRecovery, :process, [self(), "programming first The language;3 2 1"])
    
    receive do
      {:ok, result} -> assert result == "The first programming language"
    after
      5_000 -> flunk("No result after 5 seconds!")  
    end  
  end

  test "returns correct response for \"programs Manchester The written ran Mark 1952 1 in Autocode from;6 2 1 7 5 3 11 4 8 9\"" do
    spawn_link(DataRecovery, :process, [self(), "programs Manchester The written ran Mark 1952 1 in Autocode from;6 2 1 7 5 3 11 4 8 9"])
    
    receive do
      {:ok, result} -> assert result == "The Manchester Mark 1 ran programs written in Autocode from 1952"
    after
      5_000 -> flunk("No result after 5 seconds!")  
    end  
  end
end
