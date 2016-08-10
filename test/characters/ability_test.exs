defmodule AbilityTest do
  use ExUnit.Case

  alias Algae.Maybe
  import Ability

  doctest Ability

  test "modifier_for returns an ability modifier" do
    assert modifier_for(1) == -5
    assert modifier_for(2) == -4
    assert modifier_for(3) == -4
    assert modifier_for(4) == -3
    assert modifier_for(6) == -2
    assert modifier_for(7) == -2
    assert modifier_for(8) == -1
    assert modifier_for(9) == -1
    assert modifier_for(10) == 0
    assert modifier_for(11) == 0
    assert modifier_for(12) == 1
    assert modifier_for(13) == 1
    assert modifier_for(14) == 2
    assert modifier_for(15) == 2
    assert modifier_for(16) == 3
    assert modifier_for(17) == 3
    assert modifier_for(18) == 4
    assert modifier_for(19) == 4
    assert modifier_for(20) == 5
  end

  test "default abilities values are 10" do
    ability_set = %Ability{}
    [_struct_name | scores] = Map.values(ability_set)
    Enum.map(scores, fn (ability) -> assert ability == 10 end)
  end
end