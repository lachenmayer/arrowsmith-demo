module ModuleName where

import Debug

import Color
import Graphics.Element as E exposing (Element)
import Graphics.Collage exposing (..)
import Signal as S exposing (Signal, Mailbox, Address, (<~))
import Mouse

nIncident = 1.33
nRefractive = 1.0

main : Signal Element
main =
  Signal.map view (Signal.filter inFirstMedium (0, 0) Mouse.position)

view : (Int, Int) -> Element
view (mouseX, mouseY) =
  let
    collageX = (toFloat mouseX) - width / 2
    collageY = (height / 2) - (toFloat mouseY)
    incidentAngle = angleWithNormal (collageX, collageY)
    outRay = if willReflect incidentAngle then
      reflectedRay incidentAngle
    else
      refractedRay incidentAngle
  in
    collage height width <|
      [ normal
      , plane
      , incidentRay (collageX, collageY)
      ] ++ [outRay]

inFirstMedium : (Int, Int) -> Bool
inFirstMedium (x, y) =
  (toFloat y) < height / 2

height = 500
width = 500

normal : Form
normal =
  traced (dashed Color.grey) (segment (0, -height / 2) (0, height / 2))

plane : Form
plane =
  traced (solid Color.grey) (segment (-width / 2, 0) (width / 2, 0))

incidentRay : (Float, Float) -> Form
incidentRay initialPoint =
  traced (solid Color.red) (segment initialPoint (0, 0))

refractedRay : Float -> Form
refractedRay incidentAngle =
  let
    length = height
    refractedSin = (nIncident / nRefractive) * sin incidentAngle
    xR = length * refractedSin
    yR = -length * (cos << asin) refractedSin
  in
    traced (solid Color.blue) (segment (0, 0) (xR, yR))

reflectedRay : Float -> Form
reflectedRay incidentAngle =
  let
    length = height
    xR = length * sin incidentAngle
    yR = length * cos incidentAngle
  in
    traced (dashed Color.red) (segment (0, 0) (xR, yR))


criticalAngle : Float
criticalAngle =
  asin (nRefractive / nIncident)

willReflect : Float -> Bool
willReflect incidentAngle =
  abs incidentAngle > criticalAngle

angleWithNormal : (Float, Float) -> Float
angleWithNormal (x, y) =
  atan2 y x - (pi / 2)