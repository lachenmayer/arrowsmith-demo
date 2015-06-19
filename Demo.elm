module Demo where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Signal
import Time

answer = 42

otherAnswer = 1337

betterAnswer =
  bigger answer otherAnswer

bigger first second =
  if first > second then first else second

someCircle =
  filled red (circle 50)
