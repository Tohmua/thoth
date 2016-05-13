module Accordion exposing (view, Msg(..))

import Html exposing (Html, section, text, button, div)
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
        [ section [ class "u-pull-right" ]
            [ button
                [ onClick All
                , if currentFilter == All then
                    -- this is awful, I'm so sorry
                    class "button-primary"
                  else
                    class ""
                ]
                [ text "All"
                ]
            , button
                [ onClick Successful
                , if currentFilter == Successful then
                    class "button-primary"
                  else
                    class ""
                ]
                [ text "Successful"
                ]
            , button
                [ onClick Failed
                , if currentFilter == Failed then
                    class "button-primary"
                  else
                    class ""
                ]
                [ text "Failed"
                ]
            ]
        , div [ class "u-cf" ] []
        , section [] (List.map exportRow (List.filter (matchesFilter currentFilter) exports))
        ]


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
