module BrinjalHs.Server.Server where

import qualified BrinjalHs.Server.Endpoints.Up as Up
import BrinjalHs.Types.Common.Env (AppServer, Env)
import Control.Monad.Except
import Control.Monad.Reader
import Servant

type Api = Up.UpApi

api :: Proxy Api
api = Proxy

server' :: AppServer Api
server' = Up.upServer

server :: Env -> Server Api
server env =
  hoistServer api (f env) server'
  where
    f :: Env -> ReaderT Env (ExceptT ServerError IO) a -> Handler a
    f env' r = do
      eiResult <- liftIO $ runExceptT $ runReaderT r env'
      case eiResult of
        Left err -> throwError err
        Right res -> pure res
