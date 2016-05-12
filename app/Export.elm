module Export exposing (Model, model, view)

import Html exposing (Html, section, text)
import Html.Attributes exposing (class)

import Stage exposing (Model)

type alias UUID = String

type alias Model =
  { id : UUID
  , dateTime : String
  , stages : List Stage.Model
  }

model : Model
model =
  { id = ""
  , dateTime = ""
  , stages = []
  }


view : Model -> Html msg
view model =
  section
    []
    [ section
      [ class "one column" ]
      [ text ">" ]
    , section
      [ class "five columns" ]
      [ text model.dateTime ]
    , section
      [ class "six columns u-success" ]
      [ text "Success" ]
    ]
