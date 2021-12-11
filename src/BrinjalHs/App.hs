module BrinjalHs.App where

import BrinjalHs.App.Api
import qualified BrinjalHs.Types.Common.Env as Env
import Network.Wai.Handler.Warp
import qualified Network.Wai.Middleware.RequestLogger as RequestLogger
import Servant

port :: Int
port = 8081

brinjalApp :: Env.Env -> Application
brinjalApp = RequestLogger.logStdoutDev . serve api . server

runBrinjalApp :: Env.Env -> IO ()
runBrinjalApp env = run 8081 (brinjalApp env)
