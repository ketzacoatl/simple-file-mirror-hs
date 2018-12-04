#!/usr/bin/env stack
-- stack --resolver lts-12.20 --install-ghc runghc --package classy-prelude-conduit

{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
import ClassyPrelude.Conduit

main :: IO ()
main = do
  total <- runConduit $ yieldMany [1..10] .| mapC (* 10) .| takeC 5 .| sumC
  print total
