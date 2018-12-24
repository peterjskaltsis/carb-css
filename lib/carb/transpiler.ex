defmodule Carb.Transpiler do
  require Carb.Log, as: Log

  def tokenise(string) do
    Log.print(:yellow, :bright, "Digesting carbs...")
    tokens = String.split(string, "\n\n")
    piece_count = -1

    for token <- tokens do
      piece_count = piece_count + 1

      carb =
        String.trim(token, " ")
        |> String.split(["\n", ":"])

      carb =
        for line <- carb do
          String.split(line, " ", trim: true)
        end

      [parent_classes | children] = carb
      children = Enum.reject(children, fn x -> x == [] end)

      cond do
        # COMMENT
        Enum.member?(parent_classes, "--") ->
          %{type: :comment, class: parent_classes, properties: children}

        # MEDIA TAG
        Enum.member?(parent_classes, "@responsive") ->
          [_head | media_queries] = parent_classes
          parent_classes = ["@media"] ++ media_queries

          carbs =
            Enum.chunk_by(
              children,
              &(Kernel.length(&1) == 1 && Enum.member?(&1, "--") != true)
            )
            |> Enum.chunk_every(2)

          child_carbs =
            for carb <- carbs do
              [[class] | [properties]] = carb

              if Enum.member?(properties, ["--"]) do
                properties =
                  List.delete_at(properties, piece_count + 2)
                  |> List.delete_at(piece_count + 2)

                %{type: :css, class: class, properties: properties}
              else
                %{type: :css, class: class, properties: properties}
              end
            end

          %{type: :media, class: parent_classes, children: child_carbs}

        # STANDARD CARB
        true ->
          if Enum.member?(children, ["--"]) == true do
            children =
              List.delete_at(children, piece_count + 1)
              |> List.delete_at(piece_count + 1)

            %{type: :css, class: parent_classes, properties: children}
          else
            %{type: :css, class: parent_classes, properties: children}
          end
      end
    end

    # IO.inspect(tokens, limit: :infinity)
  end

  def transpile_css(carbs) do
    Log.print(:bright, :blue, "Transpiling to CSS...")

    for carb <- carbs do
      case carb.type do
        # COMMENT
        :comment ->
          comment = List.flatten(carb.properties)
          "/* " <> Enum.join(comment, " ") <> " */\n\n"

        # MEDIA TAG
        :media ->
          [tag, property, value] = carb.class

          tag <>
            "(" <>
            property <>
            ": " <>
            value <>
            ") {\n" <>
            for child <- carb.children, into: "" do
              if child.type == :comment do
                comment = List.flatten(child.properties)
                "/* " <> Enum.join(comment, " ") <> " */\n"
              else
                show_css_classes(child.class) <> show_css_property(child.properties)
              end
            end <> "}\n"

        # NORMAL CARB
        :css ->
          show_css_classes(carb.class) <> show_css_property(carb.properties)
      end
    end
    |> List.to_string()
  end

  defp show_css_property(properties) do
    for [property | value] <- properties, into: "" do
      "\t" <> property <> ": " <> Enum.join(value, " ") <> ";\n"
    end <> "}\n"
  end

  defp show_css_classes(classes) do
    for class <- classes, into: "" do
      (String.replace(class, "=", ",") <> " ")
      |> String.replace("/", ":")
    end <> "{\n"
  end

  def save(css, filename) do
    case File.write(filename, css) do
      :ok ->
        Log.print(:bright, :green, "Successfully saved to #{Path.relative_to_cwd(filename)}")

      {:error, reason} ->
        Log.print(:bright, :red, "Error" <> Atom.to_string(reason))
    end
  end

  def read(filename) do
    if String.contains?(filename, ".carb") == true do
      case File.read(filename) do
        {:ok, content} ->
          content

        {:error, reason} ->
          reason
      end
    else
      Log.print(:bright, :red, "Error! Please only enter .carb files.")
      exit(:shutdown)
    end
  end
end
