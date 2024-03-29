defmodule Carb.Css do
  #  defstruct id_class: "", properties: [%{name: "", value: ""}]

  def is_property?(property) do
    case property do
      "align-content" ->
        true

      "align-items" ->
        true

      "align-self" ->
        true

      "alignment-baseline" ->
        true

      "all" ->
        true

      "animation" ->
        true

      "animation-delay" ->
        true

      "animation-direction" ->
        true

      "animation-duration" ->
        true

      "animation-fill-mode" ->
        true

      "animation-iteration-count" ->
        true

      "animation-name" ->
        true

      "animation-play-state" ->
        true

      "animation-timing-function" ->
        true

      "appearance" ->
        true

      "azimuth" ->
        true

      "background" ->
        true

      "background-attachment" ->
        true

      "background-blend-mode" ->
        true

      "background-clip" ->
        true

      "background-color" ->
        true

      "background-image" ->
        true

      "background-origin" ->
        true

      "background-position" ->
        true

      "background-repeat" ->
        true

      "background-size" ->
        true

      "baseline-shift" ->
        true

      "block-overflow" ->
        true

      "block-size" ->
        true

      "block-step" ->
        true

      "block-step-align" ->
        true

      "block-step-insert" ->
        true

      "block-step-round" ->
        true

      "block-step-size" ->
        true

      "bookmark-label" ->
        true

      "bookmark-level" ->
        true

      "bookmark-state" ->
        true

      "border" ->
        true

      "border-block" ->
        true

      "border-block-color" ->
        true

      "border-block-end" ->
        true

      "border-block-end-color" ->
        true

      "border-block-end-style" ->
        true

      "border-block-end-width" ->
        true

      "border-block-start" ->
        true

      "border-block-start-color" ->
        true

      "border-block-start-style" ->
        true

      "border-block-start-width" ->
        true

      "border-block-style" ->
        true

      "border-block-width" ->
        true

      "border-bottom" ->
        true

      "border-bottom-color" ->
        true

      "border-bottom-left-radius" ->
        true

      "border-bottom-right-radius" ->
        true

      "border-bottom-style" ->
        true

      "border-bottom-width" ->
        true

      "border-boundary" ->
        true

      "border-collapse" ->
        true

      "border-color" ->
        true

      "border-end-end-radius" ->
        true

      "border-end-start-radius" ->
        true

      "border-image" ->
        true

      "border-image-outset" ->
        true

      "border-image-repeat" ->
        true

      "border-image-slice" ->
        true

      "border-image-source" ->
        true

      "border-image-width" ->
        true

      "border-inline" ->
        true

      "border-inline-color" ->
        true

      "border-inline-end" ->
        true

      "border-inline-end-color" ->
        true

      "border-inline-end-style" ->
        true

      "border-inline-end-width" ->
        true

      "border-inline-start" ->
        true

      "border-inline-start-color" ->
        true

      "border-inline-start-style" ->
        true

      "border-inline-start-width" ->
        true

      "border-inline-style" ->
        true

      "border-inline-width" ->
        true

      "border-left" ->
        true

      "border-left-color" ->
        true

      "border-left-style" ->
        true

      "border-left-width" ->
        true

      "border-radius" ->
        true

      "border-right" ->
        true

      "border-right-color" ->
        true

      "border-right-style" ->
        true

      "border-right-width" ->
        true

      "border-spacing" ->
        true

      "border-start-end-radius" ->
        true

      "border-start-start-radius" ->
        true

      "border-style" ->
        true

      "border-top" ->
        true

      "border-top-color" ->
        true

      "border-top-left-radius" ->
        true

      "border-top-right-radius" ->
        true

      "border-top-style" ->
        true

      "border-top-width" ->
        true

      "border-width" ->
        true

      "bottom" ->
        true

      "box-decoration-break" ->
        true

      "box-shadow" ->
        true

      "box-sizing" ->
        true

      "box-snap" ->
        true

      "break-after" ->
        true

      "break-before" ->
        true

      "break-inside" ->
        true

      "caption-side" ->
        true

      "caret" ->
        true

      "caret-color" ->
        true

      "caret-shape" ->
        true

      "chains" ->
        true

      "clear" ->
        true

      "clip" ->
        true

      "clip-path" ->
        true

      "clip-rule" ->
        true

      "color" ->
        true

      "color-adjust" ->
        true

      "color-interpolation-filters" ->
        true

      "column-count" ->
        true

      "column-fill" ->
        true

      "column-gap" ->
        true

      "column-rule" ->
        true

      "column-rule-color" ->
        true

      "column-rule-style" ->
        true

      "column-rule-width" ->
        true

      "column-span" ->
        true

      "column-width" ->
        true

      "columns" ->
        true

      "contain" ->
        true

      "content" ->
        true

      "continue" ->
        true

      "counter-increment" ->
        true

      "counter-reset" ->
        true

      "counter-set" ->
        true

      "cue" ->
        true

      "cue-after" ->
        true

      "cue-before" ->
        true

      "cursor" ->
        true

      "direction" ->
        true

      "display" ->
        true

      "dominant-baseline" ->
        true

      "elevation" ->
        true

      "empty-cells" ->
        true

      "fill" ->
        true

      "fill-break" ->
        true

      "fill-color" ->
        true

      "fill-image" ->
        true

      "fill-opacity" ->
        true

      "fill-origin" ->
        true

      "fill-position" ->
        true

      "fill-repeat" ->
        true

      "fill-rule" ->
        true

      "fill-size" ->
        true

      "filter" ->
        true

      "flex" ->
        true

      "flex-basis" ->
        true

      "flex-direction" ->
        true

      "flex-flow" ->
        true

      "flex-grow" ->
        true

      "flex-shrink" ->
        true

      "flex-wrap" ->
        true

      "float" ->
        true

      "float-defer" ->
        true

      "float-offset" ->
        true

      "float-reference" ->
        true

      "flood-color" ->
        true

      "flood-opacity" ->
        true

      "flow" ->
        true

      "flow-from" ->
        true

      "flow-into" ->
        true

      "font" ->
        true

      "font-family" ->
        true

      "font-feature-settings" ->
        true

      "font-kerning" ->
        true

      "font-language-override" ->
        true

      "font-max-size" ->
        true

      "font-min-size" ->
        true

      "font-optical-sizing" ->
        true

      "font-palette" ->
        true

      "font-size" ->
        true

      "font-size-adjust" ->
        true

      "font-stretch" ->
        true

      "font-style" ->
        true

      "font-synthesis" ->
        true

      "font-synthesis-small-caps" ->
        true

      "font-synthesis-style" ->
        true

      "font-synthesis-weight" ->
        true

      "font-variant" ->
        true

      "font-variant-alternates" ->
        true

      "font-variant-caps" ->
        true

      "font-variant-east-asian" ->
        true

      "font-variant-emoji" ->
        true

      "font-variant-ligatures" ->
        true

      "font-variant-numeric" ->
        true

      "font-variant-position" ->
        true

      "font-variation-settings" ->
        true

      "font-weight" ->
        true

      "footnote-display" ->
        true

      "footnote-policy" ->
        true

      "gap" ->
        true

      "glyph-orientation-vertical" ->
        true

      "grid" ->
        true

      "grid-area" ->
        true

      "grid-auto-columns" ->
        true

      "grid-auto-flow" ->
        true

      "grid-auto-rows" ->
        true

      "grid-column" ->
        true

      "grid-column-end" ->
        true

      "grid-column-start" ->
        true

      "grid-row" ->
        true

      "grid-row-end" ->
        true

      "grid-row-start" ->
        true

      "grid-template" ->
        true

      "grid-template-areas" ->
        true

      "grid-template-columns" ->
        true

      "grid-template-rows" ->
        true

      "hanging-punctuation" ->
        true

      "height" ->
        true

      "hyphenate-character" ->
        true

      "hyphenate-limit-chars" ->
        true

      "hyphenate-limit-last" ->
        true

      "hyphenate-limit-lines" ->
        true

      "hyphenate-limit-zone" ->
        true

      "hyphens" ->
        true

      "image-orientation" ->
        true

      "image-resolution" ->
        true

      "initial-letters" ->
        true

      "initial-letters-align" ->
        true

      "initial-letters-wrap" ->
        true

      "inline-size" ->
        true

      "inline-sizing" ->
        true

      "inset" ->
        true

      "inset-block" ->
        true

      "inset-block-end" ->
        true

      "inset-block-start" ->
        true

      "inset-inline" ->
        true

      "inset-inline-end" ->
        true

      "inset-inline-start" ->
        true

      "isolation" ->
        true

      "justify-content" ->
        true

      "justify-items" ->
        true

      "justify-self" ->
        true

      "left" ->
        true

      "letter-spacing" ->
        true

      "lighting-color" ->
        true

      "line-break" ->
        true

      "line-clamp" ->
        true

      "line-grid" ->
        true

      "line-height" ->
        true

      "line-height-step" ->
        true

      "line-padding" ->
        true

      "line-snap" ->
        true

      "list-style" ->
        true

      "list-style-image" ->
        true

      "list-style-position" ->
        true

      "list-style-type" ->
        true

      "margin" ->
        true

      "margin-block" ->
        true

      "margin-block-end" ->
        true

      "margin-block-start" ->
        true

      "margin-bottom" ->
        true

      "margin-break" ->
        true

      "margin-inline" ->
        true

      "margin-inline-end" ->
        true

      "margin-inline-start" ->
        true

      "margin-left" ->
        true

      "margin-right" ->
        true

      "margin-top" ->
        true

      "margin-trim" ->
        true

      "marker" ->
        true

      "marker-end" ->
        true

      "marker-knockout-left" ->
        true

      "marker-knockout-right" ->
        true

      "marker-mid" ->
        true

      "marker-pattern" ->
        true

      "marker-segment" ->
        true

      "marker-side" ->
        true

      "marker-start" ->
        true

      "mask" ->
        true

      "mask-border" ->
        true

      "mask-border-mode" ->
        true

      "mask-border-outset" ->
        true

      "mask-border-repeat" ->
        true

      "mask-border-slice" ->
        true

      "mask-border-source" ->
        true

      "mask-border-width" ->
        true

      "mask-clip" ->
        true

      "mask-composite" ->
        true

      "mask-image" ->
        true

      "mask-mode" ->
        true

      "mask-origin" ->
        true

      "mask-position" ->
        true

      "mask-repeat" ->
        true

      "mask-size" ->
        true

      "mask-type" ->
        true

      "max-block-size" ->
        true

      "max-height" ->
        true

      "max-inline-size" ->
        true

      "max-lines" ->
        true

      "max-width" ->
        true

      "min-block-size" ->
        true

      "min-height" ->
        true

      "min-inline-size" ->
        true

      "min-width" ->
        true

      "mix-blend-mode" ->
        true

      "nav-down" ->
        true

      "nav-left" ->
        true

      "nav-right" ->
        true

      "nav-up" ->
        true

      "object-fit" ->
        true

      "object-position" ->
        true

      "offset" ->
        true

      "offset-after" ->
        true

      "offset-anchor" ->
        true

      "offset-before" ->
        true

      "offset-distance" ->
        true

      "offset-end" ->
        true

      "offset-path" ->
        true

      "offset-position" ->
        true

      "offset-rotate" ->
        true

      "offset-start" ->
        true

      "opacity" ->
        true

      "order" ->
        true

      "orphans" ->
        true

      "outline" ->
        true

      "outline-color" ->
        true

      "outline-offset" ->
        true

      "outline-style" ->
        true

      "outline-width" ->
        true

      "overflow" ->
        true

      "overflow-block" ->
        true

      "overflow-inline" ->
        true

      "overflow-wrap" ->
        true

      "overflow-x" ->
        true

      "overflow-y" ->
        true

      "padding" ->
        true

      "padding-block" ->
        true

      "padding-block-end" ->
        true

      "padding-block-start" ->
        true

      "padding-bottom" ->
        true

      "padding-inline" ->
        true

      "padding-inline-end" ->
        true

      "padding-inline-start" ->
        true

      "padding-left" ->
        true

      "padding-right" ->
        true

      "padding-top" ->
        true

      "page" ->
        true

      "page-break-after" ->
        true

      "page-break-before" ->
        true

      "page-break-inside" ->
        true

      "pause" ->
        true

      "pause-after" ->
        true

      "pause-before" ->
        true

      "pitch" ->
        true

      "pitch-range" ->
        true

      "place-content" ->
        true

      "place-items" ->
        true

      "place-self" ->
        true

      "play-during" ->
        true

      "position" ->
        true

      "presentation-level" ->
        true

      "quotes" ->
        true

      "region-fragment" ->
        true

      "resize" ->
        true

      "rest" ->
        true

      "rest-after" ->
        true

      "rest-before" ->
        true

      "richness" ->
        true

      "right" ->
        true

      "row-gap" ->
        true

      "ruby-align" ->
        true

      "ruby-merge" ->
        true

      "ruby-position" ->
        true

      "running" ->
        true

      "scroll-behavior" ->
        true

      "scroll-margin" ->
        true

      "scroll-margin-block" ->
        true

      "scroll-margin-block-end" ->
        true

      "scroll-margin-block-start" ->
        true

      "scroll-margin-bottom" ->
        true

      "scroll-margin-inline" ->
        true

      "scroll-margin-inline-end" ->
        true

      "scroll-margin-inline-start" ->
        true

      "scroll-margin-left" ->
        true

      "scroll-margin-right" ->
        true

      "scroll-margin-top" ->
        true

      "scroll-padding" ->
        true

      "scroll-padding-block" ->
        true

      "scroll-padding-block-end" ->
        true

      "scroll-padding-block-start" ->
        true

      "scroll-padding-bottom" ->
        true

      "scroll-padding-inline" ->
        true

      "scroll-padding-inline-end" ->
        true

      "scroll-padding-inline-start" ->
        true

      "scroll-padding-left" ->
        true

      "scroll-padding-right" ->
        true

      "scroll-padding-top" ->
        true

      "scroll-snap-align" ->
        true

      "scroll-snap-stop" ->
        true

      "scroll-snap-type" ->
        true

      "scrollbar-color" ->
        true

      "scrollbar-gutter" ->
        true

      "scrollbar-width" ->
        true

      "shape-image-threshold" ->
        true

      "shape-inside" ->
        true

      "shape-margin" ->
        true

      "shape-outside" ->
        true

      "speak" ->
        true

      "speak-as" ->
        true

      "speak-header" ->
        true

      "speak-numeral" ->
        true

      "speak-punctuation" ->
        true

      "speech-rate" ->
        true

      "stress" ->
        true

      "string-set" ->
        true

      "stroke" ->
        true

      "stroke-align" ->
        true

      "stroke-alignment" ->
        true

      "stroke-break" ->
        true

      "stroke-color" ->
        true

      "stroke-dash-corner" ->
        true

      "stroke-dash-justify" ->
        true

      "stroke-dashadjust" ->
        true

      "stroke-dasharray" ->
        true

      "stroke-dashcorner" ->
        true

      "stroke-dashoffset" ->
        true

      "stroke-image" ->
        true

      "stroke-linecap" ->
        true

      "stroke-linejoin" ->
        true

      "stroke-miterlimit" ->
        true

      "stroke-opacity" ->
        true

      "stroke-origin" ->
        true

      "stroke-position" ->
        true

      "stroke-repeat" ->
        true

      "stroke-size" ->
        true

      "stroke-width" ->
        true

      "tab-size" ->
        true

      "table-layout" ->
        true

      "text-align" ->
        true

      "text-align-all" ->
        true

      "text-align-last" ->
        true

      "text-combine-upright" ->
        true

      "text-decoration" ->
        true

      "text-decoration-color" ->
        true

      "text-decoration-line" ->
        true

      "text-decoration-skip" ->
        true

      "text-decoration-skip-ink" ->
        true

      "text-decoration-style" ->
        true

      "text-decoration-width" ->
        true

      "text-emphasis" ->
        true

      "text-emphasis-color" ->
        true

      "text-emphasis-position" ->
        true

      "text-emphasis-skip" ->
        true

      "text-emphasis-style" ->
        true

      "text-group-align" ->
        true

      "text-indent" ->
        true

      "text-justify" ->
        true

      "text-orientation" ->
        true

      "text-overflow" ->
        true

      "text-shadow" ->
        true

      "text-space-collapse" ->
        true

      "text-space-trim" ->
        true

      "text-spacing" ->
        true

      "text-transform" ->
        true

      "text-underline-offset" ->
        true

      "text-underline-position" ->
        true

      "text-wrap" ->
        true

      "top" ->
        true

      "transform" ->
        true

      "transform-box" ->
        true

      "transform-origin" ->
        true

      "transition" ->
        true

      "transition-delay" ->
        true

      "transition-duration" ->
        true

      "transition-property" ->
        true

      "transition-timing-function" ->
        true

      "unicode-bidi" ->
        true

      "user-select" ->
        true

      "vertical-align" ->
        true

      "visibility" ->
        true

      "voice-balance" ->
        true

      "voice-duration" ->
        true

      "voice-family" ->
        true

      "voice-pitch" ->
        true

      "voice-range" ->
        true

      "voice-rate" ->
        true

      "voice-stress" ->
        true

      "voice-volume" ->
        true

      "volume" ->
        true

      "white-space" ->
        true

      "widows" ->
        true

      "width" ->
        true

      "will-change" ->
        true

      "word-break" ->
        true

      "word-spacing" ->
        true

      "word-wrap" ->
        true

      "wrap-after" ->
        true

      "wrap-before" ->
        true

      "wrap-flow" ->
        true

      "wrap-inside" ->
        true

      "wrap-through" ->
        true

      "writing-mode" ->
        true

      "z-index" ->
        true

      _ ->
        false
    end
  end
end
