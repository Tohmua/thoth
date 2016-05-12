module Export exposing (Model, model, view)

import Html exposing (Html, div, text)

import Stage exposing (Model)

type alias UUID = String

type alias Model =
  { id : UUID
  , dateTime : String
  , current : UUID
  , stages : List Stage.Model
  }

model : Model
model =
  { id = ""
  , dateTime = ""
  , current = ""
  , stages = []
  }


view : Model -> Html msg
view model =
  div [] [ text "literally all the bits" ]
