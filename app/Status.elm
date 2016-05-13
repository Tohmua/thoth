module Status exposing (Status(..), isSuccessful)


type Status
    = Red
    | Amber
    | Green


isSuccessful : Status -> Bool
isSuccessful status =
    status /= Red
