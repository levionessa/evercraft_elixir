defmodule Ability do

  @type t :: %__MODULE__{
    strength: number,
    dexterity: number,
    constitution: number,
    wisdom: number,
    intelligence: number,
    charisma: number
  }

  defstruct strength: 10,
            dexterity: 10,
            constitution: 10,
            wisdom: 10,
            intelligence: 10,
            charisma: 10

  def modifier_for(ability) do
    Float.floor((ability - 10) / 2) |> round
  end
end
