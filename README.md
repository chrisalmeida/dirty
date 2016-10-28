# Dirty

A module for elm global configuration with smaller update functions in mind.

## Example

```elm
module Main exposing (..)

import Dirty exposing (setItemLS)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetLSItem ->
            let
                setLS =
                    Dirty.setItemLS "testKey" "value to set" |> Task.perform Fail SetItemSuccess
            in
                ( model, setLS )

```