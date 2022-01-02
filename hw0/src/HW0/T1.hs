{-# LANGUAGE TypeOperators #-}

module HW0.T1
  ( type (<->)(Iso)
  , flipIso
  , runIso
  , distrib
  , assocPair
  , assocEither)  where

data a <-> b = Iso (a -> b) (b -> a)

flipIso :: (a <-> b) -> (b <-> a)
flipIso (Iso f g) = Iso g f

runIso :: (a <-> b) -> (a -> b)
runIso (Iso f _) = f

distrib :: Either a (b, c) -> (Either a b, Either a c)
distrib (Left x)       = (Left x, Left x)
distrib (Right (y, z)) = (Right y, Right z)

assocPair :: (a, (b, c)) <-> ((a, b), c)
assocPair = Iso pairFst pairSnd
  where 
    pairFst :: (a, (b, c)) -> ((a, b), c)
    pairFst (a, (b, c)) = ((a, b), c)
    pairSnd :: ((a, b), c) -> (a, (b, c))
    pairSnd ((a, b), c) = (a, (b, c))



assocEither :: Either a (Either b c) <-> Either (Either a b) c
assocEither = Iso eitherFst eitherSnd
  where
    eitherFst :: Either a (Either b c) -> Either (Either a b) c
    eitherFst (Left a)          = Left (Left a) 
    eitherFst (Right (Left b))  = Left (Right b)
    eitherFst (Right (Right c)) = Right c
    eitherSnd :: Either (Either a b) c -> Either a (Either b c)
    eitherSnd (Left (Left a))  = Left a
    eitherSnd (Left (Right b)) = Right (Left b)
    eitherSnd (Right c)        = Right (Right c)