defmodule Combat do

  def hit?(defendant, dice_roll), do: dice_roll >= defendant.ac
  def miss?(defendant, dice_roll), do: not hit?(defendant, dice_roll)
  def crit?(dice_roll), do: dice_roll == 20
  def killshot?(defendant, damage), do: defendant.hp - damage <= 0

  def attack(defendant, dice_roll, damage\\1) do
    cond do
      crit?(dice_roll) and killshot?(defendant, damage * 2) ->
        {:kill, %{defendant | hp: 0}}
      crit?(dice_roll) ->
        {:hit, %{defendant | hp: defendant.hp - (damage * 2)}}
      hit?(defendant, dice_roll) and killshot?(defendant, damage) ->
        {:kill, %{defendant | hp: 0}}
      hit?(defendant, dice_roll) ->
        {:hit, %{defendant | hp: defendant.hp - damage}}
      miss?(defendant, dice_roll) ->
        {:miss, defendant}
    end
  end
end