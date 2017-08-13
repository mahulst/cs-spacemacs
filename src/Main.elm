module Main exposing (..)

import View exposing (view)
import Model exposing (Model)
import Update exposing (update, Msg)
import Html exposing (Html)


init : ( Model, Cmd Msg )
init =
    ( { groups =
            [ { order = 1, name = "Saving", keys = [ { sequence = "SPC f s", name = "Save current file", order = 1 } ] }
            , { order = 1, name = "Saving", keys = [ { sequence = "SPC f s", name = "asdf", order = 1 } ] }
            , { order = 1, name = "Saving", keys = [ { sequence = "SPC f s", name = "qwer", order = 1 } ] }
            , { order = 1, name = "Saving", keys = [ { sequence = "SPC f s", name = "zxcv", order = 1 } ] }
            , { order = 1, name = "Saving", keys = [ { sequence = "SPC f s", name = "yuio", order = 1 } ] }
            , { order = 1, name = "Saving", keys = [ { sequence = "SPC f s", name = "asdf", order = 1 } ] }
            , { order = 1, name = "Saving", keys = [ { sequence = "SPC f s", name = "Save current file", order = 1 } ] }
            , { order = 1, name = "Saving", keys = [ { sequence = "SPC f s", name = "asdf  qwer Save current file", order = 1 } ] }
            , { order = 1, name = "asdf", keys = [ { sequence = "SPC f s", name = "current file", order = 1 } ] }
            ]
      , filteredGroups = Nothing
      , filterValue = ""
      }
    , Cmd.none
    )



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
