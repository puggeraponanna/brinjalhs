module Main where

import BrinjalHs.App
import qualified BrinjalHs.Types.Common.Env as Env

main :: IO ()
main = do
  let env =
        Env.Env
          { Env.port = 8081,
            Env.appEnv = Env.DEV
          }
  runBrinjalApp env
