module Cards exposing (view)

import Html exposing (img, li, text, ul)
import Html.Attributes exposing (class, src)


type Card
    = DatabaseSchema
    | DerivedFields
    | UpdateSystem
    | None


type alias Model =
    Card


type Msg
    = Dismiss
    | ShowDatabaseSchema
    | ShowDerivedFields
    | ShowUpdateSystem


update : Msg -> Model -> Model
update msg _ =
    case msg of
        Dismiss ->
            None

        ShowDatabaseSchema ->
            DatabaseSchema

        ShowDerivedFields ->
            DerivedFields

        ShowUpdateSystem ->
            UpdateSystem


view : Html.Html msg
view =
    ul [ class "cards row" ]
        [ li [ class "four columns card" ]
            [ img [ src "http://placehold.it/280x320" ] [] ]
        , li [ class "four columns card" ]
            [ img [ src "http://placehold.it/280x320" ] [] ]
        , li [ class "four columns card" ]
            [ img [ src "http://placehold.it/280x320" ] [] ]
        ]
