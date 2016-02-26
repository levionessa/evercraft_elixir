defmodule CobatTest do
  use ExUnit.Case

  require Character

  def defendant do
    %Character{}
  end

  test "a roll that meets an opponents ac hits" do
    dice_roll = defendant.ac
    assert {:hit, _} = Combat.attack(defendant, dice_roll)
  end

  test "a roll that exceeds an opponents ac hits" do
    dice_roll = defendant.ac + 1
    assert {:hit, _} = Combat.attack(defendant, dice_roll)
  end

  test "successful hits do 1 damage" do
    dice_roll = defendant.ac + 1
    {:hit, damaged_defendant} = Combat.attack(defendant, dice_roll)
    assert damaged_defendant.hp == defendant.hp - 1
  end

  test "natural 20 doubles damage" do
    damage = 1
    dice_roll = 20
    {:hit, damaged_defendant} = Combat.attack(defendant, dice_roll, damage)
    assert damaged_defendant.hp == defendant.hp - (damage * 2)
  end

  test "a character with 0 hp is killed" do
    damage = defendant.hp
    dice_roll = defendant.ac
    assert {:kill, _} = Combat.attack(defendant, dice_roll, damage)
  end

  test "a character with less than 0 hp is killed" do
    damage = defendant.hp + 100
    dice_roll = defendant.ac
    assert {:kill, _} = Combat.attack(defendant, dice_roll, damage)
  end
end