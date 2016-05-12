module Accordion exposing (view, Msg(..))

{--where <- this fixes sublime's syntax highlighting, sorry Tom ! <- there's a space there, just for you --}

import Html exposing (Html, section, text, button, div)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Export exposing (Model)
import Status exposing (Status)


type Msg
    = All
    | Successful
    | Failed


type Action
    = None
    | UpdateFilter Msg


view : List Export.Model -> Msg -> Html Msg
view exports filter =
    section []
        [ section [ class "u-pull-right" ]
            [ button
                [ onClick All
                , if filter == All then
                    -- this is awful, I'm so sorry
                    class "button-primary"
                  else
                    class ""
                ]
                [ text "All"
                ]
            , button
                [ onClick Successful
                , if filter == Successful then
                    class "button-primary"
                  else
                    class ""
                ]
                [ text "Successful"
                ]
            , button
                [ onClick Failed
                , if filter == Failed then
                    class "button-primary"
                  else
                    class ""
                ]
                [ text "Failed"
                ]
            ]
        , div [ class "u-cf" ] []
        , section [] (List.map exportRow (List.filter (matchesFilter filter) exports))
        ]


matchesFilter : Msg -> Export.Model -> Bool
matchesFilter filter exportItem =
    case filter of
        All ->
            True

        Successful ->
            exportItem.status == "working"

        Failed ->
            exportItem.status == "broken"


exportRow : Export.Model -> Html Msg
exportRow exportItem =
    section [ class "row" ]
        [ section [ class "one column" ]
            [ text ">" ]
        , section [ class "three columns" ]
            [ text exportItem.id ]
        , section [ class "four columns" ]
            [ text exportItem.dateTime ]
        , section [ class "four columns u-success" ]
            [ text exportItem.status ]
        ]
