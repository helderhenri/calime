defmodule Calime.Renderer do
  @moduledoc """
  Transform Calime templates into HTML.
  """
  alias Calime.Compiler
  alias Calime.Parser
  alias Calime.Preprocessor
  alias Calime.Tree

  @doc """
  Compile Calime template to valid EEx HTML.

  ## Examples
      iex> Calime.Renderer.precompile(~s(input.required type="hidden"))
      "<input class=\\"required\\" type=\\"hidden\\">"
  """
  def precompile(input) do
    input
    |> Preprocessor.process
    |> Parser.parse_lines
    |> Tree.build_tree
    |> Compiler.compile
  end


  @doc """
  Takes a Calime template as a string as well as a set of bindings, and renders
  the resulting HTML.

  Note that this method of rendering is substantially slower than rendering
  precompiled templates created with Calime.function_from_file/5 and
  Calime.function_from_string/5.
  """
  def render(calime, bindings \\ []) do
    calime
    |> precompile
    |> EEx.eval_string(bindings)
  end
end
