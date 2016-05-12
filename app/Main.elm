import Html exposing (Html, div, header, img)
import Html.Attributes exposing (class, src)
import Html.App as Html

import Navigation exposing (view)
import Export exposing (Model)
import Status exposing (Status)
import Accordion exposing (view)

-- Fancy types, hwre

type Dialog
  = DatabaseSchema
  | DerivedFields
  | UpdateSystem

-- Application state

type alias Model =
  { databaseStatus : Status
  , currentExportStatus : Status
  , systemUpdateStatus : Status
  , exports : List Export.Model
  }

init : Model
init =
  { databaseStatus = Status.Red
  , currentExportStatus = Status.Red
  , systemUpdateStatus = Status.Red
  , exports = []
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
        , Accordion.view (List.map Export.view model.exports)
        ]
    ]

main =
  Html.beginnerProgram
      { model  = init
      , view   = view
      , update = update
      }
