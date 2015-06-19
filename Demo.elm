module Demo where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (..)

answer = 42

otherAnswer = 1337

betterAnswer =
  bigger answer otherAnswer

bigger first second =
  if first > second then first else second

redCircle =
  filled red (circle 150)

line color length angle =
  segment (0,0) (fromPolar (length, degrees angle))
    |> traced (solid color)
