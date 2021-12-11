module BrinjalHs.Types.Common.Env where

import Control.Monad.Reader (ReaderT)
import Control.Monad.Trans.Except (ExceptT)
import GHC.Generics
import Servant

data Env = Env
  { port :: Int,
    appEnv :: AppEnv
  }
  deriving (Generic)

data AppEnv = DEV | PROD
  deriving (Generic)

type AppHandler = ReaderT Env (ExceptT ServerError IO)

type AppServer api = ServerT api AppHandler
