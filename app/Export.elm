module Export exposing (Model, model)

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
