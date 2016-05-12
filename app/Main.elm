import Html exposing (Html, div, header, img)
import Html.Attributes exposing (class, src)
import Html.App as Html

import Navigation exposing (view)
import Export

-- Fancy types, hwre

type Dialog
  = DatabaseSchema
  | DerivedFields
  | UpdateSystem

type Status = Red | Amber | Green

-- Application state

type alias Model =
  { databaseStatus : Status
  , currentExportStatus : Status
  , systemUpdateStatus : Status
  , exports : [Export.Model]
  }

init : Model
init =
  { databaseStatus = Red
  , currentExportStatus = Red
  , systemUpdateStatus = Red
  }

-- Application actions

type Action
  = BuggerAll

-- Application updater

update : Action -> Model -> Model
update action model = model

-- Application view

view : Model -> Html msg
view model =
  div
    [ class "container" ]
    [ header
        [ class "row" ]
        [ div [ class "four columns" ] [ img [ src "http://placehold.it/140x70" ] [] ]
        , Navigation.view
            model.databaseStatus
            model.currentExportStatus
        , Accordion.view model.exports
        ]
    ]

main =
  Html.beginnerProgram
      { model  = init
      , view   = view
      , update = update
      }
