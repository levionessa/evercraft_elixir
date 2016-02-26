defmodule Character do
  use Vex.Struct

  import Algae.Maybe
  import Alignment

  @type t :: %__MODULE__{
    name: Just.t | Nothing.t,
    alignment: Alignment.t
  }

  validates :alignment, inclusion: [good, evil, neutral, nothing]
  defstruct name: maybe, alignment: maybe
end
