import unittest
import ../src/locations
suite "getBearingTo":
  test "90 graden bearing":
    var fromL = newLocation(0,0)
    var to = newLocation(0,1)
    var b = fromL.getBearingTo(to)
    check(b == 90)
  
  test "180 graden bearing":
    var fromL = newLocation(0,0)
    var to = newLocation(-1,0)
    var b = fromL.getBearingTo(to)
    check(b == 180)

  test "270 graden bearing":
    var fromL = newLocation(0,0)
    var to = newLocation(0,-1)
    var b = fromL.getBearingTo(to)
    check(b == 270)

  test "360 graden bearing":
    var fromL = newLocation(0,0)
    var to = newLocation(1,0)
    var b = fromL.getBearingTo(to)
    check(b == 360 or b == 0)

  test "stackexchange voorbeeld": 
    var fromL = newLocation(43.682213,-70.450696)
    var to = newLocation(43.682194,-70.450769)
    var b = fromL.getBearingTo(to)
    check(b == 250)
