import Html exposing (Html, div, header)
import Html.App as Html

import Navigation exposing (model, view)

type Dialog
  = DatabaseSchema
  | DerivedFields
  | UpdateSystem

type Status = Red | Amber | Green

view : Model -> Html
view model =
  div
    [ class "thoth-container" ]
    [ header
        []
        [ Navigation.view
      ]
    ]

main =
  Html.beginnerProgram
      { model  = model
      , view   = view
      , update = update
      }
