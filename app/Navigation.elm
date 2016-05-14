module Navigation exposing (view)

import Html exposing (nav, ul, li, text, a, span)
import Html.Attributes exposing (class, href)
import Status exposing (Status)


view : Status -> Status -> Html.Html msg
view connectionStatus currentExportStatus =
    nav [ class "top-navigation eight columns" ]
        [ ul [ class "u-pull-right" ]
            [ li [] [ connectionStatusView connectionStatus ]
            , li [] [ exportStatusView currentExportStatus ]
            , li [] [ a [ href "#" ] [ text "Help" ] ]
            ]
        ]


exportStatusView : Status -> Html.Html msg
exportStatusView exportStatus =
    case exportStatus of
        Status.Green ->
            a [ href "#" ] [ text "Run Export" ]

        Status.Amber ->
            text "Running..."

        Status.Red ->
            text "Export Failed"


connectionStatusView : Status -> Html.Html msg
connectionStatusView connectionStatus =
    case connectionStatus of
        Status.Green ->
            span [] [ text "Connection: ", span [ class "u-success" ] [ text "✓" ] ]

        Status.Amber ->
            span [] [ text "Connection: ", span [ class "u-warning" ] [ text "!" ] ]

        Status.Red ->
            span [] [ text "Connection: ", span [ class "u-failed" ] [ text "✖" ] ]
