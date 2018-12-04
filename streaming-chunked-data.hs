#!/usr/bin/env stack
-- stack --resolver lts-12.20 --install-ghc runghc --package classy-prelude-conduit

-- -- stack --resolver nightly-2016-09-10 --install-ghc runghc --package classy-prelude-conduit
-- -- stack --resolver lts-12.20 --install-ghc runghc --package classy-prelude-conduit

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
    .| decodeUtf8C
    .| stdoutC
