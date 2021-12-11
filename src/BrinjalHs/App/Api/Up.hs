module BrinjalHs.App.Api.Up where

import qualified BrinjalHs.BL.HealthCheck.Up as Up
import BrinjalHs.Generics.Infrastructure (withModelRunner)
import BrinjalHs.Types.Common.Env
import BrinjalHs.Types.Communication.Up (UpResponse)
import Control.Monad.Reader.Class
import Servant

type UpApi = "up" :> Get '[JSON] UpResponse

upServer :: AppServer UpApi
upServer = up

up :: AppHandler UpResponse
up = do
  Env {..} <- ask
  withModelRunner Up.model
