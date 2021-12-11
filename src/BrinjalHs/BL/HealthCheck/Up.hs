module BrinjalHs.BL.HealthCheck.Up where

import BrinjalHs.Generics.Logger
import BrinjalHs.Generics.Types
import BrinjalHs.Types.Communication.Up
import Servant

serverStatus :: UpResponse
serverStatus =
  UpResponse
    { status = UP
    }

model :: MonadBase m => m UpResponse
model = do
  pure serverStatus
