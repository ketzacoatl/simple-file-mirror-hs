#!/usr/bin/env stack
-- stack --resolver lts-12.20 --install-ghc runghc --package classy-prelude-conduit

{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
import ClassyPrelude.Conduit

names :: [Text]
names = ["you", "me", "them", "us"]

main :: IO ()
main = runConduit $ yieldMany names .| mapM_C print
