defmodule CharacterTest do
  use ExUnit.Case
  doctest Character

  import Algae.Maybe
  import Alignment

  test "character has name" do
    expected = "Nate"
    %{just: name} = %Character{name: just(expected)}.name
    assert name == expected
  end

  test "character has a Maybe monad for a name" do
    assert nothing() == %Character{}.name
  end

  test "character alignment validation" do
    assert Character.valid?(%Character{alignment: good})
    assert Character.valid?(%Character{alignment: evil})
    assert Character.valid?(%Character{alignment: neutral})
    refute Character.valid?(%Character{alignment: "Pants!"})
  end

  test "default ac is 10" do
    assert %Character{}.ac == 10
  end

  test "default hp is 5" do
    assert %Character{}.hp == 5
  end
end