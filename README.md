# Carb - A super-sweet way of writing your website styling.

**Carb** allows you to write CSS styling for websites with ease and less keystrokes. It's designed to be simple to understand for anyone, from designers to backend developers.

## So what does it look like?

```r
.glucose:
    max-width 1000px
    padding 0 1rem
    margin 0 auto

--: Equivalent -> .carb, .carbs
.carb = .carbs:
    color #ffffff
    background-color #000000

--: Equivalent -> .carb:before
.carb/before:
    color green
```

## How do I use it?

Once you have Carb installed, just run the command:

```
$ carb --css your_carbs.carb
```

This will convert any `.carb` file to a `.css` stylesheet.

**That's all. Now go get you some carbs!**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `carb` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:carb, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc).