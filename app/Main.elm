import Html exposing (Html, div, header, img)
import Html.Attributes exposing (class, src)
import Html.App as Html

import Accordion exposing (view)
import Cards exposing (view)
import Navigation exposing (view)
import Export exposing (Model)
import Status exposing (Status)

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
  , exports = [
    { id = "orsujgoridjgoijdrog"
    , dateTime = "11/05/2016 09:00"
    , stages = []
    },
    { id = "432869r832yhufhe9yo32"
    , dateTime = "10/05/2016 09:00"
    , stages = []
    },
    { id = "329r7yf9723y982y30fu23"
    , dateTime = "09/05/2016 09:00"
    , stages = []
    },
    { id = "2983fy982y3f98239f2"
    , dateTime = "08/05/2016 09:00"
    , stages = []
    },
    { id = "230fy9283yf0230fu20u12089"
    , dateTime = "07/05/2016 09:00"
    , stages = []
    },
    { id = "0912u0uf30u032uf0u2309f"
    , dateTime = "06/05/2016 09:00"
    , stages = []
    }
  ]
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
        ]
    , Cards.view
    , Accordion.view model.exports
    ]

main =
  Html.beginnerProgram
    { model = init
    , view = view
    , update = update
    }
