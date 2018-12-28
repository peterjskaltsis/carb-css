defmodule Carb.Transpiler do
  require Carb.Log, as: Log

  alias Carb.Css, as: Css

  def tokenise(string) do
    Log.print(:yellow, :bright, "Digesting carbs...")
    tokens = String.split(string, ["\n\n", "\n\n\n", "\n\n\n\n", "\n\n\n\n\n"])
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
        |> Enum.reject(fn x -> x == [] end)

      [parent_classes | children] = carb
      children = Enum.reject(children, fn x -> x == [] end)

      cond do
        ###########
        # COMMENT #
        ###########
        Enum.member?(parent_classes, "--") ->
          %{type: :comment, class: parent_classes, properties: children}

        #############
        # MEDIA TAG #
        #############
        Enum.member?(parent_classes, "@media") ->
          #  IO.inspect(carb)
          [_head | media_queries] = parent_classes
          parent_classes = ["@media"] ++ media_queries

          # IO.inspect(children)

          # split media query carbs
          carbs =
            Enum.chunk_by(
              children,
              &((Kernel.length(&1) == 1 || Enum.member?(&1, "=")) &&
                  Enum.member?(&1, "--") != true)
            )
            |> Enum.chunk_every(2)

          # split further into property: value format
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

          # return media query with list of all child carbs
          %{type: :media, class: parent_classes, children: child_carbs}

        ###################
        # DEFINE VARIABLE #
        ###################
        Enum.any?(parent_classes, fn x -> String.contains?(x, "define") end) ->
          %{type: :variable, class: parent_classes, children: children}

        ###############
        # CHILD CARBS #
        ###############
        Enum.any?(children, fn prop -> Enum.member?(prop, "has_many") end) ->
          children =
            Enum.chunk_by(children, fn x -> x == ["has_many"] end)
            |> Enum.reject(fn x -> Enum.member?(x, ["has_many"]) end)

          # |> IO.inspect()

          # IO.inspect(children)

          [parent_properties | [children_properties]] = children

          # split media query carbs
          carbs =
            Enum.chunk_by(
              children_properties,
              &((Kernel.length(&1) == 1 || Enum.member?(&1, "=")) &&
                  Enum.member?(&1, "--") != true)
            )
            |> Enum.chunk_every(2)

          child_carbs =
            for carb <- carbs do
              #   IO.inspect(carb)
              [class | properties] = carb

              class = class ++ [parent_classes]
              #     IO.inspect(class)

              if Enum.member?(properties, ["--"]) do
                properties =
                  List.delete_at(properties, piece_count + 2)
                  |> List.delete_at(piece_count + 2)

                %{type: :css, class: class, properties: properties}
              else
                [properties] = properties
                %{type: :css, class: class, properties: properties}
              end
            end

          child_carbs =
            child_carbs ++ [%{type: :css, class: parent_classes, properties: parent_properties}]

          # return media query with list of all child carbs
          %{type: :css_with_children, children: child_carbs}

        # |> IO.inspect

        #################
        # STANDARD CARB #
        #################
        true ->
          # check if commented out
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

  def find_variables(string) do
    Log.print(:blink_rapid, :bright, "Looking for variables...")
    tokens = String.split(string, "\n\n")

    for token <- tokens do
      carb =
        String.trim(token, " ")
        |> String.split(["\n", ":"])

      carb =
        for line <- carb do
          String.split(line, " ", trim: true)
        end

      for definition <- carb do
        if Enum.member?(definition, "define") && Enum.count(definition) < 3 == false do
          unless Enum.any?(definition, fn name -> Css.is_property?(name) == true end) do
            [_define, var_name | var_value] = definition
            %{variable: var_name, value: var_value}
          else
            Log.print(
              :bright,
              :red,
              "Please enter a valid variable name in the format: define myColor red"
            )

            exit(:shutdown)
          end
        else
          []
        end
      end
    end
    |> List.flatten()
  end

  def transpile_css(carbs, variables) do
    Log.print(:bright, :blue, "Transpiling to CSS...")

    for carb <- carbs do
      case carb.type do
        ###########
        # COMMENT #
        ###########
        :comment ->
          comment = List.flatten(carb.properties)
          "/* " <> Enum.join(comment, " ") <> " */\n\n"

        #############
        # MEDIA TAG #
        #############
        :media ->
          [tag | property] = carb.class

          # carbs under each query
          tag <>
            cond do
              # @media print
              Enum.count(property) == 1 ->
                " " <> List.to_string(property)

              # @media screen and max-width 600px
              Enum.count(property) >= 4 && Enum.count(property) <= 5 ->
                property = Enum.chunk_by(property, &(&1 == "and"))
                [arg1, arg2, arg3] = property

                " " <>
                  if Enum.count(arg1) == 2 && Enum.member?(arg1, "not") == false &&
                       Enum.member?(arg1, "only") == false do
                    "(" <> Enum.join(arg1, ": ") <> ")"
                  else
                    Enum.join(arg1, " ")
                  end <> " " <> List.to_string(arg2) <> " (" <> Enum.join(arg3, ": ") <> ")"

              # @media screen and max-width 600px
              Enum.count(property) >= 7 ->
                property = Enum.chunk_by(property, &(&1 == "and"))
                [arg1, connector1, arg2, connector2, arg3] = property

                " " <>
                  if Enum.count(arg1) == 2 && Enum.member?(arg1, "not") == false &&
                       Enum.member?(arg1, "only") == false do
                    "(" <> Enum.join(arg1, ": ") <> ")"
                  else
                    Enum.join(arg1, " ")
                  end <>
                  " " <>
                  List.to_string(connector1) <>
                  " " <>
                  if Enum.count(arg2) == 2 && Enum.member?(arg1, "not") == false &&
                       Enum.member?(arg1, "only") == false do
                    "(" <> Enum.join(arg2, ": ") <> ")"
                  else
                    Enum.join(arg2, " ")
                  end <>
                  " " <>
                  List.to_string(connector2) <>
                  " " <>
                  if Enum.count(arg3) == 2 && Enum.member?(arg1, "not") == false &&
                       Enum.member?(arg1, "only") == false do
                    "(" <> Enum.join(arg3, ": ") <> ")"
                  else
                    Enum.join(arg3, " ")
                  end

              # @media (color) etc
              true ->
                "(" <> Enum.join(property, ": ") <> ")"
            end <>
            " {\n" <>
            for child <- carb.children, into: "" do
              # carbs under each query
              if child.type == :comment do
                comment = List.flatten(child.properties)
                "/* " <> Enum.join(comment, " ") <> " */\n"
              else
                show_css_classes(child.class) <> show_css_property(variables, child.properties)
              end
            end <> "}\n"

        ######################
        # CARB WITH CHILDREN #
        ######################
        :css_with_children ->
          for child <- carb.children, into: "" do
            # carbs under each query

            # IO.inspect(child)
            # if Enum.count(child.class, fn x -> x end) > 1 do
            #  Log.print(:bright, :yellow, "CHILD")
            #  [children_classes | _parent_classes] = child.class
            #  IO.puts("PARENT CLASSES")
            #  #     IO.inspect(parent_classes)
            #  [child_properties] = child.properties
            #  show_css_classes(children_classes) <> show_css_property(variables, child_properties)
            # else
            #    Log.print(:bright, :yellow, "PARENT")
            # child_properties = List.first(child.properties)

            show_css_classes(child.class) <> show_css_property(variables, child.properties)
          end

        ###############
        # NORMAL CARB #
        ###############
        :css ->
          show_css_classes(carb.class) <> show_css_property(variables, carb.properties)

        _ ->
          ""
      end
    end
    |> List.to_string()
  end

  defp show_css_property(variables, properties) do
    for [property | value] <- properties, into: "" do
      # if any of the defined variable names are found in the carbs, replace with definition value
      if Enum.any?(variables, fn var -> Enum.member?(value, var.variable) end) do
        [var_map] = Enum.filter(variables, fn x -> Enum.member?(value, x.variable) end)
        "\t" <> property <> ": " <> Enum.join(var_map.value, " ") <> ";\n"
      else
        "\t" <> property <> ": " <> Enum.join(value, " ") <> ";\n"
      end
    end <> "}\n"
  end

  defp show_css_classes(classes) do
    [head | _] = classes

    if is_list(head) do
      [child_classes | [parent_classes]] = classes
      parent_classes = Enum.reject(parent_classes, fn x -> x == "=" end)
      child_classes = Enum.reject(child_classes, fn x -> x == "=" end)

      classes =
        for child_class <- child_classes do
          for parent_class <- parent_classes do
            parent_class <> " " <> child_class <> ","
          end
        end
        |> List.flatten()

      last_class = List.last(classes)

      classes =
        if String.last(last_class) == "," do
          str_len = String.length(last_class) - 2
          last_class = String.slice(last_class, 0..str_len)
          Enum.drop(classes, -1) ++ [last_class]
        end

      for class <- classes, into: "" do
        (String.replace(class, "=", ",") <> " ")
        |> String.replace("/", ":")
      end <> "{\n"
    else
      # just the parent
      for class <- classes, into: "" do
        (String.replace(class, "=", ",") <> " ")
        |> String.replace("/", ":")
      end <> "{\n"
    end
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
