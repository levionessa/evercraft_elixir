defmodule CharacterTest do
  use ExUnit.Case

  import Algae.Maybe
  import Alignment

  doctest Character

  test "can get and set name" do
    expected = "Nate"
    %{just: name} = %Character{name: just(expected)}.name
    assert name == expected
  end

  test "character has a Maybe monad for a name" do
    assert nothing() == %Character{}.name
  end

  test "can get and set alignment" do
    alignment = %Character{alignment: good}.alignment
    assert alignment == good
  end

  test "alignments are good, evil, and neutral" do
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

  test "character is dead at 0 hp" do
    assert Character.dead?(%Character{hp: 0})
  end

  test "character is dead at < 0 hp" do
    assert Character.dead?(%Character{hp: -1})
  end
end