module Clock where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (..)

redCircle =
  filled red (circle 150)

line color length angle =
  segment (0,0) (fromPolar (length, degrees angle))
    |> traced (solid color)
