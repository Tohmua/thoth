module Stage exposing (Model, model)

import Status exposing (Status)


type Msg
    = CheckingConnection
    | Downloading
    | Verifying
    | Parsing
    | Creating
    | Importing
    | Finished


type alias Model =
    { dateTime : String
    , action : Msg
    , status : Status.Status
    , info : String
    }


model : Model
model =
    { dateTime = "now"
    , action = CheckingConnection
    , status = Status.Red
    , info = ""
    }
