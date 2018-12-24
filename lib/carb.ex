defmodule Carb do
  alias Carb.Transpiler

  @moduledoc """
  The main Carb module that holds all the top-level main functions for carb manipulation.
  """

  @doc """
  Convert Carbs to CSS

  ## Examples

      iex> Carb.to_css("css.carb", "carb.css")
      :ok

  """
  def to_css(carb_file, css_file) do
    Transpiler.read(carb_file)
    |> Transpiler.tokenise()
    |> Transpiler.transpile_css()
    |> Transpiler.save(css_file)
  end
end
