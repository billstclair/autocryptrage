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
    ( CoinID, TraderID
    , Quantity, Amount
    , Trader, Coin, Price, PriceDict, TraderPrices, TradeDict
    , BuyOrSell(..), Trade, TradeArm, ToCoinDict
    , TradeStack
    , WalletEntry, Wallet
    )

{-| Shared types for AutoCrypTrage.


# IDs

@docs CoinID, TraderID


# Amounts

@docs Quantity, Amount


# Prices

@docs Trader, Coin, Price, PriceDict, TraderPrices, TradeDict


# Trades

@docs BuyOrSell, Trade, TradeArm, TradeDict, ToCoinDict


# Arbitrage

@docs TradeStack


# Unqualified

@docs WalletEntry, Wallet

-}

import Dict exposing (Dict)


{-| String alias
-}
type alias CoinID =
    String


{-| String alias
-}
type alias TraderID =
    String


{-| One trader and all the available trades.
-}
type alias Trader =
    { id : TraderID
    , name : String
    , url : String
    , prices : List Price
    }


{-| A coin. One asset type.
-}
type alias Coin =
    { id : CoinID
    , name : String
    }


{-| Float alias
-}
type alias Quantity =
    Float


{-| Float alias
-}
type alias Amount =
    Float


{-| One entry in a wallet.
-}
type alias WalletEntry =
    { coinid : CoinID
    , amount : Amount
    }


{-| A wallet
-}
type alias Wallet =
    { trader : Trader
    , contents : Dict CoinID WalletEntry
    }


{-| The price to trade `fromCoin` for `toCoin`.
Can be multiple buyPrices, depending on quantity traded.
Only one sellPrice, though this may change to also be quantity dependent.
-}
type alias Price =
    { fromCoin : Coin
    , toCoin : Coin
    , buyPrices : List ( Quantity, Amount ) -- Sorted by increasing Quantity
    , sellPrice : Amount -- Buy price if byPrices is empty
    }


{-| Map the `toCoin` field of a `Price` to the `Price`.
All the `Price.fromCoin` values match.
-}
type alias ToCoinDict =
    Dict CoinID Price


{-| Map the `fromCoin` field of a coin to a dictionary of prices for
trading that coin to another.
-}
type alias PriceDict =
    Dict CoinID ToCoinDict


{-| One trader's prices.
-}
type alias TraderPrices =
    { trader : Trader
    , prices : PriceDict
    }


{-| Whether a trade is a buy or a sell.
-}
type BuyOrSell
    = Buy
    | Sell


{-| One arm of a trade.
-}
type alias TradeArm =
    { coin : Coin
    , buyOrSell : BuyOrSell
    , quantity : Quantity
    , amount : Amount
    }


{-| A trade, both buy and sell.
-}
type alias Trade =
    { trader : Trader
    , sell : TradeArm
    , buy : TradeArm
    }


{-| All the known trader prices.
-}
type alias TradeDict =
    Dict TraderID TraderPrices


{-| The current state of walking the arbitrages.
-}
type alias TradeStack =
    { trades : List Trade
    , initialCoin : Coin
    , wallet : Wallet
    , tradeDict : TradeDict
    }
