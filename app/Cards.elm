module Cards exposing (view)

import Html exposing (img, li, text, ul, p, figure, figcaption, h4, strong)
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
            [ figure []
                [ img [ src "http://placebear.com/280/320" ] []
                , figcaption []
                    [ p [] [ strong [] [ text "System Updates" ] ]
                    , p []
                        [ text "View changes to the data extract and improvements to Thoth"
                        ]
                    ]
                ]
            ]
        , li [ class "four columns card" ]
            [ figure []
                [ img [ src "http://placekitten.com/280/320" ] []
                , figcaption []
                    [ p [] [ strong [] [ text "Database Schema" ] ]
                    , p []
                        [ text "View the most up-to-date schema and get details about any changes"
                        ]
                    ]
                ]
            ]
        , li [ class "four columns card" ]
            [ figure []
                [ img [ src "http://place-hoff.com/280/320" ] []
                , figcaption []
                    [ p [] [ strong [] [ text "Derived Fields" ] ]
                    , p []
                        [ text "Find out how to calculate additional fields from the data extract"
                        ]
                    ]
                ]
            ]
        ]
