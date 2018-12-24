defmodule Carb.Cli do
  def main(args \\ []) do
    args
    |> parse_args
    |> response
  end

  defp parse_args(args) do
    {opts, in_file, _} =
      args
      |> OptionParser.parse(switches: [css: :boolean])

    {opts, List.to_string(in_file)}
  end

  defp response({opts, in_file}) do
    if opts[:css] do
      [filename | _extension] = String.split(in_file, ".")

      Carb.to_css(in_file, filename <> ".css")
    else
      IO.puts("Hi, thank you for trying out Carb 1.0!")
      IO.puts("\nThe most common commands are:")

      IO.puts("\tcarb --css")

      IO.puts(
        "\t\tCompile typed Carbs into CSS. Just type in the name of your file like this: carb -css your_carbs.carb and see the magic!"
      )

      IO.puts("\n\tcarb --carb")
      IO.puts("\t\tFuture command that will let you convert CSS to Carbs to work with.")

      IO.puts("\nBe sure to shoot me a DM on Twitter if you require any assistance! (@Ps300300)")
    end
  end
end
