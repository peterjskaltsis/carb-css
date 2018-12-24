defmodule CarbTest do
  use ExUnit.Case
  doctest Carb

  test "converts carbs to css" do
    assert Carb.to_css("css.carb", "carb.css") == :ok
  end
end
