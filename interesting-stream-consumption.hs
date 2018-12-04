#!/usr/bin/env stack
-- stack --resolver lts-12.20 --install-ghc runghc --package classy-prelude-conduit

{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
import ClassyPrelude.Conduit

main :: IO ()
main = do
  sum <- runConduit $ yieldMany [1..10] .| sumC
  print sum

  total <- runConduit $ yieldMany [1..10] .| mapC (* 10) .| sumC
  print total

  -- or more explicitly...
  explicitTotal <- runConduit $ yieldMany [1..10] .| mapC (* 10) .| foldlC (+) 0
  print explicitTotal
