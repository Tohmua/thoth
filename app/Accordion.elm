module Accordion exposing (view, Msg(..))

import Html exposing (Html, section, text, button, div, h2)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Export exposing (Model, isSuccessful)


type Msg
    = All
    | Successful
    | Failed


view : List Export.Model -> Msg -> Html Msg
view exports currentFilter =
    section []
        [ h2 [ class "u-pull-left" ]
            [ text "Export Log" ]
        , section [ class "u-pull-right" ]
            (filterButtons currentFilter)
        , div [ class "u-cf" ] []
        , section []
            (exports
                |> List.filter (matchesFilter currentFilter)
                |> List.map exportRow
            )
        ]


filterButtons : Msg -> List (Html Msg)
filterButtons currentFilter =
    let
        messages =
            [ All, Successful, Failed ]
    in
        List.map
            (\message ->
                button
                    [ onClick message
                    , class (buttonClass currentFilter message)
                    ]
                    [ text (toString message)
                    ]
            )
            messages


buttonClass : Msg -> Msg -> String
buttonClass currentFilter msg =
    if currentFilter == msg then
        "button-primary"
    else
        ""


matchesFilter : Msg -> Export.Model -> Bool
matchesFilter currentFilter exportItem =
    case currentFilter of
        All ->
            True

        Successful ->
            Export.isSuccessful exportItem

        Failed ->
            not (Export.isSuccessful exportItem)


exportRow : Export.Model -> Html Msg
exportRow exportItem =
    section [ class "row" ]
        [ section [ class "one column" ]
            [ text ">" ]
        , section [ class "three columns" ]
            [ text exportItem.id ]
        , section [ class "four columns" ]
            [ text exportItem.dateTime ]
        , if Export.isSuccessful exportItem then
            section [ class "four columns u-success" ] [ text "Successful" ]
          else
            section [ class "four columns u-failed" ] [ text "Failed" ]
        ]
