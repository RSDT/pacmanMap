import unittest
import ../src/locations
from ../src/jsinterface import newPlayer, setLocation, newMap
suite "getBearingTo":
  test "90 graden bearing":
    echo "1"
    var fromL = newPlayer(newMap(),"pacman")
    echo "2"
    fromL.setLocation(0,0)
    echo "3"
    var to = newLocation(0,1)
    echo "4"
    var b = fromL.getBearingTo(to)
    echo "5"
    echo $b
    echo "6"
    check(b == 90)
  
  test "180 graden bearing":
    var fromL = newPlayer(newMap(),"pacman")
    fromL.setLocation(0,0)
    var to = newLocation(-1,0)
    var b = fromL.getBearingTo(to)
    echo $b
    check(b == 180)

  test "270 graden bearing":
    var fromL = newPlayer(newMap(),"pacman")
    fromL.setLocation(0,0)
    var to = newLocation(0,-1)
    var b = fromL.getBearingTo(to)
    echo $b
    check(b == 270)

  test "360 graden bearing":
    var fromL = newPlayer(newMap(),"pacman")
    fromL.setLocation(0,0)
    var to = newLocation(1,0)
    var b = fromL.getBearingTo(to)
    echo $b
    check(b == 360 or b == 0)

  test "stackexchange voorbeeld":
    var fromL = newPlayer(newMap(),"pacman")
    fromL.setLocation(43.682213,-70.450696)
    var to = newLocation(43.682194,-70.450769)
    var b = fromL.getBearingTo(to)
    echo $b
    check(b == 250)
