defmodule Carb.Cli do
  def main(args \\ []) do
    args
    |> parse_args
    |> response
  end

  defp parse_args(args) do
    {opts, in_file, _} =
      args
      |> OptionParser.parse(switches: [css: :boolean, output: :string])

    {opts, List.to_string(in_file)}
  end

  defp response({opts, in_file}) do
    cond do
      opts[:output] ->
        [_filename | extension] = String.split(opts[:output], ".")

        if Enum.member?(extension, "css") == false do
          IO.inspect(extension)
          IO.puts("Whoa there! Please make sure you are outputting to a .css file.")
        else
          Carb.to_css(in_file, opts[:output])
        end

      opts[:css] ->
        [filename | _extension] = String.split(in_file, ".")
        IO.inspect(filename)

        Carb.to_css(in_file, filename <> ".css")

      true ->
        IO.puts("Hi, thank you for trying out Carb 1.0!")
        IO.puts("\nThe most common commands are:")

        IO.puts("\tcarb --css")

        IO.puts(
          "\t\tCompile typed Carbs into CSS. Just type in the name of your file like this: carb --css your_carbs.carb and see the magic!"
        )

        IO.puts("\n\tcarb --carb")
        IO.puts("\t\tFuture command that will let you convert CSS to Carbs to work with.")

        IO.puts(
          "\nBe sure to shoot me a DM on Twitter if you require any assistance! (@Ps300300)"
        )
    end
  end
end
