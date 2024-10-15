---------------------------------------------------------------------
--
-- Types.elm
-- Shared types for AutoCrypTrage
-- Copyright (c) 2024 Bill St. Clair <billstclair@gmail.com>
-- Some rights reserved.
-- Distributed under the MIT License
-- See LICENSE
--
----------------------------------------------------------------------


module AutoCrypTrage.Types exposing (Coin, Price, Trader)


type alias Trader =
    { id : String
    , name : String
    , url : String
    , prices : List Price
    }


type alias Coin =
    { id : String
    , name : String
    }


type alias Quantity =
    Float


type alias Amount =
    Float


type alias Price =
    { fromCoin : Coin
    , toCoin : Coin
    , buyPrices : List ( Quantity, Amount ) -- Sorted by increasing Quantity
    , sellPrice : Amount
    }
