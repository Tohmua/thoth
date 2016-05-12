module Export exposing (Model, model)

{--where --}

import Html exposing (Html, section, text)
import Html.Attributes exposing (class)
import Stage exposing (Model)


type alias UUID =
    String


type alias Model =
    { id : UUID
    , dateTime : String
    , stages : List Stage.Model
    , status :
        String
        -- TODO: remove this
    }


model : Model
model =
    { id = ""
    , dateTime = ""
    , stages = []
    , status =
        "working"
        -- TODO remove this
    }
