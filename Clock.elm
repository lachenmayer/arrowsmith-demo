module Clock where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (..)

someNumber =
  36099 / 27

someColor =
  rgb 200 12 34

face =
  filled someColor (circle 150)

line color length angle =
  segment (0,0) (fromPolar (length, degrees angle))
    |> traced (solid color)

hand length t =
  line white length (timeToAngle t)

timeToAngle t =
  90 - 6 * t / 1000

clock t =
  collage 400 400 [face]

now =
  every (second / 60)

nowClock =
  Signal.map clock now