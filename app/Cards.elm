module Cards exposing (view)

import Html exposing (img, li, text, ul )
import Html.Attributes exposing (class, src)

view =
  ul
    [ class "cards row" ]
    [ li
        [ class "four columns card" ]
        [ img [ src "http://placehold.it/280x320" ] [] ]
    , li
        [ class "four columns card" ]
        [ img [ src "http://placehold.it/280x320" ] [] ]
    , li
        [ class "four columns card" ]
        [ img [ src "http://placehold.it/280x320" ] [] ]
    ]
