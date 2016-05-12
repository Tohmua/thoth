module Accordion exposing (view)

import Html exposing (Html, section, text, button, div)
import Html.Attributes exposing (class)

import Export exposing (Model)

type Filter
  = All
  | Successful
  | Failed

type Action
  = None
  | UpdateFilter Filter

type alias UUID = String

type alias Model =
  { current : UUID
  , filter : Filter
  }

update : Action -> Model -> Model
update action model =
  case action of
    None ->
      model

    UpdateFilter filter ->
      model

view : List Export.Model -> Html msg
view exports =
  section
    []
    [ section
      [ class "u-pull-right" ]
      [ button [] [ text "All" ]
      , button [] [ text "Successful" ]
      , button [] [ text "Failed" ]
      ]
    , div [ class "u-cf" ] []
    , section [] (List.map exportRow exports)
    ]

exportRow exportItem =
  section
    [ class "row" ]
    [ section
      [ class "one column" ]
      [ text ">" ]
    , section
      [ class "three columns" ]
      [ text exportItem.id ]
    , section
      [ class "four columns" ]
      [ text exportItem.dateTime ]
    , section
      [ class "four columns u-success" ]
      [ text "Success" ]
    ]
