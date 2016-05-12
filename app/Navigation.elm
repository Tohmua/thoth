module Navigation exposing (view)

import Html exposing (nav, ul, li, text)

view dbStatus currentStatus =
  nav
    []
    [ ul
      []
      [ li [] [ text "Status" ]
      , li [] [ text "Run" ]
      , li [] [ text "Help!!!" ]
      ]
    ]
