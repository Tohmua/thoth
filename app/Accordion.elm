module Accordion exposing (view)

import Html exposing (Html, section, text, button)
import Html.Attributes exposing (class)

type alias UUID = String

type alias Model = UUID

view : List (Html msg) -> Html msg
view exportHtml =
  section
    []
    [ section
      [ class "u-pull-right" ]
      [ button [] [ text "All" ]
      , button [] [ text "Successful" ]
      , button [] [ text "Failed" ]
      ]
    , section [ class "u-cf" ] []
    , section [] (List.map (exportRow) exportHtml)
    ]

exportRow historyItem =
  section
    [ class "row" ]
    [ historyItem
    ]
