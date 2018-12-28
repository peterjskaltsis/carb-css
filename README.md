# Carb - A super-sweet way of writing your website styling.

**Carb** allows you to write CSS styling for websites with ease and less keystrokes. It's designed to be simple to understand for anyone, from designers to backend developers.

## So, what does it look like?

```r
define myColor #ffffff
define maxWidth 1000px

.glucose:
    max-width maxWidth
    padding 0 1rem
    margin 0 auto

    has_many:
        .hydroxyls:
            color myColor
        .oxygen:
            color red

.carb = .carbs:
    color myColor
    background-color #000000

.carb/before:
    color green
```

See more on the Carb [website.](https://carb.now.sh)

## How do I use it?

Once you have Carb installed, just run the command:

```
$ carb --css your_carbs.carb
```
Also include the option: `--output my_css.css` to output to a custom filename.

This will convert any `.carb` file to a `.css` stylesheet.

**That's all. Now go get you some carbs!**

## Installation

To install Carb, first navigate to the root and run:

```
$ mix escript.build
```

This will produce a `carb` executable, then move this to your `/usr/local/bin` folder.

On Mac, you can use the command:

```
$ sudo cp carb /usr/local/bin
```

Now you can run the transpiler via `./carb` locally and if moved to the bin, you can use the `carb` command globally.

## Extras

Please note, this is quite experimental and a lot of the source code is a bit messy and quite inefficient - hopefully improved if Carb proves useful.

*Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc).*

**Current Version** 0.1.0