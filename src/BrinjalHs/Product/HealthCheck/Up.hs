module BrinjalHs.Product.HealthCheck.Up where

import BrinjalHs.Types.Communication.Up
import Servant

serverStatus :: UpResponse
serverStatus =
  UpResponse
    { status = UP
    }

model :: Monad m => m UpResponse
model = pure serverStatus