module Dirty exposing (..)

{-|

This module allows access to the outside world without the use of ports or flags.

module Main exposing (..)

import Dirty exposing (setItemLS)

* -- EXAMPLE -- *
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetLSItem ->
            let
                setLS =
                    Dirty.setItemLS "testKey" "value to set" |> Task.perform Fail SetItemSuccess
            in
                ( model, setLS )


@docs getCsrfToken, getApiBaseUrl, setItemLS, getItemLS, removeItemLS

-}

import Native.Dirty


{-|
    if available returns window.csrfToken else ""
-}
getCsrfToken : Platform.Task String String
getCsrfToken =
    Native.Dirty.getCsrfToken ""


{-|
    if available returns window.apiBaseUrl else ""
-}
getApiBaseUrl : Platform.Task String String
getApiBaseUrl =
    Native.Dirty.getApiBaseUrl ""


{-|
    returns a Task *once performed* will set local storage item
    and return key as string if item exists else ""
-}
setItemLS : String -> String -> Platform.Task String String
setItemLS k v =
    Native.Dirty.setItemLS k v


{-|
    returns a Task *once performed* will get local storage item
    and return value as string else ""
-}
getItemLS : String -> Platform.Task String String
getItemLS k =
    Native.Dirty.getItemLS k


{-|
    returns a Task *once performed* will remove local storage item
    and return ""
-}
removeItemLS : String -> Platform.Task String String
removeItemLS k =
    Native.Dirty.removeItemLS k
