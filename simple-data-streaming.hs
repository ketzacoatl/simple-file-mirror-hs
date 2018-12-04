#!/usr/bin/env stack
-- stack --resolver lts-12.20 --install-ghc runghc --package classy-prelude-conduit

{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
import ClassyPrelude.Conduit

main :: IO ()
main = runConduit $ yieldMany [1..10] .| mapM_C print
