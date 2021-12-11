module BrinjalHs.Generics.Types where

import Control.Monad.Cont (MonadIO)

type MonadBase m = (MonadIO m, Monad m)
