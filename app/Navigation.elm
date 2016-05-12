module Navigation exposing (view)

import Html exposing (nav, ul, li, text, a)
import Html.Attributes exposing (class, href)

view databaseStatus currentStatus =
  nav
    [ class "top-navigation eight columns" ]
    [ ul
      [ class "u-pull-right" ]
      [ li [] [ a [ href "#" ] [ text "Status" ]]
      , li [] [ a [ href "#" ] [ text "Run" ]]
      , li [] [ a [ href "#" ] [ text "Help" ]]
      ]
    ]
