module Update exposing (Msg(..), update)

import Model exposing (filterGroups, Model)


type Msg
    = Filter String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Filter string ->
            ( { model | filteredGroups = filterGroups string model.groups, filterValue = string }, Cmd.none )
