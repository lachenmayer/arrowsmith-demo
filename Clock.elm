module Clock where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (..)

someNumber =
  max 42 1337

someColor =
  rgb 200 12 34

face =
  filled someColor (circle 150)

line color length angle =
  segment (0,0) (fromPolar (length, degrees angle))
    |> traced (solid color)
