defmodule Calime.Tree.EExNode do
  @moduledoc """
  Represntation of a EEx node.
  """

  defstruct attributes: [],
            children: [],
            content: ""
end
