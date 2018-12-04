#!/usr/bin/env stack
-- stack --resolver nightly-2016-09-10 --install-ghc runghc --package classy-prelude-conduit

{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
import ClassyPrelude.Conduit

main :: IO ()
main = yieldMany [1..10] $$ mapM_C print
