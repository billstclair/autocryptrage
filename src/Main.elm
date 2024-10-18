--------------------------------------------------------------------
--
-- Main.elm
-- AutoCrypTrage top-level
-- Copyright (c) 2024 Bill St. Clair <billstclair@gmail.com>
-- Some rights reserved.
-- Distributed under the MIT License
-- See LICENSE
--
----------------------------------------------------------------------


module Main exposing (main)

import AutoCrypTrage.Arbitrage as Arbitrage
import AutoCrypTrage.Types exposing (Coin, Price, Trader)
import Browser exposing (Document, UrlRequest(..))
import Browser.Navigation as Navigation exposing (Key)
import Char
import Cmd.Extra exposing (withCmd, withCmds, withNoCmd)
import Dict exposing (Dict)
import Html exposing (Attribute, Html, h2, p, text)
import Html.Attributes as Attributes exposing (style)
import Html.Events exposing (keyCode, on)
import Json.Decode as JD exposing (Decoder, Value)
import Json.Encode as JE
import Task
import Url exposing (Url)


main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = HandleUrlRequest
        , onUrlChange = HandleUrlChange
        }


view : Model -> Document Msg
view model =
    { title = "AutoCrypTrage"
    , body =
        [ h2 []
            [ text "AutoCrypTrage" ]
        , p []
            [ text "Automaged Crypto Arbitrage trading." ]
        ]
    }


type alias Model =
    { traders : List Trader
    }


type Msg
    = Noop
    | HandleUrlRequest UrlRequest
    | HandleUrlChange Url


init : Value -> url -> Key -> ( Model, Cmd Msg )
init flags url key =
    let
        model : Model
        model =
            { traders = []
            }
    in
    model |> withNoCmd


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    model |> withNoCmd


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        []
