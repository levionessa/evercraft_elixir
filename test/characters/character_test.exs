defmodule CharacterTest do
  use ExUnit.Case
  doctest Character

  import Algae.Maybe

  test "character has name" do
    expected = "Nate"
    %{just: name} = %Character{name: just(expected)}.name
    assert name == expected
  end

  test "character has a Maybe monad for a name" do
    assert nothing() == %Character{}.name
  end
end