defmodule StackImplementationTest do
  use ExUnit.Case

  test "does something" do
    stack = StackImplementation.Stack.push([], 1)
      |> StackImplementation.Stack.push(3)
      |> StackImplementation.Stack.push(5)
      |> StackImplementation.Stack.push(6)  
    
    assert {6, stack} = StackImplementation.Stack.pop(stack)
    assert {5, stack} = StackImplementation.Stack.pop(stack)
    assert {3, stack} = StackImplementation.Stack.pop(stack)
    assert {1, _} = StackImplementation.Stack.pop(stack)
  end
end
