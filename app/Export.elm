module Export exposing (Model, model, isSuccessful)

import Stage exposing (Model)
import Status


type alias UUID =
    String


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


isSuccessful : Model -> Bool
isSuccessful model =
    List.all Status.isSuccessful (List.map .status model.stages)
