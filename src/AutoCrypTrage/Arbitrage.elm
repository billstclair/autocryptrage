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


findArbitrage : List Trade -> TradeStack -> ( List Trade, TradeStack )
findArbitrage trades stack =
    -- TODO
    ( trades, stack )
