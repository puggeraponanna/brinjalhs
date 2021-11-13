{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module BrinjalHs.Generics.Infrastructure where

import BrinjalHs.Types.Common.Env
import Control.Monad.Reader

withModelRunner :: Model a -> AppHandler a
withModelRunner flow = do
  env <- ask
  liftIO $ runModel env flow

runModel :: Env -> Model a -> IO a
runModel env (Model flow) = do
  runReaderT flow env

newtype Model a = Model
  { unwrapModel :: ReaderT Env IO a
  }
  deriving newtype
    ( Functor,
      Applicative,
      Monad,
      MonadReader Env
    )