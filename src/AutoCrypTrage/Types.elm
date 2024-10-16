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
    , BuyOrSell(..)
    , Coin
    , CoinID
    , Price
    , PriceDict
    , Quantity
    , ToCoinDict
    , Trade
    , TradeArm
    , TradeDict
    , TradeStack
    , Trader
    , TraderID
    , TraderPrices
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
    , sellPrice : Amount -- Buy price if byPrices is empty
    }



-- `CoinID` is the `toCoin` of the Price.
-- All the `fromCoin`s are the same.


type alias ToCoinDict =
    Dict CoinID Price



-- `CoinID` is the `fromCoin` of the `Price`s


type alias PriceDict =
    Dict CoinID ToCoinDict


type alias TraderPrices =
    { trader : Trader
    , prices : Dict CoinID Price
    }


type BuyOrSell
    = Buy
    | Sell


type alias TradeArm =
    { coin : Coin
    , quantity : Quantity
    , amount : Amount
    , buyOrSell : BuyOrSell
    }


type alias Trade =
    { trader : Trader
    , sell : TradeArm
    , buy : TradeArm
    }


type alias TradeDict =
    Dict TraderID TraderPrices


type alias TradeStack =
    { lastTrade : Maybe Trade
    , tradeDict : TradeDict
    }
