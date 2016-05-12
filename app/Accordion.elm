module Accordion exposing (view)

import Html exposing (Html, div, text)

view : List (Html msg) -> Html msg
view exportHtml =
  div [] [ text "html" ]
