module Cards exposing (view)

{--where --}

import Html exposing (img, li, text, ul)
import Html.Attributes exposing (class, src)


type Card
    = DatabaseSchema
    | DerivedFields
    | UpdateSystem
    | None


type alias Model =
    Card


type Action
    = Dismiss
    | ShowDatabaseSchema
    | ShowDerivedFields
    | ShowUpdateSystem


update : Action -> Model -> Model
update action _ =
    case action of
        Dismiss ->
            None

        ShowDatabaseSchema ->
            DatabaseSchema

        ShowDerivedFields ->
            DerivedFields

        ShowUpdateSystem ->
            UpdateSystem


view =
    ul [ class "cards row" ]
        [ li [ class "four columns card" ]
            [ img [ src "http://placehold.it/280x320" ] [] ]
        , li [ class "four columns card" ]
            [ img [ src "http://placehold.it/280x320" ] [] ]
        , li [ class "four columns card" ]
            [ img [ src "http://placehold.it/280x320" ] [] ]
        ]
