---------------------------------------------------------------------
--
-- Arbitrage.elm
-- Calculate Arbitrage
-- Copyright (c) 2024 Bill St. Clair <billstclair@gmail.com>
-- Some rights reserved.
-- Distributed under the MIT License
-- See LICENSE
--
----------------------------------------------------------------------


module AutoCrypTrage.Arbitrage exposing (findArbitrage)

import AutoCrypTrage.Types
    exposing
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


{-| If the first return value is not `Nothing`, it will be pushed
onto the `trades` in the `TradeStack`.

This means you can call `findArbitrage` over and over with the
returned `TradeStack`, and it will return arbitrages until the first
return value is Nothing. Then all of them will be in the
`TradeStack`'s `trades` property.

-}
findArbitrage : TradeStack -> ( Maybe Trade, TradeStack )
findArbitrage stack =
    -- TODO
    ( Nothing, stack )
