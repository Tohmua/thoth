module Main exposing (..)

import Html exposing (Html, div, header, img)
import Html.Attributes exposing (class, src)
import Html.App as Html
import Accordion exposing (view, Msg)
import Cards exposing (view)
import Navigation exposing (view)
import Export exposing (Model)
import Status exposing (Status)
import Stage


{-| Fancy types, hwre -
-}
type Dialog
    = DatabaseSchema
    | DerivedFields
    | UpdateSystem


{-| Application state -
-}
type alias Model =
    { connectionStatus : Status
    , currentExportStatus : Status
    , systemUpdateStatus : Status
    , currentExport : String
    , currentFilter : Accordion.Msg
    , exports : List Export.Model
    }


init : Model
init =
    { connectionStatus = Status.Amber
    , currentExportStatus = Status.Green
    , systemUpdateStatus = Status.Red
    , currentExport = ""
    , currentFilter = Accordion.All
    , exports =
        [ { id = "orsujgoridjgoijdrog"
          , dateTime = "11/05/2016 09:00"
          , stages =
                [ { dateTime = "now"
                  , action = Stage.CheckingConnection
                  , status = Status.Red
                  , info = ""
                  }
                ]
          }
        , { id = "432869r832yhufhe9yo32"
          , dateTime = "10/05/2016 09:00"
          , stages = []
          }
        , { id = "329r7yf9723y982y30fu23"
          , dateTime = "09/05/2016 09:00"
          , stages = []
          }
        , { id = "2983fy982y3f98239f2"
          , dateTime = "08/05/2016 09:00"
          , stages = []
          }
        , { id = "230fy9283yf0230fu20u12089"
          , dateTime = "07/05/2016 09:00"
          , stages = []
          }
        , { id = "0912u0uf30u032uf0u2309f"
          , dateTime = "06/05/2016 09:00"
          , stages = []
          }
        ]
    }


{-| Application messages -
-}
type Msg
    = None
    | UpdateFilter Accordion.Msg


{-| Application updater -
-}
update : Msg -> Model -> Model
update msg model =
    case msg of
        None ->
            model

        UpdateFilter newFilter ->
            { model
                | currentFilter = newFilter
            }


{-| Application view -
-}
view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ header [ class "row" ]
            [ div [ class "four columns" ]
                [ img [ src "http://placehold.it/140x70" ] []
                ]
            , Navigation.view model.connectionStatus
                model.currentExportStatus
            ]
        , Cards.view
        , (Html.map UpdateFilter (Accordion.view model.exports model.currentFilter))
        ]


main : Program Never
main =
    Html.beginnerProgram
        { model = init
        , view = view
        , update = update
        }
