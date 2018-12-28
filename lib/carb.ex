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
    variables =
      Transpiler.read(carb_file)
      |> Transpiler.find_variables()

    Transpiler.read(carb_file)
    |> Transpiler.tokenise()
    |> Transpiler.transpile_css(variables)
    |> Transpiler.save(css_file)
  end
end
