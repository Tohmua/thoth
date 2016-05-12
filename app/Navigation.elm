module Navigation exposing (view)

import Html exposing (nav, ul, li, text)
import Html.Attributes exposing (class)

view databaseStatus currentStatus =
  nav
    [ class "top-navigation eight columns" ]
    [ ul
      [ class "u-pull-right" ]
      [ li [] [ text "Status" ]
      , li [] [ text "Run" ]
      , li [] [ text "Help" ]
      ]
    ]
