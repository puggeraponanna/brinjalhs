{-# LANGUAGE DeriveAnyClass #-}

module BrinjalHs.Types.Communication.Up where

import Data.Aeson
import GHC.Generics

newtype UpResponse = UpResponse
  { status :: ServerStatus
  }
  deriving (Generic)

instance ToJSON UpResponse

data ServerStatus = UP | DOWN
  deriving (Generic, ToJSON)
