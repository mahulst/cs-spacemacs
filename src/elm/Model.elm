module Model exposing (..)

import Maybe.Extra exposing (combine)


type alias Group =
    { order : Int
    , name : String
    , keys : List Key
    }


type alias Key =
    { sequence : String
    , order : Int
    , name : String
    }


type alias Model =
    { filterValue : String
    , groups : List Group
    , filteredGroups : Maybe (List Group)
    }


filterGroups : String -> List Group -> Maybe (List Group)
filterGroups string list =
    List.map (filterGroup string) list
        |> List.filter Maybe.Extra.isJust
        |> combine


filterGroup : String -> Group -> Maybe Group
filterGroup string group =
    let
        entireGroup =
            isInGroupName string group

        matchedKeys =
            List.filter (isInKeyName string) group.keys
    in
        if entireGroup then
            Just group
        else if List.length matchedKeys > 0 then
            Just { group | keys = matchedKeys }
        else
            Nothing


isInKeyName : String -> Key -> Bool
isInKeyName string key =
    String.contains string key.name


isInGroupName : String -> Group -> Bool
isInGroupName string group =
    String.contains string group.name
