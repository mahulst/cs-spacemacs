module View exposing (..)

import Element exposing (..)
import Element.Attributes exposing (src, placeholder, spacing, padding, width, percent)
import Element.Events exposing (onInput)
import Html exposing (Html, div)
import Style exposing (..)
import Model exposing (Model, Group, Key)
import Update exposing (Msg(..))


type Styles
    = SearchBar
    | GroupS
    | KeyS
    | KeyName
    | KeySequence
    | None
    | Container
    | KeysS


stylesheet : StyleSheet Styles variation
stylesheet =
    Style.stylesheet []


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
        Element.root stylesheet <| column None [] [ searchBar model, listGroups group ]


searchBar : Model -> Element Styles variation Msg
searchBar model =
    el SearchBar [] (inputText None [ placeholder "Filter keybindings", onInput Update.Filter ] model.filterValue)


listGroups : List Group -> Element Styles variation msg
listGroups list =
    let
        groups =
            List.map displayGroup list
    in
        column None [] [ text "Keybindings:", wrappedRow Container [ spacing 10, padding 10 ] groups ]


displayGroup : Group -> Element Styles variation msg
displayGroup group =
    column GroupS [ width (percent 30) ] [ el None [] (text group.name), (listKeys group.keys) ]


listKeys : List Key -> Element Styles variation msg
listKeys keys =
    column KeysS [] (List.map displayKey keys)


displayKey : Key -> Element Styles variation msg
displayKey key =
    row None [] [ el KeyName [] (text key.name), el KeySequence [] (text key.sequence) ]
