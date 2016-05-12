import Html exposing (Html, div, header)
import Html.Attributes exposing (class)
import Html.App as Html

import Navigation exposing (view)

-- Fancy types, hwre.

type Dialog
  = DatabaseSchema
  | DerivedFields
  | UpdateSystem

type Status = Red | Amber | Green

-- Application state.

type alias Model =
  { databaseStatus      : Status
  , currentExportStatus : Status
  , systemUpdateStatus  : Status
  }

init : Model
init =
  { databaseStatus      = Red
  , currentExportStatus = Red
  , systemUpdateStatus  = Red
  }

-- Application actions.

type Action
  = BuggerAll

-- Application updater.

update : Action -> Model -> Model
update action model = model

-- Application view.

view : Model -> Html msg
view model =
  div
    [ class "thoth-container" ]
    [ header
        []
        [ Navigation.view model.databaseStatus model.currentExportStatus
        ]
    ]

main =
  Html.beginnerProgram
      { model  = init
      , view   = view
      , update = update
      }
