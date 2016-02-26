defmodule Character do
  use Vex.Struct

  import Algae.Maybe
  import Alignment

  @type t :: %__MODULE__{
    name: Just.t | Nothing.t,
    alignment: Alignment.t,
    ac: number,
    hp: number
  }

  validates :alignment, inclusion: [good, evil, neutral, nothing]
  defstruct name: maybe, alignment: maybe, ac: 10, hp: 5
end
