{-# LANGUAGE OverloadedStrings #-}

module BrinjalHs.Server.Endpoints.Up where

import BrinjalHs.Generics.Infrastructure (withModelRunner)
import qualified BrinjalHs.Product.HealthCheck.Up as Up
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