module Navigation exposing (view)

import Html exposing (nav, ul, li, text)
import Html.Attributes exposing (class)

view dbStatus currentStatus =
  nav
    [ class "u-pull-right eight columns" ]
    [ ul
      []
      [ li [] [ text "Status" ]
      , li [] [ text "Run" ]
      , li [] [ text "Help" ]
      ]
    ]
