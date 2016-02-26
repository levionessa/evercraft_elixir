defmodule Character do
  import Algae.Maybe

  @type t :: %__MODULE__{
    name: Just.t | Nothing.t
  }

  defstruct name: maybe()
end
