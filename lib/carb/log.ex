defmodule Carb.Log do
  def print(color \\ :default_color, style \\ :normal, output) do
    IO.puts(IO.ANSI.format([color, style, "\n" <> output]))
  end
end
