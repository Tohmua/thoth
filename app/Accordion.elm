module Accordion exposing (view)

import Html exposing (Html, section)
import Html.Attributes exposing (class)

type alias UUID = String

type alias Model = UUID

view : List (Html msg) -> Html msg
view exportHtml =
  section [] (List.map (exportRow) exportHtml)

exportRow historyItem =
  section
    [ class "row" ]
    [ historyItem
    ]
