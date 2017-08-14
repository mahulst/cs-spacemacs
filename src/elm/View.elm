module View exposing (..)

import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (onInput)
import Html exposing (Html, div)
import Model exposing (Model, Group, Key)
import Update exposing (Msg(Filter))
import Stylesheet exposing (Styles(..), stylesheet)


view : Model -> Html Msg
view model =
    let
        group =
            case model.filteredGroups of
                Nothing ->
                    model.groups

                Just g ->
                    g
    in
        Element.root stylesheet <|
            column None
                [ center
                , width (px 1140)
                , spacing 20
                , padding 20
                ]
                [ searchBar model, listGroups group ]


searchBar : Model -> Element Styles variation Msg
searchBar model =
    inputText SearchBar
        [ width (percent 33)
        , center
        , (paddingXY 12 6)
        , placeholder "Filter keybindings"
        , onInput Filter
        ]
        model.filterValue


listGroups : List Group -> Element Styles variation msg
listGroups list =
    let
        groups =
            List.map displayGroup list
    in
        column None
            []
            [ wrappedRow Container [ (spacingXY 32 64), padding 32 ] groups ]


displayGroup : Group -> Element Styles variation msg
displayGroup group =
    column GroupS
        [ width (percent 33) ]
        [ el GroupTitle [] (text group.name)
        , (listKeys group.keys)
        ]


listKeys : List Key -> Element Styles variation msg
listKeys keys =
    column KeysS [] (List.map displayKey keys)


displayKey : Key -> Element Styles variation msg
displayKey key =
    row KeyS
        [ justify, width (percent 100), padding 16 ]
        [ el KeyName [] (text key.name)
        , el KeySequence [ alignRight ] (text key.sequence)
        ]
