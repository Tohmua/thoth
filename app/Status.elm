module Status exposing (Status(..), isSuccessful)


type Status
    = Red
    | Amber
    | Green


isSuccessful : Status -> Bool
isSuccessful status =
    case status of
        Red ->
            False

        Amber ->
            True

        Green ->
            True
