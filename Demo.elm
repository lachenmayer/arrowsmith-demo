module Demo where

import Graphics.Element exposing (..)
import Signal
import Time

answer = 42

otherAnswer = 1337

betterAnswer =
  max answer otherAnswer

max first second =
  if first > second then first else second
