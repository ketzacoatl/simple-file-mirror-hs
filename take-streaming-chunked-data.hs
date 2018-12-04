#!/usr/bin/env stack
-- stack --resolver nightly-2016-09-10 --install-ghc runghc --package classy-prelude-conduit

{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
import ClassyPrelude.Conduit
import qualified System.IO as IO

main :: IO ()
main = do
  writeFile "output.txt" ("This is just some text." :: ByteString)

  -- yes, this is clunky, we'll do something much slicker in a bit
  IO.withBinaryFile "output.txt" IO.ReadMode $ \fileHandle ->
       sourceHandle fileHandle
    $$ takeCE 10
    =$ decodeUtf8C
    =$ stdoutC
