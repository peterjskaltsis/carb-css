defmodule Carb.Transpiler do
  require Carb.Log, as: Log

  def tokenise(string) do
    Log.print(:yellow, :bright, "Digesting carbs...")
    tokens = String.split(string, "\n\n")

    chunk =
      for token <- tokens do
        String.trim(token, " ")
        |> String.split(["\n", ":"])
      end

    piece_count = -1

    for piece <- chunk do
      piece_count = piece_count + 1

      new_chunk =
        for new_piece <- piece do
          String.split(new_piece, " ", trim: true)
        end

      [head | tail] = new_chunk

      new_tail = Enum.reject(tail, fn x -> x == [] end)

      cond do
        Enum.member?(head, "--") ->
          %{type: :comment, class: head, properties: new_tail}

        Enum.member?(head, "@responsive") ->
          [_head | media_queries] = head
          head = ["@media"] ++ media_queries

          carbs =
            Enum.chunk_by(new_tail, &(Kernel.length(&1) == 1 && Enum.member?(&1, "--") != true))
            |> Enum.chunk_every(2)

          child_carbs =
            for carb <- carbs do
              [[class] | [properties]] = carb

              if Enum.member?(properties, ["--"]) do
                properties = List.delete_at(properties, piece_count + 2)
                properties = List.delete_at(properties, piece_count + 2)

                %{type: :css, class: class, properties: properties}
              else
                %{type: :css, class: class, properties: properties}
              end
            end

          %{type: :media, class: head, children: child_carbs}

        true ->
          if Enum.member?(new_tail, ["--"]) == true do
            new_tail = List.delete_at(new_tail, piece_count + 1)
            new_tail = List.delete_at(new_tail, piece_count + 1)

            %{type: :css, class: head, properties: new_tail}
          else
            %{type: :css, class: head, properties: new_tail}
          end
      end
    end

    # IO.inspect(tokens, limit: :infinity)
  end

  def transpile_css(carbs) do
    Log.print(:bright, :blue, "Transpiling to CSS...")

    for carb <- carbs do
      # CLASSES

      case carb.type do
        :comment ->
          comment = List.flatten(carb.properties)
          "/* " <> Enum.join(comment, " ") <> " */\n\n"

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

        :css ->
          classes = show_css_classes(carb.class)
          properties = show_css_property(carb.properties)

          # BLEND
          classes <> properties
      end
    end
    |> List.to_string()

    #  |> IO.inspect()
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
    case File.read(filename) do
      {:ok, content} ->
        # IO.inspect(content)
        content

      {:error, reason} ->
        reason
    end
  end
end
