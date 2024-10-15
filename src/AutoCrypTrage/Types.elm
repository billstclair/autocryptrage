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


module AutoCrypTrage.Types exposing
    ( Amount
    , Coin
    , CoinID
    , NextTrade
    , Price
    , PriceDict
    , Quantity
    , Trade
    , TradeArm
    , Trader
    , TraderID
    , WalletEntry
    )

import Dict exposing (Dict)


type alias CoinID =
    String


type alias TraderID =
    String


type alias Trader =
    { id : TraderID
    , name : String
    , url : String
    , prices : List Price
    }


type alias Coin =
    { id : CoinID
    , name : String
    }


type alias Quantity =
    Float


type alias Amount =
    Float


type alias WalletEntry =
    { coinid : CoinID
    , amount : Amount
    }


type alias Price =
    { fromCoin : Coin
    , toCoin : Coin
    , buyPrices : List ( Quantity, Amount ) -- Sorted by increasing Quantity
    , sellPrice : Amount
    }


type alias TraderPrices =
    { trader : Trader
    , prices : List Price
    }


type alias PriceDict =
    Dict Coin (List Price)


type alias TradeArm =
    { coin : Coin
    , quantity : Quantity
    , amount : Amount
    }


type alias Trade =
    { trader : Trader
    , sell : TradeArm
    , buy : TradeArm
    }


type alias NextTrade =
    { traderPrices : List TraderPrices
    , coins : List Coin
    }
