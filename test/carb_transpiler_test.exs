defmodule CarbTranspilerTest do
  use ExUnit.Case
  doctest Carb.Transpiler

  @validCarbs """
    peter:
      color red
      margin 10px
  """

  test "checks basic tokenisation" do
    assert Carb.Transpiler.tokenise(@validCarbs) == [
             %{class: ["peter"], properties: [["color", "red"], ["margin", "10px"]], type: :css}
           ]
  end
end
