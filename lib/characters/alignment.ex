defmodule Alignment do
  import Algae.Maybe

  @type t :: Nothing.t | Good.t
                       | Evil.t
                       | Neutral.t

  defmodule Good do
    @type t :: %Algae.Maybe.Just{just: %Good{}}
    defstruct []
  end

  defmodule Evil do
    @type t :: %Algae.Maybe.Just{just: %Evil{}}
    defstruct []
  end

  defmodule Neutral do
    @type t :: %Algae.Maybe.Just{just: %Neutral{}}
    defstruct []
  end

  def good, do: %Good{}
  def evil, do: %Evil{}
  def neutral, do: %Neutral{}
end