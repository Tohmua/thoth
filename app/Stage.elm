module Stage exposing (Model, model)

import Status exposing (Status)

type Action
  = CheckingConnection
  | Downloading
  | Verifying
  | Parsing
  | Creating
  | Importing
  | Finished

type alias Model =
  { dateTime : String
  , action : Action
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
